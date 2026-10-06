#ifndef UW_TEST_INTRODUCTION_FIXTURE_H
#define UW_TEST_INTRODUCTION_FIXTURE_H
#include "unity.h"
#include "../introduction_test_globals.h"
undefined4 read_file_handle(int handle, void *buf, unsigned int size);
undefined4 seek_file_handle(int handle, int offset, int method);
unsigned int ce_strlen(const char *s);
undefined4 audio_always_true_stub(void);
void introduction_fixture_reset(void);
void introduction_fixture_dispose(void);
#endif
