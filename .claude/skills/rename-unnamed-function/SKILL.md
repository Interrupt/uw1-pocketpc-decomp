---
name: rename-unnamed-function
description: "Rename one Ghidra-generated FUN_xxxxxxxx function (and, if relevant, the globals/structs it touches) to a descriptive name, project-wide, in this uw1-pocketpc-decomp-cleanup repo. Used as a step inside refactor-unnamed-function, but can be invoked standalone when the user just wants one function named."
---

## Context

This repo is a Ghidra decompile of a WinCE ARM binary (Ultima Underworld 1
Pocket PC). Functions and some globals are still named `FUN_xxxxxxxx` /
`DAT_xxxxxxxx`. Declarations are K&R-style (non-prototype): `void
foo(param_1,param_2)` on one line, types on following lines, no types in
the parens.

## Find the next candidate (if not already given one)

```
grep -nE "^(void|undefined4|undefined2|undefined1|undefined|int|short|byte|uint|ushort|char|bool|double|float) FUN_[0-9a-f]+\(" uw.c | head -20
```

Prefer a function physically adjacent to one you just finished — related
functions tend to cluster together in the original binary, which makes
the whole batch's "home" (destination `src/*.c` file) obvious at once.

## Investigate before naming

1. `Read` the full function body in `uw.c`.
2. Trace its callers: `grep -n "FUN_xxxxxxxx" uw.c` (and `src/*.c` if any
   extraction has already touched this area) to see how/where it's
   invoked — call-site context is often the strongest naming signal.
3. Trace its own callees the same way, to understand what primitives it's
   built from (e.g. calls to `Ordinal_NNNN` hint at a Win32 API shape —
   check the ordinal against known WinCE imports if the name isn't
   already annotated).
4. Look for adjacent already-named functions — decompiled output
   generally preserves source order, so a named neighbor is strong
   evidence for what cluster/subsystem this one belongs to.
5. Only name it when you have concrete evidence (body logic + call sites
   + neighbors), never a guess from the function's shape alone. If you
   genuinely can't tell, it's fine to give a conservative structural name
   (e.g. `reset_x_state`) rather than overclaiming domain knowledge you
   don't have.

Apply the same rigor to any `DAT_xxxxxxxx` globals the function leans on
hard enough that naming it clarifies the function — but don't go naming
unrelated globals as a side quest.

## Rename

Use `Edit` on the function's own definition site in `uw.c`, in one call:
replace the old signature with a `// was FUN_xxxxxxxx -- <one or a few
line comment explaining what evidence grounds the new name>` comment
immediately above the new signature. Keep the comment factual (what it
does, what evidence supports it) — not a narration of your process.

Example of the shape to produce:
```c
// was FUN_0004ee60 -- applies the MOD tracker's "tone portamento"
// effect to channel param_2: slides its current period (+0xc) toward
// a target period (+0x1c) by one step (+0x20)...
void apply_mod_tone_portamento(param_1,param_2)
int param_1;
int param_2;
{
```

## Propagate the rename project-wide

Write a one-off Python script to the scratchpad directory (never `/tmp`)
that:
- Opens `uw.c`, `uw.h`, every `src/*.c`, every `src/headers/*.h`
- Does a whole-word regex substitution of the old name to the new name
  on every line **except** lines starting with `// was` or `/* was`
  (these are historical evidence comments and must never be rewritten —
  this is the guard that stops the rename script from corrupting its own
  trail)
- Only rewrites files that actually changed

Run it, then verify with:
```
grep -rn "FUN_xxxxxxxx" uw.c uw.h src/*.c src/headers/*.h | grep -v "// was\|/\* was"
```
This must come back empty. If it doesn't, something (a comment, a string,
a stray reference) still needs handling before moving on.

When renaming more than one function in the same pass (e.g. two tightly
paired effects like vibrato/tremolo), put both `old -> new` pairs in the
same rename dict and run the script once — cheaper and avoids redundant
file rewrites.

## Done condition

Zero bare `FUN_xxxxxxxx` references to this function remain outside `//
was` comments, in every file. Hand off to `find-home-for-function` next
if the caller is doing the full `refactor-unnamed-function` flow.
