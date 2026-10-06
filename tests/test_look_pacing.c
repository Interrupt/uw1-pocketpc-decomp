#include "look_pacing_fixture.h"

void setUp(void) { look_pacing_fixture_reset(); }
void tearDown(void) { look_pacing_fixture_dispose(); }

static void test_repeated_polls_ramp_pitch_once_per_game_frame(void)
{
    const SDL_Scancode keys[] = {SDL_SCANCODE_1, SDL_SCANCODE_3};
    for (unsigned i = 0; i < 2; i++) {
        setUp();
        keyboard[keys[i]] = 1;
        short step = i == 0 ? -0x120 : 0x120;
        poll_at(0);
        TEST_ASSERT_EQUAL_INT16(step, DAT_0023beb4);
        for (uint64_t time = 0; time < 16666; time += 100)
            poll_at(time);
        TEST_ASSERT_EQUAL_INT16(step, DAT_0023beb4);
        poll_at(16666);
        TEST_ASSERT_EQUAL_INT16(step * 2, DAT_0023beb4);
        poll_at(16666);
        TEST_ASSERT_EQUAL_INT16(step * 2, DAT_0023beb4);
    }
}

static void test_look_speed_is_independent_of_fast_polling_rates(void)
{
    const unsigned rates[] = {60, 120, 144, 240, 1000};
    for (unsigned i = 0; i < sizeof rates / sizeof *rates; i++) {
        setUp();
        keyboard[SDL_SCANCODE_3] = 1;
        /* Ten game frames, ending before the eleventh frame is due. */
        for (uint64_t sample = 0; sample * 1000000 / rates[i] < 166666; sample++)
            poll_at(sample * 1000000 / rates[i]);
        TEST_ASSERT_EQUAL_INT16(10 * 0x120, DAT_0023beb4);
    }
}

static void test_release_and_center_are_observed_between_frames(void)
{
    keyboard[SDL_SCANCODE_1] = 1;
    poll_at(0);
    keyboard[SDL_SCANCODE_1] = 0;
    poll_at(16666);
    TEST_ASSERT_EQUAL_INT16(-0x120, DAT_0023beb4);
    keyboard[SDL_SCANCODE_2] = 1;
    poll_at(16667);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
}

static void test_pitch_limits_and_opposed_keys_are_preserved(void)
{
    keyboard[SDL_SCANCODE_1] = keyboard[SDL_SCANCODE_3] = 1;
    poll_at(0);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
    keyboard[SDL_SCANCODE_3] = 0;
    DAT_0023beb4 = -0x17ff;
    poll_at(16666);
    TEST_ASSERT_EQUAL_INT16(-0x1800, DAT_0023beb4);
    keyboard[SDL_SCANCODE_1] = 0;
    g_synth_scancode_held[SDL_SCANCODE_3] = 1;
    DAT_0023beb4 = 0x17ff;
    poll_at(33333);
    TEST_ASSERT_EQUAL_INT16(0x1800, DAT_0023beb4);
}

static void test_modal_input_does_not_ramp_pitch(void)
{
    keyboard[SDL_SCANCODE_1] = 1;
    DAT_00201c90 = 1;
    poll_at(0);
    poll_at(16666);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
    DAT_00201c90 = 0;
    freelook = 0;
    poll_at(33333);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_repeated_polls_ramp_pitch_once_per_game_frame);
    RUN_TEST(test_look_speed_is_independent_of_fast_polling_rates);
    RUN_TEST(test_release_and_center_are_observed_between_frames);
    RUN_TEST(test_pitch_limits_and_opposed_keys_are_preserved);
    RUN_TEST(test_modal_input_does_not_ramp_pitch);
    return UNITY_END();
}
