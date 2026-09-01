#!/usr/bin/env python3
"""Same bug class as fix_stack_copy_loops.py / refix_stack_copy_loops.py,
different surface: 'ARRAYEXPR[(int)pcVarN] = cVarM;' where ARRAYEXPR is a
*real*, already-correctly-sized local array (or 'array + offset'
expression) -- Ghidra used the source pointer's raw value as an array
index instead of a proper running destination pointer. Introduce a
companion destination pointer per site, reset to ARRAYEXPR right after
the loop's 'pcVarN = SOURCE;' init line (found by walking backward), and
rewrite the write to use it incrementally.
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"

WRITE_RE = re.compile(
    r'^(\s*)(.+?)\[\(int\)(\w+)\] = (\w+);\s*$'
)


def find_function_bounds(lines):
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
    edits = []
    decls_by_func_start = {}
    fixed = 0
    skipped = 0

    for (s, e) in bounds:
        for i in range(s, e + 1):
            m = WRITE_RE.match(lines[i])
            if not m:
                continue
            indent, base_expr, pcvar, cvar = m.groups()
            if base_expr.startswith('&stack0x'):
                continue  # handled by the stack0x-specific scripts
            if not re.search(r'\b(ac|au|local_)\w+', base_expr):
                continue  # not a recognizable real local array

            init_idx = None
            for k in range(i - 1, s, -1):
                if re.match(rf'^\s*{re.escape(pcvar)}\s*=\s*[^=].*;\s*$', lines[k]):
                    init_idx = k
                    break
            if init_idx is None:
                skipped += 1
                sys.stderr.write(f"  SKIP L{i+1}: no init of {pcvar} found above it\n")
                continue

            ptr_name = f"wptr_{i+1}"
            edits.append(dict(idx=i,
                               new=f"{indent}*{ptr_name} = {cvar}; {ptr_name} = {ptr_name} + 1;\n"))
            edits.append(dict(idx=init_idx,
                               new=lines[init_idx] + f"    {ptr_name} = {base_expr};\n"))
            decls_by_func_start.setdefault(s, []).append(ptr_name)
            fixed += 1

    for s, names in decls_by_func_start.items():
        decl_text = "".join(f"  char *{n};\n" for n in names)
        edits.append(dict(idx=s, new=lines[s] + decl_text))

    edits.sort(key=lambda ed: ed['idx'], reverse=True)
    for ed in edits:
        lines[ed['idx']] = ed['new']

    with open(UWC, 'w', encoding='utf-8') as f:
        f.writelines(lines)

    sys.stderr.write(f"fix_direct_array_copy_loops: fixed {fixed} write sites, skipped {skipped}\n")


if __name__ == "__main__":
    main()
