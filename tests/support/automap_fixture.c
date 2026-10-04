#include "automap_fixture.h"
#include <string.h>
ushort automap_pixels[320 * 200];
byte automap_cells[64 * 64];
void *g_uw_framebuffer = automap_pixels;
void debug_framebuffer_dump(const char *tag) { (void)tag; }
void automap_fixture_reset(void)
{
    memset(automap_pixels, 0xff, sizeof automap_pixels);
    memset(automap_cells, 0, sizeof automap_cells);
}
