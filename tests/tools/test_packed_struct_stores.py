"""Differential execution of paired-byte store conversion against actual UW1 types."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
sys.path.insert(0, str(ROOT / 'tests/tools'))
from struct_field_catalog import WORDS
from generate_packed_store_rules import CASTS, SCALAR_FORMS, generate
from generate_named_field_write_rules import receivers
from extract_functions import extract

assert (ROOT / 'tools/coccinelle/packed-stores.cocci').read_text() == generate()
FLAGS = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv[2:] else []

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'stores.c'
    functions, checks, cases = [], [], []
    for word in WORDS:
        for spelling in receivers(word):
            header = word in ['type_flags', 'position_word', 'chain_word', 'link_word']
            nested = header and ('hdr.' in spelling or 'uw_mobile' in spelling)
            typ = ('uw_object_type_props_t' if word == 'size_weight' else
                   'uw_mobile_object_t' if not header or nested else 'uw_object_hdr_t')
            member = ('hdr.' if nested else '') + word
            pointer = '->' in spelling
            receiver = spelling.replace('P', 'ptr' if pointer else 'obj') + word
            for low, high, value in [(lo, hi, form.replace('C', '0xfdff'))
                                     for form in SCALAR_FORMS for lo, hi in CASTS]:
                index = len(cases)
                cases.append((member, receiver, value))
                functions.append(f'''unsigned store_{index}(int V)
{{
    {typ} obj;
    {typ} *ptr = &obj;
    memset(&obj, 0xa5, sizeof(obj));
    {receiver}_low = {low}{value};
    {receiver}_high = {high}({value} >> 8);
    for (unsigned j = 0; j < sizeof(obj); ++j)
        if (j < offsetof({typ}, {member}) || j >= offsetof({typ}, {member}) + 2)
            assert(((unsigned char *)&obj)[j] == 0xa5);
    return obj.{member};
}}''')
                checks.append(f'hash = hash * 31 + store_{index}(V);')
    path.write_text('''#include "src/headers/uw.h"
#include <assert.h>
#include <stddef.h>
void excluded(uw_object_hdr_t *obj, unsigned V, unsigned H)
{
    obj->position_word_low = (byte)V;
    obj->position_word_high = (byte)(H >> 8);
    obj->chain_word_low = (byte)V;
    ++V;
    obj->chain_word_high = (byte)(V >> 8);
    obj->link_word_low = (byte)(V | 1);
    obj->link_word_high = (byte)((V | 2) >> 8);
    obj->type_flags_low = (byte)(V | H);
    obj->type_flags_high = (byte)((V | H) >> 8);
}
''' + '\n'.join(functions) + '''
int main(void) {
    uint64_t hash = 0;
    for (int input = 0; input < 65536; ++input)
        for (int sign = 0; sign < 2; ++sign) {
            int V = input - sign * 65536;
''' + '\n'.join(checks) + '''
        }
    printf("%llu\\n", (unsigned long long)hash);
}
''')
    def execute():
        program = Path(tmp) / 'stores'
        result = subprocess.run(['cc', '-std=c11', '-O2', *FLAGS, '-I', str(ROOT), str(path),
                                 '-o', str(program)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)
    def transform():
        result = subprocess.run([sys.argv[1], '--sp-file', str(ROOT / 'tools/coccinelle/packed-stores.cocci'),
                                 str(path), '--all-includes', '--include-headers-for-types',
                                 '-I', str(ROOT), '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    original = execute()
    excluded = extract(path.read_text(), 'excluded')
    transform()
    result = path.read_text()
    for index, (member, receiver, value) in enumerate(cases):
        body = extract(result, f'store_{index}')
        assert f'{receiver} = (ushort){value};' in body, (index, body)
        assert f'{member}_low' not in body and f'{member}_high' not in body
    assert extract(result, 'excluded') == excluded
    assert execute() == original, 'packed copy changed bytes or signed truncation'
    transform()
    assert path.read_text() == result, 'packed store rules are not idempotent'
    print(f'UW1 packed copies: {len(cases)} forms x 65,536 words x 2 signs passed')
