#ifndef HEADERS_TEXT_H
#define HEADERS_TEXT_H

/* Declarations for text.c: text/font rendering (draw, measure, glyph
 * unpack, metrics). Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

extern char *DAT_00110fc8;
/* Globals defined in uw.c but also used by functions that now live in
   text.c (text/font rendering) -- extern'd here so both translation
   units see the same storage. */
extern undefined2 g_text_flat_color;


void draw_text_string();
int measure_text_width();
undefined4 unpack_glyph_bitmap();
void load_font_metrics();
uint pack_word_byte();
void itoa_radix();
void init_glyph_width_table();
int get_catalog_sprite_width();
void save_draw_command_cursor();
void init_draw_command_cursor();
void emit_glyph_draw_command();
void finalize_glyph_draw_command();
bool select_active_font();

#endif
