#!/usr/bin/env python3
"""Some FUN_ functions are declared 'void' but callers use their result as
a value -- Ghidra failed to recognize a return value at the function's own
definition site even though callers clearly expect one. Retype them to
'undefined4' (both header prototype and uw.c definition) and turn their
body's bare 'return;' statements into 'return 0;' so the new signature
still compiles.
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"
UWH = f"{ROOT}/uw.h"

NAMES = [
    "FUN_000227d4", "FUN_00057a70", "FUN_00068138", "FUN_00045054",
    "FUN_00022850", "FUN_00019aa0", "FUN_0002273c", "FUN_00022810",
    "FUN_000528a8", "FUN_0004b600", "FUN_000571c0", "FUN_00040cd4",
    "FUN_0002822c", "FUN_00081d74", "FUN_00052d24", "FUN_00057a78",
    "FUN_0001dc04", "FUN_00041a78", "FUN_0007f208", "FUN_0007f290",
    "FUN_00011478", "FUN_0002431c", "FUN_00041910", "FUN_00041960",
    "FUN_00041990", "FUN_000419c8", "FUN_00045708", "FUN_000570b4",
    "FUN_0005b298", "FUN_000703a0", "FUN_0007d074",
]


def fix_header():
    with open(UWH, encoding="utf-8") as f:
        hdr = f.read()
    n = 0
    for name in NAMES:
        new_hdr, k = re.subn(rf'^void {name}\(\);$', f'undefined4 {name}();',
                              hdr, flags=re.M)
        hdr = new_hdr
        n += k
    with open(UWH, "w", encoding="utf-8") as f:
        f.write(hdr)
    sys.stderr.write(f"fix_void_returns: retyped {n} header prototypes\n")


def fix_source():
    with open(UWC, encoding="utf-8") as f:
        lines = f.readlines()

    fixed_defs = 0
    fixed_returns = 0
    i = 0
    while i < len(lines):
        m = None
        for name in NAMES:
            if re.match(rf'^void {re.escape(name)}\(', lines[i]):
                m = name
                break
        if m:
            lines[i] = lines[i].replace('void ', 'undefined4 ', 1)
            fixed_defs += 1
            # walk forward to the matching column-0 '{' then '}' to bound the body
            j = i + 1
            while j < len(lines) and lines[j] != '{\n':
                j += 1
            depth = 0
            k = j
            body_end = None
            while k < len(lines):
                if lines[k] == '{\n':
                    depth += 1
                elif lines[k] == '}\n':
                    depth -= 1
                    if depth == 0:
                        body_end = k
                        break
                k += 1
            if body_end is not None:
                for b in range(j, body_end + 1):
                    if re.search(r'\breturn;\s*$', lines[b]):
                        lines[b] = re.sub(r'\breturn;', 'return 0;', lines[b])
                        fixed_returns += 1
        i += 1

    with open(UWC, "w", encoding="utf-8") as f:
        f.writelines(lines)
    sys.stderr.write(f"fix_void_returns: retyped {fixed_defs} definitions, "
                      f"fixed {fixed_returns} bare return statements\n")


if __name__ == "__main__":
    fix_header()
    fix_source()
