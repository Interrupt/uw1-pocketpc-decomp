/* NPC melee combat AI: approach/engage/position/disengage tick states
 * and stance selection. Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed.
 */
#include "headers/combat.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0002f818 -- goal 3's main handler: distance-tiered response
// to a detected target (close: randomize stance; medium: walk toward
// the tracked target's own tile via npc_walk_toward_tile, i.e. chase;
// far: random-walk reposition + relink tilemap bucket)
void npc_combat_approach_tick()

{
  int uw_ord2005_rem_40 = 0;
  ushort uVar1;
  char cVar2;
  char cVar3;
  short sVar4;
  char *iVar5;
  byte *pbVar6;
  uint extraout_r1;
  uint uVar7;
  int iVar8;
  int iVar9;
  
  if (DAT_00101900 < 3) {
    if (DAT_00101734 != 0) {
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc1 | 1;
      iVar5 = DAT_0010190c;
      uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
      uw_ord2005_rem_40 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar7 = uVar1 & 0xfff;
      *(char *)(iVar5 + 0xb) = (char)uVar7;
      *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_40 & 0xf) << 0xc) >> 8)
      ;
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      uVar7 = FUN_0002e3b4((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar7 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
    }
  }
  else if (DAT_00101900 < 0x41) {
    if (DAT_00101734 != 0) {
      npc_walk_toward_tile(DAT_00101408,DAT_00101410,DAT_00101420);
    }
  }
  else {
    /* HACK: was a bare `integer_sqrt();` -- dropped argument, the same
       class of bug fixed repeatedly elsewhere in this file. No other
       distance value is computed in this branch to reuse, but
       DAT_00101444*DAT_00101444 + DAT_00101448*DAT_00101448 (dx*dx +
       dy*dy) is the canonical "distance squared" expression this
       exact file uses at every other integer_sqrt-shaped call site
       (see e.g. npc_combat_approach_tick's own sibling functions) --
       used here as the most defensible reconstruction, though not
       independently confirmed the way the tmap.c fix was. */
    sVar4 = integer_sqrt(DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448);
    cVar3 = DAT_00101918;
    iVar8 = (int)DAT_00101408;
    iVar5 = Ordinal_2005((int)sVar4,
                         (((int)DAT_00101918 - (int)(short)DAT_00101408) * 0x10000 >> 0x10) << 2);
    cVar2 = DAT_001013f8;
    iVar5 = ((int)iVar5 + (int)iVar8) * 0x1000000;
    iVar9 = (int)DAT_00101410;
    iVar8 = Ordinal_2005((int)sVar4,
                         (((int)DAT_001013f8 - (int)(short)DAT_00101410) * 0x10000 >> 0x10) << 2);
    iVar8 = (iVar8 + iVar9) * 0x1000000;
    {
      /* was folded into `int iVar9` (reused above as an unrelated int) --
         truncated tilemap_lookup's real `void *` return */
      char *_tile9 = (char *)tilemap_lookup(cVar3,cVar2);
      pbVar6 = (byte *)tilemap_lookup((int)(iVar5) >> 0x18,iVar8 >> 0x18);
      object_list_unlink(_tile9 + 2,DAT_0010190c);
      object_list_insert_head(pbVar6 + 2,DAT_0010190c);
    }
    uVar7 = *(ushort *)((char *)DAT_0010190c + 0x16) & 0x3ff;
    *(char *)((char *)DAT_0010190c + 0x16) = (char)uVar7;
    *(byte *)((char *)DAT_0010190c + 0x17) =
         (byte)(uVar7 >> 8) | (byte)((((int)(char)((uint)iVar5 >> 0x18) & 0x3fU) << 10) >> 8);
    uVar7 = *(ushort *)((char *)DAT_0010190c + 0x16) & 0xfc0f |
            ((int)(char)((uint)iVar8 >> 0x18) & 0x3fU) << 4;
    *(char *)((char *)DAT_0010190c + 0x16) = (char)uVar7;
    *(char *)((char *)DAT_0010190c + 0x17) = (char)(uVar7 >> 8);
    uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0x1fff;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
    *(byte *)((char *)DAT_0010190c + 3) = (byte)(uVar7 >> 8) | 0x80;
    uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xf3ff;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
    *(byte *)((char *)DAT_0010190c + 3) = (byte)(uVar7 >> 8) | 0x10;
    uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xff80;
    *(byte *)((char *)DAT_0010190c + 2) = *pbVar6 >> 1 & 0x78 | (byte)uVar7;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
  }
  return;
}




// was FUN_0002ff94 -- goal 5: attacks (npc_combat_set_stance) if
// within dist^2<100 (~10 tiles) of the tracked target or already at
// its tile, else picks a sub-goal (FUN_00030e50/FUN_00030aac/
// FUN_00030be0, not yet named)
void npc_combat_engage_close_tick()

{
  int uw_ord2005_rem_46 = 0;
  char cVar1;
  uint extraout_r1;
  char cVar2;
  byte bVar3;
  ushort uVar4;
  uint uVar5;
  char *iVar6;
  bool bVar7;
  undefined1 local_28;
  
  iVar6 = 0;
  local_28 = 4;
  if (DAT_00101734 == 0) {
    return;
  }
  if (DAT_00201b68 == 7) {
    uVar5 = (*(byte *)(DAT_00086df8 + 0x60) & 0x20) << 8;
    bVar7 = (*(byte *)(DAT_00086df8 + 0x60) & 0x20) == 0;
    if (bVar7) {
      uVar5 = (uint)*(byte *)(DAT_00101404 + 9);
    }
    if (bVar7 && uVar5 == 0x13) {
      local_28 = 1;
    }
  }
  uVar4 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
  cVar2 = DAT_0010143c - DAT_00101918;
  cVar1 = DAT_0010173c - DAT_001013f8;
  if ((*(ushort *)(DAT_0010190c + 0xb) & 0xff0) == 0x10) {
    uVar5 = *(ushort *)(DAT_0010190c + 0xd) & 0x3fff;
    *(char *)(DAT_0010190c + 0xd) = (char)uVar5;
    *(char *)(DAT_0010190c + 0xe) = (char)(uVar5 >> 8);
  }
  if (((uVar4 < 100) || ((DAT_00101918 == DAT_00101408 && (DAT_001013f8 == DAT_00101410)))) &&
     ((uVar5 = (int)DAT_0010140c - (int)DAT_00101420 >> 0x1f,
      (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar5) - uVar5) < 4 ||
      ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0)))) {
    npc_combat_set_stance();
  }
  else if ((*(byte *)(DAT_00101404 + 0x2d) & 0xfe) == 0) {
    if ((*(byte *)(DAT_00101404 + 0x20) >> 1 & 0xf0) != 0x10) goto LAB_000302bc;
    iVar6 = FUN_00030e50();
  }
  else {
    iVar6 = FUN_00030aac();
    if ((iVar6 != 0) || ((*(byte *)(DAT_00101404 + 0x2d) & 1) == 0)) goto LAB_000302bc;
    iVar6 = FUN_00030be0();
  }
  if (iVar6 != 0) {
    bVar3 = *(byte *)(DAT_0010190c + 0x15) & 0x3f;
    if (bVar3 == 5) {
      return;
    }
    if (bVar3 == 0xd) {
      return;
    }
    if (bVar3 == 1) {
      return;
    }
    *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
    *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
    iVar6 = DAT_0010190c;
    uVar4 = *(ushort *)(DAT_0010190c + 0xb);
    uw_ord2005_rem_46 = ((int)((uVar4 >> 0xc) + 1)) % (4);
    uVar5 = uVar4 & 0xfff;
    *(char *)(iVar6 + 0xb) = (char)uVar5;
    *(byte *)(DAT_0010190c + 0xc) = (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_46 & 0xf) << 0xc) >> 8);
    *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
    return;
  }
LAB_000302bc:
  if ((((uVar4 < 0x101) || ((*(byte *)(DAT_0010190c + 0xd) & 0xf) != 4)) ||
      ((*(byte *)(DAT_0010190c + 0x19) & 0x20) != 0)) ||
     (uVar4 = (ushort)(*(byte *)(DAT_00101404 + 0x1c) >> 4),
     (ushort)((short)cVar2 * (short)cVar2 + (short)cVar1 * (short)cVar1) <=
     (ushort)(uVar4 * uVar4 * 4))) {
    if ((*(byte *)(DAT_00101404 + 0x2d) & 1) == 0) {
      local_28 = 1;
    }
    FUN_00030874(DAT_00101408,DAT_00101410,local_28);
  }
  else {
    *(byte *)(DAT_0010190c + 0x19) = *(byte *)(DAT_0010190c + 0x19) & 0xfe;
    *(byte *)(DAT_0010190c + 0x19) = *(byte *)(DAT_0010190c + 0x19) & 0xfd;
    npc_set_goal(4,0);
  }
  return;
}



// was FUN_00030364 -- the shared attack/stance action called by every
// combat-engage goal handler once in range: sets combat-ready frame
// bits (byte 0x13/9/0x15) based on param_1, a distance/angle metric
undefined4 npc_combat_set_stance(param_1)
ushort param_1;

