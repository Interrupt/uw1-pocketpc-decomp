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
/* Level 1's real block from LEV.ARK: the 64x64 tilemap (0x4000 bytes)
   plus the mobile/static object tables (test_traps.c's level_one has
   the same layout and size -- not needed here, only the tilemap
   portion is read). */
static unsigned char level_one[0x7c08];
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

static void set_room(int x0, int y0, int x1, int y1)
{
    for (int y = y0; y <= y1; y++) {
        for (int x = x0; x <= x1; x++) set_tile(x, y, 1); /* open floor */
    }
}

/* Same LEV.ARK header/offset layout test_traps.c's orb_text_trap() already
   relies on: a 6-byte archive header whose bytes 2-5 are a little-endian
   file offset to level 1's data block. */
static void load_real_level_one(void)
{
    FILE *archive = fopen(UW_TEST_DATA_DIR "/DATA/LEV.ARK", "rb");
    TEST_ASSERT_NOT_NULL_MESSAGE(archive, "data/DATA/LEV.ARK is required");
    unsigned char header[6];
    TEST_ASSERT_EQUAL_UINT(6, fread(header, 1, 6, archive));
    unsigned offset = header[2] | (unsigned)header[3] << 8 |
                       (unsigned)header[4] << 16 | (unsigned)header[5] << 24;
    TEST_ASSERT_EQUAL_INT(0, fseek(archive, offset, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(sizeof(level_one), fread(level_one, 1, sizeof(level_one), archive));
    TEST_ASSERT_EQUAL_INT(0, fclose(archive));
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

/* run_flood fills the whole ring buffer with this sentinel before the
   flood runs. A row past g_visibility_ring_depth is never visited by
   the flood at all (run_visibility_flood/merge_adjacent_visibility_rays
   only ever write into rows 0..g_visibility_ring_depth), so a cell
   still holding this exact byte proves the walk never reached it --
   stronger than just "not visible" (0), which a reached-but-occluded
   cell can also legitimately be. */
#define RING_CELL_SENTINEL 0xaa
static int ring_cell_untouched(int depth, int side)
{
    return ring_cell(depth, side) == RING_CELL_SENTINEL;
}

static void run_flood_on(const void *map, int player_x, int player_y, int facing)
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

static void run_flood(int player_x, int player_y, int facing)
{
    run_flood_on(tilemap, player_x, player_y, facing);
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
    /* Open, walkable rooms on the far side of the wall -- one straight
       ahead, one off to the side -- so this test also proves the flood
       doesn't walk INTO reachable-looking space just because it's open,
       not merely that it stops at some default depth. Both are already
       open floor by setUp's default fill; set_room just makes that
       intent explicit at this test's own coordinates. */
    set_room(28, 38, 36, 42);  /* straight ahead, depth 6-10 */
    set_room(16, 38, 22, 44);  /* off to the side, depth 6-12 */
    run_flood(32, 32, 0);

    TEST_ASSERT_EQUAL_INT_MESSAGE(3, g_visibility_ring_depth,
        "the flood should stop one row short of a full wall, not walk through it");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(3, 0),
        "the open tile just short of the wall should still be visible");

    for (int y = 38; y <= 42; y++) {
        for (int x = 28; x <= 36; x++) {
            TEST_ASSERT_TRUE_MESSAGE(ring_cell_untouched(y - 32, x - 32),
                "the open room straight ahead, beyond the wall, should never be walked");
        }
    }
    for (int y = 38; y <= 44; y++) {
        for (int x = 16; x <= 22; x++) {
            TEST_ASSERT_TRUE_MESSAGE(ring_cell_untouched(y - 32, x - 32),
                "the open room to the side, beyond the wall, should never be walked");
        }
    }
}

static void test_flood_does_not_exceed_the_level_max_ring_passes(void)
{
    /* Wide-open map in every direction, but capped to a small view distance. */
    g_visibility_max_ring_passes = 3;
    run_flood(32, 32, 0);

    TEST_ASSERT_EQUAL_INT_MESSAGE(g_visibility_max_ring_passes, g_visibility_ring_depth,
        "an open map's flood should expand exactly to the level's max-ring-passes limit, not walk further");
}

static void test_real_level_one_starting_hallway_is_contained(void)
{
    /* The actual new-game spawn point (src/game.c's prepare_new_game:
       `set_player_tile_position(0x20, 2, 1);`), facing south (+Y, this
       file's facing-0 convention) down the starting hallway. Capped to
       an 8-tile walk distance. The hallway's real per-depth open width
       (confirmed empirically against the real LEV.ARK data: a lone
       1-2 tile-wide passage from y=2 to y=7, widening at y=8-10 where
       side rooms branch off but stay mostly out of the ray fan's
       reach) is hardcoded below as [min_side,max_side] per depth --
       anything outside that range, including the real open floor in
       those side rooms and the wider room past y=8, must stay
       unrevealed. */
    static const struct { int min_side, max_side; } hallway[9] = {
        /* depth 0, y=2 */ {-1, 1},
        /* depth 1, y=3 */ {-2, 1},
        /* depth 2, y=4 */ {-1, 0},
        /* depth 3, y=5 */ {-1, 0},
        /* depth 4, y=6 */ {-1, 0},
        /* depth 5, y=7 */ {-1, 0},
        /* depth 6, y=8 */ {-2, 1},
        /* depth 7, y=9 */ {-2, 0},
        /* depth 8, y=10 */ {-2, 0},
    };

    load_real_level_one();
    g_visibility_max_ring_passes = 8;
    run_flood_on(level_one, 32, 2, 0);

    TEST_ASSERT_EQUAL_INT_MESSAGE(8, g_visibility_ring_depth,
        "the starting hallway should walk the full 8-tile distance, not stop short");

    for (int depth = 0; depth <= 8; depth++) {
        for (int side = -16; side <= 16; side++) {
            char msg[96];
            snprintf(msg, sizeof(msg), "depth=%d (y=%d) side=%d (x=%d)",
                     depth, 2 + depth, side, 32 + side);
            if (side >= hallway[depth].min_side && side <= hallway[depth].max_side) {
                TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(depth, side), msg);
            } else {
                TEST_ASSERT_EQUAL_INT_MESSAGE(0, ring_cell(depth, side), msg);
            }
        }
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_open_room_reveals_the_player_and_tiles_ahead);
    RUN_TEST(test_wall_blocks_tiles_behind_it);
    RUN_TEST(test_flood_does_not_exceed_the_level_max_ring_passes);
    RUN_TEST(test_real_level_one_starting_hallway_is_contained);
    return UNITY_END();
}
