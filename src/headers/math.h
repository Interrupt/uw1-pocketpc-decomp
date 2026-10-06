#ifndef HEADERS_MATH_H
#define HEADERS_MATH_H

/* Declarations for math.c: general math/geometry helpers (threshold- gated value stepping,
   heading-to-direction-vector projection). Pulls in uw.h itself so this header is self-contained
   for any caller. */
#include "uw.h"

int integer_sqrt();
undefined4 rand_below();
uint read_realtime_clock_units();
void heading_to_sine_cosine();
uint pack_angle_byte();
void angle_to_screen_delta();
int lookup_arctan_primary_range();
int lookup_arctan_reciprocal_range();
int compute_angle_from_slope();
bool step_value_toward_limit();
void project_position_by_heading();
void busy_wait_ms();
int roll_dice_sum();

#endif
