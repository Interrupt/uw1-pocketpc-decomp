/* Tests for the optional DOS-audio backend (src/platform_dosmidi.c).
 *
 * The two things worth pinning down here are (a) that the mode is OFF
 * unless explicitly asked for, since the whole feature is opt-in and the
 * ARM/WinCE audio path must stay the default, and (b) the
 * "\SOUND\uwNN.mod" -> "<UW_DOS_DATA_DIR>/SOUND/AWNN.XMI" mapping, because
 * play_music_track's track numbering is base-8 style and this project has
 * already shipped one bug where a wrong track number silently played a
 * real-but-wrong file. The AW set rather than the UW set is deliberate --
 * see platform_dosmidi_xmi_path's own comment. */
#include "unity.h"
#include "src/headers/options.h"
#include "headers/platform_dosmidi.h"
#include <stdlib.h>
#include <string.h>

/* audio.c's own, which this suite does not link. Recorded rather than
   ignored: platform_dosmidi_init is supposed to publish every effect's
   base volume through here (the byte the decompile lost), and that only
   happens when the DOS files are actually present. */
static int base_volume_calls;
void audio_set_effect_base_volume(int sound_id, int velocity)
{
    (void)sound_id; (void)velocity;
    base_volume_calls++;
}

void setUp(void)
{
    options_unset("audio-mode");
    options_unset("dos-data-dir");
    platform_dosmidi_shutdown();
    base_volume_calls = 0;
}

void tearDown(void)
{
    platform_dosmidi_shutdown();
    options_unset("audio-mode");
    options_unset("dos-data-dir");
}

/* The guarantee the whole feature hangs on: nothing about DOS audio
   engages unless the player opts in.

   UW_DOS_DATA_DIR is deliberately set here even though UW_AUDIO_MODE is
   not. Without it this test passes for the wrong reason -- init would
   bail on the missing data directory and mask a broken mode check
   entirely (confirmed by mutation: removing the UW_AUDIO_MODE test does
   not fail this case unless the data dir is present). */
