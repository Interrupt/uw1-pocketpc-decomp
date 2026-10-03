---
name: find-home-for-function
description: "Decide which src/*.c file a newly-renamed function belongs in, then physically extract it out of uw.c into that file in this uw1-pocketpc-decomp-cleanup repo, fixing up any cross-TU dependencies that extraction exposes. Used as a step inside refactor-unnamed-function after rename-unnamed-function, but can be invoked standalone for a function that's already named."
---

## Context

The repo's standing cleanup goal groups functions into `src/*.c` files by
functionality, with headers in `src/headers/*.h`, and `uw.h` as the
shared cross-TU extern/macro surface. Eventually only main-entry/setup
code remains in `uw.c`/`uw.h`.

## Pick (or create) the destination file

Match the function's subsystem to an existing `src/*.c` file first —
check `ls src/*.c` and skim the file if its scope is unclear. Established
categories so far include (not exhaustive — check current `ls src/`):
`game.c`, `bitmap.c`, `3d.c`, `math.c`, `automap.c`, `inventory.c`,
`player.c`, `tmap.c`, `objects.c`, `object_actions.c`, `title_screen.c`,
`combat.c`, `babl.c`, `audio.c`, `hud.c`, `containers.c`, `item_use.c`,
`saveload.c`, `traps.c`, `ai.c`, `weapon_swing.c`, `text.c`.

Only create a new `src/<name>.c` when nothing existing fits — e.g.
`src/math.c` was created fresh this session for a trig/angle cluster
that had no prior home. When creating a new file, give it a matching
header in `src/headers/<name>.h` only if other files will need to call
into it; a self-contained cluster with no external callers doesn't need
one yet.

A tightly-coupled group of functions (e.g. a dispatcher and its
handlers, or two paired effects like vibrato/tremolo) should move
together in the same extraction, even if named in separate
`rename-unnamed-function` steps — don't split a cluster across passes
just because naming happened incrementally.

## Determine exact extraction boundaries

```
grep -n "^// was FUN_xxxxxxxx\|^void new_function_name\|^void FUN_<next_one>" uw.c
```
Read around the tail to find the exact closing `}` line, and confirm
where the *next* function starts so you know the boundary is clean (no
accidentally-included blank lines belonging to the next function, no
truncated last line).

## Extract

Write a one-off Python script to the scratchpad directory:

```python
#!/usr/bin/env python3
start, end = <first line of the "// was" comment>, <closing brace line>
with open('uw.c') as f:
    lines = f.readlines()

chunk = lines[start-1:end]
joined = ''.join(chunk)
assert 'void new_function_name(' in joined
assert chunk[0].startswith('// was FUN_xxxxxxxx')
assert chunk[-1].rstrip('\n') == '}'

remaining = lines[:start-1] + lines[end:]
with open('uw.c', 'w') as f:
    f.writelines(remaining)

with open('src/destination.c', 'a') as f:
    f.write('\n\n')
    f.writelines(chunk)
```

The assertions matter: the script builds everything in memory and only
writes at the very end, so a failed assertion means nothing was touched
and you can safely fix the line range and rerun — this has happened
before (off-by-one line counts) and is harmless when caught this way.

Run it, then verify both boundaries by eye:
```
sed -n '<a few lines before start>,<start+2>p' uw.c   # clean gap, no stray lines
tail -40 src/destination.c                              # chunk landed intact
```

## Fix up cross-TU dependencies

The function likely references globals/macros that were `static` or
file-local to `uw.c`. Check:
```
clang -fsyntax-only -I. -Isrc/headers src/destination.c -ferror-limit=300 2>&1 | grep "undeclared identifier"
```
(Ignore unrelated pre-existing `-Wint-conversion` errors this stricter
invocation surfaces elsewhere in the file — the real build uses looser
flags; cross-check against `cmake --build` if unsure whether something
is pre-existing.)

For each undeclared identifier:
- If it's a function still in `uw.c`: add an `extern` prototype (or just
  rely on the existing forward-declaration block in `uw.h` if one
  exists — check first).
- If it's a global `static` in `uw.c`: remove `static`, and if `uw.c`
  had a local `#define ALIAS real_name` for it, move that `#define` to
  `uw.h` instead of duplicating it.
- If it's a scalar being indexed like an array (`(&DAT_xxx)[i]` or
  pointer arithmetic past a single `undefined`/`undefined4` byte) — this
  is a recurring real bug class in this codebase, not just a missing
  declaration. Widen it to a properly-sized backing array sized to the
  maximum observed index, e.g.:
  ```c
  /* DAT_xxx: declared as a scalar but indexed as (&DAT_xxx)[i] in
     <callers> -- same "scalar declared but accessed as array" bug class
     fixed several times this session. Widened to real, safely-sized
     backing storage (zero-initialized, not recovered) purely to make
     the access safe. */
  undefined1 DAT_xxx_backing[N];
  #define DAT_xxx DAT_xxx_backing[0]
  ```
  Definition stays in `uw.c` (or wherever it already lived); add the
  matching `extern ... DAT_xxx_backing[N]; #define DAT_xxx
  DAT_xxx_backing[0]` pair to `uw.h` for cross-TU use. Note this in
  `todo.md` under "Fixed this round" with the evidence.

Rebuild both targets to confirm:
```
cmake --build build --target uw_dbg uw_asan
```

## Done condition

`uw.c` no longer contains the function; `src/destination.c` does; both
targets build clean (warnings are fine, pre-existing style, but no new
errors). Hand off to `run-regression-tests` next.
