/* NPC AI: the per-tick object dispatcher, pathfinding, movement toward
 * a target tile, tile-position sync, and the mobile<->immobile object
 * settle/destroy-roll logic. Split out of uw.c (the original
 * monolithic decompile) once these functions' real roles were
 * confirmed.
 */
#include "headers/ai.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0002b47c. Per-object per-tick processor for non-NPC mobile
// objects (thrown/dropped items, debris, ...) -- tick_mobile_objects'
// sibling dispatch to npc_ai_tick for class-0x40 (NPC) objects. Advances
// the object's position (sync_object_tile_position) and its own tick-phase field
// directly (no Ordinal_2005 dependency, unlike npc_ai_tick's own
// now-fixed phase-advance code).
int mobile_object_tick()

{
  byte bVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's, then
                   discard_misplaced_object's, real pointer returns */

  if (((char)DAT_0010190c[4] == '\0') &&
     (((&DAT_00202c97)[(*DAT_0010190c & 0x1ff) * 0xd] & 0xc) < 0xc)) {
    iVar2 = (char *)tilemap_lookup(DAT_0010190c[0xb] >> 10,(DAT_0010190c[0xb] & 0x3f0) >> 4);
    iVar2 = (char *)discard_misplaced_object(iVar2 + 2,DAT_0010190c,0);
    if (iVar2 == 0) {
      return 0;
    }
    *(undefined1 *)(DAT_0010190c + 4) = 1;
  }
  DAT_002049a0 = 0x1000;
  if (((&DAT_00202c93)[(*DAT_0010190c & 0x1ff) * 0xd] & 8) == 0) {
    DAT_002049a0 = 0;
  }
  build_object_placement_snapshot(DAT_0010190c,&DAT_00204920);
  apply_placement_collision_sweep(&DAT_00204920,&DAT_002049a0);
  DAT_0010144c = (ushort)(*(byte *)((char *)DAT_0010190c + 0x17) >> 2);
  DAT_00101454 = (undefined2)((DAT_0010190c[0xb] & 0x3f0) >> 4);
  iVar2 = sync_object_tile_position(DAT_0010190c,&DAT_00204920);
  if (iVar2 != 0) {
    bVar1 = (byte)DAT_0010190c[5];
    *(byte *)(DAT_0010190c + 5) = (((byte)DAT_0010190c[10] & 7) + bVar1 ^ bVar1) & 0xf ^ bVar1;
  }
  return iVar2;
}




