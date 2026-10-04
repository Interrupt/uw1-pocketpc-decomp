#include "game_fixture.h"
#include "scheduler_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
void *resolve_object_link(ushort *link);
void *tilemap_lookup(int x, int y);
void free_object_slot(void *object);
void set_pending_update_flags(int flags);
long ce_rand(void);
int encode_object_slot_index(void *object);
undefined4 check_object_placement_clearance(void);
void adjust_door_close_animation_delay(void *object);
undefined4 play_positional_sound_effect(void);
undefined4 scheduler_advance_effect(void);
void *get_object_record_by_slot_index(int slot);
void build_object_placement_snapshot(void);
int build_collision_height_field_for_object(void);
undefined4 apply_placement_collision_sweep(void);
undefined4 sync_object_tile_position(void);
void npc_ai_default_tick(void);
undefined4 resolve_unique_npc_special_behavior(void);
void spawn_creature_death_loot(void);
void drop_creature_inventory_on_death(void);
int compute_vertical_aim_offset(void);
void spawn_npc_thrown_weapon(void);
void dispatch_tile_special_action(void);
byte get_current_music_track(void);
void set_pending_music_track(void);
uint read_realtime_clock_units(void);
int resolve_npc_melee_attack(void);
void *spawn_new_object(int type, int mobile);
void object_list_insert_head(void *head, void *object);
ushort *settle_dropped_object(void *object, int x, int y, int mode);
undefined4 drop_object_near_target(void);

undefined1 DAT_00250730_backing[65536];

char *g_scheduler_table;

undefined1 g_scheduler_count;

undefined4 DAT_0023b804;

int DAT_002508fc;

short DAT_0010144c, DAT_00101454;

undefined1 DAT_002048f0_backing[65536];

undefined1 DAT_00204950_backing[65536];

char queue[64 * 6];

ushort objects[3][16];

char tiles[3][8];

int freed[3];

ushort corpse[4];

int corpses_spawned, corpses_placed, corpse_type;

ushort *DAT_0010190c;

char *DAT_00101404, *DAT_00101438;

void *DAT_0010172c;

undefined1 DAT_001007d0_backing[6144], DAT_00202c90_backing[65536];

undefined2 DAT_002048c0_backing[32768];

undefined1 DAT_002048f0_backing[65536], DAT_00204950_backing[65536];

undefined1 DAT_00204980_backing[65536];

undefined2 DAT_00204990_backing[32768], DAT_002049b0_backing[32768];

undefined1 DAT_002027d0_backing[256];

undefined DAT_000853d8;

ushort DAT_000853b8, DAT_00101414, DAT_0010141c, DAT_00101910;

short DAT_00101938, DAT_0010193c, DAT_00202a3c;

byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_00101458;

byte DAT_001018fc, DAT_00101434, DAT_00101730;

char DAT_0010143c, DAT_0010173c;

undefined1 DAT_00101738;

undefined4 DAT_00101924, DAT_0010191c, DAT_001013fc;

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

void scheduler_fixture_reset(void)
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
    /* Armor/weapon tables precede monster records; effects occupy the tail. */
    uw_test_read_data("DATA/OBJECTS.DAT", DAT_001007d0_backing,
                      0xc00, 2 + 0x80 + 0x30 + 0x80, SEEK_SET);
    uw_test_read_data("DATA/OBJECTS.DAT", DAT_00250730_backing, 64, -64, SEEK_END);
}

void scheduler_fixture_dispose(void) {}

void add_spark(int slot, int y)
{
    objects[slot][0] = 0x1cb;
    *(ushort *)(tiles[y - 8 + 1] + 2) = slot << 6;
    TEST_ASSERT_NOT_EQUAL((uint)-1, scheduler_add_entry(slot, 1, 0, 12, y));
}
