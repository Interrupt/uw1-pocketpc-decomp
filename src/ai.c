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
// reconstruct_path_from_bfs to reconstruct the path on success. Creature AI, not
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
                reconstruct_path_from_bfs(local_5a,param_4,param_5);
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
  /* Dropped arguments: the real call (0x2e5c0) is made with r0/r1/r2
     still holding this function's own three incoming parameters (the
     prologue spills all three, `stmdb sp!,{r0,r1,r2}`), so the
     destination y and the third value were whatever this port's ABI
     left in those registers -- garbage written straight into the NPC
     record by npc_set_walk_target. */
  npc_set_walk_target(param_1,param_2,param_3);
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
        /* Was a dropped argument -- called with no args (`FUN_0002dd4c();`
           before this rename). This whole block's own cache-slot record (iVar6-offset into
           &DAT_00101568/1569, the same `slot*0x1c` byte record layout
           save_walk_path_to_cache_slot writes) is exactly what this
           function needs to advance. */
        advance_cached_path_step(&DAT_00101568 + (int)iVar6);
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
          npc_arrival_interaction(DAT_00101904);
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
    iVar6 = walk_using_cached_path(&DAT_00101568 + (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf) * 0x1c);
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
    uVar8 = compute_movement_heading(iVar1,iVar2);
    *(char *)((char *)DAT_0010190c + 9) = (char)((uVar8 & 0xff) << 5);
    uVar8 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar8 & 7) << 7;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar8;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar8 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
    if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
      set_npc_altitude_state(param_1,param_2);
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
       (sVar5 = try_direct_line_walk(DAT_00101918,DAT_001013f8,param_1 & 0xff,param_2), sVar5 == 1)) {
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) | 0x80;
      uVar8 = compute_movement_heading(iVar1,iVar2);
      *(char *)((char *)DAT_0010190c + 9) = (char)((uVar8 & 0xff) << 5);
      uVar8 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar8 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar8;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar8 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xbf;
      if ((*(byte *)((char *)DAT_0010190c + 0x15) & 0x80) == 0) goto LAB_0002ed50;
      goto LAB_0002ebfc;
    }
    iVar6 = pop_pending_path_cache_slot(local_40);
    if (iVar6 != 0) {
      uVar4 = compute_pathfind_search_radius();
      iVar6 = creature_find_path_to_tile(DAT_00101918,DAT_001013f8,*(byte *)((char *)DAT_0010190c + 2) >> 3 & 0xf,param_1,
                           param_2,param_3,uVar4);
      if (iVar6 != 0) {
        DAT_000853b8 = DAT_000853b8 & ~(ushort)(1 << (uint)local_40[0]);
        save_walk_path_to_cache_slot(&DAT_00101568 + (uint)local_40[0] * 0x1c);
        *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xbf;
        *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) | 0x80;
        uVar8 = *(ushort *)((char *)DAT_0010190c + 0x16) & 0xfff0;
        *(byte *)((char *)DAT_0010190c + 0x16) = local_40[0] & 0xf | (byte)uVar8;
        *(char *)((char *)DAT_0010190c + 0x17) = (char)(uVar8 >> 8);
        walk_using_cached_path(&DAT_00101568 + (*(byte *)((char *)DAT_0010190c + 0x16) & 0xf) * 0x1c);
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
       elsewhere this session (itoa_radix, draw_chargen_field_options's sVar_rem):
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
      fprintf(stderr, "[npc-branch] obj=%p entering npc_ai_default_tick pre_tile=(%u,%u)\n",
              (void *)DAT_0010190c,
              (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4));
    npc_ai_default_tick();
    if (getenv("UW_DEBUG_NPC_WANDER"))
      fprintf(stderr, "[npc-branch] obj=%p returned from npc_ai_default_tick post_tile=(%u,%u)\n",
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
      spawn_creature_death_loot(DAT_0010190c);
      drop_monster_loot(DAT_0010190c,(byte)DAT_00101404[8] >> 5,(byte)DAT_00101404[10] >> 2 & 7);
      drop_creature_inventory_on_death(DAT_0010190c);
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
      cVar4 = compute_vertical_aim_offset((&DAT_002027d1)[iVar5],1);
      DAT_00202a3c = (short)cVar4;
      FUN_0004a510(DAT_0010190c,uVar9,(&DAT_002027d1)[iVar5]);
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
      uVar10 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar10;
      goto LAB_000337fc;
    }
    if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
    cVar4 = compute_vertical_aim_offset(0x1e,0);
    DAT_00202a3c = (short)cVar4;
    dispatch_tile_special_action(DAT_00101404[(*(byte *)((char *)DAT_0010190c + 0x19) >> 2 & 3) + 0x29],DAT_0010190c,0)
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
        set_pending_music_track(6);
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
       DAT_00101404[0xf]); resolve_npc_melee_attack(puVar11,(int)extraout_r1_01,uVar1,
       (bVar3&0x3f)-1);` -- badly garbled. Real disassembly (0x335b8-0x33628)
       shows this is genuinely TWO separate things the decompiler folded
       together: a plain `Ordinal_2005(9,uVar7)` (same fabricated-remainder
       bug fixed throughout this session -- computed the remainder
       directly), and resolve_npc_melee_attack's own 5th argument (it takes 5 params,
       confirmed at its definition; this call was silently dropping the
       last one) -- DAT_00101404[0xf], stashed on the stack by the real
       ARM code before the Ordinal_2005 call and read back after it, which
       the decompiler instead spliced into Ordinal_2005's own argument
       list as three bogus extra params (including the nonsensical
       Ordinal_2005_exref placeholder). Confirmed live: this whole branch
       (an NPC's "pick a new wander/patrol target" state) is exactly what
       the QA-reported "NPC teleports away on its first tick" bug was
       tracing back to -- resolve_npc_melee_attack computes DAT_00100608/DAT_0010061c
       (target position deltas) then calls process_melee_attack_swing to path there;
       with param_5 uninitialized/garbage and param_2 (the modulo-9
       remainder) also fabricated-garbage before this fix, the computed
       target tile could land anywhere. */
    resolve_npc_melee_attack(puVar11,(short)(uVar7 % 9),uVar1,(bVar3 & 0x3f) - 1,(short)DAT_00101404[0xf]);
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

  pcVar3 = (char *)get_message_string(*param_1 & 0x1ff | 0x800);
  bVar1 = (byte)param_1[0xd];
  if ((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) {
    pcVar3 = (char *)0x0;
  }
  if (((0xef < bVar1) && (bVar1 != 0xff)) ||
     (pcVar4 = (char *)get_message_string((byte)((byte)param_1[7] >> 6) + 0x60 | 0xa00),
      pcVar4 == (char *)0x0 || *pcVar4 == '\0'))
  {
    pcVar4 = (char *)0x0;
  }
  if ((bVar1 == 0) ||
     (pcVar5 = (char *)get_message_string((int)(short)(ushort)bVar1 + 0x10U | 0xe00),
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
      play_sound_effect_at_object(0xf,param_1,uVar2);
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
    spawn_scheduled_effect_object(param_1,6,3,0,0,DAT_0010144c,DAT_00101454);
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
        print_scroll_message_by_id(0x116);
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
               scatter offset into spawn_effect_debris_burst (spawn debris around the
               object), so previously ran with a garbage/undefined delta
               every time this rare "teleport gate" branch was taken --
               intermittently crashing (confirmed live, ~1-in-5 runs of
               demo_critter_orbit_cardinal.txt). */
            extraout_r1_00 = (short)(uVar6 % 3);
            iVar10 = (int)DAT_00101454;
            extraout_r1 = (short)(uVar7 % 3);
            spawn_effect_debris_burst(param_1,(int)DAT_0010144c + (int)extraout_r1_00 + -1,
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
  /* Off-map landing tile (a projectile carried past the map edge --
     sync_object_tile_position already skipped its own unlink/insert on
     the same NULL). There is no tile list to settle into, so destroy
     the object outright: freeing it also removes it from the active
     mobile list, which is what returning 0 promises tick_mobile_objects. */
  if (pbTile == (char *)0x0) {
    discard_misplaced_object((char *)0x0,param_1,1);
    return (ushort *)0x0;
  }
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
      scheduler_relink_entry(puVar9,param_1);
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
     (iVar10 = activate_area_hazard_object(puVar9,(int)DAT_0010144c,(int)DAT_00101454,local_2c), iVar10 == 0)) {
    puVar9 = (ushort *)discard_misplaced_object(pbTile,puVar9,0);
  }
  return puVar9;
}






// was FUN_0007931c -- empties a dead creature's inventory into the
// world, capping the number of items dropped via a per-monster-class
// value (DAT_001007d9, indexed by the creature's type, 0x30-byte
// stride -- see g_monster_max_stats_table's own comment for this
// same table). Confirmed real caller: src/ai.c's death handling.
void drop_creature_inventory_on_death(param_1)
byte * param_1;

{
  empty_container_into_world(param_1,(&DAT_001007d9)[(*param_1 & 0x3f) * 0x30]);
  return;
}





// was FUN_00079350 -- rolls a chance (based on g_despawn_creature_
// record's own drop-rate byte, offset +0x26, high nibble) to spawn a
// treasure item on a dying/despawning creature: on a hit, derives an
// item-type tier from the current dungeon level (DAT_00201b68) via a
// lookup table (DAT_002034b5), rolls a quantity (Ordinal_2005/
// roll_dice_sum), and if positive spawns a new object (type
// tier+0xa0) with that quantity encoded into its quality field,
// linking it into param_1's object chain. No callers found by grep
// in the remaining decompile.
void spawn_creature_treasure_drop(param_1)
char *param_1;  /* was `int` -- truncated the real object pointer spawn_creature_death_loot
                   passes in (on this 64-bit build), corrupting the address
                   handed to object_list_insert_head(param_1 + 6, ...) below */

{
  int uw_ord2005_rem_159 = 0;
  int iVar1;
  uint uVar2;
  byte bVar3;
  char cVar4;
  char cVar5;
  short sVar6;
  undefined4 uVar7;
  char extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  int iVar8;
  char *pObj;  /* was reuse of `iVar8` (int) -- truncated
                  spawn_new_object's real pointer */

  bVar3 = *(byte *)(g_despawn_creature_record + 0x26);
  uVar7 = Ordinal_1053();
  uw_ord2005_rem_159 = ((int)(uVar7)) % (0x10);
  if (uw_ord2005_rem_159 < (int)(uint)(bVar3 >> 4)) {
    uVar7 = Ordinal_1053();
    sVar6 = DAT_00201b68;
    Ordinal_2005(DAT_00201b68 * -3 + 0x28,uVar7);
    iVar8 = ((char)sVar6 + -0xb) * 3 + (int)extraout_r1;
    cVar4 = (char)iVar8;
    if (iVar8 * 0x1000000 >> 0x18 < 0) {
      cVar4 = '\0';
    }
    cVar5 = (&DAT_002034b5)[cVar4 * 0xd];
    if (cVar5 == '\0') {
      cVar5 = '\x01';
    }
    if (cVar5 < '\f') {
      if (cVar5 < '\b') {
        if ('\x03' < cVar5) {
          cVar5 = (cVar5 + -2) * '\x02';
        }
      }
      else {
        cVar5 = (cVar5 + -5) * '\x04';
      }
    }
    else {
      cVar5 = cVar5 * '\b' + -0x44;
    }
    iVar8 = (bVar3 & 0xf) * 4;
    iVar1 = (int)cVar5;
    if (iVar8 < iVar1) {
      uVar7 = Ordinal_1053();
      Ordinal_2005(iVar1,uVar7);
      if (iVar8 <= extraout_r1_01) {
        return;
      }
      cVar5 = '\x01';
    }
    else {
      cVar5 = Ordinal_2005(iVar1,iVar8);
      sVar6 = roll_dice_sum(4,((int)cVar5 << 0x19) >> 0x18);
      cVar5 = (char)(sVar6 >> 2);
    }
    uVar2 = (uint)cVar5;
    if (0 < (int)uVar2) {
      pObj = (char *)spawn_new_object((short)cVar4 + 0xa0,0);
      *(byte *)(pObj + 6) = *(byte *)(pObj + 6) & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
      *(char *)(pObj + 7) = (char)((uVar2 << 0x16) >> 0x18);
      object_list_insert_head(param_1 + 6,pObj);
    }
  }
  return;
}





// was FUN_0007955c -- second creature-death drop roll: chance from
// g_despawn_creature_record's offset +0x27 low nibble; on a hit,
// spawns a single fixed-type item (high nibble + 0xb0) and links it
// into param_1's object chain. Simpler sibling of
// spawn_creature_treasure_drop (no quantity computation, just a
// single item spawn). No callers found by grep in the remaining
// decompile.
void spawn_creature_special_item_drop(param_1)
char *param_1;  /* was `int` -- same pointer-truncation bug as spawn_creature_treasure_drop */

{
  int uw_ord2005_rem_160 = 0;
  byte bVar1;
  undefined4 uVar2;
  int extraout_r1;
  char *pObj;  /* was reuse of `uVar2` (undefined4) -- truncated
                  spawn_new_object's real pointer */

  bVar1 = *(byte *)(g_despawn_creature_record + 0x27);
  uVar2 = Ordinal_1053();
  uw_ord2005_rem_160 = ((int)(uVar2)) % (0x10);
  if (uw_ord2005_rem_160 < (int)(bVar1 & 0xf)) {
    pObj = (char *)spawn_new_object((bVar1 >> 4) + 0xb0,0);
    object_list_insert_head(param_1 + 6,pObj);
  }
  return;
}



// was FUN_000795cc -- third creature-death drop roll: iterates 2
// equipment-slot flag bytes (g_despawn_creature_record offsets
// +0x20/+0x21), and for each with bit 0 set, spawns an item (type
// from bits 1-4 + subtype bits 5-6) and rolls its quality either
// level-scaled (50% chance) or fully random 0-63 (the other 50%).
// For weapon-class items (type class 0x30==0x10) whose comobj.dat
// record marks them as enchantable (DAT_002027d2 entry == -0x40),
// also rolls a random enchantment/charge bonus. Links each spawned
// item into param_1's object chain. No callers found by grep in the
// remaining decompile.
void spawn_creature_equipment_drop(param_1)
char *param_1;  /* was `int` -- same pointer-truncation bug as spawn_creature_treasure_drop */

{
  int uw_ord2005_rem_161 = 0; int uw_ord2005_rem_162 = 0; int uw_ord2005_rem_163 = 0;
  undefined2 uVar1;
  byte bVar2;
  short sVar3;
  byte *pbVar4;
  undefined4 uVar5;
  char extraout_r1;
  byte bVar6;
  byte extraout_r1_00;
  int extraout_r1_01;
  uint extraout_r1_02;
  uint uVar7;
  uint uVar8;
  
  uVar8 = 0;
  do {
    bVar6 = *(byte *)(uVar8 + g_despawn_creature_record + 0x20);
    if ((bVar6 & 1) != 0) {
      pbVar4 = (byte *)spawn_new_object((bVar6 >> 1 & 0xf) + (bVar6 >> 5 & 3) * '\x10',0);
      uVar5 = Ordinal_1053();
      uw_ord2005_rem_161 = ((int)(uVar5)) % (2);
      if (uw_ord2005_rem_161 == 0) {
        uVar5 = Ordinal_1053();
        sVar3 = DAT_00201b68;
        Ordinal_2005((int)DAT_00201b68 << 2,uVar5);
        bVar6 = extraout_r1 + (char)sVar3 * '\x04';
      }
      else {
        uVar5 = Ordinal_1053();
        uw_ord2005_rem_162 = ((int)(uVar5)) % (0x40);
        bVar6 = uw_ord2005_rem_162;
      }
      uVar1 = *(undefined2 *)(pbVar4 + 4);
      bVar2 = (byte)uVar1;
      pbVar4[4] = (bVar2 ^ bVar6) & 0x3f ^ bVar2;
      pbVar4[5] = (byte)((ushort)uVar1 >> 8);
      if ((*pbVar4 & 0x30) == 0x10) {
        if ((&DAT_002027d2)[(*pbVar4 & 0xf) * 3] == -0x40) {
          uVar5 = Ordinal_1053();
          uw_ord2005_rem_163 = ((int)(uVar5)) % (8);
          uVar7 = (uw_ord2005_rem_163 & 0xffff) + 4;
          pbVar4[6] = pbVar4[6] & 0x3f ^ (char)uVar7 * '@';
          pbVar4[7] = (byte)(uVar7 >> 2);
        }
      }
      object_list_insert_head(param_1 + 6,pbVar4);
    }
    uVar8 = uVar8 + 1 & 0xff;
  } while (uVar8 < 2);
  return;
}





// was FUN_00079784 -- fourth creature-death drop roll: iterates 2
// item slots (g_despawn_creature_record offsets +0x22/+0x24, each a
// packed ushort: item id in the high 12 bits, drop-chance nibble in
// the low 4), rolling a d16 chance per slot; on a hit, spawns the
// item and rolls its quality (level-scaled 50% of the time, fully
// random 0-63 the rest) -- same quality-roll shape as
// spawn_creature_equipment_drop but without its enchantment-bonus
// step. No callers found by grep in the remaining decompile.
void spawn_creature_misc_item_drop(param_1)
char *param_1;  /* was `int` -- same pointer-truncation bug as spawn_creature_treasure_drop */

{
  int uw_ord2005_rem_164 = 0; int uw_ord2005_rem_165 = 0; int uw_ord2005_rem_166 = 0;
  ushort uVar1;
  undefined2 uVar2;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  char *iVar6;  /* was `int` -- truncated spawn_new_object's real pointer */
  char extraout_r1;
  byte bVar7;
  byte extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint uVar8;

  uVar8 = 0;
  do {
    uVar5 = Ordinal_1053();
    uVar1 = *(ushort *)(g_despawn_creature_record + uVar8 * 2 + 0x22);
    uw_ord2005_rem_164 = ((int)(uVar5)) % (0x10);
    if (uw_ord2005_rem_164 < (int)(uVar1 & 0xf)) {
      iVar6 = (char *)spawn_new_object(uVar1 >> 4,0);
      uVar5 = Ordinal_1053();
      uw_ord2005_rem_165 = ((int)(uVar5)) % (2);
      if (uw_ord2005_rem_165 == 0) {
        uVar5 = Ordinal_1053();
        sVar4 = DAT_00201b68;
        Ordinal_2005((int)DAT_00201b68 << 2,uVar5);
        bVar7 = extraout_r1 + (char)sVar4 * '\x04';
      }
      else {
        uVar5 = Ordinal_1053();
        uw_ord2005_rem_166 = ((int)(uVar5)) % (0x40);
        bVar7 = uw_ord2005_rem_166;
      }
      uVar2 = *(undefined2 *)(iVar6 + 4);
      bVar3 = (byte)uVar2;
      *(byte *)(iVar6 + 4) = (bVar3 ^ bVar7) & 0x3f ^ bVar3;
      *(char *)(iVar6 + 5) = (char)((ushort)uVar2 >> 8);
      object_list_insert_head(param_1 + 6,iVar6);
    }
    uVar8 = uVar8 + 1 & 0xff;
  } while (uVar8 < 2);
  return;
}





// was FUN_000798c4 -- the creature death-loot orchestrator, gated on
// a "already dropped" flag (param_1[7] bit 0x10, set at the end):
// points g_despawn_creature_record at this creature's own per-class
// record in the same table as g_monster_max_stats_table (DAT_001007d0
// -- note this is 4 bytes BEFORE DAT_001007d4, g_monster_max_stats_
// table's own documented base; both are used as this table's "start"
// at different call sites throughout this file, e.g. the 0xc00-byte
// bulk file-load at uw.c's resource-load code reads into
// &DAT_001007d0 directly -- worth resolving which base is truly
// authoritative in a future struct-recovery pass, not done here),
// then calls all 4 drop-roll functions in sequence
// (spawn_creature_treasure_drop/special_item/equipment/misc_item)
// and marks the flag so this never re-fires for the same object.
// Confirmed real callers in src/ai.c and src/babl.c.
void spawn_creature_death_loot(param_1)
ushort * param_1;

{
  undefined2 uVar1;

  if ((param_1[7] & 0x10) == 0) {
    g_despawn_creature_record = &DAT_001007d0 +
                   (((int)(short)*param_1 & 0xfU) + (short)((*param_1 & 0x30) >> 4) * 0x10) * 0x30;
    spawn_creature_treasure_drop(param_1);
    spawn_creature_special_item_drop(param_1);
    spawn_creature_equipment_drop(param_1);
    spawn_creature_misc_item_drop(param_1);
    uVar1 = *(undefined2 *)((char *)param_1 + 0xd);
    *(char *)((char *)param_1 + 0xd) = (char)uVar1;
    *(byte *)(param_1 + 7) = (byte)((ushort)uVar1 >> 8) | 0x10;
  }
  return;
}


// was FUN_000816e0 -- morphs a trap/hazard object (class id 0x14 or
// 0x15) into its "active" counterpart (0x1c2 or 0x1c5 respectively --
// 0x1c2 is the same spell-effect id cast_area_spell_effect spawns),
// schedules it (type 4, delay 0), applies area damage to the tile,
// and, for the 0x14->0x1c2 case specifically, also spawns a debris
// burst. Returns 0 (and does nothing) if the object's id doesn't
// match either trap class, or if scheduling fails. Confirmed live
// caller: settle_mobile_to_immobile (src/ai.c) triggers this for a
// specific dying-creature item class, discarding the item outright if
// activation fails -- reads as "an explosive/hazard creature item
// detonating on death", though the exact game mechanic beyond the
// object-id morph isn't independently confirmed.
undefined4 activate_area_hazard_object(param_1,param_2,param_3,param_4)
ushort * param_1;
uint param_2;
undefined4 param_3;
undefined4 param_4;

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  undefined4 uVar4;
  uint uVar5;
  uint uVar6;
  ushort local_24 [4];
  
  local_24[0] = 0x14;
  local_24[1] = 0x15;
  local_24[2] = 0x1c2;
  local_24[3] = 0x1c5;
  uVar2 = *param_1;
  uVar6 = 0;
  do {
    if ((int)(short)local_24[uVar6] == (uVar2 & 0x1ff)) break;
    uVar6 = (int)((uVar6 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar6 < 2);
  iVar1 = (int)(short)uVar6;
  if (iVar1 < 2) {
    uVar5 = (local_24[iVar1 + 2] ^ uVar2) & 0x1ff ^ (uint)uVar2;
    *(char *)param_1 = (char)uVar5;
    *(char *)((char *)param_1 + 1) = (char)(uVar5 >> 8);
    uVar4 = encode_object_slot_index(param_1);
    sVar3 = scheduler_add_entry(uVar4,4,0,param_2 & 0xff,(char)param_3);
    if (sVar3 != -1) {
      if (iVar1 == 0) {
        spawn_effect_debris_burst(param_1,param_2,param_3);
      }
      damage_all_objects_at_tile(param_2,param_3,(uVar6 & 0xff) + 1,param_4);
      return 1;
    }
  }
  return 0;
}





// was FUN_0002b258 -- drops a dead monster's loot: if param_2 (a
// gold-category nibble from the monster's own template data) is
// nonzero, spawns a gold-pile object (0xd8+category) at the corpse's
// own tile; if param_3 (a treasure-category nibble) is nonzero, rolls
// a 7-in-16 chance to spawn a treasure item (0xc0+category) and drop
// it near the corpse. Called from the monster death path (src/ai.c)
// with param_1 the monster object and both category nibbles read from
// its own stat template.
void drop_monster_loot(param_1,param_2,param_3)
byte * param_1;
ushort param_2;
ushort param_3;

{
  int uw_ord2005_rem_12 = 0;
  byte bVar1;
  byte bVar2;
  undefined2 uVar3;
  char *iVar4;  /* was `int` -- truncated tilemap_lookup's real `void *`
                    return (crash: object_list_insert_head(iVar4 + 2, ...)
                    below dereferences the truncated address) */
  uint uVar6;
  undefined4 uVar7;
  int extraout_r1;
  char *pDropObj;  /* was `int iVar5`/reused `int iVar4` -- truncated
                       spawn_new_object's real object pointer in both of
                       this function's drop branches */

  iVar4 = (char *)tilemap_lookup(*(ushort *)(param_1 + 0x16) >> 10,(*(ushort *)(param_1 + 0x16) & 0x3f0) >> 4)
  ;
  if (((param_2 & 0xff) != 0) &&
     (pDropObj = (char *)spawn_new_object((short)(param_2 & 0xff) + 0xd8,0), pDropObj != NULL)) {
    uVar6 = (*(ushort *)(pDropObj + 2) ^ *(ushort *)(param_1 + 2)) & 0x1fff ^
            (uint)*(ushort *)(param_1 + 2);
    bVar1 = (byte)uVar6;
    *(byte *)(pDropObj + 2) = bVar1;
    bVar2 = (byte)(uVar6 >> 8);
    *(byte *)(pDropObj + 3) = bVar2;
    bVar2 = (param_1[3] ^ bVar2) & 0x1c ^ bVar2;
    *(byte *)(pDropObj + 2) = bVar1;
    *(byte *)(pDropObj + 3) = bVar2;
    *(byte *)(pDropObj + 2) = (param_1[2] ^ bVar1) & 0x7f ^ bVar1;
    *(byte *)(pDropObj + 3) = bVar2;
    uVar6 = CONCAT11(*(undefined1 *)(pDropObj + 5),*(undefined1 *)(pDropObj + 4)) & 0xffe8;
    *(byte *)(pDropObj + 4) = (byte)uVar6 | 0x28;
    *(char *)(pDropObj + 5) = (char)(uVar6 >> 8);
    object_list_insert_head(iVar4 + 2,pDropObj);
    settle_dropped_object(pDropObj,(int)DAT_0010144c,(int)DAT_00101454,1);
  }
  if ((param_3 & 0xff) != 0) {
    uVar7 = Ordinal_1053();
    uw_ord2005_rem_12 = ((int)(uVar7)) % (0x10);
    if ((uw_ord2005_rem_12 < 7) &&
       (pDropObj = (char *)spawn_new_object((short)(param_3 & 0xff) + 0xc0,0), pDropObj != NULL)) {
      uVar3 = *(undefined2 *)(pDropObj + 6);
      bVar1 = (byte)uVar3;
      *(byte *)(pDropObj + 6) = (*param_1 ^ bVar1) & 0x3f ^ bVar1;
      *(char *)(pDropObj + 7) = (char)((ushort)uVar3 >> 8);
      drop_object_near_target(param_1,pDropObj,4,0);
    }
  }
  return;
}


// was FUN_0002d110 -- reconstructs an NPC's walk path from
// creature_find_path_to_tile's BFS parent-pointer scratch arrays
// (&DAT_0023cf08-family), walking backward from the found tile
// (param_1 ring count, param_2/param_3 its coordinates) and filling the
// step arrays (DAT_00101739-746) the NPC's own movement code then
// walks forward through.
void reconstruct_path_from_bfs(param_1,param_2,param_3)
byte param_1;
undefined1 param_2;
undefined1 param_3;

{
  int iVar1;
  uint uVar2;
  int iVar3;
  
  DAT_0010142c = param_1 + 1;
  (&DAT_00101740)[(param_1 + 1) * 7] = param_2;
  (&DAT_00101748)[(uint)param_1 * 7] = param_3;
  DAT_00101743 = 0;
  DAT_00101744 = 0;
  DAT_00101746 = 0;
  for (uVar2 = (uint)(byte)(param_1 + 1); uVar2 != 0; uVar2 = uVar2 + 0xff & 0xff) {
    iVar1 = uVar2 * 7;
    iVar3 = ((uint)(byte)(&DAT_00101741)[iVar1] + (uint)(byte)(&DAT_00101740)[iVar1] * 0x40) * 5;
    (&DAT_00101739)[iVar1] = (&DAT_0023cf08)[iVar3];
    (&DAT_0010173a)[iVar1] = (&DAT_0023cf09)[iVar3];
    (&DAT_00101743)[iVar1] = (&DAT_0023cf0b)[iVar3] & 1;
    *(undefined1 *)((intptr_t)&DAT_00101744 + iVar1) = 0;
    *(undefined1 *)((intptr_t)&DAT_00101744 + iVar1 + 1) = 0;
    (&DAT_00101746)[iVar1] = 0;
  }
  return;
}



// was FUN_0002d1e0 -- attempts a direct straight-line walk from tile
// (param_1,param_2) toward tile (param_3,param_4): sets up a
// Bresenham-style line-walk state (DAT_00101740/etc), stepping through
// can_step_between_tiles-checked tiles via record_line_walk_step. Returns 1 if
// a clear direct line exists (the NPC's simple, preferred pathing
// strategy, tried before falling back to creature_find_path_to_tile's
// slower BFS search), -1 if blocked/no line possible.
int try_direct_line_walk(param_1,param_2,param_3,param_4)
byte param_1;
byte param_2;
short param_3;
short param_4;

{
  int iVar1;
  char cVar2;
  short sVar3;
  byte *pbVar4;
  int iVar5;
  char cVar6;
  int iVar7;
  uint uVar8;
  byte *pbVar9;
  uint uVar10;
  byte *pbVar11;
  byte local_34;
  byte local_33;
  char local_32;
  byte local_31;
  undefined1 auStack_30 [4];
  uint local_2c;
  uint local_28;
  
  local_2c = (uint)param_3;
  local_31 = 0x40;
  local_28 = (uint)param_4;
  iVar7 = (int)(char)param_4 - (int)(char)param_2;
  local_34 = param_2;
  local_33 = param_1;
  /* Dropped both arguments -- was `tilemap_lookup()`. param_1/param_2 are
     this line-walk's starting tile (just stashed into local_33/local_34
     above, and into DAT_00101740/DAT_00101741 a few lines below as the
     walk's "current position" state), matching *pbVar4's own use right
     after (>> 4 = floor_height, presumably seeding a step-climb check
     for the walk that follows). Confirmed as a live crash: called with
     no args, tilemap_lookup ran on whatever garbage happened to be in
     its parameter registers, occasionally returning NULL/a wild pointer
     that *pbVar4 then dereferenced unchecked -- a real SIGSEGV in
     npc_walk_toward_tile's call chain (demo_automap.txt). */
  pbVar4 = (byte *)tilemap_lookup(param_1,param_2);
  if (pbVar4 == 0) {
    DAT_00101450 = 0;
    return -1;
  }
  iVar5 = ((int)(char)param_3 - (int)(char)param_1) * 0x1000000;
  iVar1 = iVar5 >> 0x18;
  if (iVar1 == 0) {
    iVar5 = iVar7 * 0x1000000;
  }
  DAT_00101450 = 0;
  if (iVar1 == 0 && iVar5 >> 0x18 == 0) {
    DAT_00101450 = 0;
    return -1;
  }
  iVar5 = iVar7 * 0x1000000 >> 0x18;
  if (iVar1 < iVar5) {
    if (iVar1 < -iVar5) {
      pbVar9 = &local_33;
      pbVar11 = &local_34;
      cVar2 = Ordinal_2005(iVar1,iVar5 << 7);
      goto LAB_0002d330;
    }
    pbVar9 = &local_34;
    pbVar11 = &local_33;
    cVar2 = Ordinal_2005(iVar5,iVar1 << 7);
  }
  else {
    if (iVar1 < -iVar5) {
      pbVar9 = &local_34;
      pbVar11 = &local_33;
      cVar2 = Ordinal_2005(iVar5,iVar1 << 7);
      iVar5 = iVar1;
LAB_0002d330:
      local_32 = -1;
      cVar6 = -1;
      if (0 < iVar5) {
        local_32 = '\x01';
      }
      goto LAB_0002d340;
    }
    pbVar9 = &local_33;
    pbVar11 = &local_34;
    cVar2 = Ordinal_2005(iVar1,iVar5 << 7);
    iVar1 = iVar5;
  }
  cVar6 = '\x01';
  local_32 = '\x01';
  if (iVar1 < 1) {
    local_32 = -1;
  }
LAB_0002d340:
  DAT_0010142c = 1;
  DAT_00101742 = *pbVar4 >> 4;
  *pbVar9 = *pbVar9 + cVar6;
  uVar10 = (uint)local_34;
  uVar8 = (uint)local_33;
  DAT_00101740 = param_1;
  DAT_00101741 = param_2;
  iVar5 = record_line_walk_step(uVar8,uVar10);
  while( true ) {
    if (iVar5 == 0) {
      return 0;
    }
    local_31 = cVar2 + local_31;
    if ((local_31 & 0x80) != 0) {
      local_31 = local_31 & 0x7f;
      *pbVar11 = local_32 + *pbVar11;
      uVar10 = (uint)local_34;
      uVar8 = (uint)local_33;
      iVar5 = record_line_walk_step(uVar8,uVar10);
      if (iVar5 == 0) {
        return 0;
      }
    }
    if ((uVar8 == local_2c) && (uVar10 == local_28)) break;
    *pbVar9 = cVar6 + *pbVar9;
    uVar10 = (uint)local_34;
    uVar8 = (uint)local_33;
    iVar5 = record_line_walk_step(uVar8,uVar10);
  }
  iVar5 = (uint)DAT_0010142c * 7;
  sVar3 = tile_pair_los_blocked((&DAT_00101732)[iVar5],(&DAT_00101733)[iVar5],(&DAT_00101739)[iVar5],
                       (&DAT_0010173a)[iVar5],0,0,*(undefined2 *)(DAT_00101438 + 4),
                       *(undefined2 *)(DAT_00101438 + 6),*(undefined1 *)((intptr_t)&DAT_00101734 + iVar5)
                       ,(intptr_t)&DAT_00101734 + iVar5,auStack_30);
  return (int)sVar3;
}


// was FUN_0002d4e8 -- checks line-of-sight between two fine-grained
// (sub-tile) positions, walking a Bresenham-style line and testing
// each crossed tile boundary via can_step_between_tiles, similar to
// try_direct_line_walk but operating on precise coordinates (>>3 for
// tile conversion) rather than whole tiles. Used by NPC combat AI to
// decide whether a spell/ranged attack has a clear line to its target.
// Contains 2 confirmed dropped-argument fixes (Ordinal_2005 calls
// reconstructed from their own sibling branches, see their own
// comments).
undefined4 check_fine_line_of_sight(param_1,param_2,param_3,param_4,param_5,param_6)
uint param_1;
uint param_2;
uint param_3;
short param_4;
short param_5;
short param_6;

{
  short sVar1;
  int iVar2;
  int iVar3;
  byte bVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  ushort uVar11;
  ushort uVar12;
  ushort uVar13;
  ushort uVar14;
  byte local_3c;
  byte local_3b;
  char local_3a;
  char local_39;
  char local_38;
  byte local_37;
  byte local_36;
  byte local_35;
  byte local_34;
  byte local_33;
  short local_32;
  byte *local_30;
  byte *local_2c;
  int local_28;
  
  uVar9 = (uint)(short)param_1;
  iVar7 = ((int)param_4 - uVar9) * 0x10000;
  iVar3 = iVar7 >> 0x10;
  uVar10 = (uint)(short)param_2;
  iVar2 = ((int)param_5 - uVar10) * 0x10000;
  local_28 = (int)(short)param_3;
  local_32 = (short)((uint)((param_6 - local_28) * 0x10000) >> 0x10);
  local_34 = (byte)(param_4 >> 3);
  uVar13 = (short)param_1 >> 3;
  uVar14 = uVar13 & 0xff;
  local_3b = (byte)uVar13;
  iVar8 = (int)param_5 >> 3;
  local_33 = (byte)iVar8;
  uVar13 = (short)param_2 >> 3;
  if (iVar3 == 0) {
    iVar8 = (iVar2 >> 0x10) << 0x10;
  }
  uVar12 = uVar13 & 0xff;
  local_3c = (byte)uVar13;
  if (iVar3 == 0 && iVar8 >> 0x10 == 0) {
    return 1;
  }
  sVar1 = (short)((uint)iVar2 >> 0x10);
  iVar2 = (int)sVar1;
  iVar8 = -iVar2;
  local_37 = local_3b;
  local_36 = local_3c;
  if (iVar3 < iVar2) {
    if (iVar3 < iVar8) {
      local_2c = &local_3b;
      local_3a = -1;
      local_38 = (char)(-iVar3 >> 3);
      local_39 = -1;
      local_30 = &local_3c;
      if (0 < iVar2) {
        local_3a = '\x01';
      }
      if (local_3a == '\x01') {
        /* Was a dropped register-forwarding argument -- was
           `Ordinal_2005();` with no args. Reconstructed as this exact
           branch's own sibling call (the `else` just below,
           `Ordinal_2005(iVar3,iVar2 << 7)`) wrapped in the negation
           this code already applies afterward (`uVar5 = -iVar7`) --
           mathematically the same sign-flip trick the other two
           if/else pairs in this function apply via a `* -0x80`
           operand instead of a post-call negation. */
        iVar7 = Ordinal_2005(iVar3,iVar2 << 7);
        uVar5 = -iVar7;
        uVar9 = uVar9 & 7;
        goto LAB_0002d808;
      }
      uVar5 = Ordinal_2005(iVar3,iVar2 << 7);
      uVar9 = uVar9 & 7;
LAB_0002d824:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar9 * uVar5;
      param_1 = param_2;
    }
    else {
      local_2c = &local_3c;
      local_38 = (char)(sVar1 >> 3);
      local_30 = &local_3b;
      local_3a = '\x01';
      local_39 = '\x01';
      if (iVar3 < 1) {
        local_3a = -1;
      }
      if (local_3a != '\x01') {
        uVar5 = Ordinal_2005(iVar2,iVar3 * -0x80);
        uVar10 = 7 - (uVar10 & 7);
        goto LAB_0002d6c0;
      }
      uVar5 = Ordinal_2005(iVar2,iVar3 << 7);
      uVar10 = 7 - (uVar10 & 7);
LAB_0002d768:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar10 * uVar5;
    }
    if (iVar7 < 0) {
      iVar7 = iVar7 + 7;
    }
    uVar9 = (iVar7 >> 3 & 0xffU) + (param_1 & 7) * 0x10;
  }
  else {
    if (iVar3 < iVar8) {
      local_2c = &local_3c;
      local_3a = -1;
      local_38 = (char)(iVar8 >> 3);
      local_39 = -1;
      local_30 = &local_3b;
      if (0 < iVar3) {
        local_3a = '\x01';
      }
      if (local_3a != '\x01') {
        uVar5 = Ordinal_2005(iVar2,iVar3 << 7);
        uVar10 = uVar10 & 7;
        goto LAB_0002d768;
      }
      /* Was a dropped register-forwarding argument -- same class as
         this function's own earlier fix (uw.c ~8942): reconstructed
         as this branch's own sibling call above
         (`Ordinal_2005(iVar2,iVar3 << 7)`) wrapped in the negation
         this code already applies afterward. */
      iVar7 = Ordinal_2005(iVar2,iVar3 << 7);
      uVar5 = -iVar7;
      uVar10 = uVar10 & 7;
LAB_0002d6c0:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar10 * uVar5;
    }
    else {
      local_38 = (char)(short)(iVar7 >> 0x13);
      local_30 = &local_3c;
      local_39 = '\x01';
      local_3a = '\x01';
      if (iVar2 < 1) {
        local_3a = -1;
      }
      local_2c = &local_3b;
      if (local_3a == '\x01') {
        uVar5 = Ordinal_2005(iVar3,iVar2 << 7);
        uVar9 = 7 - (uVar9 & 7);
        goto LAB_0002d824;
      }
      uVar5 = Ordinal_2005(iVar3,iVar2 * -0x80);
      uVar9 = 7 - (uVar9 & 7);
LAB_0002d808:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar9 * uVar5;
      param_1 = param_2;
    }
    if (iVar7 < 0) {
      iVar7 = iVar7 + 7;
    }
    uVar9 = (iVar7 >> 3 & 0xffU) + (param_1 & 7) * -0x10 + 0x70;
  }
  param_3 = param_3 & 0xff;
  local_35 = 0;
  while( true ) {
    bVar4 = local_36;
    uVar13 = uVar14;
    uVar11 = uVar12;
    if ((uVar9 & 0x80) != 0) {
      uVar9 = uVar9 & 0x7f;
      *local_30 = local_3a + *local_30;
      uVar11 = (ushort)local_3c;
      uVar13 = (ushort)local_3b;
      iVar7 = can_step_between_tiles(local_37,bVar4,uVar14,uVar12,local_3b,local_3c,(char)param_3);
      if (iVar7 == 0) {
        return 0;
      }
      if ((uVar13 == local_34) && (uVar11 == local_33)) {
        uVar6 = can_step_between_tiles(uVar14,uVar12,uVar13,uVar11,0,0,(char)param_3);
        return uVar6;
      }
      local_37 = (byte)uVar14;
      local_36 = (byte)uVar12;
    }
    *local_2c = local_39 + *local_2c;
    local_35 = local_35 + 1;
    if (10 < local_35) {
      return 0;
    }
    if (local_38 != '\0') {
      iVar7 = Ordinal_2005(local_38,(int)local_32 * (uint)local_35);
      param_3 = local_28 + iVar7 & 0xff;
    }
    uVar12 = (ushort)local_3c;
    uVar14 = (ushort)local_3b;
    iVar7 = can_step_between_tiles(local_37,local_36,uVar13,uVar11,local_3b,local_3c,(char)param_3);
    if (iVar7 == 0) break;
    if ((uVar14 == local_34) && (uVar12 == local_33)) {
      uVar6 = can_step_between_tiles(uVar13,uVar11,uVar14,uVar12,0,0,(char)param_3);
      return uVar6;
    }
    local_37 = (byte)uVar13;
    local_36 = (byte)uVar11;
    uVar9 = uVar5 + uVar9;
  }
  return 0;
}


// was FUN_0002d9f4 -- records the next waypoint (param_1,param_2) into
// try_direct_line_walk's own step-array state (DAT_00101740/41), then
// validates line-of-sight for that step via tile_pair_los_blocked
// (a special-cased 2-step check when this is only the walk's 2nd
// waypoint, else the general per-step form). Returns 1 if the line is
// now blocked (DAT_00101450 stays 0, matching try_direct_line_walk's
// own success/failure convention).
undefined4 record_line_walk_step(param_1,param_2)
undefined1 param_1;
undefined1 param_2;

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  undefined1 auStack_14 [4];
  
  DAT_00101450 = 0;
  iVar2 = (uint)DAT_0010142c * 7;
  (&DAT_00101740)[iVar2] = param_1;
  (&DAT_00101741)[iVar2] = param_2;
  uVar3 = DAT_0010142c + 1;
  uVar1 = uVar3 & 0xff;
  DAT_0010142c = (byte)uVar3;
  if (uVar1 < 0x40) {
    if (uVar1 == 2) {
      iVar2 = tile_pair_los_blocked(0,0,DAT_00101740,DAT_00101741,DAT_00101747,DAT_00101748,
                           *(undefined2 *)(DAT_00101438 + 4),*(undefined2 *)(DAT_00101438 + 6),
                           DAT_00101742,&DAT_00101749,auStack_14);
    }
    else {
      iVar2 = uVar1 * 7;
      iVar2 = tile_pair_los_blocked(*(undefined1 *)((intptr_t)&DAT_00101728 + iVar2 + 3),
                           *(undefined1 *)((intptr_t)&DAT_0010172c + iVar2),(&DAT_00101732)[iVar2],
                           (&DAT_00101733)[iVar2],(&DAT_00101739)[iVar2],(&DAT_0010173a)[iVar2],
                           *(undefined2 *)(DAT_00101438 + 4),*(undefined2 *)(DAT_00101438 + 6),
                           *(undefined1 *)((intptr_t)&DAT_0010172c + iVar2 + 1),
                           (intptr_t)&DAT_00101734 + iVar2,auStack_14);
    }
    if ((iVar2 != 0) && (DAT_00101440 == 0)) {
      return 1;
    }
  }
  return 0;
}


// was FUN_0002db4c -- pops the lowest set bit (0-15) from
// DAT_000853b8, the pending "path cache slot needs recompute" bitmask
// (set per-NPC via `1 << (record's own byte 0xb & 0xf)` slot index),
// outputting it via *param_1. Returns 1 if a pending slot was found, 0
// if the mask is empty.
undefined4 pop_pending_path_cache_slot(param_1)
undefined1 * param_1;

{
  uint uVar1;

  if (DAT_000853b8 != 0) {
    uVar1 = 0;
    do {
      if (((uint)DAT_000853b8 & 1 << uVar1) != 0) {
        *param_1 = (char)uVar1;
        return 1;
      }
      uVar1 = uVar1 + 1 & 0xff;
    } while (uVar1 < 0x10);
  }
  return 0;
}



// was FUN_0002dba4 -- resets the NPC path-cache system: clears a
// per-record flag (byte 0x15 bit 7, likely "path cached") on every
// object slot 2-255, then resets DAT_000853b8 to 0xffff, marking all
// 16 path-cache slots pending recompute. Called on level load
// (src/level.c) and once more at uw.c ~11583.
void reset_npc_path_cache()

{
  /* Was `int`, truncating FUN_000535fc's real pointer return. */
  char *iVar1;
  int iVar2;

  iVar2 = 2;
  do {
    iVar1 = FUN_000535fc(iVar2);
    *(byte *)(iVar1 + 0x15) = *(byte *)(iVar1 + 0x15) & 0x7f;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x100);
  DAT_000853b8 = 0xffff;
  return;
}



// was FUN_0002dbf4 -- serializes the just-computed walk path
// (DAT_00101740/41 start, DAT_0010142c step count, and the per-step
// direction arrays try_direct_line_walk/record_line_walk_step filled)
// into a compact bitfield cache record at param_1: 2 bits per step
// (packed via a direction lookup table, &DAT_000853c4) plus 1 bit per
// step (&DAT_0010174a). Called right after pop_pending_path_cache_slot
// pops a slot, to save that slot's freshly-computed path for reuse.
void save_walk_path_to_cache_slot(param_1)
undefined1 * param_1;

{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  
  uVar5 = 0;
  param_1[2] = param_1[2] & 0x80;
  *param_1 = DAT_00101740;
  param_1[1] = DAT_00101741;
  param_1[3] = DAT_0010142c;
  uVar1 = 0;
  if (DAT_0010142c != 0) {
    uVar4 = 0;
    do {
      iVar3 = 0;
      uVar1 = 0;
      do {
        iVar2 = (uVar1 + uVar4) * 7;
        iVar3 = iVar3 + (((byte)(&DAT_000853c4)
                                [(((uint)(byte)(&DAT_00101747)[iVar2] -
                                  (uint)(byte)(&DAT_00101740)[iVar2]) * 3 -
                                 (uint)(byte)(&DAT_00101741)[iVar2]) +
                                 (uint)(byte)(&DAT_00101748)[iVar2]] & 3) << ((uVar1 & 0x7f) << 1));
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      param_1[(uVar4 >> 2) + 4] = (char)iVar3;
      uVar5 = uVar5 + 4;
      uVar1 = (uint)DAT_0010142c;
      uVar4 = uVar5 & 0xff;
    } while (uVar4 < uVar1);
  }
  uVar5 = 0;
  if (uVar1 != 0) {
    uVar1 = 0;
    do {
      iVar3 = 0;
      uVar4 = 0;
      do {
        iVar3 = iVar3 + (((byte)(&DAT_0010174a)[(uVar4 + uVar1) * 7] & 1) << uVar4);
        uVar4 = uVar4 + 1 & 0xff;
      } while (uVar4 < 8);
      param_1[(uVar1 >> 3) + 0x14] = (char)iVar3;
      uVar5 = uVar5 + 8;
      uVar1 = uVar5 & 0xff;
    } while (uVar1 < DAT_0010142c);
  }
  return;
}


// was FUN_0002dd4c -- advances a cached NPC walk path (the 28-byte
// per-slot record save_walk_path_to_cache_slot writes, keyed on the
// current step index at param_1[2]&0x7f vs the total step count at
// param_1[3]) by one step: applies the current step's direction delta
// (looked up from the 2-bit packed table via &DAT_000853b0/1) to the
// record's own tracked position (param_1[0]/[1]), then either advances
// the step index (if that step's 1-bit "blocked" flag, from the table
// at param_1+0x14, is clear) or sets the record's own high bit
// (param_1[2]|=0x80) marking the cached path as blocked/stale instead.
// Returns 1 if a step was available to advance, 0 if the path was
// already exhausted.
undefined4 advance_cached_path_step(param_1)
char * param_1;

{
  int uw_ord2005_rem_14 = 0; int uw_ord2005_rem_15 = 0;
  int iVar1;
  byte bVar2;
  byte bVar3;
  undefined4 uVar4;
  uint extraout_r1;
  uint extraout_r1_00;
  byte bVar5;
  
  bVar2 = param_1[2];
  bVar5 = bVar2 & 0x7f;
  if (bVar5 < (byte)param_1[3]) {
    bVar3 = param_1[(bVar2 >> 2 & 0x1f) + 4];
    uw_ord2005_rem_14 = ((int)(bVar5)) % (4);
    iVar1 = (short)(bVar3 >> ((uw_ord2005_rem_14 & 0x7f) << 1) & 3) * 2;
    *param_1 = *param_1 + (&DAT_000853b0)[iVar1];
    param_1[1] = param_1[1] + (&DAT_000853b1)[iVar1];
    bVar3 = param_1[(bVar2 >> 3 & 0xf) + 0x14];
    uw_ord2005_rem_15 = ((int)(bVar5)) % (8);
    if ((bVar3 >> (uw_ord2005_rem_15 & 0xff) & 1) == 0) {
      param_1[2] = bVar5;
    }
    else {
      param_1[2] = bVar2 | 0x80;
    }
    bVar2 = param_1[2];
    param_1[2] = (bVar2 + 1 ^ bVar2) & 0x7f ^ bVar2;
    uVar4 = 1;
  }
  else {
    uVar4 = 0;
  }
  return uVar4;
}



// was FUN_0002de40 -- checks whether an NPC's current tile position
// matches its cached path's expected position for this tick. param_1
// is the cache record's own "blocked" flag (param_1[2]>>7 at the call
// site); if clear, computes a predicted next-step position from
// param_2/3 (current x/y) toward param_6/7 (target x/y), snapping via
// the same 6-tile-threshold direction logic used elsewhere in NPC
// pathing, then compares the (possibly-updated) param_2/3 against
// param_6/7 for exact equality. If the blocked flag was set, skips the
// prediction and just compares the raw input coordinates directly.
undefined4 check_path_cache_position_match(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
int param_1;
short param_2;
short param_3;
short param_4;
short param_5;
short param_6;
short param_7;

{
  int iVar1;
  int iVar2;
  int iVar3;
  short sVar4;
  short sVar5;
  undefined4 uVar6;
  int iVar7;
  bool bVar8;
  bool bVar9;
  
  if (param_1 == 0) {
    iVar1 = (int)param_4;
    bVar9 = SBORROW4(iVar1,6);
    iVar7 = iVar1 + -6;
    bVar8 = iVar1 == 6;
    sVar5 = 0;
    if (5 < iVar1) {
      iVar2 = (int)param_2;
      iVar3 = (int)param_6;
      bVar9 = SBORROW4(iVar3,iVar2);
      iVar7 = iVar3 - iVar2;
      bVar8 = iVar3 == iVar2;
      sVar5 = param_2;
    }
    if (bVar8 || iVar7 < 0 != bVar9) {
      sVar4 = param_2;
      if ((iVar1 < 2) && (sVar5 = param_2, param_6 < param_2)) {
        sVar4 = param_2 + -1;
      }
    }
    else {
      sVar4 = sVar5 + 1;
    }
    param_2 = sVar4;
    iVar7 = (int)param_5;
    bVar9 = SBORROW4(iVar7,6);
    iVar1 = iVar7 + -6;
    bVar8 = iVar7 == 6;
    if (5 < iVar7) {
      iVar2 = (int)param_3;
      iVar3 = (int)param_7;
      bVar9 = SBORROW4(iVar3,iVar2);
      iVar1 = iVar3 - iVar2;
      bVar8 = iVar3 == iVar2;
      sVar5 = param_3;
    }
    if (bVar8 || iVar1 < 0 != bVar9) {
      if ((iVar7 < 2) && (param_7 < param_3)) {
        param_3 = param_3 + -1;
      }
    }
    else {
      param_3 = sVar5 + 1;
    }
  }
  if ((param_2 != param_6) || (uVar6 = 1, param_3 != param_7)) {
    uVar6 = 0;
  }
  return uVar6;
}


// was FUN_0002df2c -- the top-level "walk via cached path" driver:
// checks the cache slot's position match (check_path_cache_position_match)
// and advances it a step if valid (advance_cached_path_step); if the
// path isn't blocked, computes a heading toward the sub-tile-precise
// interpolated position between waypoints (via compute_movement_heading) and
// steers the NPC there, else delegates to handle_blocked_cached_path.
// Returns 0 only when the position check fails outright.
undefined4 walk_using_cached_path(param_1)
byte * param_1;

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  int iVar8;
  byte bVar4;
  
  bVar1 = *param_1;
  bVar2 = param_1[1];
  iVar5 = check_path_cache_position_match(param_1[2] >> 7,DAT_00101918,DAT_001013f8,DAT_00101910 & 7,DAT_0010141c & 7,
                       bVar1,bVar2);
  bVar3 = DAT_00101918;
  bVar4 = DAT_001013f8;
  if ((iVar5 == 0) || (iVar5 = advance_cached_path_step(param_1), bVar3 = bVar1, bVar4 = bVar2, iVar5 != 0)) {
    if ((param_1[2] & 0x80) == 0) {
      if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
        set_npc_altitude_state(*(ushort *)((char *)DAT_0010190c + 0xf) & 0x3f,
                     *(ushort *)((char *)DAT_0010190c + 0xf) >> 6 & 0x3f);
      }
      uVar7 = (uint)*param_1;
      iVar5 = uVar7 * 8;
      if (bVar3 == uVar7) {
        iVar5 = iVar5 + 4;
      }
      else if (uVar7 < bVar3) {
        iVar5 = iVar5 + 7;
      }
      uVar7 = (uint)param_1[1];
      iVar8 = uVar7 * 8;
      if (bVar4 == uVar7) {
        iVar8 = iVar8 + 4;
      }
      else if (uVar7 < bVar4) {
        iVar8 = iVar8 + 7;
      }
      uVar7 = compute_movement_heading((int)((iVar5 - (uint)DAT_00101910) * 0x1000000) >> 0x18,
                           (int)((iVar8 - (uint)DAT_0010141c) * 0x1000000) >> 0x18);
      *(char *)((char *)DAT_0010190c + 9) = (char)((uVar7 & 0xff) << 5);
      uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar7 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
    }
    else {
      handle_blocked_cached_path(param_1);
    }
    uVar6 = 1;
  }
  else {
    uVar6 = 0;
  }
  return uVar6;
}



// was FUN_0002e104 -- handles a blocked/exhausted cached path: if the
// NPC is close (<3 tiles) to the cache's own tracked endpoint, takes
// one more direction-table-driven step past it (marking DAT_00101920
// and several NPC-record state bits, likely "path needs recompute
// soon") and steers toward that; otherwise just steers directly toward
// the cache's own last tracked position. Called from
// walk_using_cached_path when advance_cached_path_step marked the path
// blocked.
void handle_blocked_cached_path(param_1)
byte * param_1;

{
  int uw_ord2005_rem_16 = 0;
  int iVar1;
  byte bVar2;
  uint extraout_r1;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  
  uVar7 = (uint)*param_1;
  iVar1 = uVar7 * 8;
  uVar3 = iVar1 - 2;
  if (DAT_00101918 == uVar7) {
    uVar3 = iVar1 + 4;
  }
  else if (uVar7 < DAT_00101918) {
    uVar3 = iVar1 + 9;
  }
  uVar6 = (uint)param_1[1];
  iVar1 = uVar6 * 8;
  uVar5 = iVar1 - 2;
  if (DAT_001013f8 == uVar6) {
    uVar5 = iVar1 + 4;
  }
  else if (uVar6 < DAT_001013f8) {
    uVar5 = iVar1 + 9;
  }
  uVar4 = (uVar3 & 0xffff) - (uint)DAT_00101910;
  uVar3 = (uVar5 & 0xffff) - (uint)DAT_0010141c;
  if ((int)(((uVar3 ^ (int)uVar3 >> 0x1f) - ((int)uVar3 >> 0x1f)) +
           ((uVar4 ^ (int)uVar4 >> 0x1f) - ((int)uVar4 >> 0x1f))) < 3) {
    bVar2 = param_1[(param_1[2] >> 2 & 0x1f) + 4];
    uw_ord2005_rem_16 = ((int)(param_1[2] & 0x7f)) % (4);
    iVar1 = (short)(bVar2 >> ((uw_ord2005_rem_16 & 0x7f) << 1) & 3) * 2;
    uVar3 = compute_movement_heading(((int)(char)(&DAT_000853b0)[iVar1] + uVar7 & 0xff) -
                         (uint)(*(ushort *)((char *)DAT_0010190c + 0x16) >> 10),
                         ((int)(char)(&DAT_000853b1)[iVar1] + uVar6 & 0xff) -
                         (*(ushort *)((char *)DAT_0010190c + 0x16) >> 4 & 0x3f));
    DAT_00101920 = 1;
    *(char *)((char *)DAT_0010190c + 9) = (char)((uVar3 & 0xff) << 5);
    uVar3 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar3 & 7) << 7;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar3;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar3 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xf9 | 1;
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 7 | 0xb0;
    *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x8b | 0xb;
  }
  else {
    uVar3 = compute_movement_heading((int)(uVar4 * 0x1000000) >> 0x18,(int)(uVar3 * 0x1000000) >> 0x18);
    *(char *)((char *)DAT_0010190c + 9) = (char)((uVar3 & 0xff) << 5);
    uVar3 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar3 & 7) << 7;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar3;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar3 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
  }
  return;
}



