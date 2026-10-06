#ifndef UW_TEST_AUDIO_FIXTURE_H
#define UW_TEST_AUDIO_FIXTURE_H
#include "src/headers/uw.h"
#include "unity.h"

void audio_fixture_reset(void);
void audio_fixture_advance_clock(unsigned units);
void audio_fixture_set_next_random(long value);
int audio_fixture_load_track_call_count(void);
const char *audio_fixture_last_loaded_track(void);

#endif
