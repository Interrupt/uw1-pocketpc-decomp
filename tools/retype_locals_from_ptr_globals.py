#!/usr/bin/env python3
"""Any local scalar (int/uint/undefined4/short/ushort) that gets assigned
directly from a pointer-typed global is another instance of the 64-bit
pointer-truncation hazard (see retype_pointers.py) one level removed: the
global holds a real malloc'd/derived pointer, but the local meant to carry
it around within the function is declared too narrow to hold it on a
64-bit host. Find every such local (scoped per-function, since the same
name recurs in many different functions) and widen its declaration to a
pointer type.
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"


def find_function_bounds(lines):
    bounds = []
    i = 0
    n = len(lines)
    while i < n:
        if lines[i] == '{':
            j = i + 1
            while j < n and lines[j] != '}':
                j += 1
            bounds.append((i, j))
            i = j + 1
        else:
            i += 1
    return bounds


def main():
    with open(UWC, encoding='utf-8') as f:
        src = f.read()
    lines = src.split('\n')

    ptr_globals = set(re.findall(r'^[A-Za-z_][A-Za-z0-9_ ]*?\s+\*+\s*(DAT_[0-9a-fA-F]+);', src, re.M))
    bounds = find_function_bounds(lines)

    decl_edits = {}  # line_idx -> new_text
    fixed_pairs = set()

    for s, e in bounds:
        scalar_locals = {}
        for i in range(s, e + 1):
            m = re.match(r'^(int|uint|undefined4|short|ushort)\s+(\w+);$', lines[i].strip())
            if m:
                scalar_locals[m.group(2)] = i
        for i in range(s, e + 1):
            for lname, decl_idx in scalar_locals.items():
                m = re.match(rf'^\s*{re.escape(lname)}\s*=\s*(DAT_[0-9a-fA-F]+)\s*;', lines[i])
                if m and m.group(1) in ptr_globals:
                    key = (decl_idx, lname)
                    if key not in fixed_pairs:
                        fixed_pairs.add(key)
                        indent = re.match(r'^(\s*)', lines[decl_idx]).group(1)
                        decl_edits[decl_idx] = f"{indent}char *{lname};"

    for idx, new_text in decl_edits.items():
        lines[idx] = new_text

    with open(UWC, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    sys.stderr.write(f"retype_locals_from_ptr_globals: widened {len(decl_edits)} local declarations\n")


if __name__ == "__main__":
    main()
