# Uninitialized global array audit

Reviewed against commit `349fbd2` on 2026-10-07. The initial sweep recorded findings without changing behavior. The follow-up
implementation below restores confirmed original data and shared record views.

## Method and counts

Run from the repository root:

```sh
python3 tools/audit_array_initialization.py --output build/array-initialization-audit.json
```

The scanner examines current `src/*.c` and `src/headers/*.h`, rather than trusting
the stale `dat-vars.json`. It skips initialized and local arrays, follows macro
aliases and global pointer views, checks assignment destinations, and distinguishes
file-read/copy destinations from sources. It includes non-DAT arrays and PTR_DAT
names. A pointer assignment is not itself evidence that its backing buffer was
filled. `audited` flags from the sizing catalog are not initialization evidence.

- 412 uninitialized global arrays found.
- 305 have visible writes, clears, or destination calls; these are excluded from
  this candidate list, not proven correct in all respects.
- One has no runtime use found.
- 106 require review of indirect population or missing contents.

Manual classifications of those 106 views:

| Classification | Views |
| --- | ---: |
| Missing original static data | 19 |
| Missing original static string | 1 |
| Disconnected field in a populated parent record | 7 |
| Disconnected runtime record field | 1 |
| Executable callback represented as data | 2 |
| Indirect population found | 31 |
| Intentional zero contents | 2 |
| Legacy model storage | 31 |
| Pointer fallback needing lifetime review | 1 |
| Runtime storage with no identified population | 11 |

Several views belong to the same original table. These are not counts of distinct
original tables or necessarily reachable gameplay bugs.

## Confirmed missing static contents

Original ARM memory was sampled directly in Ghidra. The checked prefixes and
source-specific explanations are retained in `array-initialization-review.json`.
Recover actual table bounds before implementing fixes; existing oversized array
extents are not reliable evidence of the original layout.

| Source | Empty views | Original role / evidence |
| --- | --- | --- |
| `src/audio.c` | `DAT_00086370` | MOD pitch/period entries; first LE32 values 907, 900, 894, 887. |
| `src/audio.c` | `DAT_00086810` | 32-byte vibrato/tremolo sine waveform. |
| `src/audio.c` | `DAT_000873e0`, `DAT_00087414` | Music track flags and duration records. |
| `src/babl.c` | `DAT_000845b8/ba/d8/da`, `PTR_DAT_000845c8`, `DAT_000845e8` | Barter slot and crosshair X/Y pairs. Shared and overlapping coordinate views were split into empty arrays. `PTR_DAT_000845c8` is coordinate data despite its name. |
| `src/math.c` | `DAT_00086260`, `DAT_00086264` | Arctangent interpolation samples; starts 0x4000, 0x3fae, 0x3f5d, 0x3f0b. Adjacent sample views must share storage. |
| `src/input.c` | `DAT_00086e70` | Movement-mode lookup; first bytes 09 08 0a 00. |
| `src/player.c` | `DAT_00086dc8` | Per-light-source color bases; all 16 original values recovered. |
| `src/player.c` | `DAT_00087308` | Skill-use improvement tier values: 25, 40, 10. |
| `src/models.c` | `DAT_00086d60` | Catalog-2 sprite/texture draw-command lookup; starts LE16 228, 102. |
| `src/traps.c` | `DAT_00085638` | Quest cleanup object-ID list: de d1 db d2 dc d5 d8 d4 d3 dd. |
| `src/graphics.c` | `DAT_00084a40` | Default RGB palette used by `build_rgb565_palette(NULL, ...)`. |
| `src/game.c` | `DAT_000830b0` | Original window-message dispatch records in .rdata; requires host-sized callbacks. This legacy Windows path may be inactive under SDL. |
| `src/game.c` | `DAT_00086e00` | Separate missing string: `F1.87`. |

## Disconnected populated fields

These original locations start zero, so copying static executable bytes would
not fix them. Their native views need to use the storage that the loaders or
runtime builders actually populate.

| Empty view | Populated parent / original offset |
| --- | --- |
| `DAT_00100632`, `DAT_00100634` | `DAT_00100630` +2/+4, loaded from CMB.DAT. |
| `DAT_002029f9` | Container records at `g_carry_weight_limit_table` / `DAT_002029f8` +1, loaded from OBJECTS.DAT. |
| `DAT_002035cf` | COMOBJ.DAT properties at `DAT_00202c90` +0x93f (record 182, byte 1). |
| `DAT_00202807` | Weapon/armor records at `DAT_00202800` +7, loaded from OBJECTS.DAT; used by lock difficulty. |
| `DAT_0023ad58` | Unrebased indexes 48-57 land on `DAT_0023adb8[0-9]`, the loaded floor texture IDs. |
| `DAT_002048c2` | Placement snapshot at `DAT_002048c0` +2, populated through `DAT_0010172c`. |
| `DAT_0023b90a` | Runtime rolling record at `DAT_0023b908` +2; copies currently land in the parent but read from the separate child. |

## Callback addresses represented as arrays

`DAT_00028bfc` (escape keybinding) and `DAT_0007e644` (trap scan callback) point into
ARM `.text`. They are callable code, not immutable byte tables. Both currently
pass addresses of empty native arrays as callbacks. Recover their function
implementations and pass native function pointers.

## Exclusions and unresolved cases