// was FUN_0002e3b4 -- computes an 8-way movement heading (0-7) from a
// relative (param_1,param_2) delta, used by walk_using_cached_path/
// handle_blocked_cached_path to steer an NPC's facing/movement byte 9.
// Distinct from compute_compass_direction (a different, separately
// confirmed algorithm used for a different purpose) despite both
// producing an octant-shaped 0-7 result from a delta.
undefined4 compute_movement_heading(param_1,param_2)
int param_1;
int param_2;

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  
  iVar1 = (int)(char)param_2;
  iVar2 = (param_2 << 0x19) >> 0x18;
  iVar3 = (param_1 << 0x19) >> 0x18;
  iVar4 = (int)(char)param_1;
  if (iVar3 < iVar1) {
    if (-iVar2 < iVar4) {
      uVar5 = 0;
      if (iVar1 <= -iVar3) {
        uVar5 = 7;
      }
    }
    else {
      uVar5 = 5;
      if (iVar4 <= iVar2) {
        uVar5 = 6;
      }
    }
  }
  else if (-iVar2 < iVar4) {
    uVar5 = 2;
    if (iVar4 <= iVar2) {
      uVar5 = 1;
    }
  }
  else {
    uVar5 = 3;
    if (iVar1 <= -iVar3) {
      uVar5 = 4;
    }
  }
  return uVar5;
}


