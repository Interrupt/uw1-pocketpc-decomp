#ifndef UW_TEST_SPECIAL_USE_FIXTURE_H
#define UW_TEST_SPECIAL_USE_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
typedef struct {
    byte map[0x7c08 + 0x3a + 0x180];
    char character[256], attributes[256];
    short input[16];
    int message, messages, dice, rest_checks, rest_unsafe, health_refreshes;
} SpecialUseFixture;
extern SpecialUseFixture special_use_fixture;
void special_use_fixture_reset(void);
void special_use_fixture_dispose(void);
ushort *special_use_object(unsigned slot);
void special_use_empty_area(int x, int y);
ushort *special_use_npc(unsigned slot, int x, int y, int state, int alerted);
#endif
