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

/* play_numbered_voice_sample (was FUN_000738c4) plays a numbered VOC
   voice/narration sample -- see its own "BUG FIX (real voice-sample
   playback)" comment history in audio.c. This is a pure logic-level
   check that the real interception calls platform_voice_play with
   exactly the id it was given, independent of the dead
   DAT_0023c3b8-gated body underneath it (which stays unreached here,
   same as every other scenario this suite drives -- see
   audio_fixture_reset). */
static void test_play_numbered_voice_sample_plays_the_given_id(void)
{
    play_numbered_voice_sample(5);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_voice_play_call_count());
    TEST_ASSERT_EQUAL_INT(5, audio_fixture_last_voice_sample_id());

    play_numbered_voice_sample(27);
    TEST_ASSERT_EQUAL_INT(2, audio_fixture_voice_play_call_count());
    TEST_ASSERT_EQUAL_INT(27, audio_fixture_last_voice_sample_id());
}

/* is_voice_sample_finished (was FUN_00073ac4) is the real query behind
   babl_render_tick's "has the forced-on voice line finished?" check --
   see its own "BUG FIX (real voice-sample playback)" comment in
   audio.c for the live-crash finding this interception avoids. This
   confirms the function returns platform_voice_is_finished()'s answer
   directly in both directions, never touching the dead (and, for
   is_voice_sample_finished specifically, unguarded/crash-prone) body
   underneath. */
static void test_is_voice_sample_finished_reflects_the_real_backend(void)
{
    audio_fixture_set_voice_is_finished(0);
    TEST_ASSERT_FALSE(is_voice_sample_finished());

    audio_fixture_set_voice_is_finished(1);
    TEST_ASSERT_TRUE(is_voice_sample_finished());
}

/* stop_voice_sample (was FUN_00073aec) is the real stop behind babl.c's
   end-of-conversation cleanup. Logic-level check that it reaches the
   real backend, independent of the dead DAT_0023c3b8-gated body
   underneath (unreached here, same as play_numbered_voice_sample
   above). */
static void test_stop_voice_sample_stops_the_real_backend(void)
{
    stop_voice_sample();
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_voice_stop_call_count());
}

/* allocate_and_play_sound_channel's id-whitelist (see its own
   "INVESTIGATED" comment in audio.c, confirmed via a live Ghidra
   decompile of the real FUN_00073064): only ids {3,4,7,8,0x10,0x15,
   0x16} ever reach trigger_sound_sample_note/platform_sfx_play --
   everything else returns 0xff without ever triggering a sample. */
static void test_allocate_and_play_sound_channel_id_whitelist(void)
{
    /* A valid id reaches platform_sfx_play with resource id+800. */
    uint result = allocate_and_play_sound_channel(3, 0, 0, 0x40, 0, 0);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_sfx_play_call_count());
    TEST_ASSERT_EQUAL_INT(803, audio_fixture_last_sfx_resource_id());
    TEST_ASSERT_NOT_EQUAL(0xff, result);

    /* An id below the whitelist's floor (e.g. a footstep id, 0 or 2 --
       see movement.c's own play_sound_effect_with_pan(0/2,...) calls)
       fails outright and never reaches platform_sfx_play. */
    result = allocate_and_play_sound_channel(2, 0, 0, 0x40, 0, 0);
    TEST_ASSERT_EQUAL_UINT(0xff, result);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_sfx_play_call_count()); /* unchanged */

    /* An id above the whitelist with no special-case match (e.g. a
       door id, 0xb/0x14 -- see doors.c) also fails outright. */
    result = allocate_and_play_sound_channel(0x14, 0, 0, 0x40, 0, 0);
    TEST_ASSERT_EQUAL_UINT(0xff, result);
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_sfx_play_call_count()); /* unchanged */
}

/* Sizing-audit regression: g_sound_channel_state/g_sound_channel_group
   (see their own declaration comment in audio.c) are 5 entries wide
   specifically because DAT_0023c39c's bits are never cleared anywhere
   in this decompile -- allocate_and_play_sound_channel's own bit-scan
   loop runs out of free slots after 4 distinct successful calls and
   writes index 4 on every call after that. Driving all 7 whitelisted
   ids through in a row exercises exactly that boundary (calls 5-7
   each land on index 4) -- this must not crash (and, pre-fix, would
   have been a 1-byte/2-byte out-of-bounds write on 4-entry arrays). */
