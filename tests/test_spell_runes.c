#include "spell_runes_fixture.h"

void setUp(void) { spell_runes_fixture_reset(); }
void tearDown(void) { spell_runes_fixture_dispose(); }

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
