#ifndef HEADERS_AUTOMAP_H
#define HEADERS_AUTOMAP_H

/* Declarations for automap.c: the automap screen (enter/exit, tile
 * grid drawing). Pulls in uw.h itself so this header is self-contained
 * for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in
   automap.c (the automap screen) -- extern'd here so both translation
   units see the same storage. */
extern undefined1 DAT_000878d0_backing[256];
#define DAT_000878d0 DAT_000878d0_backing[0]
extern undefined1 DAT_000b99d0_backing[4096];
#define DAT_000b99d0 DAT_000b99d0_backing[0]
extern undefined4 DAT_000bbef4;
extern char * DAT_002029cc;
/* decompress_rle_stream's shared codec state -- see uw.c's own
   comment at the declarations for what each field tracks. */
extern char s_fontbig_sys_0008432c[];
extern char s_font4x5p_sys_0008431c[];


void enter_automap_screen(void);
undefined4 save_automap_reveal_to_archive(undefined1 *archive, int level_number);
undefined4 load_automap_reveal_from_archive(undefined1 *archive, int level_number);
void exit_automap_screen(void);
void clear_automap_reveal_buffer(void);
void draw_automap_tiles(void);
undefined4 draw_automap_cell_edge(short edge, int x, int y);
void darken_pixel(uint x, int y, int add, int spread);
void draw_automap_cell(int cell_type, int tile_x, int tile_y);
void draw_automap_door_edge(short tile_x, short tile_y, int pixel_x, int pixel_y);
char *pick_closer_note_label(char *label_a, char *label_b, short click_x, short click_y);
void handle_automap_note_click(void);
void draw_automap_notes(void);
void save_automap_notes_to_archive(int level_number);
void load_automap_notes_from_archive(int level_number);
void draw_automap_screen(int level_number);
void switch_automap_level_display(int level_number);
void automap_reveal_all_tiles(void);
byte automap_reveal_byte(byte *tile_rec);
undefined4 debug_noop_overflow_hook(undefined4 limit, undefined4 word_count);

#endif
