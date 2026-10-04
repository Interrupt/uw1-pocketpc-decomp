#include "hotspot_marker_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
void plot_pixel(int x, int y, int color);
void decrement_cursor_hide_depth(void);
undefined4 cursor_show_idle_tick(void);
undefined4 debug_noop_checkpoint(void);

unsigned char PTR_DAT_000845c8_backing[16];

unsigned char DAT_000845e8_backing[16];

unsigned int DAT_000bbf98_backing[4];

unsigned int DAT_000bbff0_backing[4];

plot_call plots[64];

int plot_count;

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

void set_slot(unsigned char *backing, int index, short x, short y)
{
    *(short *)(backing + index * 4) = x;
    *(short *)(backing + index * 4 + 2) = y;
}

void hotspot_marker_fixture_reset(void)
{
    memset(PTR_DAT_000845c8_backing, 0, sizeof(PTR_DAT_000845c8_backing));
    memset(DAT_000845e8_backing, 0, sizeof(DAT_000845e8_backing));
    memset(DAT_000bbf98_backing, 0, sizeof(DAT_000bbf98_backing));
    memset(DAT_000bbff0_backing, 0, sizeof(DAT_000bbff0_backing));
    plot_count = 0;
}

void hotspot_marker_fixture_dispose(void) {}
