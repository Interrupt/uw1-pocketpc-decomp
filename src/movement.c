/* Movement collision sweep: the substep integrator, wall-slide/
 * deflect/knockback/land-on-surface resolution, and the reticle
 * object pick. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/movement.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






/* param_1/param_2 were `int`/`undefined4`, truncating the real pointers
   this is always called with (&DAT_00204880, &DAT_002048b0) -- confirmed
   crashing (EXC_BAD_ACCESS, param_1 read back truncated to ~12MB) on a
   real run even after widening the callee-side globals, because the
   truncation was happening right here at the call boundary. g_sweep_velocity/
   DAT_00204874 (assigned from these) are already real pointer-typed
   globals, confirming the intent. Same pointer-truncation pattern fixed
   repeatedly this session. */
// was FUN_0005878c -- per-tick movement + collision sweep (from apply_movement_tick)
void movement_collision_sweep(param_1,param_2)
char *param_1;
char *param_2;

{
  int iVar1;
  char cVar2;
  char cVar3;
  
  cVar3 = '\0';
  g_sweep_velocity = (short *)(param_1 + 6);
  DAT_002049c0 = *(undefined1 *)(param_1 + 0x28);
  DAT_002049bc = 0;
  DAT_00204874 = param_1;
  DAT_002048bc = param_2;
  // PHYSICS: set up this tick's velocity, sub-step count and target heights
  iVar1 = movement_sweep_setup(1,1);
  if (iVar1 != 0) {
    // PHYSICS: sub-tile sweep -- advance the move DAT_00086990+1 sub-steps,
    // colliding (floor/wall/ceiling) at each one; capped at 16 iterations
    while ((int)DAT_00086996 < DAT_00086990 + 1) {
      cVar2 = cVar3 + '\x01';
      if (cVar3 == '\x10') {
        *(undefined1 *)(DAT_00204874 + 0x10) = 0;
        *(undefined1 *)(DAT_00204874 + 0x11) = 0;
        *(undefined1 *)(DAT_00204874 + 10) = 0;
        *(undefined1 *)(DAT_00204874 + 0xb) = 0;
        *(undefined1 *)(DAT_00204874 + 0x14) = 0;
        *(undefined1 *)(DAT_00204874 + 0x15) = 0;
        return;
      }
      // PHYSICS: integrate one sub-step (horizontal, or vertical if falling/climbing)
      iVar1 = sweep_step(1);
      cVar3 = cVar2;
      if (iVar1 != 0) {
        // PHYSICS: this sub-step crossed a cell boundary -- run collision resolution
        sweep_apply_collision();
      }
    }
    // PHYSICS: commit the swept X/Y/Z back into the player movement block
    sweep_writeback_position();
  }
  return;
}



// was FUN_00058878 -- init the per-tick collision-sweep working set from the movement block
void sweep_init_position()

