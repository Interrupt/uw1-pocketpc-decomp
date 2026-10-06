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
 * range, the file was never extracted, or no audio device is open. */
void platform_sfx_play(int resource_id);

/* Closes the audio device and releases every cached sample buffer, for
 * real app shutdown. Safe to call even if platform_sfx_init never
 * succeeded. */
void platform_sfx_shutdown(void);

#endif
