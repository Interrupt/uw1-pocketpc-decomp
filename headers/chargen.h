#ifndef HEADERS_CHARGEN_H
#define HEADERS_CHARGEN_H

/* Declarations for chargen.c: character creation (the field-by-field
 * state machine, its resource-loading setup, and the critical-section
 * entry wrapper). Pulls in uw.h itself so this header is self-contained
 * for any caller. */
#include "../uw.h"

undefined4 character_generator_start();
int run_character_generator();
undefined4 character_generator_loop();

#endif
