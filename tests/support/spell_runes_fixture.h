#ifndef UW_TEST_SPELL_RUNES_FIXTURE_H
#define UW_TEST_SPELL_RUNES_FIXTURE_H
#include "unity.h"
#include "../spell_runes_test_globals.h"
void wait_for_click_release(int buttons);
int message_scroll_print_wrapped(const char *message);
undefined4 play_sound_effect_with_pan(int id, int pan, int mode);
void print_scroll_message_by_id(int id);
undefined4 roll_skill_check(int skill, int difficulty);
undefined4 dispatch_special_action(int type, int param, ushort *caster, ushort *target);
void spell_runes_fixture_reset(void);
void spell_runes_fixture_dispose(void);
void ready_runes(int first, int second, int third);
#endif
