#!/usr/bin/env python3
"""One-shot mechanical repair pass over uw.c/uw.h:
 1. Dedupe conflicting top-level tentative global declarations (DAT_/PTR_/UNK_/...).
 2. Strip the broken self-recursive Ordinal_N() bodies out of uw.c and their
    prototypes out of uw.h (real stubs are supplied separately in ordinal_stubs.c/.h).
Idempotent: safe to re-run against the pristine baseline.
"""
import re
import sys

ROOT = "/Users/ccuddigan/Projects/UW1/decomp/source2"

def dedupe_globals(src: str) -> str:
    decl_re = re.compile(
        r'^([A-Za-z_][A-Za-z0-9_ ]*?)\s+(\**)([A-Za-z_][A-Za-z0-9_]*)(\[[^\]]*\])?;\s*$'
    )
    # Only symbols that look like Ghidra auto-generated globals get deduped;
    # never touch ordinary hand-written-looking declarations.
    auto_prefixes = ("DAT_", "PTR_", "UNK_", "_DAT_", "s_", "u_", "s__")
    seen = set()
    out_lines = []
    removed = 0
    for line in src.split("\n"):
        m = decl_re.match(line)
        if m:
            name = m.group(3)
            if name.startswith(auto_prefixes) and re.search(r'_[0-9a-f]{4,8}$', name):
                if name in seen:
                    removed += 1
                    continue
                seen.add(name)
        out_lines.append(line)
    sys.stderr.write(f"dedupe_globals: removed {removed} duplicate declarations\n")
    return "\n".join(out_lines)


ORDINAL_DEF_RE = re.compile(
    r'\n\n\n(?:[A-Za-z_][A-Za-z0-9_ \*]*?)\bOrdinal_(\d+)\((?:void)?\)\n\n\{\n(?:.*?\n)*?\}\n',
)


def strip_ordinal_bodies(src: str):
    numbers = []

    def _repl(m):
        numbers.append(m.group(1))
        return "\n"

    new_src, n = ORDINAL_DEF_RE.subn(_repl, src)
    sys.stderr.write(f"strip_ordinal_bodies: removed {n} Ordinal_N definitions\n")
    return new_src, numbers


def strip_ordinal_protos(hdr: str):
    proto_re = re.compile(r'^void Ordinal_\d+\(void\);\n?', re.M)
    new_hdr, n = proto_re.subn('', hdr)
    sys.stderr.write(f"strip_ordinal_protos: removed {n} Ordinal_N prototypes\n")
    return new_hdr


ADDR_SUFFIX_RE = re.compile(r'_[0-9a-f]{6,8}$')


def fix_string_globals(src: str) -> str:
    """Ghidra's 'string'/'unicode' pseudo-types have no length/content in this
    dump; the symbol name itself encodes the (sanitized) original string
    content. Turn each `string NAME;` / `unicode NAME;` into a real
    initialized char/char16 array, sanitize NAME into a legal C identifier
    (many contain '.', '\\', '%', ':', etc.), and rename every other
    occurrence of the raw NAME in the file to match."""
    rename = {}
    used_idents = set()
    replacements = {}

    for c_type, prefix in (('char', 'string'), ('unsigned short', 'unicode')):
        decl_re = re.compile(r'^' + prefix + r' (.+);$', re.M)
        raw_names = decl_re.findall(src)
        sys.stderr.write(f"fix_string_globals: found {len(raw_names)} {prefix} globals\n")

        for raw in raw_names:
            ident = re.sub(r'[^A-Za-z0-9_]', '_', raw)
            base = ident
            i = 0
            while ident in used_idents:
                i += 1
                ident = f"{base}_{i}"
            used_idents.add(ident)
            rename[raw] = ident

            content = ADDR_SUFFIX_RE.sub('', raw)
            content = re.sub(r'^[su]_', '', content)
            escaped = content.replace('\\', '\\\\').replace('"', '\\"')
            lit = f'u"{escaped}"' if prefix == 'unicode' else f'"{escaped}"'
            replacements[raw] = f'{c_type} {ident}[] = {lit};'

        def _decl_repl(m, _repl=replacements):
            return _repl[m.group(1)]

        src = decl_re.sub(_decl_repl, src)

    # Then rename every remaining use-site occurrence, longest names first
    # to avoid any (unlikely) prefix-collision mistakes.
    for raw in sorted(rename, key=len, reverse=True):
        ident = rename[raw]
        if raw != ident:
            src = src.replace(raw, ident)

    return src


def remove_bogus_fun_vars(src: str) -> str:
    """Ghidra sometimes emits a stray `TYPE FUN_xxxxxxxx;` data declaration
    for an address that is *also* a real function definition (it analyzed
    the address as data before/after recognizing it as code). Drop the
    bogus data declaration wherever a real function definition exists."""
    decl_re = re.compile(r'^\w[\w ]* (FUN_[0-9a-f]+);\n', re.M)
    func_def_re = re.compile(r'^[A-Za-z_][A-Za-z0-9_ \*]*\b(FUN_[0-9a-f]+)\(', re.M)
    real_funcs = set(func_def_re.findall(src))

    removed = []

    def _repl(m):
        name = m.group(1)
        if name in real_funcs:
            removed.append(name)
            return ''
        return m.group(0)

    new_src = decl_re.sub(_repl, src)
    sys.stderr.write(f"remove_bogus_fun_vars: removed {len(removed)} bogus data decls\n")
    return new_src


def main():
    with open(f"{ROOT}/uw.c", encoding="utf-8", errors="replace") as f:
        src = f.read()
    with open(f"{ROOT}/uw.h", encoding="utf-8", errors="replace") as f:
        hdr = f.read()

    src = dedupe_globals(src)
    src, removed_numbers = strip_ordinal_bodies(src)
    hdr = strip_ordinal_protos(hdr)
    src = fix_string_globals(src)
    src = remove_bogus_fun_vars(src)

    with open(f"{ROOT}/uw.c", "w", encoding="utf-8") as f:
        f.write(src)
    with open(f"{ROOT}/uw.h", "w", encoding="utf-8") as f:
        f.write(hdr)

    with open(f"{ROOT}/tools/removed_ordinals.txt", "w") as f:
        f.write("\n".join(sorted(set(removed_numbers), key=int)))
    sys.stderr.write(f"Removed ordinal numbers written to tools/removed_ordinals.txt "
                      f"({len(set(removed_numbers))} unique)\n")


if __name__ == "__main__":
    main()
