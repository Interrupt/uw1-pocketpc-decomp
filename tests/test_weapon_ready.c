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

static void test_floor_pickup_after_initial_sprite_load_keeps_weapon_idle(void)
{
    ushort item[4] = {0x80, 0, 0, 0};
    weapon_ready_fixture_start_unloaded();
    request_weapon_swing_graphic(3);
    g_cursor_holding_state = 1;
    attach_picked_up_object_to_cursor(item);
    TEST_ASSERT_EQUAL_PTR(item, g_selected_object);
    TEST_ASSERT_EQUAL_INT(1, weapon_sprite_loads);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_mode);
    TEST_ASSERT_BITS_LOW(2, (byte)DAT_00086df8[0x5f]);
    TEST_ASSERT_EQUAL_UINT8(6, DAT_0023c120);
    TEST_ASSERT_EQUAL_UINT8(6, DAT_0023c130);
    TEST_ASSERT_EQUAL_INT(0, weapon_draws);
}

static void test_initial_weapon_animation_matches_arm_idle_defaults(void)
{
    weapon_ready_fixture_start_unloaded();
    TEST_ASSERT_EQUAL_INT(-1, DAT_000870d8);
    TEST_ASSERT_EQUAL_INT(-1, DAT_000870dc);
    TEST_ASSERT_EQUAL_INT(-1, DAT_000870e4);
    TEST_ASSERT_EQUAL_UINT8(6, DAT_000870e0);
}

static void test_loading_another_weapon_category_outside_combat_stays_hidden(void)
{
    for (int category = 0; category < 4; category++) {
        request_weapon_swing_graphic(category);
        weapon_ready_fixture_animate();
        TEST_ASSERT_EQUAL_UINT8(6, DAT_0023c120);
        TEST_ASSERT_EQUAL_UINT8(6, DAT_0023c130);
        TEST_ASSERT_BITS_LOW(2, (byte)DAT_00086df8[0x5f]);
        TEST_ASSERT_EQUAL_INT(0, weapon_draws);
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_initial_weapon_animation_matches_arm_idle_defaults);
    RUN_TEST(test_loading_another_weapon_category_outside_combat_stays_hidden);
    RUN_TEST(test_floor_pickup_after_initial_sprite_load_keeps_weapon_idle);
    RUN_TEST(test_combat_button_readies_and_draws_weapon);
    RUN_TEST(test_clicking_combat_again_lowers_and_hides_weapon);
    RUN_TEST(test_primary_hand_toggle_matches_combat_button);
    RUN_TEST(test_disallowed_combat_does_not_ready_or_draw_weapon);
    return UNITY_END();
}
