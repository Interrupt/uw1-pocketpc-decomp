#include "automap_fixture.h"

void setUp(void) { automap_fixture_reset(); }
void tearDown(void) {}

static void test_tint_uses_second_random_draw_and_original_palette_formula(void)
{
    automap_fixture_set_pixel(10,10,59);
    automap_random[0]=32767; /* discarded */
    automap_random[1]=0;
    darken_pixel(10,10,6,2);
    TEST_ASSERT_EQUAL_INT(2,automap_random_calls);
    TEST_ASSERT_EQUAL_UINT8(65,automap_indices[189*320+10]);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[65],automap_pixels[190*320+10]);
    automap_random[2]=0;
    automap_random[3]=32767;
    darken_pixel(10,10,0,4);
    TEST_ASSERT_EQUAL_INT(4,automap_random_calls);
    TEST_ASSERT_EQUAL_UINT8(69,automap_indices[189*320+10]);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[69],automap_pixels[190*320+10]);
}

static void test_tint_preserves_palette_identity_and_byte_wrap(void)
{
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[64],g_palette_rgb565_backing[65]);
    automap_fixture_set_pixel(10,10,65);
    darken_pixel(10,10,2,3);
    TEST_ASSERT_EQUAL_UINT8(67,automap_indices[189*320+10]);
    automap_fixture_set_pixel(10,10,254);
    darken_pixel(10,10,6,2);
    TEST_ASSERT_EQUAL_UINT8(4,automap_indices[189*320+10]);
}

static void test_tint_masks_host_random_to_original_15_bit_range(void)
{
    automap_fixture_set_pixel(10,10,59);
    automap_random[1]=0x7fffffff;
    darken_pixel(10,10,6,2);
    TEST_ASSERT_EQUAL_UINT8(67,automap_indices[189*320+10]);
}

static void test_wall_edges_use_original_discovered_and_undiscovered_shades(void)
{
    static const int dx[]={0,1,0,-1},dy[]={1,0,-1,0};
    for (int edge=0; edge<4; ++edge) {
        int x=edge==1 ? 40 : edge==3 ? 36 : 37;
        int y=edge==0 ? 37 : edge==2 ? 33 : 34;
        int neighbor=(10+dy[edge])*64+10+dx[edge];
        for (int shape=0; shape<=15; ++shape) {
            if (shape>0 && shape<10) continue;
            automap_fixture_reset();
            automap_cells[neighbor]=shape;
            automap_fixture_set_pixel(x,y,59);
            /* Half-scale roll: +2 for spread 4, +1 for spread 2. */
            automap_random[1]=16383;
            TEST_ASSERT_EQUAL_INT(1,draw_automap_cell_edge(edge,10,10));
            int expected=shape==11 ? 61 : 66;
            TEST_ASSERT_EQUAL_UINT8(expected,automap_indices[(199-y)*320+x]);
            TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[expected],automap_pixels[(200-y)*320+x]);
            TEST_ASSERT_EQUAL_INT(6,automap_random_calls);
        }
    }
}

static void test_floor_fill_uses_original_two_add_three_spread(void)
{
    byte before[9];
    for (int x=0; x<3; ++x)
        for (int y=0; y<3; ++y)
            before[x*3+y]=automap_indices[(199-34-y)*320+37+x];
    draw_automap_cell(1,10,10);
    TEST_ASSERT_EQUAL_INT(18,automap_random_calls);
    for (int x=0; x<3; ++x)
        for (int y=0; y<3; ++y) {
            byte expected=before[x*3+y]+2;
            TEST_ASSERT_EQUAL_UINT8(expected,automap_indices[(199-34-y)*320+37+x]);
            TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[expected],automap_pixels[(200-34-y)*320+37+x]);
        }
}

static void test_explored_open_neighbor_does_not_draw_a_wall(void)
{
    automap_cells[10*64+11]=1;
    TEST_ASSERT_EQUAL_INT(0,draw_automap_cell_edge(1,10,10));
    TEST_ASSERT_EQUAL_INT(0,automap_random_calls);
}

static void test_water_fill_updates_palette_indices_before_a_later_tint(void)
{
    automap_cells[10*64+10]=0x11; /* explored water */
    draw_automap_cell(1,10,10);
    TEST_ASSERT_EQUAL_UINT8(0xb1,automap_indices[165*320+37]);
    darken_pixel(37,34,6,3);
    TEST_ASSERT_EQUAL_UINT8(0xb7,automap_indices[165*320+37]);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[0xb7],automap_pixels[166*320+37]);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_tint_uses_second_random_draw_and_original_palette_formula);
    RUN_TEST(test_tint_preserves_palette_identity_and_byte_wrap);
    RUN_TEST(test_tint_masks_host_random_to_original_15_bit_range);
    RUN_TEST(test_wall_edges_use_original_discovered_and_undiscovered_shades);
    RUN_TEST(test_floor_fill_uses_original_two_add_three_spread);
    RUN_TEST(test_explored_open_neighbor_does_not_draw_a_wall);
    RUN_TEST(test_water_fill_updates_palette_indices_before_a_later_tint);
    return UNITY_END();
}
