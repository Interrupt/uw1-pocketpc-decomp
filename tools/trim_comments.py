#!/usr/bin/env python3
"""Shrink long comment blocks in src/*.c and src/headers/*.h to a few lines.
A block = a run of adjacent full-line // comments, or one /* ... */ comment.  Blocks longer than
--max-lines are cut to whole leading sentences that fit the budget (the first sentence is always kept,
so a leading "was FUN_xxxxxxxx" survives).  Safety check: the file with all comments blanked must be
identical before and after.   usage: trim_comments.py [--apply] [--max-lines 3] [--width 100] [files...]"""
import re, sys, glob, os
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def comment_spans(src):
    """[(start, end, kind)] for // and /* */ comments, skipping string/char literals."""
    spans = []; i = 0; n = len(src)
    while i < n:
        c = src[i]
        if src.startswith('//', i):
            j = src.find('\n', i); j = n if j < 0 else j
            spans.append((i, j, 'line')); i = j
        elif src.startswith('/*', i):
            j = src.find('*/', i + 2); j = n if j < 0 else j + 2
            spans.append((i, j, 'block')); i = j
        elif c in '"\'':
            j = i + 1
            while j < n and src[j] != c and src[j] != '\n':
                j += 2 if src[j] == '\\' else 1
            i = j + 1
        else: i += 1
    return spans

def blank(src):
    out = list(src)
    for a, b, _ in comment_spans(src):
        for k in range(a, b):
            if src[k] != '\n': out[k] = ' '
    return re.sub(r'\s+', ' ', ''.join(out)).strip()

def clean_text(raw, kind):
    if kind == 'line':
        lines = [re.sub(r'^\s*//+\s?', '', l) for l in raw.split('\n')]
    else:
        lines = raw.split('\n'); lines[0] = lines[0][2:]
        if lines[-1].rstrip().endswith('*/'): lines[-1] = lines[-1].rstrip()[:-2]
        lines = [re.sub(r'^\s*\*?\s?', '', l) if k else l for k, l in enumerate(lines)]
    return re.sub(r'\s+', ' ', ' '.join(lines)).strip()

SENT = re.compile(r'(?<=[.!?])\s+(?=[A-Z(])')
ABBR = re.compile(r'(?:i\.e\.|e\.g\.|etc\.|cf\.|vs\.|approx\.|resp\.|No\.)$')
def split_sentences(text):
    parts = SENT.split(text); out = []
    for p in parts:
        if out and ABBR.search(out[-1]): out[-1] += ' ' + p
        else: out.append(p)
    return out
def summarize(text, budget):
    text = re.sub(r'[-=*_#]{4,}', ' ', text); text = re.sub(r'\s+', ' ', text).strip()
    sents = split_sentences(text)
    out = ''
    for s in sents:
        cand = (out + ' ' + s).strip()
        if len(cand) <= budget: out = cand
        else: break
    if out: return out
    s = sents[0]                      # first sentence alone is too long: cut at a clause boundary
    cut = max((s.rfind(x, 0, budget - 3) for x in ('; ', ' -- ', ': ', ', ')), default=-1)
    if cut < budget * 0.5: cut = s.rfind(' ', 0, budget - 3)
    s = s[:cut].rstrip(' ,;:-')
    while s.count('(') > s.count(')') or s.count('`') % 2:      # don't end inside a parenthetical / code span
        k = max(s.rfind('(') if s.count('(') > s.count(')') else -1, s.rfind('`') if s.count('`') % 2 else -1)
        if k < budget * 0.4: s += ')' if s.count('(') > s.count(')') else '`'; continue
        s = s[:k].rstrip(' ,;:-')
    return s + '...'

def wrap(text, width):
    lines = []; cur = ''
    text = re.sub(r' (\(?was FUN_)', '\x00\\1', text).replace('was FUN_', 'was\x00FUN_')   # keep "... (was FUN_x)" on one line, never at a line start       # never split the Ghidra-origin marker across lines
    for w in text.split(' '):
        if cur and len(cur) + 1 + len(w) > width: lines.append(cur); cur = w
        else: cur = (cur + ' ' + w).strip()
    if cur: lines.append(cur)
    return [l.replace('\x00', ' ') for l in lines]

