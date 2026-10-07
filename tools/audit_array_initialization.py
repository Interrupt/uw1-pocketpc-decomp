#!/usr/bin/env python3
"""Find read-used global arrays without initializers or visible population.

This is a source heuristic, not a proof of missing binary data. Track DAT
aliases together, distinguish write destinations from copy/read sources, and
retain use sites for reviewing indirect loading paths. No game code is changed.
"""
import argparse
import bisect
import json
import hashlib
from pathlib import Path
import re

TOKENS = re.compile(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'')
ARRAY = re.compile(r'^[ \t]*(?!extern\b)([\w \t*]+?)\b(\w+)\s*((?:\[[^\]\n]+\]\s*)+)\s*([;=])', re.M)
FUNCTION_ARRAY = re.compile(r'^[ \t]*(?!extern\b)([\w \t*]+?)\(\s*\*\s*(\w+)\s*((?:\[[^\]\n]+\]\s*)+)\)\s*\([^;\n]*\)\s*([;=])', re.M)
MACRO = re.compile(r'^\s*#define\s+(\w+)\s+([^\n]+)', re.M)
ASSIGN = re.compile(r'(?<![=!<>])(?:[+*/%&|^\-]|<<|>>)?=(?!=)')
# Destination argument only: taking an array's address as a source is not a load.
DESTINATIONS = {
    'read_file_handle': 1, 'read_buffer_from_file': 1,
    'read_gr_resource_record': 1, 'load_pals_bank': 1,
    'ce_memset': 0, 'ce_memmove': 0, 'ce_memcpy': 0,
    'memset': 0, 'memcpy': 0, 'memmove': 0,
    'ce_strcpy': 0, 'ce_strcat': 0, 'ce_strncpy': 0, 'strcpy': 0, 'strcat': 0,
    'load_bmp_resource_to_rgb565': 2, 'GetDlgItemTextW': 2,
    'MultiByteToWideChar': 4, 'WideCharToMultiByte': 4,
    'snprintf': 0, 'sprintf': 0, 'fread': 0,
}


def blank(source):
    return TOKENS.sub(lambda m: re.sub(r'[^\n]', ' ', m.group()), source)


def arguments(code, opening):
    depth = 1
    start = opening+1
    result = []
    for i in range(start, len(code)):
        c = code[i]
        if c in '([{':
            depth += 1
        elif c in ')]}':
            depth -= 1
            if depth == 0:
                return result+[code[start:i]], i+1
        elif c == ',' and depth == 1:
            result.append(code[start:i])
            start = i+1
    return [], opening+1


