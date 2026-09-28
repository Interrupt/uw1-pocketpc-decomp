/* Minimal immediate-mode debug GUI, built on top of this project's own
 * recovered UW1 drawing primitives (rect_fill_or_save_restore,
 * set_draw_color, draw_text_string) rather than a separate rendering
 * path -- so it composites correctly with the game's own screen without
 * needing its own framebuffer or blit step. Opt-in only (UW_MODEL_TUNER=1),
 * built for live-tuning numeric constants (model scale/offset/UV params)
 * without editing code and rebuilding for every value.
 *
 * Usage, once per frame, from anywhere already inside the render pass:
 *   dbgui_begin("Door Frame Tuner");
 *   dbgui_field_double("scale", &my_scale, 0.01);
 *   dbgui_field_double("yoff", &my_yoff, 1.0);
 *   dbgui_field_int("heading_step", &my_step, 1);
 *   dbgui_end();
 *
 * The field list is rebuilt every frame (cheap, a few pointers) --
 * genuinely immediate-mode, no persistent widget objects. Only the
 * selection/edit state persists, in this module's own static globals.
 */
#ifndef DEBUG_UI_H
#define DEBUG_UI_H

#ifdef __cplusplus
extern "C" {
#endif

void dbgui_begin(const char *title);
void dbgui_field_double(const char *name, double *value, double step);
void dbgui_field_int(const char *name, int *value, int step);
/* A row with no value -- shown as "[ name ]". Selecting it and pressing
   RETURN (or clicking it) calls on_press() immediately, instead of
   entering the numeric-edit mode double/int fields use. */
void dbgui_field_button(const char *name, void (*on_press)(void));
/* A boolean row, shown as "name: ON"/"name: OFF" (*value treated as
   nonzero == ON). RETURN, LEFT, or RIGHT all just flip it -- no numeric-
   edit mode, unlike double/int fields. */
void dbgui_field_toggle(const char *name, int *value);
void dbgui_end(void);
/* Actually paints the panel -- call once per frame from the true end of
 * the frame (after the 3D view and HUD have drawn), NOT from wherever
 * dbgui_begin/dbgui_field_.../dbgui_end happened to run. See its own
 * comment in debug_ui.c for why the two are split. */
void dbgui_draw(void);

/* True once dbgui_begin has been called with a non-NULL title at least
 * once this process and the panel is currently shown -- gx_stub.c's
 * event loop checks this to decide whether raw input belongs to the
 * debug UI (swallowed, not forwarded to the game) or to the game as
 * normal. Toggled by the backtick key regardless of this state, so the
 * panel can always be brought back. */
int dbgui_visible(void);
/* Backtick always toggles, regardless of current visibility -- call
 * this directly from gx_stub.c's SDL_KEYDOWN case for
 * SDLK_BACKQUOTE (96), before checking dbgui_visible(), so the panel
 * can always be brought back even while hidden. */
void dbgui_toggle(void);

/* Raw input feed from gx_stub.c's SDL event loop, BEFORE any of the
 * game's own WM_*-message translation -- landscape logical pixel
 * coordinates (the same 320x240 space draw_text_string/
 * rect_fill_or_save_restore already draw in), not SDL window pixels. */
void dbgui_feed_mouse_down(int lx, int ly);
void dbgui_feed_key(int sdl_keycode);
void dbgui_feed_text(const char *utf8);

#ifdef __cplusplus
}
#endif

#endif
