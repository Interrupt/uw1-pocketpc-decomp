#include "geometry_fixture.h"
#include "src/headers/3d.h"

/* The real arena layout: counts at 0/4, projected vertices at 0x3008,
   input polygons at 0x4814 (0x60-byte stride). Old bytes survive a reset
   between frames, as in the game; only the current counts delimit the list. */
undefined4 DAT_000a85d0_backing[16384];
undefined4 DAT_00084608 = 0x40a00000;
int DAT_000c8c98;
void *DAT_000c4838_backing[4096];
void *g_tile_texptr_emit[UW_MAX_VIS_TILES], *g_tile_texptr_out[UW_MAX_VIS_TILES];
undefined2 DAT_000da47c;
void *g_uw_framebuffer;
undefined4 DAT_0008462c=52, DAT_00084630=19, DAT_00084634=224, DAT_00084638=132;
undefined4 DAT_00084610=100;
int geometry_triangles, geometry_surface_ids[1024];
undefined4 geometry_last_triangle[15];

void raster_triangle(undefined4 stride, void *buffer, undefined4 *vertices, undefined4 surface,
                     undefined4 width, undefined4 size, intptr_t texture, int *clip)
{
    (void)stride; (void)buffer; (void)width; (void)size; (void)texture; (void)clip;
    TEST_ASSERT_LESS_THAN_INT(1024, geometry_triangles);
    geometry_surface_ids[geometry_triangles++] = surface;
    memcpy(geometry_last_triangle, vertices, sizeof geometry_last_triangle);
}
void debug_framebuffer_dump(const char *tag) { (void)tag; }
void uw_debug_dump_3d_face(const char *tag) { (void)tag; }
int uw_debug_3d_frame_dump_finish(void) { return -1; }
const char *uw_debug_3d_frame_dump_last_dir(void) { return ""; }
int message_scroll_print_wrapped(void) { TEST_FAIL_MESSAGE("Unexpected debug message"); return 0; }

void geometry_fixture_reset(void)
{
    memset(DAT_000a85d0_backing, 0, sizeof DAT_000a85d0_backing);
    geometry_triangles = 0;
    DAT_000c8c98 = 0;
}
void geometry_fixture_wall(unsigned records, float x, float depth)
{
    TEST_ASSERT_LESS_OR_EQUAL_UINT(490, records);
    DAT_000a85d0_backing[0] = 4;
    DAT_000a85d0_backing[1] = records;
    float points[4][3] = {{x,0,depth},{x+1,0,depth},{x+1,1,depth},{x,1,depth}};
    memcpy((byte *)DAT_000a85d0_backing + 0x3008, points, sizeof points);
    for (unsigned i=0;i<records;i++) {
        int *record=(int *)((byte *)DAT_000a85d0_backing + 0x4814 + i*0x60);
        memset(record,0,0x60);
        record[0]=4;
        for (int j=0;j<4;j++) record[j+1]=j;
        record[7]=16; record[8]=16;
        record[20]=0x20+i; /* draw surface ID */
        record[22]=1;
    }
}
void geometry_fixture_render(void)
{
    geometry_triangles=0;
    near_clip_visible_tiles(0,0);
    near_clip_visible_tiles((intptr_t)DAT_000a85d0_backing,1);
    render_visible_tile_list();
}
