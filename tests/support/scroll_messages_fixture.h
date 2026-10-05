#ifndef UW_TEST_SCROLL_MESSAGES_FIXTURE_H
#define UW_TEST_SCROLL_MESSAGES_FIXTURE_H
#include "game_fixture.h"
#include "static_strings_fixture.h"
#include "unity.h"
void scroll_messages_fixture_reset(void);
void scroll_messages_fixture_width(unsigned columns);
void scroll_messages_fixture_print(unsigned address);
const char *scroll_messages_fixture_line(unsigned line);
#endif
