#include "audio_fixture.h"

void setUp(void) { audio_fixture_reset(); }
void tearDown(void) {}

/* Reproduces the "music starts playing a new track every few seconds"
   bug report: update_ingame_music_track (the real per-frame dungeon
   music tick, called from player.c/babl.c/automap.c) only reselects a
   track once advance_menu_music_track_elapsed() says the current
   track's real duration has actually run out. That duration comes
   from DAT_00087414, a per-track table recovered from UU.exe's real
   .data -- if that table were still all-zero (its state before this
   fix), every track's budget would be just 3 read_realtime_clock_units
   ticks (12ms), so this loop would reselect on nearly every tick. */
static void test_ambient_track_stays_stable_well_within_its_real_duration(void)
{
    play_music_track(2, 1); /* ambient track 2 -- one legitimate load to start it */
    /* A reselect, if one wrongly fires, must land on a track other than
       2 so a spurious reselect can't hide behind "picked the same
       track again by coincidence." */
    audio_fixture_set_next_random(1);
    TEST_ASSERT_EQUAL_UINT(2, DAT_0023c3a8);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_load_track_call_count());

    /* 50 simulated frames at 64ms (16 clock units) each == 3.2s of
       gameplay -- track 2's real budget is (121*256+3)*4ms =~ 124s,
       so nothing should happen yet. */
    for (int frame = 0; frame < 50; frame++) {
        audio_fixture_advance_clock(16);
        update_ingame_music_track();
    }

    TEST_ASSERT_EQUAL_UINT(2, DAT_0023c3a8);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_load_track_call_count());
}

/* The flip side: once the track's real duration genuinely elapses,
   update_ingame_music_track must still pick a new one -- the fix isn't
   "freeze the timer," it's "use the real per-track budget." */
static void test_ambient_track_advances_once_its_real_duration_elapses(void)
{
    play_music_track(2, 1);
    audio_fixture_set_next_random(1); /* ce_rand()%3+2 == 3: a genuinely different track */

    audio_fixture_advance_clock(121 * 256 + 3 + 100); /* just past track 2's real budget, in clock units */
    update_ingame_music_track();

    TEST_ASSERT_EQUAL_UINT(3, DAT_0023c3a8);
    TEST_ASSERT_EQUAL_INT(2, audio_fixture_load_track_call_count()); /* initial load + the real reselect */
    TEST_ASSERT_EQUAL_STRING("\\SOUND\\uw03.mod", audio_fixture_last_loaded_track());
}

/* trigger_sound_sample_note (was FUN_00073140) triggers resource id
   param_1+800 as a one-shot WAVE sample -- see its own "BUG FIX (real
   SFX playback)" comment in audio.c. This is a pure logic-level check
   that the real interception calls platform_sfx_play with exactly
   that id, independent of the dead DAT_0023c3b8-gated body underneath
   it (which stays unreached here, same as every other scenario this
   suite drives -- see audio_fixture_reset). */
static void test_trigger_sound_sample_note_plays_resource_id_plus_800(void)
{
    trigger_sound_sample_note(1, 0);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_sfx_play_call_count());
    TEST_ASSERT_EQUAL_INT(801, audio_fixture_last_sfx_resource_id());

    trigger_sound_sample_note(59, 0);
    TEST_ASSERT_EQUAL_INT(2, audio_fixture_sfx_play_call_count());
    TEST_ASSERT_EQUAL_INT(859, audio_fixture_last_sfx_resource_id());
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_ambient_track_stays_stable_well_within_its_real_duration);
    RUN_TEST(test_ambient_track_advances_once_its_real_duration_elapses);
    RUN_TEST(test_trigger_sound_sample_note_plays_resource_id_plus_800);
    return UNITY_END();
}
