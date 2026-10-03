#include "unity.h"
#include "src/headers/movement.h"

/* Tile heights and wall contact are supplied at the map-sampling boundary.
 * Step limits, collision flags, response, and heading deflection are real. */
undefined1 DAT_00204880_backing[128];
#define movement DAT_00204880_backing
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
#define foot_position ((short *)DAT_002049c8_backing)
short *g_sweep_foot_pos = foot_position;
byte *DAT_00202c6c = DAT_002049c8_backing;
unsigned char DAT_00086998_backing[16];
undefined1 DAT_00202c70_backing[65536];
undefined1 DAT_00202c90_backing[65536];
undefined1 DAT_00202c38_backing[8192];
int DAT_00204870;
undefined4 DAT_00204878;
static bool stair_fixture;
static ushort envelope_flags;
static byte destination_floor;
static byte object_arena[0x8000];
#define player ((ushort *)(object_arena + 0x4000 + 0x1b))
#define door ((ushort *)(object_arena + 0x5b00 + (300 - 256) * 8))
char *DAT_002046b8 = (char *)object_arena + 0x4000;
ushort *g_player_object = player;
short DAT_00201c70, DAT_00202080, DAT_00202088;
undefined2 DAT_00201c78;
undefined4 DAT_000858a0;
char *DAT_002029cc, *DAT_00086df8;
uint read_realtime_clock_units(void) { return 0; }
void object_list_unlink(void) { TEST_FAIL_MESSAGE("Unexpected tile change"); }
void object_list_insert_head(void) { TEST_FAIL_MESSAGE("Unexpected tile change"); }
void set_locomotion_state(int state, int flags) { (void)state; (void)flags; }
undefined4 roll_skill_check(void) { TEST_FAIL_MESSAGE("Unexpected fall damage"); return 0; }
undefined4 apply_typed_damage_to_object(void) { TEST_FAIL_MESSAGE("Unexpected damage"); return 0; }
undefined4 play_sound_effect_with_pan(void) { TEST_FAIL_MESSAGE("Unexpected landing sound"); return 0; }
static int sampled_tiles;
static bool door_fixture, setup_fixture;

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
    if (!setup_fixture) {
        TEST_ASSERT_EQUAL_INT(1, tile_x);
        TEST_ASSERT_EQUAL_INT(2, tile_y);
    }
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
    if (setup_fixture) destination_floor = DAT_002049c8 == 16 ? 128 : 0;
    if (stair_fixture) {
        TEST_ASSERT_EQUAL_INT(8, step_limit);
        collision_corner_flags(step_limit);
    } else {
        DAT_002049d4 = wall_flags;
    }
}
void collision_height_envelope(void)
{
    DAT_002049d6 = envelope_flags;
    DAT_002049d8 = DAT_002049d9 = destination_floor;
    if (door_fixture) {
        DAT_00202c18 = DAT_00202c1c = 4;
        DAT_00202c20 = DAT_00202c24 = 0;
        DAT_00202c28 = DAT_00202c2c = 7;
        collision_add_candidate_object(door, 300, 0, 0, 0);
    }
}

static int door_contacts, surface_landings;
undefined DAT_00202c32;
short *g_sweep_velocity = (short *)(movement + 6);
short DAT_00086984, DAT_0008698a, DAT_0008698e, DAT_00086994;
ushort DAT_00086992;
undefined1 DAT_00086986_backing[65536];
char DAT_00202c18, DAT_00202c1c, DAT_00202c20, DAT_00202c24;
char DAT_00202c28, DAT_00202c2c;
byte DAT_002046d8, DAT_002046e0, DAT_002046e4;
byte DAT_002046dc;
int DAT_002046e8;
ushort DAT_002020a0, DAT_002020a4;

