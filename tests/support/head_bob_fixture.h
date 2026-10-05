#ifndef UW_TEST_HEAD_BOB_FIXTURE_H
#define UW_TEST_HEAD_BOB_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
void head_bob_fixture_reset(void);
void head_bob_fixture_tick(int mode, int speed, unsigned elapsed);
float head_bob_fixture_matrix_element(unsigned index);
void head_bob_fixture_set_random(unsigned value);
#endif
