#!/usr/bin/env python3
"""For every function in ghidra-funcs.json, find every call site in src/ (and tests/)
and compare its argument count to the function's declared parameter count.
Prints mismatches as path:line. With --mark, sets "audited": true on entries with
no unresolved mismatches."""
import re, json, glob, os, sys, collections
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def strip(src):
    """Blank out comments and string/char literals, preserving offsets and newlines."""
    out = list(src); i = 0; n = len(src)
    while i < n:
        c = src[i]
        if src.startswith('//', i):
            j = src.find('\n', i); j = n if j < 0 else j
            for k in range(i, j): out[k] = ' '
            i = j
        elif src.startswith('/*', i):
            j = src.find('*/', i + 2); j = n if j < 0 else j + 2
            for k in range(i, j):
                if src[k] != '\n': out[k] = ' '
            i = j
        elif c in '"\'':
            j = i + 1
            while j < n and src[j] != c:
                j += 2 if src[j] == '\\' else 1
            for k in range(i + 1, min(j, n)):
                if src[k] != '\n': out[k] = ' '
            i = j + 1
        else: i += 1
    return ''.join(out)

def split_args(s):
    depth = 0; args = []; cur = ''
    for ch in s:
        if ch in '([{': depth += 1
        elif ch in ')]}': depth -= 1
        if ch == ',' and depth == 0: args.append(cur); cur = ''
        else: cur += ch
    args.append(cur)
    args = [a for a in args if a.strip()]
    return args

def main():
    data = json.load(open(root + '/ghidra-funcs.json'))
    funcs = {f['name']: f for f in data['functions']}
    files = sorted(glob.glob(root + '/src/*.c') + glob.glob(root + '/src/headers/*.h') +
                   glob.glob(root + '/tests/*.c') + glob.glob(root + '/tests/*.h'))
    pat = re.compile(r'\b(' + '|'.join(map(re.escape, funcs)) + r')\s*\(')
    bad = collections.defaultdict(list); calls = collections.Counter()
    defs = {(f['path'], f['line']) for f in funcs.values()}
    for path in files:
        raw = open(path, errors='replace').read()
        s = strip(raw)
        rel = os.path.relpath(path, root)
        for m in pat.finditer(s):
            name = m.group(1)
            line = s.count('\n', 0, m.start()) + 1
            # skip the definition itself / prototypes: preceded by a type (word or *) on same logical start
            ls = s.rfind('\n', 0, m.start()) + 1
            prefix = s[ls:m.start()]
            # find matching paren
            depth = 1; j = m.end()
            while j < len(s) and depth:
                depth += (s[j] == '(') - (s[j] == ')'); j += 1
            inner = s[m.end():j-1]
            after = s[j:j+80].lstrip()
            is_decl = bool(re.match(r'^[A-Za-z_][\w\s\*]*[\s\*]$', prefix)) and not re.search(r'\b(return|else|case|goto)\s*$', prefix)
            if is_decl and (after.startswith(';') or after.startswith('{') or re.match(r'^[\w\s\*,]*;', after) or after == '' or not after[0] in '=)&|?:,+-*/<>'):
                # definition or prototype (K&R decl list follows) -- not a call
                if after.startswith(';') or after.startswith('{') or re.match(r'^[A-Za-z_]', after): continue
            n = len(split_args(inner))
            calls[name] += 1
            exp = funcs[name]['param_count']
            if (n < exp if funcs[name].get('variadic') else n != exp): bad[name].append((rel, line, n, exp, raw.split('\n')[line-1].strip()[:110], re.sub(r'\s+', ' ', inner)))
    return data, funcs, calls, bad

if __name__ == '__main__':
    data, funcs, calls, bad = main()
    if '--mark' in sys.argv:
        notes = json.load(open(root + '/tools/audit_notes.json'))
        for f in data['functions']:
            n = f['name']; f['audited'] = n not in bad or notes.get(n, '').startswith('VERIFIED')
            f.pop('audit_note', None)
            if n in bad:
                sites = ', '.join('%s:%d passes %d' % (r, l, k) for r, l, k, *_ in bad[n][:3])
                f['audit_note'] = '%s (declared %d; e.g. %s%s)' % (notes.get(n, 'unresolved call-site mismatch'), f['param_count'], sites, ', ...' if len(bad[n]) > 3 else '')
            elif n in notes: f['audit_note'] = notes[n]
        data['_meta']['audited_true'] = sum(1 for f in data['functions'] if f['audited'])
        data['_meta']['audited_false'] = sum(1 for f in data['functions'] if not f['audited'])
        json.dump(data, open(root + '/ghidra-funcs.json', 'w'), indent=2)
    for name, lst in sorted(bad.items()):
        for rel, line, n, exp, txt, _inner in lst:
            print(f'{rel}:{line}: {name} called with {n}, declared {exp}: {txt}')
    print(f'\n{sum(calls.values())} call sites, {len(bad)} functions with mismatches, {sum(len(v) for v in bad.values())} bad sites', file=sys.stderr)
