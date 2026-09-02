# Known issues

## Fixed this round
- [x] Spacebar didn't add a space in name entry — SDL delivered the matching
      keydown (VK_SPACE, a mapped game button) and SDL_TEXTINPUT event in the
      same `uw_pump_events()` batch, so the button code and the char code got
      OR'd into the same `DAT_0023c448` slot before the game ever polled in
      between. Fixed by stopping event draining after any key/text event so
      each lands on its own poll (gx_stub.c).
- [x] Character-generation stats area covered by a solid-color rectangle /
      most chargen text missing entirely — root cause was a buffer overflow:
      `DAT_0024af98` (FUN_00078e60's decoded-string ring buffer) was declared
      as a single byte instead of the real 4096-byte cyclic buffer, so every
      decode past the first 512-byte slot wrote out of bounds and (confirmed
      via an lldb watchpoint) corrupted `DAT_0024bf98`, the STRINGS.PAK file
      handle used by the whole compressed-string decoder, into garbage. Once
      corrupted it stayed broken for the rest of the process, breaking nearly
      all subsequent string lookups. Fixed by widening `DAT_0024af98` to its
      real size.
- [x] Right-side chargen buttons/portraits never drew at all — `DAT_000fb880`
      (a per-field byte-size/offset table read by `FUN_00023de8`/
      `FUN_0002431c`/`FUN_00024840`) had zero writers anywhere in the
      decompiled code. Root cause: its real populator is two small ARM
      functions (`LAB_000255b4`/`LAB_000255d0`) that Ghidra's auto-analysis
      never recognized as functions because they're only reached via a
      function-pointer callback (passed to `FUN_000417b4`), not a direct
      `bl`. Recovered by disassembling the original UU.exe directly (Ghidra
      headless, see below) and reimplementing their real logic. This alone
      didn't fire until a second bug was found: `DAT_00084ef8` (the resource
      name string identifying which button graphics to load, should be
      `"chrbtns"`) was *also* an unrecovered string constant sitting at all
      zero bytes, so the loader always took its "nothing to load" early
      return and never invoked the callbacks. Recovered that string directly
      from the binary too.
- [x] Button/portrait icon pixel data reading from the wrong offset (mangled/
      sheared graphics) — `DAT_000fb884` (meant to hold each button's pixel
      data offset) had zero writers either, but its address (0xfb884) is
      exactly one 4-byte element past `DAT_000fb880`'s (0xfb880) — not a
      separate table, an alias into the same array that an earlier fix pass
      split apart into two independent backing arrays before LAB_000255d0's
      role was understood. Re-aliased it back.
- [x] Button X position (and a chunk of the button's own bitmap, corrupted
      into the draw) used `extraout_r1`, the "call Ordinal_2005 twice to grab
      a leftover-register remainder" idiom used elsewhere in this file — but
      here the second call's result was never even assigned to
      `extraout_r1`, so it was genuinely uninitialized garbage. Computed the
      remainder directly instead (FUN_0002431c). Also added a divide-by-zero
      guard this fix could hit if `param_1[8]` (items-per-row) is ever 0.
- [x] Face/portrait bitmap for head/race selection — `DAT_00100728` (meant to
      hold per-loaded-head real pointers) was declared as a lone scalar, but
      its real populator, `LAB_00028688`/`LAB_000286a4` (same "callback
      Ghidra never resolved" pattern as above, for the "heads"/"converse"/
      "genhead"/"charhead" resource loads), writes it as an array. Widened
      to a real backing array and implemented the two callbacks from
      disassembly. **Still doesn't visibly work** — see below.

## Still open
- [ ] Main menu never shows the three option buttons (Introduction, Create
      Character, Acknowledgements) — not yet investigated this round.