{
  DAT_00202c6c = &DAT_002049c8;
  DAT_002049ce = *(undefined2 *)(DAT_00204874 + 0x21);
  DAT_002049d0 = DAT_00204874[0x25];
  DAT_002049d1 = DAT_00204874[0x26];
  DAT_002049d2 = *(undefined2 *)(DAT_00204874 + 0x23);
  *g_sweep_foot_pos = *(short *)DAT_00204874 >> 5;
  g_sweep_foot_pos[1] = *(short *)(DAT_00204874 + 2) >> 5;
  g_sweep_foot_pos[2] = *(short *)(DAT_00204874 + 4) >> 3;
  DAT_00086980 = (*DAT_00204874 & 0x1f) << 8;
  DAT_00086982 = (DAT_00204874[2] & 0x1f) << 8;
  DAT_00086984 = (DAT_00204874[4] & 7) << 8;
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005898c -- pick the object under the view reticle (-> DAT_00086998 slot, DAT_00086999/9a tile x/y)
void reticle_object_pick()

{
  byte bVar1;
  ushort *puVar2;
  short *psVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  bool bVar7;
  
  DAT_00204878 = 1;
  FUN_00051dd0();
  DAT_00086998 = -1;
  _DAT_0008699f = 0x7f;
  if (*(short *)(DAT_00204874 + 10) < 1) {
    if (*(short *)(DAT_00204874 + 10) == 0) {
      bVar1 = DAT_002049d9;
      if ((int)((uint)*(byte *)(DAT_00204874 + 0x27) + (int)*(short *)((char *)g_sweep_foot_pos + 4)) <
          (int)(uint)DAT_002049d9) {
        bVar1 = DAT_002049d8;
      }
      _DAT_0008699b = (ushort)bVar1;
      if (((DAT_002049dd != 0) || ((char)DAT_002049de < 1)) ||
         (bVar7 = true, (int)(uint)DAT_002049dc < (int)(char)DAT_002049de)) {
        bVar7 = false;
      }
      iVar4 = 0;
      if (DAT_002049dc != 0) {
        do {
          iVar6 = iVar4 * 6;
          puVar2 = (ushort *)FUN_000535fc(*(ushort *)(&DAT_00202c3a + iVar6) >> 6);
          /* FUN_000535fc returns NULL for an empty slot (id bits clear).
             Ghidra dropped the guard; with forward movement now working this
             loop runs (via sweep_collision_flags) and hit the NULL deref. */
          if (puVar2 != (ushort *)0x0 && ((&DAT_00202c97)[(*puVar2 & 0x1ff) * 0xd] & 1) != 0) {
            if (iVar4 < (char)DAT_002049de) {
              if ((bVar7) &&
                 (bVar1 = (&DAT_00202c38)[iVar6], (short)_DAT_0008699b <= (short)(ushort)bVar1)) {
                _DAT_0008699b = (ushort)bVar1;
                DAT_00086998 = (char)iVar4;
              }
            }
            else {
              if ((int)((byte)(&DAT_00202c39)[iVar6] - 1) < (int)_DAT_0008699f) {
                _DAT_0008699f = (byte)(&DAT_00202c39)[iVar6] - 1;
              }
              if (iVar4 < (int)((uint)DAT_002049dd + (int)(char)DAT_002049de)) {
                bVar1 = (&DAT_00202c38)[iVar6];
                if (((int)(short)_DAT_0008699b < (int)(uint)bVar1) &&
                   ((int)(uint)bVar1 < (int)(0x80 - (uint)*(byte *)(DAT_00204874 + 0x26)))) {
                  _DAT_0008699b = (ushort)bVar1;
                  DAT_00086998 = (char)iVar4;
                }
              }
            }
          }
          iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
        } while (iVar4 < (int)(uint)DAT_002049dc);
      }
    }
    else {
      _DAT_0008699b = (ushort)DAT_002049d9;
      if (getenv("UW_DEBUG_WALL"))
        fprintf(stderr, "[reticle-falling] DAT_002049d9=%d DAT_002049de=%d DAT_002049dc=%d foot_z=%d vvel=%d\n",
                (int)DAT_002049d9, (int)(char)DAT_002049de, (int)DAT_002049dc,
                (int)*(short *)((char *)g_sweep_foot_pos + 4), (int)*(short *)(DAT_00204874 + 10));
      iVar4 = (int)(char)DAT_002049de;
      if (0 < iVar4) {
        uVar5 = (uint)DAT_002049dc;
        bVar7 = SBORROW4(iVar4,uVar5);
        iVar6 = iVar4 - uVar5;
        bVar1 = DAT_002049de;
        if (iVar4 <= (int)uVar5) {
          bVar1 = (&DAT_00202c32)[iVar4 * 6];
          bVar7 = SBORROW4((int)(short)(ushort)DAT_002049d9,(uint)bVar1);
          iVar6 = (int)(short)(ushort)DAT_002049d9 - (uint)bVar1;
        }
        if (iVar6 < 0 != bVar7) {
          DAT_00086998 = DAT_002049de - 1;
          _DAT_0008699b = (ushort)bVar1;
        }
      }
      DAT_00204878 = 0;
    }
    goto LAB_00058db4;
  }
  if (DAT_002049dc == 0) {
LAB_00058a64:
    /* No slope/step feature at this sub-position. This whole block (44937-
       44959) is ONLY reached from the *rising* branch (g_vertical_velocity
       >= 1, the `if (*(short*)(DAT_00204874+10) < 1) {...} else {this}`
       split above) -- the falling/at-rest case has its own, separate
       target-height logic a few lines up and never falls through to here.
       So _DAT_0008699b here plays the role of "ceiling", per
       sweep_step_vertical's own header comment ("target surface height --
       floor when falling, ceiling when rising").
       Was `DAT_002049d9` (the tile's flat FLOOR) -- with no real
       overhead feature to define a ceiling, that fed the floor height
       into the "rising -- hit the ceiling if foot > target" check in
       sweep_step_vertical, so a jump's very first upward step (foot Z
       barely above the floor already) immediately registered as hitting
       the "ceiling" and called sweep_land_on_surface(), landing the jump
       before it could rise more than a couple of units -- confirmed live
       via UW_DEBUG_JUMP2 (a rising jump-vert step landing at foot_z=98,
       one unit above floor_z=96, is nowhere near a real ceiling).
       Use `0x80 - player_height` instead -- the same "room's own physical
       top, minus how tall the player is" sentinel already used a few
       lines below as the upper bound for a real candidate ceiling height
       (0x104 area) and elsewhere as the "no floor at all" sentinel -- so
       with no real overhead obstruction, rising is only stopped by the
       room's actual ceiling, not by the floor underfoot.
       NOTE: an earlier comment here claimed this exact substitution had
       already been tried and reverted for making a ledge-walk-off
       "float near the ceiling" and "oscillate beside a drop" -- but
       walking off a ledge only ever *falls* (velocity <= 0), which can
       never reach this rising-only branch, so that regression (if real)
       must have come from elsewhere. Regression-tested this change
       against demo_ceiling_walk2/demo_ceiling_repro/demo_analog_walk3/
       demo_critter_deep/demo_sack_final/demo_save_test/demo_realturn_full
       -- all clean; see [[jump-physics-fix-and-open-integrator-issue]]. */
    _DAT_0008699b = (ushort)(0x80 - (uint)*(byte *)(DAT_00204874 + 0x26));
  }
  else {
    iVar4 = (uint)DAT_002049dd + (int)(char)DAT_002049de;
    if (((int)(uint)DAT_002049dc <= iVar4) || ((char)DAT_002049de < 0)) goto LAB_00058a64;
    DAT_00086998 = DAT_002049dd + DAT_002049de;
    _DAT_0008699b =
         (ushort)(byte)(&DAT_00202c39)[iVar4 * 6] - (ushort)*(byte *)(DAT_00204874 + 0x26);
  }
  DAT_00204878 = 0;
  if ((int)((uint)*(byte *)(DAT_00204874 + 0x25) + (int)*(short *)((char *)g_sweep_foot_pos + 4)) <
      (int)(uint)DAT_002049d9) {
    _DAT_0008699b = (ushort)DAT_002049d9;
    DAT_00204878 = 1;
  }
LAB_00058db4:
  if (DAT_00086998 != -1) {
    psVar3 = (short *)resolve_object_link(&DAT_00202c3a + DAT_00086998 * 6);
    /* resolve_object_link returns NULL when the picked slot carries no object
       link (id bits 6..15 clear).  The slot-selection loop above only tests a
       tile flag via FUN_000535fc(id >> 6), so a slot with id < 0x40 passes the
       filter yet resolves to NULL here.  The ARM original guarded this deref;
       the Ghidra decompile dropped the check, so a turn tick whose reticle pick
       lands on such a slot segfaults in this per-frame path
       (reticle_object_pick <- movement_sweep_setup <- movement_collision_sweep <- apply_movement_tick),
       which is what made scripted in-dungeon turning die mid-spin.  Treat a
       NULL resolve as "nothing under the reticle". */
    if (psVar3 == (short *)0x0) {
      DAT_00086998 = -1;
    }
    else {
      DAT_00086999 = (undefined1)((int)*psVar3 & 0x1ffU);
      DAT_0008699a = (undefined1)(((int)*psVar3 & 0x1ffU) >> 8);
    }
  }
  return;
}



// was FUN_00058e08 -- set up the movement/collision sweep (screen deltas, step DDA state)
undefined4 movement_sweep_setup(param_1,param_2)
int param_1;
int param_2;

{
  uint uVar1;
  uint uVar2;
  bool bVar3;
  ushort uVar4;
  undefined1 uVar5;
  undefined4 uVar6;
  short extraout_r1;
  int iVar7;
  char *iVar8;
  undefined2 uVar9;
  int iVar10;
  short *psVar11;
  short local_20;
  short local_1e;
  
  if (getenv("UW_DEBUG_WALL"))
    fprintf(stderr, "[sweepsetup-wall] off0c=%d off0e=%d off14=%d off12(speed)=%d x_before=%d y_before=%d\n",
            (int)*(short *)(DAT_00204874 + 0xc), (int)*(short *)(DAT_00204874 + 0xe),
            (int)*(short *)(DAT_00204874 + 0x14), (int)*(short *)(DAT_00204874 + 0x12),
            (int)*(short *)(DAT_00204874 + 6), (int)*(short *)(DAT_00204874 + 8));
  angle_to_screen_delta((int)*(short *)(DAT_00204874 + 0x21),&local_20,&local_1e);
  iVar10 = (int)*(short *)(DAT_00204874 + 0x14) * (int)local_20 >> 0xf;
  *(char *)(DAT_00204874 + 6) = (char)iVar10;
  *(char *)(DAT_00204874 + 7) = (char)((uint)iVar10 >> 8);
  iVar10 = (int)*(short *)(DAT_00204874 + 0x14) * (int)local_1e >> 0xf;
  *(char *)(DAT_00204874 + 8) = (char)iVar10;
  *(char *)(DAT_00204874 + 9) = (char)((uint)iVar10 >> 8);
  *g_sweep_velocity = *g_sweep_velocity + *(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0xc);
  g_sweep_velocity[1] =
       g_sweep_velocity[1] + *(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0xe);
  psVar11 = g_sweep_velocity;
  if (getenv("UW_DEBUG_STEPHEIGHT"))
    fprintf(stderr, "[sweepsetup] speed(0x12)=%d fallflag(0x10)=%d vvel_before=%d -> delta=%d\n",
            (int)*(short *)(DAT_00204874 + 0x12), (int)*(short *)(DAT_00204874 + 0x10),
            (int)g_sweep_velocity[2],
            (int)(*(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0x10)));
  g_sweep_velocity[2] =
       g_sweep_velocity[2] + *(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0x10);
  if (getenv("UW_DEBUG_NPC_SPEED"))
    fprintf(stderr, "[npc-velocity] obj=%p speed(0x14)=%d local_20=%d local_1e=%d dir(0xc,0xe,0x10)=(%d,%d,%d) speed2(0x12)=%d -> vel=(%d,%d,%d)\n",
            (void *)DAT_00204874, (int)*(short *)(DAT_00204874 + 0x14), (int)local_20, (int)local_1e,
            (int)*(short *)(DAT_00204874 + 0xc), (int)*(short *)(DAT_00204874 + 0xe), (int)*(short *)(DAT_00204874 + 0x10),
            (int)*(short *)(DAT_00204874 + 0x12),
            (int)*g_sweep_velocity, (int)g_sweep_velocity[1], (int)g_sweep_velocity[2]);
  if ((g_sweep_velocity[1] == 0 && g_sweep_velocity[2] == 0) && *g_sweep_velocity == 0) {
    return 0;
  }
  if (param_1 != 0) {
    sweep_init_position(psVar11);
  }
  iVar8 = DAT_00204874;
  psVar11 = g_sweep_velocity;
  uVar1 = (int)*(short *)(DAT_00204874 + 6) >> 0x1f;
  uVar2 = (int)*(short *)(DAT_00204874 + 8) >> 0x1f;
  bVar3 = (int)(((int)*(short *)(DAT_00204874 + 6) ^ uVar1) - uVar1) <=
          (int)(((int)*(short *)(DAT_00204874 + 8) ^ uVar2) - uVar2);
  DAT_0008698c = (ushort)bVar3;
  iVar10 = (int)(short)(ushort)bVar3;
  uVar5 = 0x20;
  if (psVar11[iVar10] < 1) {
    uVar5 = 0xe0;
  }
  /* DAT_0008698e is the OTHER movement axis (DAT_0008698c is the dominant one,
     0=X or 1=Y). Ghidra dropped the `Ordinal_2005(2, iVar10+1)` whose result
     it wanted and read `extraout_r1` (the division remainder register
     leftover), which is 0 for iVar10 in {0,1} -- so the secondary axis was
     always X and turning never changed the direction of travel. Compute it
     directly: `(iVar10 + 1) % 2` == `1 - iVar10`. (Same register-leftover
     pattern the visibility-flood code documents at ~uw.c:45585.) */
  DAT_0008698e = (short)((iVar10 + 1) % 2);
  (&DAT_00086986)[iVar10 * 2] = 0;
  (&DAT_00086987)[iVar10 * 2] = uVar5;
  if (g_sweep_velocity[(short)DAT_0008698c] == 0) {
    iVar10 = (int)DAT_0008698e;
    (&DAT_00086986)[iVar10 * 2] = 1;
    (&DAT_00086987)[iVar10 * 2] = 0;
    iVar10 = (int)(short)DAT_0008698c;
    (&DAT_00086986)[iVar10 * 2] = 1;
    (&DAT_00086987)[iVar10 * 2] = 0;
    DAT_00086990 = 0;
    DAT_00086992 = 0;
    DAT_00086994 = *(short *)(iVar8 + 0x12);
    psVar11 = g_sweep_velocity;
  }
  else {
    iVar10 = (int)DAT_0008698e;
    iVar7 = (int)*(short *)(&DAT_00086986 + (short)DAT_0008698c * 2);
    if (iVar7 < 0) {
      iVar7 = iVar7 + 0xff;
    }
    uVar5 = Ordinal_2005((int)g_sweep_velocity[(short)DAT_0008698c],
                         (iVar7 >> 8) * (int)g_sweep_velocity[iVar10]);
    iVar10 = iVar10 * 2;
    (&DAT_00086986)[iVar10] = 0;
    (&DAT_00086987)[iVar10] = uVar5;
    psVar11 = g_sweep_velocity;
    iVar10 = (int)*(short *)(iVar8 + 0x12) * (int)g_sweep_velocity[(short)DAT_0008698c] * 0x10000;
    uVar1 = iVar10 >> 0x1f;
    iVar10 = (iVar10 >> 0x10 ^ uVar1) - uVar1;
    DAT_00086992 = (ushort)((uint)(iVar10 * 0x10000) >> 0x10) & 0x1fff;
    DAT_00086990 = (undefined2)(iVar10 >> 0xd);
    uVar6 = Ordinal_2005((int)g_sweep_velocity[(short)DAT_0008698c],0x2000);
    uVar4 = (ushort)((int)uVar6 >> 0x1f);
    DAT_00086994 = ((ushort)uVar6 ^ uVar4) - uVar4;
  }
  DAT_00086996 = 0;
  // PHYSICS: build the destination tile's floor/ceiling height field for collision
  if (((DAT_002049d2 == 1) || (psVar11[2] != 0)) && (param_2 != 0)) {
    collision_build_height_field(*(undefined1 *)(iVar8 + 0x27));
    collision_height_envelope(0,0);
    psVar11 = g_sweep_velocity;
  }
  // PHYSICS: gravity gate -- psVar11[2] is g_sweep_velocity[2], which (g_sweep_velocity
  // == (short*)(DAT_00204874+6)) is *(short*)(DAT_00204874+0xa) -- the exact
  // same memory as g_vertical_velocity itself, just reached through a
  // different pointer/name. So this really is checking g_vertical_velocity
  // directly, and the accumulation a few lines up in this same function
  // (g_sweep_velocity[2] += speed*g_fall_accel) is the ordinary "velocity +=
  // accel*dt" integration -- confirmed against the #define at uw.c:2025.
  // Must be non-zero to run any vertical integration this sweep. It is only
  // set for scripted vertical motion (jump / knockback / slope step); a
  // plain walk off a ledge never sets it, so no gravity accumulates and the
  // step resolver snaps the foot down in one tick.
  if (psVar11[2] == 0) {
    DAT_0008698a = 0;
    return 1;
  }
  /* PHYSICS: seed the vertical direction for the fine sub-integrator from
     the current velocity's sign. (Tried this explicitly via
     g_vertical_velocity instead of psVar11[2] under UW_DEBUG_JUMP2 -- no
     measurable change, because they're the same memory, per the note
     above; this is not an independent alternative, just documenting that
     equivalence was checked.) This does NOT explain why the jump's fine
     vertical integrator (DAT_0008698a/_DAT_000869a1, in sweep_step_vertical)
     barely accumulates net foot-Z movement during a real jump -- that
     remains open, see [[jump-physics-fix-and-open-integrator-issue]]. */
  DAT_0008698a = 0x800;
  if (psVar11[2] < 1) {
    DAT_0008698a = -0x800;
  }
  reticle_object_pick(param_2);
  psVar11 = g_sweep_velocity;
  if (g_sweep_velocity[(short)DAT_0008698c] != 0) {
    iVar10 = (int)*(short *)(&DAT_00086986 + (short)DAT_0008698c * 2);
    if (iVar10 < 0) {
      iVar10 = iVar10 + 0x1fff;
    }
    iVar8 = (int)DAT_0008698a;
    if (iVar8 < 0) {
      iVar8 = iVar8 + 0x7ff;
    }
    iVar10 = Ordinal_2005(((int)(iVar8) >> 0xb) * (int)g_sweep_velocity[(short)DAT_0008698c],
                          (iVar10 >> 0xd) * (int)g_sweep_velocity[2] * 0x100);
    if ((iVar10 < 0x8000) && (-0x8001 < iVar10)) {
      uVar9 = (undefined2)iVar10;
      goto LAB_000592f8;
    }
    DAT_00086992 = 0;
  }
  iVar10 = ((int)psVar11[2] >> 1) * (int)*(short *)(DAT_00204874 + 0x12);
  uVar1 = iVar10 >> 0x1f;
  uVar9 = (undefined2)(((iVar10 >> 5 ^ uVar1) - uVar1) * 0x10000 >> 0x10);
LAB_000592f8:
  // PHYSICS: gravity/climb rate -- _DAT_000869a1 (DAT_000869a1/a2) is the vertical
  // speed the integrator (sweep_step_vertical) accelerates by each sub-step this sweep
  DAT_000869a2 = (char)((ushort)uVar9 >> 8);
  DAT_000869a1 = (char)uVar9;
  return 1;
}



// was FUN_0005932c -- re-seed the sweep for the distance still left (after a
// block/redirect): recompute the remaining-distance field (+0x12), re-run
// movement_sweep_setup, and end the tick if nothing is left or setup fails
void sweep_restart_remaining(param_1)
undefined4 param_1;

{
  int iVar1;
  
  iVar1 = ((int)*(short *)(DAT_00204874 + 0x12) - (int)DAT_00086996 * (int)DAT_00086994) * 0x10000;
  *(char *)(DAT_00204874 + 0x12) = (char)((uint)iVar1 >> 0x10);
  *(char *)(DAT_00204874 + 0x13) = (char)((uint)iVar1 >> 0x18);
  if ((*(short *)(DAT_00204874 + 0x12) < 1) || (iVar1 = movement_sweep_setup(0,param_1), iVar1 == 0)) {
    DAT_00086996 = DAT_00086990 + 1;
  }
  return;
}



// was FUN_000593c0
// PHYSICS: kill all velocity -- zero the horizontal (+6/+8/+0xc/+0xe) and
// vertical (+0xa/+0x10) velocity/accumulator fields and end the sweep. Called
// on a hard blocking hit (0x4000) so the player stops instead of bouncing.
void sweep_kill_velocity()

{
  *(undefined1 *)(DAT_00204874 + 8) = 0;
  *(undefined1 *)(DAT_00204874 + 9) = 0;
  *(undefined1 *)(DAT_00204874 + 0xe) = 0;
  *(undefined1 *)(DAT_00204874 + 0xf) = 0;
  *(undefined1 *)(DAT_00204874 + 6) = 0;
  *(undefined1 *)(DAT_00204874 + 7) = 0;
  *(undefined1 *)(DAT_00204874 + 0xc) = 0;
  *(undefined1 *)(DAT_00204874 + 0xd) = 0;
  *(undefined1 *)(DAT_00204874 + 10) = 0;
  *(undefined1 *)(DAT_00204874 + 0xb) = 0;
  *(undefined1 *)(DAT_00204874 + 0x10) = 0;
  *(undefined1 *)(DAT_00204874 + 0x11) = 0;
  *(undefined1 *)(DAT_00204874 + 0x14) = 0;
  *(undefined1 *)(DAT_00204874 + 0x15) = 0;
  DAT_00086996 = DAT_00086990 + 1;
  return;
}



// was FUN_00059488 -- write the swept X/Y/Z position + heading back into the movement block
void sweep_writeback_position()

{
  uint uVar1;
  undefined2 uVar2;
  int iVar3;
  
  /* Ghidra split three 16-bit stores of the reconstructed player position
     (X at +0, Y at +2, Z at +4 of the movement block) into byte pairs and
     botched the low-byte offset of the 2nd and 3rd: Y-low went to +1 (X's
     high byte) and Z-low to +2 (Y's low byte), while the high bytes stayed
     at the correct +3 / +5. Result: one forward step scrambled X and Y and
     threw the player off the map. Restore proper halfword stores. */
  // PHYSICS: commit swept X (+0), Y (+2) and Z/foot height (+4) to the movement block
  *(short *)(DAT_00204874 + 0) =
       (short)(*g_sweep_foot_pos * 0x20 + (((int)DAT_00086980 << 0x10) >> 0x18));
  *(short *)(DAT_00204874 + 2) =
       (short)(g_sweep_foot_pos[1] * 0x20 + (((int)DAT_00086982 << 0x10) >> 0x18));
  *(short *)(DAT_00204874 + 4) =
       (short)(g_sweep_foot_pos[2] * 8 + (((int)DAT_00086984 << 0x10) >> 0x18));
  if (getenv("UW_DEBUG_JUMP"))
    fprintf(stderr, "[writeback] z_after_commit=%d sweep_z=%d d49d4=0x%x d49d8=%d d49d2=%d byte5=%d fallflag=%d vvel=%d\n",
            (int)*(short *)(DAT_00204874 + 4), (int)g_sweep_foot_pos[2], (unsigned)DAT_002049d4,
            (int)DAT_002049d8, (int)DAT_002049d2, (int)*(char *)(DAT_00204874 + 5),
            (int)*(short *)(DAT_00204874 + 0x10), (int)*(short *)(DAT_00204874 + 0xa));
  if (((((DAT_002049d4 & 0x2000) != 0) &&
       (uVar1 = (int)((int)g_sweep_foot_pos[2] - (uint)DAT_002049d8) >> 0x1f,
       (int)(((int)g_sweep_foot_pos[2] - (uint)DAT_002049d8 ^ uVar1) - uVar1) <=
       (int)(uint)*(byte *)((char *)DAT_00204874 + 0x25))) && (DAT_002049d2 == 1)) &&
     (*(char *)(DAT_00204874 + 5) == 0)) {
    /* re-snap Z (bytes +4..+5) to the floor height. FUN_00050aa8 wants the
       tile X and Y as halfwords; Ghidra rendered the args as X's two bytes
       and stored the result's low byte to +2 (Y-low) instead of +4. */
    uVar2 = FUN_00050aa8(*(short *)(DAT_00204874 + 0),*(short *)(DAT_00204874 + 2));
    if (getenv("UW_DEBUG_JUMP"))
      fprintf(stderr, "[writeback] *** RE-SNAP FIRED *** new_z=%d\n", (int)(short)uVar2);
    *(short *)(DAT_00204874 + 4) = (short)uVar2;
  }
  /* heading is the halfword at +0x21; Ghidra put the high byte at +0x11
     (g_fall_accel's high byte), clobbering the Z-force accumulator. */
  *(short *)(DAT_00204874 + 0x21) = DAT_002049ce;
  return;
}



// was FUN_000595d4 -- integrate one sub-tile step of the movement/collision sweep
// PHYSICS: horizontal integrator -- advances the swept X/Y (g_sweep_foot_pos[0/1])
// along the dominant/secondary axes and carries the sub-cell remainders
int sweep_integrate_substep(param_1,param_2)
short param_1;
short param_2;

{
  int iVar1;
  int iVar2;
  short sVar3;
  
  iVar2 = (int)param_2;
  if ((int)DAT_00086996 < (int)((uint)(iVar2 == -1) + (int)DAT_00086990)) {
    iVar1 = (int)DAT_0008698e;
    sVar3 = *(short *)(&DAT_00086986 + iVar1 * 2);
    if (iVar2 != 1) {
      sVar3 = -sVar3;
    }
    (&DAT_00086980)[iVar1] = sVar3 + (&DAT_00086980)[iVar1];
    iVar1 = (int)DAT_0008698c;
    if (*(short *)(&DAT_00086986 + iVar1 * 2) * iVar2 < 1) {
      sVar3 = g_sweep_foot_pos[iVar1] + -1;
    }
    else {
      sVar3 = g_sweep_foot_pos[iVar1] + 1;
    }
    g_sweep_foot_pos[iVar1] = sVar3;
    iVar2 = (int)DAT_0008698e;
    if (((&DAT_00086980)[iVar2] & 0xe000) != 0) {
      if ((short)(&DAT_00086980)[iVar2] < 1) {
        sVar3 = g_sweep_foot_pos[iVar2] + -1;
      }
      else {
        sVar3 = g_sweep_foot_pos[iVar2] + 1;
      }
      g_sweep_foot_pos[iVar2] = sVar3;
      iVar2 = (int)DAT_0008698e;
      sVar3 = (&DAT_00086980)[iVar2];
      *(char *)(&DAT_00086980 + iVar2) = (char)((int)sVar3 & 0x1fffU);
      *(char *)((intptr_t)&DAT_00086980 + iVar2 * 2 + 1) = (char)(((int)sVar3 & 0x1fffU) >> 8);
    }
    iVar2 = 1;
  }
  else {
    iVar1 = (int)DAT_0008698e;
    sVar3 = (*(short *)(&DAT_00086986 + iVar1 * 2) >> 5) * (short)(char)((ushort)DAT_00086992 >> 8);
    if (iVar2 != 1) {
      sVar3 = -sVar3;
    }
    (&DAT_00086980)[iVar1] = sVar3 + (&DAT_00086980)[iVar1];
    iVar1 = (int)DAT_0008698c;
    sVar3 = DAT_00086992;
    if (*(short *)(&DAT_00086986 + iVar1 * 2) * iVar2 < 1) {
      sVar3 = -DAT_00086992;
    }
    (&DAT_00086980)[iVar1] = (&DAT_00086980)[iVar1] + sVar3;
    if ((DAT_00086980 & 0xe000) != 0) {
      param_1 = 1;
      if ((short)DAT_00086980 < 1) {
        sVar3 = *g_sweep_foot_pos + -1;
      }
      else {
        sVar3 = *g_sweep_foot_pos + 1;
      }
      *g_sweep_foot_pos = sVar3;
      DAT_00086980 = DAT_00086980 & 0x1fff;
    }
    if ((DAT_00086982 & 0xe000) != 0) {
      param_1 = 1;
      if ((short)DAT_00086982 < 1) {
        sVar3 = g_sweep_foot_pos[1] + -1;
      }
      else {
        sVar3 = g_sweep_foot_pos[1] + 1;
      }
      g_sweep_foot_pos[1] = sVar3;
      DAT_00086982 = DAT_00086982 & 0x1fff;
    }
    iVar2 = (int)param_1;
  }
  DAT_00086996 = DAT_00086996 + param_2;
  return iVar2;
}



// was FUN_0005989c -- deflect the move's heading against the wall normal it
// hit (DAT_002049ce) so it slides along the face; returns 0 when the move
// cannot be deflected (dead stop). Used by the slide path.
undefined4 sweep_deflect_heading(param_1)
uint param_1;

{
  int uw_ord2005_rem_120 = 0;
  uint uVar1;
  byte bVar2;
  short sVar3;
  undefined2 uVar4;
  undefined4 uVar5;
  uint uVar6;
  int extraout_r1;
  /* Heading differences and velocity arithmetic must stay signed integers.
   * Ghidra merged these with a later record-pointer role; pointer comparisons
   * treated negative heading differences as large positive addresses. */
  int iVar7;
  char *movement_record;
  char *iVar8;
  bool bVar9;
  
  if ((*(byte *)(DAT_00204874 + 0x17) & 0x40) == 0) {
    iVar7 = (int)*(short *)(DAT_00204874 + 10);
    if (iVar7 != 0) {
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0xf;
      }
      iVar7 = (*(byte *)(DAT_00204874 + 0x16) + 1) * (int)(short)((int)(iVar7) >> 4);
      *(char *)(DAT_00204874 + 10) = (char)iVar7;
      *(char *)(DAT_00204874 + 0xb) = (char)((uint)iVar7 >> 8);
    }
    iVar8 = DAT_00204874;
    sVar3 = (short)(param_1 - (int)DAT_002049ce);
    iVar7 = (int)((param_1 - (int)DAT_002049ce) * 0x10000) >> 0x10;
    if ((0x4000 < iVar7) || (iVar7 < -0x4000)) {
      param_1 = param_1 + 0x8000;
      sVar3 = sVar3 + -0x8000;
    }
    uVar6 = (uint)sVar3;
    uVar1 = (int)uVar6 >> 0x1f;
    if ((*(byte *)(DAT_00204874 + 0x17) & 0x80) == 0) {
      iVar7 = (uVar6 ^ uVar1) - uVar1;
      if ((iVar7 < 0x3001) || (0x4fff < iVar7)) {
        bVar2 = *(byte *)(DAT_00204874 + 0x16);
        sVar3 = Ordinal_2005(0xf);
        sVar3 = (ushort)bVar2 * sVar3;
      }
      sVar3 = (short)param_1 + sVar3;
    }
    else {
      iVar7 = (uVar6 ^ uVar1) - uVar1;
      if ((0x3000 < iVar7) && (iVar7 < 0x5000)) {
        iVar7 = (uint)*(ushort *)(DAT_00204874 + 0x29) + (uint)*(ushort *)(DAT_00204874 + 0x14);
        *(char *)(DAT_00204874 + 0x29) = (char)((uint)((int)(iVar7) * 0x10000) >> 0x10);
        *(char *)(DAT_00204874 + 0x2a) = (char)((uint)iVar7 >> 8);
        goto LAB_000599b0;
      }
      sVar3 = (short)param_1;
      if ((int)DAT_002049ce == (param_1 & 0xffff)) {
        bVar9 = (param_1 & 0x4000) != 0;
        uVar5 = Ordinal_1053();
        uw_ord2005_rem_120 = ((int)(uVar5)) % (2);
        if (uw_ord2005_rem_120 != 0) {
          bVar9 = !bVar9;
        }
        DAT_00086980 = (ushort)bVar9 * 0x1f00;
        DAT_00086982 = (ushort)(uw_ord2005_rem_120 == 0) * 0x1f00;
        iVar8 = DAT_00204874;
        sVar3 = DAT_002049ce;
      }
    }
    DAT_002049ce = sVar3;
    if ((*(byte *)(iVar8 + 0x17) & 0x80) == 0) {
      uVar6 = Ordinal_2005(0xf,(0xf - (uint)*(byte *)(iVar8 + 0x16)) * (int)*(short *)(iVar8 + 0x14)
                          );
      iVar7 = (uint)*(ushort *)(iVar8 + 0x29) + (uVar6 & 0xffff);
      *(char *)(iVar8 + 0x29) = (char)iVar7;
      *(char *)(DAT_00204874 + 0x2a) = (char)((uint)iVar7 >> 8);
      movement_record = DAT_00204874;
      uVar4 = Ordinal_2005(0xf,(uint)*(byte *)(DAT_00204874 + 0x16) *
                               (int)*(short *)(DAT_00204874 + 0x14));
      *(char *)(movement_record + 0x14) = (char)uVar4;
      *(char *)(DAT_00204874 + 0x15) = (char)((ushort)uVar4 >> 8);
      iVar8 = DAT_00204874;
    }
    sVar3 = DAT_002049ce;
    *(char *)(iVar8 + 0x21) = (char)DAT_002049ce;
    *(char *)(DAT_00204874 + 0x22) = (char)((ushort)sVar3 >> 8);
    uVar5 = 1;
  }
  else {
LAB_000599b0:
    uVar5 = 0;
  }
  return uVar5;
}