{
  int uw_ord2005_rem_47 = 0; int uw_ord2005_rem_48 = 0; int uw_ord2005_rem_49 = 0; int uw_ord2005_rem_50 = 0; int uw_ord2005_rem_51 = 0; int uw_ord2005_rem_52 = 0; int uw_ord2005_rem_53 = 0; int uw_ord2005_rem_54 = 0; int uw_ord2005_rem_55 = 0; int uw_ord2005_rem_56 = 0;
  undefined1 uVar1;
  ushort uVar2;
  byte bVar3;
  uint uVar4;
  undefined4 uVar5;
  char extraout_r1;
  short extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int extraout_r1_03;
  int extraout_r1_04;
  int extraout_r1_05;
  int extraout_r1_06;
  int extraout_r1_07;
  char *iVar6;
  uint extraout_r1_08;
  int iVar7;
  byte bVar8;
  uint uVar9;
  
  uVar4 = FUN_0002e3b4((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar9 = uVar4 & 0xff;
  uVar4 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar4 & 7) << 7;
  *(char *)(DAT_0010190c + 2) = (char)uVar4;
  *(char *)(DAT_0010190c + 3) = (char)(uVar4 >> 8);
  *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
  uVar1 = (undefined1)(uVar9 << 5);
  *(undefined1 *)(DAT_0010190c + 9) = uVar1;
  *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xbf;
  if (param_1 < 0x31) {
    uVar5 = Ordinal_1053();
    uw_ord2005_rem_47 = ((int)(uVar5)) % (4);
    if (uw_ord2005_rem_47 != 0) {
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 199 | 7;
      uw_ord2005_rem_48 = ((int)(uVar9 + 4)) % (8);
      *(char *)(DAT_0010190c + 9) = (char)(uw_ord2005_rem_48 << 5);
LAB_00030534:
      bVar8 = *(byte *)(DAT_0010190c + 0x13) & 0x82 | 2;
      goto LAB_000305e4;
    }
    uVar5 = Ordinal_1053();
    *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
    uw_ord2005_rem_49 = ((int)(uVar5)) % (2);
    uw_ord2005_rem_50 = ((int)(uVar9 + uw_ord2005_rem_49 * 4 + 6)) % (8);
    *(char *)(DAT_0010190c + 9) = (char)(uw_ord2005_rem_50 << 5);
    iVar6 = DAT_0010190c;
    bVar8 = *(byte *)(DAT_0010190c + 0x13);
    bVar3 = Ordinal_2005(3,(uint)*(byte *)(DAT_00101404 + 0xb) << 1);
    *(byte *)(iVar6 + 0x13) = (bVar3 ^ bVar8) & 0x7f ^ bVar8;
  }
  else {
    if (0x51 < param_1) {
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xec | 0x2c;
      *(undefined1 *)(DAT_0010190c + 9) = uVar1;
      goto LAB_00030534;
    }
    uVar5 = Ordinal_1053();
    bVar8 = *(byte *)(DAT_00101404 + 6);
    uw_ord2005_rem_51 = ((int)(uVar5)) % (0x40);
    if (uw_ord2005_rem_51 < (int)(uint)bVar8) {
      uVar5 = Ordinal_1053();
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
      uw_ord2005_rem_52 = ((int)(uVar5)) % (8);
      *(char *)(DAT_0010190c + 9) = (char)(uw_ord2005_rem_52 << 5);
      bVar8 = *(byte *)(DAT_0010190c + 0x13) & 0x81 | 1;
    }
    else {
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
      *(undefined1 *)(DAT_0010190c + 9) = uVar1;
      bVar8 = *(byte *)(DAT_0010190c + 0x13) & 0x80;
    }
LAB_000305e4:
    *(byte *)(DAT_0010190c + 0x13) = bVar8;
  }
  if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
    iVar6 = (int)((((*(byte *)(DAT_00101400 + 2) & 0x7f) - (*(byte *)(DAT_0010190c + 2) & 0x7f)) +
                  0xe) * 0x1000000) >> 0x18;
    if (iVar6 < 2) {
      if (iVar6 < -1) {
        bVar8 = *(byte *)(DAT_0010190c + 0x14) & 7 | 0x70;
      }
      else {
        uVar5 = Ordinal_1053();
        uw_ord2005_rem_53 = ((int)(uVar5)) % (3);
        bVar8 = *(byte *)(DAT_0010190c + 0x14) & 7 ^ (uw_ord2005_rem_53 + '\x0f') * '\b';
      }
    }
    else {
      bVar8 = *(byte *)(DAT_0010190c + 0x14) & 7 | 0x90;
    }
    *(byte *)(DAT_0010190c + 0x14) = bVar8;
  }
  if (param_1 < 0x65) {
    uVar5 = Ordinal_1053();
    uw_ord2005_rem_54 = ((int)(uVar5)) % (4);
    if (uw_ord2005_rem_54 == 0) {
      uVar5 = Ordinal_1053();
      uw_ord2005_rem_55 = ((int)(uVar5)) % (100);
      iVar6 = (int)uw_ord2005_rem_55;
      iVar7 = 0;
      if ((int)(uint)*(byte *)(DAT_00101404 + 0x15) <= iVar6) {
        do {
          if (1 < iVar7) break;
          iVar6 = iVar6 - (uint)*(byte *)(iVar7 * 3 + DAT_00101404 + 0x15);
          iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
        } while ((int)(uint)*(byte *)(iVar7 * 3 + DAT_00101404 + 0x15) <= (int)(iVar6) * 0x10000 >> 0x10);
      }
      *(byte *)(DAT_0010190c + 0x15) =
           ((char)iVar7 + 1U ^ *(byte *)(DAT_0010190c + 0x15)) & 0x3f ^
           *(byte *)(DAT_0010190c + 0x15);
      *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
      uVar4 = *(ushort *)(DAT_0010190c + 0xb) & 0xfff;
      *(char *)(DAT_0010190c + 0xb) = (char)uVar4;
      goto LAB_00030860;
    }
    uVar4 = (uint)*(ushort *)(DAT_0010190c + 0xf);
    if ((uVar4 & 0xf000) < 0xf000) {
      *(char *)(DAT_0010190c + 0xf) = (char)(uVar4 & 0xfff);
      *(byte *)(DAT_0010190c + 0x10) =
           (byte)((uVar4 & 0xf000) + 0x1000 >> 8) ^ (byte)((uVar4 & 0xfff) >> 8);
    }
  }
  *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
  iVar6 = DAT_0010190c;
  uVar2 = *(ushort *)(DAT_0010190c + 0xb);
  uw_ord2005_rem_56 = ((int)((uVar2 >> 0xc) + 1)) % (4);
  uVar9 = uVar2 & 0xfff;
  uVar4 = uVar9 | (uw_ord2005_rem_56 & 0xf) << 0xc;
  *(char *)(iVar6 + 0xb) = (char)uVar9;
LAB_00030860:
  *(char *)(DAT_0010190c + 0xc) = (char)(uVar4 >> 8);
  return 1;
}




// was FUN_00030fe8 -- goal 9: same shape as npc_combat_engage_close_tick
// but a wider dist^2<0x90 (~12 tile) engage radius; otherwise positions
// via npc_combat_position_tick or picks a sub-goal
void npc_combat_engage_wide_tick()

