#include "automap_fixture.h"

void setUp(void) { automap_fixture_reset(); }
void tearDown(void) {}

static void test_undiscovered_walls_are_lighter_than_floors_and_discovered_walls(void)
{
    for (int edge = 0; edge < 4; ++edge) {
        static const int dx[] = {0,1,0,-1}, dy[] = {1,0,-1,0};
        int neighbor = (10 + dy[edge]) * 64 + 10 + dx[edge];
        for (int shape = 10; shape <= 15; ++shape) {
            automap_fixture_reset();
            automap_cells[neighbor] = shape;
            TEST_ASSERT_EQUAL_INT(1, draw_automap_cell_edge(edge,10,10));
            int stroke = -1;
            for (int i = 0; i < 320 * 200; ++i)
                if (automap_pixels[i] != 0xffff) { stroke = i; break; }
            TEST_ASSERT_GREATER_OR_EQUAL_INT(0, stroke);
            ushort pale = automap_pixels[stroke];
            int x = stroke % 320, y = 200 - stroke / 320;
            automap_pixels[stroke] = 0xffff;
            darken_pixel_light(x,y);
            TEST_ASSERT_GREATER_THAN_UINT16(automap_pixels[stroke], pale);
            automap_fixture_reset();
            TEST_ASSERT_EQUAL_INT(1, draw_automap_cell_edge(edge,10,10));
            TEST_ASSERT_LESS_THAN_UINT16(pale, automap_pixels[stroke]);
        }
    }
}

static void test_explored_open_neighbor_does_not_draw_a_wall(void)
{
    automap_cells[10 * 64 + 11] = 1;
    TEST_ASSERT_EQUAL_INT(0, draw_automap_cell_edge(1,10,10));
    for (int i = 0; i < 320 * 200; ++i)
        TEST_ASSERT_EQUAL_HEX16(0xffff, automap_pixels[i]);
}

static void test_discovered_wall_is_lighter_than_half_brightness_but_darker_than_floor(void)
{
    darken_pixel(10,10);
    ushort wall = automap_pixels[190 * 320 + 10];
    TEST_ASSERT_EQUAL_HEX16(0x94d2, wall); /* RGB565 half + eighth of white */
    TEST_ASSERT_GREATER_THAN_UINT16(0x7bef, wall);
    automap_pixels[190 * 320 + 10] = 0xffff;
    darken_pixel_light(10,10);
    TEST_ASSERT_LESS_THAN_UINT16(automap_pixels[190 * 320 + 10], wall);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_undiscovered_walls_are_lighter_than_floors_and_discovered_walls);
    RUN_TEST(test_explored_open_neighbor_does_not_draw_a_wall);
    RUN_TEST(test_discovered_wall_is_lighter_than_half_brightness_but_darker_than_floor);
    return UNITY_END();
}
