# Function/Global Investigation Notes

Running notes on what functions and globals in `uw.c` actually do, figured
out via call-shape analysis, cross-referencing string constants, and
runtime debugging (lldb backtraces/watchpoints, ASAN reports). Ghidra's
`FUN_xxxxxxxx`/`DAT_xxxxxxxx` names are kept as the primary identifier
since that's what the rest of the code and all the fix comments reference;
this file is the "what is this actually for" index. Not exhaustive —
added to opportunistically as things get figured out, not a systematic
audit.

## Subsystems (terse index — see sections below for detail)

- **Entry/startup**: `entry`, `FUN_00077004`, `FUN_0003b820`, `FUN_0005b828`
- **`.E` 3D model script parser**: `FUN_00020a74`, `FUN_00038680`
- **Resource preload (`.GR`/STRINGS.PAK)**: `FUN_00041aac`, `FUN_000417b4`,
  `FUN_00041304`, `FUN_00041708`/`FUN_00041770`, `FUN_00076a2c`,
  `FUN_00076b8c`/`FUN_00076e98`, `uw_alloc_grtile`
- **File I/O (CreateFile-style)**: `FUN_000227d4`, `FUN_0002285c`,
  `Ordinal_553`, `FUN_00022850`
- **C runtime via coredll ordinals**: `Ordinal_1041/1018/1047/1044/1054`
  (malloc/free/memset/memmove/realloc), `Ordinal_1063/1065/1068/1070`
  (strcat/strcmp/strlen/strncmp), `Ordinal_1113/1114/1118/1102`
  (fopen/fscanf/fclose/printf-log)
- **Process exit / fatal error**: `FUN_00082388`, `FUN_0003c3c8`,
  `FUN_0003c4a8`
- **Font/glyph-width setup (partially broken)**: `FUN_0003894c`,
  `DAT_00110fc8`/`DAT_00110fc0`/`DAT_00110fcc`
- **Texture-LUT loader (non-functional)**: `FUN_0005b054`, `FUN_0005b514`
- **Options menu / in-game UI text-and-icon rendering**: `FUN_0006a3d8`
  (top-level options-menu loop), `FUN_0006af3c`/`FUN_0006ac38`/
  `FUN_0006a200` (menu-item draw + input-wait dispatch), `FUN_000122d4`/
  `FUN_00012444` (RGB565 pixel-format conversion blit), `FUN_00011e5c`/
  `FUN_00011060`/`FUN_000112a0` (paletted-bitmap-to-framebuffer text/
  glyph blitter), `FUN_0006c98c`/`FUN_00040e24`/`FUN_00040efc` (load a
  `.BYT` background image + a PALS.DAT palette index and draw it)
- **Screen present / GAPI blit pipeline**: `FUN_00022f0c`/`FUN_0002310c`
  (dirty-rect flush from the software framebuffer to the real display),
  `FUN_00022b54` (palette→RGB565 LUT builder, doubles as a secondary
  overlay blit), `FUN_000778fc` (same secondary overlay blit), all
  gated on `DAT_0023cdc0`/`DAT_0023cdb8`/`DAT_0023cdbc` (GAPI display
  properties) and targeting a **portrait**-oriented hardware framebuffer
  — see "Display rotation" below.
- **Unidentified, still under investigation**: `FUN_00066cb4`/
  `FUN_00066e90` (sets up `DAT_0023be64`/`DAT_0023be74` from a
  `DAT_002029cc`-backed workspace — purpose still unclear, maybe a
  font/palette record)

## Entry / startup chain

- `entry` (uw.c ~64100s) — WinMain-equivalent process entry point. Calls
  `FUN_00077004`.
- `FUN_00077004` — top-level startup: single-instance check (Ordinal_286),
  window creation (Ordinal_246 / GXOpenDisplay), registration-key bypass,
  registry checks (Ordinal_461), then calls `FUN_0003b820` for the real
  game data init sequence.
