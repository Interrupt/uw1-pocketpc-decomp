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
extern undefined1 DAT_000842ac_backing[32];

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


void blit_raw_sprite_clipped(short x, short y, char *pixels, short height, short width, short src_x, short src_y, int transparent);
void blit_sprite_row_remapped(int unused, uint pixel, uint remap_index, uint shade);
int decode_tile_object_billboard_texture(short frame, uint unused);
void *lookup_grtile_by_id(short grtile_id);
void blit_object_sprite_by_frame(short frame, int x, int y, int width, int height);
uint resolve_sprite_id_to_frame(int sprite_id);
void draw_sprite_by_id(int sprite_id, int x, int y, int width, short height);
void sprite_list_flush_blit_raw(int sprite_id, int x, int y, short clip_top, short width, short clip_rows);
void sprite_partition_step(int condition, short *out_index, short entry_value, short low, short high, short phase);
void sprite_partition_tmap(int entry_index, short *out_index, int extra);
void sprite_partition_by_depth(int entry_index, short *out_index, int extra);
void sprite_list_queue_slot_redraw(ushort slot);
int sprite_list_alloc_entry(int resource_id);
int sprite_list_alloc_raw_entry(int resource_id, int alloc_arg, int pixel_count);
int sprite_list_set_rect(short slot, int x, int y, int width, short height);
int sprite_list_set_position(short slot, int x, int y);
int sprite_list_set_frame_id(short slot, int frame_id);
int sprite_list_set_frame_id_transparent(short slot, int frame_id);
int sprite_list_set_lifetime(short slot, int lifetime);

#endif
