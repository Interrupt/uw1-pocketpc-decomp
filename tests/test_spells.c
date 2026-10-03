#include "unity.h"
#include "uw.h"
#include <string.h>

/* Real rune recognition and cast checks; UI, RNG and effects are fixtures. */
char *DAT_00086df8;
ushort *g_player_object;
short *DAT_00085a6c;
undefined2 g_cursor_holding_state;
int DAT_002028d0;
byte DAT_002028d4;
undefined4 DAT_002028d8;
char DAT_0023c3e0;
char s_Not_a_spell_00085a80[] = "Not a spell";
static byte player[256];
static ushort object[16];
static short click[8];
static int invalid_spells, effects, effect_type, effect_param, sound, failure;
static int skill_result;
void wait_for_click_release(int buttons) { TEST_ASSERT_EQUAL_INT(1, buttons); }
int message_scroll_print_wrapped(const char *message)
{
    TEST_ASSERT_EQUAL_STRING("Not a spell", message);
    invalid_spells++;
    return 1;
}
undefined4 play_sound_effect_with_pan(int id, int pan, int mode) { sound = id; return 1; }
void print_scroll_message_by_id(int id) { failure = id; }
long Ordinal_2005(int divisor, int dividend) { return dividend / divisor; }
undefined4 roll_skill_check(int skill, int difficulty) { return skill_result; }
undefined4 dispatch_special_action(int type, int param, ushort *caster, ushort *target)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, caster);
    TEST_ASSERT_EQUAL_PTR(g_player_object, target);
    effects++;
    effect_type = type;
    effect_param = param;
    return 1;
}
void setUp(void)
{
    memset(player, 0, sizeof player);
    memset(click, 0, sizeof click);
    DAT_00086df8 = (char *)player;
    g_player_object = object;
    DAT_00085a6c = click;
    player[0x3d] = 15; /* enough level and mana for every circle */
    player[0x37] = 100;
    player[0x47] = player[0x48] = player[0x49] = 24;
    player[0xce] = 100;
    DAT_002028d0 = DAT_002028d4 = DAT_002028d8 = DAT_0023c3e0 = 0;
    g_cursor_holding_state = 0;
    invalid_spells = effects = effect_type = effect_param = sound = failure = 0;
    skill_result = 1;
}
void tearDown(void) {}
static void ready_runes(int first, int second, int third)
{
    player[0x47] = first; player[0x48] = second; player[0x49] = third;
}
static void test_in_lor_is_recognized_and_casts_light(void)
{
    ready_runes(8, 11, 24);
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0, invalid_spells);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_type);
    TEST_ASSERT_EQUAL_INT(0x83, effect_param);
    TEST_ASSERT_EQUAL_INT(97, player[0x37]);
    TEST_ASSERT_EQUAL_INT(0x10, sound);
}
static void test_nonzero_spell_index_uses_its_circle_and_effect(void)
{
    ready_runes(8, 18, 24); /* In Ort: entry 17, circle 3 */
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0, invalid_spells);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(2, effect_type);
    TEST_ASSERT_EQUAL_INT(0x43, effect_param);
    TEST_ASSERT_EQUAL_INT(91, player[0x37]);
}
static void test_three_rune_spell_at_end_of_table_is_recognized(void)
{
    ready_runes(21, 10, 2); /* entry 47, circle 8 */
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0, invalid_spells);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(11, effect_type);
    TEST_ASSERT_EQUAL_INT(12, effect_param);
    TEST_ASSERT_EQUAL_INT(76, player[0x37]);
}
static void test_empty_rune_slots_are_not_a_spell(void)
{
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(1, invalid_spells);
    TEST_ASSERT_EQUAL_INT(0, effects);
    TEST_ASSERT_EQUAL_INT(100, player[0x37]);
}
static void test_unknown_nonempty_runes_are_not_a_spell(void)
{
    ready_runes(0, 0, 0);
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(1, invalid_spells);
    TEST_ASSERT_EQUAL_INT(0, effects);
}
static void test_recognized_spell_checks_level_and_mana(void)
{
    ready_runes(8, 18, 24);
    player[0x3d] = 1;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0xd2, failure);
    TEST_ASSERT_EQUAL_INT(0, invalid_spells);
    TEST_ASSERT_EQUAL_INT(0, effects);
    player[0x3d] = 15;
    player[0x37] = 8;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0xd3, failure);
    TEST_ASSERT_EQUAL_INT(0, effects);
}
static void test_failed_skill_check_does_not_cast_a_recognized_spell(void)
{
    ready_runes(8, 11, 24);
    skill_result = 0;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0xd4, failure);
    TEST_ASSERT_EQUAL_INT(0, invalid_spells);
    TEST_ASSERT_EQUAL_INT(0, effects);
}
static void test_look_modifier_uses_click_record_byte_six(void)
{
    ready_runes(8, 11, 24);
    click[3] = 2;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0, effects);
    handle_cast_spell_click(1); /* keyboard casting overrides look modifier */
    TEST_ASSERT_EQUAL_INT(1, effects);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_in_lor_is_recognized_and_casts_light);
    RUN_TEST(test_nonzero_spell_index_uses_its_circle_and_effect);
    RUN_TEST(test_three_rune_spell_at_end_of_table_is_recognized);
    RUN_TEST(test_empty_rune_slots_are_not_a_spell);
    RUN_TEST(test_unknown_nonempty_runes_are_not_a_spell);
    RUN_TEST(test_recognized_spell_checks_level_and_mana);
    RUN_TEST(test_failed_skill_check_does_not_cast_a_recognized_spell);
    RUN_TEST(test_look_modifier_uses_click_record_byte_six);
    return UNITY_END();
}
