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

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_increasing_step_reaches_limit);
    RUN_TEST(test_decreasing_step_reaches_limit);
    RUN_TEST(test_steps_within_limit_update_value);
    RUN_TEST(test_steps_past_limit_leave_value_unchanged);
    return UNITY_END();
}
