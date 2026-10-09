"""Differential execution of partial-property reads on the real UW1 layouts."""
from pathlib import Path
import subprocess
from concurrent.futures import ThreadPoolExecutor
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
sys.path.insert(0, str(ROOT / 'tests/tools'))
from generate_partial_field_read_rules import cases, expressions, generate
from extract_functions import extract

HEADER = {'type_flags', 'position_word', 'chain_word', 'link_word'}

def check(selected):
    with tempfile.TemporaryDirectory() as tmp:
        return check_in_directory(selected, Path(tmp))


def check_in_directory(selected, tmp):
    path = tmp / 'reads.c'
    patch = tmp / 'reads.cocci'
    patch.write_text(generate(selected))
    functions, references, declarations, checks, coverage = [], [], [], [], []
    for member in ['->', '.']:
        for case in selected:
            word, field, _, _, _, _, _, _ = case
            base = ('((uw_object_hdr_t *)p)' if member == '->' else 'p->hdr') if word in HEADER else ('p' if member == '->' else '(*p)')
            forms, _, _ = expressions(member, case)
            for form in forms:
                for compare in ['', ' == 0', ' != 0']:
                    index = len(coverage)
                    expression = '(' + form.replace('B', base) + ')' + compare
                    functions.append(f'unsigned read_{index}(uw_mobile_object_t *p)\n{{\n    return {expression};\n}}')
                    references.append(f'unsigned reference_{index}(uw_mobile_object_t *p)\n{{\n    return {expression};\n}}')
                    declarations.append(f'unsigned reference_{index}(uw_mobile_object_t *p);')
                    coverage.append(field)
                    checks.append(f'''if (read_{index}(&obj) != reference_{index}(&obj)) {{
        fprintf(stderr, "case {index} input %u: got %u expected %u\\n", input,
                read_{index}(&obj), reference_{index}(&obj));
        return 1;
    }}''')
                    checks.append(f'hash = hash * 31 + read_{index}(&obj);')
    reference_path = tmp / 'reference.c'
    reference_path.write_text('#include "src/headers/uw.h"\n' + '\n'.join(references))
    path.write_text('''#include "src/headers/uw.h"
unsigned excluded(uw_object_hdr_t *p)
{
    return (p->type_flags & 0x1e00) + (p->position_word & 0x1fff)
        + ((char)p->type_flags_low & 0x1ff)
        + (p->type_flags_signed & 0x10000);
}
unsigned packed_copy(uw_object_hdr_t *p)
{
    return p->position_word;
}
''' + '\n'.join(declarations + functions) + '''
int main(void)
{
    uint64_t hash = 0;
    for (unsigned input = 0; input < 65536; ++input) {
        uw_mobile_object_t obj;
        memset(&obj, 0xa5, sizeof(obj));
        obj.hdr.type_flags = input;
        obj.hdr.position_word = input;
        obj.hdr.chain_word = input;
        obj.hdr.link_word = input;
        obj.tile_word = input;
''' + '\n'.join(checks) + '''
    }
    printf("%llu\\n", (unsigned long long)hash);
}
''')

    def execute():
        program = Path(tmp) / 'reads'
        result = subprocess.run(['cc', '-std=c11', '-O2', '-I', str(ROOT),
                                 str(path), str(reference_path), '-o', str(program)],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)

    def transform():
        result = subprocess.run([sys.argv[1], '--sp-file',
                                 str(patch),
                                 str(path), '--all-includes', '--include-headers-for-types',
                                 '-I', str(ROOT), '--in-place'],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr

    original = execute()
    exclusions = {name: extract(path.read_text(), name)
                  for name in ['excluded', 'packed_copy']}
    transform()
    converted = path.read_text()
    for index, field in enumerate(coverage):
        body = extract(converted, f'read_{index}')
        assert '->' + field in body or '.' + field in body, (index, field, body)
    for name, before in exclusions.items():
        assert extract(converted, name) == before, name
    assert execute() == original, ('partial-property read changed value or signedness', selected[0])
    transform()
    assert path.read_text() == converted, 'partial-property read is not idempotent'
    print(f'{selected[0][1]} mask {hex(selected[0][4])}: {len(coverage)} forms passed', flush=True)
    return len(coverage)


groups = {}
for case in cases():
    if len(sys.argv) > 2 and case[1] + ':' + hex(case[4]) != sys.argv[2]:
        continue
    groups.setdefault((case[1], case[4]), []).append(case)
with ThreadPoolExecutor(max_workers=4) as pool:
    counts = list(pool.map(check, groups.values()))
print(f'Partial properties: {sum(counts)} forms x 65,536 words passed')
