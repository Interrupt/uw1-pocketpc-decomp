#ifndef UW_TEST_SLEEP_FIXTURE_H
#define UW_TEST_SLEEP_FIXTURE_H
#include "special_use_fixture.h"
typedef struct {
    int redraws, sleeps, wakes, music_restores, ambient_ticks;
    int random_low, interrupted, interruption_checks, mobile_ticks;
    int light_updates, resources_flushed, stat_redraws;
    int light_slot_redraws;
    int cursor_hides, cursor_shows, overlay_redraws, overlay_copies;
    int snapshot_count, spawn_attempts;
    void *snapshots[16];
    byte screen[0x4bec];
    ushort torch[4];
    unsigned clock;
    short mobile_free[256], static_free[768];
} SleepFixture;
extern SleepFixture sleep_fixture;
void sleep_fixture_reset(void);
void sleep_fixture_dispose(void);
void sleep_fixture_cleanup_chain(void);
ushort *sleep_fixture_spawn_trap(int blocked);
ushort *sleep_bedroll(void);
uint sleep_game_time(void);
#endif
