#include "unity.h"
#include "src/headers/level.h"

static ushort player[16], other_object[16];
ushort *g_player_object = player;
short DAT_00201b68, DAT_00201c7c;
undefined2 DAT_00201c90, DAT_00201c8c, g_cursor_holding_state;
char *g_selected_object;
byte DAT_00085730;
short g_visibility_max_ring_passes;
code *DAT_00201c9c;

static int commit_result, load_result, placement_result[2];
static int commits, loads, placements, positions, cancelled_swings;
static int saved_level, loaded_level, restored_level, placed_x, placed_y;
static int resolved_x, resolved_y, notifications, cursor_updates;
static int redraws, overlay_holds, overlay_restores, callback_calls;
static char character_record[256];
char *DAT_00086df8 = character_record;
undefined4 DAT_0023bea8, DAT_002020d0, DAT_000858a0;
undefined2 DAT_0023be98;
char DAT_0023bf18, DAT_00086e84, DAT_0023bf60;
uint DAT_0023bf5c;
int DAT_0023bf64, g_npc_tick_enabled;
short g_movement_mode;
undefined1 DAT_00204880_backing[128];
static int destination_ticks;

void decode_movement_command(void) {}
void tick_mobile_objects(int elapsed)
{
    TEST_ASSERT_EQUAL_INT(1, elapsed);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_GREATER_THAN_UINT8(0, ((byte *)g_player_object)[8]);
    destination_ticks++;
}
void apply_movement_tick(void)
{
    TEST_FAIL_MESSAGE("Stationary player unexpectedly entered movement physics");
}
void trigger_view_transition(void)
{
    TEST_FAIL_MESSAGE("Stationary player unexpectedly triggered a view transition");
}
void stop_movement_sound_handle(void) {}
uint read_realtime_clock_units(void) { return 0; }
long Ordinal_2005(void)
{
    TEST_FAIL_MESSAGE("Stationary tick unexpectedly needed jump timing");
    return 0;
}
undefined4 play_sound_effect_with_pan(void)
{
    TEST_FAIL_MESSAGE("Stationary tick unexpectedly played a movement sound");
    return 0;
}

void cancel_weapon_swing(void) { cancelled_swings++; }
void pop_cursor_icon(int state)
{
    TEST_ASSERT_EQUAL_INT(3, state);
    cursor_updates++;
}
void save_or_restore_level_special_state(level, save)
short level;
short save;
{
    if (save) {
        TEST_ASSERT_EQUAL_INT(0, commits);
        saved_level = level;
    } else {
        TEST_ASSERT_EQUAL_INT(1, loads);
        restored_level = level;
    }
}
undefined4 commit_level_to_save_slot(int level)
{
    TEST_ASSERT_EQUAL_INT(saved_level, level);
    commits++;
    return commit_result;
}
int load_level(int level)
{
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_TRUE(commit_result);
    loaded_level = level;
    loads++;
    return load_result;
}
undefined4 find_placement_via_tile_flood_fill(char *object, int x, int y,
                                           short *out_x, short *out_y, int fallback)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, object);
    TEST_ASSERT_EQUAL_INT(resolved_x, x);
    TEST_ASSERT_EQUAL_INT(resolved_y, y);
    TEST_ASSERT_TRUE(fallback == 0 || fallback == 1);
    placements++;
    *out_x = resolved_x + 1; /* placement can adjust a blocked destination */
    *out_y = resolved_y + 1;
    return placement_result[fallback];
}
void set_player_tile_position(uint x, uint y, int flag)
{
    TEST_ASSERT_EQUAL_INT(1, flag);
    placed_x = x;
    placed_y = y;
    positions++;
}
void set_pending_update_flags(int flags)
{
    TEST_ASSERT_TRUE(flags == 0x20 || flags == 0x7ffe);
    notifications++;
}
void report_fatal_error_and_exit(void)
{
    TEST_FAIL_MESSAGE("Teleport unexpectedly reached a fatal-error path");
}
void full_dungeon_redraw(void) { redraws++; }
void weapon_overlay_flash_hold(int passes)
{
    TEST_ASSERT_EQUAL_INT(g_visibility_max_ring_passes, passes);
    overlay_holds++;
}
void weapon_overlay_flash_restore(int passes)
{
    TEST_ASSERT_EQUAL_INT(g_visibility_max_ring_passes, passes);
    overlay_restores++;
}
static void after_level_change(void)
{
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(2, restored_level);
    callback_calls++;
}

void setUp(void)
{
    memset(player, 0, sizeof(player));
    memset(other_object, 0, sizeof(other_object));
    ((byte *)player)[8] = 30;
    DAT_00201b68 = DAT_00201c7c = 1;
    DAT_00201c90 = DAT_00201c8c = 0;
    g_cursor_holding_state = 0;
    g_selected_object = NULL;
    DAT_00085730 = 0;
    DAT_00201c9c = NULL;
    g_visibility_max_ring_passes = 4;
    commit_result = load_result = 1;
    placement_result[0] = placement_result[1] = 1;
    resolved_x = 10;
    resolved_y = 20;
    commits = loads = placements = positions = cancelled_swings = 0;
    saved_level = loaded_level = restored_level = placed_x = placed_y = -1;
    notifications = cursor_updates = redraws = 0;
    overlay_holds = overlay_restores = callback_calls = 0;
    memset(character_record, 0, sizeof(character_record));
    memset(DAT_00204880_backing, 0, sizeof(DAT_00204880_backing));
    DAT_0023bea8 = DAT_0023be98 = DAT_0023bf18 = 0;
    DAT_002020d0 = DAT_000858a0 = 0;
    DAT_00086e84 = -1;
    DAT_0023bf60 = DAT_0023bf5c = DAT_0023bf64 = 0;
    g_movement_mode = 0;
    g_npc_tick_enabled = 1;
    destination_ticks = 0;
}
void tearDown(void) {}

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
