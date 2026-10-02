/* General math/geometry helpers: threshold-gated value stepping and
 * heading-to-direction-vector projection. Split out of uw.c (the
 * original monolithic decompile) once these functions' real roles
 * were confirmed.
 */
#include "headers/math.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>




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
// shift initial guess, refine with Ordinal_2005 division until the
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
      iVar1 = Ordinal_2005(iVar2,param_1);
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
   Ordinal_2005's (idivmod's) r1 remainder leftover -- Ghidra lost that
   into an uninitialised `extraout_r1`, so it always returned garbage
   (and with Ordinal_1053 stubbed to 0, effectively always 0). Compute
   the modulo directly. */
// was FUN_00022910
undefined4 rand_below(param_1)
int param_1;

{
  if (param_1 == 0) {
    return 0;
  }
  return (undefined4)((uint)Ordinal_1053() % (uint)param_1);
}



// was FUN_0002294c -- GetTickCount-shaped: Ordinal_535() (SDL_GetTicks(),
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

  uVar1 = Ordinal_535();
  return uVar1 >> 2;
}