// was FUN_0002ee80 -- sets a flying/levitating NPC's vertical
// movement/animation state (packed into the top bits of record byte
// 0x14): compares its current altitude (byte 2 & 0x7f) against the
// target tile (param_1,param_2)'s own ceiling-derived height, picking
// a climb/descend/random-hover animation code. Called from
// walk_using_cached_path only for monsters whose stat template sets
// the flying-locomotion flag bit (0x80).
void set_npc_altitude_state(param_1,param_2)
undefined1 param_1;
undefined1 param_2;

{
  int uw_ord2005_rem_20 = 0;
  char cVar1;
  byte *pbVar2;
  uint uVar3;
  undefined4 uVar4;
  char extraout_r1;
  uint uVar5;
  
  if (DAT_00101914 == 0) {
    pbVar2 = (byte *)tilemap_lookup(param_1,param_2);
    uVar5 = *(byte *)((char *)DAT_0010190c + 2) & 0x7f;
    uVar3 = (uint)(*pbVar2 >> 4) * 8 + 0x14;
    if (0x78 < uVar3) {
      uVar3 = 0x78;
    }
    if (((DAT_0010191c == 0) || (0x77 < uVar5)) && ((int)(uVar3 - 8) <= (int)uVar5)) {
      if ((uVar5 < 0x79) && (uVar5 <= uVar3 + 8)) {
        uVar4 = Ordinal_1053();
        uw_ord2005_rem_20 = ((int)(uVar4)) % (3);
        cVar1 = uw_ord2005_rem_20 + '\x0f';
      }
      else {
        cVar1 = '\x0e';
      }
    }
    else {
      cVar1 = '\x12';
    }
    *(byte *)((char *)DAT_0010190c + 0x14) = cVar1 << 3 | *(byte *)((char *)DAT_0010190c + 0x14) & 7;
  }
  return;
}


