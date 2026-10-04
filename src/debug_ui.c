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
  int is_text;
  int is_toggle_action;
  double *dval;
  int *ival;
  void (*on_press)(void);
  double step;
  /* Snapshotted fresh every dbgui_field_text()/dbgui_field_toggle_
     action() call (unlike dbgui_field_toggle's own live *ival, these
     two field kinds have no persistent boolean/string debug_ui.c
     itself owns or re-reads -- the caller already resolved whatever
     value it wanted shown before calling, same as building the row
     text by hand would require anyway). toggle_display_value is only
     meaningful when is_toggle_action; text_value only when is_text. */
  char text_value[40];
  int toggle_display_value;
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
/* How many rows dbgui_draw's own background fill covered last time it
   ran -- see its own comment on why the fill has to track this instead
   of just this frame's g_field_count. */
static int g_last_rows = 0;

/* Real pixel save/restore for the panel's own screen region, so closing
   it doesn't leave stale pixels behind -- see dbgui_toggle()'s own
   comment for why dirty_rect_union alone isn't enough (the panel sits
   in the static golden-border UI chrome at the screen's top-left
   corner, outside the 3D viewport, which nothing else ever redraws;
   marking that region "dirty" just re-presents whatever's still sitting
   in the framebuffer there -- the stale panel pixels -- unless
   something first puts the REAL content back). g_uw_framebuffer is a
   320-wide (DBGUI_FB_STRIDE, confirmed via rect_fill_or_save_restore's
   own `0x140` stride in graphics.c) array of RGB565 pixels, same
   320x240 landscape logical space this whole module already draws in.
   Sized for a generous field count (12 rows), independent of
   DBGUI_MAX_FIELDS (that one's just an array-safety cap, not a
   realistic real-world panel height -- this tool has never shown more
   than 3 fields). */
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

/* Puts back the real game pixels behind the panel, then immediately
   re-saves them -- for switching the panel's own CONTENT mid-session
   (toggle panel <-> object inspector <-> texture inspector) while it
   stays open, not for closing it (dbgui_toggle already does exactly
   this restore/re-arm pair around a close/reopen). A content switch
   can shrink the panel (5-row door inspector -> 3-row texture
   inspector), and relying on the next draw's own fill to cover
   whatever the previous, taller content left behind depends on
   redraw/flush ordering elsewhere in the frame that this module
   doesn't control; stamping the known-correct real pixels back in
   directly, unconditionally, before the new content draws over them
   sidesteps that entirely regardless of what does or doesn't redraw
   this region afterward. Call this whenever the caller is about to
   switch content and the panel was already visible (not on a fresh
   open -- dbgui_toggle's own save already started it clean then). */
void dbgui_invalidate_region(void)
{
  dbgui_restore_backing();
  dbgui_save_backing();
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

/* Shared allocator for every field kind below: zeroes the whole struct
   (so a kind-specific constructor only has to set what it actually
   uses -- the repeated "zero every OTHER kind's fields by hand" shape
   this used to have was exactly how is_text almost shipped without
   dbgui_field_double/int/button/toggle clearing it) and stamps the
   name. Returns NULL once DBGUI_MAX_FIELDS is hit; every caller below
   already no-ops on NULL via the `if (!f) return;` guard. */
static DbgField *dbgui_new_field(const char *name)
{
  DbgField *f;
  if (g_field_count >= DBGUI_MAX_FIELDS) return 0;
  f = &g_fields[g_field_count++];
  memset(f, 0, sizeof(*f));
  strncpy(f->name, name, sizeof(f->name) - 1);
  f->name[sizeof(f->name) - 1] = 0;
  return f;
}

void dbgui_field_double(const char *name, double *value, double step)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->dval = value;
  f->step = step;
}

void dbgui_field_int(const char *name, int *value, int step)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_int = 1;
  f->ival = value;
  f->step = (double)step;
}

void dbgui_field_button(const char *name, void (*on_press)(void))
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_button = 1;
  f->on_press = on_press;
}

/* A read-only row, shown as "name: value" -- for displaying information
   (an object's id/type/position/...) that isn't a live editable
   setting. Selectable for keyboard-nav consistency (so arrowing past
   it doesn't skip a row), but RETURN/LEFT/RIGHT/click are all no-ops
   on it, same as a label. `value` is copied immediately (truncated to
   this field's own small buffer) -- callers that want a live-updating
   display just call this again next frame with a freshly formatted
   string, same as every other field kind being rebuilt each frame. */
