#include "stair_transition_fixture.h"

void setUp(void) { stair_transition_fixture_reset(); }
void tearDown(void) { stair_transition_fixture_dispose(); }

static void test_stairs_place_player_at_requested_y_and_keep_player_alive(void)
{
    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, open_x, open_y, 2));
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b68);
    uint result = dungeon_view_anim_tick();
    TEST_ASSERT_EQUAL_INT(open_x, first_x);
    TEST_ASSERT_EQUAL_INT(open_y, first_y);
    TEST_ASSERT_EQUAL_UINT32(1, result);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(1, loads);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_EQUAL_UINT8(30, ((byte *)player)[8]);
    /* The next HUD tick must not enter death/resurrection or change XP/hunger. */
    clock_units = 4;
    sync_player_stats_to_hud();
    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(30, hud_hp);
    TEST_ASSERT_EQUAL_INT(0, deaths);
    TEST_ASSERT_EQUAL_UINT8(200, character[0x39]);
    TEST_ASSERT_EQUAL_UINT8(3, character[0x3d]);
    TEST_ASSERT_EQUAL_UINT8(42, character[0x4e]);
    TEST_ASSERT_EQUAL_INT(1, loads);
}

static void test_blocked_destination_searches_multiple_frontiers(void)
{
    /* A radius-four search revisits both frontier buffers. */
    for (int y = 16; y <= 25; y++)
        for (int x = 6; x <= 15; x++)
            level_map[(x + y * 64) * 4] = 1;
    open_x = 14;
    short x = -1, y = -1;
    TEST_ASSERT_EQUAL_UINT32(1,
        find_placement_via_tile_flood_fill(player, 10, 20, &x, &y, 0));
    TEST_ASSERT_EQUAL_INT(10, first_x);
    TEST_ASSERT_EQUAL_INT(20, first_y);
    TEST_ASSERT_EQUAL_INT(open_x, x);
    TEST_ASSERT_EQUAL_INT(open_y, y);
    TEST_ASSERT_GREATER_THAN_INT(20, probes);
}

static void test_resurrection_search_preserves_64_bit_object_pointer(void)
{
    ushort link = 1 << 6;
    memcpy(level_map + (5 + 7 * 64) * 4 + 2, &link, sizeof link);
    short x = 0, y = 0;
    TEST_ASSERT_EQUAL_PTR(resurrection_object, find_object_in_world(7, 0, 10, &x, &y));
    TEST_ASSERT_EQUAL_INT(5, x);
    TEST_ASSERT_EQUAL_INT(7, y);
    TEST_ASSERT_EQUAL_INT(1, scan_calls);
    scan_calls = 0;
    TEST_ASSERT_TRUE(check_scheduled_object_level_match(1, 0x1ca));
    TEST_ASSERT_EQUAL_UINT16(5, DAT_00201c90);
    TEST_ASSERT_EQUAL_UINT16(7, DAT_00201c8c);
    TEST_ASSERT_EQUAL_INT(1, scan_calls);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_stairs_place_player_at_requested_y_and_keep_player_alive);
    RUN_TEST(test_blocked_destination_searches_multiple_frontiers);
    RUN_TEST(test_resurrection_search_preserves_64_bit_object_pointer);
    return UNITY_END();
}
