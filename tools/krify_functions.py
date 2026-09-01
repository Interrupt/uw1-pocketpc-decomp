#!/usr/bin/env python3
"""Convert every FUN_xxxxxxxx definition (and its uw.h prototype) from a
strict ANSI parameter list to old-style K&R syntax. This makes argument
COUNT/TYPE checking at call sites go away entirely (K&R "unspecified
parameters" declarations aren't checked), which is required because this
Ghidra dump has pervasive genuine call-site/signature argcount mismatches
(Ghidra recovers a different apparent arity at different call sites for the
same external-looking symbol). The function body still gets its named
parameters via the K&R parameter-type-list clause, so nothing inside the
body needs to change.
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"
UWC = f"{ROOT}/uw.c"
UWH = f"{ROOT}/uw.h"

SIG_RE = re.compile(
    r'^([A-Za-z_][A-Za-z0-9_ ]*?)\s*(\**)\s*(FUN_[0-9a-f]+)\(([^)]*)\)', re.M
)


def split_params(params):
    params = params.strip()
    if params == '' or params == 'void':
        return []
    parts = [p.strip() for p in params.split(',')]
    out = []
    for p in parts:
        m = re.match(r'^(.*?)\s*(\**)\s*([A-Za-z_][A-Za-z0-9_]*)$', p)
        if not m:
            raise ValueError(f"unparsable param: {p!r}")
        base_type, stars, name = m.groups()
        full_type = f"{base_type.strip()} {stars}".strip()
        out.append((full_type, name))
    return out


def krify_header():
    with open(UWH, encoding="utf-8") as f:
        hdr = f.read()

    def _repl(m):
        rettype, retstars, name, params = m.groups()
        return f"{rettype.strip()} {retstars}{name}()"

    # Only lines ending in ';' are prototypes.
    proto_re = re.compile(SIG_RE.pattern + r'\s*;', re.M)
    new_hdr, n = proto_re.subn(lambda m: _repl(m) + ';', hdr)
    with open(UWH, "w", encoding="utf-8") as f:
        f.write(new_hdr)
    sys.stderr.write(f"krify_header: rewrote {n} prototypes\n")


def krify_source():
    with open(UWC, encoding="utf-8") as f:
        src = f.read()

    # Only match definitions: signature immediately followed by blank
    # line(s) and then a '{' at column 0 (not ';').
    def_re = re.compile(
        SIG_RE.pattern + r'\n\n\{', re.M
    )

    count = [0]

    def _repl(m):
        rettype, retstars, name, params = m.groups()
        try:
            plist = split_params(params)
        except ValueError as e:
            sys.stderr.write(f"  SKIP {name}: {e}\n")
            return m.group(0)
        count[0] += 1
        names = ",".join(n for _, n in plist)
        decls = "".join(f"{t} {n};\n" for t, n in plist)
        return f"{rettype.strip()} {retstars}{name}({names})\n{decls}\n{{"

    new_src = def_re.sub(_repl, src)
    with open(UWC, "w", encoding="utf-8") as f:
        f.write(new_src)
    sys.stderr.write(f"krify_source: rewrote {count[0]} function definitions\n")


if __name__ == "__main__":
    krify_header()
    krify_source()
