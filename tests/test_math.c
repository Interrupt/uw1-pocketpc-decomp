#include "unity.h"
#include "src/headers/math.h"

void setUp(void) {}
void tearDown(void) {}

static void test_increasing_step_reaches_limit(void)
{
    short value = 8;
    TEST_ASSERT_TRUE(step_value_toward_limit(&value, 10, 2, 1));
    TEST_ASSERT_EQUAL_INT16(10, value);
}

static void test_decreasing_step_reaches_limit(void)
{
    short value = 12;
    TEST_ASSERT_TRUE(step_value_toward_limit(&value, 10, 2, -1));
    TEST_ASSERT_EQUAL_INT16(10, value);
}

static void test_steps_within_limit_update_value(void)
{
    short value = 5;
    TEST_ASSERT_TRUE(step_value_toward_limit(&value, 10, 2, 1));
    TEST_ASSERT_EQUAL_INT16(7, value);
    TEST_ASSERT_TRUE(step_value_toward_limit(&value, 0, 2, -1));
    TEST_ASSERT_EQUAL_INT16(5, value);
}

static void test_steps_past_limit_leave_value_unchanged(void)
{
    short value = 9;
    TEST_ASSERT_FALSE(step_value_toward_limit(&value, 10, 2, 1));
    TEST_ASSERT_EQUAL_INT16(9, value);
    value = 11;
    TEST_ASSERT_FALSE(step_value_toward_limit(&value, 10, 2, -1));
    TEST_ASSERT_EQUAL_INT16(11, value);
}

static void test_angle_lookup_uses_original_samples_and_adjacent_view(void)
{
    /* ARM 0x49db8/0x49eb8 with a zero packed argument reads the first
       quarter-turn sample. A unit fraction then interpolates sample +4. */
    TEST_ASSERT_EQUAL_HEX16(0x4000,lookup_arctan_primary_range(0));
    TEST_ASSERT_EQUAL_HEX16(0x4000,lookup_arctan_reciprocal_range(0));
    TEST_ASSERT_EQUAL_INT(16639,lookup_arctan_primary_range(1));
    TEST_ASSERT_EQUAL_INT(16639,lookup_arctan_reciprocal_range(1));
    /* Packed 0x0101 yields byte index 0xff; ARM reads adjacent constants
       rather than running past a separately allocated native sample table. */
    TEST_ASSERT_EQUAL_INT(65049,lookup_arctan_primary_range(0x0101));
    TEST_ASSERT_EQUAL_INT(65049,lookup_arctan_reciprocal_range(0x0101));
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_angle_lookup_uses_original_samples_and_adjacent_view);
    RUN_TEST(test_increasing_step_reaches_limit);
    RUN_TEST(test_decreasing_step_reaches_limit);
    RUN_TEST(test_steps_within_limit_update_value);
    RUN_TEST(test_steps_past_limit_leave_value_unchanged);
    return UNITY_END();
}