{
  int uw_ord2005_rem_63 = 0;
  ushort uVar1;
  char *iVar2;
  uint uVar3;
  uint extraout_r1;
  
  if (DAT_00101734 != 0) {
    if (((ushort)(DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448) < 0x90) ||
       ((DAT_00101408 == DAT_00101918 && (DAT_001013f8 == DAT_00101410)))) {
      npc_combat_set_stance();
    }
    else if (DAT_00101900 < 5) {
      uVar3 = FUN_0002e3b4((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
      *(char *)(DAT_0010190c + 9) = (char)((uVar3 & 0xff) << 5);
      uVar3 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar3 & 7) << 7;
      *(char *)(DAT_0010190c + 2) = (char)uVar3;
      *(char *)(DAT_0010190c + 3) = (char)(uVar3 >> 8);
      *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
      *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
      iVar2 = DAT_0010190c;
      uVar1 = *(ushort *)(DAT_0010190c + 0xb);
      uw_ord2005_rem_63 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar3 = uVar1 & 0xfff;
      *(char *)(iVar2 + 0xb) = (char)uVar3;
      *(byte *)(DAT_0010190c + 0xc) = (byte)(uVar3 >> 8) | (byte)(((uw_ord2005_rem_63 & 0xf) << 0xc) >> 8)
      ;
    }
    else {
      iVar2 = FUN_00030aac();
      if (iVar2 == 0) {
        if ((*(byte *)(DAT_00101404 + 0x2d) & 0xfe) == 0) {
          if ((*(byte *)(DAT_00101404 + 0x20) >> 1 & 0xf0) == 0x10) {
            FUN_00030e50();
          }
          else {
            npc_combat_position_tick();
          }
        }
        else {
          FUN_00030be0();
        }
      }
    }
  }
  return;
}



// WARNING: Removing unreachable block (ram,0x000314a0)

// was FUN_00031214 -- goal 6, also called as a sub-step from the
// combat-engage handlers: fine facing/frame adjustment relative to
// the target's heading and distance (flanking/circling in melee range)
void npc_combat_position_tick()

{
  int uw_ord2005_rem_64 = 0; int uw_ord2005_rem_65 = 0; int uw_ord2005_rem_66 = 0; int uw_ord2005_rem_67 = 0; int uw_ord2005_rem_68 = 0; int uw_ord2005_rem_69 = 0; int uw_ord2005_rem_70 = 0; int uw_ord2005_rem_71 = 0; int uw_ord2005_rem_72 = 0; int uw_ord2005_rem_73 = 0; int uw_ord2005_rem_74 = 0; int uw_ord2005_rem_75 = 0; int uw_ord2005_rem_76 = 0;
  uint uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  uint extraout_r1;
  uint extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint extraout_r1_04;
  int extraout_r1_05;
  int extraout_r1_06;
  int extraout_r1_07;
  uint extraout_r1_08;
  int extraout_r1_09;
  uint extraout_r1_10;
  uint extraout_r1_11;
  byte bVar4;
  byte bVar5;
  ushort uVar6;
  char *iVar7;
  uint uVar8;
  
  if (DAT_00101734 == 0) {
    return;
  }
  uVar1 = FUN_0002e3b4((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar6 = *(ushort *)(DAT_0010190c + 2);
  bVar4 = *(byte *)(DAT_00101400 + 2);
  if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
    if ((uVar6 & 0x7f) < 0x6f) {
      uVar2 = Ordinal_1053();
      uw_ord2005_rem_64 = ((int)(uVar2)) % (5);
      iVar7 = (uw_ord2005_rem_64 & 0xff) + 0xf;
    }
    else {
      uVar2 = Ordinal_1053();
      uw_ord2005_rem_65 = ((int)(uVar2)) % (5);
      iVar7 = (uw_ord2005_rem_65 & 0xff) + 0xd;
    }
    *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 7 ^ (byte)((int)(iVar7) << 3);
  }
  if ((DAT_00101900 < 4) &&
     (iVar7 = ((bVar4 & 0x7f) - (uVar6 & 0x7f)) * 0x1000000, uVar8 = (int)(iVar7) >> 0x1f,
     (int)(((int)(iVar7) >> 0x18 ^ uVar8) - uVar8) < 0x10)) {
    uVar2 = Ordinal_1053();
    bVar4 = *(byte *)(DAT_00101404 + 0x1c);
    uw_ord2005_rem_66 = ((int)(uVar2)) % (0x100);
    if (((int)(bVar4 >> 3 & 1) <= uw_ord2005_rem_66) && ((DAT_00101924 == 0 || (DAT_00101430 != 0)))) {
      uw_ord2005_rem_67 = ((int)((uVar1 & 0xff) + 4)) % (8);
      *(char *)(DAT_0010190c + 9) = (char)(uw_ord2005_rem_67 << 5);
      uVar1 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 7) << 7;
      *(char *)(DAT_0010190c + 2) = (char)uVar1;
      *(char *)(DAT_0010190c + 3) = (char)(uVar1 >> 8);
      *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 199 | 7;
      iVar7 = DAT_0010190c;
      uVar6 = *(ushort *)(DAT_0010190c + 0xb);
      uw_ord2005_rem_68 = ((int)((uVar6 >> 0xc) + 1)) % (4);
      uVar1 = uVar6 & 0xfff;
      *(char *)(iVar7 + 0xb) = (char)uVar1;
      *(byte *)(DAT_0010190c + 0xc) =
           (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_68 & 0xf) << 0xc) >> 8);
      *(byte *)(DAT_0010190c + 0x13) =
           ((byte)((int)(*(byte *)(DAT_00101404 + 0xb) + 1) >> 1) ^ *(byte *)(DAT_0010190c + 0x13))
           & 0x7f ^ *(byte *)(DAT_0010190c + 0x13);
      return;
    }
LAB_000314d0:
    *(byte *)(DAT_0010190c + 0x19) = *(byte *)(DAT_0010190c + 0x19) | 0x10;
    npc_set_goal(9,*(ushort *)(DAT_0010190c + 0xb) >> 4 & 0xff);
  }
  else {
    if ((DAT_00101924 == 0) || (DAT_00101430 != 0)) {
      iVar7 = FUN_00030aac();
      if (iVar7 != 0) {
        return;
      }
      uVar2 = Ordinal_1053();
      bVar4 = *(byte *)(DAT_00101404 + 0x1f);
      uw_ord2005_rem_69 = ((int)(uVar2)) % (0x40);
      if ((uw_ord2005_rem_69 & 0xff) < (bVar4 & 0xf) + 8) {
        uVar2 = Ordinal_1053();
        iVar7 = DAT_0010190c;
        bVar4 = *(byte *)(DAT_0010190c + 9);
        uw_ord2005_rem_70 = ((int)(uVar2)) % (0x40);
        uw_ord2005_rem_71 = ((int)(uw_ord2005_rem_70 + (uint)bVar4 + 0xe0)) % (0x100);
        uVar1 = uw_ord2005_rem_71 & 0xff;
      }
      else {
        uVar1 = (uint)*(byte *)(DAT_0010190c + 9);
        iVar7 = DAT_0010190c;
      }
      if (DAT_00101430 == 0) {
        uVar1 = FUN_000318d8(uVar1,0x18);
        iVar7 = DAT_0010190c;
      }
      *(byte *)(iVar7 + 9) = (byte)uVar1;
      uVar8 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 0xe0) << 2;
      *(char *)(DAT_0010190c + 2) = (char)uVar8;
      *(char *)(DAT_0010190c + 3) = (char)(uVar8 >> 8);
      bVar4 = *(byte *)(DAT_0010190c + 0x18);
      bVar5 = bVar4 ^ (byte)uVar1;
    }
    else {
      if (DAT_00101900 < 9) {
        if ((*(byte *)(DAT_0010190c + 0xb) & 0xf) == 9) {
          *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
          *(char *)(DAT_0010190c + 9) = (char)((uVar1 & 0xff) << 5);
          uVar1 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 7) << 7;
          *(char *)(DAT_0010190c + 2) = (char)uVar1;
          *(char *)(DAT_0010190c + 3) = (char)(uVar1 >> 8);
          *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
          *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
          *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
          iVar7 = DAT_0010190c;
          uVar6 = *(ushort *)(DAT_0010190c + 0xb);
          uw_ord2005_rem_72 = ((int)((uVar6 >> 0xc) + 1)) % (4);
          uVar1 = uVar6 & 0xfff;
          *(char *)(iVar7 + 0xb) = (char)uVar1;
          *(byte *)(DAT_0010190c + 0xc) =
               (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_72 & 0xf) << 0xc) >> 8);
          return;
        }
        goto LAB_000314d0;
      }
      uVar2 = Ordinal_1053();
      uVar3 = Ordinal_1053();
      iVar7 = DAT_0010190c;
      bVar4 = *(byte *)(DAT_0010190c + 9);
      uw_ord2005_rem_73 = ((int)(uVar2)) % (2);
      uw_ord2005_rem_74 = ((int)((uint)(bVar4 >> 5) + uw_ord2005_rem_73 * 4 + 6)) % (8);
      uw_ord2005_rem_75 = ((int)(uVar3)) % (0x20);
      uVar1 = uw_ord2005_rem_74 + uw_ord2005_rem_75 * 0x20;
      bVar5 = (byte)uVar1;
      *(byte *)(iVar7 + 9) = bVar5;
      uVar1 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 0xe0) << 2;
      *(char *)(DAT_0010190c + 2) = (char)uVar1;
      *(char *)(DAT_0010190c + 3) = (char)(uVar1 >> 8);
      bVar4 = *(byte *)(DAT_0010190c + 0x18);
      bVar5 = bVar5 ^ bVar4;
    }
    *(byte *)(DAT_0010190c + 0x18) = bVar5 & 0x1f ^ bVar4;
    uVar6 = DAT_00101900;
    if (DAT_00101900 < 0x40) {
      uVar6 = (ushort)*(byte *)(DAT_00101404 + 0xc);
    }
    bVar4 = (byte)uVar6;
    if (DAT_00101900 >= 0x40) {
      bVar4 = *(byte *)(DAT_00101404 + 0xb);
    }
    *(byte *)(DAT_0010190c + 0x13) =
         (*(byte *)(DAT_0010190c + 0x13) ^ bVar4) & 0x7f ^ *(byte *)(DAT_0010190c + 0x13);
    *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xec | 0x2c;
    iVar7 = DAT_0010190c;
    uVar6 = *(ushort *)(DAT_0010190c + 0xb);
    uw_ord2005_rem_76 = ((int)((uVar6 >> 0xc) + 1)) % (4);
    uVar1 = uVar6 & 0xfff;
    *(char *)(iVar7 + 0xb) = (char)uVar1;
    *(byte *)(DAT_0010190c + 0xc) =
         (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_76 & 0xf) << 0xc) >> 8);
    *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
  }
  return;
}




// was FUN_00031a94 -- goal 10: checks line-of-sight/distance
// (FUN_00032180, dist^2>399); if lost, reverts straight to idle state
// 0x20, otherwise continues closing on the target
void npc_combat_disengage_tick()

