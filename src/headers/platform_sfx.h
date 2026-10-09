#ifndef HEADERS_PLATFORM_SFX_H
#define HEADERS_PLATFORM_SFX_H

/* Thin platform-backend interface for short one-shot sound-effect
 * playback (footsteps, weapon hits, door sounds, UI clicks, etc.),
 * kept deliberately separate from audio.c's own call site
 * (trigger_sound_sample_note) so the backend itself -- currently a
 * small SDL2-based WAV mixer fed by WAVE resources extracted once
 * from data/UU.exe's real PE resource table, see platform_sfx.c's own
 * block comment -- can be swapped out later without touching that
 * call site at all. Mirrors platform_music.h's role for background
 * music (see that header/its .c file for the sibling backend and the
 * conventions this one follows). */

/* Opens a real SDL2 audio device for SFX mixing and extracts any of
 * the 36 known "WAVE"-type PE resources from data/UU.exe that aren't
 * already sitting in data/SOUND/SFX/<id>.wav (one-time, on first
 * run). Call once, early at startup, right after SDL_Init(...  |
 * SDL_INIT_AUDIO) -- see gx_stub.c's GXOpenDisplay, right alongside
 * platform_music_init(). Safe to call even when data/UU.exe is
 * missing (some test fixtures symlink only a subset of files) or no
 * audio device is available: both fail soft with a DEBUG WARN,
 * leaving SFX playback silently disabled rather than crashing. */
void platform_sfx_init(void);

/* Plays WAVE resource `resource_id` (801-859, i.e. trigger_sound_sample_note's
 * own `param_1 + 800` -- see that function's comment in audio.c) as a
 * new one-shot note, without interrupting whatever other one-shots are
 * already playing (up to a small fixed number of overlapping voices --
 * see platform_sfx.c). Lazily loads+caches the resource's extracted
 * data/SOUND/SFX/<id>.wav the first time it's requested. A no-op (with
 * a DEBUG warning, logged only once per resource) if the id is out of
 * range, the file was never extracted, or no audio device is open.
 *
 * DECIDED (no volume/pan parameter, no handle-based stop -- real
 * investigation, not a shortcut): the real call-site cluster above
 * trigger_sound_sample_note (play_positional_sound_effect/
 * play_sound_effect_with_pan/play_sound_effect_at_object/
 * allocate_and_play_sound_channel, and the "stop a sound early"
 * functions stop_movement_sound_handle/stop_current_audio_handle(_dup)/
 * start_ambient_sound_effect/stop_ambient_sound_effect) was audited
 * function-by-function against a live Ghidra decompile of the real
 * UU.exe (see each function's own comment in audio.c for the specific
 * evidence). Conclusion: there is no real plumbing anywhere in this
 * decompile that ever applies positional volume/pan to actual sample
 * playback (it's computed, then provably discarded one or two call
 * levels down -- confirmed via real parameter counts, not inferred
 * from "mono WAVs probably don't need it"), and no real mechanism
 * that ever stops a specific currently-playing one-shot SFX voice
 * early (stop_movement_sound_handle is a genuine empty no-op in the
 * original binary; stop_current_audio_handle(_dup) only ever
 * targeted the unrelated dead MOD-engine COM handle, not a one-shot
 * voice; start_ambient_sound_effect/stop_ambient_sound_effect are a
 * separate, never-fully-decompiled subsystem with no WAVE resource id
 * anywhere in their own chain to tie to this engine). So this
 * interface deliberately stays exactly this simple -- a fire-and-
 * forget `(resource_id)` -- rather than growing a handle/volume/pan
 * API nothing real would ever call. If a genuinely new real call site
 * needing one of those is found later, extend this interface then,
 * backed by that site's own evidence. */
void platform_sfx_play(int resource_id);

/* Does this port actually have a playable WAVE resource for `resource_id`
 * (801-859)? Loads and caches it on first ask, so a later
 * platform_sfx_play of the same id costs nothing extra.
 *
 * False for the real gaps in the shipped set -- effect ids 0, 13, 14, 15,
 * 19 and 21-23 have no resource -- and also when no SFX audio device
 * opened, since then nothing here can be heard regardless. That makes it
 * a straight "can the sampled path serve this sound", which is what
 * --audio-mode=hybrid needs to decide between a sample and a DOS note. */
int platform_sfx_has_resource(int resource_id);

/* Closes the audio device and releases every cached sample buffer, for
 * real app shutdown. Safe to call even if platform_sfx_init never
 * succeeded. */
void platform_sfx_shutdown(void);

#endif
