#ifndef HEADERS_GRAPHICS_H
#define HEADERS_GRAPHICS_H

/* Declarations for graphics.c: low-level pixel-primitive functions
 * (color state, rect fill/save/restore, paletted-bitmap blitting into
 * the game's internal software framebuffer). Pulls in uw.h itself so
 * this header is self-contained for any caller. */
#include "uw.h"

void set_draw_color();
void rect_fill_or_save_restore();
void bitmap_blit_to_framebuffer();

undefined4 screen_backup_save();
void screen_backup_restore();
void screen_backup_restore_rect();
void draw_horizontal_line();
void fill_viewport_and_flush();
void blit_bitmap_to_framebuffer_clipped();
void fade_in();
void fade_out();
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
