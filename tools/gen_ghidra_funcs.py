#!/usr/bin/env python3
"""Generate ghidra-funcs.json: every function in src/*.c carrying a "was FUN_xxx" comment."""
import re, json, glob, os, sys
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEF = re.compile(r'^(?:static\s+)?[A-Za-z_][\w\s\*]*?[\s\*](\w+)\s*\(([^)]*)\)\s*;?\s*$')
# "was FUN_x" counts only when it opens a comment (or a trailing // comment), not a passing mention.
WAS = re.compile(r'(?:^|//|/\*|\*)\s*\(?was\s+(FUN_[0-9a-fA-F]+)', re.M)
# Originals whose comment sits above a different (static helper) definition.
ATTACH = {'FUN_00020a74': 'parse_e_model_file', 'FUN_00069470': 'update_current_view_from_subject'}
KW = {'if','while','for','switch','return','sizeof'}

def comment_block(lines, i):
    """Text of the comment blocks stacked directly above line i (blank lines and
    simple global declarations between them are skipped)."""
    j = i - 1
    parts = []
    while j >= 0:
        s = lines[j].strip()
        if not s or re.match(r'^(static\s+)?[\w\s\*]+\s+\**\w+(\[\w*\])?\s*(=.*)?;\s*$', s):
            j -= 1
        elif s.startswith('//'):
            end = j
            while j >= 0 and lines[j].lstrip().startswith('//'): j -= 1
            parts.append('\n'.join(lines[j+1:end+1]))
        elif s.endswith('*/'):
            end = j
            while j >= 0 and '/*' not in lines[j]: j -= 1
            parts.append('\n'.join(lines[max(j,0):end+1])); j -= 1
        else:
            break
    return '\n'.join(reversed(parts))

def clean(text):
    t = re.sub(r'^\s*(//|/\*+|\*+/?)\s?', '', text, flags=re.M)
    t = re.sub(r'\*/\s*$', '', t)
    return re.sub(r'\s+', ' ', t).strip()

def describe(text, fun, name=''):
    t = clean(text)
    m = re.search(r'was\s+' + fun + r'\b[^\w]*', t)
    t = t[m.end():] if m else t
    t = re.sub(r'^\(?[^)]*\)?[.\s]*(--|—)\s*', '', t) if t.startswith('(') else t
    t = t.lstrip('-—. ').strip()
    m = re.match(r'(.{20,260}?[.;:])(\s|$)', t)
    d = m.group(1).rstrip(':;') if m else t[:200]
    if len(d) < 25:
        # fall back to the first sentence of any other prose in the block, then the name
        rest = re.sub(r'was\s+FUN_[0-9a-fA-F]+', '', clean(text)).strip(' -.')
        m2 = re.match(r'(.{25,260}?[.;])(\s|$)', rest)
        d = m2.group(1) if m2 else (d or '')
    if len(d) < 25 and name:
        d = (d.rstrip('. ') + ' (' if d else '') + name.replace('_', ' ') + (')' if d else '')
    return d.rstrip('. ') + '.' if d else ''

def describe_plain(text, name):
    t = clean(text)
    m = re.match(r'(.{25,260}?[.;])(\s|$)', t)
    return m.group(1).rstrip('.;') + '.' if m else name.replace('_', ' ')

def nparams(p):
    p = p.strip()
    return 0 if p in ('', 'void') else len([x for x in p.split(',') if x.strip()])

# audit state (written by tools/audit_call_args.py --mark) survives regeneration
try: prev = {f['name']: f for f in json.load(open(root + '/ghidra-funcs.json'))['functions']}
except Exception: prev = {}
out = []; seen = set()
for path in sorted(glob.glob(root + '/src/*.c')):
    lines = open(path, errors='replace').read().split('\n')
    rel = os.path.relpath(path, root)
    for i, l in enumerate(lines):
        if not l or l[0] in ' \t#/*}{': continue
        m = DEF.match(l)
        if not m or m.group(1) in KW or l.rstrip().endswith(';'): continue
        # must be followed by K&R decls then '{'
        k = i + 1
        while k < len(lines) and lines[k].strip() != '{' and not lines[k].startswith('{') and k < i + 60 and not lines[k].startswith('}'):
            k += 1
        if k >= len(lines) or not lines[k].startswith('{'): continue
        blk = comment_block(lines, i)
        w = WAS.search(blk) or WAS.search(l)
        fun = w.group(1) if w else None
        if fun in ATTACH and ATTACH[fun] != m.group(1): fun = None
        if not fun:
            fun = next((f for f, n in ATTACH.items() if n == m.group(1) and f not in seen), None)
        if fun in seen: fun = None
        out.append(dict(name=m.group(1), path=rel, line=i+1, original_name=fun, ghidra_origin=bool(fun),
                        param_count=nparams(m.group(2)), description=describe(blk, fun, m.group(1)) if fun else describe_plain(blk, m.group(1))))
        if fun: seen.add(fun)
for f in out:
    for k in ('audited', 'audit_note'):
        if k in prev.get(f['name'], {}): f[k] = prev[f['name']][k]
json.dump({'_meta': {'description': 'Every function definition in src/*.c. Those with ghidra_origin true still carry a \"was FUN_xxxxxxxx\" comment, i.e. were renamed from a Ghidra placeholder; the rest have original_name null. Regenerate with tools/gen_ghidra_funcs.py.', 'total_functions': len(out), 'with_original_name': sum(1 for x in out if x['original_name']), 'without_original_name': sum(1 for x in out if not x['original_name']), 'still_unnamed_FUN': sum(1 for x in out if x['name'].startswith('FUN_'))}, 'functions': out}, open(root + '/ghidra-funcs.json', 'w'), indent=2)
print(len(out), 'functions;', sum(1 for x in out if not x['original_name']), 'without original;', len(seen), 'distinct originals')
