#ifndef HEADERS_TMAP_H
#define HEADERS_TMAP_H

/* Declarations for tmap.c: the dungeon tile map (lookup, visible-tile
 * walk/collection, per-tile emission, rasterization). Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

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
