/* Tests for the optional DOS-audio backend (src/platform_dosmidi.c).
 *
 * The two things worth pinning down here are (a) that the mode is OFF
 * unless explicitly asked for, since the whole feature is opt-in and the
 * ARM/WinCE audio path must stay the default, and (b) the
 * "\SOUND\uwNN.mod" -> "<UW_DOS_DATA_DIR>/SOUND/UWNN.XMI" mapping, because
 * play_music_track's track numbering is base-8 style and this project has
 * already shipped one bug where a wrong track number silently played a
 * real-but-wrong file. */
#include "unity.h"
#include "headers/platform_dosmidi.h"
#include <stdlib.h>
#include <string.h>

void setUp(void)
{
    unsetenv("UW_AUDIO_MODE");
    unsetenv("UW_DOS_DATA_DIR");
    platform_dosmidi_shutdown();
}

void tearDown(void)
{
    platform_dosmidi_shutdown();
    unsetenv("UW_AUDIO_MODE");
    unsetenv("UW_DOS_DATA_DIR");
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
    setenv("UW_DOS_DATA_DIR", "/tmp", 1);
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

static void test_dos_mode_ignores_unrelated_mode_values(void)
{
    setenv("UW_AUDIO_MODE", "arm", 1);
    setenv("UW_DOS_DATA_DIR", "/nonexistent", 1);
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

/* Fail-soft: asking for DOS mode without pointing at any DOS assets must
   degrade to the normal path, not crash and not half-enable. */
static void test_dos_mode_requires_a_data_dir(void)
{
    setenv("UW_AUDIO_MODE", "dos", 1);
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_init(44100));
    TEST_ASSERT_FALSE(platform_dos_audio_enabled());
}

/* Matches UW_LIGHT_MODE=dos's own case-insensitive handling. */
static void test_dos_mode_name_is_case_insensitive(void)
{
    setenv("UW_AUDIO_MODE", "DOS", 1);
    setenv("UW_DOS_DATA_DIR", "/tmp", 1);
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_init(44100));
    TEST_ASSERT_TRUE(platform_dos_audio_enabled());
}

static void test_xmi_path_maps_track_to_uppercase_xmi(void)
{
    setenv("UW_DOS_DATA_DIR", "/dos/UW", 1);
    char out[256];
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("\\SOUND\\uw01.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/UW01.XMI", out);
}

/* Track 13 (automap/talk/rest) is "uw15" under play_music_track's base-8
   digit construction -- whatever digits it produced must survive this
   mapping untouched. */
static void test_xmi_path_preserves_the_track_digits(void)
{
    setenv("UW_DOS_DATA_DIR", "/dos/UW", 1);
    char out[256];
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("\\SOUND\\uw15.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/UW15.XMI", out);
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("\\SOUND\\uw10.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/UW10.XMI", out);
}

static void test_xmi_path_accepts_forward_slashes(void)
{
    setenv("UW_DOS_DATA_DIR", "/dos/UW", 1);
    char out[256];
    TEST_ASSERT_EQUAL_INT(1, platform_dosmidi_xmi_path("/SOUND/uw07.mod", out, sizeof out));
    TEST_ASSERT_EQUAL_STRING("/dos/UW/SOUND/UW07.XMI", out);
}

static void test_xmi_path_needs_a_data_dir(void)
{
    char out[256];
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\uw01.mod", out, sizeof out));
}

/* Must refuse rather than emit a silently truncated path. */
static void test_xmi_path_rejects_a_too_small_buffer(void)
{
    setenv("UW_DOS_DATA_DIR", "/dos/UW", 1);
    char out[8];
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\uw01.mod", out, sizeof out));
}

static void test_xmi_path_rejects_a_pathological_path(void)
{
    setenv("UW_DOS_DATA_DIR", "/dos/UW", 1);
    char out[256];
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("\\SOUND\\", out, sizeof out));
    TEST_ASSERT_EQUAL_INT(0, platform_dosmidi_xmi_path("", out, sizeof out));
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

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_dos_mode_is_off_by_default);
    RUN_TEST(test_dos_mode_ignores_unrelated_mode_values);
    RUN_TEST(test_dos_mode_requires_a_data_dir);
    RUN_TEST(test_dos_mode_name_is_case_insensitive);
    RUN_TEST(test_xmi_path_maps_track_to_uppercase_xmi);
    RUN_TEST(test_xmi_path_preserves_the_track_digits);
    RUN_TEST(test_xmi_path_accepts_forward_slashes);
    RUN_TEST(test_xmi_path_needs_a_data_dir);
    RUN_TEST(test_xmi_path_rejects_a_too_small_buffer);
    RUN_TEST(test_xmi_path_rejects_a_pathological_path);
    RUN_TEST(test_render_produces_nothing_when_no_track_is_loaded);
    return UNITY_END();
}
