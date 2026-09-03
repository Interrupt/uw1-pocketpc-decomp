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
      disassembly. Turned out this specific screen has a deeper, separate
      issue — see "Still open" below.
- [x] **Most chargen text missing/empty everywhere** (the real root cause
      behind the "no text on buttons" investigation) — `FUN_0007863c` (the
      central string-lookup function, ~82 call sites throughout the whole
      file) called its decoder as `FUN_00078e60(uVar1)` with only ONE of its
      TWO required arguments, relying on the same unreliable "register-
      leftover" idiom fixed repeatedly elsewhere this session. The second
      argument (the string's index within its resource "page") never
      reliably survived, so `FUN_00078e60`'s own bounds check
      (`iVar1 < local_2e`) saw garbage and silently fell through to its
      "not found" path, returning a genuinely empty string. Confirmed via a
      direct diagnostic: "Male" decoded as "" before the fix, and correctly
      as "Male" after passing `param_1 & 0x1ff` explicitly. This is likely
      the single biggest text-rendering fix this session — affects far more
      than character generation.
- [x] **Chargen option-list layout completely broken** (first button on the
      same row as its prompt; all list items — e.g. all 8 class names —
      stacking horizontally off past the right edge of the screen instead
      of listing vertically). Root cause in `FUN_00023de8`'s per-item draw
      loop: another uninitialized `extraout_r1` register-leftover (same
      idiom, same root bug class as the string-lookup fix above and
      FUN_0002431c's earlier fix) was meant to hold
      `local_28 % param_1[8]` (item's column-within-row, from a discarded
      `Ordinal_2005` call), gating whether the draw cursor wraps to a new
      row. With it always uninitialized-nonzero, Y never advanced and X
      grew unbounded every item. Confirmed via a caller-tagged diagnostic
      (dladdr on `FUN_00011060`'s return address) showing all 8 class names
      landing at the same Y with X running 288→1072 before the fix, and
      properly stacked at Y=16,36,56,...,176 with consistent X≈210-227
      after. Computed the remainder directly instead.

## character_generator_loop state map (confirmed via diagnostic + user's screen-by-screen walkthrough)
| state | `*param_1` | item count | screen |
|---|---|---|---|
| 0 | 1 | 2 | Choose sex |
| 1 | 2 | 2 | Handedness |
| 2 | 3 | 8 | Pick a class |
| 3 (×3 sub-passes) | 4 | 2, 5, 6 | Skill categories (combat/magic/special) |
| 4 | **0 (no prompt configured)** | — | Head/race selection |
| 5 | 6 | 2 | Difficulty |
| 6 | 7 | 0 | Name entry |
| 7 | 8 | 2 | Keep this character? |

## Still open
- [ ] Main menu never shows the three option buttons (Introduction, Create
      Character, Acknowledgements) — not yet investigated this round.
- [ ] Chargen icon-button graphics (the "chrbtns" background/frame bitmap
      FUN_0002431c blits via FUN_00011e5c) may still have their own
      separate offset/pitch issue distinct from the text-layout fix above —
      not re-verified visually since the text fix landed. Earlier
      disassembly-verified findings (before the text fix, may want a fresh
      look): FUN_0002431c's own coordinate/offset math is a byte-for-byte-
      faithful translation of the real ARM code, and FUN_00011e5c's width/
      height/stride usage is internally consistent for the ~67x16
      dimensions read from the button header. Inspected the actual loaded
      CHRBTNS.GR bytes at runtime (928/1082 nonzero bytes for item 0 — real
      pixel data, not empty) and confirmed each item has a 5-byte header
      (e.g. `04 43 10 30 04`, bytes[1]=width, bytes[2]=height) immediately
      followed by its pixel data, with DAT_000fb880[idx] consistently
      meaning "byte offset where item idx's *pixel data* begins (after its
      own header)". BUT: the pixel-data read site uses index
      `iVar9+param_1[6]+1` (verified via disassembly: reads
      `DAT_000fb880[...+1]`, i.e. one array element past the dimension read
      at index `param_1[6]` with no +1) — meaning the two reads use
      *different* item indices for a single button's dimensions vs. its
      pixel data. Whether that's intentional (shared header, offset pixel
      data) or a genuine off-by-one requires understanding param_1[6]'s
      real value/meaning, not yet resolved. Re-check whether this is even
      still visible now that the text/layout bugs are fixed.
- [ ] Skill-picker screens (state 3) show "Choose character sex:" drawn to
      the left of each skill row, overlapping the real skill name/value
      text (which draws correctly via FUN_00023b38 — a separate, working
      function). Root cause traced to FUN_00023de8's OTHER draw branch (the
      `param_1[6]==0` per-item option-label loop, same loop whose
      row/column layout was just fixed) also running for the skill record
      and reading garbage: `*(byte*)(&DAT_000fb8f0 + offsetfield +
      local_28*2)` returns a *constant* 1 for every item regardless of
      local_28 (confirmed via diagnostic: offsetfield=377, byteval=1 for
      all 6 skill slots), where 1 happens to be the sex screen's own
      `*param_1` value, hence the exact same decoded string. For
      comparison, this same read pattern gives correctly-varying values
      for sex/handedness/class (e.g. 9,10 / 11,12 / 23-30). Two live
      hypotheses, neither confirmed: (a) `offsetfield` (`*(int*)(param_1+3)`,
      populated per-record by FUN_00025608's setup loop) is wrong for the
      skill record specifically, pointing at padding/wrong data instead of
      a real per-skill string-ID table; or (b) this whole loop shouldn't be
      running for skills at all (FUN_00023b38 already renders them) and
      `param_1[6]` or `*(int*)(param_1+3)` should be 0 for this record to
      skip it, but isn't. Needs tracing FUN_00025608's record-setup loop
      against the real disassembly to see what's actually supposed to be
      at that offset for a skill-category record.
- [ ] Up/Down do not seem to select different options within a list (e.g.
      can't move the highlighted class/skill choice) — not yet
      investigated this round.
- [ ] Head/race selection (confirmed = state 4, see table above) draws
      nothing because `*param_1==0` for this record, skipping FUN_00023de8's
      prompt-text branch entirely, AND case 4's own bitmap draw reads
      `DAT_000fb8c4[...]`, a lookup table confirmed via a **fresh Ghidra
      xref check against the real binary** (not just the decompiled C) to
      have **zero writers anywhere in the compiled ARM code** — unlike
      DAT_000fb880, there is no hidden callback to recover here; the real
      game binary itself never populates this table. The "heads"/"genhead"/
      "charhead" resource loader (FUN_00028488, containing the real
      portrait-loading logic, callbacks already implemented this session as
      LAB_00028688/LAB_000286a4) is never called anywhere in
      character_generator_loop either (verified: dumped all 476 instructions / every
      `bl` call in the function, zero hits). This looks like it may be a
      genuine bug/incomplete feature in this specific PocketPC port's
      shipped binary, not a decompilation artifact — recovering working
      head/portrait selection would mean reconstructing functionality that
      may never have worked in this build, not just fixing a broken
      translation. Lower priority / may not be fixable without much deeper
      reverse engineering (e.g. checking whether a PC/other-platform build
      of this game had working portrait selection, to understand what the
      intended data flow was).
  - Related: user confirms the head buttons now all show up (chrbtns frame
    fix working) but with no head/face inside, plus "some garbled pixels of
    something" near the buttons' edges — consistent with the frame drawing
    correctly and something else (uninitialized/leftover framebuffer
    content, given DAT_000fb8c4 is confirmed empty) showing through where
    the portrait should be. Not a separate bug from the above.
- [ ] After finishing character creation, the game restarts from the first
      step instead of continuing into gameplay (character_generator_loop case 7: `if
      (uVar1 != 0) goto restart;` — the confirm/redo selection value may be
      wrong, or the default/highlighted option may not be "confirm". Not
      re-investigated since the key-repeat fix (which was the earlier
      leading theory) landed — needs a fresh look once text renders well
      enough to see which button says what.
- [ ] User spotted that this binary has real debug-log-style format strings
      baked in (System Shock 1 heritage — same engine family), e.g.
      `"objsbecombinable_returns_%d"`, `"combination_%d_is_%d_and_%d."`,
      `"checking_if_%d_and_%d_are_combin"`, `"Error:_Part_%d_is_a_polygon_"`,
      `"got_bitmap_%d:_%d"`, `"Too_many_points_(%d)"`. Confirms debug
      logging infrastructure exists in the game, likely gated behind a
      disabled debug flag/build define. Not yet investigated: find what
      calls these (a central debug-print function?), whether there's a
      flag that enables it, and whether turning it on could make future
      "what's actually happening" investigations (like the text/layout bugs
      above) much faster than manual disassembly archaeology.

## Useful tooling discovered this round
- `demomode` now exits the process when its input file runs out (instead of
  idling with the window open) -- set `UW_DEMO_KEEP_RUNNING=1` to opt back
  into the old idle-after-playback behavior. Makes scripted ASAN test runs
  fully self-terminating: `.../uw_asan; echo $?` instead of a manual
  `sleep N && kill`.
- `FUN_00011060` (the text-draw function) has a permanent opt-in trace:
  `UW_DIAG_TEXT=1` prints every call's caller function name (via `dladdr`
  on the return address), (x,y), and string content. Zero cost when unset.
  This was the single fastest tool this round for finding which of this
  file's many draw call sites is responsible for a given on-screen text
  bug -- reach for it first before manually reading call chains.
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
  functions). To find a raw pointer stored as plain data (not a code xref
  Ghidra recognizes) -- e.g. a message-dispatch table entry -- search each
  memory block for the address's little-endian byte pattern directly via
  `mem.findBytes(start, end, needle, mask, true, monitor)`.

## Fixed this round (stylus click support + debug print system)
- Mouse/stylus clicks did nothing at all — traced to a genuine missing
  feature, not a bug in existing code: the real binary has a *separate*
  mouse message-dispatch table (found via raw byte search in `.rdata`,
  0x830e4-0x83144) routing WM_MOUSEMOVE/LBUTTONDOWN/LBUTTONUP/RBUTTONDOWN/
  RBUTTONUP to a handler at 0x77dd0 that Ghidra never resolved into a
  function (only ever reached through that table, same "orphaned callback"
  pattern as the LAB_ recoveries). Recovered by hand as `FUN_00077dd0`:
  hit-tests taps in the x:200-240 strip against a real static keyboard
  grid (`DAT_00087650`, recovered byte-for-byte from the binary — 20 rows
  x 2 columns: digits/letters/backspace/enter/space/0x14) and re-dispatches
  the resulting key ID as a synthetic WM_CHAR/WM_KEYDOWN through
  `Ordinal_868` (real `PostMessage`, was a no-op stub) into the same
  `FUN_00077b2c` path real keyboard input already uses. Wired up in
  `gx_stub.c`'s `uw_pump_events` to translate SDL mouse events into this
  handler's portrait-coordinate lParam encoding.
  - This on-screen keyboard is specifically for the chargen name-entry
    field — it does NOT provide click support for the other chargen list
    screens (sex/class/skill/head/etc), which appear to be genuinely
    keyboard/d-pad-only even in the original binary (no other hit-test
    table found anywhere in `character_generator_loop`'s ~70 real ARM call
    sites).
  - Coordinate bug found and fixed along the way: `SDL_MOUSEBUTTONDOWN`/
    `SDL_MOUSEMOTION` event coordinates (`ev.button.x/y`) come back at half
    the scale `SDL_GetWindowSize`/`SDL_GetRendererOutputSize` agree on, on
    at least one real HiDPI Mac (SDL2 2.32.4) — confirmed by comparing
    against `SDL_GetGlobalMouseState() - SDL_GetWindowPosition()`, which
    does not show the halving. `uw_pump_events` now derives click position
    that way instead of trusting the raw event fields.
- `FUN_0007ea34` (an SS1-engine-style debug-print gateway — the format
  strings noted in the "still open" section above all flow through it) had
  its real body compiled out of this shipped release binary (confirmed via
  disassembly: the vararg calling-convention prologue survives, but the
  body is just an immediate return, likely `#ifdef DEBUG` in the original
  source). No level parameter to recover — none of its ~8 call sites ever
  passed one. Reimplemented as a real vararg printer, gated behind
  `UW_DEBUG_PRINT` (defaults ON while this is under active development —
  `UW_DEBUG_PRINT=0` to silence, unlike the original release build which
  had it fully compiled out).
- Added a `SCREENSHOT <path>` demomode command (`uw_save_screenshot` in
  gx_stub.c, RGB24 BMP via `SDL_RenderReadPixels` — use RGB24 not
  ARGB8888, macOS's `sips` chokes on 32bpp BMPs with alpha) and a
  `CLICK <portrait_x> <portrait_y>` command that injects a synthetic click
  directly into `FUN_00077dd0` in portrait coordinates, bypassing the
  window transform — both let scripted runs (and Claude) verify UI state
  without a human driving the window by hand.
- Renamed for clarity now that their real roles are confirmed:
  `FUN_00024e24` -> `character_generator_loop`, `FUN_00011e5c` ->
  `bitmap_blit` (confirmed via its palette-index-to-RGB565 pixel copy loop,
  with an optional byte-value-0-is-transparent masked mode),
  `g_uw_buf_25800` -> `g_uw_framebuffer` (confirmed via its declaration
  comment: exact size 0x25800 bytes = 76800 shorts = 320x240 RGB565, the
  game's internal landscape software framebuffer, distinct from
  gx_stub.c's own `g_framebuffer` which emulates the rotated "hardware"
  portrait buffer).

## Still open: stats/portrait card doesn't persist across chargen screens
- The left-page stats/portrait card (Male/class header, Str/Dex/Int/Vit,
  Attack/Defense/skills) only gets redrawn from inside
  `character_generator_loop`'s switch statement (case 2 = class picked,
  case 3 = skill picked), while an unconditional full-page background
  reblit + solid-color fill (both confirmed present in the real ARM
  disassembly, in this exact order, every loop iteration) wipes it on
  every subsequent field transition. Net effect: the card is genuinely
  only visible for one frame right after finishing class/skill picks, then
  blank (parchment + box outlines only) on every later screen (skill
  sub-passes, head selection, difficulty, name entry, confirm).
- This directly contradicts a screenshot the user provided from the same
  `UU.exe` running on a real device/emulator, which shows the card fully
  populated and stable on the name-entry screen (several states later).
  Exhaustively checked and ruled out: `character_generator_loop`'s own
  switch (no other case touches the card), `FUN_00024840` (input-wait
  loop, no stats-drawing calls anywhere in its body), the suspend/resume
  reference-counter pair `FUN_00057118`/`FUN_000570b4` (turned out to gate
  an unrelated main-dungeon-view click-highlight function, not frame
  presentation), and a frame-presentation-timing theory (our `GXEndDraw`
  calls `SDL_RenderPresent` unconditionally on every call with no
  throttling — plausible but the *last* draw before the blocking input-wait
  is always "erase, then draw next field" regardless of timing, so
  throttling wouldn't change what settles on screen).
- Root cause NOT FOUND. A quick "redraw the card unconditionally every
  iteration once a class is picked" fix was prototyped and confirmed to
  visually match the reference screenshot, but was deliberately reverted
  at the user's request — it papers over the symptom without explaining
  why the real binary doesn't need it, which means we don't understand
  what's actually different yet. Needs either: a genuine explanation for
  the discrepancy (something in the render pipeline / GAPI emulation we
  haven't audited, or a control-flow path outside `character_generator_loop`
  entirely), or explicit confirmation from the user that the reference
  capture wasn't a clean fresh run of this exact binary before trying
  again.
  functions).
