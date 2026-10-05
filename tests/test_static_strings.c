#include "static_strings_fixture.h"
#include "unity.h"
void setUp(void) {}
void tearDown(void) {}
static void test_all_static_strings_match_the_original_bytes_or_documented_port_values(void)
{
    TEST_ASSERT_GREATER_THAN_UINT(300, uw_test_static_string_count);
    for (size_t i = 0; i < uw_test_static_string_count; i++) {
        const struct uw_test_static_string *entry = &uw_test_static_strings[i];
        TEST_ASSERT_EQUAL_STRING_MESSAGE(entry->expected, entry->actual, entry->source);
    }
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_all_static_strings_match_the_original_bytes_or_documented_port_values);
    return UNITY_END();
}
