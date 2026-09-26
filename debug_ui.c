/* Minimal immediate-mode debug GUI -- see headers/debug_ui.h for the
 * usage contract. Draws with this project's own recovered UW1
 * primitives (rect_fill_or_save_restore/set_draw_color/draw_text_string,
 * declared in uw.h), in the same 320x240 landscape logical space they
 * already use, so it composites directly into the game's normal
 * software framebuffer -- no separate overlay surface or blit step.
 *
 * Genuinely immediate-mode: dbgui_field_double/int are called fresh
 * every frame and just append to a small array that's overwritten each
 * dbgui_begin(). Only the selection/edit state below survives between
 * frames.
 */
#include "headers/debug_ui.h"
#include "uw.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* g_text_use_palette_color/g_draw_color_index are already declared in
   uw.h; g_text_flat_color (uw.c:32, `undefined2`) isn't -- declare it
   here directly rather than adding it to uw.h for one caller. */
extern unsigned short g_text_flat_color;

#define DBGUI_MAX_FIELDS 32
#define DBGUI_ROW_H 10
#define DBGUI_PANEL_X 4
#define DBGUI_PANEL_Y 4
#define DBGUI_PANEL_W 140

typedef struct {
  char name[24];
  int is_int;
  double *dval;
  int *ival;
  double step;
  /* Cached screen rect from the last dbgui_end(), for mouse hit-testing
     next frame (this frame's clicks arrive interleaved with drawing,
     so we test against where things were last actually drawn). */
  int row_y;
} DbgField;

static char g_title[48];
static DbgField g_fields[DBGUI_MAX_FIELDS];
static int g_field_count = 0;

static int g_visible = 0;
static int g_selected = 0;
static int g_editing = 0;
static char g_edit_buf[32];
static int g_edit_len = 0;

/* SDL_Keycode values duplicated here (not #include <SDL.h>) to keep
   this file decoupled from SDL -- these are SDL2's own stable public
   values, scancode-based for the non-ASCII ones (1<<30 | scancode). */
#define DBGUI_KEY_RETURN    13
#define DBGUI_KEY_ESCAPE    27
#define DBGUI_KEY_BACKSPACE 8
#define DBGUI_KEY_UP        0x40000052
#define DBGUI_KEY_DOWN      0x40000051
#define DBGUI_KEY_LEFT      0x40000050
#define DBGUI_KEY_RIGHT     0x4000004F

void dbgui_begin(const char *title)
{
  if (title) {
    strncpy(g_title, title, sizeof(g_title) - 1);
    g_title[sizeof(g_title) - 1] = 0;
  }
  g_field_count = 0;
}

static void dbgui_add_field(const char *name, int is_int, double *dval, int *ival, double step)
{
  if (g_field_count >= DBGUI_MAX_FIELDS) return;
  DbgField *f = &g_fields[g_field_count++];
  strncpy(f->name, name, sizeof(f->name) - 1);
  f->name[sizeof(f->name) - 1] = 0;
  f->is_int = is_int;
  f->dval = dval;
  f->ival = ival;
  f->step = step;
}

void dbgui_field_double(const char *name, double *value, double step)
{
  dbgui_add_field(name, 0, value, 0, step);
}

void dbgui_field_int(const char *name, int *value, int step)
{
  dbgui_add_field(name, 1, 0, value, (double)step);
}

static double dbgui_field_get(const DbgField *f)
{
  return f->is_int ? (double)*f->ival : *f->dval;
}

static void dbgui_field_set(DbgField *f, double v)
{
  if (f->is_int) *f->ival = (int)v; else *f->dval = v;
}

void dbgui_end(void)
{
  /* Deliberately does NOT draw -- see dbgui_draw()'s own comment for
     why drawing has to happen later in the frame than this is called.
     Just finalizes the field list/selection state; g_fields/g_title
     stay valid (this module's own statics) until the next dbgui_begin
     overwrites them next frame. */
  if (g_field_count == 0) return;
  if (g_selected >= g_field_count) g_selected = g_field_count - 1;
  if (g_selected < 0) g_selected = 0;
}

