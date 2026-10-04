#include "hotspot_marker_fixture.h"

void setUp(void) { hotspot_marker_fixture_reset(); }
void tearDown(void) { hotspot_marker_fixture_dispose(); }

static void test_worn_slots_read_their_own_4byte_stride_coordinates(void)
{
    for (int i = 0; i < 4; i++) {
        set_slot(PTR_DAT_000845c8_backing, i, 100 + i, 50 + i);
    }
    DAT_000bbf98_backing[0] = 1;  /* slot 0: occupied */
    DAT_000bbf98_backing[1] = 0;  /* slot 1: empty */
    DAT_000bbf98_backing[2] = 1;  /* slot 2: occupied */
    DAT_000bbf98_backing[3] = 0;  /* slot 3: empty */

    for (int i = 0; i < 4; i++) {
        plot_count = 0;
        draw_hotspot_crosshair_marker(1, i);
        /* A regression to the old 8-byte stride either reads the wrong
           slot's coordinates (silently, for low indices) or walks off
           PTR_DAT_000845c8_backing entirely (ASan catches that outright
           for index >= 2, since 2*8 bytes already exceeds the 16-byte
           backing array). Checking the exact center coordinate and
           color catches the silent case too. */
        TEST_ASSERT_EQUAL_INT_MESSAGE(5, plot_count, "expected center + 4 neighbor plots");
        TEST_ASSERT_EQUAL_INT(100 + i, plots[0].x);
        TEST_ASSERT_EQUAL_INT(50 + i, plots[0].y);
        TEST_ASSERT_EQUAL_INT((i % 2 == 0) ? 0x60 : 0xf1, plots[0].color);
    }
}

static void test_backpack_slots_still_read_correctly(void)
{
    /* The param_1 == 0 (backpack-slot) branch was never buggy -- covered
       here so a future edit to the shared parts of this function can't
       silently break it while "fixing" the worn-slot branch. */
    set_slot(DAT_000845e8_backing, 2, 200, 75);
    DAT_000bbff0_backing[2] = 1;

    draw_hotspot_crosshair_marker(0, 2);

    TEST_ASSERT_EQUAL_INT(5, plot_count);
    TEST_ASSERT_EQUAL_INT(200, plots[0].x);
    TEST_ASSERT_EQUAL_INT(75, plots[0].y);
    TEST_ASSERT_EQUAL_INT(0x60, plots[0].color);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_worn_slots_read_their_own_4byte_stride_coordinates);
    RUN_TEST(test_backpack_slots_still_read_correctly);
    return UNITY_END();
}
