#ifndef HEADERS_3D_H
#define HEADERS_3D_H

/* Declarations for 3d.c: the 3D transform/rasterization pipeline (vertex math, view matrix, camera
   transform/projection, near-plane clipping, triangle rasterizer). Pulls in uw.h itself so this
   header is self-contained for any caller. */
#include "uw.h"

extern void * g_tile_texptr_emit[UW_MAX_VIS_TILES];
extern void * g_tile_texptr_out[UW_MAX_VIS_TILES];
extern char DAT_000842b0;
extern undefined4 DAT_000b5638_backing[160];

#define DAT_000d9930 (DAT_000d9930_arr[0])
#define DAT_000d9ed8 (DAT_000d9ed8_arr[0])

#define DAT_000b5638 DAT_000b5638_backing[0]
extern void * DAT_000c4838_backing[4096];
#define DAT_000c4838 DAT_000c4838_backing[0]
extern int DAT_000c8c98;
extern undefined2 DAT_000da47c;
extern undefined4 DAT_000db438;
extern undefined4 DAT_000db43c;
extern undefined4 DAT_000db440;
extern int DAT_000db448;
extern int DAT_000db44c;
extern char DAT_0023b830;
extern undefined4 DAT_000d9930_arr[361];
extern undefined4 DAT_000d9ed8_arr[361];


void set_viewport_clip_rect(undefined2 left, undefined2 top, undefined2 right, undefined2 bottom);
void multiply_matrix4x4(undefined4 *a, undefined4 *b, undefined4 *out);
void set_identity_matrix4x4(undefined4 *matrix);
void copy_matrix4x4(undefined4 *source, undefined4 *dest);
void raster_triangle(undefined4 stride, void *buffer, undefined4 *vertices, undefined4 surface, undefined4 width, undefined4 size, intptr_t texture, int *clip);
void vec3_sub(undefined4 *a, undefined4 *b, undefined1 *out);
void vec3_cross(undefined4 *a, undefined4 *b, undefined1 *out);
int raster_edge_step(intptr_t edge);
void raster_triangle_perspective_setup(undefined4 *triangle, undefined4 *coefficients);
void raster_edge_setup(intptr_t coefficients, intptr_t vertices, int vertex_a, int vertex_b, int row_limit, undefined4 *edge);
void raster_textured_span(int row, intptr_t framebuffer, intptr_t gradients, intptr_t left_edge, intptr_t right_edge, int texture_stride, int texture_size, intptr_t texture_pixels, int *depth_limit, byte shade);
void build_trig_tables(void);
void build_view_matrix(void);
void translate_verts_to_camera_space(int *vertex_list);
void project_verts_through_view_matrix(int *vertex_list);
void build_euler_rotation_matrix(int *matrix, int angle_x, int angle_y, int angle_z);
void transform_points_by_matrix(int *matrix, int *points);
void near_clip_visible_tiles(intptr_t tile_list, int clip_mode);
void load_dungeon_texture_arenas(void);
void configure_dungeon_viewport(int x, int y, int width, int height);
void init_dungeon_rendering(void);
void render_dungeon_view_frame(void);
void configure_texture_detail_functions(void);
void emit_flat_wall_texture_select(byte *tile_record, uint depth_shade, ushort texture_index);
void emit_flat_floor_texture_select(byte *tile_record, uint depth_shade, uint texture_index);
void emit_flat_diagonal_texture_select(byte *tile_record, uint depth_shade, undefined4 unused, ushort texture_index);
void emit_floor_texture_select(byte *tile_record, uint depth, short texture_index);
void emit_diagonal_wall_texture_select(byte *tile_record, uint depth, uint orientation, ushort texture_index);

#endif