// was FUN_0002efa0 -- an NPC's "arrived at destination tile" reaction:
// if a "use on arrival" flag is set in its stat template (byte 0x2e),
// uses the object it arrived on; if that object is a specific
// combinable-ingredient-shaped category (0x140) with a low sub-id, and
// the arrival-flag is set, randomly either combines with it
// (check_object_combination) or (the arrival-flag clear path) has a
// 1-in-4 chance to instead damage it via FUN_00038374 (the shared
// damage/hit-visual primitive, not yet named) with a random roll
// bounded by the stat template's own byte at +0x14. Contains a
// confirmed fabricated-remainder Ordinal_2005/extraout_r1 fix (see its
// own comment).
void npc_arrival_interaction(param_1)
ushort * param_1;

{
  int uw_ord2005_rem_21 = 0; int uw_ord2005_rem_22 = 0;
  undefined4 uVar1;
  undefined1 extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  undefined1 uVar2;
  
  if ((*param_1 & 7) != 7) {
    if (*(char *)(DAT_00101404 + 0x2e) != '\0') {
      DAT_002020a0 = (ushort)DAT_00101424;
      DAT_002020a4 = (ushort)DAT_00101428;
      use_object_on_target(DAT_0010190c,param_1,0);
    }
    if (((*param_1 & 0x1f0) == 0x140) && ((*param_1 & 0xf) < 8)) {
      if (*(char *)(DAT_00101404 + 0x2e) != '\0') {
        uVar1 = Ordinal_1053();
        uw_ord2005_rem_21 = ((int)(uVar1)) % (2);
        if (uw_ord2005_rem_21 != 0) {
          check_object_combination(DAT_0010190c,param_1,
                       (int)((uint)*(byte *)(DAT_00101404 + 0x2e) * -0x10000) >> 0x10);
          return;
        }
      }
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_22 = ((int)(uVar1)) % (4);
      if (uw_ord2005_rem_22 == 0) {
        uVar1 = Ordinal_1053();
        uVar2 = 4;
        /* Was `Ordinal_2005(...); FUN_00038374(...,extraout_r1,...)` --
           same fabricated-remainder bug fixed throughout this session
           (this port's Ordinal_2005 never populates extraout_r1).
           Ordinal_2005(divisor,dividend) here divides the random roll
           (uVar1) by the stat-template byte at +0x14 (a max-damage-
           shaped value); compute that remainder -- a bounded random
           damage roll in [0,byte_val) -- directly instead. */
        uw_ord2005_rem_21 = (int)uVar1 % (int)(uint)(*(byte *)(DAT_00101404 + 0x14));
        FUN_00038374(param_1,DAT_0010190c,DAT_00101424,DAT_00101428,uw_ord2005_rem_21,uVar2);
      }
    }
  }
  return;
}


