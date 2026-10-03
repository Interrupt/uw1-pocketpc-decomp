#include "unity.h"
#include "../src/headers/uw.h"
#include "src/headers/inventory.h"
#include "src/headers/ordinal_stubs.h"

/* Object links and widget slots are fixtures; recursive inventory lookup is real. */
static ushort objects[5][4];
static ushort slots[29];
char *g_backpack_slot_table = (char *)slots;
unsigned char g_backpack_widget_to_slot_backing[0x17];
char *g_current_container_record;
ushort *DAT_002046b4;

void *resolve_object_link(ushort *link)
{
    unsigned slot = *link >> 6;
    TEST_ASSERT_GREATER_THAN_UINT(0, slot);
    TEST_ASSERT_LESS_THAN_UINT(5, slot);
    return objects[slot];
}

int encode_object_slot_index(ushort *object)
{
    TEST_ASSERT_NOT_NULL(object);
    for (int i = 1; i < 5; i++)
        if (object == objects[i]) return i;
    TEST_FAIL_MESSAGE("Lookup must pass the actual object pointer to slot encoding");
    return 0;
}

static int message_lookups, printed_messages, other_actions;
static uint last_message_id;
static char key_description[] = "Key information";
static char *available_message;
static ushort *last_action_object;
static short last_action_mode;

/* Exercise the deferred use callback; input picking and UI output are fixtures. */
static short click_state[16];
short *DAT_00085a6c = click_state;
undefined2 g_cursor_mode, g_cursor_holding_state;
ushort *g_player_object, *g_interact_target;
char *g_selected_object, *DAT_00202098, *DAT_002020b0;
short DAT_000858c4, DAT_002020ac;
code *DAT_002020b8;
undefined1 DAT_000878ec_backing[32768];
char s_UNNAMED_00084f24[] = "UNNAMED";
char s_on_what__000878e0[] = " on what?";
void (*const PTR_FUN_000858c8_table[5])(void) = {0};
static ushort *picked_target, *combined_target;
static int prompt_prints, combination_calls, released_clicks, reset_cursor;
static uint scroll_message;
static int target_reachable = 1, target_obstructed;

unsigned int Ordinal_1068(char *text) { return (unsigned int)strlen(text); }
char *Ordinal_1063(char *dest, const char *text) { return strcat(dest, text); }
undefined4 build_object_display_name(char *text, ushort *object, int a, int b)
{
    TEST_ASSERT_EQUAL_PTR(objects[2], object);
    (void)a; (void)b;
    strcpy(text, "key");
    return 1;
}
void push_cursor_icon(int type) { TEST_ASSERT_EQUAL_HEX16(0x106, type); }
void pop_cursor_icon(int mode) { TEST_ASSERT_EQUAL_INT(3, mode); reset_cursor++; }
ushort *pick_object_under_cursor(int mode)
{ TEST_ASSERT_EQUAL_INT(2, mode); return picked_target; }
undefined4 target_in_range(int actor, ushort *target, char *range)
{ (void)actor; (void)range; TEST_ASSERT_EQUAL_PTR(picked_target, target); return target_reachable; }
undefined4 target_line_of_sight(int actor, ushort *target)
{ (void)actor; TEST_ASSERT_EQUAL_PTR(picked_target, target); return target_obstructed; }
undefined4 check_object_combination(char *actor, ushort *target, int key_id)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor);
    TEST_ASSERT_EQUAL_INT(1, key_id);
    combined_target = target;
    combination_calls++;
    return 3;
}
void handle_game_view_click_hold(void) { TEST_FAIL_MESSAGE("Unexpected held click"); }
void interact_use(void) { TEST_FAIL_MESSAGE("Unexpected direct use"); }
void describe_picked_terrain(int mode, int tile) { (void)mode; (void)tile; TEST_FAIL_MESSAGE("Unexpected terrain action"); }
void handle_object_drop_target(int slot) { (void)slot; TEST_FAIL_MESSAGE("Unexpected drop"); }
void complete_cast_spell_on_target(void) { TEST_FAIL_MESSAGE("Unexpected spell"); }
void wait_for_click_release(int mode) { TEST_ASSERT_EQUAL_INT(1, mode); released_clicks++; }
void complete_use_reagent_on_player(void) { TEST_FAIL_MESSAGE("Unexpected reagent"); }

