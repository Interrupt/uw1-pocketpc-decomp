#ifndef HEADERS_GRAPHICS_H
#define HEADERS_GRAPHICS_H

/* Declarations for graphics.c: low-level pixel-primitive functions (color state, rect
   fill/save/restore, paletted-bitmap blitting into the game's internal software framebuffer). Pulls
   in uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in graphics.c
   (bitmap_blit_to_framebuffer, rect_fill_or_save_restore, set_draw_color) -- extern'd here so both
   translation units see the same storage. */
extern void *g_uw_framebuffer;
/* 256-entry palette -> RGB565 lookup table (rebuilt by build_rgb565_palette on every palette load).
   Real binary size is 256 shorts at 0x0024ad60; over-allocated here as a safety margin. Indexed as
   `(&g_palette_rgb565)[palette_index]`. g_transparent_screen_color (uw.c) aliases entry 26. */
extern undefined2 g_palette_rgb565_backing[32768];

/* Globals defined in uw.c but also used by functions that now live in
   graphics.c (screen_backup_save/restore/restore_rect) -- extern'd here so
   both translation units see the same storage. */
#define g_transparent_screen_color (*(short *)&g_palette_rgb565_backing[26])

#define g_palette_rgb565 g_palette_rgb565_backing[0]
extern undefined2 DAT_000a85c0;
extern undefined2 DAT_000a85c4;
extern undefined2 DAT_000a85c8;
extern undefined2 DAT_000842a4;
extern undefined2 DAT_000842a8;
extern int DAT_00204848;
extern int g_blit_transparent_mode;
/* Globals defined in uw.c but also used by functions that now live in graphics.c
   (expand_pals_bytes, build_rgb565_palette, palette_cycle_range) -- extern'd here so both
   translation units see the same storage. */
extern int DAT_0024af70;
extern undefined2 DAT_00242010_backing[12800];
#define DAT_00242010 DAT_00242010_backing[0]
extern undefined2 DAT_00248418_backing[20 * 256];
#define DAT_00248418 DAT_00248418_backing[0]
extern void * DAT_0023c430;


void set_draw_color();
void rect_fill_or_save_restore();
void bitmap_blit_to_framebuffer();

undefined4 screen_backup_save();
void screen_backup_restore();
void screen_backup_restore_rect();
void draw_horizontal_line();
void fill_viewport_and_flush();
void blit_bitmap_to_framebuffer_clipped();
void fade_in(ushort *framebuffer, char *palette, int palette_flag);
void fade_out(ushort *framebuffer, char *palette, int palette_flag);
void copy_framebuffer_rect();
void flush_dungeon_frame();
void reset_viewport_to_fullscreen();
undefined4 render_dungeon_view();
undefined8 compute_view_y_bound();
void build_shade_lut();
void set_ambient_bias_with_light();
void set_ambient_bias_without_light();
void expand_pals_bytes();
void build_rgb565_palette();
void end_gx_draw_session();
void palette_cycle_range();
void convert_palette_bgrx_to_rgb();
void tick_book_illustration_palette_cycles();
undefined4 load_bmp_resource_to_rgb565();
void clear_screen_and_restore_cursor();
void apply_palette_buffer();
void fade_active_palette_to_black();
undefined4 blit_fullscreen_bitmap_file();
undefined4 blit_framebuffer_to_gx_display();
void reinstall_active_palette();
void plot_pixel();

#endif
