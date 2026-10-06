#ifndef HEADERS_MATH_H
#define HEADERS_MATH_H

/* Declarations for math.c: general math/geometry helpers (threshold- gated value stepping,
   heading-to-direction-vector projection). Pulls in uw.h itself so this header is self-contained
   for any caller. */
#include "uw.h"

int integer_sqrt(int value);
uint rand_below(int limit);
uint read_realtime_clock_units(void);
void heading_to_sine_cosine(uint heading_word, short *sine, short *cosine);
uint pack_angle_byte(uint word, uint new_byte, int into_high_byte);
void angle_to_screen_delta(uint angle_word, short *out_sine, short *out_cosine);
int lookup_arctan_primary_range(uint ratio);
int lookup_arctan_reciprocal_range(uint ratio);
int compute_angle_from_slope(ushort slope, uint reciprocal_slope);
bool step_value_toward_limit(short *value, short limit, short step, short direction);
void project_position_by_heading(int heading, short distance, short *x, short *y);
void busy_wait_ms(uint milliseconds);
int roll_dice_sum(int base_and_dice, short sides);

#endif