- [ ] Chargen buttons still have no text on them at all (expected labels
      confirmed by user: sex="Male"/"Female", handedness="Left"/"Right",
      class=8 options ending in "Shepherd"). `FUN_0002431c` only blits the
      "chrbtns" bitmap (background/frame) via `FUN_00011e5c` — there's no
      separate text-draw call in it, so either (a) the label text is meant
      to be baked into the "chrbtns" bitmap pixels themselves and the
      pitch/offset math is still wrong somewhere despite the DAT_000fb884
      re-aliasing fix, or (b) there's a genuinely separate, still-missing
      text-draw call site (possibly another Ghidra-unresolved callback, same
      pattern as everything above). Needs more investigation, likely another
      disassembly pass around wherever chrbtns per-item headers get parsed.
- [ ] First button in a multi-item list still draws at the far right screen
      edge (not centered in the right half) and what might be text on it
      looks garbled — the X-anchor itself (`param_1[9] + 0xa0` in
      FUN_0002431c) may be wrong, separate from the extraout_r1 fix already
      applied. `param_1[9]`'s real meaning/population hasn't been traced.
- [ ] Head/race selector: button background now draws (chrbtns fix worked)
      but the actual face bitmap (from the "heads" resource / DAT_00100728,
      fixed this round) still doesn't appear. Traced `FUN_00028488` (which
      contains the "heads"/"genhead"/"charhead" load logic) and its callers
      (FUN_00073... conversation code, NPC-related contexts at lines 20656,
      24824, 24897, 24914, 27537, 60615, 62663) — **none of them are reached
      from FUN_00024e24/FUN_00025608 (the character-generation state
      machine)**. So the face-drawing call for chargen's race-selection
      screen may be entirely missing from this decompile, not just broken.
      Needs tracing what should call the heads-loading path during chargen,
      possibly another not-yet-discovered Ghidra-unresolved function.
  - Related: "extra pixels at the top of the screen that look like a button
    border" on the face-selection screen — possibly a fragment of the real
    face-drawing code executing with wrong coordinates, or leftover/dirty
    framebuffer content from a different screen. Not yet investigated.
- [ ] After finishing character creation, the game restarts from the first
      step instead of continuing into gameplay (FUN_00024e24 case 7: `if
      (uVar1 != 0) goto restart;` — the confirm/redo selection value may be
      wrong, or the default/highlighted option may not be "confirm". Not
      re-investigated since the key-repeat fix (which was the earlier
      leading theory) landed — needs a fresh look once text renders well
      enough to see which button says what.

## Useful tooling discovered this round
- The original game binary is at `data/UU.exe` (PE32, WinCE, despite the
  file's own machine-type field misreporting MIPS — the actual code is ARM,
  confirmed via Ghidra disassembly).
- A real Ghidra project already exists at `/Users/ccuddigan/Projects/UW1/decomp/UW.rep`
  (project file `UW.gpr`), containing analyzed `UW.EXE` and `UU.exe`. Ghidra
  itself is installed at `/Users/ccuddigan/Projects/ghidra_12.1.3_PUBLIC`.
- To find real cross-references / disassemble a specific address range when
  Ghidra's own auto-analysis missed a function (the "no writer found"
  pattern that shows up a lot in this codebase — usually means the real
  writer is a function only reached via a callback pointer, not a direct
  call), write a small `.java` GhidraScript (not `.py` — this Ghidra version
  needs PyGhidra for Python scripts, which the headless launch here isn't
  set up for) and run it via:
  ```sh
  GHIDRA=/Users/ccuddigan/Projects/ghidra_12.1.3_PUBLIC
  "$GHIDRA/support/analyzeHeadless" /Users/ccuddigan/Projects/UW1/decomp UW \
    -process "UU.exe" -noanalysis -scriptPath /tmp -postScript YourScript.java
  ```
  Requires the project not be open in the Ghidra GUI (locks the project dir).
  Useful script snippets: `getReferencesTo(addr)` for xrefs (check
  `ref.getReferenceType()` for WRITE vs DATA/PARAM/READ), and
  `getListing().getInstructions(start, true)` to dump disassembly with
  `getFunctionContaining()` to see whether Ghidra attributed each instruction
  to a named function (NONE means it's one of these "orphaned callback"
  functions).
