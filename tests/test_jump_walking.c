#include "jump_walking_fixture.h"

/* Jumping while a movement key is held. The port polls the movement keys every frame and keeps
   the held key's code in the same latch (DAT_0023c448) a typed key lands in. Typing 'j' while
   forward (0x8d) was held OR-ed to 0xef, which no key binding matches, so the jump was lost. */
void setUp(void) { jump_walking_fixture_reset(); }
void tearDown(void) {}

#define KEY_FORWARD 0x8d

static void hold_forward(void) { latch_held_movement_code(KEY_FORWARD, KEY_FORWARD); }
static void type_char(unsigned c) { handle_keyboard_message(0, 0x102 /* WM_CHAR */, c); }

static void test_typed_jump_replaces_the_held_forward_code(void)
{
    hold_forward();
    type_char('j');
    TEST_ASSERT_EQUAL_HEX16('j', DAT_0023c448);
}
static void test_a_waiting_jump_survives_the_next_movement_poll(void)
{
    hold_forward();
    type_char('j');
    hold_forward();   /* the next frame's poll */
    TEST_ASSERT_EQUAL_HEX16('j', DAT_0023c448);
}
static void test_forward_is_latched_again_once_the_jump_is_consumed(void)
{
    hold_forward();
    type_char('j');
    DAT_0023c448 = 0;
    hold_forward();
    TEST_ASSERT_EQUAL_HEX16(KEY_FORWARD, DAT_0023c448);
}
static void test_jump_with_forward_held_is_a_running_jump(void)
{
    hold_forward();
    type_char('j');
    move_command_dispatch(7);
    TEST_ASSERT_EQUAL_INT(7, g_movement_mode);               /* the jump command is pending */
    TEST_ASSERT_EQUAL_HEX16(KEY_FORWARD, decode_latch_seen); /* decoded with forward held */
    TEST_ASSERT_EQUAL_INT(100, DAT_0023bf48);                /* so the forward rate is kept */
    TEST_ASSERT_EQUAL_HEX16(0, DAT_0023c448);                /* and the jump key is consumed */
}
static void test_jump_without_movement_is_a_standing_jump(void)
{
    type_char('j');
    move_command_dispatch(7);
    TEST_ASSERT_EQUAL_INT(7, g_movement_mode);
    TEST_ASSERT_EQUAL_INT(0, DAT_0023bf48);
}
static void test_releasing_the_jump_key_does_not_stall_the_walk(void)
{
    hold_forward();
    DAT_0024af6c = 0;            /* what any key-up does to the held-key accelerator */
    hold_forward();
    TEST_ASSERT_TRUE(DAT_0024af6c > 0);
}
static void test_typed_character_without_movement_is_unchanged(void)
{
    type_char('a');
    TEST_ASSERT_EQUAL_HEX16('a', DAT_0023c448);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_typed_jump_replaces_the_held_forward_code);
    RUN_TEST(test_a_waiting_jump_survives_the_next_movement_poll);
    RUN_TEST(test_forward_is_latched_again_once_the_jump_is_consumed);
    RUN_TEST(test_jump_with_forward_held_is_a_running_jump);
    RUN_TEST(test_jump_without_movement_is_a_standing_jump);
    RUN_TEST(test_releasing_the_jump_key_does_not_stall_the_walk);
    RUN_TEST(test_typed_character_without_movement_is_unchanged);
    return UNITY_END();
}
