#include "noise_fixture.h"

void setUp(void) { noise_fixture_reset(); }
void tearDown(void) {}

static void test_hearing_noise_appends_reaction_message_without_truncating_pointer(void)
{
    TEST_ASSERT_EQUAL_UINT32(1, alert_npc_to_noise_callback(21, 20, noise_npc));
    TEST_ASSERT_EQUAL_STRING("A goblin hears a noise.", noise_printed_message);
    TEST_ASSERT_EQUAL_UINT(0x2e3, noise_message_id);
    TEST_ASSERT_EQUAL_UINT(2, noise_reaction_count());
    TEST_ASSERT_EQUAL_INT(1, noise_messages);
}

static void test_noise_reaction_count_decrements_and_stops_at_zero(void)
{
    for (int remaining = 2; remaining >= 0; remaining--) {
        TEST_ASSERT_EQUAL_UINT32(1, alert_npc_to_noise_callback(21, 20, noise_npc));
        TEST_ASSERT_EQUAL_UINT(remaining, noise_reaction_count());
        TEST_ASSERT_EQUAL_UINT(0x2e1 + remaining, noise_message_id);
    }
    TEST_ASSERT_EQUAL_UINT32(1, alert_npc_to_noise_callback(21, 20, noise_npc));
    TEST_ASSERT_EQUAL_UINT(0, noise_reaction_count());
    TEST_ASSERT_EQUAL_UINT(0x2e1, noise_message_id);
}

static void test_blocked_line_of_sight_does_not_print_or_change_reaction(void)
{
    noise_los_clear = 0;
    TEST_ASSERT_EQUAL_UINT32(0, alert_npc_to_noise_callback(21, 20, noise_npc));
    TEST_ASSERT_EQUAL_UINT(3, noise_reaction_count());
    TEST_ASSERT_EQUAL_INT(0, noise_messages);
}

static void test_out_of_range_noise_does_not_reach_line_of_sight_check(void)
{
    TEST_ASSERT_EQUAL_UINT32(0, alert_npc_to_noise_callback(25, 20, noise_npc));
    TEST_ASSERT_EQUAL_INT(0, noise_los_checks);
    TEST_ASSERT_EQUAL_INT(0, noise_messages);
}

static void test_sleeping_monster_reacts_only_to_waking_noise(void)
{
    noise_npc[5] |= 0x80;
    TEST_ASSERT_EQUAL_UINT32(0, alert_npc_to_noise_callback(21, 20, noise_npc));
    DAT_0010195c |= 0x20;
    TEST_ASSERT_EQUAL_UINT32(1, alert_npc_to_noise_callback(21, 20, noise_npc));
    TEST_ASSERT_EQUAL_INT(1, noise_messages);
}

static void test_emit_noise_scans_and_prints_monster_reaction(void)
{
    emit_noise_alert(noise_source, 5);
    TEST_ASSERT_EQUAL_INT(1, noise_scans);
    TEST_ASSERT_EQUAL_STRING("A goblin hears a noise.", noise_printed_message);
    TEST_ASSERT_EQUAL_UINT(2, noise_reaction_count());
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_hearing_noise_appends_reaction_message_without_truncating_pointer);
    RUN_TEST(test_noise_reaction_count_decrements_and_stops_at_zero);
    RUN_TEST(test_blocked_line_of_sight_does_not_print_or_change_reaction);
    RUN_TEST(test_out_of_range_noise_does_not_reach_line_of_sight_check);
    RUN_TEST(test_sleeping_monster_reacts_only_to_waking_noise);
    RUN_TEST(test_emit_noise_scans_and_prints_monster_reaction);
    return UNITY_END();
}