void *get_object_record_by_slot_index(int slot)
{
    if (slot == 1) return player;
    if (slot == 300) return door;
    return NULL;
}
char *DAT_002046c4 = (char *)object_arena + 0x5b00;
short DAT_0010144c, DAT_00101454;
static int obstacle_syncs;
static byte last_obstacle_snapshot[0x2c];
int encode_object_slot_index(ushort *object)
{
    TEST_ASSERT_EQUAL_PTR(door, object);
    door_contacts++;
    return 300;
}
undefined4 sync_object_tile_position(ushort *object, byte *snapshot)
{
    TEST_ASSERT_EQUAL_PTR(door, object);
    memcpy(last_obstacle_snapshot, snapshot, sizeof(last_obstacle_snapshot));
    obstacle_syncs++;
    return 1;
}
undefined4 resolve_skill_gated_unlock_or_use(void)
{ TEST_FAIL_MESSAGE("Unexpected unlock trigger"); return 0; }
ushort *use_object_on_target(void)
{ TEST_FAIL_MESSAGE("Unexpected use trigger"); return 0; }
void angle_to_screen_delta(int heading, short *dx, short *dy)
{
    (void)heading;
    *dx = 0;
    *dy = 0;
}

void sweep_land_on_surface(void)
{
    surface_landings++;
    foot_position[2] = (short)_DAT_0008699b;
}
undefined4 sweep_step(int direction)
{
    TEST_ASSERT_EQUAL_INT(-1, direction);
    /* Revert the attempted blocked sub-step to its pre-contact position. */
    x = 100;
    y = 200;
    if (setup_fixture) {
        foot_position[0] = 8; /* restore the tile before the wall */
        foot_position[1] = 16;
    }
    reverted_steps++;
    return 1;
}
void sweep_restart_remaining(int slide)
{
    TEST_ASSERT_EQUAL_INT(1, slide);
    restarted_sweeps++;
}
void resolve_wall_slide_corner(void)
{
    DAT_002049da = 9; /* flat raised face uses the movement-axis tangent */
}
long ce_rand(void)
{
    /* Static placement snapshots jitter their sub-tile coordinates. */
    if (door_contacts == 0)
        TEST_FAIL_MESSAGE("Wall response unexpectedly used random deflection");
    return 0;
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    TEST_ASSERT_NOT_EQUAL(0, divisor);
    divmod_result result = {dividend / divisor, dividend % divisor};
    return result;
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
    memset(foot_position, 0, 3 * sizeof(short));
    foot_position[0] = 8;
    foot_position[1] = 16;
    memset(DAT_00086998_backing, 0, sizeof(DAT_00086998_backing));
    memset(DAT_00202c70_backing, 0, sizeof(DAT_00202c70_backing));
    stair_fixture = false;
    destination_floor = 0;
    sampled_tiles = 0;
    envelope_flags = 0;
    door_fixture = setup_fixture = false;
    DAT_00201c70 = DAT_00201c78 = DAT_00202080 = DAT_00202088 = 0;
    door_contacts = surface_landings = obstacle_syncs = 0;
    memset(last_obstacle_snapshot, 0, sizeof(last_obstacle_snapshot));
    DAT_00086984 = DAT_0008698a = DAT_0008698e = DAT_00086994 = 0;
    DAT_00086992 = 0;
    memset(object_arena, 0, sizeof(object_arena));
    memset(DAT_00202c38_backing, 0, sizeof(DAT_00202c38_backing));
    memset(DAT_00202c90_backing, 0, sizeof(DAT_00202c90_backing));
    player[0] = 0x7f;
    door[0] = 0x140;
    FILE *properties = fopen(UW_TEST_DATA_DIR "/DATA/COMOBJ.DAT", "rb");
    TEST_ASSERT_NOT_NULL_MESSAGE(properties, "data/DATA/COMOBJ.DAT is required");
    const int ids[] = {0x7f, 0x140, 0x148};
    for (unsigned i = 0; i < sizeof(ids) / sizeof(ids[0]); i++) {
        byte packed[11], *row = DAT_00202c90_backing + ids[i] * 13;
        TEST_ASSERT_EQUAL_INT(0, fseek(properties, 2 + ids[i] * 11, SEEK_SET));
        TEST_ASSERT_EQUAL_UINT(11, fread(packed, 1, 11, properties));
        /* The game's loader expands 11 on-disk bytes into 13-byte records. */
        memcpy(row, packed, 4);
        memcpy(row + 5, packed + 4, 7);
    }
    TEST_ASSERT_EQUAL_INT(0, fclose(properties));
    door[1] = (4 << 13) | (4 << 10); /* centered on the tile */
    DAT_002049d2 = 1;
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
    TEST_ASSERT_EQUAL_INT(1, reverted_steps); /* raised face rolls movement back */
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

static void test_player_cannot_auto_step_onto_high_footprint_floor(void)
{
    foot_position[2] = 32;
    destination_floor = 64;
    wall_flags = 4; /* center is walkable, footprint overlaps a high face */
    envelope_flags = 0x100;
    response_mask[5] = 1; /* 16-bit geometry mask at +4 includes 0x100 */
    set_heading(0x4000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(32, foot_position[2]);
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT(100, x);
}

static void test_closed_door_candidate_preserves_full_object_link(void)
{
    door_fixture = true;
    wall_flags = 4;
    destination_floor = 32;
    foot_position[2] = 32;
    set_heading((door[1] & 0x100) != 0 ? 0x4000 : 0);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_UINT16(300, *(ushort *)(&DAT_00202c3a) >> 6);
    TEST_ASSERT_GREATER_THAN_INT(0, door_contacts);
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT(100, x);
    TEST_ASSERT_EQUAL_INT16(32, foot_position[2]);
}

static void test_open_door_does_not_block_player(void)
{
    door_fixture = true;
    door[0] = 0x148;
    door[1] |= 96; /* fully lifted leaf, above the player's head */
    destination_floor = 32;
    foot_position[2] = 32;
    wall_flags = 4;
    set_heading(0x4000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(0, door_contacts);
    TEST_ASSERT_EQUAL_INT(0, reverted_steps);
}

static void test_jump_wall_rebound_rebuilds_floor_at_restored_position(void)
{
    setup_fixture = true;
    /* Jump from tile (1,2) into the wall at (2,2). */
    foot_position[0] = 16;
    foot_position[1] = 16;
    foot_position[2] = 50;
    wall_flags = 0x200;
    write_short(0x0a, 256);
    write_short(0x10, -4);
    set_heading(0x2000); /* bounce/slide along the wall */
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(1, reverted_steps);
    TEST_ASSERT_EQUAL_INT16(8, foot_position[0]);
    TEST_ASSERT_EQUAL_INT16(50, foot_position[2]);
    TEST_ASSERT_EQUAL_INT16(8, DAT_002049c8); /* rollback updates collision XYZ too */

    write_short(0x12, 64);
    TEST_ASSERT_EQUAL_INT(1, movement_sweep_setup(0, 1));
    sweep_step_vertical(0, 1);
    TEST_ASSERT_EQUAL_INT(0, surface_landings);
    TEST_ASSERT_LESS_THAN_INT(50, foot_position[2]);
    TEST_ASSERT_GREATER_THAN_INT(0, foot_position[2]);
    TEST_ASSERT_EQUAL_INT16(8, DAT_002049c8);
    TEST_ASSERT_EQUAL_INT16(16, DAT_002049ca);
    TEST_ASSERT_EQUAL_INT16(0, (short)_DAT_0008699b);
    /* Subsequent sweeps continue the gravity arc all the way to the floor. */
    for (int tick = 0; tick < 10 && surface_landings == 0; tick++) {
        short previous_height = foot_position[2];
        TEST_ASSERT_EQUAL_INT(1, movement_sweep_setup(0, 1));
        sweep_step_vertical(0, 1);
        TEST_ASSERT_LESS_THAN_INT(previous_height, foot_position[2]);
        TEST_ASSERT_GREATER_OR_EQUAL_INT(0, foot_position[2]);
    }
    TEST_ASSERT_EQUAL_INT(1, surface_landings);
    TEST_ASSERT_EQUAL_INT16(0, foot_position[2]);
}

static void test_closed_door_blocks_in_opposite_orientation(void)
{
    door[1] |= 0x100; /* heading 2: a quarter turn */
    test_closed_door_candidate_preserves_full_object_link();
}

static void test_airborne_floor_flags_do_not_revert_jump(void)
{
    foot_position[2] = 50;
    destination_floor = 32;
    wall_flags = 0x100;
    write_short(0x0a, 256);
    write_short(0x10, -4);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(50, foot_position[2]);
    TEST_ASSERT_EQUAL_INT16(256, read_short(0x0a));
    TEST_ASSERT_EQUAL_INT(0, reverted_steps);
}

static void test_collision_ignore_mask_keeps_high_bits(void)
{
    wall_flags = 0x1000;
    response_mask[1] = 0x10; /* short at +0, not just its low byte */
    set_heading(0x4000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(0, reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, restarted_sweeps);
    TEST_ASSERT_EQUAL_INT16(0, read_short(0x10));
}

static void test_candidate_sort_keeps_heights_links_and_offsets_together(void)
{
    const byte unsorted[] = {90, 70, 9, 75, 1, 0,
                            60, 40, 9, 75, 2, 0};
    memcpy(DAT_00202c38_backing, unsorted, sizeof(unsorted));
    DAT_002049dc = 2;
    DAT_002049cc = 32;
    DAT_002049d1 = 16;
    sort_collision_candidates();
    TEST_ASSERT_EQUAL_UINT8(60, (&DAT_00202c38)[0]);
    TEST_ASSERT_EQUAL_UINT8(40, (&DAT_00202c39)[0]);
    TEST_ASSERT_EQUAL_UINT16(300, *(ushort *)&DAT_00202c3a >> 6);
    TEST_ASSERT_EQUAL_UINT16(2, *(ushort *)&DAT_00202c3c);
    TEST_ASSERT_EQUAL_UINT8(90, (&DAT_00202c38)[6]);
    TEST_ASSERT_EQUAL_UINT16(1, *(ushort *)(&DAT_00202c3c + 6));
    TEST_ASSERT_EQUAL_UINT8(1, DAT_002049dd); /* one object overlaps the head */
}

static void test_static_door_contact_builds_snapshot_without_moving_door(void)
{
    ushort before[16];
    memcpy(before, door, sizeof(before));
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(player, door));
    TEST_ASSERT_EQUAL_INT(1, door_contacts);
    TEST_ASSERT_EQUAL_INT(0, obstacle_syncs); /* zero mass, fixed door */
    TEST_ASSERT_EQUAL_MEMORY(before, door, sizeof(before));
}

static void test_contact_snapshot_updates_contiguous_velocity_speed_and_heading(void)
{
    byte *row = DAT_00202c90_backing + 0x140 * 13;
    row[1] = 0x43; /* mass 4, radius 3 */
    row[2] = 0;
    write_short(0x18, 4); /* moving object's mass */
    write_short(0x0a, -256);
    set_heading(0x2345);
    DAT_002046d8 = 7;
    DAT_002046dc = 9;
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(player, door));
    TEST_ASSERT_EQUAL_INT(1, door_contacts);
    TEST_ASSERT_EQUAL_INT(1, obstacle_syncs);
    TEST_ASSERT_EQUAL_INT16(-256, *(short *)(last_obstacle_snapshot + 0x0a));
    TEST_ASSERT_EQUAL_UINT16(235, *(ushort *)(last_obstacle_snapshot + 0x14));
    TEST_ASSERT_EQUAL_UINT16(0x2345, *(ushort *)(last_obstacle_snapshot + 0x21));
    TEST_ASSERT_EQUAL_UINT16(300, *(ushort *)(last_obstacle_snapshot + 0x23));
    TEST_ASSERT_EQUAL_INT16(7, DAT_0010144c);
    TEST_ASSERT_EQUAL_INT16(9, DAT_00101454);
}

static void test_contact_mass_ratio_caps_transferred_velocity(void)
{
    byte *row = DAT_00202c90_backing + 0x140 * 13;
    row[1] = 0x13; /* mass 1 */
    row[2] = 0;
    write_short(0x18, 4);
    write_short(0x0a, -256);
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(player, door));
    TEST_ASSERT_EQUAL_INT(1, obstacle_syncs);
    TEST_ASSERT_EQUAL_INT16(-512, *(short *)(last_obstacle_snapshot + 0x0a));
}

static void test_contact_without_obstacle_returns_blocking_flag(void)
{
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(player, NULL));
    TEST_ASSERT_EQUAL_INT(0, door_contacts);
    TEST_ASSERT_EQUAL_INT(0, obstacle_syncs);
}

