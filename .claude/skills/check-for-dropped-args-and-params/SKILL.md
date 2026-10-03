---
name: check-for-dropped-args-and-params
description: "Check one function (just named/extracted, or named earlier) for a dropped-argument or dropped-parameter bug class that recurs in this Ghidra decompile of uw1-pocketpc-decomp-cleanup: call sites passing more arguments than the function's own K&R declaration lists, or a return value being captured in a way that discards a side effect. Used as a step inside refactor-unnamed-function, but can be invoked standalone on any function the user is suspicious of."
---

## Context

Ghidra's decompilation of this K&R-style (non-prototype) codebase has
repeatedly dropped a trailing parameter from a function's own
declaration even though every real call site passes it, and the
function's own body (or its callees) clearly needs it. A related
variant: a function is called purely for a side effect, but its return
value gets captured into a global that then stomps something the side
effect just set up (e.g. `init_sound_channel_slot`'s always-0 return
being written over a just-allocated handle).

This bug class has been the single highest-value thing caught by close
reading during routine naming/extraction work this project — including
catches the user made directly from reading a diff. Treat this check as
mandatory for every function touched, not just ones that look suspect.

## How to check

1. Read the function's own declaration (parameter list + K&R type
   lines) carefully — count the parameters.
2. `grep -rn` every call site across `uw.c`, `uw.h`, and all of `src/*.c`
   for this function's name. For EVERY real call site (not commented-out
   or `// was` historical text), count the arguments actually passed.
3. If any call site passes more arguments than the declaration lists:
   this is a real bug, not a false positive, PROVIDED:
   - Multiple independent call sites agree on the extra argument (one
     oddball caller might just be a different bug), AND
   - The function's own body — or a callee it forwards to — has logic
     that is dead/no-effect/gated-off without that parameter (e.g. an
     `if` that can never meaningfully branch, or a downstream function
     call that itself declares and uses that parameter).
4. Separately, check every call site that captures this function's
   return value into a variable or global. If the function provably
   always returns a constant (trace every `return` statement), capturing
   that return into something meant to hold a real handle/state is a
   bug — especially if the call also has an obvious side effect (another
   global write, a resource allocation) that the capture then
   overwrites.
5. Do NOT fix on suspicion alone. If the evidence is ambiguous (e.g.
   only one call site, or the "dead" logic might be intentionally inert
   for a reason you don't understand), leave it alone and note it in
   `mysteries.md` or `todo.md` instead of patching it.

## Fixing a confirmed dropped parameter

Add the parameter to the function's own K&R declaration (both the param
name and its type line), and forward it explicitly to whatever
downstream callee needs it. Example (from this session, `uw.c` /
`src/object_actions.c`):

```c
void describe_special_object_property(param_1,param_2)
ushort * param_1;
short param_2;
{
  ...
  describe_object_owner(param_1,param_2);   /* was missing param_2 */
  ...
}
```

Check whether `uw.h`'s forward-declaration for this function (if K&R,
likely just `void name();` with no params shown — those don't need
touching) needs any update; usually it doesn't since K&R forward decls
don't list params.

## Fixing a confirmed discarded-return-value bug

Split the call for its side effect from the value actually assigned,
e.g.:

```c
if (DAT_xxx == 0) {
  iVar2 = Ordinal_1095(0x1a);
  if (iVar2 == 0) {
    DAT_xxx = 0;
  } else {
    init_sound_channel_slot(iVar2);   /* side effect only */
    DAT_xxx = iVar2;                  /* real handle, not the discarded 0 return */
  }
}
```

## Verification and logging

After any fix here, this function's change counts as "touching a bug
fix" for the purposes of `run-regression-tests` sizing — run the full
19-script suite, not the default 6-script one. Log the fix in
`todo.md`'s "Fixed this round" section with: what the bug was, the
concrete evidence that confirmed it (call-site count, which callees
gated on it), and how it was verified.

## Done condition

Every real call site's argument count matches the declaration; every
captured return value is either a real, non-constant value or
deliberately ignored (`(void)name(...)` style or just not assigned).
Nothing was "fixed" without call-site evidence backing it.
