#!/usr/bin/env python3
"""Set "modernized" in ghidra-funcs.json from the code: a function is modernized when its definition
has a prototype-style parameter list (typed params) or no parameters at all, i.e. not a K&R `(a,b)` name list.
usage: mark_modernized.py [--list]   (--list prints the functions still in K&R form, grouped by file)"""
import re, json, os, sys, collections
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
data = json.load(open(root + '/ghidra-funcs.json'))
TYPE = re.compile(r'\b(int|char|void|short|long|unsigned|uint|byte|ushort|undefined\w*|bool|float|double|const|struct|\w+_t)\b')
left = collections.defaultdict(list); files = {}
for f in data['functions']:
    L = files.setdefault(f['path'], open(root + '/' + f['path'], errors='replace').read().split('\n'))
    i = f['line'] - 1
    # the generator's line numbers can lag edits: relocate by name
    if not re.search(r'\b' + re.escape(f['name']) + r'\s*\(', L[i]):
        i = next((k for k, l in enumerate(L) if re.match(r'^[A-Za-z_][^;]*\b' + re.escape(f['name']) + r'\s*\(', l)), i)
    m = re.search(r'\b' + re.escape(f['name']) + r'\s*\(([^)]*)\)', L[i])
    params = m.group(1).strip() if m else ''
    # `()` is the preferred spelling for zero-parameter functions, so it counts as modern; K&R is a non-empty list of bare names
    ok = params in ('', 'void') or bool(TYPE.search(params))
    f['modernized'] = ok
    if not ok: left[f['path']].append(f['name'])
data['_meta']['modernized_true'] = sum(1 for f in data['functions'] if f['modernized'])
data['_meta']['modernized_false'] = len(data['functions']) - data['_meta']['modernized_true']
json.dump(data, open(root + '/ghidra-funcs.json', 'w'), indent=2)
print('modernized %d / %d' % (data['_meta']['modernized_true'], len(data['functions'])))
if '--list' in sys.argv:
    for p, ns in sorted(left.items(), key=lambda x: len(x[1])): print('%-28s %3d  %s' % (p, len(ns), ' '.join(ns[:4])))
