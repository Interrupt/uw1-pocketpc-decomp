#include "game_fixture.h"
#include "visibility_walk_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
int visibility_ray_idx(const void *p);

unsigned char g_visibility_ray_table_backing[1024];

unsigned char g_visibility_ring_done;

char *g_visibility_ray_realptr[24];

char *g_visibility_ray_realptr2[24];

char g_visibility_ray_fallback[64];

undefined1 g_visibility_ring_buffer_backing[32768];

short g_visibility_ring_depth;

short g_visibility_max_ring_passes;

unsigned char tilemap[64 * 64 * 4];

unsigned char level_one[0x7c08];

char *DAT_002029cc;

char *DAT_0023aecc;

byte DAT_0023b4a0;

/* Recovered UU.exe data from tmap.c/automap.c. These declarations start
   with whitespace in the game sources, so the current extractor cannot
   select them; keep the original byte tables for the visibility fixture. */
const unsigned char DAT_00086a00_region[0xb0] = {
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff,
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xc0,
  0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07, 0x08,0x09,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x04,0x02,0x05,0x03,0x09,0x08, 0x06,0x07,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x05,0x04,0x03,0x02,0x07,0x06, 0x09,0x08,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x03,0x05,0x02,0x04,0x08,0x09, 0x07,0x06,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xb8, 0x98,0xb0,0x98,0xb0,0x98,0xb0,0xe4,0xc4,
  0xe4,0xc4,0xe0,0xc4,0xe4,0xcd,0xcd,0xc5, 0xc9,0xc5,0xcd,0xc5,0xd6,0xd2,0x00,0xd6,
  0x00,0xd6,0x00,0xd7,0x00,0xd3,0x00,0xd7, 0x00,0xd7,0xbc,0x9c,0xb4,0x9c,0xb4,0x9c,
  0xb4,0xbd,0x9d,0xb5,0x9d,0xb5,0x9d,0xb5, 0xbe,0x9e,0xb6,0x9e,0xb6,0x9e,0xb6,0xbf,
  0x9f,0xb7,0x9f,0xb7,0x9f,0xb7,0x00,0x00, 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};

unsigned char DAT_000878d0_backing[256] = {
  0x1e, 0x00, 0x13, 0x15, 0x0b, 0x0d, 0x20, 0x20,
  0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e,
};

undefined1 DAT_00086e6c_backing[64];

/* Same pointer-index helper as visibility.c. Its inline opening brace is
   outside the extractor's supported function layout. */
int visibility_ray_idx(const void *p) {
    intptr_t off = (intptr_t)p - (intptr_t)g_visibility_ray_table_backing;
    if (off < 0 || off + 0x15 > (intptr_t)sizeof(g_visibility_ray_table_backing))
        return VISIBILITY_RAY_SCRATCH_IDX;
    return (int)(off / 0x15);
}

void set_tile(int x, int y, int tile_type)
{
    unsigned char *rec = tilemap + (x + y * 64) * 4;
    rec[0] = (unsigned char)tile_type;
}

void set_room(int x0, int y0, int x1, int y1)
{
    for (int y = y0; y <= y1; y++) {
        for (int x = x0; x <= x1; x++) set_tile(x, y, 1); /* open floor */
    }
}

void load_real_level_one(void)
{
    uw_test_load_map(level_one, sizeof level_one, 1);
}

unsigned char ring_cell(int depth, int side)
{
    return g_visibility_ring_buffer_backing[depth * 0x42 + (side + 16) * 2];
}

int ring_cell_untouched(int depth, int side)
{
    return ring_cell(depth, side) == RING_CELL_SENTINEL;
}

void run_flood_on(const void *map, int player_x, int player_y, int facing)
{
    DAT_002029cc = (char *)map;
    memset(g_visibility_ray_table_backing, 0, sizeof(g_visibility_ray_table_backing));
    memset(g_visibility_ray_realptr, 0, sizeof(g_visibility_ray_realptr));
    memset(g_visibility_ray_realptr2, 0, sizeof(g_visibility_ray_realptr2));
    memset(g_visibility_ring_buffer_backing, 0xaa, sizeof(g_visibility_ring_buffer_backing));
    g_visibility_ring_depth = 0;

    DAT_0023b4a0 = 0; /* facing quadrant 0: identity tile-shape mapping, no view-x/y rotation */
    g_current_view->view_x = 0x80; /* centered sub-tile position within the player's own tile */
    g_current_view->view_y = 0x80;
    g_current_view->view_facing = (short)facing;
    DAT_0023aecc = (char *)tilemap_lookup(player_x, player_y);

    seed_visibility_queue();
    run_visibility_flood();
}

void run_flood(int player_x, int player_y, int facing)
{
    run_flood_on(tilemap, player_x, player_y, facing);
}

void visibility_walk_fixture_reset(void)
{
    memset(tilemap, 1, sizeof(tilemap)); /* tile_type 1 == open floor everywhere, by default */
    g_visibility_max_ring_passes = 16;
}

void visibility_walk_fixture_dispose(void) {}
