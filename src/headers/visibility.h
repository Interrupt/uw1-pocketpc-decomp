#ifndef HEADERS_VISIBILITY_H
#define HEADERS_VISIBILITY_H

/* Declarations for visibility.c: texture-id list loading, the
 * visibility light grid/ray flood-fill, and the per-frame dungeon
 * redraw dispatch. Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

undefined4 reset_texture_id_lists();
bool load_level_texture_ids();
void load_texture_arena();
void load_terrain_texture_props();
void draw_command_list_rewind();
void free_frame_geometry_buffers();
void full_dungeon_redraw();
void render_dungeon_frame_timed();
undefined4 build_frame_draw_list();
void build_visibility_light_grid();
void seed_visibility_queue();
void visibility_ray_step_forward();
void visibility_ray_step_backward();
undefined4 compute_visibility_ray_offset();
undefined4 extend_visibility_ray_row();
void advance_visibility_ray();
void merge_adjacent_visibility_rays();
void run_visibility_flood();
void rebuild_dungeon_view();
void dungeon_view_prepass_stub();
void load_floor_texture_arenas();
void load_shading_level_config();
void load_light_tables();

#endif
