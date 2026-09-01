#!/usr/bin/env python3
"""Retype global DAT_/PTR_/UNK_ variables that compile errors reveal are
actually used as pointers (dereferenced with '*' or indexed with '[]') but
were declared as plain 32-bit ints by Ghidra. This matters for correctness,
not just compilation: on a 64-bit host a real pointer stored into a 32-bit
int gets silently truncated and corrupted, so these fixes double as bug
fixes for that truncation hazard.
"""
import re
import subprocess
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"


def compile_errors():
    cmd = [
        "clang", "-fsyntax-only", "-std=gnu11",
        "-Wno-implicit-function-declaration", "-Wno-int-conversion",
        "-Wno-int-to-pointer-cast", "-Wno-pointer-to-int-cast",
        "-ferror-limit=0", UWC,
    ]
    r = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
    return r.stdout + r.stderr


PAT = re.compile(
    r'uw\.c:(\d+):(\d+): error: (indirection requires pointer operand|'
    r'subscripted value is not an array)'
)


def find_names(log, lines):
    names = set()
    for lineno, col, kind in PAT.findall(log):
        lineno, col = int(lineno), int(col)
        line = lines[lineno - 1]
        before, after = line[:col - 1], line[col - 1:]
        name = None
        if 'indirection' in kind:
            m = re.match(r'\*\s*\(?\s*([A-Za-z_][A-Za-z0-9_]*)', after)
            if m:
                name = m.group(1)
        else:
            m = re.search(r'([A-Za-z_][A-Za-z0-9_]*)\s*$', before)
            if m:
                name = m.group(1)
        if name and re.match(r'^_?(DAT|PTR|UNK)_[0-9a-fA-F]+$', name):
            names.add(name)
    return names


def main():
    total_fixed = set()
    for iteration in range(8):
        log = compile_errors()
        with open(UWC, encoding="utf-8") as f:
            lines = f.readlines()
        names = find_names(log, lines)
        names -= total_fixed
        if not names:
            sys.stderr.write(f"[iter {iteration}] no more pointer-shaped "
                              f"globals to retype.\n")
            break

        decl_re = re.compile(
            r'^([A-Za-z_][A-Za-z0-9_ ]*?)\s+(\**)(' +
            '|'.join(re.escape(n) for n in names) + r');$', re.M
        )
        src = "".join(lines)

        def _repl(m, _seen=total_fixed):
            name = m.group(3)
            _seen.add(name)
            return f"char *{name};"

        new_src, n = decl_re.subn(_repl, src)
        sys.stderr.write(f"[iter {iteration}] retyped {n} globals to char*: "
                          f"{sorted(names)}\n")
        if n == 0:
            sys.stderr.write("  (declaration(s) not found -- stopping)\n")
            break
        with open(UWC, "w", encoding="utf-8") as f:
            f.write(new_src)
    else:
        sys.stderr.write("Reached max iterations.\n")

    sys.stderr.write(f"Total globals retyped: {len(total_fixed)}\n")


if __name__ == "__main__":
    main()