static void test_allocate_and_play_sound_channel_survives_channel_exhaustion(void)
{
    static const int valid_ids[] = {3, 4, 7, 8, 0x10, 0x15, 0x16};
    for (size_t i = 0; i < sizeof valid_ids / sizeof valid_ids[0]; i++) {
        uint result = allocate_and_play_sound_channel(valid_ids[i], 0, 0, 0x40, 0, 0);
        TEST_ASSERT_NOT_EQUAL(0xff, result);
    }
    TEST_ASSERT_EQUAL_INT(7, audio_fixture_sfx_play_call_count());
    TEST_ASSERT_EQUAL_INT(0x16 + 800, audio_fixture_last_sfx_resource_id());
}

/* BUG FIX regression (real crash, confirmed live -- see
   stop_current_audio_handle_dup's own comment in audio.c):
   stop_current_audio_handle_dup must NOT call stop_mod_player_playback
   when DAT_0023c3b8 is NULL, even once DAT_00087454/DAT_00087448 are
   both set (which platform_music_init now genuinely does on a real
   machine) -- audio_fixture.c's stop_mod_player_playback stub hard-
   fails the test if it's ever called at all, so this test fails loudly
   if the missing NULL guard regresses. */
static void test_stop_current_audio_handle_dup_does_not_crash_on_null_handle(void)
{
    DAT_0023c3b8 = 0; /* dead MOD engine handle -- always NULL by design */
    stop_current_audio_handle_dup(); /* must not call stop_mod_player_playback */
    TEST_PASS();
}

/* BUG FIX regression (real crash, confirmed live + via Ghidra -- see
   play_sound_effect_at_object's own comment in audio.c):
   play_weapon_impact_sound's whiff-case branch (no target acquired)
   calls get_object_record_by_slot_index(0), which legitimately returns
   NULL, then passes that straight through play_sound_effect_at_object
   to an unconditional pointer dereference -- a real SIGSEGV reachable
   by swinging a weapon with nothing in range. Asserts both the early
   return AND that play_positional_sound_effect is never reached at
   all, so this fails loudly (not just "wrong return value") if the
   NULL guard regresses. */
static void test_play_sound_effect_at_object_does_not_crash_on_null_object(void)
{
    undefined4 result = play_sound_effect_at_object(10, 0, 0);
    TEST_ASSERT_EQUAL_UINT(0xff, result);
    TEST_ASSERT_EQUAL_INT(0, audio_fixture_positional_sfx_call_count());
}

/* BUG FIX regression (real crash, confirmed live via lldb -- see
   play_sound_effect_at_object's own comment in audio.c):
   param_2 was `int`, truncating the real 64-bit object pointer every
   real caller passes (e.g. spawn_object_near_player's own
   play_sound_effect_at_object(10,puVar6,0) in objects.c) -- confirmed
   live: dropping an item into a container SIGSEGV'd reading
   *(ushort*)(param_2+0x16) with param_2 == 87805 (0x1577d), a small
   truncated value, not a real heap address and not NULL. This builds a
   real local object record on the stack (whose address, like any real
   64-bit pointer, doesn't fit in 32 bits) with known bytes at offsets
   0x16/0x17 (the position word) and 3 (the facing/group byte), and
   checks play_sound_effect_at_object forwards the exact pan/volume
   those real bytes compute to play_positional_sound_effect -- if
   param_2 were still truncated, this would read garbage (or crash)
   instead of these exact values. */
static void test_play_sound_effect_at_object_does_not_truncate_the_object_pointer(void)
{
    unsigned char fake_object[0x20];
    memset(fake_object, 0, sizeof fake_object);
    fake_object[3] = 0xA0;             /* byte3: >>5 == 5, >>2&7 == 0 */
    fake_object[0x16] = 0x34;          /* word16 (LE) == 0x1234:       */
    fake_object[0x17] = 0x12;          /*   &0xfc00>>7 == 32, &0x3f0>>1 == 280 */

    undefined4 result = play_sound_effect_at_object(10, fake_object, 99);

    TEST_ASSERT_EQUAL_INT(1, audio_fixture_positional_sfx_call_count());
    TEST_ASSERT_EQUAL_INT(10, audio_fixture_last_positional_sfx_id());
    TEST_ASSERT_EQUAL_INT(32 + 5, audio_fixture_last_positional_sfx_pan());
    TEST_ASSERT_EQUAL_INT(0 + 280, audio_fixture_last_positional_sfx_volume());
}

/* BUG FIX regression (real crash, same class as the two fixes above --
   see play_weapon_impact_sound's own "BUG FIX" comment in combat.c):
   the hit branch (param_1 != 0) dereferenced
   get_object_record_by_slot_index(DAT_00100610)'s result unconditionally,
   with no NULL check, before ever reaching play_sound_effect_at_object
   (the function fixed above) at all. get_object_record_by_slot_index
   legitimately returns NULL for an empty slot -- audio_fixture.c's
   version is directly controllable via
   audio_fixture_set_next_object_record. */
