#include "unity.h"
#include "uw.h"
#include <stdio.h>
#include "src/headers/debug.h"
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {}

/* The actual level-1 goblin and data tables. Allocation and placement are
   fixtures; sprite association, loot rolls, object creation and links are real. */
static ushort arena[0x4000];
static byte original_goblin[27], page_header[2];
static ushort *goblin;
char *DAT_002046b8, *DAT_002046c4, *g_despawn_creature_record;
undefined1 DAT_001007d0_backing[6144], DAT_00202c90_backing[65536];
undefined1 DAT_0023ce70_backing[8192];
undefined1 DAT_002027d0_backing[256];
short DAT_00201b68, DAT_0010144c, DAT_00101454;
undefined2 DAT_002020a0, DAT_002020a4;
ushort *g_player_object;
ushort *DAT_00202a44;
char *DAT_00086df8;
short DAT_00202a38, DAT_00202a3c, DAT_00202a40;
ushort DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54;
char DAT_00101928;
static ushort *projectile;
static unsigned rng_state, spawned, placed, palette_used;
static ushort *drops[16];
static int types[16];
static unsigned rolls[32], roll_count, roll_index;

static void read_data(const char *name, long offset, void *buffer, size_t count)
{
    char path[512];
    snprintf(path, sizeof path, "%s/%s", UW_TEST_DATA_DIR, name);
    FILE *file = fopen(path, "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, offset, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(count, fread(buffer, 1, count, file));
    fclose(file);
}
long Ordinal_1053(void)
{
    if (roll_index < roll_count) return rolls[roll_index++];
    rng_state = rng_state * 1664525u + 1013904223u;
    return (rng_state >> 1) & 0x7fffffff;
}
long Ordinal_2005(int divisor, int dividend) { return dividend / divisor; }
int roll_dice_sum(int count, int sides)
{
    int sum = 0;
    while (count--) sum += 1 + Ordinal_1053() % sides;
    return sum;
}
byte *uw_load_critter_page_cached(int page, int tier)
{
    TEST_ASSERT_EQUAL_INT(0, page); /* Goblin variants share page 0. */
    return tier == 0 ? page_header : NULL;
}
undefined4 decode_critter_sprite_page(int page, int tier, int direction, int palette, int frame)
{
    TEST_ASSERT_EQUAL_INT(0, page);
    palette_used = palette;
    return 1;
}
void *alloc_object_slot(int mobile)
{
    if (mobile) return projectile;
    TEST_ASSERT_LESS_THAN_UINT(16, spawned);
    drops[spawned] = (ushort *)(DAT_002046c4 + (1000 - spawned - 256) * 8);
    return drops[spawned++];
}
void *tilemap_lookup(int x, int y)
{
    TEST_ASSERT_EQUAL_INT(36, x);
    TEST_ASSERT_EQUAL_INT(28, y);
    return (byte *)arena + (y * 64 + x) * 4;
}
void *resolve_object_link(ushort *link)
{
    unsigned slot = *link >> 6;
    return !slot ? NULL : slot < 256 ? DAT_002046b8 + slot * 27
        : DAT_002046c4 + (slot - 256) * 8;
}
undefined4 object_ptr_in_arena(void) { return 1; }
static void record_placement(ushort *object)
{
    TEST_ASSERT_LESS_THAN_UINT(16, placed);
    types[placed++] = object[0] & 0x1ff;
    TEST_ASSERT_NOT_EQUAL(0x157, object[0] & 0x1ff); /* Shrine */
}
ushort *settle_dropped_object(ushort *object, int x, int y, int mode)
{ record_placement(object); return object; }
undefined4 drop_object_near_target(void *target, ushort *object, int distance, int mode)
{ record_placement(object); return 1; }
undefined4 place_object_in_world(int x, int y, int z, ushort *object, int distance, int mode)
{ record_placement(object); return 1; }

void free_object_slot(void *object) {}
undefined4 check_object_drop_height(void *object, void *source) { return 1; }
int encode_object_slot_index(void) { return 225; }
undefined4 play_sound_effect_at_object(int sound, void *object, int mode) { return 1; }
undefined4 spawn_scheduled_effect_object(void) { return 0; }
undefined4 roll_object_destroy_chance(void) { return 0; }
void print_scroll_message_by_id(void) {}
void FUN_00049924(void) {}
void spawn_effect_debris_burst(void) {}
void scheduler_relink_entry(void) {}
void set_ambient_bias_without_light(void) {}
undefined4 activate_area_hazard_object(void) { return 1; }
ushort *discard_misplaced_object(void *list, void *object, int release) { return NULL; }

void setUp(void)
{
    memset(arena, 0, sizeof arena);
    uint offset;
    read_data("DATA/LEV.ARK", 2, &offset, sizeof offset);
    read_data("DATA/LEV.ARK", offset, arena, 0x7300);
    DAT_002046b8 = (char *)arena + 0x4000;
    DAT_002046c4 = (char *)arena + 0x5b00;
    ushort *tile = (ushort *)((byte *)arena + (28 * 64 + 36) * 4);
    goblin = resolve_object_link(tile + 1);
    TEST_ASSERT_NOT_NULL(goblin);
    TEST_ASSERT_EQUAL_UINT16(0x4d, goblin[0] & 0x1ff);
    memcpy(original_goblin, goblin, sizeof original_goblin);
    read_data("DATA/OBJECTS.DAT", 2 + 0x80, DAT_002027d0_backing, 0x30);
    read_data("DATA/OBJECTS.DAT", 2 + 0x80 + 0x30 + 0x80, DAT_001007d0_backing, 0xc00);
    byte props[512 * 11];
    read_data("DATA/COMOBJ.DAT", 2, props, sizeof props);
    memset(DAT_00202c90_backing, 0, sizeof DAT_00202c90_backing);
    for (int type = 0; type < 512; type++) {
        memcpy(DAT_00202c90_backing + type * 13, props + type * 11, 4);
        memcpy(DAT_00202c90_backing + type * 13 + 5, props + type * 11 + 4, 7);
    }
    read_data("CRIT/ASSOC.ANM", 0x100, DAT_0023ce70_backing, 0x80);
    read_data("CRIT/CR00PAGE.N00", 0, page_header, sizeof page_header);
    DAT_00201b68 = 1;
    DAT_0010144c = 36;
    DAT_00101454 = 28;
    rng_state = 1;
    spawned = placed = palette_used = roll_count = roll_index = 0;
}
void tearDown(void) {}
static void test_level1_gray_goblin_uses_its_associated_palette(void)
{
    TEST_ASSERT_EQUAL_INT(1, resolve_critter_sprite_tier(goblin[0] & 0x3f, 28, 0, 0));
    TEST_ASSERT_EQUAL_UINT(2, palette_used);
}
static void test_gray_goblin_loot_is_limited_to_its_actual_template(void)
{
    for (int seed = 0; seed < 256; seed++) {
        memcpy(goblin, original_goblin, sizeof original_goblin);
        spawned = placed = 0;
        rng_state = seed;
        spawn_creature_death_loot(goblin);
        byte *stats = DAT_001007d0_backing + 13 * 0x30;
        drop_monster_loot(goblin, stats[8] >> 5, (stats[10] >> 2) & 7);
        drop_creature_inventory_on_death(goblin);
        TEST_ASSERT_GREATER_THAN_UINT(0, placed);
        for (unsigned item = 0; item < placed; item++) {
            int type = types[item];
            char failure[100];
            snprintf(failure, sizeof failure, "Seed %d spawned unexpected loot type 0x%x", seed, type);
            TEST_ASSERT_TRUE_MESSAGE(type == 0xb0 || type == 0xdd || type == 0xc6 || type == 0x10 ||
                type == 7 || type == 0x20 || type == 0x18 || (type >= 0xa0 && type <= 0xa6),
                failure);
        }
    }
}
static void test_equipment_drop_quality_uses_the_level_roll_remainder(void)
{
    g_despawn_creature_record = (char *)DAT_001007d0_backing + 13 * 0x30;
    rolls[0] = 0; rolls[1] = 3; rolls[2] = 0; rolls[3] = 2;
    roll_count = 4;
    spawn_creature_equipment_drop(goblin);
    TEST_ASSERT_EQUAL_UINT(2, spawned);
    TEST_ASSERT_EQUAL_UINT(7, drops[0][2] & 0x3f);
    TEST_ASSERT_EQUAL_UINT(6, drops[1][2] & 0x3f);
}
static void test_gray_goblin_ranged_attack_spawns_a_sling_stone(void)
{
    byte *stats = DAT_001007d0_backing + 13 * 0x30;
    unsigned ammo = (stats[0x20] & 0x1e) >> 1;
    TEST_ASSERT_EQUAL_UINT(0, ammo);
    projectile = (ushort *)(DAT_002046b8 + 255 * 27);
    memset(projectile, 0, 27);
    FUN_0004a510(goblin, ammo, (&DAT_002027d1)[ammo * 3]);
    TEST_ASSERT_EQUAL_UINT(0, spawned); /* projectiles stay mobile until landing */
    ushort *tile = (ushort *)((byte *)arena + (28 * 64 + 36) * 4);
    TEST_ASSERT_EQUAL_PTR(projectile, resolve_object_link(tile + 1));
    TEST_ASSERT_EQUAL_UINT(DAT_002027d0_backing[1], projectile[0x13 / 2] >> 8 & 0x7f);
    TEST_ASSERT_EQUAL_UINT16(0x10, projectile[0] & 0x1ff);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level1_gray_goblin_uses_its_associated_palette);
    RUN_TEST(test_gray_goblin_loot_is_limited_to_its_actual_template);
    RUN_TEST(test_equipment_drop_quality_uses_the_level_roll_remainder);
    RUN_TEST(test_gray_goblin_ranged_attack_spawns_a_sling_stone);
    return UNITY_END();
}
