#!/usr/bin/env python3
"""fix_stack_copy_loops.py gave each broken '(&stackXXXX)[(int)ptr]' copy
loop its own dedicated scratch buffer, which was enough to stop the wild
write / compile, but runtime testing showed many of these loops are
actually copying INTO a real, already-declared local buffer that the
code uses immediately afterward (e.g. `Ordinal_1063(acStack_110, ...)`,
a strcat-shaped call, appending onto what the copy loop just wrote) --
Ghidra's confused indexing was pointing at that real buffer, not asking
for a fresh one. Find every 'stackXXXX_ptr = stackXXXX_buf;' reset line,
look at the next few lines for a call using a *different* local array as
its first argument, and if found, redirect the reset to point at that
buffer instead (and drop the now-unused dedicated backing array/pointer
decl if nothing else still uses it).
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"

RESET_RE = re.compile(r'^(\s*)(stack0x[0-9a-fA-F]+)_ptr = \2_buf;\s*$')
CALL_RE = re.compile(r'^\s*\w*\s*=?\s*\w+\((\w+)\s*,')


def main():
    with open(UWC, encoding='utf-8') as f:
        lines = f.readlines()

    redirected = 0
    unresolved = 0

    for i, line in enumerate(lines):
        m = RESET_RE.match(line)
        if not m:
            continue
        indent, name = m.groups()
        # look ahead up to 6 lines (past the do{...}while loop) for a call
        # whose first arg is a plausible *different* local buffer name
        target = None
        for j in range(i + 1, min(i + 8, len(lines))):
            cm = CALL_RE.match(lines[j])
            if cm:
                candidate = cm.group(1)
                if re.match(r'^(ac|au|local_)\w+$', candidate):
                    target = candidate
                    break
            if lines[j].strip() == '':
                continue
        if target:
            lines[i] = f"{indent}{name}_ptr = {target};\n"
            redirected += 1
        else:
            unresolved += 1

    with open(UWC, 'w', encoding='utf-8') as f:
        f.writelines(lines)

    sys.stderr.write(f"refix_stack_copy_loops: redirected {redirected}, "
                      f"left as-is {unresolved}\n")


if __name__ == "__main__":
    main()
