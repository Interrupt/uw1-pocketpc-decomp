"""Compile recovered game tables beside independent ARM memory expectations."""
import argparse
import json
from pathlib import Path
from extract_functions import extract


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, required=True)
    parser.add_argument('--audit', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    audit = json.loads(args.audit.read_text())
    chunks = ['/* Generated from game sources and ARM memory; do not edit. */',
              '#include "restored_tables_fixture.h"']
    checks = []
    for index, entry in enumerate(audit['tables']):
        source = (args.root / entry['source']).read_text()
        declaration = extract(source, '@' + entry['symbol'])
        chunks.append(declaration)
        original = bytes.fromhex(entry['bytes'])
        expected = ','.join(str(v) for v in original)
        chunks.append(f'static const byte original_{index}[] = {{{expected}}};')
        checks.append(f'    if (sizeof {entry["symbol"]} != {entry.get("storage_size", len(original))} || '
                      f'memcmp({entry["symbol"]}, original_{index}, sizeof original_{index})) return {index + 1};')
    for entry in audit['functions']:
        filename, name = entry.split(':', 1)
        chunks.append(extract((args.root / filename).read_text(), name))
    chunks += ['int uw_test_compare_original_tables(void)\n{', *checks, '    return 0;\n}']
    args.output.write_text('\n\n'.join(chunks) + '\n')


if __name__ == '__main__':
    main()
