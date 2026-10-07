#!/usr/bin/env python3
"""Regenerate dat-vars.json: a catalog of every live DAT_<hex> global in src/.

Usage: python3 tools/gen_dat_vars.py [--check] [--limit N]

Everything computable from the source is recomputed on each run:
  * the set of live names (DAT_ symbols that appear in code, not only in comments)
  * declaration/#define records, backing array + element count, owning file
  * reader/writer occurrence counts (regex heuristic, see _meta.fields)
  * description (leading comment, with own/own_other_decl/backing_array/
    sibling_alias fallbacks) and the `audited` flag
Hand-curated data is carried over from the existing dat-vars.json so a rerun
never loses it:
  * rename_suggestion (per name)
  * kind:"renamed" entries (old DAT_ name -> renamed_to), unless the bare name
    has become live code again
  * the _meta block (description, field docs), with total_count refreshed
`audited` additionally reads tools/datvars_audited.txt (one bare name per line).

--check writes nothing and exits 1 if dat-vars.json would change.
"""
import ast
import glob
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

OUT_PATH = "dat-vars.json"
AUDITED_PATH = "tools/datvars_audited.txt"

NAME_RE = re.compile(r'\bDAT_[0-9a-fA-F]{5,8}\b')
DEFINE_RE = re.compile(r'^#define\s+([A-Za-z_]\w*)\s*(\(.*?\))?\s+(.*)$')
DECL_RE = re.compile(
    r'^(?P<static>static\s+)?(?P<extern>extern\s+)?'
    r'(?P<type>(?:const\s+)?[A-Za-z_][A-Za-z0-9_ ]*?)\s*'
    r'(?P<ptr>\*+)?\s*'
    r'(?P<name>[A-Za-z_]\w*)\s*'
    r'(?P<arr>\[[^=;]*\])?\s*'
    r'(?P<init>=.*)?;\s*$')
# Opening line of a declaration whose initializer continues on later lines:
#   static const signed char DAT_X_backing[16] = {
DECL_OPEN_RE = re.compile(
    r'^(?P<static>static\s+)?(?P<extern>extern\s+)?'
    r'(?P<type>(?:const\s+)?[A-Za-z_][A-Za-z0-9_ ]*?)\s*'
    r'(?P<ptr>\*+)?\s*'
    r'(?P<name>[A-Za-z_]\w*)\s*'
    r'(?P<arr>\[[^=;]*\])\s*'
    r'=\s*\{[^;]*$')
WRITE_AFTER_RE = re.compile(
    r'^\s*(\[[^\]]*\])?\s*(->\w+|\.\w+)?\s*(=[^=]|\+=|-=|\*=|/=|&=|\|=|\^=|<<=|>>=|\+\+|--)')
ALIAS_TARGET_RE = re.compile(
    r'\b([A-Za-z_]\w*(?:_backing|_arr|_region|_real_table|_real|_table))\b')

TYPE_WORDS = {'int', 'char', 'short', 'long', 'byte', 'ushort', 'uint'}


def source_files():
    return sorted(glob.glob("src/*.c")) + sorted(glob.glob("src/headers/*.h"))


# ---------------------------------------------------------------- scanning
def classify_lines(lines):
    """Label each line blank/comment/code (a line that merely starts a comment
    or lies inside a block comment is 'comment')."""
    out = [None] * len(lines)
    in_block = False
    for i, raw in enumerate(lines):
        s = raw.rstrip('\n')
        if s.strip() == '' and not in_block:
            out[i] = 'blank'
            continue
        j = 0
        if in_block:
            end = s.find('*/')
            if end == -1:
                out[i] = 'comment'
                continue
            j = end + 2
            in_block = False
        sr = s[j:].strip()
        if sr == '':
            out[i] = 'comment' if j > 0 else 'blank'
        elif sr.startswith('//'):
            out[i] = 'comment'
        elif sr.startswith('/*'):
            start = s.find('/*', j)
            end = s.find('*/', start + 2)
            if end == -1:
                in_block = True
                out[i] = 'comment'
            else:
                out[i] = 'comment' if s[end + 2:].strip() == '' else 'code'
        else:
            out[i] = 'code'
    return out


