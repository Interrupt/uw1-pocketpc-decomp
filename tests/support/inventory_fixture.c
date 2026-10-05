#include "game_fixture.h"
#include "inventory_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
void *resolve_object_link(ushort *link);
int encode_object_slot_index(ushort *object);
undefined4 build_object_display_name(char *text, ushort *object, int a, int b);
void push_cursor_icon(int type);
void pop_cursor_icon(int mode);
ushort *pick_object_under_cursor(int mode);
undefined4 target_in_range(int actor, ushort *target, char *range);
undefined4 target_line_of_sight(int actor, ushort *target);
undefined4 check_object_combination(char *actor, ushort *target, int key_id);
void handle_game_view_click_hold(void);
void interact_use(void);
void describe_picked_terrain(int mode, int tile);
void handle_object_drop_target(int slot);
void complete_cast_spell_on_target(void);
void wait_for_click_release(int mode);
void complete_use_reagent_on_player(void);
char *get_message_string(uint id);
int message_scroll_print_wrapped(char *text);
void print_scroll_message_by_id(uint id);
void describe_object_owner(ushort *object, int mode);
void read_object_text(ushort *object, int mode);

ushort objects[5][4];

ushort slots[29];

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

int message_lookups, printed_messages, other_actions;

uint last_message_id;

char key_description[] = "Key information";

char *available_message;

ushort *last_action_object;

short last_action_mode;

short click_state[16];

short *DAT_00085a6c = click_state;

undefined2 g_cursor_mode, g_cursor_holding_state;

ushort *g_player_object, *g_interact_target;

char *g_selected_object, *DAT_00202098, *DAT_002020b0;

short DAT_000858c4, DAT_002020ac;

code *DAT_002020b8;

undefined1 DAT_000878ec_backing[64];

char s_UNNAMED_00084f24[] = "UNNAMED";

char s_on_what__000878e0[] = " on what?";

void (*const PTR_FUN_000858c8_table[5])(void) = {0};

ushort *picked_target, *combined_target;

int prompt_prints, combination_calls, released_clicks, reset_cursor;

uint scroll_message;

int target_reachable = 1, target_obstructed;

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

byte level_one[0x7c08];

ushort *level_object(unsigned slot)
{
    return uw_test_level_object(level_one, sizeof level_one, slot);
}

void load_key_from_level_one_sack(void)
{
    uw_test_load_map(level_one, sizeof level_one, 1);
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

void inventory_fixture_reset(void)
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

void inventory_fixture_dispose(void) {}
