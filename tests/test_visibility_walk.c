#include "visibility_walk_fixture.h"

void setUp(void) { visibility_walk_fixture_reset(); }
void tearDown(void) { visibility_walk_fixture_dispose(); }

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