// was FUN_00030874 -- an NPC's random-walk reposition step (confirmed
// via npc_combat_approach_tick's own comment describing its "far:
// random walk reposition" branch, which calls this): if not already
// at the given wander tile (param_1,param_2), has a 1-in-8 chance to
// pick a nearby random tile via detect_npc_wander_proximity (adjusting a special-goal
// flag on a couple of outcomes) instead of walking straight there, then
// steers toward whichever tile was settled on via npc_walk_toward_tile,
// clearing the special-goal flag if that walk reports blocked.
void npc_wander_reposition(param_1,param_2,param_3,param_4)
uint param_1;
uint param_2;
uint param_3;
undefined4 param_4;

{
  int uw_ord2005_rem_57 = 0; int uw_ord2005_rem_58 = 0;
  uint uVar1;
  char cVar2;
  undefined4 uVar3;
  int extraout_r1;
  int extraout_r1_00;
  byte bVar4;
  uint local_10;
  uint local_c;
  uint uStack_8;
  undefined4 uStack_4;
  
  local_10 = param_1;
  local_c = param_2;
  uStack_8 = param_3;
  uStack_4 = param_4;
  if (((param_1 & 0xff) != (*(ushort *)((char *)DAT_0010190c + 0xf) & 0x3f)) ||
     ((param_2 & 0xff) != (*(ushort *)((char *)DAT_0010190c + 0xf) & 0xfc0) >> 6)) {
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_57 = ((int)(uVar3)) % (8);
    if (uw_ord2005_rem_57 == 0) {
      cVar2 = detect_npc_wander_proximity(&local_10,&local_c);
      if (cVar2 != '\0') {
        if (cVar2 == '\x01') {
          *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfe;
          bVar4 = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfd;
LAB_00030984:
          *(byte *)((char *)DAT_0010190c + 0x19) = bVar4;
          npc_clear_special_goal();
          return;
        }
        if (cVar2 != '\x02') goto LAB_000309a0;
        uVar3 = Ordinal_1053();
        uw_ord2005_rem_58 = ((int)(uVar3)) % (2);
        if (uw_ord2005_rem_58 == 0) {
          *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfe;
          bVar4 = *(byte *)((char *)DAT_0010190c + 0x19) | 2;
          goto LAB_00030984;
        }
      }
      npc_set_walk_target(local_10 & 0xff,local_c & 0xff,DAT_00101420);
    }
  }
LAB_000309a0:
  if (((((local_10 & 0xff) != (uint)DAT_00101918) || ((char)local_c != DAT_001013f8)) ||
      (uVar1 = (int)DAT_0010140c - (int)DAT_00101420 >> 0x1f,
      3 < (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar1) - uVar1))) &&
     ((((param_3 = param_3 & 0xff, 1 < param_3 && (param_3 * param_3 < (uint)DAT_00101900)) ||
       ((param_3 * param_3 * 0x40 < DAT_00101728 ||
        ((param_3 < 2 &&
         (uVar1 = (int)DAT_0010140c - (int)DAT_00101420 >> 0x1f,
         3 < (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar1) - uVar1))))))) &&
      /* Dropped third argument: at the real call (0x30a6c) r2 still holds
         DAT_00101420 from the `ldrb r2,[r5]` that fed the
         npc_set_walk_target call above -- pass it explicitly. */
      (npc_walk_toward_tile(local_10 & 0xff,local_c & 0xff,DAT_00101420), (*(byte *)((char *)DAT_0010190c + 0x18) & 0x40) != 0)))
     ) {
    npc_clear_special_goal();
    *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfd;
  }
  return;
}


