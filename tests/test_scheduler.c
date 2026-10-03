#include "unity.h"
#include "../src/headers/uw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Real scheduler functions, with a small tile/object arena fixture. */
undefined1 DAT_00250730_backing[65536];
char *g_scheduler_table;
undefined1 g_scheduler_count;
undefined4 DAT_0023b804;
int DAT_002508fc;
short DAT_0010144c, DAT_00101454;
undefined1 DAT_002048f0_backing[65536];
undefined1 DAT_00204950_backing[65536];
static char queue[64 * 6];
static ushort objects[3][16];
static char tiles[3][8];
static int freed[3];
static ushort corpse[4];
static int corpses_spawned, corpses_placed, corpse_type;

ushort *DAT_0010190c;
char *DAT_00101404, *DAT_00101438;
void *DAT_0010172c;
undefined1 DAT_001007d0_backing[6144], DAT_00202c90_backing[65536];
undefined2 DAT_002048c0_backing[32768];
undefined1 DAT_002048f0_backing[65536], DAT_00204950_backing[65536];
undefined1 DAT_00204980_backing[65536];
undefined2 DAT_00204990_backing[32768], DAT_002049b0_backing[32768];
undefined DAT_002027d1_backing[8192], DAT_000853d8;
ushort DAT_000853b8, DAT_00101414, DAT_0010141c, DAT_00101910;
short DAT_00101938, DAT_0010193c, DAT_00202a3c;
byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_00101458;
byte DAT_001018fc, DAT_00101434, DAT_00101730;
char DAT_0010143c, DAT_0010173c;
undefined1 DAT_00101738;
undefined4 DAT_00101924, DAT_0010191c, DAT_001013fc;
/* DAT_00101734 is now a macro (uw.h) aliasing element 0 of a real
   256-entry backing array -- see that header's own comment. */
undefined4 DAT_00101734_backing[256];
undefined4 DAT_00101560, DAT_00101914, DAT_00101944;
int DAT_00101430;

void *resolve_object_link(ushort *link)
{
    unsigned slot = *link >> 6;
    if (slot == 3) return corpse;
    return slot < 3 && slot > 0 && !freed[slot] ? objects[slot] : NULL;
}
void *tilemap_lookup(int x, int y)
{
    TEST_ASSERT_EQUAL_INT(12, x);
    TEST_ASSERT_TRUE_MESSAGE(y == 8 || y == 9, "scheduler used an unexpected tile y");
    return tiles[y - 8 + 1];
}
void free_object_slot(void *object)
{
    int slot = object == objects[1] ? 1 : 2;
    TEST_ASSERT_EQUAL_PTR(objects[slot], object);
    freed[slot]++;
}
void set_pending_update_flags(int flags) { (void)flags; }
long ordint_divmod(int divisor, int dividend) { return dividend / divisor; }
long ce_rand(void) { return 15; }
int encode_object_slot_index(void *object)
{
    if (object == objects[1]) return 1;
    if (object == objects[2]) return 2;
    TEST_ASSERT_EQUAL_PTR(corpse, object);
    return 3;
}
undefined4 check_object_placement_clearance(void) { TEST_FAIL_MESSAGE("Unexpected door sweep"); return 0; }
void adjust_door_close_animation_delay(void *object) { (void)object; }
undefined4 play_positional_sound_effect(void) { return 0; }
undefined4 scheduler_advance_effect(void) { TEST_FAIL_MESSAGE("Unexpected directional effect"); return 0; }

