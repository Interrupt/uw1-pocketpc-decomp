#include "unity.h"
#include "uw.h"

/* Run the real trap dispatcher with resource lookup and display stubbed. */
char *DAT_00086df8, *DAT_0024cff4;
ushort *DAT_0024cff0, *g_player_object;
undefined4 DAT_00202c84;
undefined2 DAT_002020a0, DAT_002020a4;
char s_Look__it_s_a_text_trap_00087918[] = "Look, it's a text trap";
static byte level_one[0x7c08];
static char message[] = "Orb text trap message";
static char *available_message;
static uint message_id;
static int lookups, prints;

char *get_message_string(uint id)
{ lookups++; message_id = id; return available_message; }
int message_scroll_print_wrapped(char *text)
{
    /* Check before dereferencing so pointer truncation reports a test failure. */
    TEST_ASSERT_EQUAL_PTR(message, text);
    TEST_ASSERT_EQUAL_STRING(message, text);
    prints++;
    return 1;
}
void debug_print(char *format, ...) { (void)format; }

/* Other effects must not run for this text trap. */
ushort * find_equipped_item_by_category(void) { TEST_FAIL_MESSAGE("Unexpected find_equipped_item_by_category in text trap"); return 0; }
void set_pending_update_flags(void) { TEST_FAIL_MESSAGE("Unexpected set_pending_update_flags in text trap"); }
void spawn_trap_hazard_object(void) { TEST_FAIL_MESSAGE("Unexpected spawn_trap_hazard_object in text trap"); }
void * get_object_record_by_slot_index(void) { TEST_FAIL_MESSAGE("Unexpected get_object_record_by_slot_index in text trap"); return 0; }
ushort * find_object_in_chain(void) { TEST_FAIL_MESSAGE("Unexpected find_object_in_chain in text trap"); return 0; }
void * alloc_object_slot(void) { TEST_FAIL_MESSAGE("Unexpected alloc_object_slot in text trap"); return 0; }
undefined4 apply_area_terrain_effect(void) { TEST_FAIL_MESSAGE("Unexpected apply_area_terrain_effect in text trap"); return 0; }
undefined4 apply_poison_or_damage_trap_effect(void) { TEST_FAIL_MESSAGE("Unexpected apply_poison_or_damage_trap_effect in text trap"); return 0; }
undefined4 check_object_area_for_spawn_block(void) { TEST_FAIL_MESSAGE("Unexpected check_object_area_for_spawn_block in text trap"); return 0; }
void close_door_object(void) { TEST_FAIL_MESSAGE("Unexpected close_door_object in text trap"); }
undefined4 dispatch_quest_event_code(void) { TEST_FAIL_MESSAGE("Unexpected dispatch_quest_event_code in text trap"); return 0; }
undefined4 dispatch_trap_special_or_tile_action(void) { TEST_FAIL_MESSAGE("Unexpected dispatch_trap_special_or_tile_action in text trap"); return 0; }
int encode_object_slot_index(void) { TEST_FAIL_MESSAGE("Unexpected encode_object_slot_index in text trap"); return 0; }
void free_object_slot(void) { TEST_FAIL_MESSAGE("Unexpected free_object_slot in text trap"); }
void object_list_insert_head(void) { TEST_FAIL_MESSAGE("Unexpected object_list_insert_head in text trap"); }
void object_list_unlink(void) { TEST_FAIL_MESSAGE("Unexpected object_list_unlink in text trap"); }
undefined4 object_ptr_in_arena(void) { TEST_FAIL_MESSAGE("Unexpected object_ptr_in_arena in text trap"); return 0; }
void open_door_object(void) { TEST_FAIL_MESSAGE("Unexpected open_door_object in text trap"); }
undefined4 place_object_in_world(void) { TEST_FAIL_MESSAGE("Unexpected place_object_in_world in text trap"); return 0; }
void print_message_with_proximity_qualifier(void) { TEST_FAIL_MESSAGE("Unexpected print_message_with_proximity_qualifier in text trap"); }
undefined4 rand_below(void) { TEST_FAIL_MESSAGE("Unexpected rand_below in text trap"); return 0; }
void * resolve_object_link(void) { TEST_FAIL_MESSAGE("Unexpected resolve_object_link in text trap"); return 0; }
uint resolve_skill_gated_unlock_or_use(void) { TEST_FAIL_MESSAGE("Unexpected resolve_skill_gated_unlock_or_use in text trap"); return 0; }
uint scheduler_add_entry(void) { TEST_FAIL_MESSAGE("Unexpected scheduler_add_entry in text trap"); return 0; }
undefined4 teleport_object_to_level_tile(void) { TEST_FAIL_MESSAGE("Unexpected teleport_object_to_level_tile in text trap"); return 0; }
void * tilemap_lookup(void) { TEST_FAIL_MESSAGE("Unexpected tilemap_lookup in text trap"); return 0; }
void toggle_door_object(void) { TEST_FAIL_MESSAGE("Unexpected toggle_door_object in text trap"); }
void unlink_and_free_object(void) { TEST_FAIL_MESSAGE("Unexpected unlink_and_free_object in text trap"); }

