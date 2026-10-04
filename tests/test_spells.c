#include "spells_fixture.h"
#define fx spells_fixture
void setUp(void) { spells_fixture_reset(); }
void tearDown(void) {}

static void test_in_lor_with_enough_mana_casts_light_on_the_actual_player(void)
{
    TEST_ASSERT_TRUE((uintptr_t)g_player_object > UINT32_MAX);
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(1, fx.click_releases);
    TEST_ASSERT_EQUAL_INT(1, fx.skill_checks);
    TEST_ASSERT_EQUAL_INT(1, fx.tile_checks);
    TEST_ASSERT_EQUAL_UINT8(17, fx.character[0x37]);
    TEST_ASSERT_EQUAL_UINT8(0x30, fx.character[0x3e]); /* light type 0, level 3 */
    TEST_ASSERT_EQUAL_UINT8(33, fx.character[0x3f]); /* 3d20 + 24 duration */
    TEST_ASSERT_EQUAL_HEX16(0x40, *(ushort *)(fx.character+0x5f) & 0x3c0);
    TEST_ASSERT_EQUAL_INT(1, fx.equipment_refreshes);
    TEST_ASSERT_EQUAL_INT(1, fx.dice_calls);
    TEST_ASSERT_EQUAL_INT(0x10, fx.sound);
    TEST_ASSERT_EQUAL_INT(0, fx.messages);
}
static void test_in_lor_without_enough_mana_fails_without_dispatching(void)
{
    spells_fixture_ready_in_lor(2);
    TEST_ASSERT_EQUAL_UINT32(0, cast_spell_from_rune_combo(0));
    TEST_ASSERT_EQUAL_INT(0xd3, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0x16, fx.sound);
    TEST_ASSERT_EQUAL_INT(0, fx.skill_checks);
    TEST_ASSERT_EQUAL_INT(0, fx.tile_checks);
    TEST_ASSERT_EQUAL_UINT8(2, fx.character[0x37]);
    TEST_ASSERT_EQUAL_INT(0, fx.equipment_refreshes);
}
static void test_failed_casting_check_does_not_create_a_light(void)
{
    fx.skill_result=0;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0xd4, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0, fx.tile_checks);
    TEST_ASSERT_EQUAL_UINT8(20, fx.character[0x37]);
    TEST_ASSERT_EQUAL_INT(0, fx.equipment_refreshes);
}
static void test_no_magic_tile_rejects_in_lor_without_creating_light(void)
{
    ((uw_tile_t *)(fx.map+(32+64*2)*4))->no_magic=1;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(1, fx.tile_checks);
    TEST_ASSERT_EQUAL_INT(0xd5, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0, fx.equipment_refreshes);
    TEST_ASSERT_EQUAL_UINT8(17, fx.character[0x37]); /* original cost precedes dispatch */
}
static void test_full_light_slots_reject_in_lor_without_writing_another_slot(void)
{
    *(ushort *)(fx.character+0x5f)=0xc0;
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(0xd5, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0, fx.equipment_refreshes);
    TEST_ASSERT_EQUAL_INT(0, fx.dice_calls);
    TEST_ASSERT_EQUAL_HEX16(0xc0, *(ushort *)(fx.character+0x5f) & 0x3c0);
}
static void test_critical_failure_keeps_the_actual_player_pointer(void)
{
    fx.skill_result=-1;
    byte hp=((byte *)g_player_object)[8];
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(1, fx.tile_checks);
    TEST_ASSERT_EQUAL_INT(0xd6, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0, fx.equipment_refreshes);
    TEST_ASSERT_EQUAL_UINT8(17, fx.character[0x37]);
    TEST_ASSERT_EQUAL_UINT8(hp, ((byte *)g_player_object)[8]);
}
static void test_ort_jux_right_click_launches_magic_arrow_and_spends_mana(void)
{
    TEST_ASSERT_TRUE((uintptr_t)g_player_object > UINT32_MAX);
    spells_fixture_ready_ort_jux(20);
    handle_cast_spell_click(0);
    TEST_ASSERT_EQUAL_INT(3, g_cursor_holding_state);
    TEST_ASSERT_EQUAL_PTR(g_player_object, DAT_00202098);
    TEST_ASSERT_EQUAL_INT(1, fx.cursor_pushes);
    TEST_ASSERT_EQUAL_UINT8(20, fx.character[0x37]); /* cost deferred until launch */
    TEST_ASSERT_EQUAL_INT(0, fx.allocations);
    spells_fixture_fire();
    TEST_ASSERT_EQUAL_PTR(g_player_object, DAT_00202a44);
    TEST_ASSERT_EQUAL_HEX16(0x17, fx.projectile[0] & 0x1ff);
    TEST_ASSERT_EQUAL_INT(32, fx.projectile[11] >> 10);
    TEST_ASSERT_EQUAL_INT(2, (fx.projectile[11] & 0x3f0) >> 4);
    TEST_ASSERT_EQUAL_INT(1, fx.allocations);
    TEST_ASSERT_EQUAL_INT(1, fx.links);
    TEST_ASSERT_EQUAL_INT(1, fx.projectile_sounds);
    TEST_ASSERT_EQUAL_UINT8(1, ((byte *)fx.projectile)[0x12]); /* player owner */
    TEST_ASSERT_EQUAL_UINT8(DAT_002027d0_backing[1+7*3] & 0x7f,
                           ((byte *)fx.projectile)[0x13] & 0x7f);
    TEST_ASSERT_NOT_EQUAL(0, ((byte *)fx.projectile)[0x13] & 0x7f);
    TEST_ASSERT_EQUAL_INT(-1, DAT_00202a40); /* center cursor aim */
    TEST_ASSERT_EQUAL_INT(0, DAT_00202a3c);
    TEST_ASSERT_EQUAL_UINT8(17, fx.character[0x37]);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
    TEST_ASSERT_EQUAL_INT(1, fx.cursor_pops);
    TEST_ASSERT_EQUAL_INT(2, fx.click_releases);
    TEST_ASSERT_EQUAL_INT(0, fx.messages);
}
static void test_magic_arrow_allocation_failure_keeps_mana_and_clears_cast_cursor(void)
{
    spells_fixture_ready_ort_jux(20);
    handle_cast_spell_click(0);
    fx.allocation_fails=1;
    spells_fixture_fire();
    TEST_ASSERT_EQUAL_INT(1, fx.allocations);
    TEST_ASSERT_EQUAL_INT(0, fx.links);
    TEST_ASSERT_EQUAL_UINT8(20, fx.character[0x37]);
    TEST_ASSERT_EQUAL_INT(0xff, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
    TEST_ASSERT_EQUAL_INT(1, fx.cursor_pops);
    TEST_ASSERT_EQUAL_INT(0, DAT_0023c3e0);
}
static void test_magic_arrow_blocked_launch_frees_projectile_without_spending_mana(void)
{
    spells_fixture_ready_ort_jux(20);
    handle_cast_spell_click(0);
    fx.placement_allowed=0;
    spells_fixture_fire();
    TEST_ASSERT_EQUAL_INT(1, fx.frees);
    TEST_ASSERT_EQUAL_INT(0, fx.links);
    TEST_ASSERT_EQUAL_INT(0, fx.projectile_sounds);
    TEST_ASSERT_EQUAL_UINT8(20, fx.character[0x37]);
    TEST_ASSERT_EQUAL_INT(0xff, fx.message_id);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_in_lor_with_enough_mana_casts_light_on_the_actual_player);
    RUN_TEST(test_in_lor_without_enough_mana_fails_without_dispatching);
    RUN_TEST(test_failed_casting_check_does_not_create_a_light);
    RUN_TEST(test_no_magic_tile_rejects_in_lor_without_creating_light);
    RUN_TEST(test_full_light_slots_reject_in_lor_without_writing_another_slot);
    RUN_TEST(test_critical_failure_keeps_the_actual_player_pointer);
    RUN_TEST(test_ort_jux_right_click_launches_magic_arrow_and_spends_mana);
    RUN_TEST(test_magic_arrow_allocation_failure_keeps_mana_and_clears_cast_cursor);
    RUN_TEST(test_magic_arrow_blocked_launch_frees_projectile_without_spending_mana);
    return UNITY_END();
}
