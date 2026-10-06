#include "gx_pacing_fixture.h"

void setUp(void) { gx_pacing_fixture_reset(); }
void tearDown(void) { gx_pacing_fixture_dispose(); }

static void test_early_cursor_flushes_do_not_present_another_frame(void)
{
    GXEndDraw();
    for (int i = 0; i < 20; i++) {
        now_us = 100 + i * 500;
        framebuffer_version++;
        GXEndDraw();
    }
    TEST_ASSERT_EQUAL_INT(1, presents);
    now_us = 16666;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(framebuffer_version, displayed_version);
}
static void test_last_flush_reaches_display_during_an_input_wait(void)
{
    GXEndDraw();
    now_us = 5000;
    framebuffer_version = 42;
    GXEndDraw();
    now_us = 16000;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(1, presents);
    now_us = 17000;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    now_us = 40000;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
}
static void test_refresh_rates_do_not_change_game_time(void)
{
    const unsigned rates[] = {30, 60, 120, 144, 240};
    for (unsigned rate = 0; rate < sizeof rates / sizeof *rates; rate++) {
        uw_reset_frame_pacing();
        uw_service_game_clock(0);
        unsigned start = g_uw_frame_clock_units;
        for (unsigned sample = 1; sample <= rates[rate]; sample++) {
            uint64_t time = (uint64_t)sample * 1000000 / rates[rate];
            uw_service_game_clock(time);
            uw_service_game_clock(time); /* extra input/flush calls */
        }
        TEST_ASSERT_EQUAL_UINT(250, g_uw_frame_clock_units - start);
    }
}
static void test_deadlines_do_not_drift_after_a_late_present(void)
{
    TEST_ASSERT_TRUE(uw_present_frame_due(0));
    TEST_ASSERT_TRUE(uw_present_frame_due(25000));
    TEST_ASSERT_FALSE(uw_present_frame_due(31249));
    TEST_ASSERT_TRUE(uw_present_frame_due(33333));
}
static void test_near_deadline_flush_is_admitted_without_advancing_time(void)
{
    GXEndDraw();
    now_us = 15666;
    framebuffer_version = 42;
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    TEST_ASSERT_EQUAL_UINT64(15666, now_us);
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    now_us = 16666; /* The upcoming slot was already consumed. */
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    now_us = 33333;
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(3, presents);
}
static void test_grace_window_is_bounded_and_does_not_advance_game_time(void)
{
    GXEndDraw();
    uw_service_game_clock(0);
    unsigned clock = g_uw_frame_clock_units;
    now_us = 14582; /* beyond one eighth of a 60Hz refresh interval */
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    now_us = 14583; /* exactly inside the 2083us grace window */
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_UINT(clock, g_uw_frame_clock_units);
    TEST_ASSERT_FALSE(uw_present_frame_due(31249));
    TEST_ASSERT_TRUE(uw_present_frame_due(33333));
}
static void test_grace_window_tracks_monitor_refresh_rate(void)
{
    const unsigned rates[] = {30, 60, 120, 144, 240, 0};
    for (unsigned i = 0; i < sizeof rates / sizeof *rates; i++) {
        uw_reset_frame_pacing();
        uw_set_present_refresh_rate(rates[i]);
        unsigned rate = rates[i] ? rates[i] : 60;
        uint64_t grace = 1000000 / ((uint64_t)rate * 8);
        TEST_ASSERT_TRUE(uw_present_frame_due(0));
        TEST_ASSERT_FALSE(uw_present_frame_due(16666 - grace - 1));
        TEST_ASSERT_TRUE(uw_present_frame_due(16666 - grace));
        TEST_ASSERT_FALSE(uw_present_frame_due(16666 - grace));
        TEST_ASSERT_FALSE(uw_present_frame_due(16666));
        TEST_ASSERT_TRUE(uw_present_frame_due(33333 - grace));
    }
}
static void test_changing_display_shrinks_grace_without_resetting_deadline(void)
{
    TEST_ASSERT_TRUE(uw_present_frame_due(0));
    uw_set_present_refresh_rate(240);
    TEST_ASSERT_FALSE(uw_present_frame_due(15666)); /* 1ms early exceeds 240Hz grace */
    TEST_ASSERT_TRUE(uw_present_frame_due(16666));
    uw_set_present_refresh_rate(60);
    TEST_ASSERT_TRUE(uw_present_frame_due(32333));
}
static void test_input_wait_uses_the_same_clock_as_the_normal_game_loop(void)
{
    uw_service_game_clock(0);
    DAT_00201c84 = 0;
    uw_service_game_clock(8333);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
    uw_service_game_clock(16666);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201c84);
    TEST_ASSERT_EQUAL_UINT(8, g_uw_frame_clock_units);
    DAT_00201c84 = 0;
    uw_service_game_clock(16666);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
}
static void test_modal_views_do_not_advance_game_time_or_request_dungeon_redraw(void)
{
    uw_service_game_clock(0);
    unsigned start = g_uw_frame_clock_units;
    DAT_00201c84 = 0;
    DAT_00201c90 = 1;
    uw_service_game_clock(1000000);
    TEST_ASSERT_EQUAL_UINT(start, g_uw_frame_clock_units);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
    DAT_00201c90 = 0;
    DAT_00201b64 = 1;
    uw_service_game_clock(1000000);
    TEST_ASSERT_EQUAL_UINT(start, g_uw_frame_clock_units);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_early_cursor_flushes_do_not_present_another_frame);
    RUN_TEST(test_last_flush_reaches_display_during_an_input_wait);
    RUN_TEST(test_refresh_rates_do_not_change_game_time);
    RUN_TEST(test_deadlines_do_not_drift_after_a_late_present);
    RUN_TEST(test_input_wait_uses_the_same_clock_as_the_normal_game_loop);
    RUN_TEST(test_modal_views_do_not_advance_game_time_or_request_dungeon_redraw);
    RUN_TEST(test_near_deadline_flush_is_admitted_without_advancing_time);
    RUN_TEST(test_grace_window_is_bounded_and_does_not_advance_game_time);
    RUN_TEST(test_grace_window_tracks_monitor_refresh_rate);
    RUN_TEST(test_changing_display_shrinks_grace_without_resetting_deadline);
    return UNITY_END();
}