def process(src, max_lines, width):
    spans = comment_spans(src)
    # group adjacent full-line // comments
    blocks = []; k = 0
    while k < len(spans):
        a, b, kind = spans[k]
        ls = src.rfind('\n', 0, a) + 1
        full = src[ls:a].strip() == ''
        if kind == 'line' and full:
            end = b; m = k + 1
            while m < len(spans) and spans[m][2] == 'line':
                a2, b2, _ = spans[m]; ls2 = src.rfind('\n', 0, a2) + 1
                if src[ls2:a2].strip() == '' and src[end:ls2].strip() == '' and src.count('\n', end, ls2) <= 1: end = b2; m += 1
                else: break
            blocks.append((ls, end, 'line', src[ls:a])); k = m
        elif kind == 'block':
            blocks.append((a, b, 'block', src[ls:a] if full else None)); k += 1
        else: k += 1
    edits = []
    for a, b, kind, indent in blocks:
        raw = src[a:b]
        nlines = raw.count('\n') + 1
        if nlines <= max_lines: continue
        ind = indent if (indent is not None and indent.strip() == '') else ''
        text = clean_text(raw, kind)
        openers = list(dict.fromkeys(re.findall(r'(?:^|//|/\*|\*)\s*\(?was\s+(FUN_[0-9a-fA-F]+)', raw, re.M)))
        lead = re.match(r'was (FUN_[0-9a-fA-F]+)', text)
        for fun in openers:                       # non-leading markers are re-added as their own line below
            if not (lead and lead.group(1) == fun): text = re.sub(r'\(?was\s+' + fun + r'\)?', ' ', text)
        text = re.sub(r'\s+', ' ', text).strip()
        usable = width - len(ind) - 3
        bud = usable * max_lines
        new = wrap(summarize(text, bud), usable)
        while len(new) > max_lines and bud > 40:
            bud -= 8; new = wrap(summarize(text, bud), usable)
        if kind == 'line':
            rep = '\n'.join(ind + '// ' + l for l in new)
            if raw.startswith(ind): pass
            rep = rep[len(ind):] if raw[:len(ind)] == ind else rep   # `a` already points at the indent
        else:
            pad = ind + '   '
            rep = '/* ' + new[0] + ''.join('\n' + pad + l for l in new[1:]) + ' */'
        for fun in dict.fromkeys(re.findall(r'(?:^|//|/\*|\*)\s*\(?was\s+(FUN_[0-9a-fA-F]+)', raw, re.M)):   # keep the Ghidra-origin marker
            if not re.search(r'was\s+' + fun, re.sub(r'\n\s*(//|\*)?', ' ', rep)): rep += '\n' + ind + '// was ' + fun
        edits.append((a, b, rep))
    out = []; pos = 0
    for a, b, rep in edits: out.append(src[pos:a]); out.append(rep); pos = b
    out.append(src[pos:])
    return ''.join(out), len(edits)

if __name__ == '__main__':
    args = sys.argv[1:]; apply = '--apply' in args
    ml = int(args[args.index('--max-lines') + 1]) if '--max-lines' in args else 3
    wd = int(args[args.index('--width') + 1]) if '--width' in args else 100
    files = [a for a in args if a.endswith(('.c', '.h'))] or sorted(glob.glob(root + '/src/*.c') + glob.glob(root + '/src/headers/*.h'))
    tb = tl_before = tl_after = 0
    for f in files:
        src = open(f, errors='replace', newline='').read()
        new, n = process(src, ml, wd)
        assert blank(src) == blank(new), 'code changed in ' + f
        tb += n; tl_before += src.count('\n'); tl_after += new.count('\n')
        if apply and n: open(f, 'w', newline='').write(new)
    print('%d blocks trimmed; %d -> %d lines (%d removed)' % (tb, tl_before, tl_after, tl_before - tl_after))
