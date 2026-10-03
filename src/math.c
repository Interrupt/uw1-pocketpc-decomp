/* General math/geometry helpers: threshold-gated value stepping and
 * heading-to-direction-vector projection. Split out of uw.c (the
 * original monolithic decompile) once these functions' real roles
 * were confirmed.
 */
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
/* Recovered from UU.exe .data: the renderer's sine (0x85d48) and cosine
   (0x85f50) tables, 256 int16 entries each, amplitude 32767 --
   sine[i] = round(32767 * sin(i*PI/128)); cosine[i] = sine[(i+64)&255].
   Both were silently-zero 64KB Ghidra backing arrays, so angle_to_screen_delta
   (angle -> screen delta) returned {0,0} for every angle. That zeroed
   the entry-0 direction vector seed_visibility_queue seeds the visibility
   flood-fill with, so advance_visibility_ray did no expansion,
   run_visibility_flood marked no tile visible, and the 3D tile list
   came out empty (black viewport). It also broke every other bit of
   angle math in the projection code. Four trailing pad shorts each
   (angle_to_screen_delta interpolates to table[idx+1], so idx can reach 256).
   DAT_00085d4c / DAT_00085f54 are &table + 2 == &table[1], the "next" sample:
   the angle's high byte is the coarse index 0..255 (single-step, period 256)
   and the low byte the 0..255 lerp fraction, so the next sample is +1 entry
   (+2 bytes). Was &table + 4 (== &table[2]) -- an off-by-one-entry that
   skipped every other sample and gave the wrong direction for any heading
   whose coarse index was odd, so a turned player kept walking the old way. */
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
/* Were bare 1-byte scalars, but lookup_arctan_primary_range/
   lookup_arctan_reciprocal_range index them as `*(ushort *)(&DAT_00086260
   + iVar1)` with iVar1 up to (0xff * 4) == 0x3fc -- the same
   scalar-declared-but-accessed-as-array bug class fixed many times
   this session (e.g. the glyph-width-table cluster). Likely a second
   lookup table analogous to the sine/cosine ones just above (same
   "DAT_X / DAT_X+4 is the next sample" shape), but unlike those this
   data isn't flagged as recovered from UU.exe anywhere in this
   decompile -- widened to real, safely-sized backing storage (zero-
   initialized, not recovered) purely to make the access safe; the
   real table contents, if this lookup is currently silently broken
   the same way the sine/cosine tables were before their own fix, are
   not recovered here. Macro defines for all of these (and the
   sine/cosine tables above) now live in uw.h, since the functions that
   read them moved into src/math.c. */
static undefined1 DAT_00086260_backing[1024];
static undefined1 DAT_00086264_backing[1024];




// was FUN_00069eb0 -- gated single step: only if stepping *param_1 by
// (param_3 * param_4) would already reach or cross the bound param_2
// (checked one direction for param_4==-1, the other otherwise) does it
// actually apply that step and return true; otherwise *param_1 is left
// untouched and it returns false. A threshold-crossing step helper --
// used for both the debug camera-pitch adjust keys and a scroll-
// position stepper.
bool step_value_toward_limit(param_1,param_2,param_3,param_4)
short * param_1;
short param_2;
short param_3;
short param_4;

{
  int iVar1;
  bool bVar2;
  int iVar3;
  
  iVar3 = (int)*param_1;
  iVar1 = (int)param_3;
  if (param_4 == -1) {
    if ((int)param_2 <= iVar3 - iVar1) {
LAB_00069f08:
      bVar2 = true;
      goto LAB_00069ee8;
    }
  }
  else if (iVar1 + iVar3 <= (int)param_2) goto LAB_00069f08;
  bVar2 = false;
LAB_00069ee8:
  if (bVar2) {
    *param_1 = (short)((uint)((iVar1 * param_4 + iVar3) * 0x10000) >> 0x10);
  }
  return bVar2;
}



