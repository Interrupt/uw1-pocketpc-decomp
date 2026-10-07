#ifndef UW_TEST_LOOK_PACING_FIXTURE_H
#define UW_TEST_LOOK_PACING_FIXTURE_H
#include "unity.h"
#include "../look_pacing_test_globals.h"
const Uint8 *SDL_GetKeyboardState(int *count);
int in_dungeon_freelook(void);
void uw_set_analog_move_turn(int forward, int turn);
int GXEndDraw(void);
void look_pacing_fixture_reset(void);
void look_pacing_fixture_dispose(void);
void poll_at(uint64_t time_us);
void look_pacing_poll(int frame_due);
#endif
