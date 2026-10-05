#include "weapon_ready_fixture.h"

void setUp(void) { weapon_ready_fixture_reset(); }
void tearDown(void) {}

static void assert_combat_weapon_is_visible(void)
{
    TEST_ASSERT_EQUAL_INT(2, g_cursor_mode);
    TEST_ASSERT_BITS_HIGH(2, (byte)DAT_00086df8[0x5f]);
    TEST_ASSERT_EQUAL_UINT8(4, DAT_0023c120);
    weapon_ready_fixture_animate();
    TEST_ASSERT_EQUAL_UINT8(4, DAT_0023c130);
    TEST_ASSERT_EQUAL_INT(1, weapon_draws);
}

static void test_combat_button_readies_and_draws_weapon(void)
{
    cursor_mode_button_click(1); /* zero-based Combat button */
    assert_combat_weapon_is_visible();
}

static void test_clicking_combat_again_lowers_and_hides_weapon(void)
{
    cursor_mode_button_click(1);
    assert_combat_weapon_is_visible();
    cursor_mode_button_click(1);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_mode);
    TEST_ASSERT_BITS_LOW(2, (byte)DAT_00086df8[0x5f]);
    weapon_draws = 0;
    weapon_ready_fixture_animate();
    TEST_ASSERT_EQUAL_UINT8(6, DAT_0023c130);
    TEST_ASSERT_EQUAL_INT(0, weapon_draws);
}

static void test_primary_hand_toggle_matches_combat_button(void)
{
    toggle_weapon_ready();
    assert_combat_weapon_is_visible();
    toggle_weapon_ready();
    TEST_ASSERT_BITS_LOW(2, (byte)DAT_00086df8[0x5f]);
    weapon_draws = 0;
    weapon_ready_fixture_animate();
    TEST_ASSERT_EQUAL_INT(0, weapon_draws);
}

static void test_disallowed_combat_does_not_ready_or_draw_weapon(void)
{
    DAT_00086df8[0xb8] |= 1;
    cursor_mode_button_click(1);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_mode);
    TEST_ASSERT_BITS_LOW(2, (byte)DAT_00086df8[0x5f]);
    weapon_ready_fixture_animate();
    TEST_ASSERT_EQUAL_INT(0, weapon_draws);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_combat_button_readies_and_draws_weapon);
    RUN_TEST(test_clicking_combat_again_lowers_and_hides_weapon);
    RUN_TEST(test_primary_hand_toggle_matches_combat_button);
    RUN_TEST(test_disallowed_combat_does_not_ready_or_draw_weapon);
    return UNITY_END();
}
