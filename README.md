# Ultima Underworld 1 — WinCE decompile, stubbed for native compile

`uw.c`/`uw.h` are a Ghidra decompile of `UU.exe`, the Windows CE (Pocket
PC) port of Ultima Underworld 1 (originally shipped by ZIO Interactive for
devices like the HP Jornada 540 — the folder name says "PPC" but that
means Pocket PC, not PowerPC; the actual binary is MIPS). This tree adds
everything needed to compile that raw decompile as a native macOS binary
and run it against the real game data files, with the WinCE platform
layer (coredll ordinals, GAPI/`GX*` graphics+input, file I/O) stubbed or
reimplemented against SDL2 and the host filesystem.

## Building

Requires `clang` and SDL2 (`brew install sdl2`).

```sh
clang -std=gnu11 -g -O0 \
  -Wno-implicit-function-declaration -Wno-int-conversion \
  -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast \
  -Wno-incompatible-function-pointer-types -Wno-deprecated-non-prototype \
  $(sdl2-config --cflags) \
  -o build/uw uw.c main.c gx_stub.c ordinal_stubs.c file_io.c \
  $(sdl2-config --libs)
```

The `-Wno-*` flags are required, not optional: this is raw decompiled C
where 32-bit-original-binary idioms (K&R-style unspecified-argument
functions, implicit int/pointer conversions) are used throughout on
purpose — see "Architecture notes" below.

For crash hunting, add `-fsanitize=address` (catches bad memory accesses
precisely) — the two are not mutually exclusive with the flags above.

## Running

The game needs its original data files. Extract them from the WinCE
install `.cab` files (see "Extracting game data" below) into a directory
laid out as:

```
UWDATA/
  UU.exe  gx.dll        (unused by this build, just artifacts of extraction)
  DATA/       *.GR *.DAT *.BYT *.SYS *.PAK *.ARK *.CFG *.TR *.CM
  DATA3D/     *.E
  SOUND/      SOUNDS.DAT  *.MOD  VOC*.wav
  CRIT/       CR*PAGE.N00/N01  ASSOC.ANM
  CUTS/       CS*.N0x
```

Then run with:

```sh
UW_DATA_DIR=/path/to/UWDATA ./build/uw
```

A copy of the extracted game data also lives at `data/` in this repo for
local convenience (`UW_DATA_DIR=$(pwd)/data ./build/uw`) — it's
gitignored, not checked in, since it's copyrighted game data.

File loads are logged to stderr (`[fileio] open-read: ...`), including
failures, which is the fastest way to tell what's missing or misnamed.

### Extracting game data from the CE `.cab` installers

7-Zip (`7zz x foo.cab`) extracts the compressed file contents correctly
but loses the original directory structure and filenames — CE cab
installers store real names/paths in a separate binary manifest
(`ULTIMA~1.000` in the extracted output, a "WinCE install header"), with
each content file keyed by its file-table index (which is what 7-Zip
falls back to naming the file `.NNN`). `tools/organize_uw_data.py`
(adapt the paths at the top) parses that manifest and copies the `.NNN`
files into the real `DATA`/`DATA3D`/`SOUND`/`CRIT` layout with real
filenames. Run it once per cab (main data, Voice, CutScene) pointing at
each one's own extracted+manifest directory.

## Current status

Compiles clean, links, and runs against real game data: opens an actual
SDL window, passes single-instance/window-creation/registry checks, and
has successfully loaded `STRINGS.PAK`, `FONT5X6P.SYS`, `ALLPALS.DAT`,
`OBJECTS.DAT`, `DOORS.GR`, and others via the real file I/O layer. Still
hunting an intermittent heap-corruption bug (see below) somewhere in the
resource-loading path that hasn't fully stabilized into the game's main
loop yet.

Known-incomplete / best-effort areas:
- **Sound**: not wired up at all (no coredll waveOut-equivalent
  implemented yet).
- **A handful of UI icon/graphic files** may still 404 under the wrong
  filename — some path-building code references a lookup table whose
  actual string contents Ghidra couldn't recover (see "Unrecoverable
  string tables" below); fixed instances are documented inline as they're
  found, but not every one has necessarily been hit and confirmed yet.
- **`Ordinal_*` semantics**: most are unidentified coredll-by-ordinal
  imports with no name recovered. ~10 were identified from their
  call-site shape and implemented for real (malloc/free/memset,
  CreateFile/ReadFile/WriteFile/SetFilePointer, RegOpenKeyEx,
  single-instance check, window creation, the PeekMessage-shaped event
  pump). Everything else is a generic no-op stub (`ordinal_stubs.c`,
  `tools/gen_ordinal_stubs.py`) that ignores its arguments and returns 0
  — safe on the arm64 calling convention, but semantically a no-op, so
  any game feature that depends on one of these doing something real
  won't work correctly yet.

## Architecture notes (why the code looks like this)

