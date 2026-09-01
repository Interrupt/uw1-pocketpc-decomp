#!/usr/bin/env python3
"""Fix Ghidra's broken '(&stackXXXX)[(int)pcVarN] = cVarM;' idiom.

This shows up wherever Ghidra couldn't correlate a byte-copy loop's
destination with a real stack slot: it emits a bogus placeholder symbol
'stackXXXX' as if it were the array's base address and indexes into it
using the SOURCE pointer's raw numeric value -- which only made sense
relative to the original binary's fixed memory layout. Recompiled fresh,
`(&stackXXXX)[(int)pcVarN]` is `*((char*)&stackXXXX + pcVarN)`: a wild
write far outside any buffer, and a reliable crash once one of these loops
actually runs.

Fix: give each 'stackXXXX' a real backing buffer, and replace the bogus
index expression with a proper destination pointer that starts at the
buffer and increments in lockstep with the source pointer, reset to the
buffer's start at each loop's initialization site (found by walking back
to the nearest `pcVarN = ...;` before the loop).
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"

WRITE_RE = re.compile(
    r'^(\s*)\(&(stack0x[0-9a-fA-F]+)\)\[\(int\)(\w+)\] = (\w+);\s*$'
)
DECL_RE_TMPL = r'^(\s*)unsigned int {name};\s*$'


def find_function_bounds(lines):
    """Return list of (start_brace_idx, end_brace_idx) for column-0 braces."""
    bounds = []
    i = 0
    n = len(lines)
    while i < n:
        if lines[i] == '{\n':
            j = i + 1
            while j < n and lines[j] != '}\n':
                j += 1
            bounds.append((i, j))
            i = j + 1
        else:
            i += 1
    return bounds


def main():
    with open(UWC, encoding='utf-8') as f:
        lines = f.readlines()

    bounds = find_function_bounds(lines)

    # collect edits as (line_idx, kind, data), applied later back-to-front
    edits = []  # list of dicts
    fixed = 0
    skipped = 0

    for (s, e) in bounds:
        # declarations of stackXXXX within this function
        decl_lines = {}
        for i in range(s, e + 1):
            for m in re.finditer(r'\bstack0x[0-9a-fA-F]+\b', lines[i]):
                name = m.group(0)
                dm = re.match(DECL_RE_TMPL.format(name=re.escape(name)), lines[i])
                if dm:
                    decl_lines[name] = i

        for i in range(s, e + 1):
            m = WRITE_RE.match(lines[i])
            if not m:
                continue
            indent, name, pcvar, cvar = m.groups()
            if name not in decl_lines:
                skipped += 1
                sys.stderr.write(f"  SKIP L{i+1}: no declaration for {name} in this function\n")
                continue

            # find nearest preceding "pcvar = EXPR;" (the loop's source init)
            init_idx = None
            for k in range(i - 1, s, -1):
                if re.match(rf'^\s*{re.escape(pcvar)}\s*=\s*[^=].*;\s*$', lines[k]):
                    init_idx = k
                    break
            if init_idx is None:
                skipped += 1
                sys.stderr.write(f"  SKIP L{i+1}: no init of {pcvar} found above it\n")
                continue

            ptr_name = f"{name}_ptr"
            edits.append(dict(kind='write', idx=i,
                               new=f"{indent}*{ptr_name} = {cvar}; {ptr_name} = {ptr_name} + 1;\n"))
            edits.append(dict(kind='reset', idx=init_idx,
                               new=lines[init_idx] + f"    {ptr_name} = {name}_buf;\n"))
            edits.append(dict(kind='decl', idx=decl_lines[name],
                               new=f"  char {name}_buf [256];\n  char *{ptr_name};\n"))
            fixed += 1

    # Multiple writes may share one decl/reset target; dedupe decl edits by idx,
    # and reset edits by idx (keep first only, since re-inserting the same
    # reset text at the same init line for multiple writes sharing one loop
    # start would duplicate it).
    seen_decl = set()
    seen_reset = set()
    deduped = []
    for ed in edits:
        key = (ed['kind'], ed['idx'])
        if ed['kind'] == 'decl':
            if ed['idx'] in seen_decl:
                continue
            seen_decl.add(ed['idx'])
        if ed['kind'] == 'reset':
            if ed['idx'] in seen_reset:
                continue
            seen_reset.add(ed['idx'])
        deduped.append(ed)

    # apply back-to-front so indices stay valid
    deduped.sort(key=lambda ed: ed['idx'], reverse=True)
    for ed in deduped:
        lines[ed['idx']] = ed['new']

    with open(UWC, 'w', encoding='utf-8') as f:
        f.writelines(lines)

    sys.stderr.write(f"fix_stack_copy_loops: fixed {fixed} write sites, skipped {skipped}\n")


if __name__ == "__main__":
    main()