static void test_door_bounds_use_original_radius_and_packed_position(void)
{
    /* collision_add_candidate_object / ARM 0x516e4..0x51790 uses a square radius. Heading
       does not change it, and packed positions 3 and 4 remain distinct. */
    for (int packed_position = 3; packed_position <= 4; packed_position++) {
        for (int heading = 0; heading < 8; heading += 2) {
            door[1] = (packed_position << 13) | (packed_position << 10) | (heading << 7);
            for (int axis = 0; axis < 2; axis++) {
                for (int position = -2; position <= 9; position++) {
                    DAT_002049dc = 0;
                    DAT_00202c18 = axis == 0 ? position : packed_position;
                    DAT_00202c1c = axis == 1 ? position : packed_position;
                    DAT_00202c20 = DAT_00202c18 - 1;
                    DAT_00202c28 = DAT_00202c18 + 1;
                    DAT_00202c24 = DAT_00202c1c - 1;
                    DAT_00202c2c = DAT_00202c1c + 1;
                    collision_add_candidate_object(door, 300, 0, 0, 0);
                    TEST_ASSERT_EQUAL_INT(position >= packed_position - 4 &&
                                          position <= packed_position + 4, DAT_002049dc);
                }
            }
        }
    }
}

static void test_object_slide_uses_original_movement_axis(void)
{
    for (int heading = 0; heading < 4; heading += 2) {
        for (int axis = 0; axis < 2; axis++) {
            setUp();
            door_fixture = true;
            wall_flags = 4;
            door[1] |= heading << 7;
            DAT_0008698c = axis;
            set_heading(0x2000);
            sweep_apply_collision();
            TEST_ASSERT_EQUAL_HEX16(axis == 0 ? 0 : 0x4000, read_short(0x21));
            TEST_ASSERT_EQUAL_INT(1, reverted_steps);
            TEST_ASSERT_EQUAL_INT(1, restarted_sweeps);
        }
    }
}

