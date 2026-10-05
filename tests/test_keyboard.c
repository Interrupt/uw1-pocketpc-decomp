#include "keyboard_fixture.h"

/* Regression coverage for bugfix/lowercase-text-universal ("Can't enter
 * lower case text"). Root cause: handle_keyboard_message (src/input.c)
 * unconditionally folds a WM_CHAR lowercase letter to uppercase whenever
 * DAT_0024af60 ("command-input mode") is set -- which, after
 * init_gameplay_session runs once at session start, is true for the rest
 * of the whole play session, including every raw text-entry field that
 * runs DURING the session (automap notes, and -- via the shared
 * scroll_text_entry_prompt primitive -- the save-name field, "Move how
 * many", and "Chant the mantra"). The fix gates that fold on
 * g_text_input_active, the one flag every one of those raw-keystroke
 * text-entry loops either already sets for free (scroll_text_entry_prompt
 * itself) or must set around its own loop (automap notes -- see
 * automap.c's handle_automap_note_click). This is deliberately a direct,
 * fixture-driven test of handle_keyboard_message itself rather than a
 * full UI demo script: automap/chargen/save-menu click coordinates and
 * splash-screen timing make scripting the full in-game UI flow slow and
 * fragile to pin down exactly, while the actual bug -- and its fix --
 * live entirely in this one function's fold condition. */

void setUp(void) { keyboard_fixture_reset(); }
void tearDown(void) { keyboard_fixture_dispose(); }

static void send_char(unsigned int wparam)
{
    handle_keyboard_message(0, 0x102 /* WM_CHAR */, wparam);
}

static void test_lowercase_passes_through_while_a_text_field_is_active(void)
{
    /* Matches the state during automap notes / save-name / "Move how
       many" / "Chant the mantra": command-mode latched on (true for the
       whole session after init_gameplay_session), but a raw text field
       owns the keyboard right now. */
    DAT_0024af60 = 1;
    g_text_input_active = 1;

    send_char('a');
    TEST_ASSERT_EQUAL_HEX16('a', DAT_0023c448);

    DAT_0023c448 = 0;
    send_char('z');
    TEST_ASSERT_EQUAL_HEX16('z', DAT_0023c448);
}

static void test_lowercase_still_folds_to_uppercase_for_movement_keys(void)
{
    /* Outside any text field (ordinary 3D dungeon view), plain WASD typed
       as WM_CHAR must still fold to uppercase so it matches the
       uppercase-coded move_key_directional_step key bindings
       (register_key_binding(0x57,...) etc., game.c) -- the fix must not
       regress the reason this fold exists in the first place. */
    DAT_0024af60 = 1;
    g_text_input_active = 0;

    send_char('w');
    TEST_ASSERT_EQUAL_HEX16('W', DAT_0023c448);

    DAT_0023c448 = 0;
    send_char('a');
    TEST_ASSERT_EQUAL_HEX16('A', DAT_0023c448);
}

static void test_uppercase_letters_are_unaffected_either_way(void)
{
    DAT_0024af60 = 1;

    g_text_input_active = 1;
    send_char('W');
    TEST_ASSERT_EQUAL_HEX16('W', DAT_0023c448);

    DAT_0023c448 = 0;
    g_text_input_active = 0;
    send_char('W');
    TEST_ASSERT_EQUAL_HEX16('W', DAT_0023c448);
}

static void test_fold_never_fires_before_command_mode_is_latched(void)
{
    /* Matches chargen's name field, which runs before
       init_gameplay_session ever sets DAT_0024af60 -- this path was never
       actually broken by the bug, and must keep working regardless of
       g_text_input_active's value (chargen never sets it). */
    DAT_0024af60 = 0;
    g_text_input_active = 0;

    send_char('a');
    TEST_ASSERT_EQUAL_HEX16('a', DAT_0023c448);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_lowercase_passes_through_while_a_text_field_is_active);
    RUN_TEST(test_lowercase_still_folds_to_uppercase_for_movement_keys);
    RUN_TEST(test_uppercase_letters_are_unaffected_either_way);
    RUN_TEST(test_fold_never_fires_before_command_mode_is_latched);
    return UNITY_END();
}