**K&R-style declarations everywhere.** Ghidra's per-call-site argument
recovery disagreed with itself throughout this binary — the same
function gets called with different argument counts at different sites
because the original compiler's register allocation confused Ghidra's
analysis. Every function was mechanically converted
(`tools/krify_functions.py`) from an ANSI prototype to an old-style K&R
declaration (`void FUN_X(a,b) int a; int b; { ... }`), which disables
argument-count/type checking at call sites — required for this to
compile at all, not a style choice.

**Pointer truncation via `int`.** The original binary is 32-bit, so
pointers and `int` were interchangeable there. On a 64-bit host that's
not true, and Ghidra's `undefined4`/`int` typing for what are actually
pointers silently truncates real (malloc'd, or taken via `&global`)
addresses — compiles fine, corrupts memory or segfaults at runtime,
often far from the actual bad assignment. This has been the single
biggest source of bugs found while getting this to run this far, fixed
wherever found by retyping the offending local/parameter/global to a
real pointer type. If you hit a new crash and the faulting address looks
suspiciously small/truncated-looking, check for this pattern first.

**Undersized globals used as large tables.** A recurring, distinct
Ghidra artifact: a global that's actually the *base address* of a large
table (bytes, words, or a struct-per-entry array) gets declared as a
single scalar (`undefined DAT_x;`) because Ghidra only saw the *first*
access. Any indexed/strided access past that first element then
overflows into whatever memory follows. Every instance found so far has
been widened via a `static TYPE DAT_x_backing[N]; #define DAT_x
DAT_x_backing[0]` macro pattern, which preserves the symbol's normal
single-element usage everywhere while giving it real backing storage.
This is deliberately over-applied in a few broad passes (widening ~200
globals total, most of which probably didn't strictly need it) because
the fix is free (extra static memory, no behavior change for correctly-
sized uses) and finding each instance individually via crash/corruption
is slow.

**"Broken index" copy loops.** Another Ghidra artifact:
`(&stackXXXX)[(int)pcVar]` or `arrayName[(int)pcVar]`, where a byte-copy
loop's destination got expressed as "base address plus the *source*
pointer's raw numeric value" instead of a proper incrementing
destination pointer — meaningless once recompiled (the original only
worked because of a coincidental relationship between the two addresses
in the 32-bit binary's fixed memory layout). Fixed by introducing a real
destination pointer, reset at the loop's initialization site
(`tools/fix_stack_copy_loops.py`, `fix_direct_array_copy_loops.py`,
`refix_stack_copy_loops.py`).

**`code`/`codeval` typedefs.** Ghidra's `code` pseudo-type (function
reached through a pointer, e.g. jump/dispatch tables) is redefined here
as a K&R-unspecified-argument function type rather than `void`, so
`(**(code**)expr)(args...)` — the standard indirect-dispatch idiom in
this binary — type-checks regardless of argument count. `codeval` is the
same idea for dispatch targets whose result is actually used as a value.

**Unrecoverable string tables.** A few places index into a table of
string pointers at a fixed address in the *original* binary
(`uVar1 * 4 + 0x85990`-style expressions) that Ghidra never recovered
string contents for — the address is a dangling reference to memory that
doesn't exist in this dump. Handled case-by-case: either skipped (if
cosmetic) or replaced with a best-effort guess corrected against the
real extracted filenames once known (see `FUN_00041304`'s `.GR`
extension fix).

**Fatal-error path must actually exit.** `FUN_00082388` is the
process-termination point reached both from normal shutdown and from
in-game fatal-error handlers (`FUN_0003c3c8`/`FUN_0003c4a8`, "Underworld
can no longer run..."). It must call `exit()` for real — a no-op stub
here means a fatal-error caller keeps running with broken state and
loops back into the same failure forever, which looks exactly like an
unrelated infinite loop/hang until you check the backtrace.

**stderr buffering.** `main()` sets `stderr` unbuffered
(`setvbuf(..., _IONBF, 0)`). Without this, redirecting output to a log
file makes an *actively running* process look frozen for many seconds at
a time (full-buffering kicks in once stdout/stderr aren't a tty), which
is very easy to misdiagnose as a hang.

## Directory guide

- `uw.c` / `uw.h` — the decompile, mechanically and manually patched (see
  above).
- `ghidra_intrinsics.h` — `CONCATxy`/`SUBab`/`SBORROW4`/`SCARRY4`
  standard Ghidra decompiler intrinsics.
- `ordinal_stubs.c/.h` — coredll ordinal-import stubs; regenerate with
  `tools/gen_ordinal_stubs.py` after editing the `SPECIAL` dict in that
  script (don't hand-edit the generated files for the generic stubs).
- `gx_stub.c/.h` — GAPI (`GX*`) implementation backed by SDL2: window,
  framebuffer, input.
- `file_io.c/.h` — real file I/O backing the CreateFile/ReadFile/
  WriteFile/SetFilePointer/CloseHandle-shaped wrappers, resolving
  Windows-style game paths against `UW_DATA_DIR` case-insensitively.
- `main.c` — entry point, calls the decompiled `entry()`.
- `tools/` — one-shot Python scripts used to apply the mechanical fixes
  described above. Most are not idempotent-safe to blindly rerun after
  further hand edits; read before running.