static void test_copied_collision_links_resolve_like_arena_links(void)
{
    /* These are real calls to FUN_00053514, not an unrestricted lookup stub. */
    *(ushort *)(object_arena + 2) = (300 << 6) | 0x19;
    TEST_ASSERT_EQUAL_PTR(door, resolve_object_link((ushort *)(object_arena + 2)));
    for (int i = 0; i < 9; i++) {
        ushort *link = (ushort *)(&DAT_00202c3a + i * 6);
        *link = (300 << 6) | 0x39;
        TEST_ASSERT_EQUAL_PTR(door, resolve_object_link(link));
        *link = (1 << 6) | 0x19;
        TEST_ASSERT_EQUAL_PTR(player, resolve_object_link(link));
        *link = 0x19;
        TEST_ASSERT_NULL(resolve_object_link(link));
    }
}

static void test_door_contact_lookup_returns_full_pointer_and_tile(void)
{
    DAT_002049dc = DAT_002049dd = 1;
    DAT_002049de = 0;
    *(ushort *)(&DAT_00202c3a) = (300 << 6) | 0x39;
    *(short *)(&DAT_00202c3c) = 0; /* door is in the current tile */
    byte tile_x = 0, tile_y = 0;
    void *found_door = find_nearby_door_in_candidates(&tile_x, &tile_y);
    TEST_ASSERT_EQUAL_PTR(door, found_door);
    TEST_ASSERT_EQUAL_UINT8(1, tile_x);
    TEST_ASSERT_EQUAL_UINT8(2, tile_y);
    TEST_ASSERT_EQUAL_PTR(door, get_first_nearby_candidate_object());
    door[0] = 0x148;
    TEST_ASSERT_NULL(find_nearby_door_in_candidates(&tile_x, &tile_y));
    DAT_002049dd = 0;
    TEST_ASSERT_NULL(get_first_nearby_candidate_object());
}

