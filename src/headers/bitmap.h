#ifndef HEADERS_BITMAP_H
#define HEADERS_BITMAP_H

/* Declarations for bitmap.c: sprite blitting and the sprite-list
 * system. Pulls in uw.h itself so this header is self-contained for
 * any caller. */
#include "uw.h"

#define DAT_00087638 0x8000u

/* Globals defined in uw.c but also used by functions that now live in
   bitmap.c (sprite blitting / sprite-list system) -- extern'd here so
   both translation units see the same storage. */
extern undefined1 DAT_000842ac_backing[4096];

#define g_current_view ((uw_current_view_t *)DAT_00086e6c_backing)

#define DAT_000842ac ((void *)DAT_000842ac_backing)
extern undefined1 DAT_00086e6c_backing[64];
#define DAT_00086e6c ((intptr_t)DAT_00086e6c_backing)
extern byte * DAT_000b4610;
extern char * DAT_000b4614;
extern byte * DAT_000b461c;
extern byte * DAT_000b4628;
extern byte * DAT_000b5630;
extern ushort DAT_00202738;
extern char * DAT_0023c3e4;
extern char * DAT_0023c3e8;
extern char * DAT_0023c3ec;
extern char * DAT_0023c40c;
extern undefined2 DAT_0023c41c;
extern void *g_grtile_registry[65536];
extern ushort DAT_00202730;
extern char s_lfti_000859fc[];


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