// was FUN_00059b7c -- PHYSICS: wall collision (slide). Reverts the blocked
// sub-step, deflects the heading along the hit face (sweep_deflect_heading)
// and either resumes the remaining move or ends the tick.
void sweep_slide_along_wall(param_1)
int param_1;

{
  int iVar1;
  ushort uVar2;

  if (getenv("UW_DEBUG_WALL"))
    fprintf(stderr, "[wall-slide] enter param_1=%d DAT_002049bc=%d\n", param_1, (int)DAT_002049bc);
  if ('\0' < DAT_002049bc) {
    if (getenv("UW_DEBUG_WALL"))
      fprintf(stderr, "[wall-slide] -> already-slid guard, revert+end sweep\n");
    sweep_step(0xffffffff);
    DAT_00086996 = DAT_00086990 + 1;
    return;
  }
  if (param_1 != 0) {
    resolve_wall_slide_corner();
    if (getenv("UW_DEBUG_WALL"))
      fprintf(stderr, "[wall-slide] after resolve_wall_slide_corner: DAT_002049da=%d DAT_0008698c=%d\n",
              (int)DAT_002049da, (int)DAT_0008698c);
    uVar2 = (ushort)DAT_002049da;
    if (DAT_002049da != 9) goto LAB_00059be4;
  } else if (getenv("UW_DEBUG_WALL")) {
    fprintf(stderr, "[wall-slide] param_1==0 path, DAT_0008698c=%d\n", (int)DAT_0008698c);
  }
  uVar2 = DAT_0008698c << 1;
LAB_00059be4:
  sweep_step(0xffffffff);
  if (getenv("UW_DEBUG_WALL"))
    fprintf(stderr, "[wall-slide] uVar2=%d candidate_heading=%d DAT_002049ce(cur_heading)=%d\n",
            (int)uVar2, (int)*(short *)(&DAT_000869a8 + (short)uVar2 * 2), (int)DAT_002049ce);
  iVar1 = sweep_deflect_heading(*(undefined2 *)(&DAT_000869a8 + (short)uVar2 * 2));
  if (getenv("UW_DEBUG_WALL"))
    fprintf(stderr, "[wall-slide] sweep_deflect_heading returned %d\n", iVar1);
  if (iVar1 == 0) {
    DAT_00086996 = DAT_00086990 + 1;
  }
  else {
    sweep_restart_remaining(1);
    DAT_002049bc = '\x02';
  }
  return;
}



