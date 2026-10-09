#include "src/headers/uw.h"

/* The @-extracted real backing-array definitions bring their own
   storage, not the #define alias audio.c declares right after them. */
#define DAT_00087414 DAT_00087414_backing[0]
#define DAT_000873e0 DAT_000873e0_backing[0]
#define DAT_00087520 DAT_00087520_backing[0]

/* Private (file-static in audio.c) music-timing globals these
   extracted functions touch directly -- storage in audio_fixture.c. */
extern byte DAT_0023c3a8;
extern undefined1 DAT_0023c384;
extern undefined4 DAT_0023c280, DAT_0023c330;
extern int DAT_0023c378;
extern char *DAT_0023c3b8;
extern char s__SOUND__0008750c[], s_uw00_mod_00087514[];

/* Sound-effects-subsystem twins of DAT_00087454/DAT_00087448 (both
   non-static in audio.c now -- see their own comment there), and
   allocate_and_play_sound_channel's own private channel-slot
   bookkeeping it indexes directly -- storage in audio_fixture.c. */
extern int DAT_00087450, DAT_0008744c;
extern byte g_sound_channel_state[5];
extern ushort g_sound_channel_group[5];
extern byte DAT_0023c39c;

/* trigger_sound_sample_note's own private globals, same shape as
   audio.c's own declarations -- only ever touched on the dead
   DAT_0023c3b8!=0 path (never true in this fixture, see
   audio_fixture_reset), but still need real storage/macros to link. */
extern char *DAT_0023c3bc;
#define DAT_0023c3d4 DAT_0023c3d4_backing[0]
extern undefined1 DAT_0023c3d4_backing[128];

/* audio.c includes headers/platform_music.h, headers/platform_sfx.h and
   headers/platform_voice.h directly; the generated test translation unit
   doesn't go through audio.c's own #include list, so each real
   backend's interface is declared here instead. */
void platform_music_load_track(const char *win_path);
void platform_music_start(void);
void platform_music_stop(void);
void platform_music_shutdown(void);
void platform_sfx_play(int resource_id);
void platform_voice_play(int sample_id);
int platform_voice_is_finished(void);
void platform_voice_stop(void);

/* play_numbered_voice_sample's own dead `DAT_0023c3b8 != 0` body (never
   true in this fixture, see audio_fixture_reset) still needs
   DAT_00241f08 to link -- real storage (non-extern) lives in
   audio_fixture.c since game.c, its real owner, isn't linked into this
   suite. The extern+macro here just needs to see game.h's own
   declaration, already pulled in transitively via uw.h above. */

/* play_weapon_impact_sound's own private (file-static in combat.c)
   globals -- storage in audio_fixture.c since combat.c itself isn't
   linked into this suite. DAT_00100610 is already declared extern via
   headers/combat.h (combat.c's own copy is non-static); the rest
   aren't declared in any header. */
extern ushort DAT_00100620;
extern undefined2 DAT_00100624;
/* Real size (ai.c's own DAT_001007d0_backing[3072]) -- play_weapon_impact_sound
   indexes up to (0x3f*0x30)+0x10 == 3040 bytes in, so a smaller stub
   would be a genuine (fixture-only) out-of-bounds read under ASan. */
#define DAT_001007e0 DAT_001007d0_backing[0x10]
extern undefined1 DAT_001007d0_backing[3072];

/* allocate_and_play_sound_channel asks whether DOS audio mode is live
   before rejecting an id its whitelist does not admit. Defined by
   support/audio_fixture.c (controllable via
   audio_fixture_set_dos_audio_enabled); the real one is in
   platform_dosmidi.c, which this suite does not link. */
int platform_dos_audio_enabled(void);
