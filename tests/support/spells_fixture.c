#include "spells_fixture.h"

SpellsFixture spells_fixture;
short *DAT_00085a6c;
undefined2 g_cursor_holding_state;
byte DAT_002028d4;
int DAT_002028d0;
undefined4 DAT_002028d8;
char DAT_0023c3e0;
char *DAT_002046c4, *DAT_00202098;
uint DAT_00202094;
undefined1 DAT_0023c3dc, DAT_0023c3d8;

undefined1 DAT_00202c90_backing[8192], DAT_002027d0_backing[48];
short DAT_00202a38, DAT_00202a3c, DAT_00202a40, DAT_0023beb4;
ushort *DAT_00202a44;
ushort DAT_00202a48, DAT_00202a4c;
undefined2 DAT_00202a50, DAT_00202a54, g_cursor_mode;
char DAT_00101928;
ushort *g_interact_target;
char *g_selected_object, *DAT_002020b0;
short DAT_000858c4, DAT_002020ac;
code *DAT_002020b8;
void (*const PTR_FUN_000858c8_table[5])(void) = {0};

void push_cursor_icon(int icon)
{ TEST_ASSERT_EQUAL_HEX16(0x1075, icon); spells_fixture.cursor_pushes++; }
void pop_cursor_icon(int mode)
{ TEST_ASSERT_EQUAL_INT(3, mode); spells_fixture.cursor_pops++; }
void get_mouse_position(short *x, short *y)
{ *x=spells_fixture.mouse_x; *y=spells_fixture.mouse_y; }
void *alloc_object_slot(int region)
{
    TEST_ASSERT_EQUAL_INT(1, region);
    spells_fixture.allocations++;
    return spells_fixture.allocation_fails ? NULL : spells_fixture.projectile;
}
undefined4 check_object_drop_height(ushort *object, ushort *actor)
{
    TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object);
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor);
    return spells_fixture.placement_allowed;
}
void free_object_slot(ushort *object)
{ TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object); spells_fixture.frees++; }
int encode_object_slot_index(ushort *object)
{ TEST_ASSERT_EQUAL_PTR(g_player_object, object); return 1; }
void object_list_insert_head(void *head, ushort *object)
{
    TEST_ASSERT_EQUAL_PTR(spells_fixture.map+(32+64*2)*4+2, head);
    TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object);
    spells_fixture.links++;
}
undefined4 play_sound_effect_at_object(int sound, ushort *object, int mode)
{
    TEST_ASSERT_EQUAL_INT(10, sound);
    TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object);
    TEST_ASSERT_EQUAL_INT(0, mode);
    spells_fixture.projectile_sounds++;
    return 0;
}

void configure_texture_detail_functions(void) {}
undefined4 recalculate_player_stats(int level) { (void)level; return 0; }
void refresh_player_equipment_effects(void) { spells_fixture.equipment_refreshes++; }
int roll_dice_sum(count, sides)
int count;
short sides;
{
    spells_fixture.dice_calls++;
    if (spells_fixture.skill_result == -1) {
        TEST_ASSERT_EQUAL_INT(0, count); /* circle-one critical-failure penalty */
        TEST_ASSERT_EQUAL_INT(8, sides);
        return 0;
    }
    TEST_ASSERT_EQUAL_INT(3, count);
    TEST_ASSERT_EQUAL_INT(20, sides);
    return 9;
}
void weapon_overlay_flash_once(int frame) { TEST_ASSERT_EQUAL_HEX16(0xa8, frame); }
undefined4 roll_skill_check(int skill, int difficulty)
{
    TEST_ASSERT_EQUAL_INT((byte)spells_fixture.character[0x2a] + 5, skill);
    TEST_ASSERT_EQUAL_INT(2, difficulty);
    spells_fixture.skill_checks++;
    return spells_fixture.skill_result;
}
void wait_for_click_release(int mode)
{ TEST_ASSERT_EQUAL_INT(1, mode); spells_fixture.click_releases++; }
undefined4 play_sound_effect_with_pan(int sound, int pan, int mode)
{
    TEST_ASSERT_EQUAL_INT(0x40, pan);
    TEST_ASSERT_EQUAL_INT(0, mode);
    spells_fixture.sound = sound;
    return 0;
}
void print_scroll_message_by_id(int id)
{ spells_fixture.messages++; spells_fixture.message_id = id; }
void print_not_a_spell_message(void) { TEST_FAIL_MESSAGE("Runes must match the real spell table"); }
void *tilemap_lookup(short x, short y)
{
    TEST_ASSERT_EQUAL_INT(32, x);
    TEST_ASSERT_EQUAL_INT(2, y);
    spells_fixture.tile_checks++;
    return spells_fixture.map + (x + 64*y)*4;
}
/* Fail on unrelated dispatcher branches, rather than substituting its real
   light effect with a success stub and hiding the pointer truncation. */
