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


void draw_text_string(char *text, short x, short y);
int measure_text_width(char *text);
undefined4 unpack_glyph_bitmap(undefined1 *out_pixels, byte *glyph_bits, short bits_per_row);
void load_font_metrics();
uint pack_word_byte(uint word, uint new_byte, int into_high_byte);
void itoa_radix(int value, undefined1 *buffer, undefined4 radix);
void init_glyph_width_table();
int get_catalog_sprite_width(int sprite_id);
void save_draw_command_cursor();
void init_draw_command_cursor();
void emit_glyph_draw_command(uint glyph_id, undefined2 value);
void finalize_glyph_draw_command(uint glyph_id);
bool select_active_font(char *font_filename);

#endif
