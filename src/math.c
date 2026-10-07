/* General math/geometry helpers: threshold-gated value stepping and heading-to-direction-vector
   projection. Split out of uw.c (the original monolithic decompile) once these functions' real
   roles were confirmed. */
#include "headers/math.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define DAT_00085d48 (*(const undefined1 *)(const void *)DAT_00085d48_sine)
#define DAT_00085d4c (*(const undefined1 *)((const char *)(const void *)DAT_00085d48_sine + 2))
#define DAT_00085f50 (*(const undefined1 *)(const void *)DAT_00085f50_cosine)
#define DAT_00085f54 (*(const undefined1 *)((const char *)(const void *)DAT_00085f50_cosine + 2))
#define DAT_00086260 DAT_00086260_backing[0]
#define DAT_00086264 DAT_00086264_backing[0]
/* Recovered from UU.exe .data: the renderer's sine (0x85d48) and cosine (0x85f50) tables, 256 int16
   entries each, amplitude 32767 -- sine[i] = round(32767 * sin(i*PI/128)); cosine[i] =
   sine[(i+64)&255]. */
static const short DAT_00085d48_sine[260] = {
  0, 804, 1608, 2411, 3212, 4011, 4808, 5602, 6393, 7180, 7962, 8740,
  9512, 10279, 11039, 11793, 12540, 13279, 14010, 14733, 15447, 16151, 16846, 17531,
  18205, 18868, 19520, 20160, 20788, 21403, 22006, 22595, 23170, 23732, 24279, 24812,
  25330, 25833, 26320, 26791, 27246, 27684, 28106, 28511, 28899, 29269, 29622, 29957,
  30274, 30572, 30853, 31114, 31357, 31581, 31786, 31972, 32138, 32286, 32413, 32522,
  32610, 32679, 32729, 32758, 32767, 32758, 32729, 32679, 32610, 32522, 32413, 32286,
  32138, 31972, 31786, 31581, 31357, 31114, 30853, 30572, 30274, 29957, 29622, 29269,
  28899, 28511, 28106, 27684, 27246, 26791, 26320, 25833, 25330, 24812, 24279, 23732,
  23170, 22595, 22006, 21403, 20788, 20160, 19520, 18868, 18205, 17531, 16846, 16151,
  15447, 14733, 14010, 13279, 12540, 11793, 11039, 10279, 9512, 8740, 7962, 7180,
  6393, 5602, 4808, 4011, 3212, 2411, 1608, 804, 0, -804, -1608, -2411,
  -3212, -4011, -4808, -5602, -6393, -7180, -7962, -8740, -9512, -10279, -11039, -11793,
  -12540, -13279, -14010, -14733, -15447, -16151, -16846, -17531, -18205, -18868, -19520, -20160,
  -20788, -21403, -22006, -22595, -23170, -23732, -24279, -24812, -25330, -25833, -26320, -26791,
  -27246, -27684, -28106, -28511, -28899, -29269, -29622, -29957, -30274, -30572, -30853, -31114,
  -31357, -31581, -31786, -31972, -32138, -32286, -32413, -32522, -32610, -32679, -32729, -32758,
  -32767, -32758, -32729, -32679, -32610, -32522, -32413, -32286, -32138, -31972, -31786, -31581,
  -31357, -31114, -30853, -30572, -30274, -29957, -29622, -29269, -28899, -28511, -28106, -27684,
  -27246, -26791, -26320, -25833, -25330, -24812, -24279, -23732, -23170, -22595, -22006, -21403,
  -20788, -20160, -19520, -18868, -18205, -17531, -16846, -16151, -15447, -14733, -14010, -13279,
  -12540, -11793, -11039, -10279, -9512, -8740, -7962, -7180, -6393, -5602, -4808, -4011,
  -3212, -2411, -1608, -804, 0, 0, 0, 0,
};
static const short DAT_00085f50_cosine[260] = {
  32767, 32758, 32729, 32679, 32610, 32522, 32413, 32286, 32138, 31972, 31786, 31581,
  31357, 31114, 30853, 30572, 30274, 29957, 29622, 29269, 28899, 28511, 28106, 27684,
  27246, 26791, 26320, 25833, 25330, 24812, 24279, 23732, 23170, 22595, 22006, 21403,
  20788, 20160, 19520, 18868, 18205, 17531, 16846, 16151, 15447, 14733, 14010, 13279,
  12540, 11793, 11039, 10279, 9512, 8740, 7962, 7180, 6393, 5602, 4808, 4011,
  3212, 2411, 1608, 804, 0, -804, -1608, -2411, -3212, -4011, -4808, -5602,
  -6393, -7180, -7962, -8740, -9512, -10279, -11039, -11793, -12540, -13279, -14010, -14733,
  -15447, -16151, -16846, -17531, -18205, -18868, -19520, -20160, -20788, -21403, -22006, -22595,
  -23170, -23732, -24279, -24812, -25330, -25833, -26320, -26791, -27246, -27684, -28106, -28511,
  -28899, -29269, -29622, -29957, -30274, -30572, -30853, -31114, -31357, -31581, -31786, -31972,
  -32138, -32286, -32413, -32522, -32610, -32679, -32729, -32758, -32767, -32758, -32729, -32679,
  -32610, -32522, -32413, -32286, -32138, -31972, -31786, -31581, -31357, -31114, -30853, -30572,
  -30274, -29957, -29622, -29269, -28899, -28511, -28106, -27684, -27246, -26791, -26320, -25833,
  -25330, -24812, -24279, -23732, -23170, -22595, -22006, -21403, -20788, -20160, -19520, -18868,
  -18205, -17531, -16846, -16151, -15447, -14733, -14010, -13279, -12540, -11793, -11039, -10279,
  -9512, -8740, -7962, -7180, -6393, -5602, -4808, -4011, -3212, -2411, -1608, -804,
  0, 804, 1608, 2411, 3212, 4011, 4808, 5602, 6393, 7180, 7962, 8740,
  9512, 10279, 11039, 11793, 12540, 13279, 14010, 14733, 15447, 16151, 16846, 17531,
  18205, 18868, 19520, 20160, 20788, 21403, 22006, 22595, 23170, 23732, 24279, 24812,
  25330, 25833, 26320, 26791, 27246, 27684, 28106, 28511, 28899, 29269, 29622, 29957,
  30274, 30572, 30853, 31114, 31357, 31581, 31786, 31972, 32138, 32286, 32413, 32522,
  32610, 32679, 32729, 32758, 32767, 0, 0, 0,
};
/* Were bare 1-byte scalars, but lookup_arctan_primary_range/ lookup_arctan_reciprocal_range index
   them as `*(ushort *)(&DAT_00086260 + iVar1)` with iVar1 up to (0xff * 4) == 0x3fc... */
