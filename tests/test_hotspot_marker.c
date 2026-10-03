#include "unity.h"
#include "../src/headers/uw.h"

/* Regression test for a real ASan-caught global-buffer-overflow: the
 * worn-item-slot branch (param_1 != 0) of draw_hotspot_crosshair_marker
 * did `param_2 + iVar2` on an `undefined **` field -- an 8-byte pointer
 * stride -- against a table that is really 4-byte-stride coordinate
 * pairs (same layout as the sibling backpack-slot branch right below
 * it). init_barter_ui calls this for 4 worn slots (indices 0-3); by
 * index 2 that walked clean off the end of the single-slot backing
 * array. See draw_hotspot_crosshair_marker's own comment in babl.c. */

unsigned char PTR_DAT_000845c8_backing[16];
unsigned char DAT_000845e8_backing[16];
unsigned int DAT_000bbf98_backing[4];
unsigned int DAT_000bbff0_backing[4];

typedef struct { int x, y, color, calls; } plot_call;
static plot_call plots[64];
static int plot_count;

void plot_pixel(int x, int y, int color)
{
    TEST_ASSERT_LESS_THAN_INT(64, plot_count);
    plots[plot_count].x = x;
    plots[plot_count].y = y;
    plots[plot_count].color = color;
    plot_count++;
}
void decrement_cursor_hide_depth(void) {}
undefined4 cursor_show_idle_tick(void) { return 0; }
undefined4 debug_noop_checkpoint(void) { return 0; }

static void set_slot(unsigned char *backing, int index, short x, short y)
{
    *(short *)(backing + index * 4) = x;
    *(short *)(backing + index * 4 + 2) = y;
}

void setUp(void)
{
    memset(PTR_DAT_000845c8_backing, 0, sizeof(PTR_DAT_000845c8_backing));
    memset(DAT_000845e8_backing, 0, sizeof(DAT_000845e8_backing));
    memset(DAT_000bbf98_backing, 0, sizeof(DAT_000bbf98_backing));
    memset(DAT_000bbff0_backing, 0, sizeof(DAT_000bbff0_backing));
    plot_count = 0;
}
void tearDown(void) {}

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
