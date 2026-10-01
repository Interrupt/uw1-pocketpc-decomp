#include "unity.h"
#include "src/headers/movement.h"

/* Tile heights and wall contact are supplied at the map-sampling boundary.
 * Step limits, collision flags, response, and heading deflection are real. */
static unsigned char movement[64];
static char response_mask[16];
char *DAT_00204874 = (char *)movement;
char *DAT_002048bc = response_mask;
unsigned char DAT_002049c8_backing[64];
undefined1 DAT_00204980_backing[65536];
undefined2 DAT_00204990_backing[32768];
undefined2 DAT_002049a0_backing[8192];
undefined2 DAT_002049b0_backing[32768];
undefined *DAT_00204988, *DAT_00204998, *DAT_002049b8;
undefined1 *DAT_002049a8;
undefined1 DAT_002049c0;
char DAT_002049bc;
short DAT_00086980, DAT_00086982, DAT_00086990, DAT_00086996;
ushort DAT_0008698c;
/* Recovered compass octants, matching the game table. */
unsigned char DAT_000869a8_backing[16] = {
    0, 0, 0, 0xe0, 0, 0xc0, 0, 0xa0,
    0, 0x80, 0, 0x60, 0, 0x40, 0, 0x20
};
static ushort wall_flags;
static int reverted_steps, restarted_sweeps;
static short x, y;
static short foot_position[3];
short *g_sweep_foot_pos = foot_position;
byte *DAT_00202c6c = DAT_002049c8_backing;
unsigned char DAT_00086998_backing[16];
undefined1 DAT_00202c70_backing[65536];
undefined1 DAT_00202c90_backing[65536];
undefined1 DAT_00202c38_backing[8192], DAT_00202c3a_backing[8192];
int DAT_00204870;
undefined4 DAT_00204878;
static bool stair_fixture;
static byte destination_floor;
static int sampled_tiles;

static short read_short(int offset)
{
    short value;
    memcpy(&value, movement + offset, sizeof(value));
    return value;
}
static void write_short(int offset, short value)
{
    memcpy(movement + offset, &value, sizeof(value));
}

void *tilemap_lookup(int tile_x, int tile_y)
{
    TEST_ASSERT_EQUAL_INT(1, tile_x);
    TEST_ASSERT_EQUAL_INT(2, tile_y);
    sampled_tiles++;
    return &destination_floor;
}
uint collision_sample_floor_height(int sample, int *status)
{
    TEST_ASSERT_EQUAL_INT(4, sample);
    *status = 0;
    return destination_floor;
}
void collision_build_height_field(int step_limit)
{
    if (stair_fixture) {
        TEST_ASSERT_EQUAL_INT(8, step_limit);
        collision_corner_flags(step_limit);
    } else {
        DAT_002049d4 = wall_flags;
    }
}
void collision_height_envelope(void)
{
    DAT_002049d6 = 0;
    DAT_002049d8 = DAT_002049d9 = destination_floor;
}
void reticle_object_pick(void)
{
    DAT_00086998 = -1; /* no object on the destination floor */
    DAT_0008699b = destination_floor;
    DAT_0008699f = 127; /* enough headroom to isolate step height */
    DAT_00086998_backing[8] = 0;
    DAT_00204878 = 1;
}
void FUN_00051dd0(void) {}
undefined4 FUN_000546c4(void)
{
    TEST_FAIL_MESSAGE("Empty tile unexpectedly checked an object collision");
    return 0;
}
undefined4 sweep_step(int direction)
{
    TEST_ASSERT_EQUAL_INT(-1, direction);
    /* Revert the attempted blocked sub-step to its pre-contact position. */
    x = 100;
    y = 200;
    reverted_steps++;
    return 1;
}
void sweep_restart_remaining(int slide)
{
    TEST_ASSERT_EQUAL_INT(stair_fixture ? 0 : 1, slide);
    restarted_sweeps++;
}
void resolve_wall_slide_corner(void)
{
    TEST_FAIL_MESSAGE("Flat-wall fixture unexpectedly needed corner classification");
}
long Ordinal_1053(void)
{
    TEST_FAIL_MESSAGE("Wall response unexpectedly used random deflection");
    return 0;
}
long Ordinal_2005(void)
{
    TEST_FAIL_MESSAGE("Grounded player unexpectedly entered bouncing deflection");
    return 0;
}

void setUp(void)
{
    memset(movement, 0, sizeof(movement));
    memset(response_mask, 0, sizeof(response_mask));
    memset(DAT_002049c8_backing, 0, sizeof(DAT_002049c8_backing));
    DAT_00204988 = DAT_00204998 = DAT_002049a8 = DAT_002049b8 = NULL;
    DAT_002049bc = DAT_002049c0 = 0;
    DAT_00086980 = DAT_00086982 = 0;
    DAT_00086990 = 3;
    DAT_00086996 = 1;
    DAT_0008698c = 0; /* flat wall's tangent heading is 0 (or opposite, 0x8000) */
    movement[0x16] = 5;
    movement[0x17] = 0x80; /* grounded player's deflection flags */
    write_short(0x14, 256); /* remaining horizontal movement */
    wall_flags = 0x404; /* wall obstruction with a floor underneath */
    reverted_steps = restarted_sweeps = 0;
    x = 101;
    y = 201;
    memset(foot_position, 0, sizeof(foot_position));
    foot_position[0] = 8;
    foot_position[1] = 16;
    memset(DAT_00086998_backing, 0, sizeof(DAT_00086998_backing));
    memset(DAT_00202c70_backing, 0, sizeof(DAT_00202c70_backing));
    stair_fixture = false;
    destination_floor = 0;
    sampled_tiles = 0;
    movement[0x25] = movement[0x27] = 8;
    movement[0x26] = 16;
}
void tearDown(void) {}