// was FUN_00059c38 -- PHYSICS: recoil. Seeds a downward vertical velocity
// (+0xa = -0x15, +0x10 = -4) and shoves the facing (+0x21) back by ~0x3000
// plus a random amount -- the stagger/knockback when a move is hard-blocked.
void sweep_apply_knockback()

{
  int uw_ord2005_rem_121 = 0;
  undefined4 uVar1;
  short extraout_r1;
  int iVar2;
  
  *(undefined1 *)(DAT_00204874 + 10) = 0xeb;
  *(undefined1 *)(DAT_00204874 + 0xb) = 0;
  *(undefined1 *)(DAT_00204874 + 0x10) = 0xfc;
  *(undefined1 *)(DAT_00204874 + 0x11) = 0xff;
  if (*(short *)(DAT_00204874 + 0x14) < 0xeb) {
    *(undefined1 *)(DAT_00204874 + 0x14) = 0xeb;
    *(undefined1 *)(DAT_00204874 + 0x15) = 0;
  }
  *(undefined1 *)(DAT_00204874 + 0x28) = 0x10;
  iVar2 = *(short *)(DAT_00204874 + 0x21) + -0x3000;
  *(char *)(DAT_00204874 + 0x21) = (char)iVar2;
  *(char *)(DAT_00204874 + 0x22) = (char)((uint)iVar2 >> 8);
  uVar1 = Ordinal_1053();
  uw_ord2005_rem_121 = ((int)(uVar1)) % (0x6000);
  iVar2 = (int)*(short *)(DAT_00204874 + 0x21) + (int)uw_ord2005_rem_121;
  *(char *)(DAT_00204874 + 0x21) = (char)iVar2;
  *(char *)(DAT_00204874 + 0x22) = (char)((uint)iVar2 >> 8);
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00059d20
// PHYSICS: landing / surface contact -- called when the vertical integrator
// crosses the target height. Derives a landing-impact value (bob/thump on the
// camera via DAT_00204874+9), snaps the foot Z to _DAT_0008699b, clears the
// vertical remainder, and if this was a floor landing kills the fall velocity.
void sweep_land_on_surface()

{
  byte *pbVar1;
  ushort uVar2;
  undefined1 uVar3;
  short sVar4;
  undefined2 uVar5;
  short sVar6;
  ushort *puVar7;
  uint uVar8;
  short *psVar9;
  short sVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  
  puVar7 = (ushort *)FUN_000535fc((int)DAT_002049d2);
  uVar2 = *(ushort *)(&DAT_00202c91 + (*puVar7 & 0x1ff) * 0xd);
  iVar12 = (int)_DAT_000869a1;
  if (iVar12 < 5) {
    sVar4 = 0;
  }
  else {
    uVar11 = (int)*(short *)((char *)g_sweep_foot_pos + 4) - (int)_DAT_0008699b;
    uVar8 = (int)uVar11 >> 0x1f;
    if (iVar12 < 0) {
      iVar12 = iVar12 + 3;
    }
    sVar4 = Ordinal_2005(iVar12 >> 2,
                         (((int)(((uVar11 ^ uVar8) - uVar8) * 0x10000) >> 0x10) * (int)DAT_00086994
                          * 0x10000 >> 0x10) << 4);
    sVar4 = DAT_00204874[9] - sVar4;
  }
  *(char *)(DAT_00204874 + 9) = (char)sVar4;
  *(char *)((char *)DAT_00204874 + 0x13) = (char)((ushort)sVar4 >> 8);
  // PHYSICS: floor/ceiling collision -- snap the foot exactly onto the surface
  // and zero the vertical sub-unit accumulator so gravity restarts from rest
  *(short *)((char *)g_sweep_foot_pos + 4) = _DAT_0008699b;
  psVar9 = DAT_00204874;
  DAT_00086984 = 0;
  /* PHYSICS: fall ended -- clear the accumulated downward velocity (+0xa) and the
     gravity-accel field (+0x10), and drop the airborne locomotion state byte
     (+0x28 == DAT_002048a8) back to "walking" (8). Without the last step
     set_locomotion_state (called every tick from commit_player_move) sees the stale
     airborne state and re-arms +0x10 = -4, so the fall integrator re-enters and
     "lands" every tick forever, freezing the player on the floor. Only when we
     were moving downward, so a jump's own apex handling is left untouched. */
  if (*(short *)(DAT_00204874 + 10) < 0) {
    *(short *)(DAT_00204874 + 10) = 0;
    *(short *)(DAT_00204874 + 0x10) = 0;
    if (*(byte *)(DAT_00204874 + 0x28) == 0x10) {
      *(undefined1 *)(DAT_00204874 + 0x28) = 8;
    }
  }
  if ((((DAT_00086998 == -1) && ((DAT_002049d4 & 1) != 0)) &&
      ((int)*(short *)((char *)g_sweep_foot_pos + 4) <= (int)((uint)DAT_002049d0 + (uint)DAT_002049d8))) &&
     (DAT_00204874[5] < 0)) {
    sweep_kill_velocity();
    *(undefined1 *)(DAT_00204874 + 0x14) = 2;
    uVar3 = Ordinal_2005(0x32,(short)(uVar2 >> 4) + -600);
    play_positional_sound_effect(5,(int)*DAT_00204874 >> 5,(int)DAT_00204874[1] >> 5,uVar3);
    return;
  }
  sVar4 = DAT_00204874[5];
  uVar8 = (int)sVar4 >> 0x1f;
  uVar11 = Ordinal_2005(0x32,(short)(uVar2 >> 4) + -600);
  uVar8 = Ordinal_2005(10,((int)sVar4 ^ uVar8) - uVar8);
  play_positional_sound_effect(0xf,(int)*psVar9 >> 5,(int)psVar9[1] >> 5,(uVar11 & 0xff) + (uVar8 & 0xff) + -0x28);
  uVar8 = FUN_000546c4((int)DAT_00086998,(int)DAT_002049d2);
  psVar9 = DAT_00204874;
  if ((uVar8 & 0x18) != 0) {
    if ((uVar8 & 0x10) != 0) {
      sweep_kill_velocity();
      return;
    }
    DAT_00086996 = DAT_00086990 + 1;
    return;
  }
  if ((uVar8 & 4) == 0) {
    if (DAT_00086998 != -1) {
      DAT_002049dc = DAT_002049dc - 1;
      iVar13 = (uint)DAT_002049dc * 6;
      iVar12 = DAT_00086998 * 6;
      (&DAT_00202c38)[iVar12] = (&DAT_00202c38)[iVar13];
      (&DAT_00202c39)[iVar12] = (&DAT_00202c39)[iVar13];
      (&DAT_00202c3a)[iVar12] = (&DAT_00202c3a)[iVar13];
      (&DAT_00202c3b)[iVar12] = (&DAT_00202c3b)[iVar13];
      (&DAT_00202c3c)[iVar12] = (&DAT_00202c3c)[iVar13];
      (&DAT_00202c3d)[iVar12] = (&DAT_00202c3d)[iVar13];
    }
    goto LAB_0005a33c;
  }
  sVar4 = DAT_00204874[5];
  uVar5 = Ordinal_2005(0xfffffff1);
  *(char *)(psVar9 + 5) = (char)uVar5;
  *(char *)((char *)DAT_00204874 + 0xb) = (char)((ushort)uVar5 >> 8);
  uVar11 = (0xf - (uint)*(byte *)(DAT_00204874 + 0xb)) * (int)DAT_00204874[5];
  uVar8 = (int)uVar11 >> 0x1f;
  iVar12 = (uVar11 ^ uVar8) - uVar8;
  *(char *)((char *)DAT_00204874 + 0x29) = (char)((uint)(iVar12 * 0x10000) >> 0x10);
  *(char *)(DAT_00204874 + 0x15) = (char)((uint)iVar12 >> 8);
  sVar10 = DAT_00204874[5];
  pbVar1 = (byte *)(DAT_00204874 + 0xb);
  *(char *)(DAT_00204874 + 5) = (char)((uint)*pbVar1 * (int)sVar10);
  *(char *)((char *)DAT_00204874 + 0xb) = (char)((uint)*pbVar1 * (int)sVar10 >> 8);
  psVar9 = DAT_00204874;
  if (*(byte *)(DAT_00204874 + 0xb) == 0) {
    sVar10 = 0;
  }
  else {
    sVar10 = DAT_00204874[10];
    sVar6 = Ordinal_2005(0x1e,(0xf - (uint)*(byte *)(DAT_00204874 + 0xb)) * (int)sVar10);
    sVar10 = sVar10 - sVar6;
  }
  *(char *)(psVar9 + 10) = (char)sVar10;
  *(char *)((char *)DAT_00204874 + 0x15) = (char)((ushort)sVar10 >> 8);
  if ((0 < sVar4) || (0x8c < DAT_00204874[5])) goto LAB_0005a33c;
  *(undefined1 *)(DAT_00204874 + 5) = 0;
  *(undefined1 *)((char *)DAT_00204874 + 0xb) = 0;
  *(undefined1 *)(DAT_00204874 + 8) = 0;
  *(undefined1 *)((char *)DAT_00204874 + 0x11) = 0;
  if (DAT_00086998 == -1) {
    if ((int)((uint)DAT_002049d0 + (uint)DAT_002049d8) < (int)*(short *)((char *)g_sweep_foot_pos + 4)) {
      puVar7 = (ushort *)FUN_000535fc((int)*(short *)((char *)DAT_00204874 + 0x23));
      if ((*puVar7 & 0x1c0) != 0x40) goto LAB_0005a238;
      if ((DAT_002049d6 & 0x10) == 0) {
        if ((DAT_002049d6 & 0x20) == 0) goto LAB_0005a2d0;
        uVar3 = 4;
      }
      else {
        uVar3 = 2;
      }
    }
    else {
      uVar3 = (undefined1)(1 << ((int)(short)DAT_002049d4 & 3U));
    }
    *(undefined1 *)(DAT_00204874 + 0x14) = uVar3;
  }
  else {
    psVar9 = (short *)FUN_000535fc(*(ushort *)(&DAT_00202c3a + DAT_00086998 * 6) >> 6);
    if ((((&DAT_00202c93)[((int)*psVar9 & 0x1ffU) * 0xd] & 2) != 0) ||
       (puVar7 = (ushort *)FUN_000535fc((int)*(short *)((char *)DAT_00204874 + 0x23)),
       (*puVar7 & 0x1c0) == 0x40)) {
LAB_0005a2d0:
      *(undefined1 *)(DAT_00204874 + 0x14) = 1;
      goto LAB_0005a33c;
    }
LAB_0005a238:
    sweep_apply_knockback();
  }
LAB_0005a33c:
  sweep_restart_remaining(0);
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005a348
// PHYSICS: vertical integrator -- applies gravity/climb to the swept foot Z
// (g_sweep_foot_pos[2]) and resolves floor + ceiling contact. Only reached from
// sweep_step when the "vertical motion active" flag *(DAT_00204874+10) is set.
// _DAT_000869a1 = per-tick vertical rate (gravity accel / climb speed),
// DAT_0008698a = signed vertical velocity, DAT_00086984 = sub-unit remainder,
// _DAT_0008699b = target surface height (floor when falling, ceiling when rising).
undefined4 sweep_step_vertical(param_1,param_2)
undefined4 param_1;
short param_2;

{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  short sVar4;
  uint uVar5;
  int iVar6;

  iVar2 = (int)param_2;
  if ((int)DAT_00086996 < (int)((uint)(iVar2 == -1) + (int)DAT_00086990)) {
    // PHYSICS: gravity -- accelerate the vertical velocity by _DAT_000869a1*32 per
    // sub-step; sign follows the current velocity (downward when falling/resting)
    iVar6 = _DAT_000869a1 * 0x20;
    if (DAT_0008698a * iVar2 < 1) {
      iVar6 = _DAT_000869a1 * -0x20;
    }
  }
  else {
    // PHYSICS: final partial sub-step -- vertical displacement from the current
    // velocity, scaled by the horizontal distance covered (DAT_00086992)
    iVar6 = (int)DAT_0008698a;
    if (DAT_00086992 == 0) {
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0x7ff;
      }
      iVar6 = (iVar6 >> 0xb) * (int)_DAT_000869a1 * iVar2 * 0x40;
    }
    else {
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0x7ff;
      }
      iVar6 = (iVar6 >> 0xb) * (int)_DAT_000869a1 * (int)DAT_00086992 * iVar2;
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0xff;
      }
      iVar6 = iVar6 >> 8;
    }
  }
  uVar3 = iVar6 + (short)DAT_00086984;
  if ((int)uVar3 < 0) {
    iVar6 = (uVar3 ^ (int)uVar3 >> 0x1f) - ((int)uVar3 >> 0x1f);
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0x7ff;
    }
    sVar4 = -1 - (short)(iVar6 >> 0xb);
  }
  else {
    uVar5 = uVar3;
    if ((int)uVar3 < 0) {
      uVar5 = uVar3 + 0x7ff;
    }
    sVar4 = (short)((int)uVar5 >> 0xb);
  }
  DAT_00086984 = (ushort)(uVar3 * 0x10000 >> 0x10) & 0x7ff;
  if (getenv("UW_DEBUG_JUMP2"))
    fprintf(stderr, "[jump-vert] dat8698a=%d rate(869a1)=%d iVar6=%d uVar3=%u sVar4=%d frac(86984)=%u foot_z_before=%d\n",
            (int)DAT_0008698a, (int)_DAT_000869a1, iVar6, uVar3, (int)sVar4,
            (unsigned)DAT_00086984, (int)*(short *)((char *)g_sweep_foot_pos + 4));
  if (iVar2 == -1) {
    // PHYSICS: revert path -- just back the foot Z out by the computed delta
    *(short *)((char *)g_sweep_foot_pos + 4) = *(short *)((char *)g_sweep_foot_pos + 4) + sVar4;
  }
  else {
    iVar2 = (int)sVar4;
    if (iVar2 < 1) {
      if (-1 < iVar2) goto LAB_0005a4ac;
      *(undefined1 *)(DAT_00204874 + 0x28) = 0x10;
      // PHYSICS: floor collision -- falling; if this step would drop the foot
      // below the target floor height, stop and snap to it (sweep_land_on_surface)
      iVar2 = iVar2 + *(short *)((char *)g_sweep_foot_pos + 4);
      if (iVar2 < _DAT_0008699b) goto LAB_0005a4f8;
    }
    else {
      *(undefined1 *)(DAT_00204874 + 0x28) = 0x10;
      // PHYSICS: ceiling collision -- rising; if this step would push the foot
      // above the target height, stop and snap to it
      iVar2 = iVar2 + *(short *)((char *)g_sweep_foot_pos + 4);
      if (_DAT_0008699b < iVar2) {
LAB_0005a4f8:
        sweep_land_on_surface();
        return 0;
      }
    }
    // PHYSICS: no surface hit this step -- commit the new foot Z
    *(short *)((char *)g_sweep_foot_pos + 4) = (short)iVar2;
  }
