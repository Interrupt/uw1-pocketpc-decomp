#ifndef UW_TEST_VISIBILITY_WALK_FIXTURE_H
#define UW_TEST_VISIBILITY_WALK_FIXTURE_H
/* Fixture state and controlled services for reusable visibility_walk tests. */
#include "unity.h"
#include "src/headers/uw.h"
#include <string.h>
extern unsigned char g_visibility_ray_table_backing[1024];
extern unsigned char g_visibility_ring_done;
extern char *g_visibility_ray_realptr[24];
extern char *g_visibility_ray_realptr2[24];
extern char *g_visibility_ray_clearptr[24];
extern char g_visibility_ray_fallback[64];
extern undefined1 g_visibility_ring_buffer_backing[32768];
extern short g_visibility_ring_depth;
extern short g_visibility_max_ring_passes;
extern unsigned char tilemap[64 * 64 * 4];
extern unsigned char level_one[0x7c08];
extern char *DAT_002029cc;
extern char *DAT_0023aecc;
extern byte DAT_0023b4a0;
extern const unsigned char DAT_00086a00_region[0xb0];
extern unsigned char DAT_000878d0_backing[256];
extern undefined1 DAT_00086e6c_backing[64];
void set_tile(int x, int y, int tile_type);
void set_room(int x0, int y0, int x1, int y1);
void load_real_level_one(void);
unsigned char ring_cell(int depth, int side);
#define RING_CELL_SENTINEL 0xaa

int ring_cell_untouched(int depth, int side);
void repeat_flood_on(const void *map, int player_x, int player_y, int facing);
void run_flood_on(const void *map, int player_x, int player_y, int facing);
void run_flood(int player_x, int player_y, int facing);
void visibility_walk_fixture_reset(void);
void visibility_walk_fixture_dispose(void);
#endif
