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
- **Unidentified, still under investigation**: `FUN_000232ec` (writes a
  big fixed-offset device/config-ish record via `DAT_00086df8`, plus
  something at `DAT_0023be74`), `FUN_00066cb4`/`FUN_00066e90` (sets up
  `DAT_0023be64`/`DAT_0023be74` from a `DAT_002029cc`-backed workspace —
  purpose still unclear, maybe a font/palette record)

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
- `FUN_000232ec` — writes a large fixed-offset record through
  `DAT_00086df8` (looks like device/config init — many single-byte
  field writes at offsets like `+0x4e`, `+0xce`, `+0x21..0x34`, etc.,
  unclear what real subsystem this is yet) and also touches
  `DAT_0023be74 + 5..7` (set earlier by `FUN_00066cb4` from
  `&DAT_001007d0 + (*DAT_0023be64 & 0x3f) * 0x30`). Current crash
  point (SEGV reading through `DAT_0023be74`, garbage-looking address)
  — not yet root-caused; `DAT_0023be74`'s backing (`DAT_001007d0`,
  6144 bytes) is not obviously undersized for the offsets used, so this
  may be the same not-yet-found stray-write source as `DAT_002029cc`
  above, or a separate issue. Next step: lldb watchpoint on
  `DAT_0023be74` the same way `DAT_002029cc`'s corruption was found.
