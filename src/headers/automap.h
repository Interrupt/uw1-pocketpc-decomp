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
extern undefined1 DAT_000b99d0_backing[8192];
#define DAT_000b99d0 DAT_000b99d0_backing[0]
extern undefined4 DAT_000bbef4;
extern char * DAT_002029cc;
/* decompress_rle_stream's shared codec state -- see uw.c's own
   comment at the declarations for what each field tracks. */
extern char s_fontbig_sys_0008432c[];
extern char s_font4x5p_sys_0008431c[];


void enter_automap_screen();
undefined4 save_automap_reveal_to_archive();
undefined4 load_automap_reveal_from_archive();
void exit_automap_screen();
void clear_automap_reveal_buffer();
void draw_automap_tiles();
undefined4 draw_automap_cell_edge();
void darken_pixel();
void darken_pixel_light();
void draw_automap_cell();
void draw_automap_door_edge();
char *pick_closer_note_label();
void handle_automap_note_click();
void draw_automap_notes();
void save_automap_notes_to_archive();
void load_automap_notes_from_archive();
void draw_automap_screen();
void switch_automap_level_display();
void automap_reveal_all_tiles(void);
byte automap_reveal_byte(byte *tile_rec);
undefined4 debug_noop_overflow_hook();

#endif
