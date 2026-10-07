#ifndef HEADERS_PLATFORM_VOICE_H
#define HEADERS_PLATFORM_VOICE_H

/* Thin platform-backend interface for the numbered VOC voice/narration
 * sample pool (play_numbered_voice_sample/is_voice_sample_finished/
 * stop_voice_sample in audio.c), kept deliberately separate from both
 * platform_music.h (background MOD tracks) and platform_sfx.h (the
 * 36-entry PE "WAVE" resource one-shot pool): this is a THIRD, distinct
 * asset pool -- see platform_voice.c's own block comment for the full
 * investigation confirming that and for why this backend plays at most
 * one sample at a time (interrupting, not mixing, unlike platform_sfx's
 * 16-voice pool) rather than reusing that engine. */

/* Opens a real SDL2 audio device for single-voice VOC playback. Call
 * once, early at startup, right after SDL_Init(... | SDL_INIT_AUDIO) --
 * see gx_stub.c's GXOpenDisplay, alongside platform_music_init() and
 * platform_sfx_init(). Safe to call even when no audio device is
 * available or data/SOUND/VOCnn.wav files are missing: fails soft with
 * a DEBUG WARN, leaving voice playback silently disabled. */
void platform_voice_init(void);

/* Loads data/SOUND/VOC<sample_id as two decimal digits>.wav (see
 * platform_voice.c for the exact digit formula, confirmed via a live
 * Ghidra decompile of the real play_numbered_voice_sample) and plays it
 * as the current voice line, replacing/interrupting whatever voice
 * sample (if any) was already playing. A no-op (with a DEBUG warning,
 * logged only once per missing id) if the id is out of the representable
 * two-digit range, the file doesn't exist, or no audio device is open. */
void platform_voice_play(int sample_id);

/* True if no voice sample is currently playing (nothing was ever
 * started, the backend never opened, or the most recently started
 * sample has finished) -- the real query behind is_voice_sample_finished. */
int platform_voice_is_finished(void);

/* Stops whatever voice sample is currently playing, if any -- the real
 * action behind stop_voice_sample. A safe no-op if nothing is playing. */
void platform_voice_stop(void);

/* Closes the audio device and releases the currently-loaded sample
 * buffer, for real app shutdown. Safe to call even if
 * platform_voice_init never succeeded. */
void platform_voice_shutdown(void);

#endif