static void test_dos_mode_is_off_by_default(void)
{
    options_set("dos-data-dir", "/tmp");
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

static void test_dos_mode_ignores_unrelated_mode_values(void)
{
    options_set("audio-mode", "arm");
    options_set("dos-data-dir", "/nonexistent");
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

/* Fail-soft: asking for DOS mode without pointing at any DOS assets must
   degrade to the normal path, not crash and not half-enable. */
static void test_dos_mode_requires_a_data_dir(void)
{
    options_set("audio-mode", "dos");
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

/* Fail-soft: a data dir that exists but holds no DOS audio files must
   degrade, not half-enable. (The mode name's case-insensitivity is covered
   by test_dos_mode_ignores_unrelated_mode_values' negative side; enabling
   for real needs ADLIB.ADV, UW.AD and SOUNDS.DAT, which a unit test has no
   business shipping.) */
static void test_dos_mode_requires_the_dos_audio_files(void)
{
    options_set("audio-mode", "DOS");
    options_set("dos-data-dir", "/tmp");
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
    /* And it must not have published anything either: a failed init leaves
       audio.c's volume table exactly as the default path expects it. */
    TEST_ASSERT_EQUAL_INT(0, base_volume_calls);
}

static void test_xmi_path_maps_track_to_the_adlib_xmi(void)
{
    options_set("dos-data-dir", "/dos/UW");
    char out[256];
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("\\SOUND\\uw01.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/AW01.XMI", out);
}

/* Track 13 (automap/talk/rest) is "uw15" under play_music_track's base-8
   digit construction -- whatever digits it produced must survive this
   mapping untouched. */
static void test_xmi_path_preserves_the_track_digits(void)
{
    options_set("dos-data-dir", "/dos/UW");
    char out[256];
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("\\SOUND\\uw15.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/AW15.XMI", out);
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("\\SOUND\\uw10.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/AW10.XMI", out);
}

static void test_xmi_path_accepts_forward_slashes(void)
{
    options_set("dos-data-dir", "/dos/UW");
    char out[256];
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("/SOUND/uw07.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/AW07.XMI", out);
}

static void test_xmi_path_needs_a_data_dir(void)
{
    char out[256];
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\uw01.mod", out, sizeof out));
}

/* Must refuse rather than emit a silently truncated path. */
static void test_xmi_path_rejects_a_too_small_buffer(void)
{
    options_set("dos-data-dir", "/dos/UW");
    char out[8];
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\uw01.mod", out, sizeof out));
}

static void test_xmi_path_rejects_a_pathological_path(void)
{
    options_set("dos-data-dir", "/dos/UW");
    char out[256];
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\", out, sizeof out));
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("", out, sizeof out));
    /* not a track name: only the uwNN set maps to the AW set */
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\voc01.wav", out, sizeof out));
}

/* Rendering with nothing loaded must produce no frames rather than
   touching the caller's buffer -- the audio callback relies on this to
   leave its pre-zeroed buffer silent. */
static void test_render_produces_nothing_when_no_track_is_loaded(void)
{
    short buf[64];
    memset(buf, 0x7f, sizeof buf);
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_render(buf, 32));
}

/* BUG FIX regression (confirmed live: falling in water started a sound
   that never stopped). Effect id 0, the movement sound, runs 25s where
   every other effect is under 1.5, and movement.c stops it explicitly via
   stop_movement_sound_handle. Both of these must be safe to call when DOS
   mode is not live, since the default path reaches them too. */
/* The widened entry point must stay safe when DOS mode is off, including
   the -1 "use the table's own" sentinels and out-of-range values. */
static void test_play_effect_is_safe_when_dos_mode_is_off(void)
{
    platform_dosmidi_play_effect(0, -1, -1);
    platform_dosmidi_play_effect(5, 0x7f, 0x40);
    platform_dosmidi_play_effect(23, 999, 999);
    platform_dosmidi_play_effect(-1, 0, 0);
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

static void test_stop_effect_is_safe_when_dos_mode_is_off(void)
{
    platform_dosmidi_stop_effect(0);
    platform_dosmidi_stop_effect(23);
    platform_dosmidi_stop_effect(-1);
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

/* The music volume is a percentage and must stay one whatever it is
   handed -- it reaches the driver, which has no range check of its own. */
static void test_music_volume_is_clamped_to_a_percentage(void)
{
    platform_dosmidi_set_music_volume(-20);
    platform_dosmidi_set_music_volume(500);
    platform_dosmidi_set_music_volume(80);
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

/* The effect table comes from the port's own game data, so a DOS directory
   that has no SOUNDS.DAT is no longer a reason to decline. Here neither is
   present -- no UW_DATA_DIR to resolve against and an empty DOS dir -- so
   it still declines; the point of the test is that it does so cleanly
   rather than reading a stale path. */
static void test_missing_effect_table_everywhere_declines_cleanly(void)
{
    options_unset("data-dir");
    options_set("audio-mode", "dos");
    options_set("dos-data-dir", "/tmp");
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_dos_mode_is_off_by_default);
    RUN_TEST(test_dos_mode_ignores_unrelated_mode_values);
    RUN_TEST(test_dos_mode_requires_a_data_dir);
    RUN_TEST(test_dos_mode_requires_the_dos_audio_files);
    RUN_TEST(test_xmi_path_maps_track_to_the_adlib_xmi);
    RUN_TEST(test_xmi_path_preserves_the_track_digits);
    RUN_TEST(test_xmi_path_accepts_forward_slashes);
    RUN_TEST(test_xmi_path_needs_a_data_dir);
    RUN_TEST(test_xmi_path_rejects_a_too_small_buffer);
    RUN_TEST(test_xmi_path_rejects_a_pathological_path);
    RUN_TEST(test_render_produces_nothing_when_no_track_is_loaded);
    RUN_TEST(test_play_effect_is_safe_when_dos_mode_is_off);
    RUN_TEST(test_stop_effect_is_safe_when_dos_mode_is_off);
    RUN_TEST(test_music_volume_is_clamped_to_a_percentage);
    RUN_TEST(test_missing_effect_table_everywhere_declines_cleanly);
    return UNITY_END();
}
