#include "unity.h"
#include "../src/headers/uw.h"
#include <string.h>

/* Exercises the real dungeon-render visibility flood (seed_visibility_queue
 * + run_visibility_flood, src/visibility.c) against a synthetic tilemap,
 * bypassing build_frame_draw_list/rebuild_dungeon_view's HUD-drawing and
 * player-object plumbing: this test sets the flood's own real inputs
 * (DAT_0023aecc, g_current_view, DAT_0023b4a0) directly, then inspects its
 * real output buffer (g_visibility_ring_buffer) for which tiles got
 * marked visible. See each test's own comment for the ring-buffer
 * row/column mapping, confirmed empirically against this file's probes. */

/* --- real-pointer side tables and the ray record array (file-static in
   visibility.c; see tests/visibility_walk_test_globals.h) --- */
unsigned char g_visibility_ray_table_backing[1024];
unsigned char g_visibility_ring_done;
char *g_visibility_ray_realptr[24];
char *g_visibility_ray_realptr2[24];
char g_visibility_ray_fallback[64];

/* --- globals visibility.h already externs; real storage lives in
   visibility.c, which this test never links -- provide it directly. --- */
undefined1 g_visibility_ring_buffer_backing[32768];
short g_visibility_ring_depth;
short g_visibility_max_ring_passes;

/* --- tilemap_lookup's backing store (tmap.c owns the real one via
   ce_malloc; this test supplies its own fixed 64x64 buffer). --- */
static unsigned char tilemap[64 * 64 * 4];
char *DAT_002029cc;
char *DAT_0023aecc;
byte DAT_0023b4a0;

/* Both copied verbatim from their real declarations (src/tmap.c,
   src/automap.c) -- extract_functions.py's @name extraction requires
   the declaration to start at column 0, and both of these start with a
   stray leading space in the original source (the same long-standing
   quirk tracked elsewhere in this codebase), so the tool can't pull
   them out automatically. Real recovered UU.exe .data, not re-derived. */
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

/* --- camera/view record (uw.h: uw_current_view_t); g_current_view is a
   macro over this backing array (src/headers/bitmap.h). --- */
undefined1 DAT_00086e6c_backing[64];

/* Hand-written (not decompiled) helper, copied verbatim from
   visibility.c -- extract_functions.py's extraction regex expects the
   K&R opening-brace-on-its-own-line style every decompiled function in
   this codebase uses, which this ANSI one-liner isn't. */
int visibility_ray_idx(const void *p) {
    intptr_t off = (intptr_t)p - (intptr_t)g_visibility_ray_table_backing;
    if (off < 0 || off + 0x15 > (intptr_t)sizeof(g_visibility_ray_table_backing))
        return VISIBILITY_RAY_SCRATCH_IDX;
    return (int)(off / 0x15);
}

divmod_result ordint_divmod(int divisor, int dividend)
{
    divmod_result r = { dividend / divisor, dividend % divisor };
    return r;
}

static void set_tile(int x, int y, int tile_type)
{
    unsigned char *rec = tilemap + (x + y * 64) * 4;
    rec[0] = (unsigned char)tile_type;
}

/* Ring-buffer cell for ring depth `depth` (0 = player's own row, growing
   away from the player -- for facing 0, player Y + depth) and lateral
   offset `side` (-16..16, 0 = straight ahead -- for facing 0, player X +
   side). 0x42=66 byte stride per row, 2 bytes per column, column 0 at
   byte offset 0x20=32 i.e. index 16 of 33. A nonzero byte means visible
   this pass (matches process_visible_tile_cell's own `bVar25 != 0`
   check); confirmed empirically via this file's own probes, not
   hand-derived from the ray-flood's packed-record math. */
static unsigned char ring_cell(int depth, int side)
{
    return g_visibility_ring_buffer_backing[depth * 0x42 + (side + 16) * 2];
}

static void run_flood(int player_x, int player_y, int facing)
{
    DAT_002029cc = (char *)tilemap;
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

void setUp(void)
{
    memset(tilemap, 1, sizeof(tilemap)); /* tile_type 1 == open floor everywhere, by default */
    g_visibility_max_ring_passes = 16;
}
void tearDown(void) {}

static void test_open_room_reveals_the_player_and_tiles_ahead(void)
{
    run_flood(32, 32, 0);

    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(0, g_visibility_ring_depth,
        "expected the flood to expand past the player's own row in an open room");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(0, 0),
        "the player's own tile should be visible");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(1, 0),
        "the open tile straight ahead should be visible");
}

static void test_wall_blocks_tiles_behind_it(void)
{
    /* A full-width wall row 4 tiles straight ahead of the player at
       (32,32) -- wide enough that no diagonal path through a
       neighboring open tile can route around it (a single 1-tile wall
       in an open room legitimately doesn't block every ray to the
       tiles behind it, since the player can see around a lone
       obstacle; this is a real wall spanning the whole reachable
       width at that depth, confirmed empirically against this exact
       setup: the flood's own ring_depth stops at 3, one row short of
       the wall, every time). */
    for (int x = 10; x <= 54; x++) set_tile(x, 36, 0);
    run_flood(32, 32, 0);

    TEST_ASSERT_EQUAL_INT_MESSAGE(3, g_visibility_ring_depth,
        "the flood should stop one row short of a full wall, not walk through it");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(3, 0),
        "the open tile just short of the wall should still be visible");
}

static void test_flood_does_not_exceed_the_level_max_ring_passes(void)
{
    /* Wide-open map in every direction, but capped to a small view distance. */
    g_visibility_max_ring_passes = 3;
    run_flood(32, 32, 0);

    TEST_ASSERT_EQUAL_INT_MESSAGE(g_visibility_max_ring_passes, g_visibility_ring_depth,
        "an open map's flood should expand exactly to the level's max-ring-passes limit, not walk further");
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_open_room_reveals_the_player_and_tiles_ahead);
    RUN_TEST(test_wall_blocks_tiles_behind_it);
    RUN_TEST(test_flood_does_not_exceed_the_level_max_ring_passes);
    return UNITY_END();
}
