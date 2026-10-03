#include "unity.h"
#include "uw.h"
#include <stdio.h>

/* Real perception, goal selection, chase and attack animation dispatch.
   Tile collision checks, cached-path search and final damage are fixtures. */
static ushort npc[32], player[32], tile[4];
static char character[256];
ushort *g_player_object = player, *DAT_0010190c;
char *DAT_00086df8 = character;
undefined1 DAT_001007d0_backing[6144];
undefined1 DAT_00202c90_backing[65536];
undefined2 DAT_002048c0_backing[32768];
undefined1 DAT_002048f0_backing[65536], DAT_00204950_backing[65536];
undefined1 DAT_00204980_backing[65536];
undefined2 DAT_00204990_backing[32768], DAT_002049b0_backing[32768];
undefined DAT_002027d1_backing[8192];
undefined DAT_000853d8;
char *DAT_00101400, *DAT_00101404, *DAT_00101438;
void *DAT_0010172c;
char DAT_00101408, DAT_00101410, DAT_0010143c, DAT_0010173c;
ushort DAT_00101900, DAT_00101910, DAT_0010141c, DAT_00101414;
undefined2 DAT_00101908, DAT_00101418;
byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_001018fc;
byte DAT_00101434, DAT_00101730, DAT_00101458;
short DAT_00101444, DAT_00101448;
undefined1 DAT_00101420, DAT_00101738;
undefined4 DAT_00101924, DAT_00101734, DAT_0010191c, DAT_001013fc;
undefined4 DAT_00101560, DAT_00101914, DAT_00101920, DAT_00101728;
int DAT_00101430, DAT_00101940;
byte DAT_0010192c, DAT_00101930;
undefined1 DAT_00101934;
char DAT_0010194c, DAT_000853d0;
ushort DAT_000853b8;
short DAT_00101938, DAT_0010193c, DAT_0010144c, DAT_00101454, DAT_00202a3c;
short DAT_00201b68;
undefined4 DAT_00101944;
static FILE *monster_data;
static int chase_steps, attacks, last_chase_x, last_chase_y, los_clear;
static unsigned random_index;

undefined4 read_file_handle(int handle, void *buffer, int count)
{
    TEST_ASSERT_NOT_NULL(monster_data);
    unsigned n = fread(buffer, 1, count, monster_data);
    TEST_ASSERT_EQUAL_UINT(count, n);
    return n;
}
long Ordinal_1053(void)
{
    /* Alternate deterministic rolls: permit noticing and melee selection. */
    return random_index++ % 2 ? 1 : 0;
}
long Ordinal_2005(int divisor, int dividend) { return divisor ? dividend / divisor : 0; }
int encode_object_slot_index(void *object) { return object == player ? 1 : 2; }
void *FUN_000535fc(int slot) { return slot == 1 ? player : slot == 2 ? npc : NULL; }
void *tilemap_lookup(int x, int y) { return tile; }
undefined4 check_fine_line_of_sight(void) { return los_clear; }
char DAT_00101740_backing[8192];
undefined1 DAT_00101739, DAT_0010173a;
undefined DAT_00101733;
undefined DAT_00101732_backing[8192], DAT_00101568_backing[8192];
undefined DAT_00101569;
undefined1 DAT_0010142c;
undefined4 DAT_00101440;
byte DAT_00101450;
char *DAT_00101904;
undefined4 walk_using_cached_path(void) { return 0; }
undefined4 advance_cached_path_step(void) { return 0; }
void save_walk_path_to_cache_slot(void) {}
undefined4 creature_find_path_to_tile(void) { return 0; }
void set_npc_altitude_state(void) {}
void npc_arrival_interaction(void) {}
undefined4 tile_pair_los_blocked(int x0, int y0, int x1, int y1, int x2, int y2,
    int flags0, int flags1, int height, byte *height_out, byte *scratch)
{
    /* The fixture allows a straight, level corridor at x=10. */
    TEST_ASSERT_TRUE(x0 == 0 || x0 == 10);
    TEST_ASSERT_EQUAL_INT(10, x1);
    TEST_ASSERT_TRUE(y1 >= 10 && y1 <= 13);
    TEST_ASSERT_TRUE(x2 == 0 || x2 == 10);
    TEST_ASSERT_TRUE((uintptr_t)height_out >= (uintptr_t)DAT_00101740_backing);
    TEST_ASSERT_TRUE((uintptr_t)height_out < (uintptr_t)DAT_00101740_backing + 64 * 7);
    *height_out = height;
    if (x2 != 0) {
        chase_steps++;
        last_chase_x = x2;
        last_chase_y = y2;
    }
    return 1;
}
void npc_idle_behavior_tick(void) {}
void npc_wander_return_home_tick(void) {}
void npc_wander_return_home_exact_tick(void) {}
void npc_combat_approach_tick(void) {}
void npc_combat_position_tick(void) {}
void npc_combat_disengage_tick(void) {}
void npc_clear_special_goal(void) {}
undefined4 check_npc_morale_flee(void) { return 0; }
undefined4 check_npc_target_alignment(void) { return 1; }
byte tile_is_no_magic(void) { return 0; }
undefined4 try_npc_special_ability_alt(void) { return 0; }
undefined4 try_npc_special_ability_no_los(void) { return 0; }
undefined4 try_npc_special_ability_ranged(void) { return 0; }
void build_object_placement_snapshot(void) {}
int build_collision_height_field_for_object(void) { return 0; }
undefined4 apply_placement_collision_sweep(void) { return 0; }
undefined4 sync_object_tile_position(void) { return 0; }
undefined4 resolve_unique_npc_special_behavior(void) { return 1; }
void object_list_unlink(void) {}
void spawn_creature_death_loot(void) {}
void drop_monster_loot(void) {}
void drop_creature_inventory_on_death(void) {}
void free_object_slot(void) {}
int compute_vertical_aim_offset(void) { return 0; }
void FUN_0004a510(void) { TEST_FAIL_MESSAGE("Unexpected ranged attack"); }
void dispatch_tile_special_action(void) { TEST_FAIL_MESSAGE("Unexpected special ability"); }
byte get_current_music_track(void) { return 6; }
void set_pending_music_track(void) {}
uint read_realtime_clock_units(void) { return 0; }
undefined4 play_positional_sound_effect(void) { return 0; }
int resolve_npc_melee_attack(ushort *actor, int swing, int direction, int style, int skill)
{
    TEST_ASSERT_EQUAL_PTR(npc, actor);
    TEST_ASSERT_EQUAL_UINT16(1, (*(ushort *)((byte *)npc + 0xb) >> 4) & 0xff);
    TEST_ASSERT_TRUE(style >= 0 && style <= 2);
    TEST_ASSERT_EQUAL_INT((byte)DAT_00101404[0xf], skill);
    attacks++;
    return 1;
}