void dbgui_field_text(const char *name, const char *value)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_text = 1;
  strncpy(f->text_value, value, sizeof(f->text_value) - 1);
  f->text_value[sizeof(f->text_value) - 1] = 0;
}

void dbgui_field_toggle(const char *name, int *value)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_int = 1;
  f->is_toggle = 1;
  f->ival = value;
  f->step = 1;
}

/* A toggle-styled row ("name: ON"/"name: OFF", same click/RETURN/LEFT/
   RIGHT dispatch as dbgui_field_toggle) for a boolean that's really a
   COMPUTED property with a genuine action behind changing it, not a
   plain in-memory flag to flip -- e.g. a door's locked state: "locked"
   is re-derived fresh every frame from the door's own link chain, and
   the only real way to change it is to run the actual unlock action,
   not just flip a bit somewhere. `value` is the state to display THIS
   frame (the caller already computed it, same as dbgui_field_text's
   own value); on_toggle is called on activation and decides what (if
   anything) really happens -- if it does nothing, or the underlying
   state genuinely can't go the other way (there's no real "re-lock a
   door" action in this game to call, for instance), the row just shows
   the same value again next frame, same as any other field whose
   caller declines to change its bound value. */
void dbgui_field_toggle_action(const char *name, int value, void (*on_toggle)(void))
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_toggle_action = 1;
  f->toggle_display_value = value;
  f->on_press = on_toggle;
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

  /* The background fill below covers max(this frame's rows, last
     frame's rows), not just this frame's -- the panel can legitimately
     get SHORTER between one frame and the next now (toggle panel ->
     object/texture inspector, 4 rows -> 3), and without this the newly
     -uncovered row(s) from the taller previous panel are never
     repainted by anything (this fill is the only thing that ever
     touches that screen region -- see dbgui_toggle's own save/restore
     comment), so their old text just sits there as a stale ghost row
     forever. Confirmed live: picking a wall left a leftover
     "pick_diag:" row below the 3-row Texture Inspector's own "desc"
     row. Shrinks to the real size cleanly one frame later once
     g_last_rows itself catches down to g_field_count. */
  int fill_rows = g_field_count > g_last_rows ? g_field_count : g_last_rows;
  int panel_h = DBGUI_ROW_H * (fill_rows + 1) + 4;
  int x0 = DBGUI_PANEL_X, y0 = DBGUI_PANEL_Y;
  int x1 = x0 + DBGUI_PANEL_W, y1 = y0 + panel_h;
  g_last_rows = g_field_count;

  if (getenv("UW_DEBUG_DBGUI"))
    fprintf(stderr, "[dbgui] draw field_count=%d panel y0=%d y1=%d clip=(%d,%d)-(%d,%d)\n",
            g_field_count, y0, y1,
            (int)(short)DAT_000a85c4, (int)(short)DAT_000a85c8,
            (int)(short)DAT_000842a4, (int)(short)DAT_000842a8);

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
      /* Palette index 0 -- confirmed real black elsewhere in this file
         (g_transparent_screen_color's own comment: "framebuffer pixel
         value 0x0000, pure black"), unlike 0x1a/0x60 which are real but
         unconfirmed-by-eye colors this session was guessing at. */
      set_draw_color(0);
      rect_fill_or_save_restore(x0 + 1, ry - 1, x1 - 1, ry + DBGUI_ROW_H - 2);
    }
    char line[64];
    if (f->is_button) {
      snprintf(line, sizeof(line), "[ %s ]", f->name);
    } else if (f->is_text) {
      snprintf(line, sizeof(line), "%s: %s", f->name, f->text_value);
    } else if (f->is_toggle) {
      snprintf(line, sizeof(line), "%s: %s", f->name, *f->ival ? "ON" : "OFF");
    } else if (f->is_toggle_action) {
      snprintf(line, sizeof(line), "%s: %s", f->name, f->toggle_display_value ? "ON" : "OFF");
    } else if (g_editing && i == g_selected) {
      snprintf(line, sizeof(line), "%s: %s_", f->name, g_edit_buf);
    } else {
      snprintf(line, sizeof(line), "%s: %g", f->name, dbgui_field_get(f));
    }
    /* Clip to the panel's own real pixel width (measure_text_width is
       the same per-glyph metric draw_text_string itself uses -- a
       variable-width font, so a fixed character-count budget silently
       runs long or short depending on which letters show up). Without
       this, a row that overflows DBGUI_PANEL_W just draws straight
       through it into whatever's behind the panel (the 3D view, other
       HUD chrome) with no visible boundary -- confirmed live with the
       object inspector's "type: a_door" row, legible edge sitting well
       short of the full string before this fix. Toggle rows ("name:
       ON"/"OFF") have stayed short by convention and were never
       actually hitting this, but any row can in principle. */
    { int _maxw = (x1 - 3) - (x0 + 3);
      int _len = (int)strlen(line);
      while (_len > 0 && measure_text_width(line) > _maxw) {
        line[--_len] = 0;
      }
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
  /* Closing the panel stops it from drawing (dbgui_draw's own
     `if (!g_visible ...) return`), but the panel sits in the static
     golden-border UI chrome at the screen's top-left corner, outside
     the 3D viewport -- nothing else ever redraws that region, so once
     the panel itself stops painting it, its last real pixels just sit
     in the framebuffer as stale leftovers forever (marking the region
     "dirty" alone isn't enough: that only controls whether the PRESENT
     step includes it, and re-presenting stale framebuffer content
     changes nothing on screen). Real save/restore instead: capture
     what's actually there the moment the panel opens (before it draws
     over anything), put it back the moment it closes, then mark that
     region dirty so the restored pixels actually reach the display. */
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
  if (getenv("UW_DEBUG_DBGUI")) {
    fprintf(stderr, "[dbgui] feed_mouse_down lx=%d ly=%d field_count=%d\n", lx, ly, g_field_count);
    for (i = 0; i < g_field_count; i++)
      fprintf(stderr, "[dbgui]   field[%d] name=%s row_y=%d\n", i, g_fields[i].name, g_fields[i].row_y);
  }
  for (i = 0; i < g_field_count; i++) {
    DbgField *f = &g_fields[i];
    if (ly >= f->row_y - 1 && ly < f->row_y + DBGUI_ROW_H - 2 &&
        lx >= DBGUI_PANEL_X + 1 && lx < DBGUI_PANEL_X + DBGUI_PANEL_W - 1) {
      g_selected = i;
      if (f->is_button) {
        if (f->on_press) f->on_press();
        return;
      }
      if (f->is_text) return;
      if (f->is_toggle) {
        *f->ival = !*f->ival;
        if (getenv("UW_DEBUG_DBGUI"))
          fprintf(stderr, "[dbgui]   toggled field[%d] %s -> %d\n", i, f->name, *f->ival);
        return;
      }
      if (f->is_toggle_action) {
        if (f->on_press) f->on_press();
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
    int before = g_selected;
    g_selected = (g_selected - 1 + g_field_count) % g_field_count;
    if (getenv("UW_DEBUG_DBGUI"))
      fprintf(stderr, "[dbgui] key UP field_count=%d selected %d -> %d\n", g_field_count, before, g_selected);
  } else if (sdl_keycode == DBGUI_KEY_DOWN) {
    int before = g_selected;
    g_selected = (g_selected + 1) % g_field_count;
    if (getenv("UW_DEBUG_DBGUI"))
      fprintf(stderr, "[dbgui] key DOWN field_count=%d selected %d -> %d\n", g_field_count, before, g_selected);
  } else if (f->is_button) {
    if (sdl_keycode == DBGUI_KEY_RETURN && f->on_press) f->on_press();
  } else if (f->is_text) {
    /* read-only: UP/DOWN already handled above, everything else is a no-op */
  } else if (f->is_toggle) {
    if (sdl_keycode == DBGUI_KEY_RETURN || sdl_keycode == DBGUI_KEY_LEFT || sdl_keycode == DBGUI_KEY_RIGHT)
      *f->ival = !*f->ival;
  } else if (f->is_toggle_action) {
    if (sdl_keycode == DBGUI_KEY_RETURN || sdl_keycode == DBGUI_KEY_LEFT || sdl_keycode == DBGUI_KEY_RIGHT) {
      if (f->on_press) f->on_press();
    }
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

void dbgui_test_reset(void)
{
  g_field_count = 0;
  g_selected = 0;
  g_editing = 0;
  g_edit_len = 0;
  g_visible = 0;
  g_saved_valid = 0;
  g_last_rows = 0;
}

int dbgui_test_row_x(void) { return DBGUI_PANEL_X + 1; }

int dbgui_test_row_y(int field_index)
{
  if (field_index < 0 || field_index >= g_field_count) return -1;
  return g_fields[field_index].row_y;
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
