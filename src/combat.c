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
    sVar4 = FUN_00013774();
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
  if ((*(ushort *)((char *)DAT_0010190c + 0xb) & 0xff0) == 0x10) {
    uVar5 = *(ushort *)((char *)DAT_0010190c + 0xd) & 0x3fff;
    *(char *)((char *)DAT_0010190c + 0xd) = (char)uVar5;
    *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar5 >> 8);
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