// was FUN_0002cb14. BFS/wavefront pathfinder from tile (param_1,param_2)
// toward tile (param_4,param_5), expanding outward one ring at a time
// (DAT_0023cf08-family scratch arrays hold each visited tile's parent
// direction/cost, capped at 0x20 rings) and using tile_pair_los_blocked
// to test whether each candidate step is wall-blocked. Calls
// FUN_0002d110 to reconstruct the path on success. Creature AI, not
// part of the 3D render chain -- see tile_pair_los_blocked's comment.
undefined4 creature_find_path_to_tile(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
undefined4 param_1;
char param_2;
undefined1 param_3;
char param_4;
char param_5;
char param_6;
undefined1 param_7;

{
  char cVar1;
  uint uVar2;
  uint uVar3;
  char cVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined1 *puVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  byte bVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  int iVar18;
  int iVar19;
  bool bVar20;
  byte local_5c;
  byte local_5b;
  byte local_5a;
  byte local_59;
  char local_58;
  char local_57;
  char local_56;
  char local_55;
  undefined1 *local_54;
  uint local_50;
  undefined1 *local_4c;
  uint local_48;
  uint local_44;
  int local_40;
  uint local_3c;
  uint local_38;
  
  DAT_00101450 = param_7;
  local_54 = &DAT_001014e0;
  local_4c = &DAT_00101460;
  local_5b = 0;
  Ordinal_1047(&DAT_0023cf08,0,0x5000);
  cVar1 = (char)param_1;
  uVar11 = (uint)cVar1;
  local_48 = (uint)param_4;
  uVar2 = uVar11;
  if ((int)local_48 <= (int)uVar11) {
    uVar2 = local_48;
  }
  iVar7 = uVar2 - 5;
  if (iVar7 < 2) {
    iVar7 = 1;
  }
  local_58 = (char)iVar7;
  local_50 = (uint)param_2;
  local_44 = (uint)param_5;
  uVar16 = 0;
  uVar2 = local_50;
  if ((int)local_44 <= (int)local_50) {
    uVar2 = local_44;
  }
  iVar7 = uVar2 - 5;
  if (iVar7 < 2) {
    iVar7 = 1;
  }
  local_56 = (char)iVar7;
  uVar2 = uVar11;
  if ((int)uVar11 <= (int)local_48) {
    uVar2 = local_48;
  }
  iVar7 = uVar2 + 5;
  if (0x3f < iVar7) {
    iVar7 = 0x40;
  }
  uVar2 = local_50;
  if ((int)local_50 <= (int)local_44) {
    uVar2 = local_44;
  }
  iVar8 = uVar2 + 5;
  if (0x3f < iVar8) {
    iVar8 = 0x40;
  }
  local_55 = (char)iVar8;
  local_57 = (char)iVar7;
  iVar7 = (local_50 + uVar11 * 0x40) * 5;
  (&DAT_0023cf08)[iVar7] = cVar1;
  (&DAT_0023cf0a)[iVar7] = param_3;
  (&DAT_0023cf0c)[iVar7] = 0;
  do {
    uVar5 = (undefined1)((int)(char)(&DAT_000853b0)[uVar16 * 2] + (int)cVar1);
    iVar7 = (int)(char)(&DAT_000853b1)[uVar16 * 2] + (int)(char)local_50;
    uVar6 = (undefined1)iVar7;
    uVar11 = ((int)(char)(&DAT_000853b0)[uVar16 * 2] + (int)cVar1) * 0x1000000 >> 0x18;
    uVar2 = iVar7 * 0x1000000 >> 0x18;
    iVar8 = (uVar2 + uVar11 * 0x40) * 5;
    local_5c = 0;
    iVar7 = tile_pair_los_blocked(0,0,param_1,param_2,uVar5,uVar6,*(undefined2 *)(DAT_00101438 + 4),
                         *(undefined2 *)(DAT_00101438 + 6),param_3,&DAT_0023cf0a + iVar8,&local_5c);
    if (iVar7 != 0) {
      if ((uVar11 == local_48) && (uVar2 == local_44)) {
        DAT_0010142c = 1;
        DAT_00101740 = cVar1;
        DAT_00101741 = param_2;
        DAT_00101743 = 0;
        DAT_00101744 = 0;
        DAT_00101746 = 0;
        DAT_00101747 = uVar5;
        DAT_00101748 = uVar6;
        return 1;
      }
      (&DAT_0023cf08)[iVar8] = cVar1;
      (&DAT_0023cf09)[iVar8] = param_2;
      (&DAT_0023cf0c)[iVar8] = 1;
      uVar11 = (uint)local_5b;
      (&DAT_0023cf0b)[iVar8] = local_5c << 1 | (&DAT_0023cf0b)[iVar8] & 1;
      local_5b = local_5b + 1;
      (&DAT_001014e0)[uVar11 * 2] = uVar5;
      (&DAT_001014e1)[uVar11 * 2] = uVar6;
    }
    uVar16 = uVar16 + 1 & 0xff;
  } while (uVar16 < 4);
  local_5a = 1;
  do {
    uVar11 = (uint)local_5b;
    if (uVar11 == 0) {
      return 0;
    }
    bVar14 = 0;
    local_5b = 0;
    local_50 = 0;
    local_38 = uVar11;
    do {
      if (0x3f < bVar14) break;
      cVar1 = local_54[(local_50 & 0xff) * 2];
      iVar7 = (int)cVar1;
      cVar4 = (local_54 + (local_50 & 0xff) * 2)[1];
      iVar8 = (int)cVar4;
      iVar18 = (iVar8 + iVar7 * 0x40) * 5;
      local_40 = (int)local_58;
      local_50 = 0;
      do {
        iVar15 = (int)(char)(&DAT_000853b0)[local_50 * 2] + (int)cVar1;
        iVar17 = (int)(char)(&DAT_000853b1)[local_50 * 2] + (int)cVar4;
        uVar2 = iVar15 * 0x1000000 >> 0x18;
        if ((((local_40 <= (int)uVar2) && ((int)uVar2 <= (int)local_57)) &&
            (local_3c = iVar17 * 0x1000000 >> 0x18, (int)local_56 <= (int)local_3c)) &&
           ((int)local_3c <= (int)local_55)) {
          iVar19 = (local_3c + uVar2 * 0x40) * 5;
          local_5c = (byte)(&DAT_0023cf0b)[iVar18] >> 1;
          if (((byte)(&DAT_0023cf08)[iVar18] != uVar2) ||
             ((byte)(&DAT_0023cf09)[iVar18] != local_3c)) {
            iVar9 = tile_pair_los_blocked((uint)(byte)(&DAT_0023cf08)[iVar18],(&DAT_0023cf09)[iVar18],iVar7,
                                 iVar8,(char)iVar15,(char)iVar17,*(undefined2 *)(DAT_00101438 + 4),
                                 *(undefined2 *)(DAT_00101438 + 6),(&DAT_0023cf0a)[iVar18],&local_59
                                 ,&local_5c);
            bVar20 = (&DAT_0023cf08)[iVar19] == '\0';
            uVar11 = local_38;
            bVar14 = local_5b;
            if ((iVar9 != 0) &&
               ((bVar20 ||
                (((byte)(&DAT_0023cf0c)[iVar18] < (byte)(&DAT_0023cf0c)[iVar19] &&
                 (uVar13 = (uint)local_59 - (int)param_6, uVar16 = (int)uVar13 >> 0x1f,
                 uVar12 = (uint)(byte)(&DAT_0023cf0a)[iVar19] - (int)param_6,
                 uVar3 = (int)uVar12 >> 0x1f,
                 (int)((uVar13 ^ uVar16) - uVar16) < (int)((uVar12 ^ uVar3) - uVar3))))))) {
              (&DAT_0023cf08)[iVar19] = cVar1;
              (&DAT_0023cf09)[iVar19] = cVar4;
              (&DAT_0023cf0a)[iVar19] = local_59;
              (&DAT_0023cf0c)[iVar19] = local_5a + 1;
              (&DAT_0023cf0b)[iVar19] = local_5c << 1 | (&DAT_0023cf0b)[iVar19] & 1;
              bVar14 = (&DAT_0023cf0b)[iVar18];
              puVar10 = (undefined1 *)(uint)bVar14;
              if (bVar20) {
                puVar10 = local_4c;
              }
              (&DAT_0023cf0b)[iVar18] = ((byte)DAT_00101440 ^ bVar14) & 1 ^ bVar14;
              if (bVar20) {
                uVar16 = (uint)local_5b;
                local_5b = local_5b + 1;
                puVar10[uVar16 * 2] = (char)iVar15;
                (puVar10 + uVar16 * 2)[1] = (char)iVar17;
              }
              bVar14 = local_5b;
              if (((uVar2 == local_48) && (local_3c == local_44)) &&
                 (iVar15 = tile_pair_los_blocked(iVar7,iVar8,iVar15,iVar17,0,0,
                                        *(undefined2 *)(DAT_00101438 + 4),
                                        *(undefined2 *)(DAT_00101438 + 6),(&DAT_0023cf0a)[iVar19],
                                        &DAT_0023cf0a + iVar19,&local_5c), uVar11 = local_38,
                 bVar14 = local_5b, iVar15 != 0)) {
                FUN_0002d110(local_5a,param_4,param_5);
                return 1;
              }
            }
          }
        }
        local_50 = local_50 + 1 & 0xff;
      } while (local_50 < 4);
      local_50 = local_50 + 1;
    } while ((local_50 & 0xff) < uVar11);
    local_4c = &DAT_001014e0;
    if (local_54 == &DAT_001014e0) {
      local_54 = &DAT_00101460;
    }
    else {
      local_54 = &DAT_001014e0;
      local_4c = &DAT_00101460;
    }
    local_5a = local_5a + 1;
    local_5b = bVar14;
    if (0x1f < local_5a) {
      return 0;
    }
  } while( true );
}




/* HACK: whole-function fix, same ushort-vs-byte pointer-scaling bug as
   the rest of this NPC-AI cluster this session (see
   [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is
   `ushort *`, so every bare `DAT_0010190c + N` throughout this
   function was scaling N by 2. Verified against fresh disassembly of
   this function's own entry (0x2e5d0-0x2e620): `ldrb r3,[r0,#0x18];
   ...; ldrb r3,[r0,#0x15]; ...; ldrb r3,[r0,#0x17]; ldrb r2,[r0,#0x16]`
   -- all raw, unscaled bytes. This is param_1=target tile x,
   param_2=target tile y, param_3=direction -- called from both
   npc_wander_return_home_tick (when far enough from a wander/chase target) and this
   function's own sibling switch's case 1, and itself calls
   creature_find_path_to_tile (line ~180 below, with a wrong direction
   argument before this fix: `*(byte *)(DAT_0010190c + 2) >> 3 & 0xf`
   read byte 4 instead of the real heading at byte 2). This is very
   likely the actual "step toward a destination tile" implementation --
   with essentially every read/write in the function operating on the
   wrong byte, this plausibly explains a QA report that a wandering
   NPC's walk animation plays while its tile position never advances.
   Cast every offset to a byte pointer throughout this function so none
   of them are scaled. */
// was FUN_0002e58c
void npc_walk_toward_tile(param_1,param_2,param_3)
uint param_1;
char param_2;
undefined1 param_3;

{
  int uw_ord2005_rem_17 = 0; int uw_ord2005_rem_18 = 0; int uw_ord2005_rem_19 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  undefined1 uVar4;
  short sVar5;
  char *iVar6;
  undefined4 uVar7;
  int extraout_r1;
  int extraout_r1_00;
  uint extraout_r1_01;
  uint uVar8;
  byte bVar9;
  byte local_40 [4];
  int local_3c;
  int local_38;
  
  local_3c = 0;
  local_38 = 0;
  FUN_0002e454(param_1);
  if (((*(byte *)((char *)DAT_0010190c + 0x18) & 0x20) != 0) &&
     ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0)) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf));
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0x7f;
  }
  iVar1 = ((int)(char)param_1 - (int)DAT_00101918) * 0x1000000 >> 0x18;
  iVar6 = ((int)param_2 - (int)DAT_001013f8) * 0x1000000;
  iVar2 = (int)(iVar6) >> 0x18;
  if ((iVar1 == 0) && ((char)((uint)iVar6 >> 0x18) == '\0')) {
    if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0) {
      DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf));
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0x7f;
    }
    if ((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) != 1) {
      if (DAT_00101734 != 0) {
        *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
        *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) | 0x40;
        *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xe0 | 0x20;
        return;
      }
      goto LAB_0002e6fc;
    }
    npc_set_goal(8,0);
  }
  if (DAT_00101734 == 0) {
LAB_0002e6fc:
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xf9 | 1;
    if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0) {
      uVar3 = *(ushort *)((char *)DAT_0010190c + 0x16);
      iVar6 = (uVar3 & 0xf) * 0x1c;
      if ((uVar3 >> 10 == (ushort)(byte)(&DAT_00101568)[(int)iVar6]) &&
         ((uVar3 & 0x3f0) >> 4 == (uint)(byte)(&DAT_00101569)[(int)iVar6])) {
        FUN_0002dd4c();
      }
    }
    return;
  }
  if (((DAT_00101924 != 0) && (DAT_00101430 == 0)) &&
     (bVar9 = *(byte *)((char *)DAT_0010190c + 0x18), (bVar9 & 0x40) == 0)) {
    if (DAT_001013fc != 0) {
      if (DAT_00101560 == 0) {
        uVar3 = *DAT_00101904;
        if (((uVar3 & 0x1c0) == 0x40) && ((uVar3 & 0x1ff) != 0x7f)) {
          if (((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) == 5) &&
             ((*(byte *)((char *)DAT_00101904 + 0xb) & 0xf) == 5)) {
            param_1 = param_1 & 0xff;
            goto LAB_0002e998;
          }
          param_1 = param_1 & 0xff;
        }
        if ((((uVar3 & 0x1f0) == 0x140) && (7 < (uVar3 & 0xf))) &&
           ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0)) {
          local_38 = 1;
          *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 7 | 0x70;
          DAT_00101924 = 0;
          DAT_00101914 = 1;
          goto LAB_0002ea00;
        }
      }
      else {
        *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xe0 | 0x20;
        uVar7 = Ordinal_1053();
        uw_ord2005_rem_17 = ((int)(uVar7)) % (4);
        if ((uw_ord2005_rem_17 != 0) && ((*(byte *)((char *)DAT_0010190c + 0xe) & 0xc0) == 0)) {
          FUN_0002efa0(DAT_00101904);
          goto LAB_0002e998;
        }
        bVar9 = *(byte *)((char *)DAT_0010190c + 0x18);
      }
      *(byte *)((char *)DAT_0010190c + 0x18) = bVar9 | 0x40;
    }