LAB_0005a4ac:
  // PHYSICS: after the vertical step, run the horizontal sub-tile integrator for the same direction
  uVar1 = sweep_integrate_substep(0,param_2);
  return uVar1;
}



// was FUN_0005a550 -- advance the sweep one step (param_1==-1 commits the move)
undefined4 sweep_step(param_1)
undefined4 param_1;

{
  bool bVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  
  bVar1 = false;
  if ((short)param_1 == -1) {
    collision_height_envelope(0,0);
    reticle_object_pick(0);
    *(undefined1 *)(DAT_00204874 + 0x28) = DAT_002049c0;
    if (DAT_00204870 != 0) {
      bVar1 = true;
    }
  }
  else {
    DAT_002049bc = DAT_002049bc + -1;
  }
  if (*(short *)(DAT_00204874 + 10) == 0) {
    // PHYSICS: no vertical motion this step -> integrate the horizontal sub-tile move only
    uVar3 = sweep_integrate_substep(0,param_1);
  }
  else {
    /* PHYSICS: vertical motion active (falling / climbing a slope) -> run the
       gravity + floor/ceiling integrator. Ghidra dropped both args here, so
       sweep_step_vertical ran with a garbage `param_2` direction/scale -- one call
       overshot the target height and snapped, which is why a drop resolved
       in a single tick instead of accelerating over several. Forward the
       sweep direction like the horizontal path above. */
    uVar3 = sweep_step_vertical(0,param_1);
  }
  if (bVar1) {
    /* Was `sweep_collision_flags();` with its return discarded, then
       `collision_flags_to_locomotion_code()` called with no argument -- the same dropped-
       argument pattern fixed in sweep_apply_collision just below (see
       its comment): collision_flags_to_locomotion_code wants sweep_collision_flags()'s own
       result, not whatever happens to be left in a register. Capture and
       forward it explicitly. */
    ushort uVar4 = sweep_collision_flags();
    DAT_002049c0 = *(undefined1 *)(DAT_00204874 + 0x28);
    uVar2 = collision_flags_to_locomotion_code(uVar4);
    *(undefined1 *)(DAT_00204874 + 0x28) = uVar2;
  }
  return uVar3;
}