static void test_play_weapon_impact_sound_does_not_crash_on_null_attacker(void)
{
    audio_fixture_set_next_object_record(0); /* empty slot -- the real, legitimate case */

    undefined4 result = play_weapon_impact_sound(1); /* param_1 != 0: the hit branch */

    TEST_ASSERT_EQUAL_UINT(0, result);
    TEST_ASSERT_EQUAL_INT(0, audio_fixture_positional_sfx_call_count());
}

/* Flip side: a real attacker record in the hit branch must still reach
   play_sound_effect_at_object/play_positional_sound_effect normally --
   confirms the new guard only rejects the NULL case, not every call. */
static void test_play_weapon_impact_sound_plays_a_sound_for_a_real_attacker(void)
{
    unsigned char attacker[0x20];
    memset(attacker, 0, sizeof attacker);
    attacker[0] = 5; /* low byte of the packed `*puVar6 & 0x1ff` id field */
    audio_fixture_set_next_object_record(attacker);

    undefined4 result = play_weapon_impact_sound(1);

    (void)result;
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_positional_sfx_call_count());
}

/* BUG FIX regression (confirmed live): allocate_and_play_sound_channel's
   id whitelist admits only {3,4,7,8,0x10,0x15,0x16}, which is authentic
   WinCE behavior -- the port only shipped WAVE resources for those -- and
   is why footsteps (0/2) and doors (0xb/0x14) are silent there. It must
   stay the default. */
static void test_sfx_id_whitelist_still_rejects_other_ids_by_default(void)
{
    audio_fixture_set_dos_audio_enabled(0);
    TEST_ASSERT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(0, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(2, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(0xb, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(0x14, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_INT(0, audio_fixture_sfx_play_call_count());
}

/* The DOS game has no such limitation: SOUNDS.DAT defines all 24 effect
   ids and UW.AD carries a timbre for each, so in DOS mode every id must
   reach the backend -- this is what makes footsteps and doors audible. */
static void test_dos_audio_mode_plays_ids_the_whitelist_rejects(void)
{
    audio_fixture_set_dos_audio_enabled(1);
    TEST_ASSERT_NOT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(0, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_INT(1, audio_fixture_sfx_play_call_count());
    TEST_ASSERT_EQUAL_INT(800, audio_fixture_last_sfx_resource_id());

    TEST_ASSERT_NOT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(0xb, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_INT(2, audio_fixture_sfx_play_call_count());
    TEST_ASSERT_EQUAL_INT(800 + 0xb, audio_fixture_last_sfx_resource_id());
}

/* The whitelisted ids must behave identically either way -- the DOS escape
   is additive, not a rewrite of the mapping. */
static void test_dos_audio_mode_leaves_whitelisted_ids_alone(void)
{
    audio_fixture_set_dos_audio_enabled(1);
    TEST_ASSERT_NOT_EQUAL_UINT(0xff, allocate_and_play_sound_channel(3, 0, 0, 0x40, 0, 0));
    TEST_ASSERT_EQUAL_INT(803, audio_fixture_last_sfx_resource_id());
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_ambient_track_stays_stable_well_within_its_real_duration);
    RUN_TEST(test_ambient_track_advances_once_its_real_duration_elapses);
    RUN_TEST(test_trigger_sound_sample_note_plays_resource_id_plus_800);
    RUN_TEST(test_play_numbered_voice_sample_plays_the_given_id);
    RUN_TEST(test_is_voice_sample_finished_reflects_the_real_backend);
    RUN_TEST(test_stop_voice_sample_stops_the_real_backend);
    RUN_TEST(test_allocate_and_play_sound_channel_id_whitelist);
    RUN_TEST(test_allocate_and_play_sound_channel_survives_channel_exhaustion);
    RUN_TEST(test_stop_current_audio_handle_dup_does_not_crash_on_null_handle);
    RUN_TEST(test_play_sound_effect_at_object_does_not_crash_on_null_object);
    RUN_TEST(test_play_sound_effect_at_object_does_not_truncate_the_object_pointer);
    RUN_TEST(test_play_weapon_impact_sound_does_not_crash_on_null_attacker);
    RUN_TEST(test_play_weapon_impact_sound_plays_a_sound_for_a_real_attacker);
    RUN_TEST(test_sfx_id_whitelist_still_rejects_other_ids_by_default);
    RUN_TEST(test_dos_audio_mode_plays_ids_the_whitelist_rejects);
    RUN_TEST(test_dos_audio_mode_leaves_whitelisted_ids_alone);
    return UNITY_END();
}
