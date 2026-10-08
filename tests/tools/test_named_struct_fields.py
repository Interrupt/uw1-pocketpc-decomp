"""Differentially execute original and converted reads using the actual UW1 structs."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from struct_field_catalog import WORDS, BYTES

spatch = sys.argv[1]
patch = ROOT / 'tools/coccinelle/named-field-reads.cocci'


def transform(path):
    result = subprocess.run([spatch, '--sp-file', str(patch), str(path),
                             '--no-includes', '--in-place'], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr


def receiver(word):
    if word in ['type_flags', 'position_word', 'chain_word', 'link_word']:
        return 'mobile.hdr'
    if word == 'size_weight' or word in ['owner_flags', 'description_flags']:
        return 'props'
    if word == 'pitch_flags':
        return 'projectile'
    return 'mobile'


expressions = []
setters = []
for word, fields in WORDS.items():
    obj = receiver(word)
    setters.append(f'{obj}.{word} = (ushort)input;')
    for shift, width, field in fields:
        mask = (1 << width) - 1
        sources = [(f'{obj}.{word}', shift, 16, False),
                   (f'{obj}.{word}_signed', shift, 16, True)]
        if shift + width <= 8:
            sources += [(f'{obj}.{word}_low', shift, 8, False),
                        (f'(char){obj}.{word}_low', shift, 8, True),
                        (f'(byte){obj}.{word}', shift, 8, False),
                        (f'(char){obj}.{word}', shift, 8, True)]
        if shift >= 8:
            sources += [(f'{obj}.{word}_high', shift - 8, 8, False),
                        (f'(char){obj}.{word}_high', shift - 8, 8, True)]
        for base, bit, total, signed in sources:
            expressions.append((f'({base} & {hex(mask << bit)}) >> {bit}', field))
            expressions.append((f'({base} >> {bit}) & {hex(mask)}', field))
            if bit + width == total and not signed:
                expressions.append((f'{base} >> {bit}', field))
            if bit:
                expressions.append((f'{base} & {hex(mask << bit)}', field))
                for value in range(1 << min(width, 4)):
                    expressions.append((f'({base} & {hex(mask << bit)}) == {hex(value << bit)}', field))
for byte, fields in BYTES.items():
    obj = receiver(byte)
    setters.append(f'{obj}.{byte} = (byte)input;')
    for shift, width, field in fields:
        mask = (1 << width) - 1
        expressions.append((f'({obj}.{byte} >> {shift}) & {hex(mask)}', field))
        expressions.append((f'{obj}.{byte} & {hex(mask << shift)}', field))

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'reads.c'
    functions = []
    checks = []
    # Separate functions make coverage explicit: a candidate must become a
    # named property, not merely yield the same checksum by remaining unchanged.
    for index, (expr, field) in enumerate(expressions):
        functions.append(f'int read_{index}(void)\n{{\n    return {expr};\n}}')
        checks.append(f'hash = (hash ^ (unsigned)read_{index}()) * UINT64_C(1099511628211);')
    path.write_text('''
#include "src/headers/uw.h"
uw_mobile_object_t mobile;
uw_object_type_props_t props;
uw_projectile_object_t projectile;
uw_object_hdr_t *header(void) { return &mobile.hdr; }
int pointer_read(void)
{
    return (header()->position_word >> 7) & 7;
}
int excluded_signed(void)
{
    return mobile.hdr.position_word_signed >> 13;
}
int excluded_reserved(void)
{
    return mobile.status_word & 0x1ff0;
}
int excluded_cross_field(void)
{
    return (mobile.hdr.position_word >> 6) & 7;
}
ushort packed_copy(void)
{
    return mobile.hdr.position_word;
}
''' + '\n'.join(functions) + '''
int main(void) {
    uint64_t hash = UINT64_C(14695981039346656037);
    for (unsigned input = 0; input < 65536; ++input) {
''' + '\n'.join(setters + checks) + '''
    }
    printf("%llu\\n", (unsigned long long)hash);
    return 0;
}
''')
    def execute():
        program = Path(tmp) / 'reads'
        result = subprocess.run(['cc', '-std=c11', '-O2', '-I', str(ROOT),
                                 str(path), '-o', str(program)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)
    original = execute()
    transform(path)
    result = path.read_text()
    sys.path.insert(0, str(ROOT / 'tests/tools'))
    from extract_functions import extract
    for index, (_, field) in enumerate(expressions):
        assert '.' + field in extract(result, f'read_{index}'), (index, expressions[index], extract(result, f'read_{index}'))
    assert 'header()->heading' in extract(result, 'pointer_read'), result
    assert 'position_word_signed >> 13' in extract(result, 'excluded_signed'), result
    assert 'status_word & 0x1ff0' in extract(result, 'excluded_reserved'), result
    assert 'position_word >> 6' in extract(result, 'excluded_cross_field'), result
    assert 'return mobile.hdr.position_word;' in extract(result, 'packed_copy'), result
    assert execute() == original, 'named reads changed a value or integer promotion'
    transform(path)
    assert path.read_text() == result, 'named read rules are not idempotent'
    print(f'UW1 named fields: {len(expressions)} expressions x 65,536 inputs passed')