// was FUN_00031dbc -- called unconditionally at the tail of
// npc_idle_behavior_tick: if the NPC's own "aware" state flag (byte
// 0x13) is clear or the player is currently in a special mode (byte
// 0x5f bit 1), refreshes the delta-to-player (refresh_npc_target_delta)
// and, if the player is within ~12 tiles, switches the NPC
// into a distinct alert/react state (byte 0x15=0x20, byte 0x14=6) and
// picks a heading toward the player with a randomized facing nudge.
void npc_react_to_nearby_player()

{
  int uw_ord2005_rem_82 = 0; int uw_ord2005_rem_83 = 0;
  ushort uVar1;
  char *iVar2;
  undefined4 uVar3;
  int extraout_r1;
  uint extraout_r1_00;
  uint uVar4;
  uint uVar5;
  
  if (((*(byte *)((char *)DAT_0010190c + 0x13) & 0x7f) == 0) || ((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0))
  {
    uVar5 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf01f;
    *(byte *)((char *)DAT_0010190c + 0xb) = (byte)uVar5 | 0x10;
    *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar5 >> 8);
    refresh_npc_target_delta();
    if ((ushort)(DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448) < 0x90) {
      uVar5 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xe0 | 0x20;
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfe | 6;
      uVar3 = Ordinal_1053();
      uw_ord2005_rem_82 = ((int)(uVar3)) % (2);
      if (uw_ord2005_rem_82 != 0) {
        uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
        uw_ord2005_rem_83 = ((int)((uVar1 >> 0xc) + 1)) % (4);
        uVar4 = uVar1 & 0xfff;
        *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar4;
        *(byte *)((char *)DAT_0010190c + 0xc) =
             (byte)(uVar4 >> 8) | (byte)(((uw_ord2005_rem_83 & 0xf) << 0xc) >> 8);
      }
      uVar5 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar5 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar5;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar5 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
    }
  }
  return;
}


// was FUN_00032180 -- checks the NPC's proximity to its current
// wander/goal tile against two stat-template-derived radii (byte
// 0x1e's two nibbles, each multiplied against a per-monster-class
// table entry): outputs the goal tile itself via param_1/param_2, and
// returns 0 if outside the larger radius, 1 if within the smaller
// "close" radius (also checking heading + line-of-sight to gate a
// side-effect flag), or 2 for the band between them. Called from
// npc_wander_reposition to decide whether/how to pick a fresh random
// wander tile. Contains a confirmed dropped-argument fix (see its own
// comment).
undefined4 detect_npc_wander_proximity(param_1,param_2)
char * param_1;
char * param_2;

{
  int uw_ord2005_rem_86 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  char cVar4;
  int iVar5;
  undefined4 uVar6;
  char extraout_r1;
  ushort *puVar7;
  /* Preserved separately from iVar1/iVar2 below, which get overwritten
     with the squared distance before compute_movement_heading's own
     call further down needs them -- see that dropped-argument fix. */
  int deltaX;
  int deltaY;

  *param_1 = DAT_00101408;
  *param_2 = DAT_00101410;
  iVar1 = ((int)DAT_00101408 - (int)DAT_00101918) * 0x1000000 >> 0x18;
  iVar2 = ((int)DAT_00101410 - (int)DAT_001013f8) * 0x1000000 >> 0x18;
  deltaX = iVar1;
  deltaY = iVar2;
  iVar2 = (iVar1 * iVar1 + iVar2 * iVar2) * 0x10000 >> 0x10;
  iVar1 = (int)((*(byte *)(DAT_00101404 + 0x1e) & 0xf) *
               ((byte)(&DAT_001007ed)[((byte)*DAT_00101400 & 0x3f) * 0x30] & 0xf)) >> 4;
  iVar1 = iVar1 * iVar1 * 0x10000;
  if (iVar2 < iVar1 >> 0x12) {
LAB_000323ac:
    uVar6 = 0;
  }
  else {
    iVar5 = (int)((uint)(*(byte *)(DAT_00101404 + 0x1e) >> 4) *
                 (uint)((byte)(&DAT_001007ed)[((byte)*DAT_00101400 & 0x3f) * 0x30] >> 4)) >> 4;
    puVar7 = DAT_0010190c;
    if (iVar2 <= iVar5 * iVar5 * 0x10000 >> 0x10) {
      /* Was a dropped register-forwarding argument -- was
         `compute_movement_heading();` with no args. deltaX/deltaY,
         preserved above from this function's own delta computation
         (before it got squashed into the squared-distance iVar2), are
         exactly what this call needs. */
      cVar4 = compute_movement_heading(deltaX,deltaY);
      puVar7 = DAT_0010190c;
      uVar3 = DAT_0010190c[1];
      uw_ord2005_rem_86 = ((int)(((int)cVar4 - ((int)(char)(uVar3 >> 7) & 7U)) + 8)) % (8);
      if ((((uw_ord2005_rem_86 == '\0') || (uw_ord2005_rem_86 == '\x01')) || (uw_ord2005_rem_86 == '\a')) &&
         (iVar5 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,
                               (ushort)(byte)(&DAT_00202c90)[(*puVar7 & 0x1ff) * 0xd] +
                               (uVar3 & 0x7f),DAT_00101908,DAT_00101418,
                               (ushort)(byte)(&DAT_00202c90)[(*DAT_00101400 & 0x1ff) * 0xd] +
                               ((byte)DAT_00101400[1] & 0x7f)), puVar7 = DAT_0010190c, iVar5 != 0))
      {
        *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 1;
        goto LAB_000323ac;
      }
    }
    if (iVar2 < (iVar1 >> 0x10) * 4) {
      uVar6 = 2;
    }
    else {
      uVar6 = 1;
      *(byte *)((char *)puVar7 + 0x19) = *(byte *)((char *)puVar7 + 0x19) & 0xfe;
    }
  }
  return uVar6;
}


// was FUN_0003298c -- computes a vertical aim/pitch offset toward the
// tracked target: derives it from the height difference between the
// NPC and target scaled by distance (integer_sqrt(DAT_00101728)),
// clamped to [-0xf,0xf], optionally blended with an extra
// param_1-scaled component when both param_1 and param_2 are nonzero.
// Confirmed via its real call sites (src/ai.c) feeding a ranged/thrown
// weapon launch's own pitch parameter (DAT_00202a3c) right before
// FUN_0004a510.
int compute_vertical_aim_offset(param_1,param_2)
short param_1;
int param_2;

{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  
  refresh_npc_target_delta();
  bVar1 = *(byte *)((char *)DAT_0010190c + 2);
  bVar2 = *(byte *)(DAT_00101400 + 2);
  uVar3 = integer_sqrt(DAT_00101728);
  iVar6 = (int)(((bVar2 & 0x7f) - (bVar1 & 0x7f)) * 0x10000) >> 0x10;
  if (uVar3 == 0) {
    iVar5 = 0xf;
    if (iVar6 < 1) {
      iVar5 = -0xf;
    }
    iVar5 = iVar5 << 0x18;
  }
  else {
    sVar4 = Ordinal_2005((int)(short)uVar3,iVar6 << 2);
    iVar5 = (int)sVar4;
    if (0xf < iVar5) {
      iVar5 = 0xf;
    }
    if ((short)iVar5 < -0xf) {
      iVar5 = -0xf;
    }
    if ((param_2 == 0) || (param_1 == 0)) {
      iVar5 = iVar5 << 0x18;
    }
    else {
      iVar6 = Ordinal_2005((int)param_1,(uint)uVar3 * 3);
      iVar5 = (iVar6 + (short)iVar5) * 0x1000000;
    }
  }
  return iVar5 >> 0x18;
}


// was FUN_00032aa4 -- the per-tick NPC AI setup step: stashes the
// current NPC object into DAT_0010190c and computes the whole
// derived-state fan-out virtually every other function in this NPC AI
// cluster reads -- its own stat template pointer (DAT_00101404), its
// slot-encoded id (DAT_00101738), position/delta fields
// (DAT_00101918/0x1c/0x910/etc.), and which of the collision-response
// profile buffers to use for this monster's locomotion type. Called at
// the very start of npc_ai_tick before dispatching to any goal
// handler. Fixed a confirmed dropped-argument bug (see its own
// comment).
void setup_npc_ai_tick_state(param_1)
ushort * param_1;

{
  byte bVar1;
  uint uVar2;
  int iVar3;
  
  DAT_0010190c = param_1;
  /* Was a dropped argument -- was `encode_object_slot_index();` with no
     args. param_1 (just stashed above as DAT_0010190c, the "current
     NPC" this whole per-tick setup is for) is the obvious intended
     argument. */
  DAT_00101738 = encode_object_slot_index(param_1);
  iVar3 = ((byte)*DAT_0010190c & 0x3f) * 0x30;
  DAT_00101404 = &DAT_001007d0 + iVar3;
  DAT_00101918 = *(byte *)((char *)DAT_0010190c + 0x17) >> 2;
  uVar2 = DAT_0010190c[0xb] >> 4 & 0x3f;
  DAT_001013f8 = (char)uVar2;
  DAT_0010140c = (byte)DAT_0010190c[1] >> 3 & 0xf;
  DAT_00101910 = (short)(((uint)DAT_00101918 << 0x13) >> 0x10) +
                 (ushort)(*(byte *)((char *)DAT_0010190c + 3) >> 5);
  DAT_0010141c = (*(byte *)((char *)DAT_0010190c + 3) >> 2 & 7) + (short)((uVar2 << 0x13) >> 0x10);
  DAT_0010143c = (byte)DAT_0010190c[2] & 0x3f;
  DAT_0010173c = (byte)DAT_0010190c[3] & 0x3f;
  DAT_00101458 = *(byte *)((char *)DAT_0010190c + 9);
  bVar1 = (byte)(DAT_0010190c[1] >> 2);
  DAT_001018fc = (bVar1 ^ (byte)DAT_0010190c[0xc]) & 0x1f ^ bVar1;
  DAT_00101434 = *(byte *)((char *)DAT_0010190c + 0x13) & 0x7f;
  DAT_00101730 = (&DAT_00202c90)[(*DAT_0010190c & 0x1ff) * 0xd];
  if (((&DAT_001007da)[iVar3] & 0x80) == 0) {
    if (((&DAT_001007da)[iVar3] & 0x40) == 0) {
      DAT_0010172c = &DAT_002048c0;
      DAT_00101438 = (undefined2 *)&DAT_00204980;
    }
    else {
      DAT_0010172c = (undefined2 *)&DAT_00204950;
      DAT_00101438 = &DAT_002049b0;
    }
  }
  else {
    DAT_0010172c = (undefined2 *)&DAT_002048f0;
    DAT_00101438 = &DAT_00204990;
  }
  return;
}


// was FUN_00033880 -- npc_ai_tick's `case 0xb`/default dispatch target,
// confirmed via this function's own already-documented internal
// comments: the shared per-tick tail for every "no special goal" NPC
// (idle/wander goals 0xb/3, but also the fallback landing point every
// non-special AI state shares). At its head, checks whether the NPC
// should notice/react to the player (playing an alert sound cue keyed
// off its stat template, then transitioning into goal 5/combat via
// npc_set_goal+npc_set_walk_target when detection conditions are met);
// at its tail (unconditionally reached, also the direct entry point
// for other goal values per this file's own cross-references),
// gradually orients the NPC's facing toward the last-seen player
// direction. Already had 2 confirmed real bugs fixed by an earlier
// pass (an inverted branch condition and several fabricated-remainder
// Ordinal_2005 reads) -- see their own comments.
void npc_ai_default_tick()

