#include "game_fixture.h"
#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>
#include "src/headers/debug.h"
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {}

/* The actual level-1 goblin and data tables. Allocation and placement are
   fixtures; sprite association, loot rolls, object creation and links are real. */
ushort arena[0x4000];
byte original_goblin[27], page_header[2];
ushort *goblin;
char *DAT_002046b8, *DAT_002046c4, *g_despawn_creature_record;
undefined1 DAT_001007d0_backing[3072], DAT_00202c90_backing[8192];
undefined1 DAT_0023ce70_backing[128];
undefined1 DAT_002027d0_backing[48];
short DAT_00201b68, DAT_0010144c, DAT_00101454;
undefined2 DAT_002020a0, DAT_002020a4;
ushort *g_player_object;
ushort *DAT_00202a44;
char *DAT_00086df8;
short DAT_00202a38, DAT_00202a3c, DAT_00202a40;
ushort DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54;
char DAT_00101928;
ushort *projectile;
unsigned rng_state, spawned, placed, palette_used;
ushort *drops[16];
int types[16];
unsigned rolls[32], roll_count, roll_index;

void read_data(const char *name, long offset, void *buffer, size_t count)
{
    uw_test_read_data(name, buffer, count, offset, SEEK_SET);
}
long ce_rand(void)
{
    if (roll_index < roll_count) return rolls[roll_index++];
    rng_state = rng_state * 1664525u + 1013904223u;
    return (rng_state >> 1) & 0x7fffffff;
}
int roll_dice_sum(int count, short sides)
{
    int sum = 0;
    while (count--) sum += 1 + ce_rand() % sides;
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
void record_placement(ushort *object)
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
void set_pending_update_flags(void) {}
void spawn_effect_debris_burst(void) {}
void scheduler_relink_entry(void) {}
void set_ambient_bias_without_light(void) {}
undefined4 activate_area_hazard_object(void) { return 1; }
ushort *discard_misplaced_object(void *list, void *object, int release) { return NULL; }

void creatures_fixture_reset(void)
{
    memset(arena, 0, sizeof arena);
    uw_test_load_map((byte *)arena, sizeof arena, 1);
    DAT_002046b8 = (char *)arena + 0x4000;
    DAT_002046c4 = (char *)arena + 0x5b00;
    ushort *tile = (ushort *)((byte *)arena + (28 * 64 + 36) * 4);
    goblin = resolve_object_link(tile + 1);
    TEST_ASSERT_NOT_NULL(goblin);
    TEST_ASSERT_EQUAL_UINT16(0x4d, goblin[0] & 0x1ff);
    memcpy(original_goblin, goblin, sizeof original_goblin);
    read_data("DATA/OBJECTS.DAT", 2 + 0x80, DAT_002027d0_backing, 0x30);
    read_data("DATA/OBJECTS.DAT", 2 + 0x80 + 0x30 + 0x80, DAT_001007d0_backing, 0xc00);
    uw_test_load_object_properties(DAT_00202c90_backing, sizeof DAT_00202c90_backing);
    read_data("CRIT/ASSOC.ANM", 0x100, DAT_0023ce70_backing, 0x80);
    read_data("CRIT/CR00PAGE.N00", 0, page_header, sizeof page_header);
    DAT_00201b68 = 1;
    DAT_0010144c = 36;
    DAT_00101454 = 28;
    rng_state = 1;
    spawned = placed = palette_used = roll_count = roll_index = 0;
}
void creatures_fixture_dispose(void) {}
