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


void set_viewport_clip_rect(short left, short top, short right, short bottom);
void multiply_matrix4x4(void *a, void *b, void *out);
void set_identity_matrix4x4(void *matrix);
void copy_matrix4x4(uint *source, uint *dest);
void raster_triangle(int stride, void *buffer, uint *vertices, int surface, int width, int size, char *texture, int *clip);
void vec3_sub(void *a, void *b, byte *out);
void vec3_cross(void *a, void *b, byte *out);
int raster_edge_step(char *edge);
void raster_triangle_perspective_setup(uint *triangle, void *coefficients);
void raster_edge_setup(char *coefficients, char *vertices, int vertex_a, int vertex_b, int row_limit, void *edge);
/* Extra lights (--extralights): up to UW_MAX_EXTRA_LIGHTS small point lights (campfires, magic
   projectiles, ...) added to the player's light when pixels are shaded. World positions are in the
   3D vertex arrays' x / height / y order; `eye` is filled in by extra_lights_transform_to_eye in the
   span rasterizer's distance units. */
#define UW_MAX_EXTRA_LIGHTS 8
typedef struct {
  float world[3];
  float eye[3];
  float radius;    /* world units; 256 per tile */
  float intensity; /* peak brightness, 0..1 */
} uw_extra_light_t;
typedef struct {
  unsigned short first_id, last_id; /* object id range that is this kind of light */
  float radius, intensity, rise;
} uw_extra_light_source_t;
extern const uw_extra_light_source_t g_extra_light_sources[];
extern uw_extra_light_t g_extra_lights[UW_MAX_EXTRA_LIGHTS];
extern int g_extra_light_count;
void extra_lights_reset(void);
int extra_light_add(float world_x, float world_height, float world_y, float radius, float intensity);
void extra_lights_consider_object(unsigned int object_id, int world_x, int world_y, int world_z);
void extra_lights_transform_to_eye(void);
unsigned short shade_span_pixel(byte texel, int depth, double ray_x, double ray_y, int dither_offset,
                                bool dos_light_mode, bool fullbright_enabled);
void update_fullbright_palette_mask();
extern unsigned char g_fullbright_palette_mask[256];
void raster_textured_span(int row, char *framebuffer, char *gradients, char *left_edge, char *right_edge, int texture_stride, int texture_size, char *texture_pixels, int *depth_limit, byte shade);
void build_trig_tables();
void build_view_matrix();
void translate_verts_to_camera_space(int *vertex_list);
void project_verts_through_view_matrix(int *vertex_list);
void build_euler_rotation_matrix(void *matrix, int angle_x, int angle_y, int angle_z);
void transform_points_by_matrix(int *matrix, void *points);
void near_clip_visible_tiles(void *tile_list, int clip_mode);
void load_dungeon_texture_arenas();
void configure_dungeon_viewport(int x, int y, int width, int height);
void init_dungeon_rendering();
void render_dungeon_view_frame();
void configure_texture_detail_functions();
void emit_flat_wall_texture_select(byte *tile_record, uint depth_shade, ushort texture_index);
void emit_flat_floor_texture_select(byte *tile_record, uint depth_shade, uint texture_index);
void emit_flat_diagonal_texture_select(byte *tile_record, uint depth_shade, int unused, ushort texture_index);
void emit_floor_texture_select(byte *tile_record, uint depth, short texture_index);
void emit_diagonal_wall_texture_select(byte *tile_record, uint depth, uint orientation, ushort texture_index);

#endif
