#include "illustrations_fixture.h"

void setUp(void) { illustrations_fixture_reset(); }
void tearDown(void) { illustrations_fixture_dispose(); }

static void test_level_one_window_look_displays_illustration(void)
{
    look_at_inscribed_object(window_object(), 1);
    TEST_ASSERT_EQUAL_INT(1, descriptions);
    TEST_ASSERT_EQUAL_STRING("\\CUTS\\CS400.N00", opened_path);
    TEST_ASSERT_EQUAL_INT(3, writes);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(1, displays);
    TEST_ASSERT_EQUAL_HEX16(0x100, displayed_page);
    TEST_ASSERT_EQUAL_UINT8(1, script[4]);
    TEST_ASSERT_EQUAL_UINT8(1, script[6]);
    TEST_ASSERT_EQUAL_UINT8(1, script[12]);
}

static void test_window_out_of_range_only_describes_it(void)
{
    look_at_inscribed_object(window_object(), 0);
    TEST_ASSERT_EQUAL_INT(1, descriptions);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, displays);
}

static void test_normal_wall_does_not_display_illustration(void)
{
    DAT_0023add0_backing[23] = 0;
    look_at_inscribed_object(window_object(), 1);
    TEST_ASSERT_EQUAL_INT(1, descriptions);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, displays);
}

static void test_failed_resource_open_does_not_display_illustration(void)
{
    fail_open = 1;
    look_at_inscribed_object(window_object(), 1);
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_INT(0, displays);
}

static void test_failed_resource_write_does_not_display_illustration(void)
{
    fail_write = 1;
    look_at_inscribed_object(window_object(), 1);
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(0, displays);
}

static void test_window_look_without_registry_directory_uses_cuts(void)
{
    DAT_0023c698 = 0;
    test_level_one_window_look_displays_illustration();
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level_one_window_look_displays_illustration);
    RUN_TEST(test_window_out_of_range_only_describes_it);
    RUN_TEST(test_normal_wall_does_not_display_illustration);
    RUN_TEST(test_failed_resource_open_does_not_display_illustration);
    RUN_TEST(test_failed_resource_write_does_not_display_illustration);
    RUN_TEST(test_window_look_without_registry_directory_uses_cuts);
    return UNITY_END();
}
