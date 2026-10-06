#!/usr/bin/env python3
"""Extend a K&R function definition's parameter list: add_params(path, line, name, n_total)."""
import re
def add_params(path, line, name, n_total, ctype):
    L = open(path, errors='replace', newline='').read().split('\n')
    i = line - 1
    m = re.search(r'\b' + re.escape(name) + r'\s*\(([^)]*)\)', L[i])
    assert m, (path, line, name)
    names = [x.strip() for x in m.group(1).split(',') if x.strip()]
    assert not any('*' in x or ' ' in x for x in names), (name, names)   # K&R only
    cur = len(names)
    new = ['param_%d' % k for k in range(cur + 1, n_total + 1)]
    L[i] = L[i][:m.start(1)] + ','.join(names + new) + L[i][m.end(1):]
    j = i + 1
    while not L[j].startswith('{'): j += 1
    k = j
    while k > i and not L[k - 1].strip(): k -= 1
    for off, nm in enumerate(new): L.insert(k + off, '%s %s;' % (ctype, nm))
    open(path, 'w', newline='').write('\n'.join(L))