static void set_heading(ushort heading)
{
    DAT_002049ce = heading;
    write_short(0x21, (short)heading);
}

static void test_head_on_wall_hit_stops_player_at_wall(void)
{
    set_heading(0x4000); /* perpendicular to the wall's tangent */
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(100, x);
    TEST_ASSERT_EQUAL_INT(200, y);
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(DAT_00086990 + 1, DAT_00086996); /* sweep stopped */
    TEST_ASSERT_EQUAL_HEX16(0x4000, read_short(0x21)); /* no arbitrary turn */
}

static void test_wall_hit_at_45_degrees_left_turns_left_along_wall(void)
{
    const ushort incoming = 0x2000; /* 45 degrees left of head-on */
    set_heading(incoming);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_HEX16(0, DAT_002049ce);
    TEST_ASSERT_EQUAL_HEX16(0, read_short(0x21));
    TEST_ASSERT_EQUAL_INT16(-0x2000, (short)(DAT_002049ce - incoming));
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT(1, restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(2, DAT_002049bc);
    TEST_ASSERT_EQUAL_INT(100, x);
    TEST_ASSERT_EQUAL_INT(200, y);
}

static void test_wall_hit_at_45_degrees_right_turns_right_along_wall(void)
{
    const ushort incoming = 0x6000; /* 45 degrees right of head-on */
    set_heading(incoming);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_HEX16(0x8000, DAT_002049ce);
    TEST_ASSERT_EQUAL_HEX16(0x8000, read_short(0x21));
    TEST_ASSERT_EQUAL_INT16(0x2000, (short)(DAT_002049ce - incoming));
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT(1, restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(2, DAT_002049bc);
    TEST_ASSERT_EQUAL_INT(100, x);
    TEST_ASSERT_EQUAL_INT(200, y);
}

static void test_hard_block_clears_all_player_velocity(void)
{
    wall_flags = 0x4000;
    set_heading(0x4000);
    const int velocity_offsets[] = {6, 8, 10, 12, 14, 16, 20};
    for (unsigned i = 0; i < sizeof(velocity_offsets) / sizeof(velocity_offsets[0]); i++)
        write_short(velocity_offsets[i], 123);
    sweep_apply_collision();
    for (unsigned i = 0; i < sizeof(velocity_offsets) / sizeof(velocity_offsets[0]); i++)
        TEST_ASSERT_EQUAL_INT16(0, read_short(velocity_offsets[i]));
    TEST_ASSERT_EQUAL_INT(DAT_00086990 + 1, DAT_00086996);
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, restarted_sweeps);
}

static void test_open_floor_does_not_stop_or_turn_player(void)
{
    wall_flags = 4;
    set_heading(0x2000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_HEX16(0x2000, read_short(0x21));
    TEST_ASSERT_EQUAL_INT(0, reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(1, DAT_00086996);
}

static void prepare_stair(byte height)
{
    stair_fixture = true;
    foot_position[2] = 32;
    destination_floor = height;
    DAT_00202c78 = 1; /* flat, open destination tile */
    set_heading(0x4000);
}

static void assert_step_allowed(byte destination_height)
{
    prepare_stair(destination_height);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(destination_height, foot_position[2]);
    TEST_ASSERT_BITS_HIGH(4, DAT_002049d4); /* walkable */
    TEST_ASSERT_EQUAL_INT(1, DAT_00204870); /* step resolved */
    TEST_ASSERT_EQUAL_INT16(0, read_short(0x10)); /* no fall armed */
    TEST_ASSERT_EQUAL_INT(0, reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(101, x);
    TEST_ASSERT_EQUAL_INT(201, y);
    TEST_ASSERT_EQUAL_INT(1, sampled_tiles);
}

static void test_walking_up_short_stair_succeeds(void)
{
    assert_step_allowed(36); /* rise 4, limit 8 */
}

static void test_walking_up_exact_step_limit_succeeds(void)
{
    assert_step_allowed(40); /* rise 8, limit 8 */
}

static void assert_step_blocked(byte destination_height)
{
    prepare_stair(destination_height);
    uint flags = sweep_collision_flags();
    TEST_ASSERT_BITS_HIGH(0x1000, flags);
    TEST_ASSERT_BITS_LOW(4, flags);
    TEST_ASSERT_EQUAL_INT16(32, foot_position[2]);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(32, foot_position[2]);
    TEST_ASSERT_EQUAL_INT(0, DAT_00204870);
    TEST_ASSERT_EQUAL_INT(1, restarted_sweeps); /* blocked resolution */
    TEST_ASSERT_EQUAL_INT(0, reverted_steps); /* no wall-slide turn */
    TEST_ASSERT_EQUAL_HEX16(0x4000, read_short(0x21));
}

static void test_walking_up_one_above_step_limit_is_blocked(void)
{
    assert_step_blocked(41);
}

static void test_walking_from_low_tile_to_much_higher_tile_is_blocked(void)
{
    assert_step_blocked(64); /* rise 32, limit 8 */
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_head_on_wall_hit_stops_player_at_wall);
    RUN_TEST(test_wall_hit_at_45_degrees_left_turns_left_along_wall);
    RUN_TEST(test_wall_hit_at_45_degrees_right_turns_right_along_wall);
    RUN_TEST(test_hard_block_clears_all_player_velocity);
    RUN_TEST(test_open_floor_does_not_stop_or_turn_player);
    RUN_TEST(test_walking_up_short_stair_succeeds);
    RUN_TEST(test_walking_up_exact_step_limit_succeeds);
    RUN_TEST(test_walking_up_one_above_step_limit_is_blocked);
    RUN_TEST(test_walking_from_low_tile_to_much_higher_tile_is_blocked);
    return UNITY_END();
}