static void test_sweep_initialization_and_rollback_share_collision_xyz(void)
{
    write_short(0, 12 * 32 + 7);
    write_short(2, 20 * 32 + 9);
    write_short(4, 80 * 8 + 3);
    sweep_init_position();
    TEST_ASSERT_EQUAL_PTR(DAT_00202c6c, g_sweep_foot_pos);
    TEST_ASSERT_EQUAL_INT16(12, DAT_002049c8);
    TEST_ASSERT_EQUAL_INT16(20, DAT_002049ca);
    TEST_ASSERT_EQUAL_INT16(80, DAT_002049cc);
    DAT_0008698c = 0;
    DAT_0008698e = 1;
    DAT_00086996 = 0;
    DAT_00086990 = 3;
    *(short *)(&DAT_00086986) = 0x2000;
    *(short *)(&DAT_00086986 + 2) = 0;
    sweep_integrate_substep(0, 1);
    TEST_ASSERT_EQUAL_INT16(13, DAT_002049c8);
    sweep_integrate_substep(0, -1);
    TEST_ASSERT_EQUAL_INT16(12, DAT_002049c8);
    TEST_ASSERT_EQUAL_INT16(20, DAT_002049ca);
    TEST_ASSERT_EQUAL_INT16(80, DAT_002049cc);
}

