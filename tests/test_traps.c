#include "traps_fixture.h"

void setUp(void) { traps_fixture_reset(); }
void tearDown(void) { traps_fixture_dispose(); }

static void test_level_one_orb_text_trap_passes_full_message_pointer(void)
{
    TEST_ASSERT_EQUAL_INT(2, dispatch_trap_type_effect(orb_text_trap(), 58, 13));
    TEST_ASSERT_EQUAL_INT(1, lookups);
    TEST_ASSERT_EQUAL_HEX16(0x1201, message_id);
    TEST_ASSERT_EQUAL_INT(1, prints);
}

static void test_level_one_orb_missing_message_is_not_printed(void)
{
    available_message = NULL;
    TEST_ASSERT_EQUAL_INT(2, dispatch_trap_type_effect(orb_text_trap(), 58, 13));
    TEST_ASSERT_EQUAL_INT(1, lookups);
    TEST_ASSERT_EQUAL_HEX16(0x1201, message_id);
    TEST_ASSERT_EQUAL_INT(0, prints);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level_one_orb_text_trap_passes_full_message_pointer);
    RUN_TEST(test_level_one_orb_missing_message_is_not_printed);
    return UNITY_END();
}
