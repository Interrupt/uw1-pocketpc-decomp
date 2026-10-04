/* Minimal immediate-mode debug GUI, built on top of this project's own
 * recovered UW1 drawing primitives (rect_fill_or_save_restore,
 * set_draw_color, draw_text_string) rather than a separate rendering
 * path -- so it composites correctly with the game's own screen without
 * needing its own framebuffer or blit step. Hidden until backtick
 * (dbgui_visible()/dbgui_toggle() below), so it has zero effect on
 * normal play or any demo script that never presses it.
 *
 * General subsystem debug panel: populated once per frame, unconditionally,
 * from main_loop_hud_flush (hud.c) with on/off toggles for whole render/
 * simulation subsystems (wall rendering, 3D object rendering, NPC/object
 * ticking, the pick-diagnostic overlay, ...) bound directly to each
 * subsystem's own global flag. Earlier in this project's history this
 * module instead hosted a per-object "model tuner" populated from inside
 * the 3D model-draw call itself (models.c) -- removed, since any site that
 * calls dbgui_begin() again before main_loop_hud_flush's own call runs
 * would overwrite the shared field list for the rest of that frame (there
 * is exactly one field list, one dbgui_begin/dbgui_end pair's worth, live
 * at a time). Add a new subsystem toggle at that same call site instead
 * of starting a second panel.
 *
 * Usage, once per frame:
 *   dbgui_begin("Debug Panel");
 *   dbgui_field_toggle("hide_walls", &g_uw_hide_walls);
 *   dbgui_field_double("some_tunable", &my_value, 1.0);
 *   dbgui_field_int("some_count", &my_count, 1);
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
/* A read-only "name: value" row for displaying information rather than
   an editable setting (an inspected object's id/type/position/...).
   Selectable (keyboard nav doesn't skip it) but never enters edit mode
   and ignores RETURN/LEFT/RIGHT/click, same as a plain label. `value`
   is copied immediately, truncated to a small fixed buffer -- call
   again next frame with a freshly formatted string for a live
   display, same as every other field kind being rebuilt each frame. */
void dbgui_field_text(const char *name, const char *value);
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

/* Test-only accessors (tests/test_debug_ui.c) -- never called by game
 * code. dbgui_test_reset() clears all panel/selection/edit state back
 * to a fresh process start, so each test case gets a known baseline
 * regardless of what an earlier test left behind (dbgui_begin() itself
 * deliberately does NOT reset selection -- real play wants the cursor
 * to survive from frame to frame). dbgui_test_row_x/row_y expose the
 * real per-field click rect dbgui_draw() just computed, instead of
 * tests duplicating DBGUI_PANEL_X/DBGUI_ROW_H's values by hand (only
 * valid after a dbgui_draw() call this "frame", same as real mouse
 * picking -- returns -1 for an out-of-range index). */
void dbgui_test_reset(void);
int dbgui_test_row_x(void);
int dbgui_test_row_y(int field_index);

#ifdef __cplusplus
}
#endif

#endif