char *get_message_string(uint id)
{
    message_lookups++;
    last_message_id = id;
    return available_message;
}
int message_scroll_print_wrapped(char *text)
{
    if (g_cursor_holding_state == 0 && picked_target != NULL) {
        TEST_ASSERT_EQUAL_STRING("Use key on what?", text);
        prompt_prints++;
        return 1;
    }
    TEST_ASSERT_EQUAL_PTR(available_message, text);
    TEST_ASSERT_EQUAL_STRING(key_description, text);
    printed_messages++;
    return 1;
}
void print_scroll_message_by_id(uint id)
{ TEST_ASSERT_NOT_NULL(picked_target); scroll_message = id; }
void describe_object_owner(ushort *object, int mode)
{ last_action_object = object; last_action_mode = mode; other_actions++; }
void read_object_text(ushort *object, int mode)
{ last_action_object = object; last_action_mode = mode; other_actions++; }

/* Level one is the first uncompressed tile/object block in LEV.ARK. */
static byte level_one[0x7c08];
static ushort *level_object(unsigned slot)
{
    TEST_ASSERT_GREATER_THAN_UINT(0, slot);
    TEST_ASSERT_LESS_THAN_UINT(1024, slot);
    unsigned offset = slot < 256 ? 0x4000 + slot * 27 : 0x5b00 + (slot - 256) * 8;
    return (ushort *)(level_one + offset);
}
static void load_key_from_level_one_sack(void)
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
    ushort *tile = (ushort *)(level_one + (23 + 6 * 64) * 4);
    ushort *sack = NULL, *key = NULL;
    unsigned slot = tile[1] >> 6;
    for (int count = 0; slot != 0 && count < 1024; count++) {
        ushort *object = level_object(slot);
        if ((*object & 0x1ff) == 0x82) { sack = object; break; }
        slot = object[2] >> 6;
    }
    TEST_ASSERT_NOT_NULL_MESSAGE(sack, "Expected the sack at level 1 tile (23,6)");
    slot = sack[3] >> 6;
    for (int count = 0; slot != 0 && count < 1024; count++) {
        ushort *object = level_object(slot);
        if ((*object & 0x1f0) == 0x100) { key = object; break; }
        slot = object[2] >> 6;
    }
    TEST_ASSERT_NOT_NULL_MESSAGE(key, "Expected a key inside the sack");
    memcpy(objects[1], sack, 8);
    memcpy(objects[2], key, 8);
    objects[1][3] = 2 << 6; /* put the real contents into fixture slot 2 */
    objects[2][2] &= 0x3f;
    g_current_container_record = (char *)objects[1];
}

void setUp(void)
{
    memset(click_state, 0, sizeof(click_state));
    g_cursor_mode = g_cursor_holding_state = 0;
    g_selected_object = DAT_00202098 = NULL;
    DAT_002020b8 = NULL;
    picked_target = combined_target = NULL;
    prompt_prints = combination_calls = released_clicks = reset_cursor = 0;
    scroll_message = 0;
    target_reachable = 1; target_obstructed = 0;
    g_player_object = objects[4];
    strcpy((char *)DAT_000878ec_backing, "Use ");
    memset(objects, 0, sizeof(objects));
    memset(slots, 0, sizeof(slots));
    for (int i = 0; i < 20; i++) g_backpack_widget_to_slot_backing[i] = i;
    g_current_container_record = NULL;
    DAT_002046b4 = 0;
    message_lookups = printed_messages = other_actions = 0;
    last_message_id = 0;
    available_message = key_description;
    last_action_object = NULL;
    last_action_mode = 0;
    objects[1][0] = 0x15f; /* sack */
    objects[1][3] = 2 << 6; /* contents */
    objects[2][0] = 0x8000 | 0x80; /* quantity object, not a container */
    slots[4] = 1 << 6;
}
void tearDown(void) {}