LAB_0002e998:
    if (DAT_00101924 != 0) {
      if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0) {
        DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf));
        *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0x7f;
      }
      local_3c = 1;
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0x7f;
    }
  }
LAB_0002ea00:
  if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0) {
    iVar6 = FUN_0002df2c(&DAT_00101568 + (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf) * 0x1c);
    if (iVar6 != 0) goto LAB_0002ed50;
LAB_0002ebfc:
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf));
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0x7f;
LAB_0002ed50:
    if (DAT_00101920 != 0) {
      return;
    }
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xbf;
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xec | 0x2c;
    if (local_38 == 0) {
      if ((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) == 5) {
        bVar9 = *(byte *)(DAT_00101404 + 0xc);
      }
      else {
        bVar9 = *(byte *)(DAT_00101404 + 0xb);
      }
      bVar9 = (*(byte *)((char *)DAT_0010190c + 0x13) ^ bVar9) & 0x7f ^ *(byte *)((char *)DAT_0010190c + 0x13);
    }
    else {
      bVar9 = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
    }
    *(byte *)((char *)DAT_0010190c + 0x13) = bVar9;
    iVar6 = DAT_0010190c;
    uVar3 = *(ushort *)((char *)DAT_0010190c + 0xb);
    uw_ord2005_rem_18 = ((int)((uVar3 >> 0xc) + 1)) % (4);
    uVar8 = uVar3 & 0xfff;
    *(char *)(iVar6 + 0xb) = (char)uVar8;
    *(byte *)((char *)DAT_0010190c + 0xc) =
         (byte)(uVar8 >> 8) | (byte)(((uw_ord2005_rem_18 & 0xf) << 0xc) >> 8);
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
    return;
  }
  bVar9 = *(byte *)((char *)DAT_0010190c + 0x18);
  if (((bVar9 & 0x20) == 0) && ((bVar9 & 0x80) != 0)) {
    uVar8 = FUN_0002e3b4(iVar1,iVar2);
    *(char *)((char *)DAT_0010190c + 9) = (char)((uVar8 & 0xff) << 5);
    uVar8 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar8 & 7) << 7;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar8;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar8 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
    if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
      FUN_0002ee80(param_1,param_2);
    }
    goto LAB_0002ed50;
  }
  if (((bVar9 & 0x20) == 0) && ((bVar9 & 0x40) != 0)) {
    uVar7 = Ordinal_1053();
    uw_ord2005_rem_19 = ((int)(uVar7)) % (8);
    if (uw_ord2005_rem_19 != 0) goto LAB_0002ee74;
    bVar9 = *(byte *)((char *)DAT_0010190c + 0x18) & 0xbf;
  }
  else {
    if ((local_3c == 0) &&
       (sVar5 = FUN_0002d1e0(DAT_00101918,DAT_001013f8,param_1 & 0xff,param_2), sVar5 == 1)) {
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) | 0x80;
      uVar8 = FUN_0002e3b4(iVar1,iVar2);
      *(char *)((char *)DAT_0010190c + 9) = (char)((uVar8 & 0xff) << 5);
      uVar8 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar8 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar8;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar8 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xbf;
      if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) == 0) goto LAB_0002ed50;
      goto LAB_0002ebfc;
    }
    iVar6 = FUN_0002db4c(local_40);
    if (iVar6 != 0) {
      uVar4 = FUN_0003431c();
      iVar6 = creature_find_path_to_tile(DAT_00101918,DAT_001013f8,*(byte *)((char *)DAT_0010190c + 2) >> 3 & 0xf,param_1,
                           param_2,param_3,uVar4);
      if (iVar6 != 0) {
        DAT_000853b8 = DAT_000853b8 & ~(ushort)(1 << (uint)local_40[0]);
        FUN_0002dbf4(&DAT_00101568 + (uint)local_40[0] * 0x1c);
        *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xbf;
        *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) | 0x80;
        uVar8 = *(ushort *)((char *)DAT_0010190c + 0x16) & 0xfff0;
        *(byte *)((char *)DAT_0010190c + 0x16) = local_40[0] & 0xf | (byte)uVar8;
        *(char *)((char *)DAT_0010190c + 0x17) = (char)(uVar8 >> 8);
        FUN_0002df2c(&DAT_00101568 + (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf) * 0x1c);
        goto LAB_0002ed50;
      }
    }
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) | 0x40;
    bVar9 = *(byte *)((char *)DAT_0010190c + 0x18) & 0x7f;
  }
  *(byte *)((char *)DAT_0010190c + 0x18) = bVar9;
LAB_0002ee74:
  npc_idle_behavior_tick();
  return;
}




// was FUN_00032d38. Per-object per-tick AI/movement processor for
// class-0x40 (NPC/monster) objects, dispatched from tick_mobile_objects.
// Handles HP regen, goal-tile pathing/movement (via
// build_collision_height_field_for_object/movement_collision_sweep-style
// helpers), and always returns 1 -- so tick_mobile_objects' own
// object_tick_is_due catch-up-window check is what makes its caller's
// loop terminate, not this function's return value. Was completely
// unreachable before this session (g_npc_tick_enabled's own fix), so
// this whole function and everything it calls had never executed.
undefined4 npc_ai_tick()