// was FUN_00069f2c -- disassembly-confirmed faithful: given a compass
// heading (param_1) and a distance (param_2), looks up
// heading_to_sine_cosine and adds `*param_4(Y) += sin(heading)*dist`,
// `*param_3(X) += cos(heading)*dist` -- the standard heading->direction-
// vector projection, used to compute where a thrown/dropped object's
// trajectory lands relative to the thrower's position.
void project_position_by_heading(param_1,param_2,param_3,param_4)
int param_1;
short param_2;
short * param_3;
short * param_4;

{
  short sVar1;
  short sVar2;
  int iVar3;
  short local_14;
  short local_12;
  
  heading_to_sine_cosine((0x40U - param_1 & 0xff) << 8,&local_14,&local_12);
  iVar3 = (int)local_14;
  if (iVar3 < 0) {
    iVar3 = iVar3 + 0x7f;
  }
  iVar3 = (iVar3 >> 7) * (int)param_2 * 0x10000 >> 0x10;
  if (iVar3 < 0) {
    iVar3 = iVar3 + 0xff;
  }
  sVar1 = (short)((uint)iVar3 >> 8);
  iVar3 = (int)local_12;
  if (iVar3 < 0) {
    iVar3 = iVar3 + 0x7f;
  }
  iVar3 = (iVar3 >> 7) * (int)param_2 * 0x10000 >> 0x10;
  if (iVar3 < 0) {
    iVar3 = iVar3 + 0xff;
  }
  sVar2 = (short)((uint)iVar3 >> 8);
  if (sVar1 < 1) {
    if (sVar1 < 0) {
      sVar1 = sVar1 + -1;
    }
  }
  else {
    sVar1 = sVar1 + 1;
  }
  if (sVar2 < 1) {
    if (sVar2 < 0) {
      sVar2 = sVar2 + -1;
    }
  }
  else {
    sVar2 = sVar2 + 1;
  }
  *param_4 = *param_4 + sVar1;
  *param_3 = *param_3 + sVar2;
  return;
}




// was FUN_0006a034 -- busy-waits (spinning on read_realtime_clock_units)
// for param_1 milliseconds.
void busy_wait_ms(param_1)
uint param_1;

{
  int iVar1;
  uint uVar2;
  
  iVar1 = read_realtime_clock_units();
  do {
    uVar2 = read_realtime_clock_units();
  } while (uVar2 < iVar1 + (param_1 & 0xffff));
  return;
}



// was FUN_0006a058 -- classic "base + NdM" dice roll: param_1 doubles
// as both the starting value and the iteration count, and each of
// param_1 iterations adds a random 0..param_2-1 roll to the running
// total. Used extensively (~20 call sites) for combat damage, loot
// quantities, and other randomized game values.
int roll_dice_sum(param_1,param_2)
int param_1;
short param_2;

{
  short sVar1;
  int iVar2;
  
  if ((0 < param_2) && (iVar2 = (int)(short)param_1, 0 < iVar2)) {
    do {
      iVar2 = (iVar2 + -1) * 0x10000 >> 0x10;
      sVar1 = rand_below((int)param_2);
      param_1 = param_1 + sVar1;
    } while (iVar2 != 0);
  }
  return param_1;
}



// was FUN_00013774 -- integer square root via Newton's method (bit-
// shift initial guess, refine with ordint_divmod division until the
// estimate stops decreasing). Confirmed by src/audio.c's own comment
// as "a sqrt-shaped distance function"; every confirmed caller passes
// a sum-of-squares (dx*dx + dy*dy, the canonical "distance squared"
// expression used throughout this codebase's positioning/AI math).
int integer_sqrt(param_1)
int param_1;

{
  int iVar1;
  int iVar2;
  
  iVar2 = param_1;
  iVar1 = param_1 >> 1;
  if (1 < param_1) {
    do {
      iVar2 = iVar1;
      iVar1 = ordint_divmod(iVar2,param_1).quot;
      iVar1 = iVar2 + iVar1 >> 1;
    } while (iVar1 < iVar2);
  }
  return iVar2;
}


