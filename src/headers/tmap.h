#ifndef HEADERS_TMAP_H
#define HEADERS_TMAP_H

/* Declarations for tmap.c: the dungeon tile map (lookup, visible-tile
 * walk/collection, per-tile emission, rasterization). Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

extern short g_pick_tile_off_backing[0x200];
extern undefined1 DAT_0023b676_backing[65536];

#define DAT_000a85d0 DAT_000a85d0_backing[0]
#define DAT_00086a00 (*(undefined1 *)(DAT_00086a00_region + 0x00))
#define DAT_00086a02 (*(undefined1 *)(DAT_00086a00_region + 0x02))
#define DAT_00086a20 (*(undefined1 *)(DAT_00086a00_region + 0x20))
#define DAT_00086bf0 (*(undefined1 *)DAT_00086bf0_real_table)
#define DAT_000a85d4 (*(int *)((char *)DAT_000a85d0_backing + 0x4))
#define g_current_tile ((uw_tile_t *)DAT_0023b4ec)
#define DAT_00086a18 (*(undefined1 *)(DAT_00086a00_region + 0x18))
#define DAT_00086a60 (*(undefined1 *)(DAT_00086a00_region + 0x60))

#define DAT_0023b676 DAT_0023b676_backing[0]
extern ushort DAT_00189580;
extern undefined2 DAT_00202734;
extern undefined4 DAT_0023b804;
extern ushort DAT_0023b81c;
extern ushort DAT_0023b904;
extern ushort DAT_0023b91c;
extern ushort DAT_0023b920;
extern byte DAT_0023bc88;
extern char *DAT_0023ae38;
extern char *DAT_0023ae3c;
extern byte DAT_0023b4a0;
extern undefined2 DAT_0023b848_backing[64];
#define DAT_0023b848 DAT_0023b848_backing[0]
extern undefined1 DAT_0023b8c8_backing[128];
#define DAT_0023b8c8 DAT_0023b8c8_backing[0]
#define DAT_0023b8c9 DAT_0023b8c8_backing[1]
extern undefined2 DAT_0023b8c0;
extern char DAT_0023bb94;
extern undefined1 DAT_0023bb98_backing[512];
#define DAT_0023bb98 DAT_0023bb98_backing[0]
#define DAT_0023bb99 DAT_0023bb98_backing[1]
#define DAT_0023bb9a DAT_0023bb98_backing[2]
/* Globals defined in uw.c but also used by functions that now live in
   tmap.c (the dungeon tile map) -- extern'd here so both translation
   units see the same storage. */
extern undefined4 DAT_000a85d0_backing[16384];
#define UW_A85B(o) (*(undefined1 *)((char *)DAT_000a85d0_backing + (o)))
extern const undefined1 DAT_00086a00_region[0xb0];
extern const undefined1 DAT_00086b50_region[0xa0];
#define DAT_00086b50_at(off)  (*(const undefined1 *)(DAT_00086b50_region + (off)))
#define UW_B50_LIT(addr)  ((intptr_t)(const char *)DAT_00086b50_region + ((intptr_t)(addr) - 0x86b50))
extern const unsigned char DAT_00086bf0_real_table[16];
extern undefined4 DAT_00086b20;
extern short DAT_00086b24;
extern undefined2 DAT_00086b30;
extern char DAT_00087938;
extern char * DAT_0023aecc;
extern code * DAT_0023b4d4;
extern ushort DAT_0023b4d8;
extern byte DAT_0023b4e0;
extern short DAT_0023b4e4;
extern short DAT_0023b4e8;
extern byte * DAT_0023b4ec;
extern char * DAT_0023b4f0;
extern code * DAT_0023b4f4;
extern code * DAT_0023b80c;
extern short DAT_0023b810;
extern byte * DAT_0023b814;
extern undefined1 DAT_0023b818;
extern ushort DAT_0023b81c;
extern undefined1 * DAT_0023b820;
extern undefined2 DAT_0023b824;
extern ushort DAT_0023b828;
extern char DAT_0023b834;
extern undefined4 DAT_0023b838;
extern int DAT_0023b83c;
extern int g_uw_hide_walls;
extern undefined2 DAT_0023add0_backing[8192];
#define DAT_0023add0 DAT_0023add0_backing[0]
extern undefined2 DAT_0023ae40_backing[8192];
#define DAT_0023ae40 DAT_0023ae40_backing[0]
extern undefined4 DAT_0023b804;
extern short DAT_0025063c;
extern short DAT_0025064c;
extern short DAT_002506dc;
extern ushort DAT_00189580;
extern undefined2 DAT_0023b8c0;
extern undefined2 DAT_0023bc8c;


void render_visible_tile_list();
void *get_texture_page();
void walk_visible_tiles();
void process_visible_tile_cell();
void emit_tile_objects();
void update_wall_partition_phase();
void sort_feature_pairs_by_depth();
void init_feature_sort_order();
void resolve_billboard_corner_offset();
void compute_feature_depth_key();
void flush_pending_tile_features();
void emit_tile_features();
void *tilemap_lookup();
byte tile_is_no_magic();

#endif