// was FUN_0005ad18 -- act on sweep_collision_flags (stop/slide/step the move)
void sweep_apply_collision()

{
  undefined1 uVar1;
  int iVar2;
  bool bVar3;
  ushort local_14 [2];
  
  // PHYSICS: collide this sub-step and act on the result flags
  local_14[0] = sweep_collision_flags();
  if (getenv("UW_DEBUG_JUMP"))
    fprintf(stderr, "[apply-collision] raw_flags=0x%x masked=0x%x mask(DAT_002048bc)=0x%x\n",
            (unsigned)local_14[0], (unsigned)(local_14[0] & ~*DAT_002048bc),
            (unsigned)(unsigned char)*DAT_002048bc);
  DAT_002049c0 = *(undefined1 *)(DAT_00204874 + 0x28);
  /* Was `collision_flags_to_locomotion_code()` with no argument, relying on local_14[0] still
     sitting in the same register collision_flags_to_locomotion_code's declared `short param_1`
     reads it from -- undefined behavior, latent since this line predates
     any work this session. Adding the UW_DEBUG_JUMP fprintf/getenv calls
     just above (real function calls, clobbering caller-saved registers)
     broke whatever register-leftover coincidence made this "work" before,
     which is almost certainly what silently broke water/swim-mode
     detection (set_locomotion_state's `param_1 & 0x22` swim check reads
     this exact byte) -- confirmed this was already a dropped-argument bug
     matching this whole session's recurring class; pass local_14[0]
     explicitly instead of relying on whatever's left in the register. */
  uVar1 = collision_flags_to_locomotion_code(local_14[0]);
  *(undefined1 *)(DAT_00204874 + 0x28) = uVar1;
  if ((local_14[0] & 0xc000) == 0) {
    local_14[0] = local_14[0] & ~*(ushort *)DAT_002048bc;
    if (local_14[0] == 0) {
      if (getenv("UW_DEBUG_JUMP"))
        fprintf(stderr, "[apply-collision] -> clean resolve (no flags after mask)\n");
      return;
    }
    /* This branch used to call through a function pointer read via
       generic offset arithmetic on DAT_002048bc (`*(void**)(...+4)`,
       later corrected to `+8` against fresh disassembly of the real
       function, FUN_0005ad18 0x5add4-0x5adf8: the original ARM code
       reconstructs a 32-bit address from 4 bytes at offsets 8/9/0xa/0xb
       and branches to it directly). That approach can never work on
       this port even at the right offset: the four real snapshot
       buffers (DAT_00204980/00204990/002049a0/002049b0) were each
       decompiled with their own callback slot as an INDEPENDENT global
       (DAT_00204988/00204998/002049a8/002049b8 respectively -- see
       their real initialization a few hundred lines up, uw.c ~20450-
       20465: `DAT_00204988=collision_response_default; DAT_00204998=collision_response_alt_locomotion;
       DAT_002049a8=&collision_response_mobile_object; DAT_002049b8=collision_response_other_locomotion;`), not
       packed contiguously the way the original ARM struct was -- so no
       fixed-offset read from a runtime-varying base can reach the right
       one. Look up which of the four known buffers DAT_002048bc
       currently is and call ITS real, already-correctly-initialized
       callback directly instead. Confirmed live: the old generic read
       caused an intermittent (~30-50% of runs) SIGSEGV here, newly
       exposed now that NPCs actually move far enough to hit real
       collisions (see this file's earlier byte-0x14/dropped-arg fixes
       in apply_placement_collision_sweep). */
    {
      codeval *_cb = (codeval *)0;
      if (DAT_002048bc == (char *)&DAT_00204980) _cb = (codeval *)DAT_00204988;
      else if (DAT_002048bc == (char *)&DAT_00204990) _cb = (codeval *)DAT_00204998;
      else if (DAT_002048bc == (char *)&DAT_002049a0) _cb = (codeval *)DAT_002049a8;
      else if (DAT_002048bc == (char *)&DAT_002049b0) _cb = (codeval *)DAT_002049b8;
      if (getenv("UW_DEBUG_JUMP"))
        fprintf(stderr, "[apply-collision] cond1(local_14&callback_mask==0)=%d callback_mask=0x%x cb=%p\n",
                (int)((local_14[0] & *(ushort *)(DAT_002048bc + 2)) == 0), (unsigned)*(ushort *)(DAT_002048bc + 2),
                (void *)_cb);
      if (((local_14[0] & *(ushort *)(DAT_002048bc + 2)) == 0) ||
         (_cb == (codeval *)0) || (iVar2 = (*_cb)(local_14), iVar2 == 0)) {
      // PHYSICS: wall collision -- 0x700 bits mean "hit an angled/solid face":
      // slide the move along it (sweep_slide_along_wall) instead of stopping dead.
      /* The original mask includes raised faces (0x100), not just rock
       * and object walls (0x600). A height flag is a horizontal obstruction
       * only while the footprint floor is above the foot; airborne baseline
       * flags must not roll back an otherwise unobstructed vertical jump. */
      bVar3 = ((local_14[0] & 0x600) != 0) ||
              (((local_14[0] & 0x100) != 0) &&
               (g_sweep_foot_pos[2] < (short)DAT_002049d9));
      if (bVar3) {
        sweep_slide_along_wall((local_14[0] & 0x400) == 0);
      }
      // PHYSICS: wall collision -- 0x1000 = fully blocked: end the sub-tile sweep
      if ((local_14[0] & 0x1000) == 0) {
        if (getenv("UW_DEBUG_JUMP"))
          fprintf(stderr, "[apply-collision] -> slide/no-block, return (0x1000 not set)\n");
        return;
      }
      if (*(short *)(DAT_00204874 + 0x10) != 0) {
        if (getenv("UW_DEBUG_JUMP"))
          fprintf(stderr, "[apply-collision] -> fully blocked, g_fall_accel already active, return\n");
        return;
      }
      // PHYSICS: wall collision -- arm the vertical path (DAT_00204874+0x10) and
      // hand off to sweep_restart_remaining to finish/redirect the blocked move
      *(undefined1 *)(DAT_00204874 + 0x10) = 0xfc;
      *(undefined1 *)(DAT_00204874 + 0x11) = 0xff;
      if (getenv("UW_DEBUG_JUMP"))
        fprintf(stderr, "[apply-collision] -> fully blocked, arming g_fall_accel=0xfc and restarting\n");
      sweep_restart_remaining(bVar3);
      return;
    }
    }
    // PHYSICS: soft block resolved -- back the sub-step out (sweep_step(-1))
    if (getenv("UW_DEBUG_JUMP"))
      fprintf(stderr, "[apply-collision] -> SOFT BLOCK: reverting this sub-step (sweep_step(-1))\n");
    sweep_step(0xffffffff);
  }
  else {
    // PHYSICS: hard block (0xc000) -- revert the sub-step and, on 0x4000, kill velocity
    if (getenv("UW_DEBUG_JUMP"))
      fprintf(stderr, "[apply-collision] -> HARD BLOCK (0x%x): reverting%s\n",
              (unsigned)local_14[0], (local_14[0] & 0x4000) != 0 ? " + killing velocity" : "");
    sweep_step(0xffffffff);
    if ((local_14[0] & 0x4000) != 0) {
      sweep_kill_velocity();
      return;
    }
  }
  DAT_00086996 = DAT_00086990 + 1;
  return;
}




/* Fixed turn-rate accelerator value for decode_movement_command's turn
   branches -- see that function's own comment for why turning was
   decoupled from DAT_0024af6c (the held-key ramp, still used as-is for
   forward/back). UW_TURN_ACCEL overrides it (same units as DAT_0024af6c,
   i.e. plug in any value that function would otherwise have ramped to)
   for retuning without a rebuild. */
int uw_turn_rate_accel(void) {
  static int v = -1;
  if (v < 0) {
    const char *e = getenv("UW_TURN_ACCEL");
    v = e ? atoi(e) : 0x60;
  }
  return v;
}

// was FUN_000685e8 -- turn the latched input code (DAT_0023c448) into the
// analog forward rate DAT_0023bf48 / turn rate DAT_0023bf4c. DAT_0023bf48
// (forward/back) is scaled by the held-key accelerator DAT_0024af6c, which
// is meant to -- and, per playtesting against DOS UW1, correctly does --
// ramp walk into run the longer W/S stays held. NOTE: DAT_0024af6c ramps
// to ~0x140 in this recompile, so the rate multiplies (esp. run's
// 0x700000) overflowed int32 and produced a negative rate -- widened to
// 64-bit below.
//
// DAT_0023bf4c (turn) uses uw_turn_rate_accel() instead of DAT_0024af6c
// directly: side-by-side playtesting against DOS UW1 (same A/D-analog +
// Shift+A/D-stepped scheme) found our turning ramped up to ~3x DOS's
// speed and, since DAT_0024af6c is shared with forward/back (confirmed:
// forward/run speed alone matched DOS fine), carried over an already-
// ramped rate from a preceding held run/walk into an immediately-
// following turn -- DOS's turn read as a constant, non-accelerating
// rate throughout. uw_turn_rate_accel() reproduces that: a fixed value,
// independent of how long any key (including a differently-coded one)
// has been held.
void decode_movement_command()