{
  int uw_ord2005_rem_93 = 0; int uw_ord2005_rem_94 = 0; int uw_ord2005_rem_95 = 0; int uw_ord2005_rem_96 = 0;
  byte bVar1;
  ushort uVar2;
  bool bVar3;
  char cVar4;
  uint uVar5;
  undefined4 uVar6;
  char *iVar7;
  ushort *puVar8;
  undefined1 extraout_r1;
  undefined1 uVar9;
  undefined1 extraout_r1_00;
  byte extraout_r1_01;
  undefined1 extraout_r1_02;
  char extraout_r1_03;
  uint extraout_r1_04;
  uint extraout_r1_05;
  uint extraout_r1_06;
  uint extraout_r1_07;
  uint extraout_r1_08;
  byte bVar10;
  uint uVar11;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  undefined4 unaff_r6;
  undefined4 unaff_r7;
  uint uVar12;
  undefined4 unaff_r8;
  undefined4 unaff_r9;
  undefined4 unaff_lr;
  
  bVar3 = false;
  DAT_00101920 = 0;
  *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xdf;
  *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xbf;
  uVar2 = *(ushort *)((char *)DAT_0010190c + 0xb);
  if ((uVar2 & 0xf) != 0xb) {
    if (((*(byte *)((char *)DAT_0010190c + 0x15) & 0x3f) == 0x2c) && ((uVar2 & 0x1000) == 0x1000)) {
      bVar10 = *(byte *)(DAT_00101404 + 0x10) & 0xf;
      if (bVar10 == 1) {
        if ((uVar2 & 0xf000) == 0x1000) {
          uVar6 = 1;
        }
        else {
          if ((uVar2 & 0xf000) != 0x3000) goto LAB_000339fc;
          uVar6 = 2;
        }
      }
      else if (bVar10 == 2) {
        uVar6 = 0x17;
      }
      else if (bVar10 == 3) {
        uVar6 = 5;
      }
      else if (bVar10 == 4) {
        uVar6 = 0xe;
      }
      else {
        if (bVar10 != 5) goto LAB_000339fc;
        uVar6 = 0xd;
      }
      play_positional_sound_effect(uVar6,DAT_00101910,DAT_0010141c,0);
    }
LAB_000339fc:
    if ((*(byte *)(DAT_00101404 + 10) & 2) == 0) {
      if (((((((*(byte *)((char *)DAT_0010190c + 0x19) & 0x40) == 0) && (DAT_0010194c != DAT_00101738)) &&
            (DAT_000853d0 == *(char *)(DAT_00101404 + 9))) &&
           ((*(byte *)((char *)DAT_0010190c + 10) & 0x80) == 0)) ||
          ((*(byte *)((char *)DAT_0010190c + 0x19) & 0x40) != 0)) &&
         ((*(uint *)(DAT_00086df8 + 0xce) < DAT_00101940 + 0x200U &&
          (uVar11 = (int)((uint)DAT_00101918 - (uint)DAT_0010192c) >> 0x1f,
          uVar5 = (int)((uint)DAT_001013f8 - (uint)DAT_00101930) >> 0x1f,
          (int)((((uint)DAT_001013f8 - (uint)DAT_00101930 ^ uVar5) - uVar5) +
               (((uint)DAT_00101918 - (uint)DAT_0010192c ^ uVar11) - uVar11)) <
          (int)(*(byte *)(DAT_00101404 + 0x1e) & 0xf))))) {
        uVar11 = *(ushort *)((char *)DAT_0010190c + 0xd) & 0x3fff;
        *(char *)((char *)DAT_0010190c + 0xd) = (char)uVar11;
        *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar11 >> 8);
        *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 1;
        bVar10 = *(byte *)((char *)DAT_0010190c + 0xb) & 0xf;
        if ((bVar10 != 9) && (bVar10 != 6)) {
          cVar4 = DAT_0010194c;
          if ((*(byte *)((char *)DAT_0010190c + 0x19) & 0x40) == 0) {
            cVar4 = '\x01';
          }
          npc_set_goal(5,cVar4);
          npc_set_walk_target(DAT_0010192c,DAT_00101930,DAT_00101934);
        }
      }
      cVar4 = *(char *)((char *)DAT_0010190c + 0x12);
      /* Added a NULL guard on FUN_000535fc's result: it legitimately
         returns NULL for an out-of-range slot index (its own established
         behavior/contract), and this code unconditionally dereferenced
         it. Confirmed live crashing (EXC_BAD_ACCESS at 0x19) the first
         time this branch was reached with a real (previously always-0,
         now-fixed) random cVar4 value from this session's Ordinal_2005
         sweep -- a pre-existing bug in this never-before-exercised
         function, not something the sweep itself introduced. */
      if ((cVar4 != '\0') &&
         (((cVar4 == '\x01' && ((*(byte *)((char *)DAT_0010190c + 0x19) & 0x40) == 0)) ||
          (((*(byte *)((char *)DAT_0010190c + 0x19) & 0x40) != 0 ||
           (iVar7 = FUN_000535fc(cVar4), (iVar7 != 0) && (*(byte *)(iVar7 + 0x19) & 0x40) != 0)))))) {
        if ((uint)*(byte *)((char *)DAT_0010190c + 0x12) != (*(ushort *)((char *)DAT_0010190c + 0xb) >> 4 & 0xff)) {
          uVar11 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xf00f |
                   (uint)*(byte *)((char *)DAT_0010190c + 0x12) << 4;
          *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar11;
          *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar11 >> 8);
        }
        iVar7 = refresh_npc_target_delta();
        if (iVar7 != 0) {
          bVar3 = true;
          if (*(char *)((char *)DAT_0010190c + 0x12) == '\x01') {
            uVar11 = *(ushort *)((char *)DAT_0010190c + 0xd) & 0x3fff;
            *(char *)((char *)DAT_0010190c + 0xd) = (char)uVar11;
            *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar11 >> 8);
            npc_set_walk_target(*(ushort *)((char *)g_player_object + 0x16) >> 10,
                         *(ushort *)((char *)g_player_object + 0x16) >> 4 & 0x3f,
                         *(byte *)((char *)g_player_object + 2) >> 3 & 0xf);
            *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 1;
          }
          if ((DAT_00101900 < 3) ||
             (((*(byte *)(DAT_00101404 + 0x2d) & 1) != 0 &&
              (iVar7 = tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar7 == 0)))) {
            if ((*(byte *)((char *)DAT_0010190c + 0x19) & 0x20) != 0) goto LAB_00033d18;
            if (((*(byte *)((char *)DAT_0010190c + 0x19) & 0x10) == 0) &&
               (iVar7 = check_npc_morale_flee(*(undefined1 *)(DAT_00101404 + 4),
                                     *(undefined1 *)((char *)DAT_0010190c + 8),
                                     *(byte *)(DAT_00101404 + 0x1c) & 0xf,
                                     *(undefined1 *)((char *)DAT_0010190c + 0x11)), iVar7 != 0)) {
              uVar9 = *(undefined1 *)((char *)DAT_0010190c + 0x12);
              uVar6 = 6;
            }
            else {
              if ((*(byte *)((char *)DAT_0010190c + 0x19) & 0x10) == 0) goto LAB_00033d18;
              *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 0x10;
              uVar9 = *(undefined1 *)((char *)DAT_0010190c + 0x12);
              uVar6 = 9;
            }
          }
          else {
            *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 0x20;
LAB_00033d18:
            uVar9 = *(undefined1 *)((char *)DAT_0010190c + 0x12);
            uVar6 = 5;
          }
          npc_set_goal(uVar6,uVar9);
          *(undefined1 *)((char *)DAT_0010190c + 0x12) = 0;
          *(undefined1 *)((char *)DAT_0010190c + 0x11) = 0;
        }
      }
    }
  }
  /* Main per-tick goal dispatch -- see this function's header comment
     for the scaling-bug fix that applies here too (was reading byte
     0x16 instead of the real goal nibble at byte 0xb). */
  if (getenv("UW_DEBUG_NPC_GOAL_SWITCH"))
    fprintf(stderr, "[npc-goal-switch] obj=%p goal=%d tile=(%u,%u)\n", (void *)DAT_0010190c,
            (int)(*(ushort *)((char *)DAT_0010190c + 0xb) & 0xf),
            (unsigned)(DAT_0010190c[0xb] >> 10), (unsigned)((DAT_0010190c[0xb] & 0x3f0) >> 4));
  switch(*(ushort *)((char *)DAT_0010190c + 0xb) & 0xf) {
  case 0:
    goto LAB_00033e9c;
  case 1:
    puVar8 = (ushort *)tilemap_lookup(DAT_0010143c,DAT_0010173c);
    npc_walk_toward_tile(DAT_0010143c,DAT_0010173c,*puVar8 >> 4 & 0xf);
    break;
  case 2:
    npc_idle_behavior_tick();
    break;
  case 3:
    if ((bVar3) || (iVar7 = refresh_npc_target_delta(), iVar7 != 0)) {
      npc_combat_approach_tick();
    }
    else {
LAB_00033ef8:
      npc_clear_special_goal();
    }
    break;
  case 4:
    goto LAB_00033e9c;
  case 5:
    if ((!bVar3) && (iVar7 = refresh_npc_target_delta(), iVar7 == 0)) goto LAB_00033ef8;
    npc_combat_engage_close_tick();
    break;
  case 6:
    if ((!bVar3) && (iVar7 = refresh_npc_target_delta(), iVar7 == 0)) goto LAB_00033ef8;
    npc_combat_position_tick();
    break;
  case 7:
LAB_00033e9c:
    npc_notice_and_idle_tick();
    break;
  case 8:
    npc_wander_return_home_tick();
    break;
  case 9:
    if ((!bVar3) && (iVar7 = refresh_npc_target_delta(), iVar7 == 0)) goto LAB_00033ef8;
    npc_combat_engage_wide_tick();
    break;
  case 10:
    npc_combat_disengage_tick();
    break;
  case 0xb:
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
    uVar6 = Ordinal_1053();
    iVar7 = DAT_0010190c;
    bVar10 = *(byte *)((char *)DAT_0010190c + 0x13);
    uw_ord2005_rem_93 = ((int)(uVar6)) % (2);
    *(byte *)(iVar7 + 0x13) = (uw_ord2005_rem_93 ^ bVar10) & 0x7f ^ bVar10;
    uVar6 = Ordinal_1053();
    uw_ord2005_rem_94 = ((int)(uVar6)) % (0x100);
    *(undefined1 *)((char *)DAT_0010190c + 9) = uw_ord2005_rem_94;
    uVar6 = Ordinal_1053();
    uw_ord2005_rem_95 = ((int)(uVar6)) % (3);
    *(byte *)((char *)DAT_0010190c + 0x14) =
         *(byte *)((char *)DAT_0010190c + 0x14) & 7 ^ (uw_ord2005_rem_95 + '\x0f') * '\b';
    iVar7 = DAT_0010190c;
    uVar2 = *(ushort *)((char *)DAT_0010190c + 0xb);
    uw_ord2005_rem_96 = ((int)((uVar2 >> 0xc) + 1)) % (4);
    uVar11 = uVar2 & 0xfff;
    *(char *)(iVar7 + 0xb) = (char)uVar11;
    *(byte *)((char *)DAT_0010190c + 0xc) =
         (byte)(uVar11 >> 8) | (byte)(((uw_ord2005_rem_96 & 0xf) << 0xc) >> 8);
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) | 0x40;
    break;
  case 0xc:
    npc_wander_return_home_exact_tick();
    break;
  default:
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) | 7;
  }
  iVar7 = DAT_0010190c;
  /* HACK: same ushort-vs-byte pointer-arithmetic scaling bug as
     process_visible_tile_cell's sibling npc_notice_and_idle_tick (fixed earlier this
     session) -- DAT_0010190c is `ushort *`, so bare `DAT_0010190c + 2`
     scales to byte offset 4, but real disassembly of this exact block
     (0x32578-0x3257c: `ldrb r3,[r4,#0x3]; ldrb r2,[r4,#0x2]`) reads raw
     BYTE offsets 2/3. Cast to a byte pointer first so the offset isn't
     doubled; see the matching write fix a few lines down (was
     `DAT_0010190c + 3`, same bug, confirmed via 0x32654-0x3265c:
     `ldr r1,[r6,#0x0]; strb r3,[r1,#0x3]` -- also raw byte 3, not the
     scaled byte 6 the undecorated expression computed). */
  uVar2 = *(ushort *)((char *)DAT_0010190c + 2);
  bVar10 = *(byte *)((char *)DAT_0010190c + 9);
  uVar11 = uVar2 >> 2 & 0xff;
  uVar11 = (uVar11 ^ *(byte *)((char *)DAT_0010190c + 0x18)) & 0x1f ^ uVar11;
  uVar12 = (uint)DAT_001018fc;
  /* Was `Ordinal_2005(0x100,(uVar11-uVar12)+0x100,*(undefined1*)(DAT_0010190c+2),
     Ordinal_2005_exref,unaff_r4,unaff_r5,unaff_r6,unaff_r7,unaff_r8,unaff_r9,
     unaff_lr);` -- badly garbled. Real disassembly (0x3256c-0x32768, this
     function's actual body per Ghidra -- npc_ai_default_tick's own "0x33880"
     entry point is just one jump-table case landing in a shared tail
     block starting here) confirms this is genuinely a plain 2-argument
     `Ordinal_2005(0x100,(uVar11-uVar12)+0x100)` call; the extra
     "arguments" are a decompiler artifact with no real source (the
     unaff_rN/unaff_lr names mean "whatever these callee-saved registers
     happened to hold since function entry", never actually read by the
     real code here). All 5 Ordinal_2005 calls in this function also
     have the by-now-familiar fabricated-remainder bug (this port's
     Ordinal_2005 never populates extraout_r1); computed each directly
     instead (divisor is always the constant 0x100, so `% 0x100` == the
     `& 0xff` already applied everywhere the remainder is consumed).
     Confirmed live: this function is npc_ai_tick's `case 0xb`/default
     dispatch target (the "orient toward last-seen-player direction"
     tail shared by every non-special AI state), and was the real source
     of the QA-reported "NPC disappears/teleports on its first tick" bug
     -- with the remainder always reading as garbage/0, the facing-delta
     clamp this computes could send an object's orientation (and, via
     the offset+2/+3 tile-position bits it also writes here, its
     position) to an arbitrary value on the very first tick any NPC ran
     this path. */
  uVar5 = ((uVar11 - uVar12) + 0x100) & 0xff;
  if ((0x1f < uVar5) && (uVar5 < 0xe1)) {
    if (uVar5 < 0x80) {
      uVar11 = (uVar12 + 0x20) & 0xff;
    }
    else {
      uVar11 = (uVar12 + 0xe0) & 0xff;
    }
    uVar11 = uVar11 & 0xff;
  }
  uVar5 = uVar2 & 0xfc7f | (uVar11 & 0xffe0) << 2;
  *(char *)(iVar7 + 2) = (char)uVar5;
  *(char *)((char *)DAT_0010190c + 3) = (char)(uVar5 >> 8);
  *(byte *)((char *)DAT_0010190c + 0x18) =
       (*(byte *)((char *)DAT_0010190c + 0x18) ^ (byte)uVar11) & 0x1f ^ *(byte *)((char *)DAT_0010190c + 0x18);
  iVar7 = DAT_0010190c;
  /* Was `if (DAT_00101430 == 0)` -- an inverted condition, confirmed via
     real disassembly (`cmp r0,#0x0; beq 0x326a4`, where r0 is
     DAT_00101430 and 0x326a4 is the simple "just copy DAT_00101458"
     branch this decompile currently has as the ELSE): the real branch
     runs this whole Ordinal_2005-laden "randomly step the facing toward
     the last-known player direction" block when DAT_00101430 is
     NONZERO, and takes the simple path when it's zero -- exactly
     backwards from what was here. DAT_00101430 defaults to 0 at the top
     of npc_ai_tick (its only other writer in this file), so with the
     inverted condition, ordinary NPCs took this complex branch on
     essentially every tick instead of the simple one -- combined with
     this branch's own fabricated-remainder bugs (fixed above), this was
     the real source of the QA-reported "NPC teleports on its first
     tick" bug. */
  if (DAT_00101430 != 0) {
    if (DAT_00101434 < 2) {
      return;
    }
    bVar1 = *(byte *)((char *)DAT_0010190c + 0x13);
    if ((bVar1 & 0x7f) < 2) {
      return;
    }
    uVar5 = (uint)DAT_00101458;
    uVar11 = ((bVar10 - uVar5) + 0x100) & 0xff;
    if ((uVar11 < 0x20) || (0xe0 < uVar11)) {
      *(byte *)(iVar7 + 9) = bVar10;
      return;
    }
    if (uVar11 < 0x40) {
      uVar9 = (uVar5 + 0x20) & 0xff;
    }
    else {
      if (uVar11 < 0xc1) {
        *(byte *)(iVar7 + 0x13) = bVar1 & 0x80;
        goto LAB_00032690;
      }
      uVar9 = (uVar5 + 0xe0) & 0xff;
    }
    *(undefined1 *)(iVar7 + 9) = uVar9;
  }
  else {
LAB_00032690:
    *(byte *)((char *)DAT_0010190c + 9) = DAT_00101458;
  }
  return;
}