static ushort *level_object(unsigned slot)
{
    TEST_ASSERT_GREATER_THAN_UINT(0, slot);
    TEST_ASSERT_LESS_THAN_UINT(1024, slot);
    return (ushort *)(level_one + (slot < 256 ? 0x4000 + slot * 27 :
                                 0x5b00 + (slot - 256) * 8));
}
static ushort *orb_text_trap(void)
{
    FILE *archive = fopen(UW_TEST_DATA_DIR "/DATA/LEV.ARK", "rb");
    TEST_ASSERT_NOT_NULL_MESSAGE(archive, "data/DATA/LEV.ARK is required");
    byte header[6];
    TEST_ASSERT_EQUAL_UINT(6, fread(header, 1, 6, archive));
    uint offset = header[2] | (uint)header[3] << 8 |
                  (uint)header[4] << 16 | (uint)header[5] << 24;
    TEST_ASSERT_EQUAL_INT(0, fseek(archive, offset, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(sizeof(level_one), fread(level_one, 1, sizeof(level_one), archive));
    TEST_ASSERT_EQUAL_INT(0, fclose(archive));
    ushort *tile = (ushort *)(level_one + (58 + 13 * 64) * 4);
    unsigned slot = tile[1] >> 6;
    ushort *orb = NULL;
    for (unsigned count = 0; slot && count < 1024; count++) {
        ushort *object = level_object(slot);
        if ((*object & 0x1ff) == 0x117) { orb = object; break; }
        slot = object[2] >> 6;
    }
    TEST_ASSERT_NOT_NULL_MESSAGE(orb, "Expected orb near (57,13), at (58,13)");
    ushort *trigger = level_object(orb[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x1a3, *trigger & 0x1ff);
    ushort *trap = level_object(trigger[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x190, *trap & 0x1ff);
    return trap;
}
void setUp(void)
{ available_message = message; lookups = prints = 0; message_id = 0; }
void tearDown(void) {}

static void test_level_one_orb_text_trap_passes_full_message_pointer(void)
{
    TEST_ASSERT_EQUAL_INT(2, dispatch_trap_type_effect(orb_text_trap(), 58, 13));
    TEST_ASSERT_EQUAL_INT(1, lookups);
    TEST_ASSERT_EQUAL_HEX16(0x1201, message_id);
    TEST_ASSERT_EQUAL_INT(1, prints);
}
static void test_level_one_orb_missing_message_is_not_printed(void)
{
    available_message = NULL;
    TEST_ASSERT_EQUAL_INT(2, dispatch_trap_type_effect(orb_text_trap(), 58, 13));
    TEST_ASSERT_EQUAL_INT(1, lookups);
    TEST_ASSERT_EQUAL_HEX16(0x1201, message_id);
    TEST_ASSERT_EQUAL_INT(0, prints);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level_one_orb_text_trap_passes_full_message_pointer);
    RUN_TEST(test_level_one_orb_missing_message_is_not_printed);
    return UNITY_END();
}
