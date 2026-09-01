#!/usr/bin/env python3
"""Iteratively resolve 'use of undeclared identifier' errors that fall into
known Ghidra-decompile patterns:
  - _DAT_xxxxxxxx / _PTR_xxxxxxxx / _UNK_xxxxxxxx : a wider (4-byte) access
    overlapping a narrower symbol of the same address suffix -> alias macro.
  - stackHxxxxxxxxx (e.g. stack0xffdc323c) : Ghidra couldn't correlate a raw
    stack slot with a named local in one function -> inject a local decl.
  - Ordinal_N_exref : reference to Ordinal_N used as a value/callback -> alias.
Run compile -> parse -> patch in a loop until no more matches are found.
"""
import re
import subprocess
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"
UWH = f"{ROOT}/uw.h"


def compile_errors():
    cmd = [
        "clang", "-fsyntax-only", "-std=gnu11",
        "-Wno-implicit-function-declaration", "-Wno-int-conversion",
        "-Wno-int-to-pointer-cast", "-Wno-pointer-to-int-cast",
        "-ferror-limit=0", UWC,
    ]
    r = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
    return r.stdout + r.stderr


UNDECL_RE = re.compile(r"uw\.c:(\d+):\d+: error: use of undeclared identifier '([A-Za-z_][A-Za-z0-9_]*)'")


def main():
    for iteration in range(6):
        log = compile_errors()
        matches = UNDECL_RE.findall(log)
        if not matches:
            sys.stderr.write("No more undeclared-identifier errors of tracked kinds.\n")
            break

        with open(UWC, encoding="utf-8") as f:
            lines = f.readlines()

        overlap_aliases = {}
        stack_by_func = {}
        exref_aliases = set()
        unresolved = set()

        for lineno, name in matches:
            lineno = int(lineno)
            if re.match(r'^_(DAT|PTR|UNK)_[0-9a-fA-F]+$', name):
                base = name[1:]
                overlap_aliases[name] = base
            elif re.match(r'^stack0x[0-9a-fA-F]+$', name):
                # Top-level function braces sit at column 0 with no leading
                # whitespace; nested block braces are always indented. Walk
                # back to the nearest column-0 '{' before the error line.
                k = lineno - 1
                brace_line = None
                while k >= 0:
                    if lines[k] == '{\n':
                        brace_line = k
                        break
                    if lines[k] == '}\n':
                        break  # hit end of an earlier function first
                    k -= 1
                if brace_line is not None:
                    stack_by_func.setdefault(brace_line, set()).add(name)
                else:
                    unresolved.add(name)
            elif re.match(r'^Ordinal_\d+_exref$', name):
                exref_aliases.add(name)
            else:
                unresolved.add(name)

        if unresolved:
            sys.stderr.write(f"[iter {iteration}] unresolved (manual review needed): "
                              f"{sorted(unresolved)}\n")

        if not overlap_aliases and not stack_by_func and not exref_aliases:
            break

        # Inject stack-local declarations, working from bottom of file up so
        # earlier line numbers stay valid as we insert.
        for brace_line in sorted(stack_by_func, reverse=True):
            decls = "".join(f"  unsigned int {n};\n" for n in sorted(stack_by_func[brace_line]))
            lines[brace_line] = lines[brace_line] + decls
        sys.stderr.write(f"[iter {iteration}] injected stack locals into "
                          f"{len(stack_by_func)} function(s): "
                          f"{sum(len(v) for v in stack_by_func.values())} names\n")

        src = "".join(lines)

        with open(UWC, "w", encoding="utf-8") as f:
            f.write(src)

        if overlap_aliases or exref_aliases:
            with open(UWH, encoding="utf-8") as f:
                hdr = f.read()
            marker = "/* --- auto-generated overlap/exref aliases --- */\n"
            existing = set(re.findall(r'#define (\S+)', hdr))
            new_defines = []
            for name, base in sorted(overlap_aliases.items()):
                if name not in existing:
                    new_defines.append(f"#define {name} (*(uint*)&{base})")
                    existing.add(name)
            for name in sorted(exref_aliases):
                base = name[:-len('_exref')]
                if name not in existing:
                    new_defines.append(f"#define {name} ((void*)&{base})")
                    existing.add(name)
            if new_defines:
                block = marker + "\n".join(new_defines) + "\n"
                if marker in hdr:
                    hdr = hdr.replace(marker, block, 1)
                else:
                    hdr = hdr + "\n" + block
                with open(UWH, "w", encoding="utf-8") as f:
                    f.write(hdr)
                sys.stderr.write(f"[iter {iteration}] added {len(new_defines)} "
                                  f"alias #defines to uw.h\n")

    else:
        sys.stderr.write("Reached max iterations.\n")


if __name__ == "__main__":
    main()