{
  undefined1 uVar1;
  undefined2 uVar2;
  byte bVar3;
  char cVar4;
  /* Was `int`, truncating the real 64-bit pointers this variable holds
     (FUN_000535fc(1) and tilemap_lookup() both return real pointers, and
     the two dereferences below and the object_list_unlink(iVar5+2,...)
     call both need the full address) -- same class of bug as
     FUN_000535fc's own header comment describes, confirmed live via
     lldb: iVar5 held 0x1181181b instead of the real 0x111812e1b-range
     pointer, an exact 32-bit truncation (upper word dropped), crashing
     npc_ai_tick's very first wild dereference. iVar5 is also reused
     for small-int distance-squared arithmetic later in this function;
     intptr_t is safe for that too. */
  intptr_t iVar5;
  int iVar6;
  undefined4 uVar7;
  byte extraout_r1;
  byte extraout_r1_00;
  byte bVar8;
  short extraout_r1_01;
  uint uVar9;
  uint uVar10;
  ushort *puVar11;

  if (getenv("UW_DEBUG_NPC_POS"))
    fprintf(stderr, "[npc-pos] obj=%p type=0x%x tile=(%u,%u) hp=%d\n", (void *)DAT_0010190c,
            (unsigned)(*DAT_0010190c & 0x1ff),
            (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4),
            (int)(byte)DAT_0010190c[4]);
  DAT_00101738 = encode_object_slot_index(DAT_0010190c);
  DAT_00101404 = &DAT_001007d0 + ((byte)*DAT_0010190c & 0x3f) * 0x30;
  DAT_00101918 = *(byte *)((char *)DAT_0010190c + 0x17) >> 2;
  DAT_001013f8 = (byte)(DAT_0010190c[0xb] >> 4) & 0x3f;
  iVar5 = FUN_000535fc(1);
  puVar11 = DAT_0010190c;
  if (((100 < ((((int)(char)DAT_00101918 - (int)DAT_00101938) * 0x10000 >> 0x10) *
               (((int)(char)DAT_00101918 - (int)DAT_00101938) * 0x10000 >> 0x10) +
              (((int)(char)DAT_001013f8 - (int)DAT_0010193c) * 0x10000 >> 0x10) *
              (((int)(char)DAT_001013f8 - (int)DAT_0010193c) * 0x10000 >> 0x10)) * 0x10000 >> 0x10)
      && (iVar6 = (int)(char)DAT_001013f8 -
                  (int)(char)((byte)(*(ushort *)(iVar5 + 0x16) >> 4) & 0x3f),
         iVar5 = (int)(char)DAT_00101918 - (int)(char)(byte)(*(ushort *)(iVar5 + 0x16) >> 10),
         100 < (iVar5 * iVar5 + iVar6 * iVar6) * 0x10000 >> 0x10)) &&
     ((*(byte *)((char *)DAT_0010190c + 0xb) & 0xf) != 3)) {
    bVar3 = (byte)DAT_0010190c[5];
    /* Was `Ordinal_2005(0x10,(bVar3&0xf)+8); bVar8 = extraout_r1;` -- the
       classic "call idivmod, then read its remainder back through the
       extraout_r1 register-leftover fiction" pattern already fixed
       elsewhere this session (FUN_000229e0, FUN_0002431c's sVar_rem):
       this port's Ordinal_2005 (ordinal_stubs.c) only returns the
       quotient through its real C return value and never touches
       anything a recompiled build's own extraout_r1 local could
       legitimately read, so every read of it here was uninitialized/
       stray-value garbage -- confirmed via UW_DEBUG_NPC_PHASE: it read
       0 every single time regardless of the real (bVar3&0xf)+8 dividend,
       which fed straight back into DAT_0010190c[5]'s own low nibble
       below and pinned it there forever, so the class-0x40 (NPC)
       "too far to path, just advance its clock" branch this is in
       could never advance an off-screen monster's tick phase past
       where object_tick_is_due's catch-up-window check first admitted it --
       an unconditional infinite loop (npc_ai_tick always really does
       return 1, confirmed via real disassembly at 0x33874: `mov r0,#1`)
       hanging the entire game solid the moment any monster ever took
       this path. Compute the remainder directly instead. */
    bVar8 = ((bVar3 & 0xf) + 8) % 0x10;
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-branch] obj=%p took too-far-early-exit\n", (void *)DAT_0010190c);
    goto LAB_00033860;
  }
  if ((DAT_00101404[10] & 0x80) == 0) {
    if ((DAT_00101404[10] & 0x40) == 0) {
      DAT_0010172c = &DAT_002048c0;
      DAT_00101438 = &DAT_00204980;
    }
    else {
      DAT_0010172c = (undefined2 *)&DAT_00204950;
      DAT_00101438 = (byte *)&DAT_002049b0;
    }
  }
  else {
    DAT_0010172c = (undefined2 *)&DAT_002048f0;
    DAT_00101438 = (byte *)&DAT_00204990;
  }
  if (((&DAT_00202c99)[(*DAT_0010190c & 0x1ff) * 0xd] & 8) != 0) {
    uVar2 = *(undefined2 *)(DAT_00101438 + 2);
    DAT_00101438[2] = (byte)uVar2 & 0xdf;
    DAT_00101438[3] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)(DAT_00101438 + 6);
    DAT_00101438[6] = (byte)uVar2 & 0xdf;
    DAT_00101438[7] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)DAT_00101438;
    *DAT_00101438 = (byte)uVar2 | 0x20;
    DAT_00101438[1] = (byte)((ushort)uVar2 >> 8);
  }
  DAT_00101924 = 0;
  DAT_00101734 = 1;
  DAT_0010191c = 0;
  DAT_00101430 = 0;
  DAT_001013fc = 0;
  DAT_00101560 = 0;
  DAT_00101914 = 0;
  bVar3 = *(byte *)((char *)DAT_0010190c + 0x15) & 0x3f;
  if (((bVar3 != 0x2c) && (bVar3 != 0x20)) && ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) != 0)) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << ((byte)DAT_0010190c[0xb] & 0xf));
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0x7f;
  }
  if ((((*(byte *)((char *)DAT_0010190c + 0x15) & 0x40) == 0) ||
      ((*(byte *)((char *)DAT_0010190c + 0x13) & 0x7f) != 0)) || ((DAT_0010190c[10] & 0xf8) != 0x80)) {
    build_object_placement_snapshot(DAT_0010190c,DAT_0010172c);
    bVar3 = *(byte *)((char *)DAT_0010190c + 9);
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-sweep] obj=%p pre_tile=(%u,%u) snap0=0x%04x snap1=0x%04x\n",
              (void *)DAT_0010190c,
              (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4),
              (unsigned)((ushort *)DAT_0010172c)[0], (unsigned)((ushort *)DAT_0010172c)[1]);
    /* Was `build_collision_height_field_for_object()` -- a dropped argument (K&R declared, relying
       on whatever register-content reuse the real ARM code got for
       free). build_collision_height_field_for_object's own single param is dereferenced the exact
       same way every other call in this function uses DAT_0010190c (the
       object currently being processed) -- e.g. `*param_1 & 0x1ff`
       mirrors `*DAT_0010190c & 0x1ff` used just a few lines below.
       Confirmed live: called with no argument, param_1 read as
       garbage/NULL and crashed on its first dereference the moment an
       NPC's per-tick AI got this far (only possible after this
       session's other npc_ai_tick fixes). */
    DAT_00101414 = build_collision_height_field_for_object(DAT_0010190c);
    apply_placement_collision_sweep(DAT_0010172c,DAT_00101438);
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-sweep] obj=%p post_sweep snap0=0x%04x snap1=0x%04x (tile=(%u,%u))\n",
              (void *)DAT_0010190c,
              (unsigned)((ushort *)DAT_0010172c)[0], (unsigned)((ushort *)DAT_0010172c)[1],
              (unsigned)(byte)(((ushort *)DAT_0010172c)[0] >> 8),
              (unsigned)(byte)(((ushort *)DAT_0010172c)[1] >> 8));
    DAT_0010144c = (ushort)(*(byte *)((char *)DAT_0010190c + 0x17) >> 2);
    DAT_00101454 = (undefined2)((DAT_0010190c[0xb] & 0x3f0) >> 4);
    sync_object_tile_position(DAT_0010190c,DAT_0010172c);
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-sweep] obj=%p post_sync tile=(%u,%u)\n",
              (void *)DAT_0010190c,
              (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4));
    if (*(byte *)((char *)DAT_0010190c + 9) != bVar3) {
      DAT_00101430 = 1;
    }
  }
  if (((&DAT_00202c99)[(*DAT_0010190c & 0x1ff) * 0xd] & 8) != 0) {
    uVar2 = *(undefined2 *)(DAT_00101438 + 2);
    DAT_00101438[2] = (byte)uVar2 | 0x20;
    DAT_00101438[3] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)(DAT_00101438 + 6);
    DAT_00101438[6] = (byte)uVar2 | 0x20;
    DAT_00101438[7] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)DAT_00101438;
    *DAT_00101438 = (byte)uVar2 & 0xdf;
    DAT_00101438[1] = (byte)((ushort)uVar2 >> 8);
  }
  DAT_00101918 = *(byte *)((char *)DAT_0010190c + 0x17) >> 2;
  uVar9 = DAT_0010190c[0xb] >> 4 & 0x3f;
  DAT_001013f8 = (byte)uVar9;
  DAT_0010140c = (byte)DAT_0010190c[1] >> 3 & 0xf;
  DAT_00101910 = (short)(((uint)DAT_00101918 << 0x13) >> 0x10) +
                 (ushort)(*(byte *)((char *)DAT_0010190c + 3) >> 5);
  DAT_0010141c = (*(byte *)((char *)DAT_0010190c + 3) >> 2 & 7) + (short)((uVar9 << 0x13) >> 0x10);
  DAT_0010143c = (byte)DAT_0010190c[2] & 0x3f;
  DAT_0010173c = (byte)DAT_0010190c[3] & 0x3f;
  DAT_00101458 = *(byte *)((char *)DAT_0010190c + 9);
  bVar3 = (byte)(DAT_0010190c[1] >> 2);
  DAT_001018fc = (bVar3 ^ (byte)DAT_0010190c[0xc]) & 0x1f ^ bVar3;
  DAT_00101434 = *(byte *)((char *)DAT_0010190c + 0x13) & 0x7f;
  DAT_00101730 = (&DAT_00202c90)[(*DAT_0010190c & 0x1ff) * 0xd];
  uVar9 = (uint)*(ushort *)((char *)DAT_0010190c + 0xb);
  if (getenv("UW_DEBUG_NPC_STATE"))
    fprintf(stderr, "[npc-state] obj=%p uVar9=0x%x class=0x%x byte15=0x%x\n", (void *)DAT_0010190c,
            uVar9, (unsigned)(uVar9 & 0xf000),
            (unsigned)(*(byte *)((char *)DAT_0010190c + 0x15) & 0x3f));
  if (((uVar9 & 0xf) == 0xb) || ((uVar9 & 0xf) == 3)) {
LAB_00033830:
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-branch] obj=%p entering FUN_00033880 pre_tile=(%u,%u)\n",
              (void *)DAT_0010190c,
              (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4));
    FUN_00033880();
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-branch] obj=%p returned from FUN_00033880 post_tile=(%u,%u)\n",
              (void *)DAT_0010190c,
              (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4));
    goto LAB_00033834;
  }
  bVar3 = *(byte *)((char *)DAT_0010190c + 0x15) & 0x3f;
  if (bVar3 == 0xc) {
    if ((uVar9 & 0xf000) == 0x3000) {
      FUN_0003a73c(DAT_0010190c,1);
      DAT_0010144c = (ushort)(*(byte *)((char *)DAT_0010190c + 0x17) >> 2);
      DAT_00101454 = (undefined2)((DAT_0010190c[0xb] & 0x3f0) >> 4);
      iVar5 = tilemap_lookup();
      object_list_unlink(iVar5 + 2,DAT_0010190c);
      FUN_000798c4(DAT_0010190c);
      FUN_0002b258(DAT_0010190c,(byte)DAT_00101404[8] >> 5,(byte)DAT_00101404[10] >> 2 & 7);
      FUN_0007931c(DAT_0010190c);
      free_object_slot(DAT_0010190c);
      return 0;
    }
LAB_00033810:
    uVar10 = (uVar9 & 0xf000) + 0x1000 ^ uVar9 & 0xfff;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)(uVar9 & 0xfff);
