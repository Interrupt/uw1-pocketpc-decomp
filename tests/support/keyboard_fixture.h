#ifndef UW_TEST_KEYBOARD_FIXTURE_H
#define UW_TEST_KEYBOARD_FIXTURE_H
/* Fixture state and controlled services for isolated handle_keyboard_message
 * tests -- see bugfix/lowercase-text-universal: this is the general fix's
 * own regression coverage, exercised directly against the real function
 * body rather than through a UI demo script (click coordinates and splash-
 * screen timing make full UI automation unreliable to script precisely;
 * this fixture instead drives the exact code path the bug lived in). */
#include "unity.h"
#include "src/headers/uw.h"

void keyboard_fixture_reset(void);
void keyboard_fixture_dispose(void);

#endif
