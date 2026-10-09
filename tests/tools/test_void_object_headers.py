"""Execute audited void-pointer header conversions against actual UW1 layouts."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from apply_void_object_header_rules import patches
from struct_field_catalog import WORDS
from extract_functions import extract

HEADER = {'type_flags': 0, 'position_word': 2, 'chain_word': 4, 'link_word': 6}
FLAGS = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv[2:] else []
cases = []
for word, offset in HEADER.items():
    for shift, width, field in WORDS[word]:
        mask = (1 << width) - 1
        raw = f'*(ushort *)(object + {offset})'
        cases += [(f'({raw} >> {shift}) & {hex(mask)}', field),
                  (f'({raw} & {hex(mask << shift)}) >> {shift}', field),
                  (f'3 + ({raw} & {hex(mask << shift)}) * 5', field),
                  (f'({raw} & {hex(mask << shift)}) == 0', field)]
        start = 0 if shift < 8 else 8
        if shift + width <= start + 8:
            bit = shift - start
            for typ in ['byte', 'char']:
                byte = f'*({typ} *)(object + {offset + start//8})'
                cases += [(f'({byte} >> {bit}) & {hex(mask)}', field),
                          (f'3 + ({byte} & {hex(mask << bit)}) * 5', field),
                          (f'({byte} & {hex(mask << bit)}) != 0', field)]
            if bit + width == 8:
                cases.append((f'*(byte *)(object + {offset + start//8}) >> {bit}', field))
functions = [f'unsigned read_{i}(void *object)\n{{\n    return {expr};\n}}'
             for i, (expr, _) in enumerate(cases)]
functions.append('''unsigned signed_access(void *object, int V)
{
    char *address = &*(char *)(object + 3);
    *(char *)(object + 2) = (char)V;
    return *address + *(char *)(object + 2);
}''')
audit = dict(functions=[dict(function=f'read_{i}', roles=[dict(name='object', type='void *')])
                        for i in range(len(cases))] +
             [dict(function='signed_access', roles=[dict(name='object', type='void *')]),
              dict(function='extended_word', roles=[dict(name='object', type='void *')])])
excluded = '''unsigned unrelated_buffer(void *object)
{
    return *(byte *)(object + 2) & 0x7f;
}
unsigned extended_word(void *object)
{
    return *(ushort *)(object + 11);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'headers.c'
    reference = Path(tmp) / 'reference.c'
    original = '#include "src/headers/uw.h"\n' + '\n'.join(functions)
    ref = original
    for name in [f'read_{i}' for i in range(len(cases))] + ['signed_access']:
        ref = ref.replace(name + '(', 'reference_' + name + '(')
    reference.write_text(ref)
    declarations = '\n'.join(f'unsigned reference_read_{i}(void *);' for i in range(len(cases)))
    checks = '\n'.join(f'assert(read_{i}(&obj) == reference_read_{i}(&obj));' for i in range(len(cases)))
    harness = '''#include <assert.h>
unsigned reference_signed_access(void *, int);
''' + declarations + '''
int main(void) {
    for (unsigned input = 0; input < 65536; ++input) {
        uw_object_hdr_t obj = {.type_flags=input, .position_word=input^0x5a5a,
                               .chain_word=input^0xa5a5, .link_word=input^0xf0f0};
''' + checks + '''
        for (int sign = 0; sign < 2; ++sign) {
            uw_object_hdr_t copy = obj;
            int V = (int)input - sign * 65536;
            assert(signed_access(&obj, V) == reference_signed_access(&copy, V));
            assert(memcmp(&obj, &copy, sizeof(obj)) == 0);
        }
    }
    puts("Audited void-object headers: all read forms, signed access and 65,536 words passed");
}
'''
    path.write_text(original + '\n' + excluded + harness)
    def transform():
        for i, patch in enumerate(patches(audit)):
            patch_path = Path(tmp) / f'phase{i}.cocci'
            patch_path.write_text(patch)
            result = subprocess.run([sys.argv[1], '--sp-file', str(patch_path), str(path),
                                     '--all-includes', '--include-headers-for-types',
                                     '-I', str(ROOT), '-I', str(ROOT / 'src'), '--in-place'],
                                    capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr
    transform()
    converted = path.read_text()
    for i, (_, field) in enumerate(cases):
        body = extract(converted, f'read_{i}')
        assert '->' + field in body, (i, cases[i], body)
    body = extract(converted, 'signed_access')
    assert '(char *)&' in body and 'position_word_low = (byte)(char)V' in body
    for name in ['unrelated_buffer', 'extended_word']:
        assert extract(converted, name) == extract(excluded, name)
    program = Path(tmp) / 'headers'
    result = subprocess.run(['cc', '-std=c11', '-O2', *FLAGS, '-I', str(ROOT), str(path),
                             str(reference), '-o', str(program)], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(program)], text=True).strip())
    transform()
    assert path.read_text() == converted, 'void header pipeline is not idempotent'
    print(f'{len(cases)} read forms converted; unrelated buffers and extended words excluded')