static undefined1 DAT_00086260_backing[1024];
static undefined1 DAT_00086264_backing[1024];




// was FUN_00069eb0 -- gated single step: only if stepping *param_1 by (param_3 * param_4) would
// already reach or cross the bound param_2 (checked one direction for param_4==-1, the other
// otherwise) does it actually apply that step and return true...
bool step_value_toward_limit(short *value, short limit, short step, short direction)
{
  int current = (int)*value;
  int step_size = (int)step;
  bool reaches_limit;

  if (direction == -1) {
    reaches_limit = (int)limit <= current - step_size;
  }
  else {
    reaches_limit = step_size + current <= (int)limit;
  }
  if (reaches_limit) {
    *value = (short)((uint)((step_size * direction + current) * 0x10000) >> 0x10);
  }
  return reaches_limit;
}



// was FUN_00069f2c -- disassembly-confirmed faithful: given a compass heading (param_1) and a
// distance (param_2), looks up heading_to_sine_cosine and adds `*param_4(Y) += sin(heading)*dist`,
// `*param_3(X) += cos(heading)*dist` -- the standard heading->direction- vector projection...
void project_position_by_heading(int heading, short distance, void *x_ptr, void *y_ptr)
{
  short *x = (short *)x_ptr;
  short *y = (short *)y_ptr;
  short sine;
  short cosine;
  int scaled;
  short y_step;
  short x_step;

  heading_to_sine_cosine((0x40U - heading & 0xff) << 8, &sine, &cosine);
  scaled = (int)sine;
  if (scaled < 0) {
    scaled = scaled + 0x7f;
  }
  scaled = (scaled >> 7) * (int)distance * 0x10000 >> 0x10;
  if (scaled < 0) {
    scaled = scaled + 0xff;
  }
  y_step = (short)((uint)scaled >> 8);
  scaled = (int)cosine;
  if (scaled < 0) {
    scaled = scaled + 0x7f;
  }
  scaled = (scaled >> 7) * (int)distance * 0x10000 >> 0x10;
  if (scaled < 0) {
    scaled = scaled + 0xff;
  }
  x_step = (short)((uint)scaled >> 8);
  /* Round each step away from zero by one unit. */
  if (y_step < 1) {
    if (y_step < 0) {
      y_step = y_step + -1;
    }
  }
  else {
    y_step = y_step + 1;
  }
  if (x_step < 1) {
    if (x_step < 0) {
      x_step = x_step + -1;
    }
  }
  else {
    x_step = x_step + 1;
  }
  *y = *y + y_step;
  *x = *x + x_step;
}