def audit(root):
    files = {}
    arrays = []
    aliases = {}
    pointer_views = set()
    for path in sorted((root/'src').rglob('*')):
        if path.suffix not in {'.c', '.h'}:
            continue
        original = path.read_text()
        code = blank(original)
        relative = str(path.relative_to(root))
        starts = [0]+[m.end() for m in re.finditer('\n', code)]
        depths = []
        depth = 0
        for c in code:
            depths.append(depth)
            depth += (c == '{')-(c == '}')
        declarations = []
        for regex in (ARRAY, FUNCTION_ARRAY):
            for m in regex.finditer(code):
                if depths[m.start()] != 0:
                    continue
                declarations.append((m.start(), m.end()))
                if m[4] == ';' and path.suffix == '.c':
                    arrays.append(dict(name=m[2], path=relative,
                                       line=bisect.bisect_right(starts, m.start()),
                                       type=m[1].strip(), dimensions=m[3].strip()))
        for m in MACRO.finditer(code):
            aliases.setdefault(m[1], set()).update(re.findall(r'\b\w+\b', m[2]))
        # Erase declarations/preprocessor lines when looking for runtime uses.
        usage = list(code)
        for a,b in declarations:
            usage[a:b] = [' ' if c != '\n' else c for c in code[a:b]]
        for m in re.finditer(r'^\s*#.*$', code, re.M):
            usage[m.start():m.end()] = [' ' if c != '\n' else c for c in m.group()]
        # Global pointer initializers also name the backing storage's runtime view.
        for m in re.finditer(r'^\s*(?:static\s+)?[\w ]+\*\s*(\w+)\s*=\s*(?:&\s*)?(\w+)\s*;', code, re.M):
            if depths[m.start()] == 0:
                aliases.setdefault(m[1], set()).add(m[2])
                pointer_views.add(m[1])
        files[relative] = (original.splitlines(), ''.join(usage), starts)

    for array in arrays:
        names = {array['name']}
        while True:
            expanded = names | {name for name, deps in aliases.items() if deps & names}
            if expanded == names:
                break
            names = expanded
        array['aliases'] = sorted(names-{array['name']})
        pattern = re.compile(r'\b(?:'+ '|'.join(map(re.escape, sorted(names)))+r')\b')
        uses = []
        writes = []
        population = []
        for relative, (original, code, starts) in files.items():
            if not pattern.search(code) or not relative.endswith('.c'):
                continue
            for m in pattern.finditer(code):
                line = bisect.bisect_right(starts, m.start())
                uses.append(dict(path=relative, line=line, symbol=m.group(),
                                 code=original[line-1].strip()))
            for m in ASSIGN.finditer(code):
                a = max(code.rfind(';', 0, m.start()), code.rfind('{',0,m.start()), code.rfind('}',0,m.start()))+1
                lhs = code[a:m.start()].strip()
                # Ignore completed control conditions before the actual lvalue.
                for condition in re.finditer(r'\b(?:if|while|for|switch)\s*\(', lhs):
                    _, end = arguments(lhs, lhs.index('(', condition.start()))
                    if end > condition.end() and end < len(lhs):
                        lhs = lhs[end:].strip()
                        break
                # A scalar/pointer assignment only writes its final identifier,
                # not arrays mentioned earlier in an enclosing condition.
                tail = re.search(r'\b(\w+)\s*$', lhs)
                if tail:
                    is_write = tail[1] in names and (tail[1] not in pointer_views or lhs.startswith('*'))
                else:
                    # In arr[index], names inside index are readers. For a
                    # dereferenced cast/address expression retain the base view.
                    indexed = re.search(r'\b(\w+)\s*\[', lhs)
                    is_write = indexed[1] in names if indexed and not lhs.startswith('*') else bool(pattern.search(lhs))
                if is_write:
                    line = bisect.bisect_right(starts, m.start())
                    writes.append(dict(path=relative, line=line, code=original[line-1].strip()))
            # Only direct increments of the array view count as writes.
            for m in re.finditer(r'(?:\+\+|--)\s*(\w+)|\b(\w+)\s*(?:\+\+|--)', code):
                name = m[1] or m[2]
                if name in names and name not in pointer_views:
                    writes.append(dict(path=relative,line=bisect.bisect_right(starts,m.start()),code='increment/decrement'))
            for m in re.finditer(r'\b('+'|'.join(DESTINATIONS)+r')\s*\(', code):
                args,_ = arguments(code,code.index('(',m.start()))
                destination=DESTINATIONS[m[1]]
                if len(args)>destination and pattern.search(args[destination]):
                    population.append(dict(path=relative,line=bisect.bisect_right(starts,m.start()),function=m[1],destination=args[destination].strip()))
        # Keep one entry per source line instead of each alias occurrence.
        array['uses'] = list({(u['path'],u['line']):u for u in uses}.values())
        array['writes'] = writes
        array['population_calls'] = population
        array['status'] = 'unused' if not uses else 'visible_population' if writes or population else 'needs_review'
    return arrays


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--review', type=Path, help='Optional reviewed classifications; defaults to tools/array-initialization-review.json')
    args = parser.parse_args()
    arrays = audit(args.root)
    review_path = args.review or args.root/'tools/array-initialization-review.json'
    reviews = json.loads(review_path.read_text())['arrays'] if review_path.exists() else {}
    hashes = {}
    for array in arrays:
        review = reviews.get(array['name'])
        if review and review['path'] == array['path']:
            path = args.root/array['path']
            if array['path'] not in hashes:
                hashes[array['path']] = hashlib.sha256(path.read_bytes()).hexdigest()
            if review['owner_sha256'] == hashes[array['path']]:
                array['review'] = review
            else:
                array['review_stale'] = True
    counts = {status:sum(a['status']==status for a in arrays)
              for status in ['unused','visible_population','needs_review']}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(dict(
        description='Uninitialized global arrays; indirect writes require manual review. Catalog audited flags are not initialization evidence.',
        counts=counts, arrays=arrays), indent=2)+'\n')
    print(json.dumps(counts))
    for a in arrays:
        if a['status']=='needs_review':
            classification = a.get('review', {}).get('status', 'unreviewed')
            print(f"{a['path']}:{a['line']} {a['name']}{a['dimensions']} ({len(a['uses'])} use sites; {classification})")


if __name__ == '__main__':
    main()
