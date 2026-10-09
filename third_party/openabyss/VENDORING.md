# Vendored OpenAbyss audio layer

Upstream: https://github.com/cimmerianpit/openabyss
Commit:   0f152d590cfd661729151547086734ff97a749ff
License:  MIT (see LICENSE here, and the SPDX line atop every file)
Vendored: 2026-10-08

This is the DOS game's own audio path, reverse-engineered: the Miles AIL 2
XMIDI driver as `ADLIB.ADV` implements it, its voice layer, and the OPL2
behind it. It backs this port's optional `UW_AUDIO_MODE=dos` — see
`src/platform_dosmidi.c`, which is the only file here that touches it.

## Files

Taken byte-for-byte from upstream `src/`:

| file | what it is |
| --- | --- |
| `uw_sound.{c,h}` | readers for `SOUNDS.DAT`, the `UW.AD`/`UW.MT` timbre banks, `.VOC` and `.XMI` |
| `uw_ail.{c,h}` | the AIL sequencer: XMI playback, channel locks, the timbre cache, the 120Hz timer |
| `uw_adlib.{c,h}` | `ADLIB.ADV`'s voice layer, including bank 1's time-variant effects |
| `uw_opl.{c,h}` | the OPL2 (YM3812), written from die analyses and checked against Nuked OPL3 |

`uw.h` and `uw_blob.c` here are **not** upstream files. They are a shim this
port supplies; `uw.h` explains why in its own header. In short: the four
sources above include `"uw.h"` but use only `uw_u16`, `uw_u32`, `uw_blob`
and `uw_read_file`/`uw_free`, and vendoring upstream's real `uw.h` plus the
`uw_util.c` that implements those would drag in `uw_gamedir.h` and the whole
`.ARK` container for two functions. The shim provides exactly that subset,
with upstream's own contracts (`uw_u16`/`uw_u32` are copied verbatim).

Nothing else of upstream is vendored: no engine, no renderer, no tools.

## Why this and not a MIDI synthesiser

UW1's sound effects are not samples, and not plain notes either. Each is a
note on a *custom* timbre from `UW.AD`'s **bank 1**, selected by MIDI
controller 114, and those bank-1 timbres are time-variant effects: command
streams that set, ramp and jump the frequency, the two levels, the
priority, the feedback, the two multipliers and the waveforms, stepped at
60Hz, with a second set of streams for the release. That is what makes a
door sound like a door rather than a beep, and it cannot be expressed as a
static instrument — so no general MIDI player can reproduce it.

This port previously vendored libADLMIDI for the DOS mode and that is why
it was dropped: besides being 3.5MB to this layer's 100KB and GPL-3 at its
core to this MIT, its MIDI-player API structurally cannot drive per-tick
register automation, so it could never have played the effects at all.

Neither Miles' own bank-format specification nor OPL3BankEditor's AIL
importer covers the bank-1 records; both handle only the 14-byte 2-op and
25-byte 4-op timbres. This layer is, as far as this project found, the only
public implementation of them.

## Runtime requirements

Reads three files from `UW_DOS_DATA_DIR/SOUND` at init: `ADLIB.ADV` (the
driver's own F-number, block, velocity and operator-slot tables and the
chip's reset registers are read out of the driver binary, not hardcoded),
`UW.AD` (175 timbres across banks 0, 1 and 127) and `SOUNDS.DAT` (24
effects). Music comes from the `AW*.XMI` set — the AdLib-voiced variant,
matching an OPL chip; the `UW*.XMI` set is voiced for the MT-32.

## Verified at vendoring time

- All three files load from a real DOS install; 24 effects, 175 timbres.
- `AW01.XMI` plays a sparse-then-building envelope over 20s (165 of 200
  100ms blocks non-silent) — the title theme's real shape.
- All 24 effects render distinct, time-varying envelopes, including
  sustained (id 11, ~1.4s) and visibly pulsing (id 20) ones, which is the
  bank-1 effect machinery doing what static instruments cannot.
