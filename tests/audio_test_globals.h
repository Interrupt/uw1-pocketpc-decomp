#include "src/headers/uw.h"

/* The @-extracted real backing-array definitions bring their own
   storage, not the #define alias audio.c declares right after them. */
#define DAT_00087414 DAT_00087414_backing[0]
#define DAT_000873e0 DAT_000873e0_backing[0]

/* Private (file-static in audio.c) music-timing globals these
   extracted functions touch directly -- storage in audio_fixture.c. */
extern byte DAT_0023c3a8;
extern undefined1 DAT_0023c384;
extern undefined4 DAT_0023c280, DAT_0023c330;
extern int DAT_0023c378;
extern undefined4 *DAT_0023c3b8;
extern char s__SOUND__0008750c[], s_uw00_mod_00087514[];

/* trigger_sound_sample_note's own private globals, same shape as
   audio.c's own declarations -- only ever touched on the dead
   DAT_0023c3b8!=0 path (never true in this fixture, see
   audio_fixture_reset), but still need real storage/macros to link. */
extern int DAT_0023c3bc;
#define DAT_0023c3d4 DAT_0023c3d4_backing[0]
extern undefined1 DAT_0023c3d4_backing[128];

/* audio.c includes headers/platform_music.h and headers/platform_sfx.h
   directly; the generated test translation unit doesn't go through
   audio.c's own #include list, so each real backend's interface is
   declared here instead. */
void platform_music_load_track(const char *win_path);
void platform_music_start(void);
void platform_music_stop(void);
void platform_music_shutdown(void);
void platform_sfx_play(int resource_id);
