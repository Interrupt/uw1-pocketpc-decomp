#include "head_bob_fixture.h"
#include <math.h>

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

static void test_wading_roll_rotates_the_rendered_view_in_both_directions(void)
{
    DAT_00086df8[0xb8] = 1;
    DAT_00086df8[0xb9] = 100;
    for (unsigned phase = 0; phase < 16; phase++) {
        DAT_0023bf18 = phase << 4;
        head_bob_fixture_tick(1, 400, 0);
        build_view_matrix();
        /* The ARM radians constant and float rounding differ slightly
           from native double-precision pi, especially near 360 degrees. */
        double radians = (g_current_view->view_shake_y / 256) * (acos(-1.0) / 180.0);
        /* A horizontal line acquires opposite vertical slopes on the two
           halves of the water cycle. Test the matrix consumed by rendering. */
        TEST_ASSERT_FLOAT_WITHIN(0.00001f, cos(radians), head_bob_fixture_matrix_element(0));
        TEST_ASSERT_FLOAT_WITHIN(0.00001f, -sin(radians), head_bob_fixture_matrix_element(1));
        TEST_ASSERT_FLOAT_WITHIN(0.00001f, sin(radians), head_bob_fixture_matrix_element(4));
        TEST_ASSERT_FLOAT_WITHIN(0.00001f, cos(radians), head_bob_fixture_matrix_element(5));
        TEST_ASSERT_FLOAT_WITHIN(0.00001f, 1, head_bob_fixture_matrix_element(10));
    }
}

static void test_leaving_water_clears_rendered_roll(void)
{
    DAT_00086df8[0xb8] = 1;
    DAT_00086df8[0xb9] = 100;
    head_bob_fixture_tick(1, 400, 0);
    build_view_matrix();
    TEST_ASSERT_GREATER_THAN_FLOAT(0.01f, head_bob_fixture_matrix_element(1));
    DAT_00086df8[0xb8] = DAT_00086df8[0xb9] = 0;
    head_bob_fixture_tick(1, 400, 0);
    build_view_matrix();
    TEST_ASSERT_FLOAT_WITHIN(0.000001f, 0, head_bob_fixture_matrix_element(1));
    TEST_ASSERT_FLOAT_WITHIN(0.000001f, 0, head_bob_fixture_matrix_element(4));
    TEST_ASSERT_FLOAT_WITHIN(0.000001f, 1, head_bob_fixture_matrix_element(0));
}

static void test_combined_camera_rotations_preserve_geometry(void)
{
    DAT_000db448 = 14;
    DAT_000db44c = 27;
    DAT_00086df8[0xb8] = 1;
    DAT_00086df8[0xb9] = 100;
    head_bob_fixture_tick(1, 400, 0);
    build_view_matrix();
    /* All three rotations must preserve lengths and perpendicular axes. */
    for (unsigned row = 0; row < 3; row++) {
        for (unsigned other = 0; other < 3; other++) {
            float dot = 0;
            for (unsigned column = 0; column < 3; column++)
                dot += head_bob_fixture_matrix_element(row * 4 + column) *
                       head_bob_fixture_matrix_element(other * 4 + column);
            TEST_ASSERT_FLOAT_WITHIN(0.000001f, row == other ? 1 : 0, dot);
        }
    }
}

static int camera_yaw_offset(void)
{
    return (short)(g_current_view->view_facing - DAT_00201c70);
}

static void test_water_yaw_matches_at_equal_times_with_different_tick_sizes(void)
{
    int reference[100];
    const unsigned tick_sizes[] = {2, 4, 8, 20}; /* Clock units are 4 ms. */
    for (unsigned rate = 0; rate < 4; rate++) {
        head_bob_fixture_reset();
        DAT_00086df8[0xb8] = 1;
        DAT_00086df8[0xb9] = 100;
        for (unsigned sample = 0; sample < 100; sample++) {
            for (unsigned elapsed = 0; elapsed < 40; elapsed += tick_sizes[rate])
                head_bob_fixture_tick(1, 400, tick_sizes[rate]);
            if (rate == 0) reference[sample] = camera_yaw_offset();
            else TEST_ASSERT_EQUAL_INT(reference[sample], camera_yaw_offset());
        }
    }
    TEST_ASSERT_EQUAL_INT(0x2000, DAT_00201c70);
}

static void test_water_yaw_is_smooth_bounded_and_independent_of_random_draws(void)
{
    DAT_00086df8[0xb8] = 1;
    DAT_00086df8[0xb9] = 100;
    int previous = 0, minimum = 0, maximum = 0;
    for (unsigned elapsed = 0; elapsed < 2500; elapsed++) {
        head_bob_fixture_tick(1, 400, 1);
        int yaw = camera_yaw_offset();
        TEST_ASSERT_INT_WITHIN(320, 0, yaw); /* Preserve the original maximum amplitude. */
        TEST_ASSERT_INT_WITHIN(10, previous, yaw);
        if (yaw < minimum) minimum = yaw;
        if (yaw > maximum) maximum = yaw;
        previous = yaw;
    }
    TEST_ASSERT_GREATER_THAN_INT(160, maximum);
    TEST_ASSERT_LESS_THAN_INT(-160, minimum);
    head_bob_fixture_set_random(0);
    head_bob_fixture_tick(1, 400, 0);
    int yaw = camera_yaw_offset();
    head_bob_fixture_set_random(127);
    head_bob_fixture_tick(1, 400, 0);
    TEST_ASSERT_EQUAL_INT(yaw, camera_yaw_offset());
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
    RUN_TEST(test_wading_roll_rotates_the_rendered_view_in_both_directions);
    RUN_TEST(test_leaving_water_clears_rendered_roll);
    RUN_TEST(test_combined_camera_rotations_preserve_geometry);
    RUN_TEST(test_water_yaw_matches_at_equal_times_with_different_tick_sizes);
    RUN_TEST(test_water_yaw_is_smooth_bounded_and_independent_of_random_draws);
    RUN_TEST(test_swimming_modes_use_the_original_vertical_waveform);
    RUN_TEST(test_bob_phase_advances_with_elapsed_movement_time_and_wraps);
    RUN_TEST(test_stationary_camera_returns_to_unmodified_eye_height);
    return UNITY_END();
}