def leading_comment(lines, classify, i):
    j = i - 1
    chunk = []
    while j >= 0 and classify[j] == 'comment':
        chunk.append(lines[j].rstrip('\n'))
        j -= 1
    chunk.reverse()
    return '\n'.join(chunk)


def strip_trailing_comment(s):
    pos = s.find('//')
    if pos != -1:
        s = s[:pos]
    s = re.sub(r'/\*.*?\*/', '', s)
    pos = s.find('/*')
    if pos != -1:
        s = s[:pos]
    return s.rstrip()


def live_text(text):
    """Source with comments blanked (newlines kept), string literals kept."""
    out, i, n = [], 0, len(text)
    while i < n:
        c = text[i]
        if c == '"' or c == "'":
            j = i + 1
            while j < n and text[j] != c:
                j += 2 if text[j] == '\\' else 1
            out.append(text[i:j + 1])
            i = j + 1
        elif text.startswith('//', i):
            j = text.find('\n', i)
            j = n if j == -1 else j
            i = j
        elif text.startswith('/*', i):
            j = text.find('*/', i + 2)
            j = n if j == -1 else j + 2
            out.append(re.sub(r'[^\n]', ' ', text[i:j]))
            i = j
        else:
            out.append(c)
            i += 1
    return ''.join(out)


def collect_records(files):
    """name -> list of declaration/#define records for every DAT_ symbol."""
    records = {}
    for fp in files:
        with open(fp, errors='replace') as f:
            lines = f.readlines()
        classify = classify_lines(lines)
        for i, raw in enumerate(lines):
            if classify[i] != 'code':
                continue
            line = raw.rstrip('\n')
            if line[:1] == ' ' and line[1:2] != ' ':
                s2 = line[1:]  # the one-leading-space quirk
            elif line[:1] in (' ', '\t'):
                continue
            else:
                s2 = line
            stripped = s2.strip()
            if not stripped:
                continue
            stripped = strip_trailing_comment(stripped) or stripped

            m = DEFINE_RE.match(stripped)
            if m:
                if not m.group(2):  # object-like macros only
                    name, body = m.group(1), m.group(3)
                    if name.startswith('DAT_') or '_DAT_' in name[:5]:
                        records.setdefault(name, []).append({
                            'file': fp, 'line': i + 1, 'kind': 'define',
                            'body': body.strip(),
                            'comment': leading_comment(lines, classify, i)})
                continue

            m = DECL_RE.match(stripped) or DECL_OPEN_RE.match(stripped)
            if not m or not m.group('name').startswith('DAT_'):
                continue
            records.setdefault(m.group('name'), []).append({
                'file': fp, 'line': i + 1, 'kind': 'decl',
                'extern': bool(m.group('extern')),
                'type': (m.group('type') or '').strip(),
                'ptr': m.group('ptr') or '',
                'arr': m.group('arr') or '',
                'comment': leading_comment(lines, classify, i)})
    return records


def live_names(files):
    names = set()
    for fp in files:
        with open(fp, errors='replace') as f:
            names.update(NAME_RE.findall(live_text(f.read())))
    return sorted(names)


# ------------------------------------------------------------ array sizes
def macro_table(files):
    table = {}
    pat = re.compile(r'^\s*#define\s+([A-Za-z_]\w*)\s+((?:0[xX][0-9a-fA-F]+|\d+))\s*(?:/[/*].*)?$')
    for fp in files:
        with open(fp, errors='replace') as f:
            for line in f:
                m = pat.match(line)
                if m:
                    table.setdefault(m.group(1), int(m.group(2), 0))
    return table


def eval_simple_expr(s, macros):
    s = s.strip()
    for name, val in macros.items():
        s = re.sub(r'\b%s\b' % re.escape(name), str(val), s)
    try:
        node = ast.parse(s, mode='eval')
        ok = (ast.Expression, ast.BinOp, ast.UnaryOp, ast.Constant,
              ast.Add, ast.Sub, ast.Mult, ast.Div, ast.USub, ast.Load)
        if not all(isinstance(n, ok) for n in ast.walk(node)):
            return None
        return int(eval(compile(node, '<expr>', 'eval')))
    except Exception:
        return None


