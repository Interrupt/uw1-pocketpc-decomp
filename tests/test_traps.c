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

/* The dial's position lives in the switch's flag nibble (word0 bits 9-12). Each of the eight
   positions must pick its own floor height; before the fix the trap read the switch's position
   word (DAT_0024cff0 is ushort*, so "+ 1" skipped two bytes) and every position produced the
   same, highest, height. */
static void test_level_one_dial_selects_distinct_height_per_position(void)
{
    ushort *dial = level_one_dial_switch();
    ushort *trap = level_one_dial_trap(dial);
    DAT_0024cff0 = dial;
    for (int position = 0; position < 8; position++) {
        *dial = (*dial & ~0x1e00) | (position << 9);
        terrain_calls = 0;
        TEST_ASSERT_EQUAL_INT(2, dispatch_trap_type_effect(trap, 43, 44));
        TEST_ASSERT_EQUAL_INT(1, terrain_calls);
        TEST_ASSERT_EQUAL_INT(43, terrain_tile_x);
        TEST_ASSERT_EQUAL_INT(44, terrain_tile_y);
        TEST_ASSERT_EQUAL_INT_MESSAGE(2 + position, terrain_height, "dial position -> height");
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level_one_orb_text_trap_passes_full_message_pointer);
    RUN_TEST(test_level_one_orb_missing_message_is_not_printed);
    RUN_TEST(test_level_one_dial_selects_distinct_height_per_position);
    return UNITY_END();
}
