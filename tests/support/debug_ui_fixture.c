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
/* dbgui_draw's own UW_DEBUG_DBGUI trace reads the active viewport clip
   rect (src/3d.c's set_viewport_clip_rect); this suite never sets one,
   so these just need real storage to link, not any particular value. */
unsigned short DAT_000a85c4, DAT_000a85c8, DAT_000842a4, DAT_000842a8;

void set_draw_color(int color) { (void)color; }
void rect_fill_or_save_restore(int x0, int y0, int x1, int y1)
{ (void)x0; (void)y0; (void)x1; (void)y1; }
void draw_text_string(const char *s, int x, int y) { (void)s; (void)x; (void)y; }
void dirty_rect_union(int x0, int x1, int y0, int y1)
{ (void)x0; (void)x1; (void)y0; (void)y1; }
