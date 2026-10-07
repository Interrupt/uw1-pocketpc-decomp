#include "src/headers/uw.h"
#include "unity.h"

/* Headless boundaries for the real character initializer. Movement's
   collision fixture supplies its own RNG; other consumers get random.c. */

void configure_texture_detail_functions(void) {}
void refresh_player_equipment_effects(void) {}
int roll_dice_sum(int count, short sides)
{ TEST_FAIL_MESSAGE("Fixture character unexpectedly rolled attributes"); return 0; }
