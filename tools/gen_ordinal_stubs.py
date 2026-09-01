#!/usr/bin/env python3
"""Generate ordinal_stubs.h / ordinal_stubs.c covering every Ordinal_N the
game calls. A handful are load-bearing coredll.dll primitives (memory
alloc/free/set, window creation, single-instance check, registry open,
message pump) and get real, properly-typed implementations. Everything else
gets a generic K&R-style (unspecified args) stub that ignores its arguments
and returns 0 -- safe on the arm64 ABI since the callee never touches the
argument registers it doesn't name.
"""
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"

with open(f"{ROOT}/tools/all_ordinals.txt") as f:
    all_nums = [l.strip() for l in f if l.strip()]

SPECIAL = {
    # 1041 and 1018 have call sites where Ghidra dropped the argument
    # entirely (the recompiled call literally passes nothing), so a strict
    # prototype can't be used -- fall back to K&R (unspecified args) and
    # treat a missing/garbage argument defensively rather than trusting it.
    "1041": dict(
        retpart="void *",
        krname="Ordinal_1041(size)\nunsigned int size;",
        body="    if (size == 0 || size > (64u * 1024u * 1024u)) size = 4096;\n"
             "    return malloc(size);",
    ),
    # 1041/1047/1018 (malloc/memset/free) are hot-path -- called hundreds of
    # times during startup alone -- so they deliberately don't log; it would
    # just be noise.
    "1047": dict(
        proto="void *Ordinal_1047(void *ptr, int val, unsigned int n)",
        body="    if (ptr) memset(ptr, val, n);\n    return ptr;",
    ),
    "1018": dict(
        retpart="void ",
        krname="Ordinal_1018(ptr)\nvoid *ptr;",
        body="    /* deliberately a leak, not free(ptr): several call sites\n"
             "       have no argument expression at all (Ghidra dropped it),\n"
             "       so ptr may be garbage -- freeing it would be a likely\n"
             "       crash. Leaking for the life of this short-lived stub\n"
             "       process is harmless. */\n"
             "    (void)ptr;",
    ),
    "246": dict(
        # coredll CreateWindow-shaped: (hwndParent, title1, title2, style).
        proto="void *Ordinal_246(void *a, void *b, void *c, unsigned int d)",
        body="    (void)a; (void)b; (void)c; (void)d;\n"
             "    fprintf(stderr, \"[ordinal] Ordinal_246: CreateWindow-shaped call, "
             "returning a fake non-null HWND (real window comes from GXOpenDisplay)\\n\");\n"
             "    return (void *)1; /* fake non-null HWND */",
    ),
    "286": dict(
        # Single-instance check, called once at startup with two title
        # strings: FindWindow/CreateMutex-shaped, 0 == "no existing
        # instance, proceed".
        proto="int Ordinal_286(void *a, void *b)",
        body="    (void)a; (void)b;\n"
             "    fprintf(stderr, \"[ordinal] Ordinal_286: single-instance check, "
             "reporting no existing instance\\n\");\n"
             "    return 0; /* no existing instance / success */",
    ),
    "461": dict(
        # RegOpenKeyEx-shaped: (HKEY, subkey path, reserved, out result).
        # Called with HKEY_LOCAL_MACHINE (0x80000002) to read an install
        # path. IMPORTANT: report success (0) here, not failure -- the
        # caller's "success" branch does a clean bounded copy out of a
        # zeroed, correctly-sized local stack buffer, while its "registry
        # unavailable" fallback branch has a hardcoded absolute byte offset
        # (e.g. `pcVar9[0x1b54a4] = cVar2`) that only made sense relative to
        # the original binary's fixed static layout -- in a freshly linked
        # recompile it's a wild out-of-bounds write and reliably segfaults.
        proto="int Ordinal_461(unsigned int hkey, void *subkey, unsigned int reserved, void *result)",
        body="    (void)hkey; (void)subkey; (void)reserved; (void)result;\n"
             "    fprintf(stderr, \"[ordinal] Ordinal_461: RegOpenKeyEx-shaped call, "
             "reporting success so the game takes its safe bounded-copy path "
             "instead of a hardcoded-offset fallback that segfaults when recompiled\\n\");\n"
             "    return 0;",
    ),
    "1063": dict(
        # strcat-shaped: every multi-arg call site is (dest, src) building
        # up a path piece by piece (e.g. install dir + "\DATA\" +
        # "filename"). One call site drops the src argument entirely
        # (Ghidra), hence K&R here too -- a missing src degrades to a
        # no-op instead of touching dest.
        retpart="char *",
        krname="Ordinal_1063(dest, src)\nchar *dest;\nchar *src;",
        body="    if (dest && src) strcat(dest, src);\n"
             "    return dest;",
    ),
    "864": dict(
        # PeekMessage-shaped: (MSG*, hwndFilter, min, max, PM_REMOVE).
        # Confirmed by the caller checking msg.message == 0x12 (WM_QUIT).
        proto="int Ordinal_864(void *msg, void *hwndFilter, unsigned int wMsgFilterMin, "
              "unsigned int wMsgFilterMax, unsigned int wRemoveMsg)",
        body="    (void)msg; (void)hwndFilter; (void)wMsgFilterMin; (void)wMsgFilterMax; (void)wRemoveMsg;\n"
             "    uw_pump_events();\n"
             "    return 0; /* always report \"no message pending\": the caller\n"
             "                 branches on the message contents only when this\n"
             "                 is nonzero, and we drive input/quit directly from\n"
             "                 uw_pump_events() instead of faking a MSG struct. */",
    ),
}


def main():
    header = ["#ifndef ORDINAL_STUBS_H", "#define ORDINAL_STUBS_H", "", "void uw_pump_events(void);", ""]
    source = ['#include "ordinal_stubs.h"', '#include <stdio.h>', '#include <stdlib.h>',
               '#include <string.h>', "", "void uw_pump_events(void);", ""]

    for n in all_nums:
        if n in SPECIAL:
            spec = SPECIAL[n]
            body = spec["body"]
            if "krname" in spec:
                retpart = spec['retpart']
                fname = spec['krname'].split('(')[0]
                header.append(f"{retpart}{fname}();")
                source.append(f"{retpart}{spec['krname']}\n{{\n{body}\n}}\n")
            else:
                proto = spec["proto"]
                header.append(f"{proto};")
                source.append(f"{proto}\n{{\n{body}\n}}\n")
        else:
            header.append(f"long Ordinal_{n}();")
            source.append(f"long Ordinal_{n}()\n{{\n    return 0;\n}}\n")

    header.append("")
    header.append("#endif")

    with open(f"{ROOT}/ordinal_stubs.h", "w") as f:
        f.write("\n".join(header) + "\n")
    with open(f"{ROOT}/ordinal_stubs.c", "w") as f:
        f.write("\n".join(source) + "\n")

    sys.stderr.write(f"Generated {len(all_nums)} ordinal stubs "
                      f"({len(SPECIAL)} special, {len(all_nums)-len(SPECIAL)} generic)\n")


if __name__ == "__main__":
    main()
