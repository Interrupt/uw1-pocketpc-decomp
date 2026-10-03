#include "unity.h"
#include "uw.h"

static ushort player[16], resurrection_object[4];
static byte level_map[64 * 64 * 4], character[256];
ushort *g_player_object = player;
char *DAT_002029cc = (char *)level_map;
char *DAT_00086df8 = (char *)character;
undefined1 DAT_000878d0_backing[256], DAT_00202c90_backing[65536];
short DAT_00201b68, DAT_00201c7c, g_visibility_max_ring_passes;
undefined2 DAT_00201c90, DAT_00201c8c, g_cursor_holding_state;
char *g_selected_object;
byte DAT_00085730;
code *DAT_00201c9c;
byte DAT_001013a4;
uint DAT_002020e4;
byte DAT_002020e8;
char s_At__d__d_00087360[] = "At %d %d";
static int loads, positions, deaths, first_x, first_y, probes, hud_hp;
static int open_x, open_y;
static uint clock_units;
static int scan_calls;

void cancel_weapon_swing(void) {}
void FUN_00057cac(int state) {}
void save_or_restore_level_special_state(int level, int save) {}
undefined4 commit_level_to_save_slot(int level) { return 1; }
int load_level(int level)
{
    TEST_ASSERT_EQUAL_INT(2, level);
    loads++;
    return 1;
}
void set_player_tile_position(uint x, uint y, int flag)
{
    TEST_ASSERT_EQUAL_INT(open_x, x);
    TEST_ASSERT_EQUAL_INT(open_y, y);
    TEST_ASSERT_EQUAL_INT(1, flag);
    positions++;
}
void FUN_00049924(int flags) {}
void report_fatal_error_and_exit(void) { TEST_FAIL_MESSAGE("Stair transition failed"); }
void full_dungeon_redraw(void) {}
void weapon_overlay_flash_hold(int passes) {}
void weapon_overlay_flash_restore(int passes) {}
void *Ordinal_1047(void *buffer, int value, unsigned size)
{ return memset(buffer, value, size); }
void *tilemap_lookup(int x, int y)
{
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, x);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, y);
    TEST_ASSERT_LESS_THAN_INT(64, x);
    TEST_ASSERT_LESS_THAN_INT(64, y);
    if (probes++ == 0) { first_x = x; first_y = y; }
    return level_map + (x + y * 64) * 4;
}
int encode_object_slot_index(void *object)
{
    TEST_ASSERT_EQUAL_PTR(player, object);
    return 1;
}
undefined4 FUN_00051fa0(int type, int slot, int x, int y, int z, int flag, int radius)
{
    TEST_ASSERT_EQUAL_INT(0x7f, type);
    TEST_ASSERT_EQUAL_INT(1, slot);
    return x == open_x * 8 + 3 && y == open_y * 8 + 3;
}
void *resolve_object_link(ushort *link) { return NULL; }
undefined4 object_ptr_in_arena(void *object) { return 0; }
ushort *discard_misplaced_object(void *head, void *object, int flag) { return NULL; }
void tick_weapon_swing_state(int flag) {}
void set_hud_status_value(int slot, int value) { if (slot == 0) hud_hp = value; }
void handle_starvation_penalty(void) { deaths++; }
uint read_realtime_clock_units(void) { return clock_units; }
void update_ingame_music_track(void) {}
void FUN_00053c74(void) {}
long Ordinal_1053(void) { return 1; }
void apply_level9_random_hazard_tick(void) {}
void debug_print(char *format, ...) {}
ushort *FUN_000537d0(ushort **link, int recursive, int group, int subclass, int type)
{
    TEST_ASSERT_EQUAL_INT(7, group);
    TEST_ASSERT_EQUAL_INT(0, subclass);
    TEST_ASSERT_EQUAL_INT(10, type);
    scan_calls++;
    return resurrection_object;
}

void setUp(void)
{
    memset(player, 0, sizeof player);
    memset(character, 0, sizeof character);
    memset(level_map, 0, sizeof level_map);
    memset(DAT_000878d0_backing, 0, sizeof DAT_000878d0_backing);
    memset(DAT_00202c90_backing, 0, sizeof DAT_00202c90_backing);
    player[0] = 0x7f;
    ((byte *)player)[8] = 30;
    character[0x39] = 200; /* Hunger lives in the character record, not HP. */
    character[0x3d] = 3;
    character[0x4e] = 42;
    DAT_00201b68 = DAT_00201c7c = 1;
    DAT_00201c90 = DAT_00201c8c = 0;
    DAT_00201c9c = NULL;
    g_selected_object = NULL;
    g_cursor_holding_state = 0;
    DAT_00085730 = 3;
    g_visibility_max_ring_passes = 4;
    DAT_001013a4 = DAT_002020e4 = DAT_002020e8 = 0;
    clock_units = 0;
    loads = positions = deaths = probes = scan_calls = 0;
    first_x = first_y = hud_hp = -1;
    open_x = 10;
    open_y = 20;
}
void tearDown(void) {}

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
    TEST_ASSERT_EQUAL_PTR(resurrection_object, FUN_000539b0(7, 0, 10, &x, &y));
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