/* Movement and unrelated NPC actions do not change this stationary fixture. */
void *get_object_record_by_slot_index(int slot) { TEST_ASSERT_EQUAL_INT(1, slot); return objects[1]; }
void build_object_placement_snapshot(void) {}
int build_collision_height_field_for_object(void) { return 0; }
undefined4 apply_placement_collision_sweep(void) { return 0; }
undefined4 sync_object_tile_position(void) { return 0; }
void npc_ai_default_tick(void) { TEST_FAIL_MESSAGE("Unexpected live NPC behavior"); }
undefined4 resolve_unique_npc_special_behavior(void) { return 1; }
void spawn_creature_death_loot(void) {}
void drop_creature_inventory_on_death(void) {}
int compute_vertical_aim_offset(void) { TEST_FAIL_MESSAGE("Unexpected NPC missile"); return 0; }
void spawn_npc_thrown_weapon(void) { TEST_FAIL_MESSAGE("Unexpected NPC missile"); }
void dispatch_tile_special_action(void) { TEST_FAIL_MESSAGE("Unexpected NPC special action"); }
byte get_current_music_track(void) { return 0; }
void set_pending_music_track(void) {}
uint read_realtime_clock_units(void) { return 0; }
int resolve_npc_melee_attack(void) { TEST_FAIL_MESSAGE("Unexpected NPC attack"); return 0; }
void *spawn_new_object(int type, int mobile)
{
    TEST_ASSERT_EQUAL_INT(0, mobile);
    corpses_spawned++;
    corpse_type = type;
    corpse[0] = type;
    return corpse;
}
void object_list_insert_head(void *head, void *object)
{
    TEST_ASSERT_EQUAL_PTR(tiles[2] + 2, head);
    TEST_ASSERT_EQUAL_PTR(corpse, object);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)head >> 6);
    *(ushort *)head = 3 << 6;
}
ushort *settle_dropped_object(void *object, int x, int y, int mode)
{
    TEST_ASSERT_EQUAL_PTR(corpse, object);
    TEST_ASSERT_EQUAL_INT(12, x);
    TEST_ASSERT_EQUAL_INT(9, y);
    TEST_ASSERT_EQUAL_INT(1, mode);
    corpses_placed++;
    return object;
}
undefined4 drop_object_near_target(void) { TEST_FAIL_MESSAGE("Unexpected random treasure"); return 0; }

void setUp(void)
{
    memset(queue, 0, sizeof queue);
    memset(objects, 0, sizeof objects);
    memset(tiles, 0, sizeof tiles);
    memset(freed, 0, sizeof freed);
    memset(corpse, 0, sizeof corpse);
    corpses_spawned = corpses_placed = corpse_type = 0;
    memset(DAT_00250730_backing, 0, sizeof DAT_00250730_backing);
    g_scheduler_table = queue;
    g_scheduler_count = 0;
    DAT_0023b804 = 0;
    DAT_002508fc = 0;
    FILE *file = fopen(UW_TEST_DATA_DIR "/DATA/OBJECTS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(file);
    /* 2-byte header and the three armor/weapon tables precede the
       64 monster records; the final 64 bytes are the effect table. */
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 2 + 0x80 + 0x30 + 0x80, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(0xc00, fread(DAT_001007d0_backing, 1, 0xc00, file));
    TEST_ASSERT_EQUAL_INT(0, fseek(file, -64, SEEK_END));
    TEST_ASSERT_EQUAL_UINT(64, fread(DAT_00250730_backing, 1, 64, file));
    fclose(file);
}
void tearDown(void) {}

static void add_spark(int slot, int y)
{
    objects[slot][0] = 0x1cb;
    *(ushort *)(tiles[y - 8 + 1] + 2) = slot << 6;
    TEST_ASSERT_NOT_EQUAL((uint)-1, scheduler_add_entry(slot, 1, 0, 12, y));
}

void test_damage_spark_animates_then_disappears(void)
{
    add_spark(1, 8);
    TEST_ASSERT_EQUAL_UINT16(45, objects[1][3] & 0x3f);
    TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
    scheduler_tick(1);
    TEST_ASSERT_EQUAL_UINT16(46, objects[1][3] & 0x3f);
    TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
    TEST_ASSERT_EQUAL_INT(0, freed[1]);
    scheduler_tick(1);
    TEST_ASSERT_EQUAL_UINT8(1, freed[1]);
    TEST_ASSERT_EQUAL_UINT8(0, g_scheduler_count);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)(tiles[1] + 2) >> 6);
}

void test_expired_sparks_all_disappear(void)
{
    add_spark(1, 8);
    add_spark(2, 9);
    scheduler_tick(2);
    TEST_ASSERT_EQUAL_INT(1, freed[1]);
    scheduler_tick(2); /* The original queue defers the swapped-in entry. */
    TEST_ASSERT_EQUAL_INT(1, freed[2]);
    TEST_ASSERT_EQUAL_UINT8(0, g_scheduler_count);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)(tiles[1] + 2) >> 6);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)(tiles[2] + 2) >> 6);
}

