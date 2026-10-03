#ifndef HEADERS_BITMAP_H
#define HEADERS_BITMAP_H

/* Declarations for bitmap.c: sprite blitting and the sprite-list
 * system. Pulls in uw.h itself so this header is self-contained for
 * any caller. */
#include "uw.h"

void blit_raw_sprite_clipped();
void blit_sprite_row_remapped();
undefined4 decode_tile_object_billboard_texture();
void *lookup_grtile_by_id();
void blit_object_sprite_by_frame();
uint resolve_sprite_id_to_frame();
void draw_sprite_by_id();
void sprite_list_flush_blit_raw();
void sprite_partition_step();
void sprite_partition_tmap();
void sprite_partition_by_depth();
void sprite_list_queue_slot_redraw();
int sprite_list_alloc_entry();
int sprite_list_alloc_raw_entry();
undefined4 sprite_list_set_rect();
undefined4 sprite_list_set_position();
undefined4 sprite_list_set_frame_id();
undefined4 sprite_list_set_frame_id_transparent();
undefined4 sprite_list_set_lifetime();

#endif
