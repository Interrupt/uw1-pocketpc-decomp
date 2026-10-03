#ifndef HEADERS_AUTOMAP_H
#define HEADERS_AUTOMAP_H

/* Declarations for automap.c: the automap screen (enter/exit, tile
 * grid drawing). Pulls in uw.h itself so this header is self-contained
 * for any caller. */
#include "uw.h"

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