// was FUN_0006a034 -- busy-waits (spinning on read_realtime_clock_units)
// for param_1 milliseconds.
void busy_wait_ms(uint milliseconds)
{
  int start = read_realtime_clock_units();
  uint now;

  do {
    now = read_realtime_clock_units();
  } while (now < start + (milliseconds & 0xffff));
}



// was FUN_0006a058 -- classic "base + NdM" dice roll: param_1 doubles as both the starting value
// and the iteration count, and each of param_1 iterations adds a random 0..param_2-1 roll to the
// running total.
int roll_dice_sum(int base_and_dice, short sides)
{
  int total = base_and_dice;
  int dice_left;
  short roll;

  if ((0 < sides) && (dice_left = (int)(short)base_and_dice, 0 < dice_left)) {
    do {
      dice_left = (dice_left + -1) * 0x10000 >> 0x10;
      roll = rand_below((int)sides);
      total = total + roll;
    } while (dice_left != 0);
  }
  return total;
}



// was FUN_00013774 -- integer square root via Newton's method (bit- shift initial guess, refine
// with ordint_divmod division until the estimate stops decreasing).
int integer_sqrt(int value)
{
  int estimate = value;
  int next = value >> 1;

  if (1 < value) {
    do {
      estimate = next;
      next = ordint_divmod(estimate, value).quot;
      next = (estimate + next) >> 1;
    } while (next < estimate);
  }
  return estimate;
}


// was FUN_00049c64 -- look up DAT_00085d48_sine/DAT_00085f50_cosine by
// the angle byte packed via pack_angle_byte, writing sin(angle) into
// *param_2 and cos(angle) into *param_3.
void heading_to_sine_cosine(uint heading_word, short *sine, short *cosine)
{
  ushort table_index = pack_angle_byte(heading_word, (heading_word & 0xffff) >> 8, 0);

  *sine = *(short *)(&DAT_00085d48 + (short)(table_index & 0xff) * 2);
  *cosine = *(short *)(&DAT_00085f50 + (short)(table_index & 0xff) * 2);
}



// was FUN_00049cc0 -- pack param_1's low byte and param_2's low byte into one 16-bit value,
// param_2's byte going into the high or low half depending on param_3. Small shared helper used by
// heading_to_sine_cosine and angle_to_screen_delta.
uint pack_angle_byte(uint word, uint new_byte, int into_high_byte)
{
  if (into_high_byte == 0) {
    return word & 0xff00 | new_byte & 0xff;
  }
  return word & 0xff | (new_byte & 0xff) << 8;
}



// was FUN_00049ce8
void angle_to_screen_delta(uint angle_word, void *out_sine_ptr, void *out_cosine_ptr)
{
  short *out_sine = (short *)out_sine_ptr;
  short *out_cosine = (short *)out_cosine_ptr;
  ushort table_index = pack_angle_byte(angle_word, (angle_word & 0xffff) >> 8, 0);
  int offset = (short)(table_index & 0xff) * 2;
  int fraction = (int)(short)((ushort)angle_word & 0xff);
  int interpolated;

  /* Linear interpolation between adjacent table entries, using the angle's low byte as the fraction. */
  interpolated = ((int)*(short *)(&DAT_00085d48 + offset) +
                 ((((int)*(short *)(&DAT_00085d4c + offset) - (int)*(short *)(&DAT_00085d48 + offset)) *
                   0x10000 >> 0x10) * fraction >> 8)) * 0x10000;
  *out_sine = (short)((uint)interpolated >> 0x10);
  offset = (short)(table_index & 0xff) * 2;
  interpolated = ((int)*(short *)(&DAT_00085f50 + offset) +
                 ((((int)*(short *)(&DAT_00085f54 + offset) - (int)*(short *)(&DAT_00085f50 + offset)) *
                   0x10000 >> 0x10) * fraction >> 8)) * 0x10000;
  *out_cosine = (short)((uint)interpolated >> 0x10);
}