{
  int uw_ord2005_rem_77 = 0; int uw_ord2005_rem_78 = 0; int uw_ord2005_rem_79 = 0; int uw_ord2005_rem_80 = 0; int uw_ord2005_rem_81 = 0;
  ushort uVar1;
  char *iVar2;
  char cVar3;
  undefined4 uVar4;
  char extraout_r1;
  int extraout_r1_00;
  uint extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint uVar5;
  ushort uVar6;
  uint uVar7;
  undefined1 uStack_1c;
  undefined1 auStack_1b [3];
  
  if (DAT_00101734 != 0) {
    uVar7 = *(ushort *)(DAT_0010190c + 0xb) & 0xf01f;
    *(byte *)(DAT_0010190c + 0xb) = (byte)uVar7 | 0x10;
    *(char *)(DAT_0010190c + 0xc) = (char)(uVar7 >> 8);
    FUN_00034044();
    uVar6 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
    cVar3 = FUN_00032180(auStack_1b,&uStack_1c);
    if ((cVar3 == '\x01') || (399 < uVar6)) {
      *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfe | 6;
      *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xe0 | 0x20;
      uVar4 = Ordinal_1053();
      uw_ord2005_rem_77 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_77 != 0) {
        uVar6 = *(ushort *)(DAT_0010190c + 0xb);
        uw_ord2005_rem_78 = ((int)((uVar6 >> 0xc) + 1)) % (4);
        uVar7 = uVar6 & 0xfff;
        *(char *)(iVar2 + 0xb) = (char)uVar7;
        *(byte *)(DAT_0010190c + 0xc) =
             (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_78 & 0xf) << 0xc) >> 8);
      }
    }
    else {
      uVar7 = FUN_0002e3b4((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xe0 | 0x20;
      *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfe | 6;
      uVar4 = Ordinal_1053();
      uw_ord2005_rem_79 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_79 != 0) {
        uVar1 = *(ushort *)(DAT_0010190c + 0xb);
        uw_ord2005_rem_80 = ((int)((uVar1 >> 0xc) + 1)) % (4);
        uVar5 = uVar1 & 0xfff;
        *(char *)(iVar2 + 0xb) = (char)uVar5;
        *(byte *)(DAT_0010190c + 0xc) =
             (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_80 & 0xf) << 0xc) >> 8);
      }
      *(char *)(DAT_0010190c + 9) = (char)((uVar7 & 0xff) << 5);
      uVar5 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar7 & 7) << 7;
      *(char *)(DAT_0010190c + 2) = (char)uVar5;
      *(char *)(DAT_0010190c + 3) = (char)(uVar5 >> 8);
      *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
      if (uVar6 < 0x90) {
        uw_ord2005_rem_81 = ((int)((((uw_mobile_object_t *)g_player_object)->hdr.heading - (uVar7 & 0xff)) + 8)) % (8);
        if (('\x02' < uw_ord2005_rem_81) && (uw_ord2005_rem_81 < '\x06')) {
          DAT_0023bf0c = 0;
          reset_cursor_confine_rect();
          FUN_00028488(DAT_0010190c);
        }
      }
    }
  }
  return;
}



// was FUN_00025a98 -- part of the combat hit-test flow (called from
// resolve_melee_swing_hit's own "[hit-test]" trace): given a
// target's hit-zone span [param_1,param_2] and an impact span
// [param_3,param_4], compares the impact midpoint against the target
// span (with a chance-based fallback the closer the two overlap) and
// returns a small 0-3 result selecting which hit zone/outcome was
// struck. The exact real-world meaning of each of the 4 return values
// isn't otherwise confirmed.
undefined4 resolve_combat_hit_zone(param_1,param_2,param_3,param_4)
short param_1;
short param_2;
short param_3;
short param_4;

{
  int uw_ord2005_rem_3 = 0; int uw_ord2005_rem_4 = 0; int uw_ord2005_rem_5 = 0;
  int iVar1;
  undefined4 uVar2;
  int extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  
  iVar1 = (int)(short)((int)param_3 + (int)param_4 >> 1);
  if (iVar1 < param_1 + 1) {
    return 2;
  }
  if (param_2 + -1 < iVar1) {
LAB_00025aec:
    uVar2 = 3;
  }
  else {
    if (iVar1 < (short)((int)param_2 + (int)param_1 >> 1)) {
      uVar2 = Ordinal_1053();
      uw_ord2005_rem_3 = ((int)(uVar2)) % (2);
      if (uw_ord2005_rem_3 != 0) {
        return 2;
      }
    }
    else {
      uVar2 = Ordinal_1053();
      uw_ord2005_rem_4 = ((int)(uVar2)) % (3);
      if (uw_ord2005_rem_4 == 0) goto LAB_00025aec;
    }
    uVar2 = Ordinal_1053();
    uw_ord2005_rem_5 = ((int)(uVar2)) % (3);
    uVar2 = 0;
    if (uw_ord2005_rem_5 == 0) {
      uVar2 = 1;
    }
  }
  return uVar2;
}



// was FUN_00025b84 -- part of the combat hit-test flow: scans nearby
// object records (&DAT_00202c3a family) for the one closest, in
// projected screen space, to a target ray/point described by param_1,
// tracking the minimum squared screen-space distance and returning that
// candidate's index (or -1 if none matched). Also leaves the resolved
// screen coordinates in DAT_00100600/DAT_00100604 as a side effect,
// which resolve_combat_hit_zone's caller reads afterward.
int find_nearest_hit_target(param_1)
short * param_1;

{
  byte bVar1;
  char cVar2;
  ushort uVar3;
  ushort uVar4;
  int iVar5;
  ushort *puVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  short local_34;
  short local_32;
  
  cVar2 = (char)param_1[0xb];
  iVar12 = -1;
  local_32 = -1;
  iVar11 = 100000;
  local_34 = (short)cVar2;
  iVar9 = (int)(((int)cVar2 + (uint)*(byte *)((char *)param_1 + 0x15)) * 0x10000) >> 0x10;
  iVar10 = (int)(short)cVar2;
  iVar5 = (short)DAT_00100610 * 0x1b + DAT_002046b8;
  uVar3 = *(ushort *)(iVar5 + 0x16);
  bVar1 = *(byte *)(iVar5 + 3);
  if (iVar10 < iVar9) {
    do {
      uVar4 = *(ushort *)(&DAT_00202c3a + iVar10 * 6);
      puVar6 = (ushort *)FUN_000535fc();
      if ((((*puVar6 & 0x1c0) != 0x180) && (uVar4 >> 6 != DAT_00100610)) &&
         (((DAT_00100610 != 1 ||
           ((iVar5 = object_ptr_in_arena(puVar6), iVar5 == 0 ||
            ((*(byte *)((char *)puVar6 + 0x19) & 0x40) == 0)))) ||
          ((iVar10 == iVar9 + -1 && (iVar11 == 100000)))))) {
        uVar7 = (int)*(short *)(&DAT_00202c3c + iVar10 * 6) + (((int)*param_1 << 0x10) >> 0x13) &
                0x3f;
        DAT_00100600 = (undefined2)uVar7;
        iVar5 = (int)*(short *)(&DAT_00202c3c + iVar10 * 6) -
                ((int)((uVar7 - (((int)*param_1 << 0x10) >> 0x13)) * 0x10000) >> 0x10);
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0x3f;
        }
        uVar8 = (int)(short)(iVar5 >> 6) + (((int)param_1[1] << 0x10) >> 0x13) & 0x3f;
        DAT_00100604 = (ushort)uVar8;
        iVar5 = (int)(((uVar7 * -8 - (uint)(*(byte *)((char *)puVar6 + 3) >> 5)) +
                      (int)(short)((uVar3 >> 7 & 0x1f8) + (ushort)(bVar1 >> 5))) * 0x10000) >> 0x10;
        iVar12 = (int)(((uVar8 * -8 - ((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2)) +
                       (int)(short)((uVar3 >> 1 & 0x1f8) + (short)((bVar1 & 0x1c) >> 2))) * 0x10000)
                 >> 0x10;
        iVar5 = iVar5 * iVar5 + iVar12 * iVar12;
        if (iVar5 < iVar11) {
          local_32 = local_34;
          iVar11 = iVar5;
        }
      }
      iVar5 = (iVar10 + 1) * 0x10000;
      iVar10 = iVar5 >> 0x10;
      local_34 = (short)((uint)iVar5 >> 0x10);
    } while (iVar10 < iVar9);
    iVar12 = (int)local_32;
  }
  if (-1 < (short)iVar12) {
    uVar7 = (int)*(short *)(&DAT_00202c3c + (short)iVar12 * 6) + (((int)*param_1 << 0x10) >> 0x13) &
            0x3f;
    DAT_00100600 = (undefined2)uVar7;
    iVar9 = (int)*(short *)(&DAT_00202c3c + (short)iVar12 * 6) -
            ((int)((uVar7 - (((int)*param_1 << 0x10) >> 0x13)) * 0x10000) >> 0x10);
    if (iVar9 < 0) {
      iVar9 = iVar9 + 0x3f;
    }
    DAT_00100604 = (short)(iVar9 >> 6) + (param_1[1] >> 3) & 0x3f;
  }
  return iVar12;
}