Indirect writers explain the shading LUT, matrices, cached paths, collision
snapshots, current view, sound-channel records, faded palettes, cursor background,
HUD handles, scroll panel, display properties, input bindings, parsed model
scratch, COMOBJ records, decoded strings, font metrics, texture arena, and debug
fields. Each reviewed array has a reason in the JSON review file.

All **768** original bytes of `DAT_00088640` are zero: it is the black fade
palette. The visibility fallback ray is an intentionally empty array.

The 31 model catalog regions remain categorized separately: the current loader
builds parsed native records and returns before the old address-based copy path.
Do not populate these placeholders by guessing original addresses. A separate
reachability and shared-storage audit is needed for legacy fallback behavior.

The initial review separated `DAT_001005e0_backing` as a weapon-record pointer
fallback. Its out-parameter replacement was subsequently traced; see below.

The initial sweep also flagged these 11 runtime views:

- `DAT_0023c2b0/b1/b2/b3`: sound-effect metadata fields.
- `DAT_0023c3d4`: time-related platform storage used with `SetFileTime`.
- `DAT_00250658`: keyboard availability/state lookup.
- `DAT_00087944/48/4c/50`: movement/input flag pointer fallbacks.
- `DAT_002026d1`: initially unresolved second lock-difficulty lookup; now traced and fixed.

Zero static ARM bytes do not establish their intended runtime contents. These
need further tracing of aliases, platform initialization, or original loaders;
they are flagged, not asserted to be missing constant tables.

## Limits and reproducibility

This is a lexical source audit. It cannot prove indirect writes or runtime
reachability. Known destination functions are enumerated explicitly, while
arbitrary pointer walking and callback writes require review. It does not audit
scalar globals, function parameter widths, or correctness of populated arrays.

The full generated JSON retains use sites, detected writes, and destination
calls for every array. Reviewed classifications are attached only when the owner
file's SHA-256 still matches the reviewed source. Changed files are marked stale,
so the tool does not silently carry prior conclusions into new code.

## Implemented fixes

The original ARM UU.exe was read through Ghidra before changing game sources.
No game functions were moved and no ordinals were renamed.

- Restored the MOD period and waveform tables, thirteen music flags/durations,
  barter icon/marker coordinates, angle samples, movement-mode lookup,
  light-source color bases, skill-improvement thresholds, bridge draw-command
  lookup, quest cleanup IDs, default palette, and `F1.87` version string.
- Reconnected the eight confirmed loaded/runtime views: CMB.DAT's second
  ingredient/result, container requirements, COMOBJ type 182, armor ratings,
  floor texture IDs, the placement snapshot's second coordinate, and the rolling
  wall-edge record. X/Y and marker views also share their original barter records.
- Recovered the lock-rating lookup's apparent `DAT_002026d1`: ARM 0x3a97c holds
  0x202750. Its type-ID stride followed by -0x7f addresses byte 1 of the loaded
  accessory records for IDs 32-63. Native code rebases the index instead of
  creating a pointer before the allocation.
- Replaced the fake executable buffers with native callbacks. ARM 0x28bfc is a
  no-op return; ARM 0x7e644 excludes the source/player and recognizes blocking
  object flag 0x100. The source record now stays pointer-sized during scanning.
- Restored all nineteen Windows message records with native callbacks. ARM keeps
  r0-r3 intact when calling the handler; the native dispatcher now forwards those
  arguments. Original focus handlers suspend/resume GAPI.
- Restored the angle helpers' omitted `0xffff8000` quadrant mask, verified at
  ARM 0x49e9c-0x49ea8 and 0x49f98-0x49fa4.
- Rejoined the three sound-metadata field views into their shared five-byte
  records. This establishes layout, without inventing values for the metadata.

`tests/fixtures/restored_tables.json` contains the independent original memory
export. Tests compile actual game declarations, field aliases, and function
bodies; no game implementation copies are maintained in tests. Behavioral cases
exercise barter hit-testing, per-source light colors, real CMB.DAT combination
consumption/results, real OBJECTS.DAT armor/accessory ratings, spawn-block scans
with native pointers, and all keyboard/mouse dispatch records. Math and scroll
suites also check sample interpolation and loaded floor descriptions.

## Remaining limitations

The sound metadata base, platform audio storage, keyboard state table, and four
movement flag fallbacks remain runtime investigations, rather than confirmed
missing immutable tables. ARM 0x87944/48/4c/50 contain pointers to 0x250638,
0x24fa30, 0x2506e0, and 0x250644, respectively; their directly identified xrefs
are reads, and their pointed storage starts zero. No arbitrary initializer or
new input behavior was introduced. The legacy audio engine remains gated off.

The weapon fallback is explained by `resolve_equipped_weapon_attack`:
`tick_weapon_swing_state` passes `&DAT_001005e0`, and that out-parameter replaces
it with the actual equipped object pointer (or NULL for empty hands). Its backing
array is not a missing static weapon table.

## Validation

- `uw_dbg` and every unit-test target build successfully.
- All 44 CTest suites pass.
- The restored-table, math, and scroll-message suites pass with AddressSanitizer.
- 34 original findings are resolved; the remaining reviewed candidates comprise
  indirect population, intentional zero storage, legacy model storage, and seven
  runtime/platform cases requiring further evidence. None is treated as a missing
  immutable table without original data or a proven population path.
