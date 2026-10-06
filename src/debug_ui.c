/* Minimal immediate-mode debug GUI -- see headers/debug_ui.h for the usage contract. */
#include "headers/debug_ui.h"
#include "headers/uw.h"
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
  int is_button;
  int is_toggle;
  double *dval;
  int *ival;
  void (*on_press)(void);
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

/* Real pixel save/restore for the panel's own screen region, so closing it doesn't leave stale
   pixels behind -- see dbgui_toggle()'s own comment for why dirty_rect_union alone isn't enough... */
#define DBGUI_FB_STRIDE 320
#define DBGUI_FB_HEIGHT 240
#define DBGUI_SAVE_ROWS 12
#define DBGUI_SAVE_H (DBGUI_ROW_H * (DBGUI_SAVE_ROWS + 1) + 4)
static unsigned short g_saved_px[DBGUI_PANEL_W * DBGUI_SAVE_H];
static int g_saved_valid = 0;

static void dbgui_save_backing(void)
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int y;
  if (!fb) return;
  for (y = 0; y < DBGUI_SAVE_H; y++) {
    int fy = DBGUI_PANEL_Y + y;
    if (fy < 0 || fy >= DBGUI_FB_HEIGHT) continue;
    memcpy(&g_saved_px[y * DBGUI_PANEL_W], &fb[fy * DBGUI_FB_STRIDE + DBGUI_PANEL_X],
           DBGUI_PANEL_W * sizeof(unsigned short));
  }
  g_saved_valid = 1;
}

static void dbgui_restore_backing(void)
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int y;
  if (!fb || !g_saved_valid) return;
  for (y = 0; y < DBGUI_SAVE_H; y++) {
    int fy = DBGUI_PANEL_Y + y;
    if (fy < 0 || fy >= DBGUI_FB_HEIGHT) continue;
    memcpy(&fb[fy * DBGUI_FB_STRIDE + DBGUI_PANEL_X], &g_saved_px[y * DBGUI_PANEL_W],
           DBGUI_PANEL_W * sizeof(unsigned short));
  }
  dirty_rect_union(DBGUI_PANEL_X, DBGUI_PANEL_X + DBGUI_PANEL_W,
                    DBGUI_PANEL_Y, DBGUI_PANEL_Y + DBGUI_SAVE_H);
  g_saved_valid = 0;
}

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
  f->is_button = 0;
  f->is_toggle = 0;
  f->dval = dval;
  f->ival = ival;
  f->on_press = 0;
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

void dbgui_field_button(const char *name, void (*on_press)(void))
{
  if (g_field_count >= DBGUI_MAX_FIELDS) return;
  DbgField *f = &g_fields[g_field_count++];
  strncpy(f->name, name, sizeof(f->name) - 1);
  f->name[sizeof(f->name) - 1] = 0;
  f->is_int = 0;
  f->is_button = 1;
  f->is_toggle = 0;
  f->dval = 0;
  f->ival = 0;
  f->on_press = on_press;
  f->step = 0;
}

void dbgui_field_toggle(const char *name, int *value)
{
  if (g_field_count >= DBGUI_MAX_FIELDS) return;
  DbgField *f = &g_fields[g_field_count++];
  strncpy(f->name, name, sizeof(f->name) - 1);
  f->name[sizeof(f->name) - 1] = 0;
  f->is_int = 1;
  f->is_button = 0;
  f->is_toggle = 1;
  f->dval = 0;
  f->ival = value;
  f->on_press = 0;
  f->step = 1;
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
  /* Deliberately does NOT draw -- see dbgui_draw()'s own comment for why drawing has to happen
     later in the frame than this is called. */
  if (g_field_count == 0) return;
  if (g_selected >= g_field_count) g_selected = g_field_count - 1;
  if (g_selected < 0) g_selected = 0;
}

void dbgui_draw(void)
{
  /* Called once per frame from app_main_loop, AFTER main_loop_hud_flush() -- i.e. after the 3D view
     and every other HUD element for this frame have already drawn into the shared software
     framebuffer. */
  if (!g_visible || g_field_count == 0) return;

  int panel_h = DBGUI_ROW_H * (g_field_count + 1) + 4;
  int x0 = DBGUI_PANEL_X, y0 = DBGUI_PANEL_Y;
  int x1 = x0 + DBGUI_PANEL_W, y1 = y0 + panel_h;

  /* Text color: draw_text_string does NOT use set_draw_color's palette index (confirmed by reading
     its own body, uw.c ~5826-5834) -- it honours g_text_flat_color (a direct RGB565 value) unless a
     caller separately sets g_text_use_palette_color=1 AND *g_draw_color_index. */
  g_text_use_palette_color = 0;
  g_text_flat_color = (unsigned short)0xffff;

  /* Panel/row fill colors ARE real palette indices (rect_fill_or_save_ restore's FILL path reads
     g_palette_rgb565[DAT_000a85c0] directly, graphics.c ~170-176) -- 0x1a is confirmed elsewhere in
     this file as a real, already-used UI panel background (chargen's own panels)... */
  set_draw_color(0x1a);
  rect_fill_or_save_restore(x0, y0, x1, y1);
  draw_text_string(g_title, x0 + 3, y0 + 2);

  int i;
  for (i = 0; i < g_field_count; i++) {
    DbgField *f = &g_fields[i];
    int ry = y0 + DBGUI_ROW_H * (i + 1) + 2;
    f->row_y = ry;
    if (i == g_selected) {
      /* Palette index 0 -- confirmed real black elsewhere in this file
         (g_transparent_screen_color's own comment: "framebuffer pixel value 0x0000, pure black"),
         unlike 0x1a/0x60 which are real but unconfirmed-by-eye colors this session was guessing at. */
      set_draw_color(0);
      rect_fill_or_save_restore(x0 + 1, ry - 1, x1 - 1, ry + DBGUI_ROW_H - 2);
    }
    char line[64];
    if (f->is_button) {
      snprintf(line, sizeof(line), "[ %s ]", f->name);
    } else if (f->is_toggle) {
      snprintf(line, sizeof(line), "%s: %s", f->name, *f->ival ? "ON" : "OFF");
    } else if (g_editing && i == g_selected) {
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
  int was_visible = g_visible;
  g_visible = !g_visible;
  g_editing = 0;
  /* Closing the panel stops it from drawing (dbgui_draw's own `if (!g_visible ...) return`), but
     the panel sits in the static golden-border UI chrome at the screen's top-left corner, outside
     the 3D viewport -- nothing else ever redraws that region... */
  if (g_visible && !was_visible) {
    dbgui_save_backing();
  } else if (!g_visible && was_visible) {
    dbgui_restore_backing();
  }
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
      if (f->is_button) {
        if (f->on_press) f->on_press();
        return;
      }
      if (f->is_toggle) {
        *f->ival = !*f->ival;
        return;
      }
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
  } else if (f->is_button) {
    if (sdl_keycode == DBGUI_KEY_RETURN && f->on_press) f->on_press();
  } else if (f->is_toggle) {
    if (sdl_keycode == DBGUI_KEY_RETURN || sdl_keycode == DBGUI_KEY_LEFT || sdl_keycode == DBGUI_KEY_RIGHT)
      *f->ival = !*f->ival;
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