LAB_000337fc:
    *(byte *)(DAT_0010190c + 6) = (byte)(uVar10 >> 8);
  }
  else if (((*(byte *)((char *)DAT_0010190c + 0x15) & 0x3f) == 0) || (3 < bVar3)) {
    if ((bVar3 != 0xd) || ((*(byte *)((char *)DAT_0010190c + 0x19) & 0xc) == 0)) {
      if (bVar3 != 5) goto LAB_00033830;
      if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
      uVar9 = ((byte)DAT_00101404[0x20] & 0x1e) >> 1;
      iVar5 = (short)uVar9 * 3;
      cVar4 = FUN_0003298c((&DAT_002027d1)[iVar5],1);
      DAT_00202a3c = (short)cVar4;
      FUN_0004a510(DAT_0010190c,uVar9,(&DAT_002027d1)[iVar5]);
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
      uVar10 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar10;
      goto LAB_000337fc;
    }
    if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
    cVar4 = FUN_0003298c(0x1e,0);
    DAT_00202a3c = (short)cVar4;
    FUN_00073b40(DAT_00101404[(*(byte *)((char *)DAT_0010190c + 0x19) >> 2 & 3) + 0x29],DAT_0010190c,0)
    ;
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
    uVar9 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar9;
    *(byte *)(DAT_0010190c + 6) = (byte)(uVar9 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xf3;
  }
  else {
    if (((*(ushort *)((char *)DAT_0010190c + 0xb) & 0xf000) == 0) && ((uVar9 & 0xff0) == 0x10)) {
      bVar3 = get_current_music_track();
      if ((bVar3 < 5) || (bVar3 = get_current_music_track(), 7 < bVar3)) {
        FUN_000735b0(6);
      }
      DAT_00101944 = read_realtime_clock_units();
    }
    uVar9 = (uint)*(ushort *)((char *)DAT_0010190c + 0xb);
    if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
    uVar7 = Ordinal_1053();
    puVar11 = DAT_0010190c;
    bVar3 = *(byte *)((char *)DAT_0010190c + 0x15);
    uVar1 = (&DAT_000853d8)[(uint)(byte)((byte)DAT_0010190c[8] >> 4) * 2];
    /* Was `Ordinal_2005(9,uVar7,*(byte*)(DAT_0010190c+0xf),Ordinal_2005_exref,
       DAT_00101404[0xf]); FUN_00027ce0(puVar11,(int)extraout_r1_01,uVar1,
       (bVar3&0x3f)-1);` -- badly garbled. Real disassembly (0x335b8-0x33628)
       shows this is genuinely TWO separate things the decompiler folded
       together: a plain `Ordinal_2005(9,uVar7)` (same fabricated-remainder
       bug fixed throughout this session -- computed the remainder
       directly), and FUN_00027ce0's own 5th argument (it takes 5 params,
       confirmed at its definition; this call was silently dropping the
       last one) -- DAT_00101404[0xf], stashed on the stack by the real
       ARM code before the Ordinal_2005 call and read back after it, which
       the decompiler instead spliced into Ordinal_2005's own argument
       list as three bogus extra params (including the nonsensical
       Ordinal_2005_exref placeholder). Confirmed live: this whole branch
       (an NPC's "pick a new wander/patrol target" state) is exactly what
       the QA-reported "NPC teleports away on its first tick" bug was
       tracing back to -- FUN_00027ce0 computes DAT_00100608/DAT_0010061c
       (target position deltas) then calls FUN_000270d0 to path there;
       with param_5 uninitialized/garbage and param_2 (the modulo-9
       remainder) also fabricated-garbage before this fix, the computed
       target tile could land anywhere. */
    FUN_00027ce0(puVar11,(short)(uVar7 % 9),uVar1,(bVar3 & 0x3f) - 1,(short)DAT_00101404[0xf]);
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
    uVar9 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar9;
    *(byte *)(DAT_0010190c + 6) = (byte)(uVar9 >> 8);
    uVar9 = *(ushort *)((char *)DAT_0010190c + 0xf) & 0xfff;
    *(byte *)((char *)DAT_0010190c + 0xf) = (byte)uVar9;
    *(byte *)(DAT_0010190c + 8) = (byte)(uVar9 >> 8);
  }
LAB_00033834:
  puVar11 = DAT_0010190c;
  bVar3 = (byte)DAT_0010190c[5];
  /* Was `Ordinal_2005(...); bVar8 = extraout_r1_00;` -- same fabricated-
     remainder bug as the other Ordinal_2005 call above in this function,
     see that comment. Compute the remainder directly instead. */
  bVar8 = (((byte)DAT_0010190c[10] & 7) + (bVar3 & 0xf)) % 0x10;
LAB_00033860:
  *(byte *)(puVar11 + 5) = (bVar3 ^ bVar8) & 0xf ^ bVar3;
  if (getenv("UW_DEBUG_NPC_PHASE"))
    fprintf(stderr, "[npc-phase] obj=%p old=0x%x new=0x%x bVar8=0x%x speed=0x%x\n",
            (void *)puVar11, bVar3, (unsigned)((bVar3 ^ bVar8) & 0xf ^ bVar3), bVar8,
            (unsigned)((byte)puVar11[10] & 7));
  if (getenv("UW_DEBUG_NPC_WANDER"))
    fprintf(stderr, "[npc-exit] obj=%p exit_tile=(%u,%u)\n", (void *)DAT_0010190c,
            (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4));
  return 1;
}




// was FUN_000349bc. The real per-tick NPC AI + mobile-object dispatcher:
// walks the mobile-object-arena "currently active slot indices" list
// (DAT_002046c0..DAT_002046c8), and for each slot due for a sub-step
// (object_tick_is_due) dispatches to npc_ai_tick (class 0x40, NPC) or
// mobile_object_tick (everything else), looping while that call keeps
// signaling more catch-up work. Only caller is movement_tick, gated on
// g_npc_tick_enabled -- see that global's own comment for why this
// never ran before this session.
void tick_mobile_objects(param_1)
char param_1;

{
  int iVar1;
  byte *pbVar2;

  DAT_0010190c = (ushort *)0x0;
  DAT_00101928 = DAT_00101948 + param_1 & 0xf;
  pbVar2 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      DAT_0010190c = (ushort *)((uint)*pbVar2 * 0x1b + DAT_002046b8);
      do {
        iVar1 = object_tick_is_due((byte)DAT_0010190c[5] & 0xf,(byte)DAT_0010190c[10] & 7);
        if (iVar1 == 0) goto LAB_00034a98;
        if ((*DAT_0010190c & 0x1c0) == 0x40) {
          iVar1 = npc_ai_tick();
        }
        else {
          iVar1 = mobile_object_tick();
        }
      } while (iVar1 != 0);
      pbVar2 = pbVar2 + -1;
LAB_00034a98:
      pbVar2 = pbVar2 + 1;
    } while (pbVar2 < DAT_002046c8);
    if (DAT_0010190c != (ushort *)0x0) {
      FUN_00049924(2);
    }
  }
  DAT_00101948 = DAT_00101928;
  return;
}




