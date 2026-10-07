#!/usr/bin/env python3
"""Audit native pointer narrowing, including calls hidden by non-prototype headers.

Configure with -DCMAKE_EXPORT_COMPILE_COMMANDS=ON, then run this script.
Requires Clang. Findings are review candidates, not permission to change integer
IDs into pointers. Indirect calls and integers that already lost a pointer need
separate review. No source files are changed.
"""
import argparse
import bisect
import collections
import concurrent.futures
import json
from pathlib import Path
import re
import shlex
import subprocess


def walk(node):
    yield node
    for child in node.get('inner', []):
        yield from walk(child)


def typename(node):
    typ = node.get('type', {})
    return typ.get('desugaredQualType', typ.get('qualType', ''))


def narrow(typ):
    typ = re.sub(r'\b(const|volatile|signed|unsigned)\b', '', typ).strip()
    return typ in {'int', 'short', 'short int', 'char', '_Bool'}


def pointer(typ):
    return '*' in typ


def audit_translation_unit(entry):
    args = shlex.split(entry['command'])
    clean = []
    skip = False
    for arg in args:
        if skip:
            skip = False
        elif arg == '-o':
            skip = True
        elif arg != '-c':
            clean.append(arg)
    clean += ['-fsyntax-only', '-Xclang', '-ast-dump=json',
              '-Wstrict-prototypes', '-Wdeprecated-non-prototype']
    result = subprocess.run(clean, cwd=entry['directory'], capture_output=True, text=True)
    if result.returncode:
        raise RuntimeError(f"{entry['file']}: compiler failed\n{result.stderr}")
    tree = json.loads(result.stdout)
    source = Path(entry['file'])
    text = source.read_text()
    newlines = [m.start() for m in re.finditer('\n', text)]

    def location(node):
        loc = node.get('range', {}).get('begin', node.get('loc', {}))
        loc = loc.get('expansionLoc', loc)
        offset = loc.get('offset', 0)
        return f'{source}:{bisect.bisect_left(newlines, offset) + 1}'

    functions, calls, casts, addressed = {}, [], [], []
    for fn in tree.get('inner', []):
        if fn.get('kind') != 'FunctionDecl' or fn.get('loc', {}).get('includedFrom'):
            continue
        body = next((n for n in fn.get('inner', []) if n.get('kind') == 'CompoundStmt'), None)
        if body is None:
            continue
        params = [n for n in fn.get('inner', []) if n.get('kind') == 'ParmVarDecl']
        functions[fn['name']] = {'parameters': [(p.get('name', ''), typename(p)) for p in params],
                                  'location': location(fn)}
        small_ids = {p['id']: p.get('name', '') for p in params if narrow(typename(p))}
        for node in walk(body):
            kind = node.get('kind')
            if kind == 'CallExpr' and node.get('inner'):
                callee = next((n.get('referencedDecl', {}) for n in walk(node['inner'][0])
                               if n.get('kind') == 'DeclRefExpr'), {})
                if callee.get('kind') != 'FunctionDecl':
                    continue
                arguments = []
                for arg in node['inner'][1:]:
                    # Recover pointer sources underneath explicit or implicit casts.
                    candidates = []
                    value = arg
                    while True:
                        if pointer(typename(value)):
                            candidates.append(typename(value))
                        if value.get('kind') not in {'ImplicitCastExpr', 'CStyleCastExpr', 'ParenExpr'} or not value.get('inner'):
                            break
                        value = value['inner'][0]
                    arguments.append(candidates[0] if candidates else typename(arg))
                calls.append({'caller': fn['name'], 'callee': callee['name'],
                              'location': location(node), 'arguments': arguments})
            if node.get('castKind') == 'PointerToIntegral' and narrow(typename(node)):
                casts.append({'caller': fn['name'], 'location': location(node),
                              'type': typename(node)})
            if node.get('castKind') == 'IntegralToPointer':
                for ref in walk(node):
                    decl = ref.get('referencedDecl', {})
                    if decl.get('id') in small_ids:
                        addressed.append({'function': fn['name'], 'location': location(node),
                                          'parameter': small_ids[decl['id']]})
    warnings = [line for line in result.stderr.splitlines() if ': warning:' in line
                and ('[-Wstrict-prototypes]' in line or '[-Wdeprecated-non-prototype]' in line)]
    return functions, calls, casts, addressed, warnings


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--build-dir', default='build')
    parser.add_argument('--target', default='uw_dbg')
    parser.add_argument('--output', help='Defaults to BUILD_DIR/pointer-parameter-audit.json')
    options = parser.parse_args()
    options.output = options.output or str(Path(options.build_dir) / 'pointer-parameter-audit.json')
    entries = json.loads((Path(options.build_dir) / 'compile_commands.json').read_text())
    entries = {e['file']: e for e in entries if f'CMakeFiles/{options.target}.dir/' in e['command']}
    if not entries:
        parser.error('No compile commands found for the target')
    functions, calls, casts, addressed, warnings = {}, [], [], [], []
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        for defs, sites, narrowing, addresses, diagnostics in pool.map(audit_translation_unit, entries.values()):
            functions.update(defs)
            calls.extend(sites)
            casts.extend(narrowing)
            addressed.extend(addresses)
            warnings.extend(diagnostics)
    mismatches = []
    for call in calls:
        definition = functions.get(call['callee'])
        if not definition:
            continue
        for index, ((name, formal), actual) in enumerate(zip(definition['parameters'], call['arguments']), 1):
            if narrow(formal) and pointer(actual):
                mismatches.append({**call, 'parameter_index': index, 'parameter': name,
                                   'formal_type': formal, 'pointer_source_type': actual})
    report = {'translation_units': len(entries), 'definitions': len(functions),
              'pointer_arguments_to_narrow_parameters': mismatches,
              'explicit_pointer_narrowing': casts, 'narrow_parameters_used_as_addresses': addressed,
              'prototype_warnings': sorted(set(warnings)),
              'limitations': 'Candidates require review; indirect calls, pointer arithmetic narrowed before a call, and integer forwarding are not fully traced.'}
    Path(options.output).write_text(json.dumps(report, indent=2) + '\n')
    print(f"Audited {len(entries)} translation units, {len(functions)} definitions")
    for key in ('pointer_arguments_to_narrow_parameters', 'explicit_pointer_narrowing',
                'narrow_parameters_used_as_addresses', 'prototype_warnings'):
        print(f'{key}: {len(report[key])}')
    print(f'Report: {options.output}')


if __name__ == '__main__':
    main()
