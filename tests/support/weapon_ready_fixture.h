#ifndef UW_TEST_WEAPON_READY_FIXTURE_H
#define UW_TEST_WEAPON_READY_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
extern int weapon_draws, weapon_sprite_loads;
void weapon_ready_fixture_start_unloaded(void);
void weapon_ready_fixture_reset(void);
void weapon_ready_fixture_animate(void);
#endif
