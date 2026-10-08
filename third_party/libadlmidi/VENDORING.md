# Vendored libADLMIDI

Upstream: https://github.com/Wohlstand/libADLMIDI
Commit:   7ae146967cd63ad6de7211c163c7f21d0ee7ac30
Vendored: 2026-10-07

Supplies the two halves of the optional DOS-audio mode (`UW_AUDIO_MODE=dos`):
the XMI -> standard-MIDI converter, and OPL3 synthesis. See the root
`CMakeLists.txt` for the forced build options and `src/platform_music.c` /
`src/headers/platform_dosmidi.h` for how the game reaches it.

## What was omitted, and why

Only sources, headers and the build system were taken. Dropped:
`fm_banks/` and `fm_banks_new/` (6.8MB of bank files -- we use the embedded
bank DB instead), `utils/`, `test/`, `examples/`, `projects/`, `android/`,
`Doxyfile`, `test.wopl`. 16MB upstream -> 3.5MB here.

`banks.ini` is deliberately **not** vendored. Upstream's CMake selects
`src/inst_db.cpp` when that file is present and `src/inst_db_no_grey.cpp`
otherwise, so omitting it (together with `BUILD_NO_GREY_BANKS=ON`) builds the
bank database that excludes the unclear-licensing "grey zone" banks.
`src/inst_db.cpp` was removed for the same reason. Nothing is lost for us:
the bank this port wants is in the no-grey set (verified -- see below).

## Licensing

Upstream is licensed per-component, not under one blanket license (see
`README.md`'s "License" section). The pieces this build actually compiles:

- XMI converter (`cvt_xmi2mid.hpp`) -- LGPL 2+
- MIDI sequencer, file reader, WOPL reader -- MIT
- Nuked OPL3 emulator and the chip interfaces -- LGPL 2.1+
- libADLMIDI's own core glue -- **GPL 3+**

That GPL-3 core is the reason every call is kept behind the C wrapper header
rather than used directly: the core could later be replaced with a
hand-written MIDI-event-to-OPL layer over the LGPL/MIT parts without touching
any call site. This repository currently ships no LICENSE file.

`USE_DOSBOX_EMULATOR`, `USE_MAME_EMULATOR` and the LLE emulators are forced
OFF: all are GPL 2+, and Nuked OPL3 is both more accurate and more
permissively licensed. Their sources are still present in `src/chips/` but are
never compiled.

## Verified at vendoring time

- All 12 real DOS UW1 tracks (`UW01-07,10-13,15.XMI` from a DOS install)
  load via `adl_openFile` and render non-silent audio.
- The embedded no-grey bank DB contains 79 banks including
  `AIL (Ultima Underworld 2) :MT-32:`. Resolve it by **name** via
  `adl_getBankNames()`, never by hardcoded index -- the index shifts between
  the grey and no-grey databases.
- Note that bank is Ultima Underworld **2**'s AIL bank; UW1's own
  `UW.AD`/`UW.MT` Miles timbre banks are not readable by this library without
  conversion. Its terms (`LICENSE-AIL2.txt` upstream) are John Miles's 2000
  AIL open-source release: usable by anyone for any purpose without
  restriction.
- `ADLMIDI_VolumeModel_AIL` exists and is the correct volume model for a
  Miles AIL game like this one.
