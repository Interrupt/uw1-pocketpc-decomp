/* Minimal stand-ins for the handful of real UW1 drawing primitives
 * debug_ui.c calls. The debug panel's own picking/dispatch logic
 * (dbgui_feed_mouse_down/dbgui_feed_key) never reads pixels back, so
 * these just need to not crash -- g_uw_framebuffer stays NULL, which
 * dbgui_save_backing/restore_backing already treat as a no-op (see
 * their own `if (!fb) return;` guards), so no backing buffer is needed
 * at all for this suite.
 */
#include "src/headers/uw.h"

void *g_uw_framebuffer;
int g_text_use_palette_color;
unsigned short g_text_flat_color;

/* Records the bottom edge of the panel's own background fill (palette
   0x1a, see debug_ui.c's own comment on that color) so
   test_debug_ui.c can assert dbgui_draw() actually clears a shrinking
   panel's now-vacated rows instead of leaving stale text behind. */
static int g_last_draw_color = -1;
int g_last_bg_fill_y1 = -1;
void set_draw_color(short color) { g_last_draw_color = color; }
void rect_fill_or_save_restore(ushort x0, uint y0, short x1, short y1)
{
  (void)x0; (void)y0; (void)x1;
  if (g_last_draw_color == 0x1a) g_last_bg_fill_y1 = y1;
}
void draw_text_string(char *s, short x, short y) { (void)s; (void)x; (void)y; }
void dirty_rect_union(int x0, int x1, int y0, int y1)
{ (void)x0; (void)x1; (void)y0; (void)y1; }
/* dbgui_draw's own row-width clipping (debug_ui.c) calls this to decide
   whether a row needs truncating -- a plausible flat per-glyph width
   (not the real variable-width font metric) so a short row never gets
   clipped here, matching every field this suite's own tests build. */
int measure_text_width(char *s) { return s ? (int)strlen(s) * 5 : 0; }
