#include "head_bob_fixture.h"

void setUp(void) { head_bob_fixture_reset(); }
void tearDown(void) {}

static void test_walking_camera_bobs_through_full_original_waveform(void)
{
    /* Signed waveform recovered from ARM .data at 0x86e38. */
    const int bob[] = {1,3,4,3,1,-3,0,0,1,3,4,3,1,-3,0,0};
    for (unsigned phase = 0; phase < 16; phase++) {
        DAT_0023bf18 = phase << 4;
        head_bob_fixture_tick(1, 200, 0);
        TEST_ASSERT_EQUAL_INT(768 + 0xa4 + bob[phase] * 3,
                              g_current_view->view_elevation);
        TEST_ASSERT_EQUAL_INT(0x2080, g_current_view->view_x);
        TEST_ASSERT_EQUAL_INT(0x2080, g_current_view->view_y);
        TEST_ASSERT_EQUAL_INT(768, DAT_00204884); /* camera motion only */
    }
}

static void test_running_has_larger_bob_than_walking(void)
{
    head_bob_fixture_tick(1, 200, 16);
    int walking = g_current_view->view_elevation - (768 + 0xa4);
    head_bob_fixture_reset();
    head_bob_fixture_tick(1, 400, 16);
    int running = g_current_view->view_elevation - (768 + 0xa4);
    TEST_ASSERT_EQUAL_INT(9, walking);
    TEST_ASSERT_EQUAL_INT(21, running);
}

static void test_wading_camera_bobs_and_sways_over_full_cycle(void)
{
    const int wave[] = {-4,-3,-2,-1,0,1,2,3,4,3,2,1,0,-1,-2,-3};
    DAT_00086df8[0xb8] = 1;
    DAT_00086df8[0xb9] = 100;
    for (unsigned phase = 0; phase < 16; phase++) {
        DAT_0023bf18 = phase << 4;
        head_bob_fixture_tick(1, 200, 0);
        TEST_ASSERT_EQUAL_INT(768 + 0xa4 - 100 + wave[(phase + 2) & 15] * 2,
                              g_current_view->view_elevation);
        TEST_ASSERT_EQUAL_INT(wave[phase] * 64, g_current_view->view_shake_y);
        TEST_ASSERT_EQUAL_INT(768, DAT_00204884);
    }
}

static void test_swimming_modes_use_the_original_vertical_waveform(void)
{
    const int bob[] = {0,0,-1,-2,-3,-4,-5,-6,-6,-4,-3,-2,-1,0,0,0};
    for (int mode = 9; mode <= 10; mode++) {
        for (unsigned phase = 0; phase < 16; phase++) {
            DAT_0023bf18 = phase << 4;
            head_bob_fixture_tick(mode, 200, 0);
            TEST_ASSERT_EQUAL_INT(768 + 0xa4 + bob[phase] * 2,
                                  g_current_view->view_elevation);
        }
    }
}

static void test_bob_phase_advances_with_elapsed_movement_time_and_wraps(void)
{
    head_bob_fixture_tick(1, 200, 16);
    TEST_ASSERT_EQUAL_UINT8(16, DAT_0023bf18);
    TEST_ASSERT_EQUAL_INT(768 + 0xa4 + 9, g_current_view->view_elevation);
    DAT_0023bf18 = 240;
    head_bob_fixture_tick(1, 200, 16);
    TEST_ASSERT_EQUAL_UINT8(0, DAT_0023bf18);
    TEST_ASSERT_EQUAL_INT(768 + 0xa4 + 3, g_current_view->view_elevation);
}

static void test_stationary_camera_returns_to_unmodified_eye_height(void)
{
    head_bob_fixture_tick(1, 200, 16);
    head_bob_fixture_tick(0, 0, 16);
    TEST_ASSERT_EQUAL_INT(768 + 0xa4, g_current_view->view_elevation);
    TEST_ASSERT_EQUAL_INT(0, g_current_view->view_shake_x);
    TEST_ASSERT_EQUAL_INT(0, g_current_view->view_shake_y);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_walking_camera_bobs_through_full_original_waveform);
    RUN_TEST(test_running_has_larger_bob_than_walking);
    RUN_TEST(test_wading_camera_bobs_and_sways_over_full_cycle);
    RUN_TEST(test_swimming_modes_use_the_original_vertical_waveform);
    RUN_TEST(test_bob_phase_advances_with_elapsed_movement_time_and_wraps);
    RUN_TEST(test_stationary_camera_returns_to_unmodified_eye_height);
    return UNITY_END();
}