// was FUN_00049c64 -- look up DAT_00085d48_sine/DAT_00085f50_cosine by
// the angle byte packed via pack_angle_byte, writing sin(angle) into
// *param_2 and cos(angle) into *param_3.
void heading_to_sine_cosine(param_1,param_2,param_3)
uint param_1;
undefined2 * param_2;
undefined2 * param_3;

{
  ushort uVar1;

  uVar1 = pack_angle_byte(param_1,(param_1 & 0xffff) >> 8,0);
  *param_2 = *(undefined2 *)(&DAT_00085d48 + (short)(uVar1 & 0xff) * 2);
  *param_3 = *(undefined2 *)(&DAT_00085f50 + (short)(uVar1 & 0xff) * 2);
  return;
}



// was FUN_00049cc0 -- pack param_1's low byte and param_2's low byte
// into one 16-bit value, param_2's byte going into the high or low half
// depending on param_3. Small shared helper used by
// heading_to_sine_cosine and angle_to_screen_delta.
uint pack_angle_byte(param_1,param_2,param_3)
uint param_1;
uint param_2;
int param_3;

{
  uint uVar1;
  
  if (param_3 == 0) {
    uVar1 = param_1 & 0xff00 | param_2 & 0xff;
  }
  else {
    uVar1 = param_1 & 0xff | (param_2 & 0xff) << 8;
  }
  return uVar1;
}



// was FUN_00049ce8
void angle_to_screen_delta(param_1,param_2,param_3)
uint param_1;
undefined1 * param_2;
undefined1 * param_3;

{
  int iVar1;
  int iVar2;
  int iVar3;
  ushort uVar4;
  
  uVar4 = pack_angle_byte(param_1,(param_1 & 0xffff) >> 8,0);
  iVar1 = (short)(uVar4 & 0xff) * 2;
  iVar3 = (int)(short)((ushort)param_1 & 0xff);
  iVar1 = ((int)*(short *)(&DAT_00085d48 + iVar1) +
          ((((int)*(short *)(&DAT_00085d4c + iVar1) - (int)*(short *)(&DAT_00085d48 + iVar1)) *
            0x10000 >> 0x10) * iVar3 >> 8)) * 0x10000;
  *param_2 = (char)((uint)iVar1 >> 0x10);
  iVar2 = (short)(uVar4 & 0xff) * 2;
  param_2[1] = (char)((uint)iVar1 >> 0x18);
  iVar1 = ((int)*(short *)(&DAT_00085f50 + iVar2) +
          ((((int)*(short *)(&DAT_00085f54 + iVar2) - (int)*(short *)(&DAT_00085f50 + iVar2)) *
            0x10000 >> 0x10) * iVar3 >> 8)) * 0x10000;
  *param_3 = (char)((uint)iVar1 >> 0x10);
  param_3[1] = (char)((uint)iVar1 >> 0x18);
  return;
}



// was FUN_00049db8 -- compute_angle_from_slope's "primary range"
// sub-helper (|ratio| < ~1.0): interpolates a fixed-point arctangent
// lookup table (&DAT_00086260/DAT_00086264) by the ratio's packed
// angle-byte index, restoring the input's original sign at the end.
int lookup_arctan_primary_range(param_1)
uint param_1;

{
  int iVar1;
  ushort uVar2;
  uint uVar3;
  uint uVar4;

  uVar3 = (param_1 & 0xffff) >> 8;
  uVar3 = (param_1 & 0xff ^ uVar3) - uVar3;
  uVar4 = pack_angle_byte(0,(uVar3 & 0xffff) >> 8,0);
  iVar1 = (uVar4 & 0xff) * 4;
  uVar2 = *(ushort *)(&DAT_00086260 + iVar1);
  uVar4 = (uVar3 & 0xff) * ((uint)*(ushort *)(&DAT_00086264 + iVar1) - (uint)uVar2 & 0xffff);
  uVar3 = (int)uVar4 >> 0x10;
  uVar4 = pack_angle_byte(uVar4 & 0xffff,(uVar4 & 0xffff) >> 8,0);
  return ((uVar4 & 0xff | uVar3 << 8) + (uint)uVar2 ^ uVar3) - uVar3;
}



