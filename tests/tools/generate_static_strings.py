"""Compile actual game string declarations alongside independent ARM expectations."""
import argparse
import json
from pathlib import Path
import re


def c_bytes(text):
    return '"' + ''.join(f'\\{byte:03o}' for byte in text.encode('latin1')) + '"'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, required=True)
    parser.add_argument('--audit', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    entries = json.loads(args.audit.read_text())['strings']
    # A newly restored original string must not silently escape the audit.
    declarations = re.compile(
        r'^\s*(?:static\s+)?(?:const\s+)?(?:char|undefined1|undefined|byte)\s+'
        r'(\w+)\s*(?:\[[^\]\n]*\])?\s*=\s*(?:"(?:\\.|[^"\\])*"\s*)+;', re.MULTILINE)
    discovered = set()
    for filename in (args.root / 'src').glob('*.c'):
        for match in declarations.finditer(filename.read_text()):
            if re.search(r'(?:_|DAT_)[0-9a-fA-F]{8}(?:_backing|_str)?$', match[1]):
                discovered.add((filename.relative_to(args.root).as_posix(), match[1]))
    audited = {(entry['source'], entry['symbol']) for entry in entries}
    if discovered != audited:
        raise ValueError(f'Static string audit coverage changed: missing={sorted(discovered - audited)}, '
                         f'removed={sorted(audited - discovered)}')
    chunks = ['/* Generated from game declarations; do not edit. */',
              '#include "static_strings_fixture.h"']
    cases = []
    for index, entry in enumerate(entries):
        source = (args.root / entry['source']).read_text()
        symbol = entry['symbol']
        pattern = (r'^\s*(?:static\s+)?(?:const\s+)?(?:char|undefined1|undefined|byte)\s+'
                   + re.escape(symbol) + r'\s*(?:\[[^\]\n]*\])?\s*=\s*'
                   + r'(?:"(?:\\.|[^"\\])*"\s*)+;')
        match = re.search(pattern, source, re.MULTILINE)
        if match is None:
            raise ValueError(f'Missing game string declaration: {entry["source"]}:{symbol}')
        name = f'uw_string_{index}'
        declaration = re.sub(r'\b' + re.escape(symbol) + r'\b', name, match[0].strip(), count=1)
        if not declaration.startswith('static '):
            declaration = 'static ' + declaration
        line = source[:match.start()].count('\n') + 1
        chunks += [f'#line {line} "{entry["source"]}"', declaration]
        expected = entry.get('port_value', entry['original'])
        cases.append(f'{{0x{entry["address"]}, {json.dumps(entry["source"] + ":" + symbol)}, '
                     f'(const char *){name}, {c_bytes(expected)}}}')
    chunks += ['#line 1 "static_strings_generated.c"',
               'const struct uw_test_static_string uw_test_static_strings[] = {',
               ',\n'.join(cases), '};',
               'const size_t uw_test_static_string_count = sizeof uw_test_static_strings / sizeof uw_test_static_strings[0];']
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text('\n'.join(chunks) + '\n')


if __name__ == '__main__':
    main()