static void test_real_substep_rollback_restores_fractional_position_on_both_axes(void)
{
    for (int axis = 0; axis < 2; axis++) {
        for (int direction = -1; direction <= 1; direction += 2) {
            foot_position[0] = 8;
            foot_position[1] = 16;
            DAT_00086980 = 0x1000;
            DAT_00086982 = 0x1800;
            DAT_0008698c = axis;
            DAT_0008698e = 1 - axis;
            DAT_00086996 = 0;
            DAT_00086990 = 3;
            *(short *)(&DAT_00086986 + axis * 2) = direction * 0x20;
            *(short *)(&DAT_00086986 + (1 - axis) * 2) = direction * 0x1200;
            TEST_ASSERT_EQUAL_INT(1, sweep_integrate_substep(0, 1));
            const int fraction = (axis == 0 ? 0x1800 : 0x1000) + direction * 0x1200;
            const int carry = fraction < 0 ? -1 : fraction >= 0x2000 ? 1 : 0;
            TEST_ASSERT_EQUAL_INT16(8 + (axis == 0 ? direction : carry), foot_position[0]);
            TEST_ASSERT_EQUAL_INT16(16 + (axis == 1 ? direction : carry), foot_position[1]);
            TEST_ASSERT_EQUAL_HEX16(axis == 0 ? 0x1000 : fraction & 0x1fff, DAT_00086980);
            TEST_ASSERT_EQUAL_HEX16(axis == 1 ? 0x1800 : fraction & 0x1fff, DAT_00086982);
            TEST_ASSERT_EQUAL_INT(1, sweep_integrate_substep(0, -1));
            TEST_ASSERT_EQUAL_INT16(8, foot_position[0]);
            TEST_ASSERT_EQUAL_INT16(16, foot_position[1]);
            TEST_ASSERT_EQUAL_HEX16(0x1000, DAT_00086980);
            TEST_ASSERT_EQUAL_HEX16(0x1800, DAT_00086982);
            TEST_ASSERT_EQUAL_INT(0, DAT_00086996);
        }
    }
}

static void test_unchanged_signed_travel_heading_does_not_turn_camera_again(void)
{
    for (int reverse = 0; reverse < 2; reverse++) {
        ushort tangent = 0x4000 + reverse * 0x8000;
        ushort yaw = 0x2400 + reverse * 0x8000;
        DAT_00201c70 = (short)yaw;
        DAT_00201c78 = tangent;
        set_heading(tangent);
        for (int tick = 0; tick < 10; tick++) {
            commit_player_move();
            TEST_ASSERT_EQUAL_HEX16(yaw, DAT_00201c70);
        }
    }
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
    RUN_TEST(test_player_cannot_auto_step_onto_high_footprint_floor);
    RUN_TEST(test_closed_door_candidate_preserves_full_object_link);
    RUN_TEST(test_open_door_does_not_block_player);
    RUN_TEST(test_jump_wall_rebound_rebuilds_floor_at_restored_position);
    RUN_TEST(test_closed_door_blocks_in_opposite_orientation);
    RUN_TEST(test_airborne_floor_flags_do_not_revert_jump);
    RUN_TEST(test_collision_ignore_mask_keeps_high_bits);
    RUN_TEST(test_candidate_sort_keeps_heights_links_and_offsets_together);
    RUN_TEST(test_static_door_contact_builds_snapshot_without_moving_door);
    RUN_TEST(test_contact_snapshot_updates_contiguous_velocity_speed_and_heading);
    RUN_TEST(test_contact_mass_ratio_caps_transferred_velocity);
    RUN_TEST(test_contact_without_obstacle_returns_blocking_flag);
    RUN_TEST(test_door_bounds_use_original_radius_and_packed_position);
    RUN_TEST(test_object_slide_uses_original_movement_axis);
    RUN_TEST(test_copied_collision_links_resolve_like_arena_links);
    RUN_TEST(test_door_contact_lookup_returns_full_pointer_and_tile);
    RUN_TEST(test_sweep_initialization_and_rollback_share_collision_xyz);
    RUN_TEST(test_real_substep_rollback_restores_fractional_position_on_both_axes);
    RUN_TEST(test_unchanged_signed_travel_heading_does_not_turn_camera_again);
    return UNITY_END();
}
