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
    "1044": dict(
        # memcpy/memmove-shaped: (dest, src, n) at the overwhelming
        # majority of call sites -- used pervasively to move loaded
        # resource data into runtime buffers. Was a no-op generic stub
        # until identified; that silently skipped nearly all in-game data
        # copying while file loads still reported success, which is why
        # things "loaded" but nothing downstream worked. A few call sites
        # (Ghidra) drop the size argument -- K&R + defensive guard here,
        # same pattern as 1041/1063. memmove, not memcpy: at least one call
        # site shifts a struct array by a fixed stride and dest/src ranges
        # can overlap.
        retpart="void *",
        krname="Ordinal_1044(dest, src, n)\nvoid *dest;\nvoid *src;\nunsigned int n;",
        body="    if (dest == 0 || src == 0 || n == 0 || n > (64u * 1024u * 1024u)) return dest;\n"
             "    memmove(dest, src, n);\n"
             "    return dest;",
    ),
    # 1113/1114/1065/1070/1068/1102 are the real C runtime (fopen/fscanf/
    # strcmp/strncmp/strlen/vprintf-to-log) exposed directly by coredll,
    # used by the game's own text script parser (conversation/cutscene
    # scripts with BEGIN/VERSION/NAMES/POINTS blocks -- format strings
    # like "%100s%1s" and "BEGIN"/"NAMES" are recovered string constants
    # in uw.c right next to these call sites) rather than going through
    # the CreateFile/ReadFile-style wrappers. Confirmed by call shape at
    # every site across the whole file, not just this one parser -- e.g.
    # Ordinal_1068 alone has 46 call sites, all single-string-argument.
    # Real implementations, not just this parser's fix, since a no-op
    # stub here silently broke every caller (fatal-erroring on the very
    # first script load) while looking like an unrelated hang/crash
    # elsewhere.
    "1118": dict(
        # fclose-shaped: the only call site closes the handle Ordinal_1113
        # (fopen) opened.
        proto="int Ordinal_1118(void *f)",
        body="    if (f == 0) return 0;\n"
             "    return fclose((FILE *)f);",
    ),
    "1064": dict(
        # strchr-shaped: every one of its 10 call sites passes a small
        # constant (0x40='@', 10='\n', 0x20=' ', 0x30='0', 0x26='&',
        # 0x5f='_', 0x5c='\\') as the second argument -- ASCII character
        # codes, not sizes/flags. Several callers then WRITE through the
        # returned pointer (e.g. FUN_0006bde0: finds the '0' placeholder
        # in a template filename and overwrites it with a real digit,
        # the same digit-substitution pattern as other resource-name
        # building elsewhere in this file) -- a no-op stub returning 0
        # unconditionally meant every one of those was a guaranteed NULL
        # dereference the first time this ran.
        proto="char *Ordinal_1064(const char *s, int c)",
        body="    if (s == 0) return 0;\n"
             "    return strchr(s, c);",
    ),
    "184": dict(
        # GetDiskFreeSpace-shaped: (path, flags, out_struct, out_free_lo).
        # The only call site (FUN_0006bb64) checks out_free_lo against a
        # ~620KB threshold to decide "enough disk space to save" -- a
        # no-op stub here (returning 0 = failure) made every save-game
        # disk-space check report failure unconditionally, hard-erroring
        # the game at startup. Real disk space on a modern host is
        # never the constraint this was checking for, so just report a
        # large free-space number rather than querying the real
        # filesystem.
        proto="int Ordinal_184(void *path, unsigned int flags, void *out_struct, unsigned int *out_free_lo)",
        body="    (void)path; (void)flags; (void)out_struct;\n"
             "    if (out_free_lo) *out_free_lo = 0x7fffffff;\n"
             "    return 1;",
    ),
    "1054": dict(
        # realloc-shaped: (existing_ptr_or_null, new_size) -> new_ptr,
        # consistent across all 4 call sites (growing arrays by a fixed
        # per-element size as a counter increments). Was a no-op stub
        # returning 0 unconditionally, which every caller treats as
        # allocation failure -> fatal error, so this was 100% fatal the
        # first time any of these growable arrays was touched.
        proto="void *Ordinal_1054(void *ptr, unsigned int size)",
        body="    if (size == 0) return ptr;\n"
             "    return realloc(ptr, size);",
    ),
    "1113": dict(
        proto="void *Ordinal_1113(void *path, void *mode)",
        body="    return uw_file_fopen((const char *)path, (const char *)mode);",
    ),
    "1114": dict(
        proto="int Ordinal_1114(void *f, const char *fmt, ...)",
        body="    if (f == 0 || fmt == 0) return -1;\n"
             "    va_list ap;\n"
             "    va_start(ap, fmt);\n"
             "    int r = vfscanf((FILE *)f, fmt, ap);\n"
             "    va_end(ap);\n"
             "    return r;",
    ),
    "1065": dict(
        # A handful of call sites pass int-typed operands (Ghidra) rather
        # than the char* every other site uses; -Wno-int-conversion lets
        # those compile as implicit int->pointer, matching what the
        # original 32-bit ABI did for free.
        proto="int Ordinal_1065(const char *a, const char *b)",
        body="    if (a == 0 || b == 0) return -1;\n"
             "    return strcmp(a, b);",
    ),
    "1070": dict(
        proto="int Ordinal_1070(const char *a, const char *b, unsigned int n)",
        body="    if (a == 0 || b == 0) return -1;\n"
             "    return strncmp(a, b, n);",
    ),
    "1068": dict(
        # Several call sites drop the argument entirely (Ghidra) -- K&R
        # here too. A garbage/missing pointer read as a result is a real
        # (if narrow) crash risk, same class as 1041/1063's dropped-arg
        # sites, but leaving this a no-op broke all 46 call sites outright
        # (e.g. FUN_0005b36c/FUN_00041aac's NAMES-block parser advancing
        # a cursor by strlen()+1 through a buffer -- always advancing by
        # just 1 when this returned 0 unconditionally).
        retpart="unsigned int ",
        krname="Ordinal_1068(s)\nconst char *s;",
        body="    if (s == 0) return 0;\n"
             "    return (unsigned int)strlen(s);",
    ),
    "1102": dict(
        # In-game parse-error logger (format strings like "error: %s,%c",
        # "Too many points (%d)"); no in-game dialog to route this to, so
        # send it to stderr alongside the rest of this port's diagnostics.
        proto="void Ordinal_1102(const char *fmt, ...)",
        body="    if (fmt == 0) return;\n"
             "    va_list ap;\n"
             "    fprintf(stderr, \"[game] \");\n"
             "    va_start(ap, fmt);\n"
             "    vfprintf(stderr, fmt, ap);\n"
             "    va_end(ap);\n"
             "    fprintf(stderr, \"\\n\");",
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
    source = ['#include "ordinal_stubs.h"', '#include "file_io.h"', '#include <stdio.h>',
               '#include <stdlib.h>', '#include <string.h>', '#include <stdarg.h>',
               "", "void uw_pump_events(void);", ""]

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
