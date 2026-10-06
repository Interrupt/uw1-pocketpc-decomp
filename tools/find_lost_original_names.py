#!/usr/bin/env python3
"""Recover Ghidra FUN_ names for functions whose "was FUN_xxx" comment is gone, by
replaying git history and recording identifier renames (FUN_x -> a -> b ...).
Writes tools/recovered_original_names.json: {current_name: {original, chain, commit}}.
"""
import re, json, subprocess, os, sys, difflib, collections
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(__file__))
TOK = re.compile(r'\w+')
edges = collections.defaultdict(list)   # new -> [(old, commit)]
p = subprocess.Popen(['git', 'log', '--reverse', '-p', '-U0', '--no-merges', '--format=@@C %h', '--',
                      '*.c', '*.h'], cwd=root, stdout=subprocess.PIPE, text=True, errors='replace')
commit = None; minus = []; plus = []
def flush():
    global minus, plus
    if minus and plus:
        pairs = []
        if len(minus) == len(plus): pairs = list(zip(minus, plus))
        elif len(minus) * len(plus) <= 2500:
            for a in plus:
                c = difflib.get_close_matches(a, minus, 1, 0.8)
                if c: pairs.append((c[0], a))
        for r, a in pairs:
            rt, at = TOK.findall(r), TOK.findall(a)
            if len(rt) != len(at): continue
            for o, n in zip(rt, at):
                if o != n and not n.isdigit() and not o.isdigit():
                    edges[n].append((o, commit))
    minus = []; plus = []
for line in p.stdout:
    if line.startswith('@@C '): flush(); commit = line.split()[1]; continue
    if line.startswith('@@'): flush(); continue
    if line.startswith('---') or line.startswith('+++'): continue
    if line.startswith('-'): minus.append(line[1:].rstrip('\n'))
    elif line.startswith('+'):
        if minus or True: plus.append(line[1:].rstrip('\n'))
flush()
FUN = re.compile(r'^FUN_[0-9a-fA-F]{8}$')
def resolve(name, depth=0, seen=()):
    if depth > 8: return None
    for old, c in edges.get(name, []):   # chronological
        if FUN.match(old): return [old], c
        if old in seen or old == name: continue
        r = resolve(old, depth + 1, seen + (name,))
        if r: return [r[0][0], old] if len(r[0]) == 1 else r[0] + [old], r[1]
    return None
data = json.load(open(root + '/ghidra-funcs.json'))
rec = {}
for f in data['functions']:
    if f['original_name'] or f['name'].startswith('FUN_'): continue
    r = resolve(f['name'])
    if r: rec[f['name']] = dict(original=r[0][0], chain=r[0][1:] + [f['name']], commit=r[1])
json.dump(rec, open(root + '/tools/recovered_original_names.json', 'w'), indent=1)
print(len(rec), 'recovered')
