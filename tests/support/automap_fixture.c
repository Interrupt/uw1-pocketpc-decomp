#include "automap_fixture.h"
#include "game_fixture.h"
#include <string.h>
ushort automap_pixels[320 * 200];
byte automap_cells[64 * 64];
byte automap_indices[320 * 200];
byte *g_automap_tint_bitmap = automap_indices;
undefined2 g_palette_rgb565_backing[32768];
long automap_random[128];
int automap_random_calls;
void *g_uw_framebuffer = automap_pixels;
void debug_framebuffer_dump(const char *tag) { (void)tag; }
long ce_rand(void)
{
    int call = automap_random_calls++;
    return call < 128 ? automap_random[call] : 0;
}
undefined4 rand_below(int limit) { return ce_rand() % limit; }
void draw_automap_door_edge(int tx, int ty, int x, int y) {}
void plot_pixel(int x, int y, int index)
{
    automap_pixels[y*320+x] = g_palette_rgb565_backing[index];
}
void automap_fixture_set_pixel(int x, int y, byte index)
{
    automap_indices[(199-y)*320+x] = index;
    automap_pixels[(200-y)*320+x] = g_palette_rgb565_backing[index];
}
void automap_fixture_reset(void)
{
    byte palette[768];
    uw_test_read_data("DATA/PALS.DAT",palette,sizeof palette,768,SEEK_SET);
    for (int i=0; i<256; ++i)
        g_palette_rgb565_backing[i] = (palette[i*3] >> 1) << 11 |
            palette[i*3+1] << 5 | (palette[i*3+2] >> 1);
    uw_test_read_data("DATA/BLNKMAP.BYT",automap_indices,sizeof automap_indices,0,SEEK_SET);
    for (int i=0; i<320*200; ++i)
        automap_pixels[i] = g_palette_rgb565_backing[i < 320 ? 0 : automap_indices[i-320]];
    memset(automap_cells, 0, sizeof automap_cells);
    memset(automap_random, 0, sizeof automap_random);
    automap_random_calls = 0;
}
