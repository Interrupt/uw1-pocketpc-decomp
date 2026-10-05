#include "scroll_messages_fixture.h"
void setUp(void) { scroll_messages_fixture_reset(); }
void tearDown(void) {}

static void test_use_key_prompt_preserves_spaces_and_ends_the_line(void)
{
    ushort key[4] = {0x100};
    prompt_use_item_on_target(key, NULL);
    message_scroll_print_wrapped("Next message");
    TEST_ASSERT_EQUAL_STRING("Use iron key on what?", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("Next message", scroll_messages_fixture_line(1));
}
static void test_locked_and_empty_messages_keep_fragment_boundaries(void)
{
    scroll_messages_fixture_print(0x878f4); /* That */
    message_scroll_print_wrapped("door");
    scroll_messages_fixture_print(0x878fc); /* is locked.\n */
    scroll_messages_fixture_print(0x85c88); /* The */
    message_scroll_print_wrapped("sack");
    scroll_messages_fixture_print(0x8790c); /* is empty.\n */
    message_scroll_print_wrapped("Afterwards");
    TEST_ASSERT_EQUAL_STRING("That door is locked.", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("The sack is empty.", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Afterwards", scroll_messages_fixture_line(2));
}
static void test_invalid_spell_messages_start_separate_lines(void)
{
    print_not_a_spell_message();
    print_not_a_spell_message();
    message_scroll_print_wrapped("Next");
    TEST_ASSERT_EQUAL_STRING("Not a spell", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("Not a spell", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Next", scroll_messages_fixture_line(2));
}
static void test_count_and_skill_list_separators_are_not_empty(void)
{
    message_scroll_print_wrapped("Health: 10");
    scroll_messages_fixture_print(0x858dc);
    message_scroll_print_wrapped("20");
    scroll_messages_fixture_print(0x8522c);
    message_scroll_print_wrapped("Sword");
    scroll_messages_fixture_print(0x87318);
    message_scroll_print_wrapped("Axe");
    scroll_messages_fixture_print(0x87310);
    message_scroll_print_wrapped("Mace");
    scroll_messages_fixture_print(0x84f20);
    message_scroll_print_wrapped("Next");
    TEST_ASSERT_EQUAL_STRING("Health: 10 out of 20", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("Sword, Axe and Mace.", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Next", scroll_messages_fixture_line(2));
}
static void test_sentence_newlines_survive_repeated_prints(void)
{
    for (unsigned i = 0; i < 3; i++) {
        scroll_messages_fixture_print(0x85644);
        TEST_ASSERT_EQUAL_STRING("The book explodes in your face!", scroll_messages_fixture_line(i));
    }
}
static void test_level_number_updates_in_the_same_newline_terminated_buffer(void)
{
    advance_character_level(1);
    advance_character_level(1);
    message_scroll_print_wrapped("Next");
    TEST_ASSERT_EQUAL_STRING("You have attained experience level 2", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("You have attained experience level 3", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Next", scroll_messages_fixture_line(2));
}
static void test_long_message_wraps_without_losing_words(void)
{
    scroll_messages_fixture_width(25);
    char text[] = "The writing reads: We attacked the entrance and found the door locked.\n";
    message_scroll_print_wrapped(text);
    char combined[256] = "";
    for (unsigned i = 0; i < 10; i++) {
        const char *line = scroll_messages_fixture_line(i);
        if (!*line) break;
        if (*combined) strcat(combined, " ");
        strcat(combined, line);
    }
    TEST_ASSERT_EQUAL_STRING("The writing reads: We attacked the entrance and found the door locked.", combined);
    TEST_ASSERT_EQUAL_STRING("The writing reads: We attacked the entrance and found the door locked.\n", text);
}
static void check_repeated_looks(void (*handler)(ushort *, int))
{
    ushort sack[4] = {0x80}, torch[4] = {0x81};
    handler(sack, 0);
    handler(torch, 0);
    message_scroll_print_wrapped("Next");
    TEST_ASSERT_EQUAL_STRING("You see a sack.", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("You see a torch.", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Next", scroll_messages_fixture_line(2));
}
static void test_look_messages_have_one_line_ending(void)
{
    check_repeated_looks(dispatch_object_action);
}
static void test_alternate_look_messages_have_one_line_ending(void)
{
    check_repeated_looks(dispatch_object_action_dup);
}
static void test_creature_looks_have_one_line_ending(void)
{
    ushort goblin[16] = {0x40};
    dispatch_object_action(goblin, 0);
    dispatch_object_action_dup(goblin, 0);
    message_scroll_print_wrapped("Next");
    TEST_ASSERT_EQUAL_STRING("You see a goblin.", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("You see a goblin.", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Next", scroll_messages_fixture_line(2));
}
static void test_terrain_looks_have_one_line_ending(void)
{
    describe_picked_terrain(2, 1);
    describe_picked_terrain(2, 2);
    message_scroll_print_wrapped("Next");
    TEST_ASSERT_EQUAL_STRING("You see a stone wall.", scroll_messages_fixture_line(0));
    TEST_ASSERT_EQUAL_STRING("You see a stone floor.", scroll_messages_fixture_line(1));
    TEST_ASSERT_EQUAL_STRING("Next", scroll_messages_fixture_line(2));
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_use_key_prompt_preserves_spaces_and_ends_the_line);
    RUN_TEST(test_locked_and_empty_messages_keep_fragment_boundaries);
    RUN_TEST(test_invalid_spell_messages_start_separate_lines);
    RUN_TEST(test_count_and_skill_list_separators_are_not_empty);
    RUN_TEST(test_sentence_newlines_survive_repeated_prints);
    RUN_TEST(test_level_number_updates_in_the_same_newline_terminated_buffer);
    RUN_TEST(test_long_message_wraps_without_losing_words);
    RUN_TEST(test_look_messages_have_one_line_ending);
    RUN_TEST(test_alternate_look_messages_have_one_line_ending);
    RUN_TEST(test_creature_looks_have_one_line_ending);
    RUN_TEST(test_terrain_looks_have_one_line_ending);
    return UNITY_END();
}
