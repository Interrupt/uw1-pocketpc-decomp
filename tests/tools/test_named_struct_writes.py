"""Execute packed writes before/after conversion using the actual UW1 layouts."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
sys.path.insert(0, str(ROOT / 'tests/tools'))
from struct_field_catalog import WORDS, BYTES
from extract_functions import extract

spatch = sys.argv[1]
patch = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT / 'tools/coccinelle/named-field-writes.cocci'


def object_type(word):
    if word == 'size_weight' or word in ['owner_flags', 'description_flags']:
        return 'uw_object_type_props_t', ''
    if word == 'pitch_flags':
        return 'uw_projectile_object_t', ''
    return 'uw_mobile_object_t', 'hdr.' if word in ['type_flags', 'position_word', 'chain_word', 'link_word'] else ''


cases = []
for word, fields in WORDS.items():
    typ, prefix = object_type(word)
    packed = 'obj.' + prefix + word
    for shift, width, field in fields:
        mask = (1 << width) - 1
        bits = mask << shift
        clear = 0xffff ^ bits
        insertion = f'(H & {hex(mask)}) << {shift}' if shift else f'H & {hex(mask)}'
        formula = f'{packed} & {hex(clear)} | {insertion}'
        for code in [f'{packed} = {formula};',
                     f'V = {formula};\n{packed} = (ushort)V;',
                     f'V = {formula};\n{packed}_low = (byte)V;\n{packed}_high = (byte)(V >> 8);',
                     f'V = {packed} & {hex(clear)};\n{packed} = (ushort)V;',
                     f'V = {packed} | {hex(bits)};\n{packed}_low = (byte)(char)V;\n{packed}_high = (byte)(char)(V >> 8);']:
            cases.append((typ, prefix + word, field, code, 2))
        start = 0 if shift < 8 else 8
        if shift + width <= start + 8:
            byte = packed + ('_low' if start == 0 else '_high')
            byte_bits = mask << (shift - start)
            for formula in [f'(H ^ {byte}) & {hex(byte_bits)} ^ {byte}',
                            f'({byte} ^ H) & {hex(byte_bits)} ^ {byte}']:
                cases.append((typ, prefix + word, field, f'{byte} = {formula};', 2))
for word, fields in BYTES.items():
    typ, prefix = object_type(word)
    packed = 'obj.' + word
    for shift, width, field in fields:
        mask = (1 << width) - 1
        bits = mask << shift
        insertion = f'(H & {hex(mask)}) << {shift}' if shift else f'H & {hex(mask)}'
        for formula in [f'{packed} & {hex(0xff ^ bits)} | {insertion}',
                        f'{packed} & {hex(0xff ^ bits)}', f'{packed} | {hex(bits)}',
                        f'(H ^ {packed}) & {hex(bits)} ^ {packed}']:
            cases.append((typ, word, field, f'{packed} = {formula};', 1))

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'writes.c'
    functions = []
    checks = []
    for index, (typ, member, field, code, size) in enumerate(cases):
        functions.append(f'''uint64_t write_{index}(unsigned input, unsigned H)
{{
    {typ} obj;
    unsigned V = 0x12345678;
    memset(&obj, 0xa5, sizeof(obj));
    obj.{member} = input;
    {code}
    for (unsigned j = 0; j < sizeof(obj); ++j)
        if (j < offsetof({typ}, {member}) || j >= offsetof({typ}, {member}) + {size})
            assert(((unsigned char *)&obj)[j] == 0xa5);
    return ((uint64_t)V << 16) | obj.{member};
}}''')
        checks.append(f'hash = (hash ^ write_{index}(input, values[n])) * UINT64_C(1099511628211);')
    path.write_text('''#include "src/headers/uw.h"
#include <assert.h>
#include <stddef.h>
''' + '\n'.join(functions) + '''
void excluded(uw_mobile_object_t *obj, unsigned H)
{
    obj->status_word = obj->status_word & 0xe00f | (H & 0x1ff) << 4;
    obj->hdr.position_word = obj->hdr.position_word & 0xfc7f | (H & 0xff) << 7;
}
int main(void) {
    unsigned values[] = {0, 1, 7, 255, 65535, 0xffffffff};
    uint64_t hash = UINT64_C(14695981039346656037);
    for (unsigned input = 0; input < 65536; ++input)
        for (unsigned n = 0; n < sizeof(values)/sizeof(values[0]); ++n) {
''' + '\n'.join(checks) + '''
        }
    printf("%llu\\n", (unsigned long long)hash);
}
''')
    def execute():
        program = Path(tmp) / 'writes'
        result = subprocess.run(['cc', '-std=c11', '-O2', '-I', str(ROOT), str(path),
                                 '-o', str(program)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)
    def transform():
        result = subprocess.run([spatch, '--sp-file', str(patch), str(path),
                                 '--no-includes', '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    original = execute()
    excluded = extract(path.read_text(), 'excluded')
    transform()
    converted = path.read_text()
    for index, (_, _, field, _, _) in enumerate(cases):
        assert '.' + field + ' =' in extract(converted, f'write_{index}'), (index, field)
    assert extract(converted, 'excluded') == excluded, 'reserved/wider writes must stay unchanged'
    assert execute() == original, 'changed a packed value, neighbor, or live temporary'
    transform()
    assert path.read_text() == converted, 'write rules are not idempotent'
    print(f'UW1 named writes: {len(cases)} updates x 65,536 words x 6 inputs passed')