void test_spark_animation_wraps_with_an_indefinite_delay(void)
{
    objects[1][0] = 0x1cb;
    scheduler_add_entry(1, -1, 0, 12, 8);
    for (int tick = 1; tick <= 8; tick++) {
        scheduler_tick(1);
        TEST_ASSERT_EQUAL_UINT16(45 + tick % 5, objects[1][3] & 0x3f);
        TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
        TEST_ASSERT_EQUAL_INT(0, freed[1]);
    }
}

void test_initial_frame_uses_intensity_modulo_animation_length(void)
{
    objects[1][0] = 0x1cb;
    objects[1][3] = 0xaac0;
    scheduler_add_entry(1, 1, 12, 12, 8);
    TEST_ASSERT_EQUAL_UINT16(47, objects[1][3] & 0x3f); /* 45 + 12 % 5. */
    TEST_ASSERT_EQUAL_HEX16(0xaac0, objects[1][3] & 0xffc0);
}

void test_removing_an_entry_preserves_the_other_pending_effect(void)
{
    add_spark(1, 8);
    add_spark(2, 9);
    scheduler_remove_entry(1);
    TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
    TEST_ASSERT_EQUAL_UINT16(2, *(ushort *)queue >> 6);
    scheduler_tick(2);
    TEST_ASSERT_EQUAL_INT(0, freed[1]);
    TEST_ASSERT_EQUAL_INT(1, freed[2]);
    TEST_ASSERT_EQUAL_UINT8(0, g_scheduler_count);
}

void test_scheduler_rejects_entries_after_its_64_slot_capacity(void)
{
    objects[1][0] = 0x1cb;
    for (int count = 1; count <= 64; count++)
        TEST_ASSERT_EQUAL_UINT(count, scheduler_add_entry(1, 1, 0, 12, 8));
    TEST_ASSERT_EQUAL_UINT((uint)-1, scheduler_add_entry(1, 1, 0, 12, 8));
    TEST_ASSERT_EQUAL_UINT8(64, g_scheduler_count);
}

void test_critter_death_animation_finishes_and_leaves_a_corpse(void)
{
    byte *critter = (byte *)objects[2];
    objects[2][0] = 0x40; /* Rat, whose data record drops a rat corpse (0xd9). */
    objects[2][0xb] = (12 << 10) | (9 << 4);
    *(ushort *)(tiles[2] + 2) = 2 << 6;
    critter[8] = 10;
    critter[0x14] = 4;
    DAT_0010190c = objects[2];
    DAT_00101938 = 12;
    DAT_0010193c = 9;
    TEST_ASSERT_EQUAL_UINT(1, initiate_npc_death((char *)critter));
    for (int frame = 1; frame <= 3; frame++) {
        TEST_ASSERT_EQUAL_UINT(1, npc_ai_tick());
        TEST_ASSERT_EQUAL_UINT8(frame, critter[0xc] >> 4);
        TEST_ASSERT_EQUAL_INT(0, corpses_spawned);
        TEST_ASSERT_EQUAL_INT(0, freed[2]);
    }
    TEST_ASSERT_EQUAL_UINT(0, npc_ai_tick());
    TEST_ASSERT_EQUAL_INT(1, freed[2]);
    TEST_ASSERT_EQUAL_INT(1, corpses_spawned);
    TEST_ASSERT_EQUAL_INT(1, corpses_placed);
    TEST_ASSERT_EQUAL_HEX16(0xd9, corpse_type);
    TEST_ASSERT_EQUAL_UINT16(3, *(ushort *)(tiles[2] + 2) >> 6);
    TEST_ASSERT_EQUAL_UINT16(0, corpse[2] >> 6);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_damage_spark_animates_then_disappears);
    RUN_TEST(test_expired_sparks_all_disappear);
    RUN_TEST(test_spark_animation_wraps_with_an_indefinite_delay);
    RUN_TEST(test_initial_frame_uses_intensity_modulo_animation_length);
    RUN_TEST(test_removing_an_entry_preserves_the_other_pending_effect);
    RUN_TEST(test_scheduler_rejects_entries_after_its_64_slot_capacity);
    RUN_TEST(test_critter_death_animation_finishes_and_leaves_a_corpse);
    return UNITY_END();
}
