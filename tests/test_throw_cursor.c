#include "throw_cursor_fixture.h"

void setUp(void) { throw_cursor_fixture_reset(); }
void tearDown(void) { throw_cursor_fixture_dispose(); }

static void test_center_cursor_throw_starts_near_the_player(void)
{
    launch();
    TEST_ASSERT_EQUAL_INT(world_x(g_player_object), world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(world_y(g_player_object), world_y(thrown));
    TEST_ASSERT_LESS_THAN_INT(world_y(g_player_object) + 16, world_y(thrown));
    TEST_ASSERT_EQUAL_INT(world_x(thrown) * 32 + 15, fine(thrown, 11));
    TEST_ASSERT_EQUAL_INT(world_y(thrown) * 32 + 15, fine(thrown, 13));
}
static void test_cursor_left_and_right_change_the_throw_origin(void)
{
    short origin_x = world_x(g_player_object);
    g_mouse_x = 70;
    launch();
    TEST_ASSERT_LESS_THAN_INT(origin_x, world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(world_y(g_player_object), world_y(thrown));
    short left_x = world_x(thrown);
    setUp();
    g_mouse_x = 210;
    launch();
    TEST_ASSERT_GREATER_THAN_INT(origin_x, world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(left_x, world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(world_y(g_player_object), world_y(thrown));
}
static void test_cursor_throw_origin_rotates_with_player_facing(void)
{
    const int headings[] = {0, 64, 128, 192};
    for (int direction = 0; direction < 4; direction++) {
        setUp();
        g_player_object[1] |= (headings[direction] & 0xe0) << 2;
        short x = world_x(g_player_object), y = world_y(g_player_object);
        launch();
        if (direction == 0 || direction == 2) {
            TEST_ASSERT_EQUAL_INT(x, world_x(thrown));
            if (direction == 0) TEST_ASSERT_GREATER_THAN_INT(y, world_y(thrown));
            else TEST_ASSERT_LESS_THAN_INT(y, world_y(thrown));
        } else {
            TEST_ASSERT_EQUAL_INT(y, world_y(thrown));
            if (direction == 1) TEST_ASSERT_GREATER_THAN_INT(x, world_x(thrown));
            else TEST_ASSERT_LESS_THAN_INT(x, world_x(thrown));
        }
        TEST_ASSERT_EQUAL_INT(world_x(thrown) * 32 + 15, fine(thrown, 11));
        TEST_ASSERT_EQUAL_INT(world_y(thrown) * 32 + 15, fine(thrown, 13));
    }
}
static void test_cursor_height_changes_the_throw_origin_height(void)
{
    g_mouse_y = 30;
    launch();
    short high_z = fine(thrown, 15);
    setUp();
    g_mouse_y = 85;
    launch();
    TEST_ASSERT_LESS_THAN_INT(high_z, fine(thrown, 15));
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_center_cursor_throw_starts_near_the_player);
    RUN_TEST(test_cursor_left_and_right_change_the_throw_origin);
    RUN_TEST(test_cursor_height_changes_the_throw_origin_height);
    RUN_TEST(test_cursor_throw_origin_rotates_with_player_facing);
    return UNITY_END();
}
