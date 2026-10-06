#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>

/* Real perception, goal selection, chase and attack animation dispatch.
   Tile collision checks, cached-path search and final damage are fixtures. */
ushort npc[32], player[32], tile[4];
char character[256];
ushort *g_player_object = player, *DAT_0010190c;
char *DAT_00086df8 = character;
undefined1 DAT_001007d0_backing[3072];
undefined1 DAT_00202c90_backing[8192];
undefined2 DAT_002048c0_backing[64];
undefined1 DAT_002048f0_backing[128], DAT_00204950_backing[128];
undefined1 DAT_00204980_backing[32];
undefined2 DAT_00204990_backing[16], DAT_002049b0_backing[16];
undefined1 DAT_002027d0_backing[48];
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
undefined4 DAT_00101924, DAT_00101734_backing[1], DAT_0010191c, DAT_001013fc;
undefined4 DAT_00101560, DAT_00101914, DAT_00101920, DAT_00101728;
int DAT_00101430, DAT_00101940;
byte DAT_0010192c, DAT_00101930;
undefined1 DAT_00101934;
char DAT_0010194c, DAT_000853d0;
ushort DAT_000853b8;
short DAT_00101938, DAT_0010193c, DAT_0010144c, DAT_00101454, DAT_00202a3c;
short DAT_00201b68;
undefined4 DAT_00101944;
FILE *monster_data;
int chase_steps, attacks, last_chase_x, last_chase_y, los_clear;
unsigned random_index;

int read_file_handle(int handle, void *buffer, uint count)
{
    TEST_ASSERT_NOT_NULL(monster_data);
    unsigned n = fread(buffer, 1, count, monster_data);
    TEST_ASSERT_EQUAL_UINT(count, n);
    return n;
}
long ce_rand(void)
{
    /* Alternate deterministic rolls: permit noticing and melee selection. */
    return random_index++ % 2 ? 1 : 0;
}
int encode_object_slot_index(void *object) { return object == player ? 1 : 2; }
void *get_object_record_by_slot_index(int slot) { return slot == 1 ? player : slot == 2 ? npc : NULL; }
void *tilemap_lookup(short x, short y) { return tile; }
undefined4 check_fine_line_of_sight(void) { return los_clear; }
char DAT_00101740_backing[448];
undefined1 DAT_00101739, DAT_0010173a;
undefined DAT_00101733;
undefined DAT_00101732_backing[8192], DAT_00101568_backing[448];
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
byte tile_is_no_magic(int tile_x, int tile_y) { (void)tile_x; (void)tile_y; return 0; }
undefined4 try_npc_special_ability_alt(void) { return 0; }
undefined4 try_npc_special_ability_no_los(void) { return 0; }
undefined4 try_npc_special_ability_ranged(void) { return 0; }
void build_object_placement_snapshot(void) {}
int build_collision_height_field_for_object(ushort *object) { (void)object; return 0; }
undefined4 apply_placement_collision_sweep(intptr_t snapshot, intptr_t sweep_flags) { (void)snapshot; (void)sweep_flags; return 0; }
undefined4 sync_object_tile_position(void) { return 0; }
undefined4 resolve_unique_npc_special_behavior(void) { return 1; }
void object_list_unlink(void) {}
void spawn_creature_death_loot(void) {}
void drop_monster_loot(void) {}
void drop_creature_inventory_on_death(void) {}
void free_object_slot(void) {}
int compute_vertical_aim_offset(void) { return 0; }
void spawn_npc_thrown_weapon(void) { TEST_FAIL_MESSAGE("Unexpected ranged attack"); }
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

void set_position(ushort *object, int x, int y)
{
    object[0xb] = (x << 10) | (y << 4);
    object[1] = (4 << 10) | (4 << 13); /* centered within the tile */
}
byte *npc_bytes(void) { return (byte *)npc; }
void npc_ai_fixture_reset(void)
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
void npc_ai_fixture_dispose(void) {}