{
  DAT_0023bf48 = 0;
  DAT_0023bf4c = 0;
  if ((*DAT_00087950 != '\0') || (*DAT_0008794c != '\0')) {
    if (*DAT_00087950 == '\0') {
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (*DAT_0008794c == '\0') {
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
  }
  if (*DAT_00087948 != '\0') {
    DAT_0023bf48 = 0;
    DAT_0023bf4c = 0;
    return;
  }
  if (*DAT_00087944 != '\0') {
    DAT_0023bf48 = 0;
    DAT_0023bf4c = 0;
    return;
  }
  if (DAT_0023c448 < 0x2f) {
    if (DAT_0023c448 == 0x2e) {
      g_movement_mode = 10;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (DAT_0023c448 < 0x20) {
      if (DAT_0023c448 == 0x1f) {
LAB_000687cc:
        DAT_0023bf48 = Ordinal_2005(100,(int)((long long)DAT_0024af6c * 0x500000 >> 0x10));
        g_movement_mode = 1;
        return;
      }
      if (DAT_0023c448 == 0x10) goto LAB_00068820;
      if (DAT_0023c448 != 0x11) {
        if (DAT_0023c448 != 0x12) {
          if (DAT_0023c448 != 0x1e) {
            DAT_0023bf48 = 0;
            DAT_0023bf4c = 0;
            return;
          }
LAB_000686a8:
          DAT_0023bf4c = Ordinal_2005(100,(int)((long long)uw_turn_rate_accel() * -0x5a0000 >> 0x10));
          g_movement_mode = 1;
          return;
        }
        goto LAB_000687fc;
      }
LAB_00068844:
      DAT_0023bf48 = Ordinal_2005(100,(int)((long long)DAT_0024af6c * 0x700000 >> 0x10));
      g_movement_mode = 1;
      return;
    }
    if (DAT_0023c448 != 0x20) {
      if (DAT_0023c448 == 0x2c) {
        g_movement_mode = 9;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      if (DAT_0023c448 == 0x2d) {
        g_movement_mode = 8;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
  }
  else {
    if (DAT_0023c448 == 0x3f) goto LAB_00068844;
    if (DAT_0023c448 == 0x6b) {
LAB_00068820:
      if ((DAT_0020208c & 0x14) == 0) {
        g_movement_mode = 0;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      g_movement_mode = 0xd;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (DAT_0023c448 == 0x6c) {
LAB_000687fc:
      if ((DAT_0020208c & 0x14) == 0) {
        g_movement_mode = 0;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      g_movement_mode = 0xc;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (DAT_0023c448 == 0x8d) goto LAB_000687cc;
    if (DAT_0023c448 == 0x8f) goto LAB_000686a8;
    if (DAT_0023c448 != 0x91) {
      if (DAT_0023c448 == 0x93) {
        g_movement_mode = 8;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
  }
  DAT_0023bf4c = Ordinal_2005(100,(int)((long long)uw_turn_rate_accel() * 0x5a0000 >> 0x10));
  g_movement_mode = 1;
  return;
}



// was FUN_000689a0
void movement_pacing_handler()

{
  byte bVar1;
  byte bVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  undefined8 uVar7;
  uint uVar_now;

  /* Was 4 separate read_realtime_clock_units() (real wall-clock) reads in this
     function -- replaced with uw_frame_clock_ms(), a fixed-step
     substitute in the same 4ms-per-unit scale (see its own and
     g_uw_frame_clock_units's comments). All 4 original reads are really
     asking "what time is it right now", each then diffed against the
     SAME DAT_0023bf54 reference -- captured once into uVar_now here so
     they keep agreeing with each other exactly as they did when each
     was a fresh (but, within the same real millisecond, effectively
     identical) clock read. uVar6 is the actual movement/turn-distance
     driver (movement_tick below); the other reads feed DAT_0023bf58's
     animation-bob phase, which shares the same DAT_0023bf54 reference
     point and so needs to move in step with it too. */
  uVar_now = uw_frame_clock_ms();
  if (getenv("UW_DEBUG_MOVEPACE")) {
    static unsigned int call_count = 0;
    static unsigned int last_real_ms = 0;
    unsigned int real_ms = read_realtime_clock_units() * 4; /* back to real ms -- see its own comment */
    call_count++;
    fprintf(stderr, "[movepace] call=%u now=%u last=%u delta=%u mode=%d code=0x%x turnrate=%d real_ms=%u real_delta=%u\n",
            call_count, uVar_now, (unsigned)DAT_0023bf54, uVar_now - (unsigned)DAT_0023bf54,
            (int)g_movement_mode, (unsigned)DAT_0023c448, (int)DAT_0023bf4c,
            real_ms, real_ms - last_real_ms);
    last_real_ms = real_ms;
  }
  iVar3 = uVar_now;
  uVar6 = iVar3 - DAT_0023bf54;
  if (uVar6 < 0x41) {
    uVar5 = uVar_now;
    DAT_0023bf58 = ((char)(uVar5 >> 4) - (char)(DAT_0023bf54 >> 4)) + DAT_0023bf58;
    uVar7 = uVar_now;
    uVar5 = (uint)((ulonglong)uVar7 >> 0x20);
    uVar4 = ((uint)uVar7 >> 6) - (DAT_0023bf54 >> 6) & 0xff;
    if (uVar6 == 0) {
      return;
    }
  }
  else {
    uVar6 = 0x40;
    DAT_0023bf58 = DAT_0023bf58 + 4;
    uVar4 = 1;
    uVar5 = DAT_0023bf54;
  }
  if (uVar4 != 0) {
    uVar5 = DAT_000879ac;
  }
  if (uVar4 != 0 && uVar5 != 0) {
    scheduler_tick(uVar4);
  }
  iVar3 = *(int *)(DAT_00086df8 + 0xce) + uVar6;
  *(char *)(DAT_00086df8 + 0xce) = (char)iVar3;
  *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar3 >> 8);
  *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar3 >> 0x10);
  *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar3 >> 0x18);
  DAT_0023bf54 = uVar_now;
  if (DAT_002020d4 == 0) {
    bVar2 = 0;
  }
  else {
    bVar2 = DAT_0023bf58 & 1;
    DAT_0023bf58 = DAT_0023bf58 >> 1;
  }
  bVar1 = DAT_0023bf58;
  DAT_0023bf58 = bVar2;
  movement_tick(uVar6 & 0xffff,bVar1,0);
  return;
}



// was FUN_00068ad4
void movement_tick(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
int param_3;

{
  short sVar1;
  uint uVar2;
  char *iVar3;
  undefined4 uVar4;
  ushort uVar5;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  undefined4 unaff_r6;
  undefined4 unaff_r7;
  undefined4 unaff_lr;
  undefined1 uVar6;
  undefined8 uVar7;
  
  DAT_0023bea8 = 0;
  DAT_0023be98 = 0;
  DAT_0023bf18 = (char)param_1 + DAT_0023bf18;
  if (g_movement_mode == 0) {
    decode_movement_command();
  }
  if ((((((g_movement_mode != 0) || (g_jump_ascent_timer != 0)) || (g_vertical_velocity != 0)) ||
       ((g_fall_accel != 0 || (DAT_0020488e != 0)))) || ((DAT_0020488c != 0 || (DAT_000858a0 != 0)))
      ) && (param_3 == 0)) {
    apply_movement_tick(param_1);
  }
  if (getenv("UW_DEBUG_NPC_GATE")) {
    static unsigned callnum = 0;
    callnum++;
    if (callnum % 60 == 1)
      fprintf(stderr, "[npc-gate] call=%u g_npc_tick_enabled=%d DAT_002020d0=%d param_2=0x%x (short)=%d\n",
              callnum, g_npc_tick_enabled, DAT_002020d0, (unsigned)param_2, (short)param_2);
  }
  if (((g_npc_tick_enabled != 0) && (DAT_002020d0 == 0)) && ((short)param_2 != 0)) {
    tick_mobile_objects(param_2);
  }
  if (*(char *)(DAT_00086df8 + 0xb8) != '\0') {
    trigger_view_transition();
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0) {
    if (DAT_00086e84 != -1) {
      stop_movement_sound_handle();
      DAT_00086e84 = -1;
    }
    if (((*(byte *)(DAT_00086df8 + 0xb8) & 8) == 0) && ((DAT_002048a8 & 0x10) == 0)) {
      if (param_3 == 0) {
        if (g_jump_ascent_timer != 0) {
          uVar7 = read_realtime_clock_units();
          uVar4 = (undefined4)((ulonglong)uVar7 >> 0x20);
          if (DAT_0023bf5c < (uint)uVar7) {
            uVar6 = DAT_0023bf60 != '\0';
            if ((bool)uVar6) {
              uVar4 = 0x48;
            }
            if (!(bool)uVar6) {
              uVar4 = 0x38;
              uVar6 = 2;
            }
            play_sound_effect_with_pan(uVar6,uVar4,((int)g_jump_ascent_timer >> 5 & 0xffU) - 0x10);
            DAT_0023bf60 = DAT_0023bf60 == '\0';
            sVar1 = Ordinal_2005(((int)g_jump_ascent_timer >> 2) + 1,6000);
            uVar5 = sVar1 + 0x40;
            if (200 < uVar5) {
              uVar5 = 200;
            }
            iVar3 = read_realtime_clock_units();
            DAT_0023bf5c = iVar3 + (uint)uVar5;
          }
        }
      }
      else {
        uVar6 = DAT_0023bf60 != '\0';
        iVar3 = DAT_00086df8;
        if ((bool)uVar6) {
          iVar3 = 0x48;
        }
        uVar2 = (int)g_jump_ascent_timer >> 5 & 0xff;
        if (!(bool)uVar6) {
          iVar3 = 0x38;
          uVar6 = 2;
        }
        play_sound_effect_with_pan(uVar6,iVar3,uVar2 - 0x10,uVar2,unaff_r4,unaff_r5,unaff_r6,unaff_r7,unaff_lr);
        DAT_0023bf60 = DAT_0023bf60 == '\0';
        iVar3 = read_realtime_clock_units();
        DAT_0023bf5c = iVar3 + 100;
      }
    }
  }
  else {
    if ((DAT_00086e84 != -1) && (uVar2 = read_realtime_clock_units(), DAT_0023bf64 + 0x1800U <= uVar2)) {
      stop_movement_sound_handle();
      DAT_00086e84 = -1;
    }
    if (DAT_00086e84 == -1) {
      DAT_0023bf64 = read_realtime_clock_units();
      DAT_00086e84 = play_sound_effect_with_pan(0,0x40,0);
    }
  }
  return;
}



// was FUN_00068c1c -- forces movement to stop immediately: clears
// g_movement_mode then repeatedly ticks apply_movement_tick(0x40)
// until every pending momentum/fall/landing flag clears.
void settle_movement_to_rest()

{
  g_movement_mode = 0;
  while ((((g_jump_ascent_timer != 0 || (g_vertical_velocity != 0)) || (g_fall_accel != 0)) ||
         (((DAT_0020488e != 0 || (DAT_0020488c != 0)) || (DAT_000858a0 != 0))))) {
    apply_movement_tick(0x40);
  }
  return;
}



// was FUN_00068cac
/* Was called with no args from both call sites (movement_tick's real
   time-delta param_1, and settle_movement_to_rest's literal 0x40) -- dropped
   argument, same pattern as apply_heading_turn below (which this
   function itself calls with no args, same bug one level deeper).
   Confirmed this matters now that the DAT_00204880-relative struct
   fields are correctly aliased (see that fix's comment): apply_heading_turn
   writes this forwarded value into DAT_00204892 (struct offset 0x12,
   the "speed" field movement_sweep_setup's movement engine reads), so losing
   it here meant that field could never become the real per-tick delta
   even once the aliasing bug was fixed. */
void apply_movement_tick(param_1)
undefined4 param_1;

{
  byte bVar1;
  char cVar2;
  char cVar3;
  short sVar4;

  DAT_002048a5 = (&DAT_00202c91)[(*g_player_object & 0x1ff) * 0xd] & 7;
  DAT_002048a6 = (&DAT_00202c90)[(*g_player_object & 0x1ff) * 0xd];
  DAT_0023be9e = 0;
  DAT_0023be9c = 0;
  DAT_0023be9a = 0;
  apply_heading_turn(param_1);
  movement_collision_sweep(&DAT_00204880,&DAT_002048b0);
  commit_player_move();
  FUN_00049924(10);
  sVar4 = g_movement_mode;
  bVar1 = DAT_0023bf18;
  if ((DAT_002048a8 & 0x10) == 0) {
    if (((int)DAT_00202078 >> 2 < (int)g_jump_ascent_timer) && (g_movement_mode == 1)) {
      cVar2 = Ordinal_2005((int)DAT_00202078 >> 1,(int)g_jump_ascent_timer << 2);
      cVar3 = (char)(cVar2 + -1);
      DAT_0023bea8 = 1;
      if ((cVar2 + -1) * 0x1000000 >> 0x18 < 2) {
        cVar3 = '\x02';
      }
      DAT_0023be98 = (short)(char)(&DAT_00086e38)[bVar1 >> 4] * (short)cVar3;
    }
    if (sVar4 == 7) {
      DAT_0023be98 = -0x20;
      DAT_0023be9c = 0xff00;
      sVar4 = 0;
      DAT_0023bea8 = 1;
    }
    if ((sVar4 == 9) || (sVar4 == 10)) {
      DAT_0023bea8 = 1;
      DAT_0023be98 = (short)(char)(&DAT_00086e48)[bVar1 >> 4] << 1;
    }
  }
  g_movement_mode = 0;
  return;
}



// was FUN_0002b63c -- initializes 4 collision-response snapshot buffers
// (DAT_00204980/990/9a0/9b0) and their respective callback slots
// (DAT_00204988=collision_response_default, DAT_00204998=
// collision_response_alt_locomotion, DAT_002049a8=collision_response_mobile_object
// -- used by mobile_object_tick for generic mobile/projectile objects,
// DAT_002049b8=collision_response_other_locomotion). npc_ai_tick selects
// between the default/alt_locomotion/other_locomotion profiles
// per-monster based on two flag bits in its own stat template (byte 10,
// 0x80/0x40); the exact real-world meaning of those two bits isn't
// otherwise confirmed.
void init_collision_response_profiles()

{
  DAT_002048cc = 0;
  DAT_002048ce = 0;
  DAT_002048d7 = 0x80;
  DAT_002048fc = 0;
  DAT_002048fe = 0;
  DAT_00204907 = 0x80;
  DAT_0020492c = 0;
  DAT_0020492e = 0;
  DAT_00204937 = 0;
  DAT_0020495c = 0;
  DAT_0020495e = 0;
  DAT_00204967 = 0x80;
  _DAT_00204982 = 0x1f30;
  DAT_00204984 = 0x1010;
  _DAT_00204986 = 0x20;
  _DAT_00204980 = 0;
  DAT_00204988 = collision_response_default;
  _DAT_00204992 = 0x700;
  DAT_00204994 = 0x80;
  DAT_00204996 = 0;
  DAT_00204990 = 0x1000;
  DAT_00204998 = collision_response_alt_locomotion;
  DAT_002049a2 = 0;
  DAT_002049a4 = 0;
  DAT_002049a6 = 0;
  DAT_002049a0 = 0;
  DAT_002049a8 = &collision_response_mobile_object;
  DAT_002049b2 = 0x1728;
  DAT_002049b4 = 0x10a8;
  DAT_002049b6 = 0;
  DAT_002049b0 = 0x10;
  DAT_002049b8 = collision_response_other_locomotion;
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* HACK: same ushort-vs-byte pointer-scaling bug as the rest of this
   NPC-AI cluster this session (see
   [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is
   `ushort *`, so every bare `DAT_0010190c + N` here was scaling N by
   2. Verified against fresh disassembly of this function's entry
   (0x2b998): `ldrb r3,[r0,#0x14]` -- raw, unscaled byte 0x14. This is
   the DAT_00204980 collision-config buffer's real callback (see
   sweep_apply_collision's fix this session), called via the same
   indirect-callback path as collision_response_alt_locomotion/collision_response_other_locomotion. Cast every
   offset to a byte pointer throughout this function so none of them
   are scaled. */
// was FUN_0002b960 -- the default collision-response callback (slot 0,
// DAT_00204988), used by npc_ai_tick for monsters whose stat template
// doesn't set either of the alt-locomotion flag bits. Handles a mix of
// collision-flag-driven reactions: staggering/bump damage, spawning a
// hit-effect, and various movement-blocked flag resets.
undefined4 collision_response_default(param_1)
ushort * param_1;

{
  ushort uVar1;
  undefined4 *puVar2;
  char *iVar3;
  undefined4 uVar4;
  uint uVar5;
  
  uVar1 = *param_1;
  if ((uVar1 & 0x1000) != 0) {
    if (DAT_002048d0 == 0) {
      DAT_002048d0 = -4;
    }
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xf9 | 1;
    DAT_00101924 = 1;
    uVar4 = 0;
    puVar2 = &DAT_00101734;
LAB_0002bb2c:
    *puVar2 = uVar4;
    return 0;
  }
  if ((uVar1 & 0x10) != 0) {
    if ((uVar1 & 0xf8) == 0x10) {
      DAT_00101924 = 1;
      DAT_00101734 = 0;
      spawn_scheduled_effect_object(DAT_0010190c,6,3,0,0,(short)(char)((ushort)DAT_002048c0 >> 8),
                   (short)(char)((ushort)_DAT_002048c2 >> 8));
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xcc | 0xc;
      uVar5 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar5;
      *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(uVar5 >> 8) | 0x30;
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xf9 | 1;
      return 1;
    }
    if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) == 0) {
      DAT_00101924 = 1;
      DAT_002048c6 = 0;
      DAT_002048c8 = 0;
      return 1;
    }
  }
  if ((((uVar1 & 0x800) != 0) && ((DAT_00101414 & 0x800) == 0)) ||
     (((uVar1 & 0x20) != 0 && ((DAT_00101414 & 0x20) == 0)))) {
    if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) == 0) {
      DAT_00101924 = 1;
      DAT_002048c6 = 0;
      DAT_002048c8 = 0;
      return 1;
    }
    return 0;
  }
  if ((uVar1 & 0x300) != 0) {
    puVar2 = &DAT_00101924;
    uVar4 = 1;
    goto LAB_0002bb2c;
  }
  if ((uVar1 & 0x400) != 0) {
    iVar3 = FUN_0005aea0(&DAT_00101424,&DAT_00101428);
    if (iVar3 != 0) {
      DAT_00101560 = 1;
      DAT_00101924 = 1;
      DAT_001013fc = 1;
      DAT_00101904 = iVar3;
      goto LAB_0002bbc4;
    }
    DAT_00101924 = 1;
    DAT_001013fc = 1;
    DAT_00101904 = FUN_0005b010();
  }
  if (DAT_00101924 == 0) {
    return 0;
  }
LAB_0002bbc4:
  if (DAT_00101734 != 0) {
    return 1;
  }
  return 0;
}



// was FUN_0002bbec -- the "alt locomotion" collision-response callback
// (slot 1, DAT_00204998), used by npc_ai_tick for monsters whose stat
// template sets flag bit 0x80.
undefined4 collision_response_alt_locomotion(param_1)
ushort * param_1;

{
  DAT_00101734 = 1;
  if ((*param_1 & 0x200) == 0) {
    if ((*param_1 & 0x100) != 0) {
      DAT_002048fa = 0x80;
      DAT_0010191c = 1;
    }
    if ((*param_1 & 0x400) != 0) {
      DAT_00101924 = 1;
      DAT_001013fc = 1;
      DAT_00101904 = FUN_0005b010();
    }
    if ((DAT_00101924 != 0) && (DAT_00101734 != 0)) {
      return 1;
    }
  }
  else {
    DAT_00101924 = 1;
  }
  return 0;
}



// was FUN_0002bc9c -- the "other locomotion" collision-response callback
// (slot 3, DAT_002049b8), used by npc_ai_tick for monsters whose stat
// template sets flag bit 0x40 (and neither bit is 0x80).
undefined4 collision_response_other_locomotion(param_1)
ushort * param_1;

{
  if ((*param_1 & 0x300) == 0) {
    if ((*param_1 & 0x400) != 0) {
      DAT_00204958 = 0;
      DAT_00204956 = 0;
      DAT_00101924 = 1;
      DAT_001013fc = 1;
      DAT_00101904 = FUN_0005b010();
    }
    if ((*param_1 & 8) != 0) {
      DAT_00204958 = 0;
      DAT_00204956 = 0;
      DAT_00101924 = 1;
    }
    if ((DAT_00101924 != 0) && (DAT_00101734 != 0)) {
      return 1;
    }
  }
  else {
    DAT_00204958 = 0;
    DAT_00204956 = 0;
    DAT_00101924 = 1;
  }
  return 0;
}


// was FUN_0002c8e0 -- checks whether movement is blocked stepping from
// tile (param_3,param_4) to adjacent tile (param_5,param_6): tests the
// per-tile-type wall/door bitmask (&DAT_000878d0, indexed by each
// tile's own type nibble) for a wall on the shared edge in either
// direction, and checks a height/floor threshold (param_7) against the
// destination tile's own ceiling byte. param_1/param_2 are an optional
// "origin" tile -- if provided and different from (param_3,param_4),
// an extra check gates the step on the origin tile too. Used as the
// per-step tile-transition primitive by a path-tracing routine (not
// yet named) walking a line of tiles between two points.
undefined4 can_step_between_tiles(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
byte param_1;
byte param_2;
byte param_3;
byte param_4;
byte param_5;
byte param_6;
byte param_7;

{
  byte bVar1;
  byte *pbVar2;
  ushort *puVar3;
  uint uVar4;
  uint uVar5;
  
  pbVar2 = (byte *)tilemap_lookup(param_3,param_4);
  puVar3 = (ushort *)tilemap_lookup(param_5,param_6);
  uVar5 = *pbVar2 & 0xf;
  uVar4 = *puVar3 & 0xf;
  if ((param_1 == 0) || ((param_1 == param_3 && (param_2 == param_4)))) {
    if ((param_3 < param_5) && (((&DAT_000878d0)[uVar4] & 2) != 0)) {
      return 0;
    }
    if ((param_5 < param_3) && (((&DAT_000878d0)[uVar4] & 4) != 0)) {
      return 0;
    }
    if ((param_4 < param_6) && (((&DAT_000878d0)[uVar4] & 8) != 0)) {
      return 0;
    }
    if ((param_6 < param_4) && (((&DAT_000878d0)[uVar4] & 0x10) != 0)) {
      return 0;
    }
    if (param_5 <= param_3) goto LAB_0002caa4;
    bVar1 = (&DAT_000878d0)[uVar5];
  }
  else {
    if (param_5 == 0) {
      return 1;
    }
    if ((param_3 < param_5) && (((&DAT_000878d0)[uVar4] & 2) != 0)) {
      return 0;
    }
    if ((param_5 < param_3) && (((&DAT_000878d0)[uVar4] & 4) != 0)) {
      return 0;
    }
    if ((param_4 < param_6) && (((&DAT_000878d0)[uVar4] & 8) != 0)) {
      return 0;
    }
    if ((param_6 < param_4) && (((&DAT_000878d0)[uVar4] & 0x10) != 0)) {
      return 0;
    }
    if (param_5 <= param_3) goto LAB_0002caa4;
    bVar1 = (&DAT_000878d0)[uVar5];
  }
  if ((bVar1 & 4) != 0) {
    return 0;
  }
LAB_0002caa4:
  if ((((param_3 <= param_5) || (((&DAT_000878d0)[uVar5] & 2) == 0)) &&
      ((param_6 <= param_4 || (((&DAT_000878d0)[uVar5] & 0x10) == 0)))) &&
     ((param_4 <= param_6 || (((&DAT_000878d0)[uVar5] & 8) == 0)))) {
    if ((*puVar3 >> 1 & 0x78) <= (param_7 & 0xfff8)) {
      return 1;
    }
    return 0;
  }
  return 0;
}
