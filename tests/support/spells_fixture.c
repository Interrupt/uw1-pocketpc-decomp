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

void configure_texture_detail_functions(void) {}
undefined4 recompute_level7_hazard_from_character_level(int level) { (void)level; return 0; }
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
void print_not_a_spell_message(void) { TEST_FAIL_MESSAGE("In Lor must match the real spell table"); }
void *tilemap_lookup(int x, int y)
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
UNUSED_EFFECT(apply_targeted_spell_effect)
UNUSED_EFFECT(cast_cone_damage_spell)
UNUSED_EFFECT(cast_targeted_search_effect)
UNUSED_EFFECT(cast_summon_or_spawn_effect)
UNUSED_EFFECT(adjust_level7_hazard_value)
UNUSED_EFFECT(dispatch_player_command)
UNUSED_EFFECT(handle_level4_maze_puzzle_button)
UNUSED_EFFECT(display_book_or_scroll_page)
UNUSED_EFFECT(scheduler_tick)
UNUSED_EFFECT(push_cursor_icon)
#undef UNUSED_EFFECT

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
    spells_fixture.skill_result=1;
    spells_fixture.equipment_refreshes=0;
    spells_fixture.sound=-1;
}
