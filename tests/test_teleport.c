#include "teleport_fixture.h"

void setUp(void) { teleport_fixture_reset(); }
void tearDown(void) { teleport_fixture_dispose(); }

static void test_player_changes_level_and_tile_after_one_tick(void)
{
    /* Player HP is byte 8 of the object record (the HUD's death check). */
    const byte starting_hp = ((byte *)g_player_object)[8];
    TEST_ASSERT_GREATER_THAN_UINT8(0, starting_hp);
    g_cursor_holding_state = 2;
    g_selected_object = (char *)other_object;
    DAT_00201c9c = after_level_change;
    DAT_00085730 = 3; /* exercise redraw notifications too */

    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, 10, 20, 2));
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b68); /* request has not ticked yet */
    TEST_ASSERT_EQUAL_INT(2, DAT_00201c7c);
    TEST_ASSERT_EQUAL_UINT16(10, DAT_00201c90);
    TEST_ASSERT_EQUAL_UINT16(20, DAT_00201c8c);
    TEST_ASSERT_EQUAL_INT(0, commits);
    TEST_ASSERT_EQUAL_INT(0, loads);
    TEST_ASSERT_EQUAL_INT(0, positions);
    TEST_ASSERT_EQUAL_UINT8(starting_hp, ((byte *)g_player_object)[8]);

    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_PTR(player, g_player_object);
    TEST_ASSERT_GREATER_THAN_UINT8(0, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_UINT8(starting_hp, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(1, saved_level);
    TEST_ASSERT_EQUAL_INT(2, loaded_level);
    TEST_ASSERT_EQUAL_INT(2, restored_level);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_EQUAL_INT(1, loads);
    TEST_ASSERT_EQUAL_INT(1, cancelled_swings);
    TEST_ASSERT_EQUAL_UINT16(0, g_cursor_holding_state);
    TEST_ASSERT_NULL(g_selected_object);
    TEST_ASSERT_EQUAL_INT(1, cursor_updates);
    TEST_ASSERT_EQUAL_INT(1, callback_calls);
    TEST_ASSERT_EQUAL_INT(1, placements);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_EQUAL_INT(11, placed_x);
    TEST_ASSERT_EQUAL_INT(21, placed_y);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00201c90); /* request consumed */
    TEST_ASSERT_EQUAL_INT(2, redraws);
    TEST_ASSERT_EQUAL_INT(1, overlay_holds);
    TEST_ASSERT_EQUAL_INT(1, overlay_restores);

    /* Simulate the next level once, then process the now-empty teleport queue. */
    movement_tick(1, 1, 0);
    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(1, destination_ticks);
    TEST_ASSERT_EQUAL_INT(1, DAT_0023bf18); /* elapsed simulation time */
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(1, loads);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_GREATER_THAN_UINT8(0, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_UINT8(starting_hp, ((byte *)g_player_object)[8]);
}

static void test_same_level_teleport_repositions_without_reloading(void)
{
    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, 10, 20, 1));
    TEST_ASSERT_EQUAL_INT(1, placements); /* validates before queueing */
    resolved_x = 11;
    resolved_y = 21;
    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(0, commits);
    TEST_ASSERT_EQUAL_INT(0, loads);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_EQUAL_INT(12, placed_x);
    TEST_ASSERT_EQUAL_INT(22, placed_y);
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b68);
}

static void test_non_player_cannot_teleport_to_another_level(void)
{
    TEST_ASSERT_EQUAL_UINT32(2,
        teleport_object_to_level_tile(other_object, 10, 20, 2));
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00201c90);
    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(0, loads);
    TEST_ASSERT_EQUAL_INT(0, positions);
    TEST_ASSERT_EQUAL_INT(0, notifications);
}

static void test_blocked_same_level_destination_is_not_queued(void)
{
    placement_result[0] = 0;
    TEST_ASSERT_EQUAL_UINT32(2,
        teleport_object_to_level_tile(g_player_object, 10, 20, 1));
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00201c90);
    TEST_ASSERT_EQUAL_INT(0, notifications);
}

static void test_new_level_placement_retries_with_fallback(void)
{
    placement_result[0] = 0;
    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, 10, 20, 2));
    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(2, placements);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
}

static void test_unplaceable_player_clears_pending_teleport(void)
{
    placement_result[0] = placement_result[1] = 0;
    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, 10, 20, 2));
    TEST_ASSERT_EQUAL_UINT32(0, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(2, placements);
    TEST_ASSERT_EQUAL_INT(0, positions);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00201c90);
    TEST_ASSERT_EQUAL_UINT8(0, ((byte *)player)[8]);
}

static void test_failed_commit_does_not_load_destination(void)
{
    commit_result = 0;
    TEST_ASSERT_EQUAL_INT(0, transition_to_level(1, 2));
    TEST_ASSERT_EQUAL_INT(1, saved_level);
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_EQUAL_INT(0, loads);
    TEST_ASSERT_EQUAL_INT(-1, restored_level);
}

static void test_failed_load_does_not_restore_destination_state(void)
{
    load_result = 0;
    TEST_ASSERT_EQUAL_INT(0, transition_to_level(1, 2));
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_EQUAL_INT(1, loads);
    TEST_ASSERT_EQUAL_INT(2, loaded_level);
    TEST_ASSERT_EQUAL_INT(-1, restored_level);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_player_changes_level_and_tile_after_one_tick);
    RUN_TEST(test_same_level_teleport_repositions_without_reloading);
    RUN_TEST(test_non_player_cannot_teleport_to_another_level);
    RUN_TEST(test_blocked_same_level_destination_is_not_queued);
    RUN_TEST(test_new_level_placement_retries_with_fallback);
    RUN_TEST(test_unplaceable_player_clears_pending_teleport);
    RUN_TEST(test_failed_commit_does_not_load_destination);
    RUN_TEST(test_failed_load_does_not_restore_destination_state);
    return UNITY_END();
}
