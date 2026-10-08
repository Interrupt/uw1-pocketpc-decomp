#ifndef HEADERS_PLATFORM_DOSMIDI_H
#define HEADERS_PLATFORM_DOSMIDI_H

/* Optional DOS-audio backend: plays the original DOS game's XMI music
 * through OPL3 synthesis, the way a Sound Blaster Pro did, instead of the
 * WinCE port's converted .MOD files.
 *
 * Everything that touches libADLMIDI lives behind this header. That is
 * deliberate: libADLMIDI's own core is GPL-3 while the parts we actually
 * need (its XMI converter, the Nuked OPL3 emulator, its MIDI sequencer)
 * are LGPL/MIT, so keeping the surface this narrow means the core could
 * later be replaced by a hand-written MIDI-event-to-OPL layer over just
 * the permissive parts without any call site changing. See
 * third_party/libadlmidi/VENDORING.md.
 *
 * This is strictly opt-in. The default audio path remains the ARM/WinCE
 * one (hxcmod .MOD music, UU.exe WAVE-resource SFX) and the DOS assets
 * are optional -- nothing here is reached unless the player asks for it
 * AND the assets are actually present. */

/* Is DOS audio mode requested and usable?
 *
 * True only when UW_AUDIO_MODE=dos (case-insensitive, matching the
 * existing UW_LIGHT_MODE=dos convention in 3d.c/player.c) *and*
 * platform_dosmidi_init later confirmed a working synth. Resolved once
 * and cached, so this is cheap to call per-track.
 *
 * Deliberately reports false after a failed init, so a missing
 * UW_DOS_DATA_DIR, absent XMI files or an unavailable synth all degrade
 * to the normal ARM path rather than to silence or a crash. */
int platform_dos_audio_enabled(void);

/* Opens the OPL3 synth at sample_rate Hz and selects the AIL Underworld
 * instrument bank. Returns 1 on success, 0 on any failure (in which case
 * platform_dos_audio_enabled() stays false and the caller should keep
 * using its normal backend).
 *
 * Call once, from platform_music_init, only when UW_AUDIO_MODE=dos. */
int platform_dosmidi_init(int sample_rate);

/* Maps one of audio.c's "\SOUND\uwNN.mod" game paths to the real DOS
 * XMI file for the same track: "<UW_DOS_DATA_DIR>/SOUND/UWNN.XMI".
 *
 * Exists as its own function (rather than inline in the loader) because
 * it is the one piece of this backend with interesting behavior to pin
 * down in a unit test -- play_music_track's track numbering is base-8
 * style, so getting this mapping wrong silently plays the wrong track,
 * which is a bug this project has already hit once. Returns 1 on
 * success, 0 if UW_DOS_DATA_DIR is unset or the path doesn't look like a
 * track path. */
int platform_dosmidi_xmi_path(const char *win_mod_path, char *out, unsigned int out_sz);

/* Loads the XMI file at a real filesystem path. Returns 1 on success, 0
 * on failure (missing file, unparseable XMI); on failure whatever was
 * previously loaded keeps playing. */
int platform_dosmidi_load_file(const char *real_path);

/* Renders frames stereo frames of interleaved 16-bit audio into stream.
 *
 * Called from platform_music.c's SDL audio callback, which already holds
 * the device lock for the duration, so this does no locking of its own --
 * do not call it from the main thread without that lock held. Returns
 * the number of frames actually produced (0 when nothing is loaded). */
int platform_dosmidi_render(short *stream, int frames);

/* Rewinds the loaded track to its start, for the stop-then-restart
 * semantics audio.c's music call sites expect. */
void platform_dosmidi_rewind(void);

/* Closes the synth and frees the loaded song. Safe to call even if
 * platform_dosmidi_init never succeeded. */
void platform_dosmidi_shutdown(void);

#endif
