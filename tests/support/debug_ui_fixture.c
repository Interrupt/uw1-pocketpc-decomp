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

void set_draw_color(int color) { (void)color; }
void rect_fill_or_save_restore(int x0, int y0, int x1, int y1)
{ (void)x0; (void)y0; (void)x1; (void)y1; }
void draw_text_string(const char *s, int x, int y) { (void)s; (void)x; (void)y; }
void dirty_rect_union(int x0, int x1, int y0, int y1)
{ (void)x0; (void)x1; (void)y0; (void)y1; }