// was FUN_00049db8 -- compute_angle_from_slope's "primary range" sub-helper (|ratio| < ~1.0):
// interpolates a fixed-point arctangent lookup table (&DAT_00086260/DAT_00086264) by the ratio's
// packed angle-byte index, restoring the input's original sign at the end.
int lookup_arctan_primary_range(uint ratio)
{
  uint sign = (ratio & 0xffff) >> 8;
  uint magnitude = (ratio & 0xff ^ sign) - sign;
  uint index_word = pack_angle_byte(0, (magnitude & 0xffff) >> 8, 0);
  int offset = (index_word & 0xff) * 4;
  ushort base_value = *(ushort *)(&DAT_00086260 + offset);
  uint scaled = (magnitude & 0xff) * ((uint)*(ushort *)(&DAT_00086264 + offset) - (uint)base_value & 0xffff);
  uint carry = (int)scaled >> 0x10;
  uint fraction = pack_angle_byte(scaled & 0xffff, (scaled & 0xffff) >> 8, 0);

  return ((fraction & 0xff | carry << 8) + (uint)base_value ^ carry) - carry;
}



// was FUN_00049eb8 -- compute_angle_from_slope's "reciprocal range" sub-helper (|ratio| >= ~1.0):
// same arctangent table lookup as lookup_arctan_primary_range, used for the classic atan2
// reduce-to-45-degrees technique (90 degrees minus atan(1/ratio)).
int lookup_arctan_reciprocal_range(uint ratio)
{
  uint sign = (ratio & 0xffff) >> 8;
  uint magnitude = (ratio & 0xff ^ sign) - sign;
  uint index_word = pack_angle_byte(ratio, (magnitude & 0xffff) >> 8, 0);
  int offset = (index_word & 0xff) * 4;
  ushort base_value = *(ushort *)(&DAT_00086260 + offset);
  uint scaled = (magnitude & 0xff) * ((uint)*(ushort *)(&DAT_00086264 + offset) - (uint)base_value & 0xffff);
  uint carry = (int)scaled >> 0x10;
  uint fraction = pack_angle_byte(scaled & 0xffff, (scaled & 0xffff) >> 8, 0);

  return ((fraction & 0xff | carry << 8) + (uint)base_value ^ carry) - carry;
}



// was FUN_00049fb4 -- per src/combat.c's own comment, an atan2-shaped helper fed slope ratios:
// dispatches to lookup_arctan_primary_range for ratios within +-0x5a83 (~1.0 in this fixed-point
// scale), otherwise lookup_arctan_reciprocal_range...
int compute_angle_from_slope(ushort slope, uint reciprocal_slope)
{
  int angle;
  uint reciprocal_angle;

  if (((short)slope < 0x5a83) && (-0x5a83 < (short)slope)) {
    angle = lookup_arctan_primary_range(slope);
    if ((short)angle < 0) {
      angle = 0x8000 - angle;
    }
  }
  else {
    reciprocal_angle = lookup_arctan_reciprocal_range(reciprocal_slope);
    angle = (reciprocal_angle ^ slope >> 8) - (uint)(slope >> 8);
  }
  return angle;
}


/* Bounded random: rand() % param_1. The original takes the modulo from ordint_divmod's (idivmod's)
   r1 remainder leftover -- Ghidra lost that into an uninitialised `extraout_r1`, so it always
   returned garbage (and with ce_rand stubbed to 0, effectively always 0). */
// was FUN_00022910
uint rand_below(int limit)
{
  if (limit == 0) {
    return 0;
  }
  return (uint)ce_rand() % (uint)limit;
}



// was FUN_0002294c -- GetTickCount-shaped: GetTickCount() (SDL_GetTicks(), real elapsed ms since
// startup) scaled down to 4ms-per-unit.
uint read_realtime_clock_units()
{
  return (uint)GetTickCount() >> 2;
}
