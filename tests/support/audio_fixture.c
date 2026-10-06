#include "audio_fixture.h"
#include <string.h>

/* Storage for audio.c's own private (file-static) music-timing globals
   -- audio.c itself is never linked whole into this test, only the
   exact function bodies extracted below, so each one needs real
   storage here instead. */
int DAT_00087454, DAT_00087448;
byte DAT_0023c3a8;
undefined1 DAT_0023c384;
undefined4 DAT_0023c280, DAT_0023c330;
int DAT_0023c378;
undefined4 *DAT_0023c3b8;
char s__SOUND__0008750c[] = "\\SOUND\\";
char s_uw00_mod_00087514[] = "uw00.mod";
undefined1 DAT_0023cca8_backing[1024];
int DAT_0023c3bc;
undefined1 DAT_0023c3d4_backing[128];
/* extern-declared by src/headers/game.h (pulled in via uw.h); game.c
   itself isn't linked into this suite, so real storage lives here --
   only ever touched on trigger_sound_sample_note's own dead path. */
undefined4 DAT_0023c540;

/* DAT_00086df8/DAT_00101944 storage already comes from uw_test_support
   (character_storage.c/scheduler-adjacent fixtures don't apply here,
   so give them real storage too -- not provided by this suite's own
   base sources). */
char *DAT_00086df8;
undefined4 DAT_00101944;
undefined2 DAT_00201b60;

static unsigned char combat_flag_byte[0x60];
static unsigned fake_clock;
static long next_random;
static int load_track_calls;
static char last_loaded_track[32];
static int sfx_play_calls;
static int last_sfx_resource_id;

void audio_fixture_reset(void)
{
    DAT_00087454 = 1;
    DAT_00087448 = 1;
    DAT_0023c3a8 = 0;
    DAT_0023c384 = 0;
    DAT_0023c280 = 0;
    DAT_0023c330 = 0;
    DAT_0023c378 = 0;
    DAT_0023c3b8 = 0;
    DAT_0023c3bc = 0;
    memset(DAT_0023c3d4_backing, 0, sizeof DAT_0023c3d4_backing);
    DAT_00201b60 = 1; /* top-level game mode: 1 == normal dungeon gameplay */
    memset(combat_flag_byte, 0, sizeof combat_flag_byte);
    DAT_00086df8 = (char *)combat_flag_byte; /* byte[0x5f] bit 2 == "in combat" */
    DAT_00101944 = 0;
    fake_clock = 0;
    next_random = 0;
    load_track_calls = 0;
    last_loaded_track[0] = 0;
    sfx_play_calls = 0;
    last_sfx_resource_id = 0;
}

void audio_fixture_advance_clock(unsigned units) { fake_clock += units; }
void audio_fixture_set_next_random(long value) { next_random = value; }
int audio_fixture_load_track_call_count(void) { return load_track_calls; }
const char *audio_fixture_last_loaded_track(void) { return last_loaded_track; }
int audio_fixture_sfx_play_call_count(void) { return sfx_play_calls; }
int audio_fixture_last_sfx_resource_id(void) { return last_sfx_resource_id; }

uint read_realtime_clock_units(void) { return fake_clock; }
long ce_rand(void) { return next_random; }

void platform_music_load_track(const char *win_path)
{
    load_track_calls++;
    strncpy(last_loaded_track, win_path, sizeof last_loaded_track - 1);
}
void platform_music_start(void) {}
void platform_music_stop(void) {}
void platform_music_shutdown(void) {}

/* trigger_sound_sample_note's real interception point (see audio.c's
   "BUG FIX (real SFX playback)" comment) -- records what it was
   called with instead of touching any real audio device. */
void platform_sfx_play(int resource_id)
{
    sfx_play_calls++;
    last_sfx_resource_id = resource_id;
}

/* Unreachable in every scenario this suite drives: DAT_0023c3b8 (the
   dead decompiled MOD engine's COM-style handle) is never assigned a
   value anywhere in the real music backend either -- see audio.c's
   "Real MOD playback backend" block comment. */
undefined4 stop_mod_player_playback()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead MOD engine stop_mod_player_playback");
    return 0;
}

/* Every function below here is reachable only from trigger_sound_sample_note's
   own dead `DAT_0023c3b8 != 0` body (DAT_0023c3b8 stays 0 throughout
   this fixture -- see audio_fixture_reset) -- same "never executes,
   but still needs to link" shape as stop_mod_player_playback above. */
long cpp_operator_new()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead MOD/SFX engine cpp_operator_new");
    return 0;
}
long SetFileTime()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead MOD/SFX engine SetFileTime");
    return 0;
}
undefined1 *construct_and_load_mod_player()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead MOD engine construct_and_load_mod_player");
    return 0;
}
undefined4 start_mod_player_playback()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead MOD engine start_mod_player_playback");
    return 0;
}
undefined4 init_sound_channel_slot()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead SFX engine init_sound_channel_slot");
    return 0;
}
undefined4 stop_sfx_trigger_slot()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead SFX engine stop_sfx_trigger_slot");
    return 0;
}
undefined4 load_and_resample_wave_sample()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead SFX engine load_and_resample_wave_sample");
    return 0;
}
bool arm_sfx_trigger_slot()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead SFX engine arm_sfx_trigger_slot");
    return 0;
}
undefined4 start_sfx_trigger_slot()
{
    TEST_FAIL_MESSAGE("Unexpected call to dead SFX engine start_sfx_trigger_slot");
    return 0;
}
