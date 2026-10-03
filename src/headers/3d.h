#ifndef HEADERS_3D_H
#define HEADERS_3D_H

/* Declarations for 3d.c: the 3D transform/rasterization pipeline
 * (vertex math, view matrix, camera transform/projection, near-plane
 * clipping, triangle rasterizer). Pulls in uw.h itself so this header
 * is self-contained for any caller. */
#include "uw.h"

void set_viewport_clip_rect();
void multiply_matrix4x4();
void set_identity_matrix4x4();
void copy_matrix4x4();
void raster_triangle();
void vec3_sub();
void vec3_cross();
int raster_edge_step();
void raster_triangle_perspective_setup();
void raster_edge_setup();
void raster_textured_span();
void build_trig_tables();
void build_view_matrix();
void translate_verts_to_camera_space();
void project_verts_through_view_matrix();
void build_euler_rotation_matrix();
void transform_points_by_matrix();
void near_clip_visible_tiles();
void load_dungeon_texture_arenas();
void configure_dungeon_viewport();
void init_dungeon_rendering();
void render_dungeon_view_frame();
void configure_texture_detail_functions();
void emit_flat_wall_texture_select();
void emit_flat_floor_texture_select();
void emit_flat_diagonal_texture_select();
void emit_floor_texture_select();
void emit_diagonal_wall_texture_select();

#endif
