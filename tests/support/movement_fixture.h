#ifndef UW_TEST_MOVEMENT_FIXTURE_H
#define UW_TEST_MOVEMENT_FIXTURE_H
#include "src/headers/movement.h"

typedef struct {
    byte *state;
    char response_mask[16];
    byte object_arena[0x8000];
    char character[256], attributes[256];
    ushort *player, *door;
    short *foot_position;
    ushort wall_flags, envelope_flags;
    byte destination_floor;
    bool stair_fixture, door_fixture, setup_fixture;
    int reverted_steps, restarted_sweeps, sampled_tiles;
    int door_contacts, surface_landings, obstacle_syncs;
    short x, y;
    byte last_obstacle_snapshot[0x2c];
} MovementFixture;

extern MovementFixture movement_fixture;
void movement_fixture_reset(void);
void movement_fixture_set_heading(ushort heading);
void movement_fixture_prepare_stair(byte height);
short movement_fixture_read_short(int offset);
void movement_fixture_write_short(int offset, short value);
#endif