static void set_position(ushort *object, int x, int y)
{
    object[0xb] = (x << 10) | (y << 4);
    object[1] = (4 << 10) | (4 << 13); /* centered within the tile */
}
static byte *npc_bytes(void) { return (byte *)npc; }
void setUp(void)
{
    memset(npc, 0, sizeof npc);
    memset(player, 0, sizeof player);
    memset(character, 0, sizeof character);
    memset(DAT_001007d0_backing, 0, sizeof DAT_001007d0_backing);
    memset(DAT_00202c90_backing, 0, sizeof DAT_00202c90_backing);
    monster_data = fopen(UW_TEST_DATA_DIR "/DATA/OBJECTS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(monster_data);
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 2 + 0x80 + 0x30 + 0x80, SEEK_SET));
    load_monster_combat_stats(1);
    fclose(monster_data);
    monster_data = NULL;
    npc[0] = 0x48;
    player[0] = 0x7f;
    ((byte *)player)[8] = 30;
    npc_bytes()[8] = DAT_001007d0_backing[8 * 0x30 + 4];
    set_position(npc, 10, 10);
    set_position(player, 10, 13);
    npc_bytes()[0xb] = 0; /* idle goal; attitude zero is hostile */
    npc_bytes()[0x15] = 0x20;
    npc_bytes()[0x14] = 1;
    DAT_0010190c = npc;
    DAT_00101404 = (char *)DAT_001007d0_backing + 8 * 0x30;
    DAT_00101918 = DAT_001013f8 = 10;
    DAT_00101938 = DAT_0010193c = 10;
    DAT_00101910 = DAT_0010141c = 10 * 8 + 4;
    DAT_0010194c = DAT_00101940 = DAT_000853d0 = 0;
    DAT_00101734 = 1;
    DAT_00101430 = 0;
    DAT_00201b68 = 1;
    random_index = 0;
    chase_steps = attacks = 0;
    memset(DAT_00101740_backing, 0, sizeof DAT_00101740_backing);
    DAT_00101440 = DAT_00101450 = 0;
    DAT_000853b8 = 0xffff;
    los_clear = 1;
}
void tearDown(void) {}

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
