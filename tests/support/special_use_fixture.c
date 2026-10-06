#include "special_use_fixture.h"
#include "src/headers/ai.h"
#include "src/headers/objects.h"

SpecialUseFixture special_use_fixture;
char *DAT_002046b8, *DAT_002046c4, *DAT_002029cc, *DAT_00202098;
short *DAT_00085a6c;
undefined2 DAT_002020a0, DAT_002020a4, g_cursor_holding_state;
uint DAT_00202094, DAT_0024cfcc;
undefined1 DAT_0023c3dc, DAT_0023c3d8;
undefined1 DAT_00202c38_backing[1536], DAT_001007d0_backing[3072];
undefined1 DAT_00087530_backing[212];
char *g_selected_object;
int DAT_00101954;

void configure_texture_detail_functions(void) {}
void refresh_player_equipment_effects(void) {}

int roll_dice_sum(int count, int sides)
{
    TEST_ASSERT_EQUAL_INT(8, sides);
    special_use_fixture.dice++;
    return count; /* Deterministic legal minimum for the healing roll. */
}
void refresh_experience_display(void) { special_use_fixture.health_refreshes++; }
void print_scroll_message_by_id(int id)
{ special_use_fixture.messages++; special_use_fixture.message = id; }
byte tile_is_no_magic(int x, int y)
{
    TEST_ASSERT_EQUAL_INT(DAT_002020a0, x);
    TEST_ASSERT_EQUAL_INT(DAT_002020a4, y);
    return 0;
}
undefined4 rand_below(int max) { return max - 1; }
long ce_rand(void) { return 0; }
void project_position_by_heading(int heading, int distance, short *x, short *y)
{
    /* Rest scans at the actor's position: projection distance is zero. */
    TEST_ASSERT_EQUAL_INT(0, distance);
    (void)heading; (void)x; (void)y;
}
void handle_rest_action(int mode)
{
    /* The rest UI/time advancement is outside these functional tests. Run
       its actual safety check, including the real map scan and callback. */
    TEST_ASSERT_EQUAL_INT(1, mode);
    special_use_fixture.rest_checks++;
    special_use_fixture.rest_unsafe = check_rest_area_unsafe();
}

#define UNUSED_VOID(name) void name(void) { TEST_FAIL_MESSAGE("Unexpected " #name); }
#define UNUSED_RESULT(name) undefined4 name(void) { TEST_FAIL_MESSAGE("Unexpected " #name); return 0; }
UNUSED_VOID(trigger_player_jump_if_grounded)
UNUSED_RESULT(add_active_light_source)
UNUSED_VOID(push_cursor_icon)
UNUSED_VOID(apply_targeted_spell_effect)
UNUSED_VOID(cast_cone_damage_spell)
UNUSED_VOID(cast_targeted_search_effect)
UNUSED_VOID(cast_summon_or_spawn_effect)
UNUSED_VOID(reduce_item_quality_on_use)
UNUSED_VOID(adjust_level7_hazard_value)
UNUSED_VOID(dispatch_player_command)
UNUSED_VOID(handle_level4_maze_puzzle_button)
UNUSED_VOID(display_book_or_scroll_page)
UNUSED_VOID(scheduler_tick)
UNUSED_VOID(redraw_backpack_slot_widget)
UNUSED_VOID(refresh_container_view)
bool finish_object_use(void) { TEST_FAIL_MESSAGE("Unexpected finish_object_use"); return false; }
UNUSED_RESULT(spawn_scheduled_door_texture_object)
UNUSED_VOID(play_musical_instrument)
UNUSED_VOID(arm_use_item_on_special_target_prompt)
UNUSED_RESULT(try_climb_wall)
short *begin_holding_object_on_cursor(void) { TEST_FAIL_MESSAGE("Unexpected cursor pickup"); return NULL; }
UNUSED_VOID(wait_for_click_release)
void prompt_use_item_on_target(ushort *object, code *callback) { TEST_FAIL_MESSAGE("Unexpected target prompt"); }
UNUSED_VOID(complete_use_item_scatter_spawn)
UNUSED_VOID(complete_use_item_fill_flask)
UNUSED_VOID(complete_use_item_repair_object)
#undef UNUSED_VOID
#undef UNUSED_RESULT
ushort *find_equipped_item_by_category(void)
{ TEST_FAIL_MESSAGE("Unexpected equipment search"); return NULL; }

ushort *special_use_object(unsigned slot)
{ return uw_test_level_object(special_use_fixture.map, sizeof special_use_fixture.map, slot); }
void special_use_empty_area(int x, int y)
{
    memset(special_use_fixture.map, 0, 0x4000);
    g_player_object[11] = (x << 10) | (y << 4);
    DAT_002020a0 = x; DAT_002020a4 = y;
    DAT_0023c3dc = x; DAT_0023c3d8 = y;
    *(ushort *)(special_use_fixture.map + (x + 64*y)*4 + 2) = 1 << 6;
    g_player_object[2] = 0;
}
ushort *special_use_npc(unsigned slot, int x, int y, int state, int alerted)
{
    ushort *npc = special_use_object(slot);
    memset(npc, 0, 27);
    npc[0] = 0x40;
    ((byte *)npc)[11] = state;
    ((byte *)npc)[25] = alerted;
    npc[11] = (x << 10) | (y << 4);
    ushort *head = (ushort *)(special_use_fixture.map + (x + 64*y)*4 + 2);
    npc[2] = *head;
    *head = slot << 6;
    return npc;
}
void special_use_fixture_reset(void)
{
    memset(&special_use_fixture, 0, sizeof special_use_fixture);
    uw_test_load_map(special_use_fixture.map, sizeof special_use_fixture.map, 1);
    DAT_002029cc = (char *)special_use_fixture.map;
    DAT_002046b8 = (char *)special_use_fixture.map + 0x4000;
    DAT_002046c4 = (char *)special_use_fixture.map + 0x5b00;
    uw_test_create_character(special_use_fixture.character, special_use_fixture.attributes,
                             special_use_object(1));
    DAT_00201b68 = 1;
    DAT_00085a6c = special_use_fixture.input;
    special_use_fixture.input[4] = 1;
    DAT_0024cfcc = 1;
    g_selected_object = NULL;
    ((byte *)g_player_object)[8] = 10;
    special_use_fixture.messages = special_use_fixture.dice = 0;
    special_use_fixture.rest_checks = special_use_fixture.health_refreshes = 0;
    special_use_empty_area(20, 20);
}
void special_use_fixture_dispose(void) {}