#define UNUSED_EFFECT(name) void name(void) { TEST_FAIL_MESSAGE("Unexpected " #name); }
UNUSED_EFFECT(trigger_player_jump_if_grounded)
UNUSED_EFFECT(apply_healing_item_effect)
UNUSED_EFFECT(cast_cone_damage_spell)
UNUSED_EFFECT(cast_targeted_search_effect)
UNUSED_EFFECT(cast_summon_or_spawn_effect)
UNUSED_EFFECT(adjust_level7_hazard_value)
UNUSED_EFFECT(dispatch_player_command)
UNUSED_EFFECT(handle_level4_maze_puzzle_button)
UNUSED_EFFECT(display_book_or_scroll_page)
void scheduler_tick(int elapsed) { (void)elapsed; TEST_FAIL_MESSAGE("Unexpected scheduler_tick"); }
UNUSED_EFFECT(handle_game_view_click_hold)
UNUSED_EFFECT(interact_use)
UNUSED_EFFECT(describe_picked_terrain)
UNUSED_EFFECT(handle_object_drop_target)
#undef UNUSED_EFFECT
ushort *pick_object_under_cursor(int mode)
{ (void)mode; TEST_FAIL_MESSAGE("Magic Arrow must not require picking a target"); return NULL; }
undefined4 target_in_range(void)
{ TEST_FAIL_MESSAGE("Unexpected target_in_range"); return 0; }
undefined4 target_line_of_sight(void)
{ TEST_FAIL_MESSAGE("Unexpected target_line_of_sight"); return 0; }

void spells_fixture_ready_ort_jux(int mana)
{
    spells_fixture.character[0x47]=14; /* Ort */
    spells_fixture.character[0x48]=9;  /* Jux */
    spells_fixture.character[0x49]=24;
    spells_fixture.character[0x37]=mana;
}
void spells_fixture_fire(void)
{
    spells_fixture.input[8]=1;
    spells_fixture.input[6]=2; /* right-click release in the 3D view */
    handle_game_view_click();
}

void spells_fixture_ready_in_lor(int mana)
{
    spells_fixture.character[0x47]=8;  /* In */
    spells_fixture.character[0x48]=11; /* Lor */
    spells_fixture.character[0x49]=24; /* empty third rune */
    spells_fixture.character[0x37]=mana;
}
void spells_fixture_reset(void)
{
    memset(&spells_fixture, 0, sizeof spells_fixture);
    uw_test_create_character(spells_fixture.character, spells_fixture.attributes,
                             spells_fixture.player);
    uw_test_load_map(spells_fixture.map, sizeof spells_fixture.map, 1);
    /* The player is a mobile object below the static-object table, matching
       the dispatcher's original object-position/no-magic branch. */
    spells_fixture.player[11]=(32 << 10) | (2 << 4);
    DAT_002046c4=(char *)spells_fixture.map+0x5b00;
    TEST_ASSERT_TRUE((uintptr_t)g_player_object < (uintptr_t)DAT_002046c4);
    DAT_00085a6c=spells_fixture.input;
    DAT_002028d4=DAT_002028d8=DAT_002028d0=0;
    DAT_0023c3e0=0;
    g_cursor_holding_state=0;
    uint regeneration_budget=1000;
    memcpy(spells_fixture.character+0xce, &regeneration_budget, sizeof regeneration_budget);
    spells_fixture_ready_in_lor(20);
    uw_test_load_object_properties(DAT_00202c90_backing, sizeof DAT_00202c90_backing);
    uw_test_read_data("DATA/OBJECTS.DAT", DAT_002027d0_backing, 0x30, 2+0x80, SEEK_SET);
    DAT_00202a38=DAT_00202a3c=DAT_00202a40=DAT_0023beb4=0;
    DAT_00202a44=NULL;
    DAT_00202a48=DAT_00202a4c=DAT_00202a50=DAT_00202a54=0;
    spells_fixture.mouse_x=138;
    spells_fixture.mouse_y=77;
    spells_fixture.placement_allowed=1;
    spells_fixture.skill_result=1;
    spells_fixture.equipment_refreshes=0;
    spells_fixture.sound=-1;
}