// was FUN_00049eb8 -- compute_angle_from_slope's "reciprocal range"
// sub-helper (|ratio| >= ~1.0): same arctangent table lookup as
// lookup_arctan_primary_range, used for the classic atan2
// reduce-to-45-degrees technique (90 degrees minus atan(1/ratio)).
int lookup_arctan_reciprocal_range(param_1)
uint param_1;

{
  int iVar1;
  ushort uVar2;
  uint uVar3;
  uint uVar4;

  uVar4 = (param_1 & 0xffff) >> 8;
  uVar4 = (param_1 & 0xff ^ uVar4) - uVar4;
  uVar3 = pack_angle_byte(param_1,(uVar4 & 0xffff) >> 8,0);
  iVar1 = (uVar3 & 0xff) * 4;
  uVar2 = *(ushort *)(&DAT_00086260 + iVar1);
  uVar3 = (uVar4 & 0xff) * ((uint)*(ushort *)(&DAT_00086264 + iVar1) - (uint)uVar2 & 0xffff);
  uVar4 = (int)uVar3 >> 0x10;
  uVar3 = pack_angle_byte(uVar3 & 0xffff,(uVar3 & 0xffff) >> 8,0);
  return ((uVar3 & 0xff | uVar4 << 8) + (uint)uVar2 ^ uVar4) - uVar4;
}



// was FUN_00049fb4 -- per src/combat.c's own comment, an atan2-shaped
// helper fed slope ratios: dispatches to lookup_arctan_primary_range
// for ratios within +-0x5a83 (~1.0 in this fixed-point scale),
// otherwise lookup_arctan_reciprocal_range, applying the appropriate
// sign/range correction to produce a full heading angle.
int compute_angle_from_slope(param_1,param_2)
ushort param_1;
undefined4 param_2;

{
  int iVar1;
  uint uVar2;

  if (((short)param_1 < 0x5a83) && (-0x5a83 < (short)param_1)) {
    iVar1 = lookup_arctan_primary_range();
    if ((short)iVar1 < 0) {
      iVar1 = 0x8000 - iVar1;
    }
  }
  else {
    uVar2 = lookup_arctan_reciprocal_range(param_2);
    iVar1 = (uVar2 ^ param_1 >> 8) - (uint)(param_1 >> 8);
  }
  return iVar1;
}


/* Bounded random: rand() % param_1. The original takes the modulo from
   ordint_divmod's (idivmod's) r1 remainder leftover -- Ghidra lost that
   into an uninitialised `extraout_r1`, so it always returned garbage
   (and with ce_rand stubbed to 0, effectively always 0). Compute
   the modulo directly. */
// was FUN_00022910
undefined4 rand_below(param_1)
int param_1;

{
  if (param_1 == 0) {
    return 0;
  }
  return (undefined4)((uint)ce_rand() % (uint)param_1);
}



// was FUN_0002294c -- GetTickCount-shaped: GetTickCount() (SDL_GetTicks(),
// real elapsed ms since startup) scaled down to 4ms-per-unit. Used
// throughout this file (fades, double-click/hold timing, the attack-swing
// state machine, movement_pacing_handler's pre-uw_frame_clock_ms reads,
// ...) as the generic "what time is it" source; some callers (e.g.
// move_key_directional_step's own tail) busy-spin on it in a tight loop
// with no event pump in between, so it must keep returning genuine
// real-time -- see uw_frame_clock_ms's own comment for why movement's
// deterministic clock is a separate function, not a change here.
uint read_realtime_clock_units()

{
  uint uVar1;

  uVar1 = GetTickCount();
  return uVar1 >> 2;
}
