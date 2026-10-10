#ifndef UW_TEST_JUMP_WALKING_FIXTURE_H
#define UW_TEST_JUMP_WALKING_FIXTURE_H
#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/input.h"
#include "src/headers/movement.h"

/* The key latch (DAT_0023c448), the held-movement latch and the jump key dispatch, with
   decode_movement_command replaced by a recorder. */
void jump_walking_fixture_reset(void);
extern unsigned decode_calls;
extern unsigned short decode_latch_seen; /* DAT_0023c448 when decode_movement_command last ran */
#endif
