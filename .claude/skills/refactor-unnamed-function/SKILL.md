---
name: refactor-unnamed-function
description: "Run one full code-cleanup pass in this uw1-pocketpc-decomp-cleanup repo: find the next unnamed FUN_xxxxxxxx function (or a small cluster of related ones) in uw.c, name it, check it for dropped-argument/parameter bugs, extract it into the right src/*.c file, build, regression-test, and commit+push. This is the standing per-pass workflow for the repo's code-cleanup-first-pass branch goal. Use whenever asked to continue the cleanup, do 'the next pass', or work through more unnamed functions -- or invoke by name to run one pass end-to-end."
---

## Context

Standing goal for this branch (`code-cleanup-first-pass`): group related
functions/globals into matching `src/*.c` + `src/headers/*.h` files by
functionality, name every `FUN_xxxxxxxx`/some `DAT_xxxxxxxx`, convert
backing arrays into real structs (still a neglected goal criterion —
revisit periodically, the array-widening fixes done so far are
correctness fixes, not struct conversions), and eventually reduce
`uw.c`/`uw.h` to just main-entry/setup before moving them into `src/`
too. Rule: integration-test and commit+push after every batch (~10
functions), fixing any regressions the move introduces.

This skill is the per-pass loop; it delegates to four sub-skills in
order. Invoke each with the `Skill` tool rather than re-deriving their
steps inline.

## One pass, start to finish

1. **Locate the next target(s).**
   ```
   grep -nE "^(void|undefined4|undefined2|undefined1|undefined|int|short|byte|uint|ushort|char|bool|double|float) FUN_[0-9a-f]+\(" uw.c | head -20
   ```
   Usually just the next one in file order. If it's obviously paired
   with its physical neighbor (same struct offsets, same dispatcher,
   same effect family), handle both together in this pass — this has
   repeatedly been the right call (e.g. vibrato+tremolo, or a
   dispatcher with its handler).

2. **Invoke `rename-unnamed-function`** on the target(s). This covers
   investigation, the rename `Edit`, and the project-wide rename
   propagation script, ending with a verified zero stale-reference
   state.

3. **Invoke `check-for-dropped-args-and-params`** on the just-renamed
   function(s) before extracting — it's easiest to cross-check call
   sites while the function is still sitting in `uw.c` next to
   everything else. Fix only on solid evidence; log anything merely
   suspicious in `todo.md`/`mysteries.md` instead.

4. **Invoke `find-home-for-function`** to pick/create the destination
   `src/*.c` file and physically extract the function(s), fixing up any
   cross-TU dependency fallout (missing externs, un-staticing globals,
   widening a scalar-accessed-as-array global into a real backing
   array). Ends with both `uw_dbg` and `uw_asan` building clean.

5. **Invoke `run-regression-tests`.** Use the default 6-script suite for
   a plain rename/extraction with no header/global changes; use the
   full 19-script suite if this pass un-staticed a global, widened a
   scalar into an array, touched a widely-called function, or fixed a
   real bug. Confirm actual completion (not just a notification) before
   trusting the result, per that skill's gotcha section.

6. **Stage and commit, only on a clean regression result.**
   ```
   git status --short
   ```
   Stage exactly the files listed (never a blanket `git add -A`/`git
   add .`). Commit message: one-line summary (`Code cleanup pass N: name
   and extract <function(s)>`), then a short paragraph on what the
   function(s) actually do and why they're grouped this way, then the
   regression result (`N/M regression scripts clean (default suite)` or
   `(full suite, since this touches ...)`), ending with:
   ```
   Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
   Claude-Session: https://claude.ai/code/session_01X4P2o5ntpAEGdzh3K1LeMb
   ```
   (Use whatever attribution lines the current session's own system
   reminder specifies if it differs from the above — that reminder is
   authoritative, this is just the pattern observed so far.)

7. **Push and check for upstream changes.**
   ```
   git push
   git fetch origin main && git log HEAD..origin/main --oneline
   ```
   If this is non-empty, merge before continuing to the next pass.

8. **Loop.** Go back to step 1 for the next unnamed function, unless
   told to stop or asked to do something else.

## Judgment calls worth remembering

- Prefer giving a function a correct, evidence-grounded name over a
  maximally-specific one — a conservative but accurate name beats a
  precise-sounding guess.
- Don't let "convert backing arrays into structs" slide forever — when a
  pass naturally surfaces a good struct-conversion candidate (a backing
  array whose every access uses the same stride/offsets), consider doing
  the fuller struct conversion instead of just widening the array, even
  though widening alone satisfies correctness.
- A real bug found mid-pass (memory corruption, dropped arg, discarded
  return value) is worth fixing immediately with full regression
  coverage and a `todo.md` entry — this has consistently been more
  valuable than deferring it to a dedicated bug-hunting pass.
- If a regression script hangs with near-zero CPU use well past the
  watchdog's timeout, it may be an environmental fluke (confirmed once
  this session) — kill the process tree and retry once before assuming
  a real regression.
