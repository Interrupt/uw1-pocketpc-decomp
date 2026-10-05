#include "keyboard_fixture.h"

/* Regression coverage for the "Can't enter lower case text" bug and its
 * follow-up fix. Root cause (original): handle_keyboard_message
 * (src/input.c) unconditionally folded a WM_CHAR lowercase letter to
 * uppercase whenever DAT_0024af60 ("command-input mode") was set --
 * which, after init_gameplay_session ran once at session start, was
 * true for the rest of the whole play session, including every raw
 * text-entry field that runs DURING the session (automap notes, and --
 * via the shared scroll_text_entry_prompt primitive -- the save-name
 * field, "Move how many", and "Chant the mantra").
 *
 * An earlier fix gated that fold on g_text_input_active. The root-cause
 * fix instead removes the fold entirely: W/S/X/A/D/Z/C are now
 * registered under BOTH their uppercase and lowercase VK codes
 * (game.c), so movement no longer needs any case-folding to match, and
 * handle_keyboard_message now always passes through exactly what was
 * typed, in any context. DAT_0024af60 itself is now a real, inert,
 * default-off Caps Lock state that nothing in this function reads any
 * more -- these tests confirm that plain pass-through behavior holds
 * regardless of DAT_0024af60 or g_text_input_active's value. Movement
 * actually matching both cases is a game.c/dispatch_key_binding concern
 * verified separately (ctest doesn't drive the key-binding table from
 * here; see the full regression suite's demo scripts for live
 * movement verification). */

void setUp(void) { keyboard_fixture_reset(); }
void tearDown(void) { keyboard_fixture_dispose(); }

static void send_char(unsigned int wparam)
{
    handle_keyboard_message(0, 0x102 /* WM_CHAR */, wparam);
}

static void test_lowercase_passes_through_while_a_text_field_is_active(void)
{
    DAT_0024af60 = 0;
    g_text_input_active = 1;

    send_char('a');
    TEST_ASSERT_EQUAL_HEX16('a', DAT_0023c448);

    DAT_0023c448 = 0;
    send_char('z');
    TEST_ASSERT_EQUAL_HEX16('z', DAT_0023c448);
}

static void test_lowercase_passes_through_unchanged_outside_text_entry_too(void)
{
    /* Ordinary 3D dungeon view, no text field open. Plain WASD typed as
       WM_CHAR must reach DAT_0023c448 exactly as typed -- lowercase
       stays lowercase -- since move_key_directional_step's bindings now
       cover both cases directly (game.c). No fold should ever fire
       here, regardless of DAT_0024af60's value. */
    DAT_0024af60 = 0;
    g_text_input_active = 0;

    send_char('w');
    TEST_ASSERT_EQUAL_HEX16('w', DAT_0023c448);

    DAT_0023c448 = 0;
    send_char('a');
    TEST_ASSERT_EQUAL_HEX16('a', DAT_0023c448);

    /* Even if DAT_0024af60 (Caps Lock) were ever toggled on by a real
       VK 0x14 press, the fold must still not fire -- it's gone, not
       just suppressed by g_text_input_active. */
    DAT_0023c448 = 0;
    DAT_0024af60 = 1;
    send_char('w');
    TEST_ASSERT_EQUAL_HEX16('w', DAT_0023c448);
}

static void test_uppercase_letters_are_unaffected_either_way(void)
{
    DAT_0024af60 = 0;

    g_text_input_active = 1;
    send_char('W');
    TEST_ASSERT_EQUAL_HEX16('W', DAT_0023c448);

    DAT_0023c448 = 0;
    g_text_input_active = 0;
    send_char('W');
    TEST_ASSERT_EQUAL_HEX16('W', DAT_0023c448);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_lowercase_passes_through_while_a_text_field_is_active);
    RUN_TEST(test_lowercase_passes_through_unchanged_outside_text_entry_too);
    RUN_TEST(test_uppercase_letters_are_unaffected_either_way);
    return UNITY_END();
}
