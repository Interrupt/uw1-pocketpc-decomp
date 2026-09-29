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

