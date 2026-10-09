#include "src/headers/uw.h"
#include "unity.h"

static union { uint64_t alignment; byte bytes[0x8000]; } storage;
char *DAT_002029cc = (char *)storage.bytes;
char *DAT_002046b8, *DAT_002046c4, *DAT_002046a4, *DAT_002046a8;
char *DAT_002046bc, *DAT_0020469c, *g_backpack_slot_table, *g_scheduler_table;
byte *DAT_002046c0, *DAT_002046c8;
char *DAT_002046ac, *DAT_002046a0;
byte g_scheduler_count;
uw_mobile_object_t *g_player_object;
byte *g_save_equip_table_ptr, *g_save_record_base_ptr;
undefined2 g_save_record_count_backing[8192];
undefined2 g_cursor_holding_state;
char *g_selected_object;
undefined1 DAT_0023bca8_backing[256];
char *DAT_00086df8 = (char *)DAT_0023bca8_backing;
static int mobile_allocations;

void active_mobile_list_add(byte slot)
{
    TEST_ASSERT_TRUE(slot >= 2);
    mobile_allocations++;
}
void despawn_objects_outside_radius(int rows, short count)
{ TEST_FAIL_MESSAGE("Restore unexpectedly exhausted the object arena"); }
void reset_equipment_and_container_state(void)
{ memset(g_backpack_slot_table, 0, 0x3a); }
void close_backpack_container(void) {}
void free_linked_object_recursive(ushort *link)
{ TEST_FAIL_MESSAGE("No cursor item should need freeing"); }
void *ce_memmove(void *dest, void *source, unsigned int size)
{ return memmove(dest, source, size); }

void setUp(void)
{
    memset(&storage, 0, sizeof storage);
    memset(DAT_0023bca8_backing, 0, sizeof DAT_0023bca8_backing);
    g_player_object = (uw_mobile_object_t *)(storage.bytes + 0x4000 + 27);
    g_cursor_holding_state = 0;
    g_selected_object = NULL;
    mobile_allocations = 0;
}
void tearDown(void) {}

static void test_fresh_arena_allocates_every_free_slot_in_the_correct_region(void)
{
    reset_level_object_arena();
    for (int slot = 1023; slot >= 256; --slot) {
        uw_object_hdr_t *object = alloc_object_slot(0);
        TEST_ASSERT_EQUAL_PTR(storage.bytes + 0x5b00 + (slot - 256) * 8, object);
        TEST_ASSERT_EQUAL_INT(slot, encode_object_slot_index(object));
    }
    for (int slot = 255; slot >= 2; --slot) {
        uw_object_hdr_t *object = alloc_object_slot(1);
        TEST_ASSERT_EQUAL_PTR(storage.bytes + 0x4000 + slot * 27, object);
    }
    TEST_ASSERT_EQUAL_INT(254, mobile_allocations);
    TEST_ASSERT_EQUAL_PTR(DAT_002046bc - 2, DAT_0020469c);
    TEST_ASSERT_EQUAL_PTR(DAT_002046a4 - 2, DAT_002046a8);
    TEST_ASSERT_EQUAL_UINT8(0, storage.bytes[0x7afc]);
}

static void make_saved_inventory(byte *record)
{
    memset(record, 0, 0x400);
    uw_mobile_object_t *player = (uw_mobile_object_t *)record;
    player->hdr.object_id = 0x7f;
    player->hdr.link = 1;
    player->npc_hp = 31;
    uw_object_hdr_t *bag = (uw_object_hdr_t *)(record + 0x5b + 8);
    bag->object_id = 0x15f;
    bag->next = 2;
    bag->link = 3;
    uw_object_hdr_t *stack = bag + 1;
    stack->object_id = 0x81;
    stack->is_quant = 1;
    stack->link = 7;
    uw_object_hdr_t *key = stack + 1;
    key->object_id = 0x106;
    key->is_quant = 1;
    key->link = 1;
    *(ushort *)(record + 0x23 + 12 * 2) = 1 << 6; /* backpack bag */
    *(ushort *)(record + 0x23 + 9 * 2) = 2 << 6; /* equipped stack */
}

static void check_restored_inventory(void)
{
    /* A valid root must refer to the stationary table, even before a level load. */
    TEST_ASSERT_TRUE(g_player_object->hdr.link >= 256);
    uw_object_hdr_t *bag = resolve_object_link(&g_player_object->hdr.link_word);
    TEST_ASSERT_NOT_NULL(bag);
    TEST_ASSERT_EQUAL_HEX16(0x15f, bag->object_id);
    uw_object_hdr_t *stack = resolve_object_link(&bag->chain_word);
    uw_object_hdr_t *key = resolve_object_link(&bag->link_word);
    TEST_ASSERT_NOT_NULL(stack);
    TEST_ASSERT_NOT_NULL(key);
    TEST_ASSERT_EQUAL_HEX16(0x81, stack->object_id);
    TEST_ASSERT_EQUAL_INT(7, stack->link);
    TEST_ASSERT_EQUAL_INT(1, stack->is_quant);
    TEST_ASSERT_EQUAL_INT(0, stack->next);
    TEST_ASSERT_EQUAL_HEX16(0x106, key->object_id);
    TEST_ASSERT_EQUAL_PTR(bag, resolve_object_link((ushort *)(g_backpack_slot_table + 12 * 2)));
    TEST_ASSERT_EQUAL_PTR(stack, resolve_object_link((ushort *)(g_backpack_slot_table + 9 * 2)));
    TEST_ASSERT_EQUAL_UINT8(31, g_player_object->npc_hp);
}

static void test_cold_restore_preserves_nested_inventory_and_equipment_through_snapshot(void)
{
    byte record[0x400], snapshot[0x400] = {0};
    make_saved_inventory(record);
    reset_level_object_arena();
    g_save_record_count = 4;
    restore_player_save_record(record);
    check_restored_inventory();

    /* load_level snapshots the restored player before replacing the arena. */
    build_player_save_record(snapshot);
    TEST_ASSERT_EQUAL_INT(3, g_save_record_count);
    TEST_ASSERT_EQUAL_INT(1, ((uw_mobile_object_t *)snapshot)->hdr.link);
    g_save_record_count++;
    memset(storage.bytes + 0x7300, 0xa5, 0x7fc);
    reset_level_object_arena();
    restore_player_save_record(snapshot);
    check_restored_inventory();
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_fresh_arena_allocates_every_free_slot_in_the_correct_region);
    RUN_TEST(test_cold_restore_preserves_nested_inventory_and_equipment_through_snapshot);
    return UNITY_END();
}