# ----------------------------------------------------------- description
def clean_comment(raw):
    if not raw:
        return ""
    out = []
    for l in raw.split('\n'):
        l = l.strip()
        l = re.sub(r'^/\*+\s*', '', l)
        l = re.sub(r'\*+/\s*$', '', l)
        l = re.sub(r'^//+\s*', '', l)
        l = re.sub(r'^\*\s*', '', l)
        out.append(l)
    return re.sub(r'\s+', ' ', ' '.join(x for x in out if x)).strip()


def first_sentences(text, max_chars=280):
    if not text:
        return ""
    out = ""
    for p in re.split(r'(?<=[.;])\s+(?=[A-Z(])', text):
        if len(out) + len(p) > max_chars and out:
            break
        out = (out + " " + p).strip()
        if len(out) >= max_chars * 0.6:
            break
    if not out:
        out = text[:max_chars]
    if len(out) > max_chars:
        out = out[:max_chars].rsplit(' ', 1)[0] + "..."
    return out


# ------------------------------------------------------------------ main
def build(prev):
    files = source_files()
    records = collect_records(files)
    names = [n for n in live_names(files) if n in records]
    macros = macro_table(files)

    def file_rank(fp):
        return 2 if fp.startswith('src/headers/') else (0 if fp.endswith('.c') else 1)

    def record_rank(r):
        if r['kind'] == 'decl' and not r['extern']:
            return 0
        return 1 if r['kind'] == 'define' else 2

    primary = {n: {'best': sorted(records[n], key=lambda r: (record_rank(r), file_rank(r['file'])))[0],
                   'all': records[n]} for n in names}

    array_size = {}
    for name, recs in records.items():
        for r in recs:
            if r['kind'] == 'decl' and r['arr'].strip('[]').strip():
                v = eval_simple_expr(r['arr'].strip('[]'), macros)
                if v is not None:
                    array_size.setdefault(name, v)

    def resolve_backing(name, depth=0):
        """-> (backing array name, element count, element type)."""
        if depth > 6 or name not in primary:
            return (None, None, None)
        rec = primary[name]['best']
        if rec['kind'] == 'decl':
            if rec['arr']:
                return (name, array_size.get(name), rec['type'].strip() or None)
            return (None, None, None)
        body = rec['body']
        m = ALIAS_TARGET_RE.search(body)
        if m and m.group(1) in array_size:
            target = m.group(1)
            elem = None
            for r2 in records.get(target, []):
                if r2['kind'] == 'decl' and r2['arr']:
                    elem = r2['type'].strip() or None
                    break
            return (target, array_size[target], elem)
        m2 = NAME_RE.search(body)
        if m2 and m2.group(0) != name:
            return resolve_backing(m2.group(0), depth + 1)
        return (None, None, None)

    backing = {n: resolve_backing(n) for n in names}

    # reader/writer occurrence scan over live code
    nameset = set(names)
    own_decl_lines = {(r['file'], r['line'], n) for n in names for r in records[n]}
    readers = dict.fromkeys(names, 0)
    writers = dict.fromkeys(names, 0)
    reader_files = {n: set() for n in names}
    writer_files = {n: set() for n in names}
    for fp in sorted(glob.glob("src/*.c")):
        with open(fp, errors='replace') as f:
            lines = f.readlines()
        for i, line in enumerate(lines):
            for m in NAME_RE.finditer(line):
                n = m.group(0)
                if n not in nameset or (fp, i + 1, n) in own_decl_lines:
                    continue
                if WRITE_AFTER_RE.match(line[m.end():]):
                    writers[n] += 1
                    writer_files[n].add(fp)
                else:
                    readers[n] += 1
                    reader_files[n].add(fp)

    # siblings: other names sharing a backing array (for description fallback)
    by_backing = {}
    for n in names:
        if backing[n][0]:
            by_backing.setdefault(backing[n][0], []).append(n)

    audited_ledger = set()
    if os.path.exists(AUDITED_PATH):
        with open(AUDITED_PATH) as f:
            audited_ledger = {l.strip() for l in f if l.strip() and not l.startswith('#')}

    prev_vars = {v['name']: v for v in prev.get('variables', [])}

    entries = {}
    for name in names:
        info = primary[name]
        rec = info['best']
        bname, size, elem_type = backing[name]
        lives_in = rec['file']
        if bname and bname in records:
            for r2 in records[bname]:
                if r2['kind'] == 'decl' and not r2['extern']:
                    lives_in = r2['file']
                    break

        desc, src = clean_comment(rec.get('comment', '')), 'own'
        if not desc:
            for r2 in info['all']:
                desc = clean_comment(r2.get('comment', ''))
                if desc:
                    src = 'own_other_decl'
                    break
        if not desc and bname:
            for r2 in records.get(bname, []):
                desc = clean_comment(r2.get('comment', ''))
                if desc:
                    src = 'backing_array'
                    break
        if not desc and bname:
            for other in by_backing.get(bname, []):
                if other == name:
                    continue
                for r2 in records[other]:
                    desc = clean_comment(r2.get('comment', ''))
                    if desc:
                        src = 'sibling_alias'
                        break
                if desc:
                    break
        if not desc:
            src = 'none'

        vtype = None
        if rec['kind'] == 'decl':
            vtype = (rec['type'] + (' ' + rec['ptr'] if rec['ptr'] else '')).strip() or None
        if desc:
            description = first_sentences(desc)
        elif bname:
            description = ("%s-element %s backing store; read %d time(s), written %d time(s) "
                           "across the codebase. No recovery comment on file."
                           % (size if size else '?', elem_type or 'array', readers[name], writers[name]))
        else:
            description = ("%s global; read %d time(s), written %d time(s) across the "
                           "codebase. No recovery comment on file."
                           % (vtype or 'scalar', readers[name], writers[name]))

        primary_owner = bname[:-len('_backing')] if bname and bname.endswith('_backing') else None
        entries[name] = {
            "name": name,
            "lives_in": lives_in,
            "kind": ("macro_alias" if rec['kind'] == 'define'
                     else "array" if rec['arr'] else "scalar"),
            "type": elem_type if bname else vtype,
            "backing_array": bname if (bname and bname != name) else None,
            "size": size,
            "readers": readers[name],
            "writers": writers[name],
            "reader_file_count": len(reader_files[name]),
            "writer_file_count": len(writer_files[name]),
            "description": description,
            "description_source": src,
            # hand-reviewed: carried over, never recomputed
            "rename_suggestion": prev_vars.get(name, {}).get('rename_suggestion'),
            # a scalar has no sizing question; an array needs a ledger entry
            "audited": (name in audited_ledger) or not size or (primary_owner in audited_ledger),
            "renamed_to": None,
        }

    # carried-over kind:"renamed" entries (hand-verified old-name -> new-name)
    for name, v in prev_vars.items():
        if v.get('kind') == 'renamed' and name not in entries:
            v = dict(v)
            v.setdefault('rename_suggestion', None)
            v['audited'] = True
            entries[name] = v
    return entries


def main():
    args = sys.argv[1:]
    check = '--check' in args
    limit = None
    if '--limit' in args:
        limit = int(args[args.index('--limit') + 1])

    prev = {}
    if os.path.exists(OUT_PATH):
        with open(OUT_PATH) as f:
            prev = json.load(f)

    entries = build(prev)
    ordered = sorted(entries)
    meta = dict(prev.get('_meta', {}))
    meta['total_count'] = len(ordered)
    out = {"_meta": meta,
           "variables": [entries[n] for n in (ordered[:limit] if limit else ordered)]}
    text = json.dumps(out, indent=2) + '\n'

    live = [e for e in entries.values() if e['kind'] != 'renamed']
    print("%d entries (%d live, %d renamed); %d audited; %d with rename_suggestion"
          % (len(ordered), len(live), len(ordered) - len(live),
             sum(1 for e in entries.values() if e['audited']),
             sum(1 for e in entries.values() if e['rename_suggestion'])),
          file=sys.stderr)

    if check:
        old = open(OUT_PATH).read() if os.path.exists(OUT_PATH) else ''
        sys.exit(0 if old == text else 1)
    with open(OUT_PATH, 'w') as f:
        f.write(text)


if __name__ == '__main__':
    main()
