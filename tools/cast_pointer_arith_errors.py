#!/usr/bin/env python3
"""Iteratively wrap the exact operand clang flags in
'invalid operands to binary expression (char * and int)'-style errors with
an explicit (int) cast. These come from locals that legitimately hold a
pointer value in one part of a function and get reused as a plain integer
elsewhere (Ghidra register/slot reuse) -- after retype_pointers.py /
retype_locals_from_ptr_globals.py widened their declaration for the
pointer-holding use, the purely-arithmetic uses need an explicit int cast.
Uses clang's precise line:column per error to target only the flagged
token, so unrelated valid pointer arithmetic on the same variable elsewhere
in the function is left alone.
"""
import re
import subprocess
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"

CFLAGS = ["-fsyntax-only", "-std=gnu11", "-Wno-implicit-function-declaration",
          "-Wno-int-conversion", "-Wno-int-to-pointer-cast", "-Wno-pointer-to-int-cast",
          "-Wno-incompatible-function-pointer-types", "-ferror-limit=0"]

ERR_RE = re.compile(
    r"uw\.c:(\d+):(\d+): error: invalid operands to binary expression "
    r"\('([^']*)' and '([^']*)'\)"
)
IDENT_RE = re.compile(r'(?<![0-9])[A-Za-z_][A-Za-z0-9_]*')


def compile_errors():
    r = subprocess.run(["clang"] + CFLAGS + [UWC], cwd=ROOT, capture_output=True, text=True)
    return r.stdout + r.stderr


def main():
    for iteration in range(10):
        log = compile_errors()
        matches = ERR_RE.findall(log)
        if not matches:
            sys.stderr.write("No more pointer/int binary-op errors.\n")
            break

        with open(UWC, encoding='utf-8') as f:
            lines = f.readlines()

        # group edits per line, apply right-to-left by column so offsets stay valid
        edits_by_line = {}
        skipped = 0
        for lineno, col, t1, t2 in matches:
            lineno, col = int(lineno), int(col)
            line = lines[lineno - 1]
            op_pos = col - 1  # 0-indexed position of the binary operator
            if '*' in t1 and '*' not in t2:
                # left operand (before the operator) is the pointer
                before = line[:op_pos]
                m = re.search(r'(?<![0-9])([A-Za-z_][A-Za-z0-9_]*)\s*$', before)
                if not m:
                    skipped += 1
                    continue
                ident = m.group(1)
                start, end = m.start(1), m.end(1)
            elif '*' in t2 and '*' not in t1:
                # right operand (after the operator) is the pointer
                after = line[op_pos:]
                m = re.search(r'([A-Za-z_][A-Za-z0-9_]*)', after)
                if not m:
                    skipped += 1
                    continue
                ident = m.group(1)
                start, end = op_pos + m.start(1), op_pos + m.end(1)
            else:
                skipped += 1
                continue
            edits_by_line.setdefault(lineno, []).append((start, end, ident))

        applied = 0
        for lineno, edits in edits_by_line.items():
            line = lines[lineno - 1]
            # dedupe identical spans, apply right-to-left
            edits = sorted(set(edits), key=lambda x: -x[0])
            for start, end, ident in edits:
                # don't double-wrap
                prefix = line[:start]
                if prefix.rstrip().endswith('(int)'):
                    continue
                line = line[:start] + f"(int)({ident})" + line[end:]
                applied += 1
            lines[lineno - 1] = line

        with open(UWC, 'w', encoding='utf-8') as f:
            f.writelines(lines)

        sys.stderr.write(f"[iter {iteration}] applied {applied} casts, skipped {skipped}\n")
        if applied == 0:
            break
    else:
        sys.stderr.write("Reached max iterations.\n")


if __name__ == "__main__":
    main()