void build_creature_look_text(param_1,param_2)
ushort * param_1;
char *param_2;   /* was undefined4 -- the caller's stack description buffer
                    (acStack_7c); Ordinal_1063/message_scroll_print_wrapped
                    write through it, so truncating it crashed a right-click
                    "look" at a creature (the "vitality is N out of N" path). */

{
  byte bVar1;
  char cVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  /* format_object_display_name's real return type is `undefined1 *` -- was captured
     into `uVar7` (undefined4/int), which also does double duty as a
     plain 0/1 flag a few lines down. On this 64-bit host that truncated
     the real pointer to 32 bits before handing it to Ordinal_1063
     (strcat), so appending a creature's description/name here crashed
     inside the fortified strcat on a wild source pointer -- reproduced
     via a real right-click "look" at a named creature (repro needed
     UW_PICK_FORCE_SLOT since no object in the previously-tested area
     had a real name to overflow through). Separate real pointer local
     for the string result, keeping uVar7 for its flag use. */
  char *pcVar_desc;
  undefined1 *puVar8;

  pcVar3 = (char *)FUN_0007863c(*param_1 & 0x1ff | 0x800);
  bVar1 = (byte)param_1[0xd];
  if ((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) {
    pcVar3 = (char *)0x0;
  }
  if (((0xef < bVar1) && (bVar1 != 0xff)) ||
     (pcVar4 = (char *)FUN_0007863c((byte)((byte)param_1[7] >> 6) + 0x60 | 0xa00),
      pcVar4 == (char *)0x0 || *pcVar4 == '\0'))
  {
    pcVar4 = (char *)0x0;
  }
  if ((bVar1 == 0) ||
     (pcVar5 = (char *)FUN_0007863c((int)(short)(ushort)bVar1 + 0x10U | 0xe00),
      pcVar5 == (char *)0x0 || *pcVar5 == '\0')) {
    pcVar5 = (char *)0x0;
  }
  if (pcVar3 != (char *)0x0) {
    if (pcVar4 != (char *)0x0) {
      cVar2 = *pcVar4;
      if (((cVar2 == 'a') || (cVar2 == 'e')) || ((cVar2 == 'i' || (cVar2 == 'o' || cVar2 == 'u'))))
      {
        puVar8 = &DAT_00085244;
      }
      else {
        puVar8 = &DAT_00085248;
      }
      Ordinal_1063(param_2,puVar8);
      Ordinal_1063(param_2,pcVar4);
      Ordinal_1063(param_2,&DAT_00085240);
    }
    if ((pcVar5 == (char *)0x0) || (iVar6 = Ordinal_1417((int)*pcVar5,1), iVar6 != 0)) {
      pcVar_desc = (char *)format_object_display_name(pcVar3,pcVar4 == (char *)0x0,0);
      if (pcVar_desc != (char *)0x0) {
        Ordinal_1063(param_2,pcVar_desc);
      }
    }
  }
  if (pcVar5 != (char *)0x0) {
    uVar7 = 1;
    if (pcVar3 != (char *)0x0) {
      iVar6 = Ordinal_1417((int)*pcVar5,1);
      if (iVar6 != 0) {
        Ordinal_1063(param_2,s_named_00085d18);
      }
      uVar7 = 0;
    }
    pcVar_desc = (char *)format_object_display_name(pcVar5,uVar7,0);
    if (pcVar_desc != (char *)0x0) {
      Ordinal_1063(param_2,pcVar_desc);
    }
  }
  Ordinal_1063(param_2,&DAT_00084f20);
  /* Same missing-newline issue as dispatch_object_action/dispatch_object_action_dup's own
     fix -- back-to-back Looks at a creature otherwise all land on the
     same visible scroll line. */
  Ordinal_1063(param_2,"\n");
  message_scroll_print_wrapped(param_2);
  return;
}




// was FUN_00052c5c -- disassembly-confirmed real math, not a bug: with
// param_1=10 (discard_misplaced_object's only caller value) this
// computes `rand_below(10) < (10 + rand_below(3))`, and since
// rand_below(10) maxes at 9 while the threshold is always >=10, the
// roll ALWAYS succeeds under normal conditions (unless the object is
// itself gated by roll_object_destroy_chance's own nested container
// check via free_linked_object_recursive/FUN_00052af4).
undefined4 roll_object_destroy_chance(param_1,param_2)
short param_1;
char *param_2;  /* was `int` -- truncated the real object-record pointer
                   (dereferenced via casts, passed to resolve_object_link
                   and FUN_00052bac), latent until those calls started
                   actually using their arguments */

{
  short sVar1;
  int iVar2;
  /* Was `undefined4 uVar3` -- truncated resolve_object_link's real
     pointer return before forwarding it into FUN_00052af4 just below,
     same class as this whole never-before-exercised drop-into-world
     path's other fixes. Confirmed live: FUN_00052af4 received a NULL/
     garbage param_1 and crashed the moment it dereferenced it. */
  char *pcVar3;

  if (param_2 != 0) {
    if (param_1 != 0) {
      sVar1 = rand_below(3);
      param_1 = param_1 + sVar1;
    }
    DAT_002046b0 = param_1;
    iVar2 = FUN_00052bac(param_2);
    if (iVar2 == 0) {
      if (((*(byte *)(param_2 + 1) & 0x80) == 0) && ((*(ushort *)(param_2 + 6) & 0xffc0) != 0)) {
        pcVar3 = (char *)resolve_object_link((ushort *)(param_2 + 6)); /* confirmed via ARM disassembly, 0x52ce8 */
        iVar2 = FUN_00052af4(pcVar3,FUN_00052bac);
        if (iVar2 != 0) {
          return 0;
        }
      }
      iVar2 = rand_below(10);
      if (iVar2 < DAT_002046b0) {
        return 1;
      }
    }
  }
  return 0;
}




// was FUN_00054f6c. Applies the placement snapshot (param_2, built by
// build_object_placement_snapshot) back onto the real object (param_1):
// relinks it between tilemap tile lists when its tile changed, then
// copies position/orientation fields and, for arena-mobile objects,
// speed/collision-height data. May call settle_mobile_to_immobile on a
// decayed object and, on that path, free it -- callers must always
// propagate its return value.
undefined4 sync_object_tile_position(param_1,param_2)
ushort * param_1;
ushort * param_2;

{
  int uw_ord2005_rem_118 = 0;
  ushort uVar1;
  undefined1 uVar2;
  byte bVar3;
  short sVar4;
  /* Was `int`, truncating the real 64-bit pointers this variable holds
     from tilemap_lookup() and settle_mobile_to_immobile() (both real pointer
     returns) -- same class of bug fixed several times elsewhere this
     session (npc_ai_tick's own iVar5, DAT_0010172c, apply_placement_collision_sweep's
     param_1). Confirmed live via lldb: iVar5 held 0x1c820200 instead of
     the real 0x11c820200 (upper word dropped, DAT_002029cc itself was
     NOT corrupted -- an earlier working theory this session, based on
     comparing DAT_002029cc across separate process runs with different
     ASLR-derived heap addresses, was wrong), crashing
     object_list_insert_head on the truncated iVar5+2. iVar5 is also
     reused for small-int arithmetic later in this function; intptr_t is
     safe for that too. */
  intptr_t iVar5;
  undefined4 uVar6;
  int extraout_r1;
  uint uVar7;
  uint uVar8;
  byte bVar9;
  bool bVar10;
  bool bVar11;
  
  if (((short)*param_2 >> 8 != DAT_0010144c) || ((short)param_2[1] >> 8 != DAT_00101454)) {
    /* Both tilemap_lookup() calls below were dropped-argument (K&R,
       relying on register-content reuse) -- unlike the many other such
       call sites in this file that legitimately reuse whatever's still
       in r0/r1 from an immediately preceding, equivalent computation,
       here the surrounding code makes the intended arguments
       unambiguous and explicit: DAT_0010144c/DAT_00101454 are "the
       current tile" (old, for the unlink just below; the caller's own
       just-written new values, for the insert after they're updated).
       Confirmed live via lldb: the second call returned NULL (garbage
       register content, not the real new tile coords), crashing
       object_list_insert_head on iVar5+2 == 0x2.

       Separately: neither object_list_unlink nor object_list_insert_head
       itself tolerates a NULL tilemap_lookup result (both unconditionally
       dereference their first arg), so also skip each call outright on
       NULL -- tilemap_lookup can legitimately return NULL now that it
       guards against DAT_002029cc's own separately-documented corruption
       (see that function's comment); confirmed live crashing here via
       exactly that path (a wild pointer read at object_list_insert_head's
       first dereference) the first time NPC AI reached this function. */
    iVar5 = tilemap_lookup(DAT_0010144c,DAT_00101454);
    if (iVar5 != 0) {
      object_list_unlink(iVar5 + 2,param_1);
    }
    DAT_0010144c = (ushort)(char)(*param_2 >> 8);
    DAT_00101454 = (short)(char)(param_2[1] >> 8);
    iVar5 = tilemap_lookup(DAT_0010144c,DAT_00101454);
    if (iVar5 != 0) {
      object_list_insert_head(iVar5 + 2,param_1);
    }
  }
  uVar7 = (uint)param_1[1];
  bVar9 = (byte)((int)(((int)(short)param_2[2] & 0x3f8U) << 0x10) >> 0x13);
  *(byte *)(param_1 + 1) = (byte)(uVar7 & 0xff80) | bVar9;
  *(char *)((char *)param_1 + 3) = (char)((uVar7 & 0xff80) >> 8);
  bVar3 = (byte)((uint)(((int)(short)(*param_2 & 0xe0) >> 5) << 0xd) >> 8);
  *(byte *)(param_1 + 1) = (byte)(uVar7 & 0x1f80) | bVar9;
  *(byte *)((char *)param_1 + 3) = (byte)((uVar7 & 0x1f80) >> 8) | bVar3;
  uVar1 = param_2[1];
  *(byte *)(param_1 + 1) = (byte)(uVar7 & 0x380) | bVar9;
  *(byte *)((char *)param_1 + 3) =
       (byte)((uVar7 & 0x380) >> 8) | bVar3 |
       (byte)((uint)(((int)(short)(uVar1 & 0xe0) >> 5) << 10) >> 8);
  if (param_1 < DAT_002046c4) {
    *(byte *)(param_1 + 4) = (byte)param_2[0xf];
  }
  else {
    uVar1 = param_1[2];
    *(byte *)(param_1 + 2) = (byte)param_2[0xf] & 0x3f | (byte)(uVar1 & 0xffc0);
    *(char *)((char *)param_1 + 5) = (char)((uVar1 & 0xffc0) >> 8);
  }
  uVar1 = *(ushort *)((char *)param_2 + 0x29);
  if (0x100 < uVar1) {
    if ((*param_1 & 0x1c0) != 0x40) {
      uVar2 = Ordinal_2005(0x32,(short)(*(ushort *)(&DAT_00202c91 + (*param_1 & 0x1ff) * 0xd) >> 4)
                                + -600);
      FUN_00072fc8(0xf,param_1,uVar2);
    }
    FUN_00038374(param_1,0,(int)(short)DAT_0010144c,(int)DAT_00101454,(char)(uVar1 >> 8),0);
  }
  if (param_1 < DAT_002046c4) {
    *(byte *)(param_1 + 4) = (byte)param_2[0xf];
  }
  else {
    uVar1 = param_1[2];
    *(byte *)(param_1 + 2) = (byte)param_2[0xf] & 0x3f | (byte)(uVar1 & 0xffc0);
    *(char *)((char *)param_1 + 5) = (char)((uVar1 & 0xffc0) >> 8);
  }
  if ((param_2[0x14] & 4) != 0) {
    uVar6 = Ordinal_1053();
    uw_ord2005_rem_118 = ((int)(uVar6)) % (5);
    if (uw_ord2005_rem_118 == 0) {
      FUN_00038374(param_1,0,(int)(short)DAT_0010144c,(int)DAT_00101454,1,8);
    }
  }
  if ((*param_1 & 0x1c0) != 0x40) {
    if (DAT_002046c4 < param_1) {
      if ((param_2[10] != 0 || param_2[8] != 0) || param_2[5] != 0) {
        param_1 = (ushort *)reallocate_object_to_arena(param_1);
      }
    }
    else if ((param_2[10] == 0 && param_2[8] == 0) && param_2[5] == 0) {
      *(byte *)(param_1 + 5) =
           (byte)param_1[5] & 0x8f | ((&DAT_000868c0)[(byte)param_2[0x14]] & 7) << 4;
      iVar5 = settle_mobile_to_immobile(param_1);
      if (iVar5 == 0) {
        return 0;
      }
      param_1 = (ushort *)settle_dropped_object(iVar5,(int)(short)DAT_0010144c,(int)DAT_00101454,0);
      if (param_1 == (ushort *)0x0) {
        return 0;
      }
      if (DAT_002046c4 <= param_1) goto LAB_0005559c;
      FUN_00055ef8(param_2);
    }
  }
  if (param_1 < DAT_002046c4) {
    uVar1 = param_1[0xb];
    *(char *)((char *)param_1 + 9) = (char)((ushort)*(undefined2 *)((char *)param_2 + 0x21) >> 8);
    uVar8 = uVar1 & 0x3ff;
    uVar7 = (DAT_0010144c & 0x3f) << 10;
    *(char *)(param_1 + 0xb) = (char)uVar8;
    *(byte *)((char *)param_1 + 0x17) = (byte)(uVar8 >> 8) | (byte)(uVar7 >> 8);
    uVar7 = uVar1 & 0xf | uVar7 | ((int)DAT_00101454 & 0x3fU) << 4;
    *(char *)(param_1 + 0xb) = (char)uVar7;
    *(char *)((char *)param_1 + 0x17) = (char)(uVar7 >> 8);
    bVar11 = SBORROW4((int)(short)param_2[8],-4);
    bVar9 = ((short)param_2[8] == -4) << 7 | *(byte *)((char *)param_1 + 0x13) & 0x7f;
    *(byte *)((char *)param_1 + 0x13) = bVar9;
    iVar5 = (int)(short)param_2[5];
    if (iVar5 < 0) {
      iVar5 = iVar5 + 0x3f;
    }
    iVar5 = (short)(iVar5 >> 6) + 0x10;
    sVar4 = (short)iVar5;
    iVar5 = iVar5 * 0x10000 >> 0x10;
    bVar10 = iVar5 == 0;
    if (iVar5 < 0) {
      sVar4 = 0;
    }
    else {
      bVar11 = SBORROW4(iVar5,0x1f);
      bVar10 = iVar5 == 0x1f;
    }
    if (!bVar10 && (iVar5 < 0 || iVar5 + -0x1f < 0) == bVar11) {
      sVar4 = 0x1f;
    }
    *(byte *)(param_1 + 10) = (byte)((int)sVar4 << 3) | (byte)param_1[10] & 7;
    bVar3 = Ordinal_2005(0x2f,(int)(short)param_2[10]);
    *(byte *)((char *)param_1 + 0x13) = (bVar3 ^ bVar9) & 0x7f ^ bVar9;
    *(byte *)(param_1 + 5) =
         (byte)param_1[5] & 0x8f | ((&DAT_000868c0)[(byte)param_2[0x14]] & 7) << 4;
    if ((CONCAT11(*(undefined1 *)((char *)param_1 + 1),(char)*param_1) & 0x1c0) != 0x40) {
      uVar1 = *param_2;
      *(char *)((char *)param_1 + 0xb) = (char)uVar1;
      *(char *)(param_1 + 6) = (char)(uVar1 >> 8);
      uVar1 = param_2[1];
      *(char *)((char *)param_1 + 0xd) = (char)uVar1;
      *(char *)(param_1 + 7) = (char)(uVar1 >> 8);
      uVar1 = param_2[2];
      *(char *)((char *)param_1 + 0xf) = (char)uVar1;
      *(char *)(param_1 + 8) = (char)(uVar1 >> 8);
    }
    return 1;
  }
LAB_0005559c:
  if ((*param_1 & 0x1c0) == 0x140) {
    uVar7 = param_1[1] & 0xfc7f | ((int)*(short *)((char *)param_2 + 0x21) >> 0xd & 7U) << 7;
    *(char *)(param_1 + 1) = (char)uVar7;
    *(char *)((char *)param_1 + 3) = (char)(uVar7 >> 8);
  }
  return 0;
}




// was FUN_0005596c. Completes the mobile->immobile object-arena
// transition per the Ultima Codex internal-format docs: rolls a class-
// derived decay/destroy chance, and on survival copies param_1's fields
// into a freshly alloc_object_slot(0)'d immobile-arena record, relinking
// it into the tile list in param_1's place. Unconditionally frees
// param_1 via discard_misplaced_object regardless of outcome -- callers
// must always propagate the return value (including NULL on decay),
// never keep using their own stale param_1 pointer. Already used by this
// branch's own drop_held_object_near_player/spawn_object_near_player fix
// (an explicit synchronous call, since this port resolves a toss
// instantly with no per-tick flight simulation); now also reached
// organically via sync_object_tile_position as part of ordinary mobile-
// object ticking.
ushort *settle_mobile_to_immobile(param_1)
ushort * param_1;

{
  ushort uVar1;
  undefined2 uVar2;
  bool bVar3;
  byte bVar4;
  byte bVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  int iVar8;
  char *pbTile;
  ushort *puVar9;
  int iVar10;
  short extraout_r1;
  short extraout_r1_00;
  uint uVar11;
  uint uVar12;
  byte bVar13;
  byte local_2c;
  
  bVar3 = true;
  bVar13 = (byte)(&DAT_00202c98)[(*param_1 & 0x1ff) * 0xd] >> 1 & 0xf;
  bVar5 = (byte)param_1[5] & 0x70;
  if (bVar5 == 0x10) {
    bVar13 = 8;
    FUN_00081814(param_1,6,3,0,0,DAT_0010144c,DAT_00101454);
  }
  else if ((((bVar5 == 0x20) && (bVar13 == 10)) && (DAT_00201b68 == 8)) &&
          ((uVar11 = (int)((int)DAT_0010144c - 0x20U) >> 0x1f,
           uVar12 = (int)((int)DAT_00101454 - 0x20U) >> 0x1f,
           (int)((((int)DAT_00101454 - 0x20U ^ uVar12) - uVar12) +
                (((int)DAT_0010144c - 0x20U ^ uVar11) - uVar11)) < 6 &&
           (*(char *)((char *)g_player_object + 8) != '\0')))) {
    if ((*(byte *)(DAT_00086df8 + 0x62) & 4) == 0) {
      uVar2 = *(undefined2 *)(DAT_00086df8 + 0x6e);
      *(byte *)(DAT_00086df8 + 0x6e) = (byte)uVar2 | 8;
      *(char *)(DAT_00086df8 + 0x6f) = (char)((ushort)uVar2 >> 8);
    }
    else {
      bVar13 = 8;
      bVar3 = false;
      *(char *)(DAT_00086df8 + 0x6d) = *(char *)(DAT_00086df8 + 0x6d) + -1;
      if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
        FUN_00078c80(0x116);
        FUN_00049924(0x400);
      }
      else {
        uVar11 = *param_1 & 0xffc2 | 0x1c2;
        *(byte *)param_1 = (byte)uVar11;
        *(byte *)((char *)param_1 + 1) = (byte)(uVar11 >> 8);
        if (*(byte *)(DAT_00086df8 + 0x6d) < 9) {
          iVar8 = 8;
          do {
            bVar4 = Ordinal_1053();
            uVar1 = param_1[1];
            bVar5 = (byte)uVar1;
            *(byte *)(param_1 + 1) = ((bVar4 & 7) + bVar5 + 4 ^ bVar5) & 0x7f ^ bVar5;
            *(byte *)((char *)param_1 + 3) = (byte)(uVar1 >> 8);
            uVar6 = Ordinal_1053();
            uVar7 = Ordinal_1053();
            /* Was `Ordinal_2005(3,uVar6); ... extraout_r1_00` / same for
               uVar7/extraout_r1 -- the same fabricated-remainder bug
               fixed several times elsewhere this session (this port's
               Ordinal_2005 never populates extraout_r1). Computed each
               remainder directly instead; this was feeding a random
               scatter offset into FUN_00081388 (spawn debris around the
               object), so previously ran with a garbage/undefined delta
               every time this rare "teleport gate" branch was taken --
               intermittently crashing (confirmed live, ~1-in-5 runs of
               demo_critter_orbit_cardinal.txt). */
            extraout_r1_00 = (short)(uVar6 % 3);
            iVar10 = (int)DAT_00101454;
            extraout_r1 = (short)(uVar7 % 3);
            FUN_00081388(param_1,(int)DAT_0010144c + (int)extraout_r1_00 + -1,
                         iVar10 + extraout_r1 + -1);
            iVar8 = (iVar8 + -1) * 0x10000 >> 0x10;
          } while ((int)(uint)*(byte *)(DAT_00086df8 + 0x6d) <= iVar8);
        }
      }
    }
  }
  if (((bVar13 != 0) && (bVar13 < 9)) &&
     ((bVar5 = Ordinal_1053(), (bVar5 & 7) < bVar13 &&
      (iVar8 = roll_object_destroy_chance(10,param_1), iVar8 != 0)))) {
    bVar3 = false;
  }
  if (DAT_00201b68 == 9) {
    bVar3 = false;
  }
  /* Was `iVar8 = tilemap_lookup(...); iVar8 = iVar8 + 2;` -- same pointer-
     truncation-into-`int` bug fixed in FUN_0004ad10 just above (that one
     crashed live; this is the same call shape, iVar8 already reused here
     for unrelated small-integer math earlier in this function, so given
     its own dedicated pointer local rather than widening iVar8 itself). */
  pbTile = (char *)tilemap_lookup((int)DAT_0010144c,(int)DAT_00101454);
  pbTile = pbTile + 2;
  if ((bVar3) && (puVar9 = (ushort *)alloc_object_slot(0), puVar9 != (ushort *)0x0)) {
    *(byte *)puVar9 = (byte)*param_1;
    *(byte *)((char *)puVar9 + 1) = *(byte *)((char *)param_1 + 1);
    *(byte *)(puVar9 + 1) = (byte)param_1[1];
    *(byte *)((char *)puVar9 + 3) = *(byte *)((char *)param_1 + 3);
    *(byte *)(puVar9 + 2) = (byte)param_1[2];
    *(byte *)((char *)puVar9 + 5) = *(byte *)((char *)param_1 + 5);
    *(byte *)(puVar9 + 3) = (byte)param_1[3];
    *(byte *)((char *)puVar9 + 7) = *(byte *)((char *)param_1 + 7);
    *(byte *)(param_1 + 3) = (byte)param_1[3] & 0x3f;
    *(byte *)((char *)param_1 + 7) = 0;
    uVar1 = *puVar9;
    if ((uVar1 & 0x1c0) == 0x1c0) {
      FUN_00080e00(puVar9,param_1);
    }
    else if ((((uVar1 & 0x1f0) == 0x90) && (3 < (uVar1 & 0xf))) && ((uVar1 & 0xf) < 7)) {
      bVar5 = (byte)uVar1;
      *(byte *)puVar9 = (bVar5 - 4 ^ bVar5) & 0xf ^ bVar5;
      *(byte *)((char *)puVar9 + 1) = (byte)(uVar1 >> 8);
      set_ambient_bias_without_light(0);
    }
    uVar1 = puVar9[2];
    *(byte *)(puVar9 + 2) = (byte)param_1[4] & 0x3f | (byte)(uVar1 & 0xffc0);
    *(byte *)((char *)puVar9 + 5) = (byte)((uVar1 & 0xffc0) >> 8);
    uVar12 = (uint)CONCAT11(*(byte *)((char *)puVar9 + 1),(byte)*puVar9);
    uVar11 = uVar12 & 0x1c0;
    if (((uVar11 != 0x140) && (uVar11 != 0x180)) &&
       (((&DAT_00202c9a)[(uVar12 & 0x1ff) * 0xd] & 3) != 2)) {
      uVar11 = puVar9[1] & 0xfc7f | ((byte)param_1[0xd] & 7) << 7;
      *(byte *)(puVar9 + 1) = (byte)uVar11;
      *(byte *)((char *)puVar9 + 3) = (byte)(uVar11 >> 8);
    }
  }
  else {
    puVar9 = (ushort *)0x0;
  }
  if (bVar13 == 9) {
    if ((*param_1 & 0x1c0) == 0x40) {
      local_2c = 0;
    }
    else {
      local_2c = (byte)param_1[9];
    }
  }
  discard_misplaced_object(pbTile,param_1,1);
  if (puVar9 != (ushort *)0x0) {
    object_list_insert_head(pbTile,puVar9);
  }
  if ((bVar13 == 9) &&
     (iVar10 = FUN_000816e0(puVar9,(int)DAT_0010144c,(int)DAT_00101454,local_2c), iVar10 == 0)) {
    puVar9 = (ushort *)discard_misplaced_object(pbTile,puVar9,0);
  }
  return puVar9;
}