// was FUN_00025ed8 -- part of the combat hit-test flow (own
// "[blood-splat]" trace): walks outward from the impact point along
// param_1's heading until it finds a floor/ceiling boundary, then spawns
// a blood-splat decal object (id 0x1cb) there, schedules its later
// cleanup (scheduler_add_entry), and appends it into the target tile's
// object list.
void spawn_blood_splat_object(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
byte * param_3;

{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  char *iVar7;  /* was `int` -- truncated spawn_new_object's real object
                   pointer, latent while that function always returned 0 */
  undefined4 uVar8;
  char *iVar9;  /* was `int` -- truncated tilemap_lookup's real `void *`
                   return (same class as iVar7 above and this whole
                   file's dominant bug). Latent for a long time since
                   this whole "resolve impact" swing code path was
                   unreachable until a separate signedness bug on
                   DAT_0010062c was fixed -- confirmed crashing
                   (EXC_BAD_ACCESS in object_list_append_tail,
                   dereferencing the truncated `iVar9 + 2` as a wild
                   32-bit address) the first time a real attack swing
                   ever reached this far. */
  uint uVar10;
  short local_18;
  short local_16;

  param_2 = param_2 + 1;
  DAT_00202c6c = param_3;
  param_3[8] = 1;
  DAT_00202c6c[10] = 0;
  DAT_00202c6c[0xb] = 0;
  local_18 = (short)((uint)((int)*(short *)DAT_00202c6c << 0x14) >> 0x10);
  local_16 = (short)((uint)((int)*(short *)(DAT_00202c6c + 2) << 0x14) >> 0x10);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object ENTRY param_1=%d param_2=%d\n", (int)param_1, param_2);
  while (collision_build_height_field(0),
        ((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
    project_position_by_heading(param_1,0x10,&local_18,&local_16);
    param_2 = param_2 + -1;
    *DAT_00202c6c = (byte)((int)local_18 >> 4);
    DAT_00202c6c[1] = (byte)((uint)((int)local_18 >> 4) >> 8);
    DAT_00202c6c[2] = (byte)((int)local_16 >> 4);
    DAT_00202c6c[3] = (byte)((uint)((int)local_16 >> 4) >> 8);
    if (param_2 * 0x10000 >> 0x10 < 1) {
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: no floor/ceiling boundary found within range, bailing\n");
      return;
    }
  }
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: spawning object 0x1cb\n");
  iVar7 = (char *)spawn_new_object(0x1cb,0);
  if (iVar7 == (char *)0x0) {
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: spawn_new_object FAILED (returned NULL)\n");
    return;
  }
  uVar3 = *(ushort *)(iVar7 + 2);
  uVar10 = uVar3 & 0x1fff;
  bVar1 = (byte)(((*DAT_00202c6c & 7) << 0xd) >> 8);
  *(char *)(iVar7 + 2) = (char)uVar10;
  *(byte *)(iVar7 + 3) = (byte)(uVar10 >> 8) | bVar1;
  uVar10 = uVar3 & 0x3ff;
  bVar1 = (byte)(uVar10 >> 8) | bVar1 | (byte)(((DAT_00202c6c[2] & 7) << 10) >> 8);
  bVar2 = (byte)uVar10;
  *(byte *)(iVar7 + 2) = bVar2;
  *(byte *)(iVar7 + 3) = bVar1;
  sVar4 = *(short *)DAT_00202c6c;
  sVar5 = *(short *)(DAT_00202c6c + 2);
  *(byte *)(iVar7 + 2) = (DAT_00202c6c[4] + 8 ^ bVar2) & 0x7f ^ bVar2;
  *(byte *)(iVar7 + 3) = bVar1;
  if (DAT_00100610 == 1) {
    play_positional_sound_effect(7,*(undefined2 *)DAT_00202c6c,*(undefined2 *)(DAT_00202c6c + 2),0);
  }
  uVar8 = encode_object_slot_index(iVar7);
  sVar6 = scheduler_add_entry(uVar8,2,0,(int)sVar4 >> 3 & 0xff,(char)((int)sVar5 >> 3));
  if (sVar6 == -1) {
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: scheduler_add_entry queue full, freeing slot\n");
    free_object_slot(iVar7);
    return;
  }
  iVar9 = tilemap_lookup((int)sVar4 >> 3,(int)sVar5 >> 3);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: tilemap_lookup(%d,%d)=%p, appending\n", (int)sVar4>>3, (int)sVar5>>3, (void*)iVar9);
  object_list_append_tail(iVar9 + 2,iVar7);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: SUCCESS, splat placed\n");
  return;
}


// was FUN_00026194 -- resolves a melee weapon swing's hit test: computes
// the swing's attack direction/position, checks for a wall collision
// (spawning a blood-splat decal on the wall via spawn_blood_splat_object
// if so) versus a creature collision (via find_nearest_hit_target +
// resolve_combat_hit_zone if so), returning 1 if a creature was actually
// hit or 0 otherwise. Own "[hit-test]" debug trace throughout.
undefined4 resolve_melee_swing_hit()

{
  byte bVar1;
  char cVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  ushort *puVar6;
  uint uVar7;
  /* Same "6 independent locals treated as one contiguous record via
     DAT_00202c6c" bug already fixed in FUN_000546c4's own sibling
     collision-envelope caller (see its own comment, uw.c ~46514) --
     this function has the IDENTICAL local name set (local_3c/3a/38/
     34/33/32) and was never converted. Every DAT_00202c6c[N] read
     throughout collision_height_envelope/collision_build_height_field/
     FUN_00051dd0/spawn_blood_splat_object assumes one contiguous record, but as
     independent C locals this compiler is free to place them (and
     every OTHER local in this function, including iVar5) anywhere,
     with any padding. Confirmed live via UW_DEBUG_COMBAT tracing: a
     real attack swing's own `iVar5` (a small, masked heading value,
     mathematically bounded to 0-255) read back as 0x80808080
     (uninitialized-pattern garbage) at spawn_blood_splat_object's own call site --
     writes through DAT_00202c6c at offsets up to 0x15 (from this
     function's own body) were silently scribbling over whatever
     unrelated local the compiler happened to place there instead of
     real struct fields, this session's own instance of the "attacking
     seems to do nothing, and generating a blood-splat effect crashes"
     QA report (the crash instances presumably hit some OTHER
     overlapping local worse than iVar5 was hit here). Same fix:
     real backing array, zeroed before use, sized generously (0x20)
     past the highest offset (0x15) this function's own body touches. */
  undefined1 local_pos_record[0x20];
#define local_3c (*(short *)(local_pos_record + 0))
#define local_3a (*(short *)(local_pos_record + 2))
#define local_38 (*(short *)(local_pos_record + 4))
#define local_34 (local_pos_record[8])
#define local_33 (local_pos_record[9])
#define local_32 (*(short *)(local_pos_record + 0xa))

  Ordinal_1047(local_pos_record, 0, sizeof(local_pos_record));
  DAT_00202c6c = &local_3c;
  uVar7 = (uint)DAT_001005f4;
  local_34 = (char)DAT_001005f4 + '\x01';
  local_32 = DAT_00100610;
  local_33 = (char)((uVar7 & 0xff) << 3) + '\x04';
  iVar5 = (int)DAT_00100610;
  puVar6 = (ushort *)(iVar5 * 0x1b + DAT_002046b8);
  bVar1 = (&DAT_00202c90)[(*puVar6 & 0x1ff) * 0xd];
  iVar4 = Ordinal_2005(3,(int)DAT_001005f8);
  sVar3 = Ordinal_2005(3,(uint)bVar1 * iVar4);
  sVar3 = ((byte)puVar6[1] & 0x7f) + sVar3;
  if (iVar5 == 1) {
    iVar5 = (int)DAT_0023beb4;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 0x1ff;
    }
    sVar3 = sVar3 + (short)(iVar5 >> 9);
  }
  local_38 = sVar3;
  cVar2 = Ordinal_2005(6,(&DAT_00202c90)[(*puVar6 & 0x1ff) * 0xd]);
  DAT_001005dc = cVar2 + (char)sVar3;
  local_3c = (short)((puVar6[0xb] & 0xfc00) >> 7) + (ushort)(*(byte *)((char *)puVar6 + 3) >> 5);
  local_3a = (short)((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2) + ((puVar6[0xb] & 0x3f0) >> 1);
  iVar5 = ((byte)puVar6[0xc] & 0x1f) + ((puVar6[1] & 0x380) >> 2);
  project_position_by_heading(iVar5,uVar7 + 3,&local_3c,&local_3a);
  collision_height_envelope(0,1);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: blocked=%d\n", (int)*(char *)((char *)DAT_00202c6c + 0x14));
  if (*(char *)((char *)DAT_00202c6c + 0x14) == '\0') {
    collision_build_height_field(0);
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: no-block path, height field bits=0x%x\n", (unsigned)(*(ushort *)((char *)DAT_00202c6c + 0xe) | *(ushort *)((char *)DAT_00202c6c + 0xc)));
    if (((*(ushort *)((char *)DAT_00202c6c + 0xe) | *(ushort *)((char *)DAT_00202c6c + 0xc)) & 0x300) != 0
       ) {
      iVar4 = ((puVar6[0xb] & 0xfc00) >> 7) + (uint)(*(byte *)((char *)puVar6 + 3) >> 5);
      *(char *)DAT_00202c6c = (char)iVar4;
      *(char *)((char *)DAT_00202c6c + 1) = (char)((uint)iVar4 >> 8);
      iVar4 = ((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2) + ((puVar6[0xb] & 0x3f0) >> 1);
      *(char *)((char *)DAT_00202c6c + 2) = (char)iVar4;
      *(char *)((char *)DAT_00202c6c + 3) = (char)((uint)iVar4 >> 8);
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: calling spawn_blood_splat_object (wall splat) with iVar5=%d DAT_001005f4=%d\n", iVar5, (int)DAT_001005f4);
      spawn_blood_splat_object(iVar5,DAT_001005f4 + 3,DAT_00202c6c);
    }
  }
  else {
    FUN_00051dd0();
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: blocked path, creature_hit_flag=%d\n", (int)*(char *)((char *)DAT_00202c6c + 0x15));
    if (*(char *)((char *)DAT_00202c6c + 0x15) != '\0') {
      sVar3 = find_nearest_hit_target();
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: find_nearest_hit_target returned %d\n", (int)sVar3);
      if (-1 < sVar3) {
        iVar5 = sVar3 * 6;
        DAT_00100624 = resolve_combat_hit_zone((&DAT_00202c39)[iVar5],(&DAT_00202c38)[iVar5],
                                    (int)*(short *)((char *)DAT_00202c6c + 4),
                                    (uint)*(byte *)((char *)DAT_00202c6c + 9) +
                                    (int)*(short *)((char *)DAT_00202c6c + 4));
        DAT_00100620 = *(ushort *)(&DAT_00202c3a + iVar5) >> 6;
        if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: HIT target slot=%d\n", (int)DAT_00100620);
        return 1;
      }
    }
  }
  return 0;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32


// was FUN_00026570 -- resolves whether a confirmed hit actually
// penetrates: rolls a skill check (weapon skill + facing modifier vs
// the target's armor-class-shaped table at &DAT_001007e2), and on a
// natural "2" result (fumble/special outcome) triggers an extra
// stagger/sound reaction via FUN_00046030 instead. Returns 1-result as
// a hit/miss-shaped flag; called right after resolve_melee_swing_hit
// confirms a creature was struck.
int resolve_weapon_hit_skill_check(param_1,param_2)
short param_1;
undefined4 param_2;

{
  int uw_ord2005_rem_6 = 0;
  byte bVar1;
  ushort *puVar2;
  int iVar3;
  undefined4 uVar4;
  byte *pbVar5;
  int extraout_r1;
  uint uVar6;
  uint uVar7;
  ushort uVar8;
  
  puVar2 = (ushort *)FUN_000535fc(param_2);
  uVar6 = (uint)*puVar2;
  if ((uVar6 & 0x1c0) == 0x40) {
    uVar7 = uVar6 & 0x3f;
    if (DAT_00100620 == 1) {
      uVar6 = (int)DAT_00100608 - (int)(char)(&DAT_0010060c)[DAT_00100624];
    }
    if (DAT_00100620 == 1) {
      DAT_00100608 = (short)uVar6;
    }
    else {
      uVar6 = (uint)DAT_00100608;
    }
    iVar3 = roll_skill_check(DAT_00100628 + uVar6,(int)(char)(&DAT_001007e2)[uVar7 * 0x30]);
    DAT_001005d8 = 0;
    if ((short)iVar3 != 2) {
      if ((((short)iVar3 == -1) && (param_1 == 1)) &&
         (pbVar5 = (byte *)FUN_000535fc((int)DAT_00100620),
         ((&DAT_001007da)[(*pbVar5 & 0x3f) * 0x30] & 1) == 0)) {
        bVar1 = *(byte *)(DAT_00086df8 + 100);
        uVar4 = roll_dice_sum(2,3);
        FUN_00046030(8 - (bVar1 & 1),uVar4,4,0,1);
      }
      return 1 - iVar3;
    }
    DAT_001005d8 = 1;
    uVar6 = Ordinal_1053();
    DAT_0010061c = (short)((int)((uVar6 & 0x1f) + 0x30) >> 5) * DAT_0010061c;
    if ((short)param_2 == 1) {
      FUN_000411e0(0xb8);
      uVar8 = DAT_00100624 + 1U & 3;
      if (uVar8 == 3) {
        uVar4 = Ordinal_1053();
        uw_ord2005_rem_6 = ((int)(uVar4)) % (5);
        uVar8 = (uw_ord2005_rem_6 == 0) + 3;
      }
      else if ((uVar8 != 0) && (uVar8 < 3)) {
        uVar8 = (*(byte *)(DAT_00086df8 + 100) & 1) + 7;
      }
      uVar4 = roll_dice_sum(2,4);
      FUN_00046030(uVar8,uVar4,4,1,1);
    }
  }
  else if (((param_1 == 1) && ((uVar6 & 0x1f0) == 0x140)) &&
          (iVar3 = rand_below(0xc), iVar3 < (int)(((byte)*puVar2 & 7) * 2))) {
    bVar1 = *(byte *)(DAT_00086df8 + 100);
    uVar4 = roll_dice_sum(2,4);
    FUN_00046030(8 - (bVar1 & 1),uVar4,4,0,1);
  }
  return 0;
}



// was FUN_00026858 -- applies a landed melee hit's damage: rolls a
// damage dice pool, reduces it by the target's armor value (looked up
// from &DAT_001007d0), plays the impact sound, and calls FUN_00038374
// (the same "apply damage/hit visual" primitive src/ai.c's monster
// attack code also calls, not yet named) to actually apply it. On
// nonzero final damage, either staggers the player (if the target is
// the player) or spawns the appropriate damage-number/blood-effect via
// spawn_scheduled_effect_object depending on target type and armor
// flags.
void apply_melee_damage(param_1)
undefined1 param_1;

{
  int uw_ord2005_rem_7 = 0; int uw_ord2005_rem_8 = 0;
  uint uVar1;
  short sVar2;
  short sVar3;
  ushort uVar4;
  ushort uVar5;
  ushort *puVar6;
  undefined4 uVar7;
  short extraout_r1;
  int extraout_r1_00;
  ushort uVar8;
  uint uVar9;
  char cVar10;
  int iVar11;
  undefined2 in_stack_ffffffbc;
  undefined1 uVar12;
  undefined2 in_stack_ffffffc0;
  undefined1 uVar13;
  short local_38;
  
  uVar13 = (undefined1)((ushort)in_stack_ffffffc0 >> 8);
  uVar12 = (undefined1)((ushort)in_stack_ffffffbc >> 8);
  puVar6 = (ushort *)FUN_000535fc((int)DAT_00100620);
  uVar5 = *puVar6;
  sVar3 = DAT_0010061c;
  if (DAT_0010061c < 2) {
    sVar3 = 2;
  }
  sVar2 = Ordinal_2005(6,(int)sVar3);
  uw_ord2005_rem_7 = ((int)((int)sVar3)) % (6);
  DAT_0010061c = 0;
  if (sVar2 != 0) {
    DAT_0010061c = roll_dice_sum((int)sVar2,6);
  }
  if (uw_ord2005_rem_7 != 0) {
    sVar3 = roll_dice_sum(1,(int)uw_ord2005_rem_7);
    DAT_0010061c = sVar3 + DAT_0010061c;
  }
  uVar9 = (uint)DAT_00100628 + (int)(short)((int)((uint)DAT_001005fc * (int)DAT_0010061c) >> 7);
  sVar3 = (short)uVar9;
  if (DAT_00100620 == 1) {
    play_sound_effect_with_pan(3,0x40,(uVar9 & 0xff) << 2);
  }
  else {
    play_positional_sound_effect(4,(uint)(*(byte *)((char *)puVar6 + 3) >> 5) + DAT_00100600 * 8,
                 (*(byte *)((char *)puVar6 + 3) >> 2 & 7) + DAT_00100604 * 8,(uVar9 & 0xff) << 2);
  }
  uVar8 = DAT_00100624;
  sVar2 = DAT_00100620;
  uVar1 = (uint)(short)(uVar5 & 0x1ff);
  uVar5 = uVar5 & 0x1c0;
  if (uVar5 == 0x40) {
    iVar11 = (uVar1 & 0x3f) * 0x30;
    uw_ord2005_rem_8 = ((int)((int)(short)DAT_00100624)) % (4);
    uVar4 = (ushort)(byte)(&DAT_001007d0)[iVar11 + uw_ord2005_rem_8];
    if (uVar4 == 0xff) {
      DAT_00100624 = uVar8 & 4;
      uVar4 = (ushort)(byte)(&DAT_001007d0)[iVar11];
    }
    if ((sVar2 != 1) && ((puVar6[7] & 4) != 0)) {
      uVar4 = Ordinal_2005(3,(short)uVar4 * 5);
    }
    if ((int)(uVar9 * 0x10000) >> 0x10 < (int)(short)uVar4) {
      sVar3 = 0;
    }
    else {
      sVar3 = (short)(uVar9 * 0x10000 >> 0x10) - uVar4;
    }
  }
  iVar11 = (int)sVar3;
  if (iVar11 < 0) {
    iVar11 = iVar11 + 3;
  }
  local_38 = (short)(iVar11 >> 2);
  if (3 < local_38) {
    local_38 = 3;
  }
  if ((sVar2 == 1) && (*(char *)(DAT_00086df8 + 0xb4) != '\0')) {
    sVar3 = sVar3 >> 1;
  }
  uVar7 = FUN_000535fc((int)DAT_00100610);
  iVar11 = FUN_00038374(puVar6,uVar7,(int)DAT_00100600,(int)DAT_00100604,
                        CONCAT11(uVar12,(char)sVar3),CONCAT11(uVar13,param_1));
  sVar2 = DAT_00100610;
  cVar10 = DAT_001005dc;
  if ((sVar3 != 0) && (DAT_00100610 != -1)) {
    if (3 < (short)DAT_00100624) {
      DAT_00084f1c = -DAT_001005dc;
      DAT_00100624 = 4;
    }
    uVar8 = DAT_00100624;
    sVar3 = Ordinal_2005(0x1b,DAT_0023b82c - DAT_002046b8);
    if (DAT_00100620 == sVar3) {
      set_movement_animation_timer(0x20,(uint)(byte)local_38 * 5);
    }
    else {
      if (uVar5 == 0x40) {
        if (sVar2 == 1) {
          if ((&g_monster_max_stats_table)[(uVar1 & 0x3f) * 0x30] == '\0') {
            iVar11 = 0;
          }
          else {
            sVar3 = Ordinal_2005((&g_monster_max_stats_table)[(uVar1 & 0x3f) * 0x30],(uint)(byte)puVar6[4] * 3);
            iVar11 = (int)sVar3;
          }
          if (2 < (short)iVar11) {
            iVar11 = 2;
          }
          set_hud_status_value(7,3 - iVar11);
          uVar8 = DAT_00100624;
          cVar10 = DAT_001005dc;
        }
        if (((&DAT_001007d8)[(uVar1 & 0x3f) * 0x30] & 0x18) != 0) {
          spawn_scheduled_effect_object(puVar6,0,1,(int)local_38,(short)*(char *)((short)uVar8 + 0x84f18),
                       DAT_00100600,DAT_00100604);
          if (DAT_001005d8 == 0) {
            return;
          }
          if (DAT_00100610 != 1) {
            return;
          }
          uVar5 = Ordinal_1053();
          spawn_scheduled_effect_object(puVar6,0,1,(int)local_38,
                       (uVar5 & 1) * 5 + (short)*(char *)((short)DAT_00100624 + 0x84f18) + -2,
                       DAT_00100600,DAT_00100604);
          return;
        }
        iVar11 = 0;
      }
      if (iVar11 != 0) {
        puVar6 = (ushort *)0x0;
      }
      if (((uVar1 & 0x1f0) == 0x140) || (uVar1 == 0x1cf)) {
        if ((int)cVar10 < (int)(puVar6[1] & 0x7f)) {
          cVar10 = ((byte)puVar6[1] & 0x7f) + 2;
          DAT_001005dc = cVar10;
        }
        spawn_scheduled_effect_object(puVar6,0xb,1,(int)local_38,-(short)cVar10,DAT_00100600,DAT_00100604);
      }
      else {
        spawn_scheduled_effect_object(puVar6,0xb,1,(int)local_38,-(short)cVar10,DAT_00100600,DAT_00100604);
      }
    }
  }
  return;
}



// was FUN_00026eb4 -- picks and plays a combat impact sound effect: id
// 10 for a whiffed/no-target swing (param_1==0), else id 7 or 8
// depending on whether the attacker's weapon type and the target's
// armor/shield type both indicate a "blocked" match (a metal-on-metal
// clang vs a duller impact).
undefined4 play_weapon_impact_sound(param_1)
short param_1;

{
  uint uVar1;
  byte bVar2;
  ushort uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  ushort *puVar6;
  byte bVar7;
  
  if (param_1 == 0) {
    uVar4 = FUN_000535fc((int)(short)DAT_00100610);
    uVar5 = 10;
    goto LAB_0002701c;
  }
  puVar6 = (ushort *)FUN_000535fc((int)(short)DAT_00100610);
  DAT_00100610 = *puVar6 & 0x1ff;
  uVar1 = (uint)(short)DAT_00100610;
  if ((uVar1 == 1) || (0xff < uVar1)) {
    bVar7 = 1;
  }
  else {
    bVar7 = (byte)(&DAT_001007e0)[(uVar1 & 0x3f) * 0x30] >> 6;
  }
  if (DAT_00100620 == 1) {
    puVar6 = (ushort *)get_equipped_item_at_slot((char)DAT_00100624 + 1U & 3);
    if (((((puVar6 == (ushort *)0x0) || (uVar3 = *puVar6 & 0x1ff, uVar3 == 0x20)) || (uVar3 == 0x23)
         ) || ((uVar3 == 0x26 || (uVar3 == 0x29)))) || (uVar3 == 0x2c)) {
LAB_00026fe8:
      bVar2 = 0;
    }
    else {
      bVar2 = 1;
    }
  }
  else {
    if (0xff < DAT_00100620) goto LAB_00026fe8;
    bVar2 = (byte)(&DAT_001007e0)[(uVar1 & 0x3f) * 0x30] >> 4 & 3;
  }
  if ((bVar7 != 1) || (uVar5 = 7, bVar2 != 1)) {
    uVar5 = 8;
  }
  uVar4 = FUN_000535fc((int)DAT_00100620);
LAB_0002701c:
  play_sound_effect_at_object(uVar5,uVar4,0);
  return 0;
}



// was FUN_0002702c -- computes the attacker's facing relative to the
// target (DAT_00100628, a mirrored 0-4 octant offset from the two
// objects' own heading fields), used by resolve_weapon_hit_skill_check
// as a to-hit modifier (rear/flank attacks presumably easier to land).
void compute_attack_relative_facing()

{
  int uw_ord2005_rem_9 = 0;
  int iVar1;
  int iVar2;
  uint extraout_r1;
  
  iVar1 = FUN_000535fc((int)DAT_00100620);
  iVar2 = FUN_000535fc((int)DAT_00100610);
  uw_ord2005_rem_9 = ((int)(((*(ushort *)(iVar1 + 2) >> 7 & 7) - (*(ushort *)(iVar2 + 2) >> 7 & 7)) + 0xc)) % (8);
  DAT_00100628 = (char)uw_ord2005_rem_9;
  if (4 < (uw_ord2005_rem_9 & 0xff)) {
    DAT_00100628 = '\b' - DAT_00100628;
  }
  return;
}



// was FUN_000270d0 -- top-level melee swing resolution: calls
// resolve_melee_swing_hit to hit-test the swing, then (if a creature
// was struck and isn't already excluded by a same-faction/arena check)
// computes relative facing, resolves the weapon-vs-armor skill check,
// and either plays a whiff sound (skill check failed) or applies
// damage and a hit-flash effect. Returns the final outcome flag via
// play_weapon_impact_sound's own return value.
undefined4 process_melee_attack_swing()

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  
  iVar1 = resolve_melee_swing_hit();
  if (iVar1 == 0) {
    uVar2 = 0;
  }
  else {
    if ((DAT_00100610 != 1) && (iVar1 = (int)DAT_00100620, DAT_00100620 != 1)) {
      FUN_000535fc();
      iVar3 = object_ptr_in_arena();
      iVar1 = 0;
      if (iVar3 != 0) {
        iVar3 = FUN_000535fc((int)DAT_00100620);
        iVar1 = FUN_000535fc((int)DAT_00100610);
        if (((*(byte *)(iVar3 + 0x19) ^ *(byte *)(iVar1 + 0x19)) & 0x40) == 0) {
          return 0;
        }
      }
    }
    compute_attack_relative_facing(iVar1);
    uVar2 = resolve_weapon_hit_skill_check((int)DAT_00100610,(int)DAT_00100620);
    if ((short)uVar2 == 0) {
      apply_melee_damage(4);
      return 1;
    }
    uVar4 = FUN_000535fc((int)DAT_00100610);
    uVar5 = FUN_000535fc((int)DAT_00100620);
    FUN_00038374(uVar5,uVar4,(int)DAT_00100600,(int)DAT_00100604,0,4);
  }
  uVar2 = play_weapon_impact_sound(uVar2);
  return uVar2;
}


// was FUN_000272c0 -- resolves the player's currently equipped weapon
// (the item in the off-hand slot, 8-handedness) into an attack-data
// record pointer (*param_1) and outputs the raw item pointer itself
// (*param_2): if it's a ranged weapon (category 0x10) with a valid ammo
// type, finds/consumes the matching ammo (returning -1/0xffffffff and
// canceling the swing via wait_for_click_release if none is found) and
// points param_1 at its ammo-type weapon-data record
// (&DAT_002027d0+offset); if it's melee (category 0), points param_1 at
// its own weapon-data record (&DAT_00202800+offset) instead; if nothing
// is equipped (or neither category matched), falls back to the
// unarmed/fist data record (&DAT_00202878). Returns 1 for the
// melee/unarmed paths, 0 for a successful ranged shot.
//
// param_1 was `int *` -- every store through it (`&DAT_002027d0 +
// iVar5`, `&DAT_00202800 + ...`, `&DAT_00202878`) is a real static-
// global address explicitly cast down to `(int)`/`(intptr_t)`,
// truncating it on this 64-bit host before the caller (tick_weapon_swing_state)
// reads it back and dereferences it as a pointer. param_2 had the
// same problem one level removed: it points at DAT_001005e0 (a real
// `char *`), but was declared `undefined4 *` (4 bytes), so `*param_2 =
// puVar4` only ever wrote the low 32 bits of get_equipped_item_at_slot's real
// pointer into the first half of that 8-byte slot.
undefined4 resolve_equipped_weapon_attack(param_1,param_2)
char * * param_1;
char * * param_2;

{
  uint uVar1;
  ushort uVar2;
  short sVar3;
  ushort *puVar4;
  int iVar5;

  *param_1 = 0;
  puVar4 = (ushort *)get_equipped_item_at_slot(8 - (*(byte *)(DAT_00086df8 + 100) & 1));
  *param_2 = (char *)puVar4;
  if (puVar4 != (ushort *)0x0) {
    uVar2 = *puVar4;
    uVar1 = (uint)(short)(uVar2 & 0x1ff);
    if ((uVar2 & 0x1f0) == 0x10) {
      iVar5 = (uVar1 & 0xf) * 3;
      if ((-1 < (char)(&DAT_002027d2)[iVar5]) && ((char)(&DAT_002027d2)[iVar5] < '\x10')) {
        sVar3 = find_and_consume_ammo(uVar2 & 0xf);
        if (sVar3 < 0) {
          wait_for_click_release(1);
          return 0xffffffff;
        }
        *param_1 = &DAT_002027d0 + iVar5;
        return 0;
      }
    }
    else if ((uVar2 & 0x1f0) == 0) {
      *param_1 = &DAT_00202800 + (uVar1 & 0xf) * 8;
      DAT_001005f4 = (byte)(&DAT_00202c91)[uVar1 * 0xd] & 7;
    }
  }
  if (*param_1 == 0) {
    *param_1 = &DAT_00202878;
    DAT_001005f4 = DAT_00202d54 & 7;
  }
  return 1;
}



// was FUN_000273f8 -- computes the player's own weapon-swing attack
// stats: to-hit base (DAT_00100608, from the player's own weapon skill
// plus a strength-derived bonus, +7 more if a "berserk"-shaped flag at
// DAT_00086df8+0xb4 is set) and damage dice pool (DAT_0010061c, from
// unarmed skill or a weapon-type-derived table lookup), sets
// DAT_00100610=1 to mark the player as attacker, and if the weapon item
// (param_2) resolves to a special enchanted-weapon link (category 0xc
// via resolve_object_variant_or_special_link), adds its bonus into
// whichever of the two stats its own flag bit selects. Feeds directly
// into resolve_weapon_hit_skill_check/apply_melee_damage's own reads of
// these same globals.
//
// param_1/param_2 were `int` -- both real object-record pointers
// (tick_weapon_swing_state passes the now-fixed DAT_001005e4-derived pointer and
// DAT_001005e0, both `char *`), truncated to 32 bits on this 64-bit
// host before being dereferenced here and forwarded to resolve_object_variant_or_special_link
// (which already declares its own params as real pointers).
void compute_player_weapon_attack_stats(param_1,param_2,param_3)
char * param_1;
char * param_2;
short param_3;

{
  byte bVar1;
  char *iVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short local_2c;
  ushort local_2a;
  int local_28;
  
  iVar2 = DAT_00086df8;
  bVar1 = *(byte *)(param_1 + 6);
  uVar3 = (ushort)bVar1;
  if ((5 < bVar1) || (bVar1 < 2)) {
    uVar3 = 2;
  }
  sVar5 = (ushort)*(byte *)((short)uVar3 + DAT_00086df8 + 0x21) +
          (ushort)(*(byte *)(DAT_00086df8 + 0x21) >> 1);
  DAT_00100608 = sVar5;
  sVar4 = Ordinal_2005(7,*(undefined1 *)(DAT_00086df8 + 0x1f));
  DAT_00100608 = sVar5 + sVar4;
  if (*(char *)(iVar2 + 0xb4) != '\0') {
    DAT_00100608 = DAT_00100608 + 7;
  }
  if ((short)uVar3 == 2) {
    sVar4 = Ordinal_2005(6);
    sVar5 = Ordinal_2005(5,(uint)*(byte *)(iVar2 + 0x23) << 1);
    DAT_0010061c = sVar4 + sVar5 + 4;
  }
  else {
    sVar4 = Ordinal_2005(9,(&DAT_001007d5)[(*g_player_object & 0x3f) * 0x30]);
    DAT_0010061c = (ushort)*(byte *)(param_1 + (uint)(byte)(&DAT_00084eff)[param_3]) + sVar4;
  }
  DAT_00100610 = 1;
  DAT_001005f8 = param_3;
  if (((param_2 != 0) && (resolve_object_variant_or_special_link(param_2,&local_2c,&local_2a,&local_28), local_28 == 0)) &&
     (local_2c == 0xc)) {
    if ((local_2a & 8) == 0) {
      DAT_00100608 = (local_2a & 7) + DAT_00100608 + 1;
    }
    else {
      DAT_0010061c = (local_2a & 7) + DAT_0010061c + 1;
    }
  }
  return;
}


// was FUN_00027b3c -- a general-purpose "attacker object directly hits
// target object" damage-application entry point (parallel to, but
// independent of, the player's own tick_weapon_swing_state chain):
// fills in the same globals resolve_combat_hit_zone/apply_melee_damage
// read (attacker type param_1, target slot from param_3,
// resolve_combat_hit_zone's own hit-zone roll from both objects'
// hitbox-span data, damage dice param_6), plays an impact sound, then
// calls apply_melee_damage(param_7). Its one confirmed real caller
// (uw.c ~28596, a thrown/ranged-weapon-family impact handler) passes a
// negative param_7 and a skill-check-scaled damage roll, suggesting
// this is also the shared path for ranged/thrown projectile impacts,
// not just melee.
void apply_direct_object_hit(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
undefined2 param_1;
ushort * param_2;
ushort * param_3;
undefined2 param_4;
undefined2 param_5;
undefined2 param_6;
undefined1 param_7;

{
  short sVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  DAT_00100604 = param_5;
  DAT_001005d8 = 0;
  DAT_00100628 = 0;
  DAT_001005dc = ((byte)param_2[1] & 0x7f) + ((byte)(&DAT_00202c90)[(*param_2 & 0x1ff) * 0xd] >> 1);
  DAT_001005fc = 0x80;
  DAT_00100600 = param_4;
  DAT_00100610 = param_1;
  DAT_00100620 = encode_object_slot_index(param_3);
  uVar4 = (byte)param_2[1] & 0x7f;
  uVar2 = (byte)param_3[1] & 0x7f;
  sVar1 = resolve_combat_hit_zone(uVar2,(byte)(&DAT_00202c90)[(*param_3 & 0x1ff) * 0xd] + uVar2,uVar4,
                       (byte)(&DAT_00202c90)[(*param_2 & 0x1ff) * 0xd] + uVar4);
  DAT_00100624 = sVar1 + 4;
  DAT_0010061c = param_6;
  if (param_3 == g_player_object) {
    play_sound_effect_with_pan(3,0,0);
  }
  else {
    iVar3 = object_ptr_in_arena(param_3);
    if (iVar3 != 0) {
      play_sound_effect_at_object(4,param_3,0);
    }
  }
  apply_melee_damage(param_7);
  return;
}


// was FUN_00027ce0 -- resolves an NPC's melee attack: computes its
// to-hit base (DAT_00100608) and damage dice pool (DAT_0010061c) from
// its own monster-stat table (&DAT_001007d0/&DAT_001007d5/&DAT_001007e1),
// adding a random wander-offset spread when flag bit 2 of param_1[0xe]
// is set, marks it as attacker (DAT_00100610), then calls
// process_melee_attack_swing to actually resolve the hit. If the
// player was struck and their own facing/awareness threshold allows,
// updates a "being attacked from direction" flag on the player record.
// Own "[npc-wander]" debug trace (reused from a related channel).
int resolve_npc_melee_attack(param_1,param_2,param_3,param_4,param_5)
byte * param_1;
undefined2 param_2;
undefined1 param_3;
short param_4;
short param_5;

{
  byte bVar1;
  char cVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  short extraout_r1;
  short extraout_r1_00;
  int iVar6;
  uint uVar7;
  
  DAT_001005f4 = 2;
  DAT_00100610 = encode_object_slot_index(param_1);
  iVar6 = (*param_1 & 0x3f) * 0x30;
  iVar5 = param_4 * 3 + iVar6;
  bVar1 = (&DAT_001007d0)[iVar5 + 0x14];
  DAT_0010061c = (ushort)bVar1;
  DAT_001005f8 = param_2;
  DAT_001005fc = param_3;
  sVar3 = Ordinal_2005(5,(&DAT_001007d5)[(*param_1 & 0x3f) * 0x30]);
  DAT_0010061c = (ushort)bVar1 + sVar3;
  DAT_00100608 = (short)(char)(&DAT_001007d0)[iVar5 + 0x13] +
                 (short)((int)(char)(&DAT_001007e1)[iVar6] >> 1);
  if ((param_1[0xe] & 4) != 0) {
    /* Both Ordinal_2005 calls below were the same fabricated-remainder
       bug fixed elsewhere this session (this port's Ordinal_2005 never
       populates extraout_r1/extraout_r1_00); computed each remainder
       directly instead. This randomizes a wander/patrol target offset,
       so previously always added a fixed +7/+4 instead of a real
       0-5/0-11 random spread -- contributing to (not the sole cause of)
       the "NPC teleports far away on its first tick" bug this session's
       QA pass reported, traced to npc_ai_tick's own dropped 5th argument
       to this function (see its call site's comment). */
    uVar4 = Ordinal_1053();
    DAT_00100608 = DAT_00100608 + (short)(uVar4 % 6) + 7;
    uVar4 = Ordinal_1053();
    DAT_0010061c = DAT_0010061c + (short)(uVar4 % 0xc) + 4;
  }
  if (getenv("UW_DEBUG_NPC_WANDER")) {
    ushort _pos = *(ushort *)(param_1 + 0x16);
    fprintf(stderr, "[npc-wander] obj=%p param_2=%d param_3=%d param_4=%d param_5=%d"
            " base_iVar5=%d bVar1=%d DAT_00100608=%d DAT_0010061c=%d src_tile=(%u,%u)\n",
            (void *)param_1, (int)(short)param_2, (int)param_3, (int)param_4, (int)param_5,
            iVar5, (int)bVar1, (int)DAT_00100608, (int)DAT_0010061c,
            (unsigned)(_pos >> 10), (unsigned)((_pos & 0x3f0) >> 4));
  }
  iVar5 = process_melee_attack_swing();
  if (getenv("UW_DEBUG_NPC_WANDER")) {
    ushort _pos = *(ushort *)(param_1 + 0x16);
    fprintf(stderr, "[npc-wander] process_melee_attack_swing returned %d DAT_00100620=%d dst_tile=(%u,%u)\n",
            iVar5, (int)DAT_00100620,
            (unsigned)(_pos >> 10), (unsigned)((_pos & 0x3f0) >> 4));
  }
  if ((iVar5 != 0) && (DAT_00100620 == 1)) {
    if (((short)(*(byte *)(DAT_00086df8 + 0x5f) >> 2 & 0xf) < param_5) &&
       (cVar2 = FUN_000382cc(g_player_object,1,0x10), cVar2 != '\0')) {
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
      *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar7 | (byte)(((int)param_5 & 0xfU) << 2);
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    }
  }
  return iVar5;
}
