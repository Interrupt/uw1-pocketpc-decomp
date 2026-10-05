#ifndef UW_TEST_NOISE_FIXTURE_H
#define UW_TEST_NOISE_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
extern ushort noise_npc[16], noise_source[16];
extern int noise_los_clear, noise_messages, noise_los_checks, noise_scans;
extern uint noise_message_id;
extern char noise_printed_message[80];
void noise_fixture_reset(void);
void noise_set_reaction_count(unsigned count);
unsigned noise_reaction_count(void);
#endif