void dbgui_draw(void)
{
  /* Called once per frame from app_main_loop, AFTER main_loop_hud_flush()
     -- i.e. after the 3D view and every other HUD element for this
     frame have already drawn into the shared software framebuffer.
     Drawing from inside the model-dispatch code itself (dbgui_end's
     first version) drew too EARLY: later per-object/HUD draws in the
     same frame simply painted over the panel, and if the player wasn't
     looking at a tunable object that frame, nothing drew the panel at
     all. Reading g_fields/g_title here relies on them surviving from
     whatever dbgui_begin/dbgui_field_.../dbgui_end calls happened
     earlier this same frame (this module's own statics, untouched in between) -- if
     nothing called dbgui_begin this frame, g_field_count is just
     whatever it was last frame, which still draws correctly (the panel
     doesn't blank out for one frame just because this particular frame
     didn't walk the tunable object's own code path). */
  if (!g_visible || g_field_count == 0) return;

  int panel_h = DBGUI_ROW_H * (g_field_count + 1) + 4;
  int x0 = DBGUI_PANEL_X, y0 = DBGUI_PANEL_Y;
  int x1 = x0 + DBGUI_PANEL_W, y1 = y0 + panel_h;

  /* Text color: draw_text_string does NOT use set_draw_color's palette
     index (confirmed by reading its own body, uw.c ~5826-5834) -- it
     honours g_text_flat_color (a direct RGB565 value) unless a caller
     separately sets g_text_use_palette_color=1 AND *g_draw_color_index.
     Both default to 0/unset, which is exactly why unselected rows drew
     as invisible black-on-black: set_draw_color(0x0f) before those
     draw_text_string calls did nothing to the text itself. Force a
     direct white RGB565 value instead of hunting for the right palette
     index -- reliable regardless of what this build's real palette
     layout turns out to be. */
  g_text_use_palette_color = 0;
  g_text_flat_color = (unsigned short)0xffff;

  /* Panel/row fill colors ARE real palette indices (rect_fill_or_save_
     restore's FILL path reads g_palette_rgb565[DAT_000a85c0] directly,
     graphics.c ~170-176) -- 0x1a is confirmed elsewhere in this file as
     a real, already-used UI panel background (chargen's own panels);
     0x60 is confirmed elsewhere as a real, legible highlighted-text
     color (multiple *g_draw_color_index = 0x60 call sites). Avoid
     0x14/0x15 -- reserved cursor save/restore codes, not real colors
     (see rect_fill_or_save_restore's own comment). */
  set_draw_color(0x1a);
  rect_fill_or_save_restore(x0, y0, x1, y1);
  draw_text_string(g_title, x0 + 3, y0 + 2);

  int i;
  for (i = 0; i < g_field_count; i++) {
    DbgField *f = &g_fields[i];
    int ry = y0 + DBGUI_ROW_H * (i + 1) + 2;
    f->row_y = ry;
    if (i == g_selected) {
      set_draw_color(g_editing ? 0x60 : 0x1a);
      rect_fill_or_save_restore(x0 + 1, ry - 1, x1 - 1, ry + DBGUI_ROW_H - 2);
    }
    char line[64];
    if (g_editing && i == g_selected) {
      snprintf(line, sizeof(line), "%s: %s_", f->name, g_edit_buf);
    } else {
      snprintf(line, sizeof(line), "%s: %g", f->name, dbgui_field_get(f));
    }
    draw_text_string(line, x0 + 3, ry);
  }
}

int dbgui_visible(void) { return g_visible; }

void dbgui_toggle(void)
{
  g_visible = !g_visible;
  g_editing = 0;
}

void dbgui_feed_mouse_down(int lx, int ly)
{
  if (!g_visible) return;
  int i;
  for (i = 0; i < g_field_count; i++) {
    DbgField *f = &g_fields[i];
    if (ly >= f->row_y - 1 && ly < f->row_y + DBGUI_ROW_H - 2 &&
        lx >= DBGUI_PANEL_X + 1 && lx < DBGUI_PANEL_X + DBGUI_PANEL_W - 1) {
      g_selected = i;
      g_editing = 1;
      snprintf(g_edit_buf, sizeof(g_edit_buf), "%g", dbgui_field_get(f));
      g_edit_len = (int)strlen(g_edit_buf);
      return;
    }
  }
}

void dbgui_feed_key(int sdl_keycode)
{
  if (!g_visible || g_field_count == 0) return;
  DbgField *f = &g_fields[g_selected];

  if (g_editing) {
    if (sdl_keycode == DBGUI_KEY_RETURN) {
      dbgui_field_set(f, atof(g_edit_buf));
      g_editing = 0;
    } else if (sdl_keycode == DBGUI_KEY_ESCAPE) {
      g_editing = 0;
    } else if (sdl_keycode == DBGUI_KEY_BACKSPACE) {
      if (g_edit_len > 0) g_edit_buf[--g_edit_len] = 0;
    }
    return;
  }

  if (sdl_keycode == DBGUI_KEY_UP) {
    g_selected = (g_selected - 1 + g_field_count) % g_field_count;
  } else if (sdl_keycode == DBGUI_KEY_DOWN) {
    g_selected = (g_selected + 1) % g_field_count;
  } else if (sdl_keycode == DBGUI_KEY_LEFT) {
    dbgui_field_set(f, dbgui_field_get(f) - f->step);
  } else if (sdl_keycode == DBGUI_KEY_RIGHT) {
    dbgui_field_set(f, dbgui_field_get(f) + f->step);
  } else if (sdl_keycode == DBGUI_KEY_RETURN) {
    g_editing = 1;
    snprintf(g_edit_buf, sizeof(g_edit_buf), "%g", dbgui_field_get(f));
    g_edit_len = (int)strlen(g_edit_buf);
  }
}

void dbgui_feed_text(const char *utf8)
{
  if (!g_visible || !g_editing || g_field_count == 0) return;
  const char *p;
  for (p = utf8; *p; p++) {
    char c = *p;
    if ((c >= '0' && c <= '9') || c == '-' || c == '.') {
      if (g_edit_len < (int)sizeof(g_edit_buf) - 1) {
        g_edit_buf[g_edit_len++] = c;
        g_edit_buf[g_edit_len] = 0;
      }
    }
  }
}