- `FUN_0003b820` — main init dispatcher. Calls, roughly in order:
  `FUN_00049960` (workspace alloc), resource preload batch
  (`FUN_00041aac`), COPYRIGHT.BYT/OBJECTS.DAT/COMOBJ.DAT loading
  (`FUN_00056f28`, `FUN_00052674`), `FUN_0005b054`/`FUN_0005b188`
  (texture-LUT setup, currently non-functional — see below),
  `FUN_0005b828` (UI/model/font subsystem init).
- `FUN_0005b828` — calls `FUN_00038680` (loads all `.E` 3D model scripts),
  `FUN_0003894c` (glyph-width table setup, currently skipped — see
  below), `FUN_00038acc`/`FUN_00038ab0` (cursor save/restore for
  something using `DAT_00110fc0`), then writes a null terminator via
  `DAT_00110fc0`.

## The `.E` model script parser

- `FUN_00020a74(path, out_record)` — parses one WinCE-port-specific
  text-based 3D model script (`\DATA3D\*.E` — NOT the DOS binary object
  format documented elsewhere for UW1/2; this format appears specific to
  this port). Grammar: `BEGIN "name"` / `VERSION {N}` / `POINTS { x,y,z;
  ... }` / `PARTS { flags,N,idx,color,(v0,v1,v2,v3); ... }` / `END`.
  Confirmed by inspecting `DATA3D/DFRAME.E`'s real content. Uses
  Ordinal_1113/1114/1065/1070/1068/1102/1118 directly (real fopen/
  fscanf/strcmp/strncmp/strlen/log/fclose — see below), not the game's
  usual CreateFile-style file I/O. Extremely long function (~1000 lines);
  reconstructed best-effort since several of its own format-string and
  keyword constants were unrecoverable (Ghidra never recovered their
  content) — see DAT_000849a8/DAT_000849ac/DAT_000849c8 below. All its
  originally-fatal parse-error exits were made non-fatal (skip this one
  model, `goto` the function's own cleanup label) since a wrong guess
  anywhere in this best-effort parser shouldn't kill the whole game.
- `FUN_00038680` — calls `FUN_00020a74` once per `.E` file, 28 times
  total, each writing into its own ~15KB-ish record buffer
  (`DAT_00114c1c` .. `DAT_0017e0ec`, one per model).
- `DAT_000849a8` = guessed `"%1s"` (single-token/delimiter read, used
  pervasively through PARTS-parsing as a "read the next character"
  call) — not confirmed against real content, only against call shape.
- `DAT_000849ac` = guessed `"%d"` (reads the numeric value inside
  `VERSION {N}`'s braces — the `%100s%1s` tokenizer already consumed
  the opening `{` as the token's delimiter char, so the format must NOT
  itself expect a leading `{`).
- `DAT_000849c8` = confirmed `"END"` (the file's own closing keyword —
  confirmed by inspecting a real file's last line).
- `s__lx_1s_000847a4` = `"%lx%1s"` in the original 32-bit binary (`long`
  == 4 bytes there) — had to become `"%x%1s"` here since `long` is 8
  bytes on this 64-bit host and the destination is a plain `int`;
  otherwise vfscanf overflows the stack slot.
- Per-POINT record: `DAT_000d2ab0`..`DAT_000d2ad3` (28 byte-fields,
  0x2c/44-byte stride, up to 600 points).
- Per-PART record: `DAT_000c9dd8`..`DAT_000c9de3` (12 byte-fields,
  0x67/103-byte stride, up to 350 parts).

## Resource preload batch (`.GR` files, STRINGS.PAK, etc.)

- `FUN_00041aac` — the big batch loader dispatched early in
  `FUN_0003b820`: loads question/views/objects/animo/buttons/cursors/
  3dwin/tmflat/tmobj/flasks/compass/dragons/power/chains/spells/
  scrledge `.GR` files via `FUN_00041910`/`FUN_00041960`/`FUN_00041990`/
  `FUN_000419c8`, ANDs all their success flags together, then calls
  `FUN_00040160`.
- `FUN_000417b4(name, base_idx, count, alloc_cb, postprocess_cb)` — the
  shared engine behind those: opens `\DATA\<name>.GR` (via
  `FUN_00041304`), reads its item-offset table, then for each item calls
  `alloc_cb(size)` to get a buffer, reads the item's bytes into it via
  `FUN_000414f4`, and optionally `postprocess_cb(buf, size, index)`.
- `FUN_00041304(name, mode)` — builds `\DATA\<name>.GR`, opens it,
  validates a format-version byte, reads the item-count + offset table.
  The `.GR` extension itself was an unrecoverable string reference —
  confirmed against the real extracted DATA folder's filenames.
- `uw_alloc_grtile(w,h)` (my helper, not from the decompile) — real
  malloc+memset allocator used by `FUN_00041708`/`FUN_00041770` as their
  `alloc_cb`, since `FUN_00076a2c` (the "natural" allocator elsewhere in
  this file) deliberately returns a truncated identity key, not a real
  pointer — see below.
- `FUN_00076a2c(w,h)` — allocates a `w*h`-byte buffer and registers it in
  an internal fixed-size record array (`DAT_0023c3fc`/`DAT_0023c404`),
  keyed by a 4-byte truncated copy of the real pointer. Its *return
  value* is that truncated key, used by 11 of its 12 callers purely for
  later identity-comparison lookups via `FUN_00076b8c`/`FUN_00076e98`
  (never dereferenced) — do NOT "fix" this to return the real pointer;
  that breaks those lookups. The one caller that needs a real
  dereferenceable pointer (`FUN_00041708`) uses `uw_alloc_grtile`
  instead.
- `FUN_00076b8c`/`FUN_00076e98` — identity-key lookup/update functions
  against `FUN_00076a2c`'s record array.

## Real C-runtime-via-coredll ordinals (identified this session)

- `Ordinal_1041` = malloc, `Ordinal_1018` = free (deliberately a no-op/
  leak at some call sites with a dropped argument), `Ordinal_1047` =
  memset, `Ordinal_1044` = memcpy/memmove (implemented as memmove; ~50
  call sites, some with overlapping ranges).
- `Ordinal_1063` = strcat, `Ordinal_1065` = strcmp, `Ordinal_1068` =
  strlen, `Ordinal_1070` = strncmp.
- `Ordinal_1113` = fopen (via `uw_file_fopen`, which does the same
  Windows-path resolution as the CreateFile-family wrappers),
  `Ordinal_1114` = fscanf, `Ordinal_1118` = fclose, `Ordinal_1102` =
  printf-style logger (routed to stderr, prefixed `[game]` — no in-game
  UI to show it in this port).
- `Ordinal_286` = single-instance check (FindWindow/CreateMutex-shaped).
- `Ordinal_246` = CreateWindow-shaped (real window comes from
  GXOpenDisplay instead).
- `Ordinal_461` = RegOpenKeyEx-shaped.
- `Ordinal_864` = PeekMessage-shaped (drives `uw_pump_events`).
- `FUN_000227d4`/`FUN_0002285c`/`Ordinal_553`/`FUN_00022850` = the
  game's own CreateFile/ReadFile/CloseHandle/SetFilePointer-style file
  I/O wrappers (distinct from the Ordinal_1113/1114 fopen/fscanf path
  used only by the `.E` parser).

## Process exit / fatal-error path

- `FUN_00082388(code)` — the real, unconditional process-exit point
  (`exit()`). Reached from BOTH normal shutdown AND every fatal-error
  handler — a no-op stub here looks exactly like an unrelated infinite
  loop/hang (cost real debugging time before this was found).
- `FUN_0003c3c8(errcode)` / `FUN_0003c4a8(msg)` — "Underworld can no
  longer run..." fatal-error display + `FUN_00082388(-24)`. Always exits
  with code -24 regardless of the display error code.

## Display rotation (portrait "hardware" framebuffer)

The GAPI screen-present functions (`FUN_00022f0c`/`FUN_0002310c`/
`FUN_00022b54`'s tail/`FUN_000778fc`) all blit by transposing rows and
columns from the game's internal 320×240 landscape software framebuffer
(`g_uw_buf_25800`) into whatever `GXBeginDraw()` returns, using the pitch
values from `GXGetDisplayProperties()`. That's a real 90°-rotation
algorithm, not a decompile artifact — it only makes sense if the actual
target device (an HP Jornada/Pocket-PC-class handheld) has a **portrait**
-oriented hardware framebuffer. `gx_stub.c` now emulates that faithfully:
`GXBeginDraw()`/`GXGetDisplayProperties()` expose a 240×320 portrait
buffer (`g_framebuffer`), and `GXEndDraw()` rotates it back to a natural
320×240 landscape image (`g_display_buf`) before presenting to the SDL
window. Reporting landscape properties instead (the initial approach)
made the game's own rotation math write far outside the buffer.

Getting the game to reach this code at all required two more fixes:
- `Ordinal_89`/`Ordinal_230` (SystemParametersInfo SPI_GETOEMINFO + a
  device-name string compare against `u"HP,Jornada_540"`) were generic
  no-op stubs, so the device-detection check that gates the *entire*
  `GXOpenInput()`/`GXGetDisplayProperties()`/`GXGetDefaultKeys()` init
  block always failed and those calls were skipped outright — no `else`
  path exists, so input and display-properties setup were both silently
  missing. Implemented to always report/match that device string.
- `DAT_0023cdb8`/`DAT_0023cdbc`/`DAT_0023cdc0` (cbxPitch/cbyPitch/cBPP)
  were Ghidra-split field accesses into the *same* struct that
  `GXGetDisplayProperties()`'s result gets memcpy'd into (at struct
  offsets 8/0xc/0x10), but got declared as independent globals instead
  of aliases into that backing buffer — so the copy silently populated
  memory nothing else read, and the present-gate check `DAT_0023cdc0 ==
  0x10` (checking cBPP==16) never passed. Re-aliased onto the backing
  buffer at the right offsets.

## Palette gamma-correction softfloat ordinals

`Ordinal_2032`/`Ordinal_2026`/`Ordinal_2020`/`Ordinal_2018` are ARM/WinCE
softfloat-emulation helpers (int→float, float×float, float→int; floats
travel as raw IEEE-754 bit patterns through plain integer
registers/params — no hardware FPU on the original target). They're used
~470 times combined across the file, overwhelmingly for palette gamma
correction (`FUN_00022b54`'s non-null-`param_1` branch) but likely
elsewhere too (3D math has not been exercised yet). All four were no-op
stubs returning 0, which meant *every* computed palette color came out
as 0 (black) regardless of the real PALS.DAT data loaded from disk —
this, not a missing draw call, was why the options-menu background
stayed solid black even after every earlier bug in the chain got fixed.
`Ordinal_2020`/`Ordinal_2018` are called with **zero explicit arguments**
at every site in `uw.c` — Ghidra dropped the parameter because it's just
the return-register value chained straight from the preceding
`Ordinal_2026`/`Ordinal_2032` call (the same register-reuse pattern
already seen with `Ordinal_1068`'s strlen argument); implemented as K&R
functions with one parameter so the calling convention picks it up from
whatever register the prior call's return is still sitting in.

## Resolved this session (previously undersized/uninitialized globals)

Beyond the `.E` parser's own record clusters (POINTS/PARTS/CLUSTERS/NODES,
listed above), a few more turned up nearby in the same general startup
path once those stopped masking them:

- `DAT_0024bfa0`-family (6 arrays) — already widened once in an earlier
  session from a lone scalar, but only to 8200 bytes; `FUN_0007873c`
  indexes them with a 0x804-byte stride and an unbounded growing record
  count (`DAT_0024cfc0`). Widened again, twice (8200 → 131072 was still
  not enough — ASAN caught real startup traffic hitting record ~64 — →
  1052672, a ~512-record margin).
- `Ordinal_1054` — realloc-shaped (`(ptr_or_null, new_size) -> new_ptr`),
  was a no-op stub returning 0, which every one of its 4 callers treats
  as allocation failure → immediate fatal error. Implemented for real.

## Known-unresolved / still-broken areas

- `FUN_0003894c` — glyph-width table setup. Reads through
  `DAT_00110fc8`, which has no traceable initializer anywhere in this
  decompile (presumably another dropped call site). Currently skipped
  defensively (`return` if null) rather than crashing; whatever UI text
  this feeds may have wrong character spacing.
- `FUN_0005b054`/`FUN_0005b514` — texture-LUT loader. Builds `"\DATA\"`
  with no filename ever appended (another unrecoverable string
  reference, and unlike the `.GR` case there's no candidate file whose
  content matches the expected `byte[0]==2` format header). Made
  non-fatal; textures loaded through this path are missing/blank.
- `DAT_002029cc` (a `FUN_00049960`/`FUN_00052960`-managed ~32KB
  workspace buffer, purpose not yet identified — feeds
  `DAT_002046b8`/`DAT_002046c4`, both ~0x67-byte-stride-ish table bases
  used somewhere in glyph/UI rendering) was getting corrupted mid-run by
  a stray write from elsewhere in the file — confirmed via an lldb
  watchpoint that it changed value during `.E` model parsing. Widening
  the `.E` parser's four undersized record clusters (POINTS/PARTS/
  CLUSTERS/NODES — the watchpoint had caught POINTS specifically, but
  the others turned out to share the bug) seems to have fixed the
  specific write the watchpoint caught; a defensive magnitude-sanity
  guard is still in place in `FUN_00066e90` (its main consumer) as a
  backstop, since a *different* corruption of the same variable was
  still observed after that fix in at least one ASAN run, so there may
  be one more overflow source somewhere not yet found. Worth another
  watchpoint session if it recurs.
- The `FUN_000232ec`/`DAT_0023be74` SEGV noted here previously was
  root-caused and fixed: `DAT_0023bca8` (a single-byte scalar Ghidra
  declared, but actually used as the base of a large device/config
  record via `DAT_00086df8`) was undersized and its overflow was
  corrupting the unrelated `DAT_0023be74` byte-by-byte. Widened to
  8192 bytes.
- Several more pointer-truncation bugs surfaced while chasing the
  options-menu black-screen issue (see "Options menu" subsystem and
  "Display rotation" above): `FUN_0006af3c`/`FUN_0006ac38`'s `param_2`
  (`undefined4`/`int`, truncating the pointer forwarded into
  `FUN_0006a200`), `FUN_0006a200`'s 4-byte-stride `char**` menu-string
  array (was a 4-byte-per-slot `int*`, matching the source `local_1d0`
  array in `FUN_0006b178` which had the same truncation), and
  `FUN_00011e5c`'s `param_3` (source-bitmap pointer for the paletted-
  blit primitive, `int` truncating real pointers from ~30 call sites —
  only the callers on the options-menu path have been re-typed so far;
  the rest still pass through an implicit int↔pointer conversion and
  may need the same fix if/when reached). Also two plain missing- or
  wrong-argument bugs: `FUN_00057a70`/`FUN_00057a78` computed a real
  input-event code via `FUN_000579e4()` and then discarded it in favor
  of a hardcoded `return 0`, which made every input-wait loop in the
  game immediately believe an event had arrived — this was the actual
  cause of a 390,000-iterations/30s busy-loop (constantly re-opening
  font files) before it was found; and `GXGetDefaultKeys((int)auStack_798)`
  in `FUN_00077408`, where the `(int)` cast truncated a real stack
  pointer, crashing on the very first `memset` inside it.
