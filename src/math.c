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
