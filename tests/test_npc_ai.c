#include "npc_ai_fixture.h"

void setUp(void) { npc_ai_fixture_reset(); }
void tearDown(void) { npc_ai_fixture_dispose(); }

static void test_loaded_perception_and_health_fields_share_monster_table(void)
{
    TEST_ASSERT_EQUAL_PTR(DAT_001007d0_backing + 4, &g_monster_max_stats_table);
    TEST_ASSERT_EQUAL_PTR(DAT_001007d0_backing + 0x1d, &DAT_001007ed);
    TEST_ASSERT_EQUAL_UINT8(DAT_001007d0_backing[8 * 0x30 + 0x1d],
        (&DAT_001007ed)[8 * 0x30]);
}
static void test_hostile_npc_notices_nearby_player_and_chases(void)
{
    for (int tick = 0; tick < 8 && chase_steps == 0; tick++)
        npc_ai_tick();
    TEST_ASSERT_EQUAL_UINT8(5, npc_bytes()[0xb] & 0xf);
    TEST_ASSERT_EQUAL_UINT16(1, (*(ushort *)(npc_bytes() + 0xb) >> 4) & 0xff);
    TEST_ASSERT_GREATER_THAN_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(10, last_chase_x);
    TEST_ASSERT_EQUAL_INT(13, last_chase_y);
}
static void test_line_walk_records_waypoints_without_corrupting_ai_globals(void)
{
    byte profile[8] = {0};
    DAT_00101438 = (char *)profile;
    TEST_ASSERT_EQUAL_INT(1, try_direct_line_walk(10, 10, 10, 13));
    TEST_ASSERT_EQUAL_UINT8(4, DAT_0010142c);
    for (int step = 0; step < 4; step++) {
        TEST_ASSERT_EQUAL_UINT8(10, (&DAT_00101740)[step * 7]);
        TEST_ASSERT_EQUAL_UINT8(10 + step, (&DAT_00101741)[step * 7]);
    }
    TEST_ASSERT_EQUAL_PTR(npc, DAT_0010190c);
    TEST_ASSERT_EQUAL_PTR(profile, DAT_00101438);
    TEST_ASSERT_EQUAL_INT(1, DAT_00101734);
}
static void test_repeated_walking_preserves_npc_position_and_ai_pointers(void)
{
    byte profile[8] = {0};
    DAT_00101438 = (char *)profile;
    npc_set_goal(5, 1);
    for (int tick = 0; tick < 128; tick++) {
        npc_walk_toward_tile(10, 13, 0);
        TEST_ASSERT_EQUAL_PTR(npc, DAT_0010190c);
        TEST_ASSERT_EQUAL_PTR(profile, DAT_00101438);
        TEST_ASSERT_EQUAL_INT(1, DAT_00101734);
        TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
        TEST_ASSERT_EQUAL_UINT8(5, npc_bytes()[0xb] & 0xf);
        TEST_ASSERT_EQUAL_UINT8(0x2c, npc_bytes()[0x15] & 0x3f);
        TEST_ASSERT_EQUAL_UINT8((byte)DAT_00101404[0xc], npc_bytes()[0x13] & 0x7f);
    }
    TEST_ASSERT_GREATER_THAN_INT(0, chase_steps);
}
static void test_hostile_npc_in_melee_range_completes_an_attack(void)
{
    set_position(player, 10, 11);
    for (int tick = 0; tick < 64 && attacks == 0; tick++)
        npc_ai_tick();
    TEST_ASSERT_GREATER_THAN_INT(0, attacks);
    TEST_ASSERT_EQUAL_UINT8(5, npc_bytes()[0xb] & 0xf);
    TEST_ASSERT_EQUAL_UINT8(30, ((byte *)player)[8]);
}
static void test_wide_engage_goal_completes_a_melee_attack(void)
{
    npc_set_goal(9, 1);
    set_position(player, 10, 11);
    for (int tick = 0; tick < 64 && attacks == 0; tick++) npc_ai_tick();
    TEST_ASSERT_GREATER_THAN_INT(0, attacks);
    TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
}
static void test_wide_engage_goal_advances_stance_without_corrupting_tile_position(void)
{
    npc_set_goal(9, 1);
    set_position(player, 10, 12);
    npc_ai_tick();
    TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
    TEST_ASSERT_EQUAL_UINT8(1, npc_bytes()[0xc] >> 4);
    TEST_ASSERT_EQUAL_UINT8(0, npc_bytes()[0x15] & 0x3f);
}
static void test_target_delta_preserves_signed_full_tile_distance(void)
{
    npc_set_goal(5, 1);
    set_position(player, 52, 1);
    TEST_ASSERT_EQUAL_INT(1, refresh_npc_target_delta());
    TEST_ASSERT_EQUAL_INT(42 * 8, DAT_00101444);
    TEST_ASSERT_EQUAL_INT(-9 * 8, DAT_00101448);
}
static void test_alert_npc_attacks_from_each_direction_without_changing_position(void)
{
    const int positions[4][2] = {{11, 10}, {9, 10}, {10, 11}, {10, 9}};
    for (int direction = 0; direction < 4; direction++) {
        npc_set_goal(5, 1);
        npc_bytes()[0x15] = 0x20;
        npc_bytes()[0xc] &= 0xf;
        random_index = 0;
        attacks = 0;
        set_position(player, positions[direction][0], positions[direction][1]);
        for (int tick = 0; tick < 64 && attacks == 0; tick++) npc_ai_tick();
        TEST_ASSERT_GREATER_THAN_INT(0, attacks);
        TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
        TEST_ASSERT_EQUAL_UINT16((4 << 10) | (4 << 13), npc[1] & 0xfc7f);
    }
}
static void test_hostile_npc_cannot_notice_player_through_a_wall(void)
{
    los_clear = 0;
    for (int tick = 0; tick < 16; tick++) npc_ai_tick();
    TEST_ASSERT_EQUAL_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_NOT_EQUAL(5, npc_bytes()[0xb] & 0xf);
}
static void test_hostile_npc_does_not_notice_player_outside_detection_range(void)
{
    set_position(player, 10, 16);
    for (int tick = 0; tick < 16; tick++) npc_ai_tick();
    TEST_ASSERT_EQUAL_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_NOT_EQUAL(5, npc_bytes()[0xb] & 0xf);
}
static void test_friendly_npc_does_not_start_a_chase_or_attack(void)
{
    npc_bytes()[0xe] = 0xc0;
    for (int tick = 0; tick < 16; tick++) npc_ai_tick();
    TEST_ASSERT_EQUAL_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_NOT_EQUAL(5, npc_bytes()[0xb] & 0xf);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_loaded_perception_and_health_fields_share_monster_table);
    RUN_TEST(test_hostile_npc_notices_nearby_player_and_chases);
    RUN_TEST(test_line_walk_records_waypoints_without_corrupting_ai_globals);
    RUN_TEST(test_repeated_walking_preserves_npc_position_and_ai_pointers);
    RUN_TEST(test_hostile_npc_in_melee_range_completes_an_attack);
    RUN_TEST(test_wide_engage_goal_completes_a_melee_attack);
    RUN_TEST(test_wide_engage_goal_advances_stance_without_corrupting_tile_position);
    RUN_TEST(test_target_delta_preserves_signed_full_tile_distance);
    RUN_TEST(test_alert_npc_attacks_from_each_direction_without_changing_position);
    RUN_TEST(test_hostile_npc_cannot_notice_player_through_a_wall);
    RUN_TEST(test_hostile_npc_does_not_notice_player_outside_detection_range);
    RUN_TEST(test_friendly_npc_does_not_start_a_chase_or_attack);
    return UNITY_END();
}