static void test_picked_up_sack_has_inventory_widget(void)
{
    TEST_ASSERT_EQUAL_INT(4, find_or_assign_object_widget(objects[1]));
}
static void test_open_sack_finds_contents_through_inventory_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
}
static void test_lookup_returns_object_and_owning_link(void)
{
    TEST_ASSERT_EQUAL_PTR(objects[2], find_object_by_encoded_slot_in_chain(objects[1] + 3, 1, 2));
    TEST_ASSERT_EQUAL_PTR(objects[1] + 3, DAT_002046b4);
}
static void test_nested_container_finds_inner_object(void)
{
    objects[2][0] = 0x15f;
    objects[2][3] = 3 << 6;
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[3]));
    TEST_ASSERT_EQUAL_PTR(objects[2] + 3, DAT_002046b4);
}
static void test_lookup_follows_sibling_link(void)
{
    objects[2][2] = 3 << 6;
    TEST_ASSERT_EQUAL_PTR(objects[3], find_object_by_encoded_slot_in_chain(objects[1] + 3, 1, 3));
    TEST_ASSERT_EQUAL_PTR(objects[1] + 3, DAT_002046b4);
}
static void test_missing_object_has_no_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-1, find_or_assign_object_widget(objects[4]));
}
static void test_empty_container_returns_null(void)
{
    objects[1][3] = 0;
    TEST_ASSERT_NULL(find_object_by_encoded_slot_in_chain(objects[1] + 3, 1, 2));
}
static void test_quantity_field_is_not_traversed_as_contents(void)
{
    objects[2][3] = 4 << 6;
    TEST_ASSERT_EQUAL_INT(-1, find_or_assign_object_widget(objects[4]));
}
static void test_using_key_from_level_one_sack_at_23_6_prints_description(void)
{
    load_key_from_level_one_sack();
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
    TEST_ASSERT_EQUAL_HEX16(0x106, objects[2][0] & 0x1ff);
    TEST_ASSERT_EQUAL_UINT16(1, objects[2][3] & 0x3f);
    describe_special_object_property(objects[2], 1);
    TEST_ASSERT_EQUAL_INT(1, message_lookups);
    TEST_ASSERT_EQUAL_HEX16(0xa65, last_message_id);
    TEST_ASSERT_EQUAL_INT(1, printed_messages);
    TEST_ASSERT_EQUAL_INT(0, other_actions);
}
static void test_key_action_with_zero_mode_does_not_print(void)
{
    load_key_from_level_one_sack();
    describe_special_object_property(objects[2], 0);
    TEST_ASSERT_EQUAL_INT(0, message_lookups);
    TEST_ASSERT_EQUAL_INT(0, printed_messages);
}
static void test_key_action_with_missing_message_does_not_print(void)
{
    load_key_from_level_one_sack();
    available_message = NULL;
    describe_special_object_property(objects[2], 3);
    TEST_ASSERT_EQUAL_INT(1, message_lookups);
    TEST_ASSERT_EQUAL_HEX16(0xa65, last_message_id);
    TEST_ASSERT_EQUAL_INT(0, printed_messages);
}
static void test_action_dispatch_forwards_object_and_mode_to_related_helpers(void)
{
    objects[2][0] = 0xc2;
    describe_special_object_property(objects[2], 2);
    TEST_ASSERT_EQUAL_PTR(objects[2], last_action_object);
    TEST_ASSERT_EQUAL_INT16(2, last_action_mode);
    objects[2][0] = 0x130;
    describe_special_object_property(objects[2], 3);
    TEST_ASSERT_EQUAL_PTR(objects[2], last_action_object);
    TEST_ASSERT_EQUAL_INT16(3, last_action_mode);
    TEST_ASSERT_EQUAL_INT(2, other_actions);
}

static void test_key_from_sack_can_target_door_at_22_5(void)
{
    load_key_from_level_one_sack();
    ushort *tile = (ushort *)(level_one + (22 + 5 * 64) * 4);
    ushort *door = level_object(tile[1] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x141, *door & 0x1ff);
    picked_target = door;
    arm_use_item_on_player_prompt(objects[2], 1);
    TEST_ASSERT_EQUAL_INT(1, prompt_prints);
    TEST_ASSERT_EQUAL_PTR(complete_use_item_on_player, DAT_002020b8);
    TEST_ASSERT_EQUAL_PTR(objects[2], DAT_00202098);
    TEST_ASSERT_EQUAL_INT(2, g_cursor_holding_state);
    click_state[8] = 1; /* view click mode at short offset 8 */
    click_state[6] = 2; /* released interaction click at short offset 6 */
    handle_game_view_click();
    TEST_ASSERT_EQUAL_INT(1, combination_calls);
    TEST_ASSERT_EQUAL_PTR(door, combined_target);
    TEST_ASSERT_EQUAL_UINT(5, scroll_message);
    TEST_ASSERT_NULL(g_selected_object);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
    TEST_ASSERT_EQUAL_INT(1, reset_cursor);
    TEST_ASSERT_EQUAL_INT(1, released_clicks);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_picked_up_sack_has_inventory_widget);
    RUN_TEST(test_open_sack_finds_contents_through_inventory_widget);
    RUN_TEST(test_lookup_returns_object_and_owning_link);
    RUN_TEST(test_nested_container_finds_inner_object);
    RUN_TEST(test_lookup_follows_sibling_link);
    RUN_TEST(test_missing_object_has_no_widget);
    RUN_TEST(test_empty_container_returns_null);
    RUN_TEST(test_quantity_field_is_not_traversed_as_contents);
    RUN_TEST(test_using_key_from_level_one_sack_at_23_6_prints_description);
    RUN_TEST(test_key_action_with_zero_mode_does_not_print);
    RUN_TEST(test_key_action_with_missing_message_does_not_print);
    RUN_TEST(test_action_dispatch_forwards_object_and_mode_to_related_helpers);
    RUN_TEST(test_key_from_sack_can_target_door_at_22_5);
    return UNITY_END();
}