// was FUN_00034044 -- refreshes the whole "delta to tracked target"
// state every function in this NPC AI cluster reads: looks up the
// target object from the NPC's own goal-target slot (byte 0xb's high
// nibble), and if it's valid and alive, recomputes the target's tile
// position (DAT_00101408/10), level (DAT_00101420), fine position
// (DAT_00101908/18), delta (DAT_00101444/8), and both a tile-level and
// fine-level distance-squared (DAT_00101900/DAT_00101728). Returns 0
// if there's no valid target to track.
undefined4 refresh_npc_target_delta()

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  
  DAT_00101400 = FUN_000535fc((*(ushort *)((char *)DAT_0010190c + 0xb) & 0xff0) >> 4);
  if ((DAT_00101400 == 0) || (*(char *)(DAT_00101400 + 8) == '\0')) {
    uVar1 = 0;
  }
  else {
    DAT_00101408 = *(byte *)(DAT_00101400 + 0x17) >> 2;
    uVar4 = *(ushort *)(DAT_00101400 + 0x16) >> 4 & 0x3f;
    DAT_00101410 = (undefined1)uVar4;
    DAT_00101420 = *(byte *)(DAT_00101400 + 2) >> 3 & 0xf;
    iVar3 = (uint)DAT_00101408 * 8 + (uint)(*(byte *)(DAT_00101400 + 3) >> 5);
    DAT_00101908 = (undefined2)iVar3;
    iVar2 = (*(byte *)(DAT_00101400 + 3) >> 2 & 7) + uVar4 * 8;
    DAT_00101418 = (undefined2)iVar2;
    DAT_00101444 = (short)((uint)(iVar3 * 0x10000) >> 0x10) - DAT_00101910;
    DAT_00101448 = (short)((uint)(iVar2 * 0x10000) >> 0x10) - DAT_0010141c;
    iVar5 = (uint)DAT_00101408 - (uint)DAT_00101918;
    DAT_00101900 = (undefined2)
                   ((iVar5 * iVar5 + (uVar4 - DAT_001013f8) * (uVar4 - DAT_001013f8)) * 0x10000 >>
                   0x10);
    DAT_00101728 = (iVar3 - (uint)DAT_00101910) * (iVar3 - (uint)DAT_00101910) +
                   (iVar2 - (uint)DAT_0010141c) * (iVar2 - (uint)DAT_0010141c);
    uVar1 = 1;
  }
  return uVar1;
}


// was FUN_00034270 -- an NPC morale/flee-shaped check: param_1 is a
// stat-template byte (byte 4), param_2 the NPC's own current HP (byte
// 8); if param_2 falls outside a band scaled off param_1, returns 0
// outright. Otherwise, once param_4 (an NPC record field, byte 0x11)
// drops to half of param_1 or below, rolls a random chance (biased by
// the param_2/param_1 ratio and param_3, another stat-template field)
// to decide whether the check fails. Confirmed via its one real call
// site (src/ai.c) gating a state transition to state 6 -- likely a
// low-HP flee/morale-break reaction, though the exact real-world
// meaning of param_3/param_4 isn't independently confirmed.
undefined4 check_npc_morale_flee(param_1,param_2,param_3,param_4)
uint param_1;
uint param_2;
uint param_3;
uint param_4;

{
  int uw_ord2005_rem_97 = 0;
  undefined4 uVar1;
  int iVar2;
  int extraout_r1;
  
  param_1 = param_1 & 0xff;
  param_2 = param_2 & 0xff;
  if (((uint)((int)(param_1 * 3) >> 2) < param_2) || (param_2 < param_1 >> 3)) {
LAB_000342b0:
    uVar1 = 0;
  }
  else {
    if ((param_4 & 0xff) <= param_1 >> 1) {
      if (param_1 == 0) goto LAB_000342b0;
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_97 = ((int)(uVar1)) % (4);
      iVar2 = Ordinal_2005(param_1,param_2 << 4);
      if ((int)(0xf - (param_3 & 0xff)) < (int)(uw_ord2005_rem_97 + iVar2 & 0xffffU)) {
        return 0;
      }
    }
    uVar1 = 1;
  }
  return uVar1;
}


// was FUN_0003431c -- computes the BFS search-radius parameter passed
// to creature_find_path_to_tile: gated on the NPC being alive/awake
// and having a nonzero stat-template byte 4 (with a quest-mode
// exception), returns a value derived from that stat scaled by the
// NPC's own current HP plus a further stat-template component, or 0
// if any gate fails (which creature_find_path_to_tile presumably
// treats as "search nothing"/immediate failure).
int compute_pathfind_search_radius()

{
  char *iVar1;
  uint uVar2;
  
  iVar1 = DAT_00101404;
  if (((((*(byte *)((char *)DAT_0010190c + 0xe) & 0xc0) == 0) && (*(char *)(DAT_00101404 + 4) != '\0')) &&
      ((*(byte *)((char *)DAT_0010190c + 1) & 0x20) == 0)) &&
     ((DAT_00201b68 != 6 || (*(char *)((char *)DAT_0010190c + 0x1a) != '\x16')))) {
    uVar2 = Ordinal_2005(*(char *)(DAT_00101404 + 4),(uint)*(byte *)((char *)DAT_0010190c + 8) << 2);
    return (uVar2 & 0xff) + (*(byte *)(iVar1 + 0x1c) >> 2 & 3);
  }
  return 0;
}


// was FUN_000345b8 -- transitions an NPC object into the death state
// (goal 0xc, the state npc_ai_default_tick's own goal-0xc branch reads
// to drop loot and free the slot): allowed unconditionally if byte
// 0x1a is 0 (a "not immortal/scripted" marker), or via FUN_0003a73c's
// own eligibility check otherwise. On success, sets goal 0xc, clears
// the animation-frame nibble, and zeroes HP (byte 8). Returns 1 if the
// transition happened, 0 if blocked.
undefined4 initiate_npc_death(param_1)
int param_1;

{
  int iVar1;
  undefined4 uVar2;
  uint uVar3;

  if ((*(char *)(param_1 + 0x1a) == '\0') || (iVar1 = FUN_0003a73c(param_1,0), iVar1 != 0)) {
    uVar2 = 1;
    *(byte *)(param_1 + 0x15) = *(byte *)(param_1 + 0x15) & 0xcc | 0xc;
    uVar3 = CONCAT11(*(undefined1 *)(param_1 + 0xc),*(undefined1 *)(param_1 + 0xb)) & 0xfff;
    *(char *)(param_1 + 0xb) = (char)uVar3;
    *(char *)(param_1 + 0xc) = (char)(uVar3 >> 8);
    *(byte *)(param_1 + 0x14) = *(byte *)(param_1 + 0x14) & 0xfc | 4;
    *(undefined1 *)(param_1 + 8) = 0;
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}



// was FUN_00034634 -- wraps initiate_npc_death: bails out early (returns
// 0) if the NPC is already in goal 0xc (dead) or initiate_npc_death()
// refuses the transition; otherwise plays a positional death sound
// (only for goal-category 1 NPCs) and returns 1. Callers use the
// return value to gate award_monster_kill_experience().
undefined4 handle_monster_death(param_1)
int param_1;

{
  int iVar1;
  undefined4 uVar2;

  if (((*(byte *)(param_1 + 0x15) & 0x3f) == 0xc) || (iVar1 = initiate_npc_death(param_1), iVar1 == 0)) {
    uVar2 = 0;
  }
  else {
    if ((*(byte *)(DAT_00101404 + 8) & 7) == 1) {
      play_positional_sound_effect(6,DAT_00101910,DAT_0010141c,0);
    }
    uVar2 = 1;
  }
  return uVar2;
}


// was FUN_00034ac4 -- calls npc_set_goal(param_2,param_3) as if
// param_1 were the "current NPC" (DAT_0010190c), temporarily swapping
// that context pointer in and restoring the caller's own value
// afterward. Lets a caller change another NPC's goal without disturbing
// its own in-progress AI-tick context.
void npc_set_goal_for_object(param_1,param_2,param_3)
char *param_1;
undefined4 param_2;
undefined4 param_3;

{
  char *uVar1;

  uVar1 = DAT_0010190c;
  DAT_0010190c = param_1;
  npc_set_goal(param_2,param_3);
  DAT_0010190c = uVar1;
  return;
}



// was FUN_00034af0 -- for every NPC in the active mobile list
// (DAT_002046c0..DAT_002046c8), randomly re-rolls two flag bits on its
// mobile-object record's byte 0x19: bit 7 is set/cleared on a 50/50
// coin flip, and bit 6 is cleared unless a separate 1-in-4 roll hits.
// Byte 0x19's exact meaning isn't documented by the wiki; this only
// captures the observed random-flag-refresh behavior.
void randomize_active_npc_flags()

{
  int uw_ord2005_rem_98 = 0; int uw_ord2005_rem_99 = 0;
  undefined4 uVar1;
  uint extraout_r1;
  int extraout_r1_00;
  byte *pbVar2;
  int iVar3;
  
  pbVar2 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      iVar3 = (uint)*pbVar2 * 0x1b + DAT_002046b8;
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_98 = ((int)(uVar1)) % (2);
      *(byte *)(iVar3 + 0x19) = (byte)((uw_ord2005_rem_98 & 1) << 7) | *(byte *)(iVar3 + 0x19) & 0x7f;
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_99 = ((int)(uVar1)) % (4);
      if (uw_ord2005_rem_99 != 1) {
        *(byte *)(iVar3 + 0x19) = *(byte *)(iVar3 + 0x19) & 0xbf;
      }
      pbVar2 = pbVar2 + 1;
    } while (pbVar2 < DAT_002046c8);
  }
  return;
}
