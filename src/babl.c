/* The "babl" conversation/dialogue scripting VM: bytecode interpreter,
 * script-callable native intrinsics (babl_builtin_*), the named
 * script-variable bridge (babl_register_builtin/babl_set_variable/
 * babl_get_variable), the NPC<->object-record sync functions
 * (sync_conv_vars_from_npc/to_npc), and conversation UI setup
 * (FUN_000286cc/start_npc_conversation). Split out of uw.c (the
 * original monolithic decompile) once these functions' real roles were
 * confirmed -- see mysteries.md and the git history around the
 * "babl conversation-variable bridge" naming pass for the investigation
 * trail.
 */
#include "headers/babl.h"
#include <stdio.h>
#include <stdlib.h>



/* Was a no-op stub -- the real function was never decompiled, so
   babl_builtin_set_attitude's own FUN_00074be8 iteration (invoked once
   per matching-race object it walks) silently never wrote the new
   attitude value into any of them. Recovered from the real ARM binary
   (Ghidra headless): writes the babl script's requested attitude
   value into the object's own attitude bits (byte offset 0xd/0xe,
   masked to the low 14 bits, same field babl_builtin_set_race_attitude
   writes more directly a few functions up). Callback signature
   confirmed from FUN_00074be8's own call site: `(*param_4)(iVar1,param_3)`
   with iVar1 a real object pointer and param_3 the attitude value. */
int babl_builtin_set_attitude_apply(param_1,param_2)
intptr_t param_1;
uint param_2;
{
  uint uVar1;

  uVar1 = *(ushort *)(param_1 + 0xd) & 0x3fff;
  *(char *)(param_1 + 0xd) = (char)uVar1;
  *(byte *)(param_1 + 0xe) = (byte)(uVar1 >> 8) | (byte)(((param_2 & 3) << 0xe) >> 8);
  return 0;
}

/* Was a no-op stub here -- the real function was never decompiled, so
   the "length" babl builtin (registered a few hundred lines below)
   silently returned 0 (an empty-string length) whenever a script
   asked for a string's length, same bug class as babl_menu before its
   own recovery. Recovered from the real ARM binary (Ghidra headless);
   it dropped 2 register-forwarding args in the same shape as every
   other sibling in this cluster (FUN_0007863c/Ordinal_1068 called
   with no args in the raw decompile, relying on the value already
   sitting in r0 from the previous call -- chained explicitly here). */
// was FUN_00019a60
undefined2 babl_builtin_length(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix
{
  intptr_t iVar1;
  char *pcVar2;

  iVar1 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  pcVar2 = (char *)FUN_0007863c((int)iVar1);
  return Ordinal_1068(pcVar2);
}

/* Was a no-op stub here ("Ghidra couldn't resolve this address...
   safe no-op stub") -- the real function was never decompiled, so the
   "sex" babl builtin (registered under that exact script name, see
   start_npc_conversation) silently did nothing, same bug class as
   babl_menu before its own recovery. Recovered from the real ARM
   binary (Ghidra headless). Picks between two babl script-supplied
   msgids (the two shorts just below the stack-arg pointer, matching
   every sibling babl builtin's own `param_1 - N` stack-arg convention)
   based on the player's own gender bit -- byte offset 0x64 (100) of
   the player-stats struct at DAT_00086df8, bit 1. The original reads
   this via a literal-pool constant (DAT_0001842c) that just holds
   &DAT_00086df8's own real address; substituted the real global
   directly instead of porting a second alias for the same pointer. */
// was FUN_0001840c
undefined4 babl_builtin_sex(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix
{
  /* Ghidra's own decompile of this one shows `void`, discarding
     FUN_0001adc4's return value -- but on real ARM calling convention
     a tail call like this naturally leaves its callee's return value
     in r0 for the caller (the babl VM's generic builtin dispatcher,
     which DOES read every builtin's return value uniformly, same as
     every other babl_register_builtin entry in this file), so
     returning it explicitly here matches actual runtime behavior
     rather than Ghidra's weaker "nothing in THIS function reads r0
     afterward" signature inference. */
  return FUN_0001adc4((int)*(short *)(param_1 + (intptr_t)((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 2) + -4));
}
/* Was a no-op stub here -- the real function was never decompiled, so
   the "do_decline" babl builtin (registered under that exact script
   name, see start_npc_conversation) silently did nothing whenever an
   NPC's barter script declined an offer, same bug class as babl_menu
   before its own recovery. Recovered from the real ARM binary (Ghidra
   headless): it's a thin wrapper handing back every item currently
   staged on the barter table (param_1=0 to FUN_0001c79c, matching
   that function's own "give everything back" branch) -- genuinely
   void, FUN_0001c79c itself returns nothing meaningful either. */
// was FUN_0001cd34
void babl_builtin_do_decline()

{
  FUN_0001c79c(0);
  return;
}
/* Was a no-op stub here ("Ghidra couldn't resolve this address...
   safe no-op stub") -- the real function was never decompiled, so the
   "take_from_npc" babl builtin (registered under that exact script
   name, see start_npc_conversation) silently did nothing whenever an
   NPC's script tried to hand the player an item, same bug class as
   babl_menu before its own recovery. Recovered from the real ARM
   binary (Ghidra headless); every helper it calls (resolve_object_link,
   object_list_unlink, check_object_carry_weight, drop_object_near_target,
   encode_object_slot_index) already has a real implementation and a
   uw.h forward declaration elsewhere in this file, so it can stay
   here rather than needing to move (unlike babl_menu's own case).

   Logic: looks up the babl script's requested item (a plain object id
   under 1000, or a "1000 + category" encoding for an item CLASS) in
   the current NPC's own inventory chain (or an already-selected
   override object at DAT_00202948, if one is set), unlinks it from
   the NPC once found, then either hands it straight to the player
   (if check_object_carry_weight says it fits -- opens a brief item-
   view popup via FUN_00057c5c) or, if it doesn't fit, stages it in
   one of the 4 player-side barter-table slots (DAT_000bbfd0/bbfa8/
   bbf98/bbfc0, the same table sprite_list/FUN_0001b474 sets up)
   instead of dropping it. DAT_00202948/DAT_002020c4's own exact
   semantics aren't independently confirmed (see their own comment) --
   this is a faithful 1:1 port of the real disassembly, not yet
   exercised live by any known conversation script. */
undefined4 babl_builtin_take_from_npc(param_1)
intptr_t param_1;
{
  uint uVar1;
  intptr_t iVar2;
  intptr_t *piVar3;
  intptr_t *piVar4;
  intptr_t iVar5;
  undefined2 uVar6;
  short sVar7;
  intptr_t iVar8;
  ushort *puVar9;
  intptr_t iVar10;
  undefined4 uVar11;
  bool bVar12;

  sVar7 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  piVar4 = &DAT_00202948;
  piVar3 = (intptr_t *)&DAT_00100674;
  if (DAT_00202948 == 0) {
    iVar8 = DAT_00100674;
    if ((*(byte *)(iVar8 + 0xe) & 0x10) == 0) {
      FUN_000798c4();
      iVar8 = *piVar3;
    }
    puVar9 = (ushort *)resolve_object_link((ushort *)(iVar8 + 6));
    if (puVar9 != (ushort *)0x0) {
      uVar1 = (uint)sVar7;
      do {
        if ((int)uVar1 < 1000) {
          bVar12 = (*puVar9 & 0x1ff) == uVar1;
        }
        else {
          bVar12 = uVar1 - 1000 == (uint)(*puVar9 >> 4 & 0x1f);
        }
        if (bVar12) {
          object_list_unlink((byte *)(iVar8 + 6),(byte *)puVar9);
          iVar10 = check_object_carry_weight(puVar9);
          iVar8 = (intptr_t)&DAT_000bbfd0;
          if (iVar10 == 0) {
            iVar10 = 0;
            while (*(short *)(iVar8 + iVar10 * 2) != 0) {
              iVar10 = (intptr_t)(short)(iVar10 + 1);
              if (3 < iVar10) {
                iVar8 = drop_object_near_target((void *)*piVar3,puVar9,5,0);
                if (iVar8 == 0) {
                  uVar11 = 3;
                }
                else {
                  uVar11 = 2;
                }
                return uVar11;
              }
            }
            iVar2 = (intptr_t)(short)iVar10;
            uVar6 = encode_object_slot_index((char *)puVar9);
            iVar5 = (intptr_t)&DAT_000bbfa8;
            *(undefined2 *)(iVar8 + iVar2 * 2) = uVar6;
            *(undefined4 *)((intptr_t)&DAT_000bbf98 + iVar2 * 4) = 0;
            *(undefined2 *)((intptr_t)&DAT_000bbfc0 + (iVar2 + 4) * 2) = 0xffff;
            *(undefined2 *)(iVar5 + iVar2 * 2) = 0xffff;
            draw_hotspot_crosshair_marker(0,(int)iVar10);
            FUN_0001bf9c(1,(int)iVar10);
          }
          else {
            *piVar4 = (intptr_t)puVar9;
            FUN_00057118();
            FUN_00057c5c(*puVar9 & 0x1ff);
            DAT_002020c4 = 1;
            cursor_show_idle_tick();
            FUN_0007ec50();
          }
          return 1;
        }
        puVar9 = (ushort *)resolve_object_link(puVar9 + 2);
      } while (puVar9 != (ushort *)0x0);
    }
  }
  return 0;
}
/* Was a no-op stub -- same bug and same recovery as
   babl_builtin_take_from_npc just above (see its own comment for the
   full story and the helper/global mapping both share). The only real
   difference: this one matches by exact encoded slot index
   (encode_object_slot_index(puVar9)==sVar7, "take THIS SPECIFIC
   item") instead of by object id/category ("take any item of this
   kind"). Not yet exercised live by any known conversation script. */
undefined4 babl_builtin_take_id_from_npc(param_1)
intptr_t param_1;
{
  intptr_t iVar1;
  intptr_t *piVar2;
  intptr_t *piVar3;
  intptr_t iVar4;
  short sVar5;
  undefined2 uVar6;
  short sVar7;
  intptr_t iVar8;
  ushort *puVar9;
  intptr_t iVar10;
  undefined4 uVar11;

  sVar7 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  piVar3 = &DAT_00202948;
  piVar2 = (intptr_t *)&DAT_00100674;
  if (DAT_00202948 == 0) {
    iVar8 = DAT_00100674;
    for (puVar9 = (ushort *)resolve_object_link((ushort *)(iVar8 + 6)); puVar9 != (ushort *)0x0;
        puVar9 = (ushort *)resolve_object_link(puVar9 + 2)) {
      sVar5 = encode_object_slot_index((char *)puVar9);
      if (sVar7 == sVar5) {
        object_list_unlink((byte *)(iVar8 + 6),(byte *)puVar9);
        iVar10 = check_object_carry_weight(puVar9);
        iVar8 = (intptr_t)&DAT_000bbfd0;
        if (iVar10 == 0) {
          iVar10 = 0;
          while (*(short *)(iVar8 + iVar10 * 2) != 0) {
            iVar10 = (intptr_t)(short)(iVar10 + 1);
            if (3 < iVar10) {
              iVar8 = drop_object_near_target((void *)*piVar2,puVar9,5,0);
              if (iVar8 == 0) {
                uVar11 = 3;
              }
              else {
                uVar11 = 2;
              }
              return uVar11;
            }
          }
          iVar1 = (intptr_t)(short)iVar10;
          uVar6 = encode_object_slot_index((char *)puVar9);
          iVar4 = (intptr_t)&DAT_000bbfa8;
          *(undefined2 *)(iVar8 + iVar1 * 2) = uVar6;
          *(undefined4 *)((intptr_t)&DAT_000bbf98 + iVar1 * 4) = 0;
          *(undefined2 *)((intptr_t)&DAT_000bbfc0 + (iVar1 + 4) * 2) = 0xffff;
          *(undefined2 *)(iVar4 + iVar1 * 2) = 0xffff;
          draw_hotspot_crosshair_marker(0,(int)iVar10);
          FUN_0001bf9c(1,(int)iVar10);
        }
        else {
          *piVar3 = (intptr_t)puVar9;
          FUN_00057118();
          FUN_00057c5c(*puVar9 & 0x1ff);
          DAT_002020c4 = 1;
          cursor_show_idle_tick();
          FUN_0007ec50();
        }
        return 1;
      }
    }
  }
  return 0;
}
/* Was a no-op stub -- same bug and same recovery as the two
   babl_builtin_take_from_npc / babl_builtin_take_id_from_npc functions
   above. Spawns a brand-new object of the babl script's requested id
   (spawn_new_object), tries to merge it into an existing stack of the
   same kind in the current NPC's inventory (freeing the freshly-
   spawned one and growing the existing stack's count instead, if a
   compatible stack is found -- mirrors the same stacking rule this
   file's other stack-merge sites use: same object id, both stackable,
   neither already at the 999 cap), otherwise inserts the new object
   at the head of the NPC's inventory outright. Not yet exercised live
   by any known conversation script. */
undefined4 babl_builtin_do_inv_create(param_1)
intptr_t param_1;
{
  ushort uVar1;
  intptr_t *piVar2;
  ushort *puVar3;
  ushort *puVar4;
  undefined4 uVar5;
  int iVar6;

  uVar5 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  puVar3 = (ushort *)spawn_new_object(uVar5,0);
  piVar2 = (intptr_t *)&DAT_00100674;
  if (puVar3 == (ushort *)0x0) {
    uVar5 = 0;
  }
  else {
    uVar1 = puVar3[2];
    *(byte *)(puVar3 + 2) = (byte)uVar1 | 0x3f;
    *(char *)((char *)puVar3 + 5) = (char)(uVar1 >> 8);
    puVar4 = (ushort *)(*piVar2 + 6);
    while (puVar4 = (ushort *)resolve_object_link(puVar4), puVar4 != (ushort *)0x0) {
      if (((((*puVar3 & 0x8000) != 0) && ((*puVar4 & 0x8000) != 0)) && ((puVar3[3] & 0x8000) == 0))
         && ((((puVar4[3] & 0x8000) == 0 && (((*puVar4 ^ *puVar3) & 0x1ff) == 0)) &&
             ((ushort)((puVar4[3] >> 6) + (puVar3[3] >> 6)) < 999)))) {
        iVar6 = (puVar4[3] & 0xffc0) + (puVar3[3] & 0xffc0);
        *(byte *)(puVar4 + 3) = (byte)iVar6 ^ (byte)puVar4[3] & 0x3f;
        *(char *)((char *)puVar4 + 7) = (char)((uint)iVar6 >> 8);
        free_object_slot(puVar3);
        puVar3 = (ushort *)0x0;
        break;
      }
      puVar4 = puVar4 + 2;
    }
    if (puVar3 != (ushort *)0x0) {
      object_list_insert_head((byte *)(*piVar2 + 6),(byte *)puVar3);
    }
    uVar5 = encode_object_slot_index((char *)puVar3);
  }
  return uVar5;
}




// was FUN_00017be8
void babl_builtin_set_attitude(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "set_attitude" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  undefined4 uVar1;
  undefined4 uVar2;
  
  uVar1 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar2 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  FUN_00074be8(uVar2,0,uVar1,&babl_builtin_set_attitude_apply);
  return;
}



// was FUN_00017c1c
void babl_builtin_set_race_attitude(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "set_race_attitude" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  uint uVar6;
  ushort *puVar7;
  short sVar8;
  int iVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  int iVar9;
  
  iVar5 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar2 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  uVar3 = FUN_0001adc4((int)*(short *)(param_1 + -6));
  uVar1 = *DAT_00100674;
  uVar11 = (uint)(*(byte *)((char *)DAT_00100674 + 0x17) >> 2);
  iVar13 = uVar11 - iVar5;
  uVar6 = DAT_00100674[0xb] >> 4 & 0x3f;
  iVar10 = uVar6 - iVar5;
  if (iVar13 * 0x10000 >> 0x10 < 1) {
    iVar13 = 1;
  }
  iVar9 = uVar11 + iVar5;
  sVar8 = (short)iVar9;
  if (iVar10 * 0x10000 >> 0x10 < 1) {
    iVar10 = 1;
  }
  iVar5 = uVar6 + iVar5;
  sVar4 = (short)iVar5;
  if (0x3f < iVar9 * 0x10000 >> 0x10) {
    sVar8 = 0x3f;
  }
  if (0x3f < iVar5 * 0x10000 >> 0x10) {
    sVar4 = 0x3f;
  }
  if ((int)(short)iVar10 <= (int)sVar4) {
    iVar9 = iVar13;
    iVar5 = (int)(short)iVar13;
    iVar12 = (int)(short)iVar10;
    do {
      while (iVar5 <= sVar8) {
        /* was folded into `int iVar5` (reused elsewhere as a loop-index
           int) -- truncated tilemap_lookup's real `void *` return */
        char *_tile5 = (char *)tilemap_lookup(iVar9,iVar10);
        puVar7 = (ushort *)resolve_object_link(_tile5 + 2);
        if (puVar7 != (ushort *)0x0) {
          do {
            if ((((*puVar7 & 0x1ff) == (int)(short)(uVar1 & 0x1ff)) && ((puVar7[5] & 0x80) == 0)) &&
               ((byte)(&DAT_001007d9)[(*puVar7 & 0x3f) * 0x30] == uVar3)) {
              uVar11 = *(ushort *)((char *)puVar7 + 0xd) & 0x3fff;
              *(char *)((char *)puVar7 + 0xd) = (char)uVar11;
              *(byte *)(puVar7 + 7) = (byte)(uVar11 >> 8) | (byte)(((uVar2 & 3) << 0xe) >> 8);
            }
            puVar7 = (ushort *)resolve_object_link(puVar7 + 2);
          } while (puVar7 != (ushort *)0x0);
        }
        iVar9 = iVar9 + 1;
        iVar5 = iVar9 * 0x10000 >> 0x10;
      }
      iVar10 = (iVar12 + 1) * 0x10000 >> 0x10;
      iVar9 = iVar13;
      iVar5 = (int)(short)iVar13;
      iVar12 = iVar10;
    } while (iVar10 <= sVar4);
  }
  return;
}



// was FUN_00017e10
undefined1 babl_builtin_x_skills(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "x_skills" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;

  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  if (sVar2 == 10000) {
    FUN_0007067c((int)(char)sVar1);
  }
  else if ((-1 < sVar2) && (sVar2 < 0x1f)) {
    *(char *)(DAT_00086df8 + sVar1 + 0x21) = (char)sVar2;
  }
  return *(undefined1 *)(DAT_00086df8 + sVar1 + 0x21);
}



// was FUN_00017e90
undefined1 babl_builtin_x_traps(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "x_traps" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;

  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  if ((-1 < sVar2) && (sVar2 < 0x40)) {
    *(char *)(DAT_00086df8 + sVar1 + 0x70) = (char)sVar2;
  }
  return *(undefined1 *)(DAT_00086df8 + sVar1 + 0x70);
}



// was FUN_00017eec
undefined4 babl_builtin_place_object(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "place_object" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  int iVar1;
  ushort uVar2;
  undefined4 uVar3;
  undefined1 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  ushort *puVar7;
  int iVar8;
  byte *pbVar9;
  
  uVar3 = FUN_0001adc4((int)*(short *)(param_1 + -6));
  puVar4 = (undefined1 *)FUN_000535fc();
  uVar5 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  uVar6 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  puVar7 = (ushort *)(DAT_00100674 + 6);
  uVar2 = *puVar7;
  if ((uVar2 & 0xffc0) != 0) {
    do {
      if ((uint)(uVar2 >> 6) == (int)(short)uVar3) break;
      /* Was called with no argument (also true at ~30 other call sites
         throughout this file) -- verified against real ARM disassembly
         (Ghidra, UU.exe) that every one of them DOES set up a real r0
         argument in the compiled binary; Ghidra's decompiler just failed
         to show it, most likely because resolve_object_link's own
         inferred prototype has 0 params. The argument is always the same
         ushort* whose `& 0xffc0` link-bits were just tested (or, for a
         loop's very first iteration, the enclosing function's own object-
         pointer parameter) -- confirmed individually via disassembly for
         a representative sample of these sites (this one, FUN_00052af4,
         roll_object_destroy_chance, sum_container_weight, serialize_inventory_link_chain, FUN_00072598,
         FUN_0007deec, FUN_00080ed4, babl_builtin_take_from_npc_inv), and applied by the
         same pattern to the rest. */
      iVar8 = resolve_object_link(puVar7);
      puVar7 = (ushort *)(iVar8 + 4);
      uVar2 = *puVar7;
    } while ((uVar2 & 0xffc0) != 0);
  }
  if ((*puVar7 & 0xffc0) != 0) {
    object_list_unlink(DAT_00100674 + 6,puVar4);
  }
  iVar8 = (int)(short)uVar5;
  if (iVar8 < 0) {
    DAT_00202c84 = 1;
    place_object_in_world(*(ushort *)((char *)g_player_object + 0x16) >> 7 & 0x1f8,
                 *(ushort *)((char *)g_player_object + 0x16) >> 1 & 0x1f8,*(byte *)((char *)g_player_object + 2) & 0x7f,
                 puVar4,6,1);
    DAT_00202c84 = 0;
LAB_0001818c:
    uVar3 = 1;
  }
  else {
    if ((((0 < iVar8) && (iVar8 < 0x40)) && (iVar1 = (int)(short)uVar6, 0 < iVar1)) &&
       (iVar1 < 0x40)) {
      pbVar9 = (byte *)tilemap_lookup(uVar5,uVar6);
      uVar2 = *(ushort *)(puVar4 + 2);
      puVar4[2] = (byte)(uVar2 & 0xff80) | *pbVar9 >> 1 & 0x78;
      puVar4[3] = (char)((uVar2 & 0xff80) >> 8);
      iVar8 = FUN_00051fa0(CONCAT11(puVar4[1],*puVar4) & 0x1ff,uVar3,(iVar8 << 0x13) >> 0x10,
                           (iVar1 << 0x13) >> 0x10,(ushort)(*pbVar9 >> 4) << 3,1,
                           ((&DAT_00202c91)[(CONCAT11(puVar4[1],*puVar4) & 0x1ff) * 0xd] & 7) + 4);
      if (iVar8 != 0) {
        object_list_append_tail(pbVar9 + 2,puVar4);
        settle_dropped_object(puVar4,uVar5,uVar6,1);
        goto LAB_0001818c;
      }
    }
    uVar3 = 0;
  }
  return uVar3;
}



// was FUN_000181a4
ushort babl_builtin_take_from_npc_inv(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "take_from_npc_inv" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  ushort *puVar2;
  int iVar3;
  int iVar4;
  
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  iVar4 = 0;
  puVar2 = (ushort *)(DAT_00100674 + 6);
  if (0 < sVar1) {
    do {
      if ((*puVar2 & 0xffc0) == 0) break;
      iVar3 = resolve_object_link(puVar2);
      iVar4 = iVar4 + 1;
      puVar2 = (ushort *)(iVar3 + 4);
    } while (iVar4 * 0x10000 >> 0x10 < (int)sVar1);
  }
  return *puVar2 >> 6;
}



// was FUN_00018230
void babl_builtin_add_to_npc_inv(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "add_to_npc_inv" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  undefined4 uVar1;

  FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar1 = FUN_000535fc();
  object_list_append_tail(DAT_00100674 + 6,uVar1);
  return;
}




// was FUN_000182b4
void babl_builtin_set_quest(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "set_quest" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;
  uint uVar3;
  
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_builtin_set_quest: idx=%d value=%d\n", (int)sVar1, (int)sVar2);
  uVar3 = (uint)sVar1;
  if (-1 < (int)uVar3) {
    if ((int)uVar3 < 0x20) {
      if (sVar2 == 0) {
        uVar3 = *(uint *)(DAT_00086df8 + 0x65) & ~(1 << (uVar3 & 0xff));
      }
      else {
        uVar3 = *(uint *)(DAT_00086df8 + 0x65) | 1 << (uVar3 & 0xff);
      }
      *(char *)(DAT_00086df8 + 0x65) = (char)uVar3;
      *(char *)(DAT_00086df8 + 0x66) = (char)(uVar3 >> 8);
      *(char *)(DAT_00086df8 + 0x67) = (char)(uVar3 >> 0x10);
      *(char *)(DAT_00086df8 + 0x68) = (char)(uVar3 >> 0x18);
    }
    else if ((int)uVar3 < 0x24) {
      *(char *)(uVar3 + DAT_00086df8 + 0x49) = (char)sVar2;
    }
  }
  return;
}



// was FUN_00018370
undefined1 babl_builtin_get_quest(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "get_quest" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  int iVar1;
  short sVar2;
  
  sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  iVar1 = (int)sVar2;
  if (-1 < iVar1) {
    if (0x1f < iVar1) {
      if (0x23 < iVar1) {
        if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_builtin_get_quest: idx=%d -> %d (clamp-high)\n", iVar1, (int)*(undefined1 *)(DAT_00086df8 + 0x6d));
        return *(undefined1 *)(DAT_00086df8 + 0x6d);
      }
      if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_builtin_get_quest: idx=%d -> %d (byte-value slot)\n", iVar1, (int)*(undefined1 *)(iVar1 + DAT_00086df8 + 0x49));
      return *(undefined1 *)(iVar1 + DAT_00086df8 + 0x49);
    }
    sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
    if ((*(uint *)(DAT_00086df8 + 0x65) & 1 << ((int)sVar2 & 0xffU)) != 0) {
      if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_builtin_get_quest: idx=%d -> 1 (flag bit set)\n", iVar1);
      return 1;
    }
  }
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_builtin_get_quest: idx=%d -> 0\n", iVar1);
  return 0;
}



// was FUN_00018430
undefined4 babl_builtin_gronk_door(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "gronk_door" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  undefined2 uVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *local_24;   /* was int -- holds tilemap_lookup()+2, a 64-bit ptr */

  uVar4 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  uVar5 = FUN_0001adc4((int)*(short *)(param_1 + -6));
  local_24 = (ushort *)((char *)tilemap_lookup(uVar5,uVar4) + 2);
  iVar6 = FUN_000537d0(&local_24,0,5,0,0xffff);
  if ((iVar6 == 0) && (iVar6 = FUN_000537d0(&local_24,0,7,0,0xf), iVar6 == 0)) {
    uVar4 = 0;
  }
  else {
    uVar2 = DAT_002020a4;
    uVar1 = DAT_002020a0;
    DAT_002020a0 = FUN_0001adc4((int)*(short *)(param_1 + -6));
    DAT_002020a4 = FUN_0001adc4((int)*(short *)(param_1 + -4));
    sVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
    if (sVar3 == 0) {
      FUN_0007c580(0,iVar6);
    }
    else if (sVar3 == 1) {
      FUN_0007c708(iVar6);
    }
    else if (sVar3 == 2) {
      FUN_0007c814(0,iVar6);
    }
    uVar4 = 1;
    DAT_002020a0 = uVar1;
    DAT_002020a4 = uVar2;
  }
  return uVar4;
}



// was FUN_0001853c
void babl_builtin_x_obj_stuff(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "x_obj_stuff" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  short *psVar4;
  ushort *puVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  short *psVar9;
  ushort *puVar10;
  ushort *puVar11;
  uint uVar12;
  
  psVar4 = (short *)FUN_0001ada8((int)*(short *)(param_1 + -0xe));
  puVar5 = (ushort *)FUN_0001ada8((int)*(short *)(param_1 + -0xc));
  psVar6 = (short *)FUN_0001ada8((int)*(short *)(param_1 + -10));
  psVar7 = (short *)FUN_0001ada8((int)*(short *)(param_1 + -8));
  psVar8 = (short *)FUN_0001ada8((int)*(short *)(param_1 + -6));
  psVar9 = (short *)FUN_0001ada8((int)*(short *)(param_1 + -4));
  puVar10 = (ushort *)FUN_0001ada8((int)*(short *)(param_1 + -2));
  FUN_0001adc4((int)*(short *)(param_1 + -0x12));
  puVar11 = (ushort *)FUN_000535fc();
  sVar3 = FUN_0001adc4((int)*(short *)(param_1 + -0x10));
  if (sVar3 == 0) {
    if (((*psVar4 != -1) && ((*puVar11 & 0x1c0) != 0x140)) &&
       (((&DAT_00202c9a)[(*puVar11 & 0x1ff) * 0xd] & 3) != 2)) {
      *psVar4 = (short)((puVar11[1] & 0x380) >> 7);
    }
    if (*puVar5 != 0xffff) {
      *puVar5 = (byte)puVar11[3] & 0x3f;
    }
    if (*psVar6 != -1) {
      *psVar6 = (short)((*(byte *)((char *)puVar11 + 1) & 0x1e) >> 1);
    }
    if (*psVar7 != -1) {
      *psVar7 = (short)((puVar11[3] & 0x7fc0) >> 6);
    }
    if (*psVar8 != -1) {
      *psVar8 = ((short)*(char *)((char *)puVar11 + 1) & 4U) << 8;
    }
    if (*psVar9 != -1) {
      *psVar9 = ((short)*(char *)((char *)puVar11 + 1) & 2U) << 8;
    }
    if (*puVar10 != 0xffff) {
      *puVar10 = (byte)puVar11[2] & 0x3f;
    }
  }
  else {
    if ((((int)*psVar4 != 0xffffffff) && ((*puVar11 & 0x1c0) != 0x140)) &&
       (((&DAT_00202c9a)[(*puVar11 & 0x1ff) * 0xd] & 3) != 2)) {
      uVar12 = puVar11[1] & 0xfc7f | ((int)*psVar4 & 7U) << 7;
      *(char *)(puVar11 + 1) = (char)uVar12;
      *(char *)((char *)puVar11 + 3) = (char)(uVar12 >> 8);
    }
    if (*puVar5 != 0xffff) {
      uVar1 = puVar11[3];
      bVar2 = (byte)uVar1;
      *(byte *)(puVar11 + 3) = (bVar2 ^ (byte)*puVar5) & 0x3f ^ bVar2;
      *(char *)((char *)puVar11 + 7) = (char)(uVar1 >> 8);
    }
    sVar3 = *psVar6;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = *puVar11;
      *(char *)puVar11 = (char)(uVar1 & 0xe1ff);
      *(byte *)((char *)puVar11 + 1) =
           (byte)((uVar1 & 0xe1ff) >> 8) | (byte)((((int)sVar3 & 0xfU) << 9) >> 8);
    }
    uVar12 = (uint)*psVar7;
    if (uVar12 != 0xffffffff) {
      *(byte *)(puVar11 + 3) = (byte)puVar11[3] & 0x3f | (byte)(uVar12 << 6);
      *(char *)((char *)puVar11 + 7) = (char)((uVar12 & 0x3ffffff | 0xfe00) >> 2);
    }
    sVar3 = *psVar8;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = *puVar11;
      *(char *)puVar11 = (char)(uVar1 & 0xfbff);
      *(byte *)((char *)puVar11 + 1) =
           (byte)((uVar1 & 0xfbff) >> 8) | (byte)((((int)sVar3 & 1U) << 10) >> 8);
    }
    sVar3 = *psVar9;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = *puVar11;
      *(char *)puVar11 = (char)(uVar1 & 0xfdff);
      *(byte *)((char *)puVar11 + 1) =
           (byte)((uVar1 & 0xfdff) >> 8) | (byte)((((int)sVar3 & 1U) << 9) >> 8);
    }
    if (*puVar10 != 0xffff) {
      uVar1 = puVar11[2];
      bVar2 = (byte)uVar1;
      *(byte *)(puVar11 + 2) = (bVar2 ^ (byte)*puVar10) & 0x3f ^ bVar2;
      *(char *)((char *)puVar11 + 5) = (char)(uVar1 >> 8);
    }
  }
  return;
}



// was FUN_000188fc
void babl_builtin_x_obj_pos(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "x_obj_pos" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  ushort *puVar2;
  short *psVar3;
  ushort *puVar4;
  int iVar5;
  byte *pbVar6;
  uint uVar7;
  ushort uVar8;
  
  puVar2 = (ushort *)FUN_0001ada8((int)*(short *)(param_1 + -6));
  psVar3 = (short *)FUN_0001ada8((int)*(short *)(param_1 + -4));
  puVar4 = (ushort *)FUN_0001ada8((int)*(short *)(param_1 + -2));
  FUN_0001adc4((int)*(short *)(param_1 + -10));
  iVar5 = FUN_000535fc();
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -8));
  if (sVar1 == 0) {
    if (*puVar2 != 0xffff) {
      *puVar2 = (ushort)(*(byte *)(iVar5 + 3) >> 5);
    }
    if (*psVar3 != -1) {
      *psVar3 = (short)((*(byte *)(iVar5 + 3) & 0x1c) >> 2);
    }
    if (*puVar4 != 0xffff) {
      *puVar4 = *(byte *)(iVar5 + 2) & 0x7f;
    }
  }
  else {
    uVar8 = *puVar2;
    if (uVar8 != 0xffff) {
      uVar7 = *(ushort *)(iVar5 + 2) & 0x1fff;
      *(char *)(iVar5 + 2) = (char)uVar7;
      *(byte *)(iVar5 + 3) = (byte)(uVar7 >> 8) | (byte)(((uVar8 & 7) << 0xd) >> 8);
    }
    sVar1 = *psVar3;
    if ((int)sVar1 != 0xffffffff) {
      uVar7 = *(ushort *)(iVar5 + 2) & 0xe3ff;
      *(char *)(iVar5 + 2) = (char)uVar7;
      *(byte *)(iVar5 + 3) = (byte)(uVar7 >> 8) | (byte)((((int)sVar1 & 7U) << 10) >> 8);
    }
    uVar8 = *puVar4;
    if (uVar8 != 0xffff) {
      if ((short)uVar8 < 0x80) {
        uVar8 = (uVar8 ^ *(ushort *)(iVar5 + 2)) & 0x7f ^ *(ushort *)(iVar5 + 2);
      }
      else {
        pbVar6 = (byte *)tilemap_lookup((int)(short)*puVar2,(int)*psVar3);
        uVar8 = *pbVar6 >> 1 & 0x78 | *(ushort *)(iVar5 + 2) & 0xff80;
      }
      *(char *)(iVar5 + 2) = (char)uVar8;
      *(char *)(iVar5 + 3) = (char)(uVar8 >> 8);
    }
  }
  return;
}



uint *babl_alloc(param_1)
int param_1;

/* HACK: this whole function was a hand-rolled, fixed-pool free-list
   allocator whose "next free block" links are packed as 4 INDIVIDUAL
   BYTES within the block header (see the CONCAT13/CONCAT12/CONCAT11
   reconstructions the original body did, and the matching byte-at-a-
   time writes in babl_free/babl_resize) -- a 32-bit-pointer-only
   design baked into the original 32-bit ARM binary's own memory
   layout. There is no width to widen here the way DAT_000bbf70 and
   friends were fixed elsewhere in this same babl-VM cluster: a real
   64-bit pointer simply does not fit in the 4 bytes this format
   allocates for one. This whole subsystem was apparently never
   exercised end-to-end before (no NPC's conversation had ever
   successfully loaded in this port until the read_archive_entry
   dropped-argument fix a few commits up), so nothing depended on its
   exact original behavior surviving intact. Replaced with the host's
   real allocator -- see babl_free/babl_resize's own comments for
   the matching free()/no-op halves. DAT_000bbf04 (the original
   allocator's free-list head) is now unused by this trio; left
   declared since FUN_00019660 (uw.c ~11090, an unrelated scratch-
   buffer setup that happens to reuse the same global address in the
   original binary) still writes to it. */
{
  return (uint *)malloc((size_t)param_1);
}



void babl_free(param_1)
intptr_t param_1;
/* HACK: matching replacement for babl_alloc -- see its own comment.
   The original body validated a packed 32-bit-only free-list header
   (`puVar2[(*(ushort*)puVar2>>2)-1]==puVar2 && *(uint**)(param_1-4)
   ==puVar2`) before touching anything, which doubled as a "is this
   really one of my blocks" sanity check; real free() has no equivalent
   for a non-malloc'd pointer, so every caller of this function needs
   to actually pass a real babl_alloc()/malloc() pointer now (true
   for every site fixed as part of this same investigation -- see
   load_npc_conversation_record's `local_28` and this file's other babl-VM pointer-
   width fixes). param_1==0 is the one case the original's own
   validation would always reject (NULL fails the header check), so
   guard it the same way here. */

{
  if (param_1 != 0) {
    free((void *)param_1);
  }
  return;
}



intptr_t babl_resize(param_1,param_2)
intptr_t param_1;
int param_2;

/* HACK: matching replacement for babl_alloc/babl_free -- see
   their own comments. The original body was a "shrink this block in
   place, splitting the freed tail back into the free list (or grow it
   via a fresh alloc+free if it doesn't fit)" optimization, reading/
   writing the same packed 32-bit-only free-list header format at a
   fixed offset behind param_1 -- meaningless (reads whatever real
   malloc's own private bookkeeping or adjacent heap bytes happen to
   be there) once babl_alloc hands out a real malloc() pointer with
   no such header. Its own only call site (uw.c, babl string-buffer
   trimming) ignores the return value entirely and keeps using its own
   already-held pointer afterward, so shrinking was purely a "return
   the excess memory to the pool" optimization, not something the
   caller's correctness depends on -- a real `realloc()` here would
   risk moving the block out from under that caller's still-live
   pointer for no benefit. No-op: leave the allocation exactly as it
   is and report its address unchanged, safe either way. */
{
  (void)param_2;
  return param_1;
}




void load_npc_conversation_variables(param_1,param_2)
intptr_t param_1; // was `undefined4` -- truncated the real 64-bit DAT_000bbf14 pointer its own caller passes (load_npc_conversation_record); dormant (silently never reached the write) until the scan-alignment fix in this same function let execution actually get to FUN_0002285c(iVar4,param_1,...) below, which then crashed writing through the truncated address
short param_2;

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  bool bVar2;
  char *pcVar3;
  int iVar4;
  uint uVar5;
  /* Same "two separate stack locals read as one 4-byte record" bug as
     save_npc_conversation_variables's own matching comment (its save-side mirror) -- see
     there for the full explanation. This is the load side: local_122
     (the record's LENGTH) was silently corrupted by whatever this
     compiler's own stack layout happens to place after local_124 (the
     ID), feeding a garbage skip-distance into FUN_00022850's seek and
     misaligning every subsequent scan iteration. */
  undefined1 local_124_backing[4];
  #define local_124 (*(short *)(local_124_backing + 0))
  #define local_122 (*(short *)(local_124_backing + 2))
  char acStack_11c [260];

  pcVar3 = &DAT_0023cca8;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_11c,s__SAVE0_bglobals_dat_00084538);
  iVar4 = FUN_000227d4(acStack_11c);
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] load_npc_conversation_variables: open %s -> handle=%d, wanted conv-id(DAT_001007c4)=%d, want %d shorts\n", acStack_11c, iVar4, (int)DAT_001007c4, (int)param_2);
  if (iVar4 != -1) {
    bVar2 = false;
    do {
      uVar5 = FUN_0002285c(iVar4,local_124_backing,4);
      if ((uVar5 < 4) || ((int)(uint)DAT_001007c4 < (int)local_124)) {
        if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] load_npc_conversation_variables: scan stopped, uVar5=%u local_124=%d (no matching record found)\n", uVar5, (int)local_124);
        break;
      }
      if ((int)local_124 == (uint)DAT_001007c4) {
        if (param_2 < local_122) {
          local_122 = param_2;
        }
        uVar5 = FUN_0002285c(iVar4,param_1,(int)local_122 << 1);
        if (uVar5 < (uint)((int)local_122 << 1)) {
          bVar2 = true;
        }
        if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] load_npc_conversation_variables: MATCH id=%d, restored %u bytes (wanted %d), first 10 shorts: %d %d %d %d %d %d %d %d %d %d\n",
                (int)local_124, uVar5, (int)local_122 << 1,
                (int)((short*)param_1)[0], (int)((short*)param_1)[1], (int)((short*)param_1)[2], (int)((short*)param_1)[3], (int)((short*)param_1)[4],
                (int)((short*)param_1)[5], (int)((short*)param_1)[6], (int)((short*)param_1)[7], (int)((short*)param_1)[8], (int)((short*)param_1)[9]);
      }
      else {
        FUN_00022850(iVar4,(int)local_122 << 1,1);
      }
    } while (!bVar2);
    Ordinal_553(iVar4);
  }
  #undef local_124
  #undef local_122
  return;
}




// was FUN_000196c0
int babl_builtin_random(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "random" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;

  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  sVar1 = rand_below((int)sVar1);
  return sVar1 + 1;
}



// was FUN_000196e8
bool babl_builtin_compare(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "compare" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  char cVar1;
  short sVar2;
  int iVar1;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  char acStack_218 [256];
  char acStack_118 [256];

  /* Was 4 dropped register-forwarding args (Ghidra faithfully preserved
     the original ARM code relying on a value staying in r0 across
     back-to-back `bl`s with no reload -- confirmed real elsewhere this
     session, e.g. FUN_00019470's own comment) -- but this whole babl
     conversation-VM cluster was never exercised until this session's
     other fixes let it actually run, and a recompiled-for-this-host
     call written as `()` in C loads no argument at all, so each of
     these read whatever garbage happened to be in the register instead.
     Chained explicitly. */
  iVar1 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  pcVar3 = (char *)FUN_0007863c(iVar1);
  pcVar4 = (char *)babl_expand_string_refs(pcVar3);
  iVar1 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  pcVar5 = (char *)FUN_0007863c(iVar1);
  pcVar6 = (char *)babl_expand_string_refs(pcVar5);
  pcVar7 = pcVar6;
  do {
    cVar1 = *pcVar7;
    pcVar7[(int)(acStack_118 + -(int)pcVar6)] = cVar1;
    pcVar7 = pcVar7 + 1;
  } while (cVar1 != '\0');
  pcVar7 = pcVar4;
  do {
    cVar1 = *pcVar7;
    pcVar7[(int)(acStack_218 + -(int)pcVar4)] = cVar1;
    pcVar7 = pcVar7 + 1;
  } while (cVar1 != '\0');
  Ordinal_1415(acStack_118);
  Ordinal_1415(acStack_218);
  sVar2 = Ordinal_1065(acStack_118,acStack_218);
  if (pcVar5 != pcVar6) {
    babl_free(pcVar6);
  }
  if (pcVar3 != pcVar4) {
    babl_free(pcVar4);
  }
  return sVar2 == 0;
}



// was FUN_000197c0
undefined4 babl_builtin_plural(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "plural" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -6));
  uVar2 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  uVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  if (sVar1 < 2) {
    uVar3 = uVar2;
  }
  return uVar3;
}



// was FUN_000197fc
undefined4 babl_builtin_contains(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "contains" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  /* uVar1/iVar2/uVar3/uVar4/iVar5/iVar7 were `undefined4`/`int` (4 bytes)
     but hold real string pointers from FUN_0007863c/babl_expand_string_refs/
     Ordinal_1072 (iVar5 doubly so -- reused below as `iVar5 = iVar2`
     then in pointer arithmetic `iVar5 = iVar5 + iVar7`) -- truncated a
     real 64-bit pointer on assignment even with each call's own
     argument now fixed. Widened to intptr_t; see DAT_000bbf70's own
     comment for the same fix elsewhere in this cluster. */
  intptr_t uVar1;
  intptr_t iVar2;
  intptr_t uVar3;
  intptr_t uVar4;
  intptr_t iVar5;
  int iVar6;
  intptr_t iVar7;

  /* Was 4 dropped register-forwarding args -- same class as babl_builtin_compare's
     own comment (uw.c ~10977). Chained explicitly. */
  iVar5 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar1 = (intptr_t)FUN_0007863c((int)iVar5);
  iVar2 = (intptr_t)babl_expand_string_refs((char *)uVar1);
  iVar5 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  uVar3 = (intptr_t)FUN_0007863c((int)iVar5);
  uVar4 = (intptr_t)babl_expand_string_refs((char *)uVar3);
  Ordinal_1415(uVar3);
  Ordinal_1415(uVar1);
  iVar5 = iVar2;
  do {
    iVar7 = Ordinal_1072(iVar5,uVar4);
    if (iVar7 == 0) {
      return 0;
    }
    iVar5 = Ordinal_1068(uVar4);
    if ((iVar7 != 0) &&
       (((iVar7 == iVar2 || (iVar6 = Ordinal_1417((int)*(char *)(iVar7 + -1),8), iVar6 != 0)) ||
        (iVar6 = Ordinal_1417((int)*(char *)(iVar7 + -1),0x10), iVar6 != 0)))) {
      iVar6 = (int)*(char *)(iVar5 + iVar7);
      if (((iVar6 == 0) || (iVar6 = Ordinal_1417(iVar6,8), iVar6 != 0)) ||
         (iVar6 = Ordinal_1417((int)*(char *)(iVar5 + iVar7),0x10), iVar6 != 0)) {
        return 1;
      }
    }
    iVar5 = iVar5 + iVar7;
  } while( true );
}



// was FUN_000198e8
void babl_builtin_append(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "append" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  
  /* Was 4 dropped register-forwarding args (2x FUN_0007863c, 2x
     Ordinal_1068) -- same class as babl_builtin_compare's own comment
     (uw.c ~10977). Chained explicitly: the first Ordinal_1068() forwards
     pcVar3 (the string just resolved right above it), matching the
     very next line's own explicit `Ordinal_1068(pcVar2)` call. */
  iVar6 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  pcVar2 = (char *)FUN_0007863c(iVar6);
  iVar6 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  pcVar3 = (char *)FUN_0007863c(iVar6);
  uVar4 = Ordinal_1068(pcVar3);
  uVar5 = Ordinal_1068(pcVar2);
  iVar6 = babl_alloc((int)(((uVar4 & 0xffff) + (uVar5 & 0xffff) + 1) * 0x10000) >> 0x10);
  iVar7 = iVar6 - (int)pcVar3;
  do {
    cVar1 = *pcVar3;
    pcVar3[iVar7] = cVar1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar7 = (int)(short)uVar4 - (int)pcVar2;
  do {
    cVar1 = *pcVar2;
    pcVar2[iVar7 + iVar6] = cVar1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_0007873c(iVar6,0x7c);
  return;
}



// was FUN_0001998c
void babl_builtin_copy(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this unnamed builtin, registered under &DAT_00084574, was simply never exercised deep enough to crash/misbehave visibly yet)
{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  
  /* Was 3 dropped register-forwarding args -- same class as
     babl_builtin_compare's own comment (uw.c ~10977). */
  iVar4 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  pcVar2 = (char *)FUN_0007863c(iVar4);
  iVar3 = Ordinal_1068(pcVar2);
  iVar3 = babl_alloc(iVar3 + 1);
  iVar4 = iVar3 - (int)pcVar2;
  do {
    cVar1 = *pcVar2;
    pcVar2[iVar4] = cVar1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  FUN_0007873c(iVar3,0x7c);
  return;
}



// was FUN_000199d4
int babl_builtin_find(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "find" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  int iVar5;
  
  sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  sVar3 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  sVar1 = *(short *)(param_1 + -6);
  iVar5 = 0;
  if (0 < sVar3) {
    do {
      sVar4 = FUN_0001adc4((sVar1 + iVar5) * 0x10000 >> 0x10);
      if (sVar2 == sVar4) {
        return iVar5 + 1;
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < sVar3);
  }
  return 0;
}



// was FUN_00019a80
int babl_builtin_val(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "val" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  int iVar2;
  char *pcVar3;

  /* Was 3 dropped register-forwarding args -- same class as
     babl_builtin_compare's own comment (uw.c ~10977). */
  iVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  pcVar3 = (char *)FUN_0007863c(iVar2);
  sVar1 = Ordinal_993(pcVar3);
  return (int)sVar1;
}



char *babl_expand_string_refs(param_1)
char * param_1;

{
  char cVar1;
  char cVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  int iVar6;
  char *pcVar7;
  char *pcVar8;
  char *pcVar9;
  char *pcVar10;
  char *pcVar11;
  char cVar12;
  char *local_38 [2];
  char local_30 [20];
  /* Was `undefined4 babl_expand_string_refs` with a single `return 0;` at the very
     end -- always NULL regardless of what this function actually
     computed. Every one of its ~15 callers throughout this file treats
     the return as the resolved (possibly newly babl_alloc'd) string
     pointer, e.g. comparing it against their own input pointer to
     decide whether to babl_free it -- this is the null-deref crash in
     bug-critter-talk.txt (a real conversation with an "@SS1"-style
     template substitution, confirmed live via lldb: param_1 was
     Bragit's actual greeting text). Retyped to `char *` and given a
     real return: the substituted buffer (pcVar7) when Ordinal_1064
     found a '@' to expand, else param_1 unchanged -- the same
     "same pointer back = nothing to free" contract already assumed at
     every call site. */
  char *pcVar_result;

  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] expand_string_refs(\"%s\")\n", param_1 ? param_1 : "(null)");
  pcVar_result = param_1;
  iVar6 = Ordinal_1064(param_1,0x40);
  if (iVar6 != 0) {
    iVar6 = Ordinal_1068(param_1);
    pcVar7 = (char *)babl_alloc((iVar6 + 0x40) * 2);
    cVar1 = *param_1;
    pcVar11 = pcVar7;
    local_38[0] = param_1;
    while (cVar1 != '\0') {
      if (*local_38[0] == '@') {
        cVar1 = local_38[0][1];
        if (cVar1 == '@') {
          *pcVar11 = '@';
          local_38[0] = local_38[0] + 1;
          goto LAB_00019cc0;
        }
        pcVar9 = local_38[0] + 2;
        if (cVar1 == 'C') {
          cVar12 = 'I';
        }
        else {
          cVar12 = *pcVar9;
          pcVar9 = local_38[0] + 3;
        }
        local_38[0] = pcVar9;
        Ordinal_1071(local_30,pcVar9,0x13);
        sVar3 = Ordinal_993(local_30);
        while ((*local_38[0] != 0 &&
               ((iVar6 = Ordinal_1417((int)*local_38[0],4), iVar6 != 0 || (*local_38[0] == '-')))))
        {
          local_38[0] = local_38[0] + 1;
        }
        cVar2 = *local_38[0];
        if (((cVar2 == 'G') || (cVar2 == 'S')) || (cVar2 == 'P' || cVar2 == 'C')) {
          sVar4 = FUN_00019d00(local_38);
          sVar4 = sVar4 + -1;
        }
        else {
          sVar4 = 0;
        }
        sVar5 = sVar4;
        if (cVar1 == 'G') {
LAB_00019bc8:
          sVar3 = FUN_0001adc4(((int)sVar5 + (int)sVar3) * 0x10000 >> 0x10);
        }
        else {
          if (cVar1 == 'P') {
            sVar5 = FUN_0001ae04((int)sVar3);
            sVar3 = sVar4;
            goto LAB_00019bc8;
          }
          if (cVar1 == 'S') {
            sVar3 = FUN_0001ae04(((int)sVar4 + (int)sVar3) * 0x10000 >> 0x10);
          }
        }
        if (cVar12 == 'I') {
          FUN_000229e0((int)sVar3,local_30,10);
          pcVar9 = local_30;
          do {
            cVar1 = *pcVar9;
            pcVar9[(int)pcVar11 - (int)local_30] = cVar1;
            pcVar9 = pcVar9 + 1;
          } while (cVar1 != '\0');
        }
        else {
          /* Was a dropped argument -- Ghidra's own P-code analysis of
             the real binary shows no register load before this `bl`
             either, confirming it's genuine register-forwarding, not
             just this file's own decompile simplifying it away. sVar3
             (just resolved by the FUN_0001adc4/FUN_0001ae04 calls
             immediately above, for the 'G'/'P'/'S' cases this branch
             handles) is the only value left sitting in r0 at this
             point, and FUN_0007863c's signature elsewhere (a message/
             string-table-index -> char* resolver, e.g. its 0xe01 "You
             get no response" callers) matches passing exactly that. */
          pcVar9 = (char *)FUN_0007863c(sVar3);
          if (pcVar9 != (char *)0x0) {
            pcVar8 = (char *)babl_expand_string_refs(pcVar9);
            pcVar10 = pcVar8;
            do {
              cVar1 = *pcVar10;
              pcVar10[(int)pcVar11 - (int)pcVar8] = cVar1;
              pcVar10 = pcVar10 + 1;
            } while (cVar1 != '\0');
            if (pcVar9 != pcVar8) {
              /* Was a dropped argument (K&R register-forwarding) --
                 now that babl_free is a real free() (see its own
                 comment), passing whatever happened to be left in the
                 argument register is far riskier than under the old
                 hand-rolled allocator's own header-validated free.
                 pcVar9 is unambiguously the intended argument: it's
                 the just-allocated buffer being discarded once its
                 content was copied into the caller's real destination
                 (pcVar8), matching every other "if (x != cached) free
                 x" sibling in this same file. */
              babl_free(pcVar9);
            }
          }
        }
        iVar6 = Ordinal_1068(pcVar7);
        pcVar11 = pcVar7 + iVar6;
      }
      else {
        *pcVar11 = *local_38[0];
LAB_00019cc0:
        pcVar11 = pcVar11 + 1;
        local_38[0] = local_38[0] + 1;
      }
      cVar1 = *local_38[0];
    }
    *pcVar11 = '\0';
    iVar6 = Ordinal_1068(pcVar7);
    babl_resize(pcVar7,iVar6 + 1);
    pcVar_result = pcVar7;
  }
  return pcVar_result;
}




undefined4 build_babl_symbol_table()

{
  /* iVar1/iVar2/iVar3/iVar5/iVar6/iVar7/iVar10/iVar11 were all plain
     `int` -- fine for the small byte-offset/value uses, but iVar10 and
     iVar7 (mid-loop) and iVar5/iVar11 (after the loop) also get
     assigned straight from DAT_000bbf70 (now intptr_t, a real 64-bit
     heap pointer -- see its own comment) or `<offset> + DAT_000bbf70`,
     and were re-truncating it right back down to 32 bits on every one
     of those assignments even after DAT_000bbf70 itself was widened.
     Confirmed live via lldb: the wild write address was exactly
     DAT_000bbf70's real value with its top byte dropped. Widened the
     whole set to intptr_t rather than picking apart which specific
     reuse of each variable is a pointer and which is a plain value --
     intptr_t is exact for the small-value uses too, so this is a safe
     blanket fix for this one function. */
  intptr_t iVar1;
  intptr_t iVar2;
  intptr_t iVar3;
  char cVar4;
  intptr_t iVar5;
  intptr_t iVar6;
  intptr_t iVar7;
  char *pcVar8;
  char *pcVar9;
  intptr_t iVar10;
  intptr_t iVar11;
  bool bVar12;
  char local_64 [64];

  DAT_000bbf10 = *(int *)((char *)DAT_000bbf18 + 4);
  DAT_000bbf18 = (char *)((char *)DAT_000bbf18 + 8);
  DAT_000bbf80 = babl_alloc(DAT_000bbf10 << 1);
  DAT_000bbf8c = *(undefined2 *)DAT_000bbf18;
  DAT_0024cfac = *(undefined2 *)((char *)DAT_000bbf18 + 2);
  DAT_000bbf7c = *(undefined2 *)((char *)DAT_000bbf18 + 4);
  iVar11 = (int)*(short *)((char *)DAT_000bbf18 + 6);
  DAT_000bbf18 = (char *)((char *)DAT_000bbf18 + 8);
  DAT_000bbf24 = 0;
  DAT_000bbf70 = babl_alloc((iVar11 + 1) * 0x20);
  iVar5 = 0;
  if (0 < iVar11) {
    iVar5 = 0;
    do {
      iVar10 = DAT_000bbf70;
      pcVar8 = DAT_000bbf18 + 2;
      iVar7 = (int)(short)((short)*DAT_000bbf18 + DAT_000bbf18[1] * 0x100);
      DAT_000bbf18 = pcVar8;
      Ordinal_1044(local_64,pcVar8,iVar7);
      pcVar8 = pcVar8 + iVar7;
      local_64[iVar7] = '\0';
      iVar7 = ((int)*pcVar8 + pcVar8[1] * 0x100) * 0x10000;
      iVar1 = ((int)pcVar8[2] + pcVar8[3] * 0x100) * 0x10000;
      DAT_000bbf18 = pcVar8 + 8;
      iVar2 = ((int)pcVar8[4] + pcVar8[5] * 0x100) * 0x10000;
      iVar6 = iVar5 * 0x20;
      iVar3 = ((int)pcVar8[6] + pcVar8[7] * 0x100) * 0x10000;
      pcVar9 = (char *)(iVar6 + iVar10);
      pcVar8 = local_64;
      do {
        cVar4 = *pcVar8;
        pcVar8 = pcVar8 + 1;
        *pcVar9 = cVar4;
        pcVar9 = pcVar9 + 1;
      } while (cVar4 != '\0');
      iVar10 = iVar6 + DAT_000bbf70;
      *(char *)(iVar10 + 0x1a) = (char)((uint)iVar7 >> 0x10);
      *(char *)(iVar10 + 0x1b) = (char)((uint)iVar7 >> 0x18);
      iVar7 = iVar6 + DAT_000bbf70;
      *(char *)(iVar7 + 0x18) = (char)((uint)iVar1 >> 0x10);
      *(char *)(iVar7 + 0x19) = (char)((uint)iVar1 >> 0x18);
      iVar7 = iVar6 + DAT_000bbf70;
      *(char *)(iVar7 + 0x1c) = (char)((uint)iVar3 >> 0x10);
      *(char *)(iVar7 + 0x1d) = (char)((uint)iVar3 >> 0x18);
      iVar7 = iVar6 + DAT_000bbf70;
      *(char *)(iVar7 + 0x1e) = (char)((uint)iVar2 >> 0x10);
      *(char *)(iVar7 + 0x1f) = (char)((uint)iVar2 >> 0x18);
      bVar12 = (short)((uint)iVar2 >> 0x10) == 0x111;
      if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] symbol table entry %d: name=\"%s\" type=0x%x isvar=%d\n", (int)iVar5, local_64, (unsigned)((uint)iVar2 >> 0x10), (int)bVar12);
      if (bVar12) {
        iVar6 = (int)DAT_000bbf24;
      }
      if (bVar12) {
        DAT_000bbf24 = (short)iVar6 + 1;
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < iVar11);
  }
  iVar5 = (short)iVar5 * 0x20;
  *(undefined1 *)(iVar5 + DAT_000bbf70) = 0;
  iVar11 = iVar5 + DAT_000bbf70;
  *(undefined1 *)(iVar11 + 0x18) = 0;
  *(undefined1 *)(iVar11 + 0x19) = 0;
  iVar5 = iVar5 + DAT_000bbf70;
  *(undefined1 *)(iVar5 + 0x1a) = 0;
  *(undefined1 *)(iVar5 + 0x1b) = 0;
  /* DAT_000bbf00's slot stride was `* 4` (idx << 2 for the allocation,
     idx * 4 at every reader/writer below) -- a 32-bit-pointer-only design
     baked into the original binary, same bug class as change_game_mode's
     own DAT_00085668/DAT_000856a4 table (see its "0x80, was 0x40" fix).
     Every slot actually holds a real function pointer (8 bytes on this
     port) -- babl_register_builtin's own `*(undefined4*)` store below
     only wrote the low 4 bytes of it, and every other slot's write
     clobbered its next-door neighbor's high 4 bytes. Confirmed live via
     lldb: FUN_0001ab30's builtin-call opcode (uw.c ~12057) read back a
     wild, clearly-not-a-code-address function pointer and crashed --
     this is the reported "any input after Talk opens crashes" bug.
     Widened to `* 8` throughout (allocation and all 5 index sites). */
  if (0 < DAT_000bbf24) {
    DAT_000bbf00 = babl_alloc((int)DAT_000bbf24 << 3);
  }
  if (0 < DAT_000bbf24) {
    iVar5 = 0;
    do {
      *(undefined1 **)(DAT_000bbf00 + iVar5 * 8) = &LAB_0001a120;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < DAT_000bbf24);
  }
  return 1;
}




undefined4 FUN_0001a1c8()

{
  undefined2 uVar1;
  short sVar2;
  short sVar3;
  undefined4 uVar4;
  undefined2 *puVar5;
  int iVar6;
  short *psVar7;
  ushort *puVar8;
  
  DAT_000bbf78 = 0;
  DAT_000bbf2c = 0;
  DAT_000bbf74 = 0;
  if (*DAT_000bbf80 == 0x22) {
    sVar2 = 1;
    do {
      flush_dirty_rect_to_display(1);
      /* Was `DAT_000bbf80 + DAT_000bbf74` (byte offset) -- DAT_000bbf74 is
         the babl VM's own instruction pointer, counted in 16-bit WORDS
         (every other reader of it against this same DAT_000bbf80 buffer --
         FUN_0001aa0c/FUN_0001ab30, uw.c ~11971/12037 -- does
         `DAT_000bbf80 + DAT_000bbf74 * 2 [+ 2]`). Confirmed live via lldb:
         iteration 0 (DAT_000bbf74==0) happens to read the right word either
         way, but iteration 1 read byte offset 1 instead of word offset 1,
         landing mid-word (value 6656/0x1a00, matching neither operand nor
         any real opcode) and falling into the switch's `default:` (case
         0x26, uw.c ~11650), which sets sVar2=0 and ends the whole VM loop
         immediately -- this is why every NPC conversation this session
         (bug-critter-talk.txt's Bragit, with a real CNV.ARK record) never
         printed a line or showed a menu: the interpreter always aborted
         after its first real instruction, before FUN_00028ffc's menu loop
         or any print builtin ever ran, so control fell straight back to
         change_game_mode(1) (dungeon view) while the conversation frame
         was still on screen -- the reported "dialog area not rendered,
         3D view shown instead" and the crash/black-screen on the next
         click (now routed to ordinary 3D-view input while still in the
         leftover conversation UI). */
      psVar7 = (short *)(DAT_000bbf80 + DAT_000bbf74 * 2);
      if (getenv("UW_DEBUG_OPCODE_TRACE")) fprintf(stderr, "[babl-op] ip=%d opcode=%d operand=%d stack_depth=%d top=%d\n", (int)DAT_000bbf74, (int)*psVar7, (int)psVar7[1], (int)DAT_000bbf78, (int)*(short *)(DAT_000bbf0c + DAT_000bbf78 * 2));
      switch(*psVar7) {
      case 0:
        goto LAB_0001a2d8;
      case 1:
        FUN_0001a5e0();
        break;
      case 2:
        FUN_0001a654();
        break;
      case 3:
        FUN_0001a69c();
        break;
      case 4:
        FUN_0001a6e4();
        break;
      case 5:
        FUN_0001a74c();
        break;
      case 6:
        FUN_0001a7b4();
        break;
      case 7:
        FUN_0001a808();
        break;
      case 8:
        puVar8 = (ushort *)(DAT_000bbf0c + DAT_000bbf78 * 2);
        *puVar8 = (ushort)(*puVar8 == 0);
        break;
      case 9:
        FUN_0001a85c();
        break;
      case 10:
        FUN_0001a8a4();
        break;
      case 0xb:
        FUN_0001a8ec();
        break;
      case 0xc:
        FUN_0001a934();
        break;
      case 0xd:
        FUN_0001a97c();
        break;
      case 0xe:
        FUN_0001a9c4();
        break;
      case 0xf:
        DAT_000bbf74 = psVar7[1];
        goto LAB_0001a5a4;
      case 0x10:
        iVar6 = (int)DAT_000bbf78;
        DAT_000bbf78 = (short)((uint)((iVar6 + -1) * 0x10000) >> 0x10);
        if (*(short *)(DAT_000bbf0c + iVar6 * 2) == 0) goto LAB_0001a3f0;
LAB_0001a3ac:
        DAT_000bbf74 = DAT_000bbf74 + 2;
        goto LAB_0001a5a4;
      case 0x11:
        iVar6 = (int)DAT_000bbf78;
        DAT_000bbf78 = (short)((uint)((iVar6 + -1) * 0x10000) >> 0x10);
        if (*(short *)(DAT_000bbf0c + iVar6 * 2) == 0) goto LAB_0001a3ac;
        goto LAB_0001a3f0;
      case 0x12:
LAB_0001a3f0:
        DAT_000bbf74 = psVar7[1] + DAT_000bbf74 + 1;
        goto LAB_0001a5a4;
      case 0x13:
        FUN_0001aa0c();
        goto LAB_0001a5a4;
      case 0x14:
        FUN_0001ab30();
        goto LAB_0001a5a4;
      case 0x15:
        sVar2 = FUN_0001aa54();
        goto LAB_0001a5a4;
      case 0x16:
        DAT_000bbf78 = DAT_000bbf78 + 1;
        *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) = psVar7[1];
        goto LAB_0001a4f0;
      case 0x17:
        DAT_000bbf78 = DAT_000bbf78 + 1;
        *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) = psVar7[1] + DAT_000bbf84 + DAT_000bbf2c;
LAB_0001a4f0:
        DAT_000bbf74 = DAT_000bbf74 + 2;
        goto LAB_0001a5a4;
      case 0x18:
        DAT_000bbf78 = DAT_000bbf78 + -1;
        goto LAB_0001a2d8;
      case 0x19:
        puVar5 = (undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2);
        uVar1 = *puVar5;
        *puVar5 = puVar5[-1];
        *(undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2 + -2) = uVar1;
        break;
      case 0x1a:
        iVar6 = DAT_000bbf78 + 1;
        DAT_000bbf78 = (short)iVar6;
        sVar3 = DAT_000bbf2c;
        goto LAB_0001a470;
      case 0x1b:
        DAT_000bbf2c = *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
        DAT_000bbf78 = DAT_000bbf78 + -1;
        goto LAB_0001a2d8;
      case 0x1c:
        DAT_000bbf2c = DAT_000bbf78;
        goto LAB_0001a2d8;
      case 0x1d:
        DAT_000bbf78 = DAT_000bbf2c;
        goto LAB_0001a2d8;
      case 0x1e:
        DAT_000bbf78 = *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) + DAT_000bbf78 + -1;
        goto LAB_0001a2d8;
      case 0x1f:
        FUN_0001aa88();
        break;
      case 0x20:
        FUN_0001aaf8();
        break;
      case 0x21:
        FUN_0001aab4();
        break;
      case 0x22:
        goto LAB_0001a2d8;
      case 0x23:
        DAT_000bbf1c = *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
LAB_0001a2d8:
        DAT_000bbf74 = DAT_000bbf74 + 1;
        goto LAB_0001a5a4;
      case 0x24:
        iVar6 = DAT_000bbf78 + 1;
        DAT_000bbf78 = (short)iVar6;
        sVar3 = DAT_000bbf1c;
LAB_0001a470:
        *(short *)(DAT_000bbf0c + (iVar6 * 0x10000 >> 0x10) * 2) = sVar3;
        break;
      case 0x25:
        FUN_0001aba0();
        break;
      case 0x26:
      default:
        sVar2 = 0;
        goto LAB_0001a5a4;
      case 0x27:
        FUN_0001ac48();
        break;
      case 0x28:
        FUN_0001acf8();
        break;
      case 0x29:
        FUN_0001a628();
      }
      DAT_000bbf74 = DAT_000bbf74 + 1;
LAB_0001a5a4:
    } while (sVar2 != 0);
    save_npc_conversation_variables();
    uVar4 = 1;
  }
  else {
    uVar4 = 0xffffffff;
  }
  return uVar4;
}




/* was FUN_0001ae28 -- binds a name (param_1) to a native function pointer
   (param_2) callable from conversation ("babl") scripts. Called ~52
   times, all from conversation-setup functions like FUN_000286cc (see
   sync_conv_vars_from_npc's own comment below), registering intrinsics
   such as "do_judgement", "set_attitude", "take_from_npc_inv",
   "place_object" -- the native-code side of babl's script language. */
void babl_register_builtin(param_1,param_2)
char * param_1;
intptr_t param_2; // was `undefined4` -- every real caller passes a code address (e.g. `&LAB_0002912c`), truncated on 64-bit before it's even stored into DAT_000bbf00 below

{
  short *psVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;

  /* HACK: added `DAT_000bbf70 != 0` -- this whole babl-symbol-table
     cluster (babl_register_builtin/FUN_0001ac48/etc.) uniformly assumes
     DAT_000bbf70 already points at a real, build_babl_symbol_table()-initialized
     record array before touching it. It's declared `int` (not even a
     pointer) and starts at 0; load_npc_conversation_record's own "no CNV.ARK record
     for this NPC" early-return path (uw.c ~10986, itself already
     fixed twice this session -- a dropped message_scroll_print_
     wrapped() argument, then a hardcoded `return 1` that should have
     been that call's own return value) skips the build_babl_symbol_table() call
     that would set it, yet start_npc_conversation's caller-side `sVar1 < 0`
     check (matching real disassembly at 0x28c1c-0x28c20, `bpl` = branch
     on non-negative) still takes its "record found" success branch and
     calls into here regardless -- this is the exact Talk-mode crash in
     bug-critter-talk.txt (talking to an NPC with no conversation,
     EXC_BAD_ACCESS at DAT_000bbf70+0x18 while DAT_000bbf70==0).
     UNRESOLVED: why the real game's equivalent tail read (message_
     scroll_print_wrapped's own return -- see its comment -- ultimately
     `*(short*)(DAT_00250704+0x14)`) would come back genuinely negative
     in the same scenario on real hardware, letting start_npc_conversation's own
     check correctly reject it without this guard, is still an open
     question (this port's own scroll-state field reads back 0 here,
     confirmed live via lldb) -- flagged as a follow-up, not chased
     further. This guard matches what every sibling reader of
     DAT_000bbf70 already assumes ("nonzero == initialized") and is
     the narrowest fix that stops the crash without guessing at that
     deeper field's real semantics. */
  if (DAT_000bbf70 != 0 && *(short *)(DAT_000bbf70 + 0x18) != 0) {
    cVar2 = *param_1;
    pcVar4 = DAT_000bbf70;
    do {
      if ((cVar2 == *pcVar4) && (iVar3 = Ordinal_1065(param_1,pcVar4), iVar3 == 0)) {
        if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] register_builtin: \"%s\" -> table idx %d\n", param_1, (int)*(short *)(pcVar4 + 0x1a));
        *(intptr_t *)(DAT_000bbf00 + *(short *)(pcVar4 + 0x1a) * 8) = param_2; // was `undefined4 ... * 4` -- DAT_000bbf00's own comment (uw.c ~11468)
        return;
      }
      psVar1 = (short *)(pcVar4 + 0x38);
      pcVar4 = pcVar4 + 0x20;
    } while (*psVar1 != 0);
  }
  return;
}



/* was FUN_0001aebc -- looks up a named babl script variable (param_1,
   e.g. "npc_hp") in the variable table at DAT_000bbf70 (0x20-byte
   stride records) and copies param_3 16-bit values from param_2 INTO
   its backing storage (DAT_000bbf14) -- i.e. native code publishing a
   value for the conversation script to read. Called 32 times, always
   right after computing a real object-record field (see
   sync_conv_vars_from_npc). Paired with babl_get_variable for the reverse
   direction. */
void babl_set_variable(param_1,param_2,param_3)
char *param_1;
intptr_t param_2; // was `int` -- every real caller passes a stack pointer (e.g. sync_conv_vars_from_npc's `local_20`), truncated on 64-bit; same bug class as DAT_000bbf70 (crashes at param_2's own dereference, uw.c ~12283)
short param_3;

{
  undefined1 uVar1;
  intptr_t iVar2; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t) right back down, same as FUN_0001b0a4's own fix; this is the crash in bug-critter-talk.txt's own successful-conversation-load path (via sync_conv_vars_from_npc's npc_whoami lookup)
  uint uVar3;
  int iVar4;
  uint uVar5;
  short sVar6;
  undefined1 local_34 [28];

  if (getenv("UW_DEBUG_BABL") && param_1 && strcmp(param_1, "npc_talkedto") == 0) {
    fprintf(stderr, "[babl] babl_set_variable(\"npc_talkedto\", %d)\n", (int)*(short *)param_2);
  }
  sVar6 = 0;
  iVar2 = Ordinal_1068(param_1); // was a dropped arg -- param_1 itself, matching this same function's own explicit `Ordinal_1068(param_1)` call a few lines below
  if (iVar2 != 0) {
    uVar5 = 0;
    do {
      uVar1 = Ordinal_1090((int)*(char *)(uVar5 + param_1));
      local_34[uVar5] = uVar1;
      sVar6 = (short)((uVar5 + 1) * 0x10000 >> 0x10);
      uVar3 = Ordinal_1068(param_1);
      uVar5 = (uint)sVar6;
    } while (uVar5 < uVar3);
  }
  local_34[sVar6] = 0;
  iVar2 = DAT_000bbf70;
  while( true ) {
    /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own
       comment (uw.c ~12260) -- this is the Talk-crash's own next
       crash site once that one's fixed (sync_conv_vars_from_npc's npc_whoami
       lookup, called unconditionally from start_npc_conversation same as the
       babl_menu registrations). */
    if (iVar2 == 0 || *(short *)(iVar2 + 0x18) == 0) {
      return;
    }
    iVar4 = Ordinal_1065(param_1,iVar2);
    if (iVar4 == 0) break;
    iVar2 = iVar2 + 0x20;
  }
  if (param_3 < 1) {
    return;
  }
  if (getenv("UW_DEBUG_BABL") && param_1 && strcmp(param_1, "npc_talkedto") == 0) {
    fprintf(stderr, "[babl] babl_set_variable(\"npc_talkedto\"): resolved DAT_000bbf14 slot base=%d\n", (int)*(short *)(iVar2 + 0x1a));
  }
  iVar4 = 0;
  do {
    if (*(short *)(iVar2 + 0x18) <= iVar4) {
      return;
    }
    *(undefined2 *)(DAT_000bbf14 + (iVar4 + *(short *)(iVar2 + 0x1a)) * 2) =
         *(undefined2 *)(param_2 + iVar4 * 2);
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < param_3);
  return;
}



/* was FUN_0001afe4 -- the mirror of babl_set_variable: looks up a named babl
   script variable in the same DAT_000bbf70 table and copies its current
   value OUT of DAT_000bbf14 into param_2 -- native code reading back
   whatever value the conversation script itself set. Called 14 times,
   always right before writing the result into a real object-record
   field (see sync_conv_vars_to_npc). */
void babl_get_variable(param_1,param_2,param_3)
char *param_1;
intptr_t param_2; // was `int` -- same pointer-truncation bug as babl_set_variable's own param_2 (every real caller passes a stack pointer, e.g. `&local_10`)
short param_3;

{
  int iVar1;
  intptr_t iVar2; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t) right back down, same as FUN_0001b0a4's own fix

  iVar2 = DAT_000bbf70;
  while( true ) {
    /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own
       comment (uw.c ~12260). */
    if (iVar2 == 0 || *(short *)(iVar2 + 0x18) == 0) {
      return;
    }
    iVar1 = Ordinal_1065(param_1,iVar2);
    if (iVar1 == 0) break;
    iVar2 = iVar2 + 0x20;
  }
  if (param_3 < 1) {
    return;
  }
  iVar1 = 0;
  do {
    if (*(short *)(iVar2 + 0x18) <= iVar1) {
      return;
    }
    *(undefined2 *)(param_2 + iVar1 * 2) =
         *(undefined2 *)(DAT_000bbf14 + (iVar1 + *(short *)(iVar2 + 0x1a)) * 2);
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < param_3);
  if (getenv("UW_DEBUG_BABL") && param_1 && strcmp(param_1, "npc_talkedto") == 0) {
    fprintf(stderr, "[babl] babl_get_variable(\"npc_talkedto\") -> %d\n", (int)*(short *)param_2);
  }
  return;
}




// was FUN_0001c57c
undefined4 babl_builtin_do_offer(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "do_offer" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;
  short sVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  bool bVar11;
  
  FUN_0007ec50();
  uVar4 = FUN_0001adc4((int)*(short *)(param_1 + -10));
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -8));
  uVar5 = FUN_0001adc4((int)*(short *)(param_1 + -6));
  uVar6 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  uVar7 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  if (DAT_000bc004 < 0) {
    FUN_0007863c(uVar6);
    FUN_00029708();
    sVar2 = DAT_000bbfb8;
  }
  else {
    iVar8 = FUN_0001c538(&DAT_000bbfd0,&DAT_000bbf98);
    if ((iVar8 == 0) && (iVar8 = FUN_0001c538(&DAT_000bbfe8,&DAT_000bbff0), iVar8 == 0)) {
      sVar2 = FUN_0001cf20(1,&DAT_000bbfd0,&DAT_000bbf98,&DAT_000bbfb0,DAT_000bbfbc);
      sVar3 = FUN_0001cf20(0,&DAT_000bbfe8,&DAT_000bbff0,&DAT_000bbfc8,DAT_000bbfbc);
      iVar8 = (int)sVar3;
      if (iVar8 < 1) {
        sVar2 = 100;
      }
      else {
        sVar2 = Ordinal_2005(iVar8,(sVar2 - iVar8) * 100);
      }
      iVar9 = (int)DAT_000bc024;
      iVar8 = (int)sVar2;
      if (iVar9 <= iVar8) {
        FUN_0007863c(uVar4);
        FUN_00029708();
        FUN_0001c79c(1);
        FUN_0001c85c();
        DAT_000bc008 = 1;
        return 1;
      }
      iVar10 = (int)DAT_000bbfb8;
      if (iVar10 == 0) {
        bVar11 = SBORROW4(iVar8 * 2,iVar9);
        iVar9 = iVar8 * 2 - iVar9;
      }
      else {
        if (iVar8 < iVar10) {
          FUN_0007863c(uVar5);
          FUN_00029708();
          DAT_000bbfb8 = sVar2;
          DAT_000bc004 = DAT_000bc004 + -2;
          return 0;
        }
        iVar10 = (iVar9 - iVar10) * 3;
        if (iVar10 < 0) {
          iVar10 = iVar10 + 1;
        }
        bVar11 = SBORROW4(iVar9 - iVar8,iVar10 >> 1);
        iVar9 = (iVar9 - iVar8) - (iVar10 >> 1);
      }
      if (iVar9 < 0 != bVar11) {
        FUN_0007863c((int)sVar1);
        FUN_00029708();
        DAT_000bc004 = DAT_000bc004 + -1;
      }
    }
    else {
      FUN_0007863c(uVar7);
      FUN_00029708();
      DAT_000bc008 = 0;
      sVar2 = DAT_000bbfb8;
    }
  }
  DAT_000bbfb8 = sVar2;
  return 0;
}




// was FUN_0001ca78
undefined4 babl_builtin_do_demand(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "do_demand" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  byte bVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  uint uVar8;
  undefined4 uVar9;
  int iVar10;
  int iVar11;
  char *iVar12;
  short local_2c;
  short local_2a;
  short local_28;
  
  local_28 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  local_2a = FUN_0001adc4((int)*(short *)(param_1 + -2));
  iVar12 = DAT_00086df8;
  bVar1 = *DAT_00100674;
  if (*(char *)(DAT_0023be74 + 4) == '\0') {
    iVar11 = 1;
  }
  else {
    sVar5 = Ordinal_2005(*(char *)(DAT_0023be74 + 4),
                         ((uint)*(byte *)((char *)g_player_object + 8) - (uint)*(byte *)(DAT_00086df8 + 0x36))
                         * 2);
    iVar11 = sVar5 + 2;
  }
  bVar2 = *(byte *)(iVar12 + 0x5f);
  sVar5 = Ordinal_2005(6,*(undefined1 *)(iVar12 + 0x30));
  bVar3 = *(byte *)(iVar12 + 0x3d);
  sVar6 = FUN_0001cf20(0,&DAT_000bbfe8,&DAT_000bbff0,&DAT_000bbfc8,DAT_000bbfbc);
  uVar8 = (uint)(byte)(&g_monster_max_stats_table)[(*DAT_00100674 & 0x3f) * 0x30];
  if (uVar8 == 0) {
    iVar12 = 1;
  }
  else {
    sVar7 = Ordinal_2005(uVar8,(DAT_00100674[8] - uVar8) * 2);
    iVar12 = sVar7 + 2;
  }
  babl_get_variable(s_npc_attitude_000845f8,&local_2c,1);
  bVar4 = DAT_00100674[0x19];
  if ((bVar4 & 0x40) == 0) {
    iVar10 = 1;
    if (1 < local_2c) {
      iVar10 = 0;
    }
  }
  else {
    iVar10 = -1;
  }
  sVar6 = Ordinal_2005(10,(int)sVar6);
  if (((int)((((byte)(&DAT_001007dd)[(bVar1 & 0x3f) * 0x30] & 0xf) + (int)sVar6 + iVar10 + (int)iVar12) *
            0x10000) >> 0x10 <
       (int)((((bVar2 & 2) >> 1) + (int)sVar5 + (uint)bVar3 + iVar11) * 0x10000) >> 0x10) ||
     ((bVar4 & 0x40) != 0)) {
    FUN_0007863c((int)local_28);
    FUN_00029708();
    FUN_0001c79c(1);
    DAT_000bc008 = 1;
    if (0 < local_2c) {
      local_2c = (short)((uint)((local_2c + -1) * 0x10000) >> 0x10);
      babl_set_variable(s_npc_attitude_000845f8,&local_2c,1);
    }
    uVar9 = 1;
  }
  else {
    FUN_0007863c((int)local_2a);
    FUN_00029708();
    FUN_0001c79c(0);
    FUN_00034ac4(DAT_00100674,5,1);
    uVar9 = 0;
  }
  return uVar9;
}




// was FUN_0001da88
undefined4 babl_builtin_set_likes_dislikes(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "set_likes_dislikes" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  DAT_000bc020 = FUN_0001ada8((int)*(short *)(param_1 + -4));
  DAT_000bc000 = FUN_0001ada8((int)*(short *)(param_1 + -2));
  return 1;
}




void FUN_000286cc()

{
  char cVar1;
  short sVar2;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  undefined2 uVar6;
  char local_44 [40];
  
  FUN_00076508();
  FUN_000735b0(0xd);
  FUN_00073634();
  DAT_00100784 = Ordinal_1041(0x10000);
  Ordinal_1047(DAT_00100784,0,0x10000);
  FUN_00057118();
  set_viewport_clip_rect(0,0,0x13f,199);
  DAT_00100670 = DAT_00100784;
  uVar6 = 2;
  iVar3 = load_gr_resource_entries(s_converse_00084ff4,0,0xffffffff,&LAB_00028688,&LAB_000286a4);
  if (iVar3 != 0) {
    set_draw_color(0xf1);
    rect_fill_or_save_restore(0x2a,1,0xc2,0x2f);
    bitmap_blit_to_framebuffer(0x2b,1,DAT_00100728,9,CONCAT22(uVar6,0x5e),0,0,1);
    bitmap_blit_to_framebuffer(0x8b,1,DAT_00100728,9,0x5e,0,0,1);
    bitmap_blit_to_framebuffer(0x52,10,DAT_0010072c,0x26,0x37,0,0,1);
    bitmap_blit_to_framebuffer(0x8b,10,DAT_0010072c,0x26,0x37,0,0,1);
    bitmap_blit_to_framebuffer(0x2b,10,DAT_00100730,0x26,0x26,0,0,1);
    bitmap_blit_to_framebuffer(0xc3,10,DAT_00100730,0x26,0x26,0,0,1);
    bitmap_blit_to_framebuffer(0x2a,0x31,DAT_00100734,10,0xc0,0,0,1);
    bitmap_blit_to_framebuffer(0x2a,0x7f,DAT_00100738,10,0xc0,0,0,1);
    bitmap_blit_to_framebuffer(0xec,8,DAT_0010073c,0x72,0x54,0,0,1);
    set_draw_color(0xf1);
    FUN_000116dc(0x34,0x30,0xdc);
    DAT_00100678 = g_active_hud_panel;
    g_active_hud_panel = 0;
    DAT_00085c54 = 0;
    FUN_00046414();
    FUN_0003e644();
    DAT_00085c54 = 1;
    FUN_0007f140();
    msg_scroll_panel_reset(0);
    FUN_0007f110();
    msg_scroll_panel_reset(0);
    select_active_font(s_font5x6p_sys_0008430c);
    uVar6 = 2;
    *g_draw_color_index = 0x65;
    *DAT_00084298 = 0x65;
    DAT_00100670 = DAT_00100784;
    iVar3 = load_gr_resource_entries(s_heads_00084fec,
                         (*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * '\x05' +
                         (*(byte *)(DAT_00086df8 + 100) >> 2 & 7),1,&LAB_00028688,&LAB_000286a4);
    if (iVar3 != 0) {
      g_blit_transparent_mode = 1;
      bitmap_blit_to_framebuffer(0xc5,0xc,DAT_00100728,0x22,CONCAT22(uVar6,0x22),0,0,1);
      g_blit_transparent_mode = 0;
      pcVar4 = (char *)FUN_0007863c((int)DAT_00201c74);
      pcVar5 = local_44;
      do {
        cVar1 = *pcVar4;
        pcVar4 = pcVar4 + 1;
        *pcVar5 = cVar1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      draw_text_string(local_44,0x90,3);
      DAT_00100670 = DAT_00100784;
      if (DAT_00100674[0x1a] == 0) {
        uVar6 = 2;
        load_gr_resource_entries(s_genhead_00084fd8,*DAT_00100674 & 0x3f,1,&LAB_00028688,&LAB_000286a4);
      }
      else {
        uVar6 = 2;
        iVar3 = load_gr_resource_entries(s_charhead_00084fe0,DAT_00100674[0x1a] - 1,1,&LAB_00028688,
                             &LAB_000286a4);
        if (iVar3 == 0) {
          uVar6 = 2;
          load_gr_resource_entries(s_genhead_00084fd8,*DAT_00100674 & 0x3f,1,&LAB_00028688,&LAB_000286a4);
        }
      }
      g_blit_transparent_mode = 1;
      bitmap_blit_to_framebuffer(0x2d,0xc,DAT_00100728,0x22,CONCAT22(uVar6,0x22),0,0,1);
      g_blit_transparent_mode = 0;
      sVar2 = FUN_00078b18(local_44,DAT_00100674,0,0);
      if (sVar2 != 0) {
        draw_text_string(local_44,0x30,3);
      }
      DAT_001007c0 = DAT_00100784;
      FUN_0001b474();
      FUN_0007f0e0();
      cursor_show_idle_tick();
      DAT_0023bf0c = 0;
      reset_cursor_confine_rect();
      mode_icon_highlight_off(5);
      g_cursor_mode = 0;
      start_npc_conversation(DAT_00100674[0x1a],*DAT_00100674 & 0x3f);
      change_game_mode(1);
      return;
    }
  }
  FUN_00028bac();
  return;
}




void start_npc_conversation()

{
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  
  sVar1 = load_npc_conversation_record(s__DATA_cnv_ark_00084fc8,DAT_00100784 + 0x400);
  /* Was `if (sVar1 < 0)` alone, matching real disassembly at 0x28c1c-
     0x28c20 (`bpl` = branch to the success/registration branch below
     on sVar1 >= 0) -- but that disassembly-confirmed check isn't
     enough on its own for the Talk-mode crash in bug-critter-talk.txt
     (Bragit has no CNV.ARK conversation record): load_npc_conversation_record's own
     "no record" branch (uw.c ~10986) returns message_scroll_print_
     wrapped()'s own return value (also disassembly-confirmed, no
     `mov r0,#1` before that branch's return), and in THIS port that
     value came back 0 -- non-negative, so `sVar1 < 0` alone still
     takes the success branch below. Chased this two ways before
     landing here: (1) hardcoding a hopeful `return -1` in load_npc_conversation_record
     instead would contradict what the disassembly actually shows, and
     (2) individually NULL-guarding every DAT_000bbf70/DAT_000bbf80-
     reading function this success branch calls into turned into an
     unbounded chase (fixed 5 separate crash sites this way -- see
     babl_register_builtin/FUN_0001ac48/FUN_0001acf8/babl_set_variable/babl_get_variable/
     FUN_0001b0a4's own comments -- before finding a 6th at
     FUN_0001a1c8's DAT_000bbf80 dereference). Whether the real 32-bit
     binary's equivalent register value is reliably negative here (real
     memory garbage that happens to differ from this port's freshly-
     zeroed scratch buffer) is unresolved and flagged as a follow-up,
     not chased further. Gating on DAT_000bbf70 too is the actual fix:
     it's the one flag every function in this success branch already
     agrees means "a real record's symbol table is loaded" (see
     build_babl_symbol_table, only ever called -- and only place that sets it --
     on the genuine record-found path), so checking it here stops the
     whole cluster's crash at its one shared root instead of chasing
     individual dereferences further. */
  if (sVar1 < 0 || DAT_000bbf70 == 0) {
    /* Was two separate calls with message_scroll_print_wrapped()'s arg
       dropped -- same pattern already fixed at load_npc_conversation_record's own
       sVar1<0 branch (uw.c ~10987) and at FUN_00028488's tail (uw.c
       ~19070). This is the specific crash in bug-critter-talk.txt:
       Bragit has no CNV.ARK conversation record (sVar1<0 here is the
       real, correct "You get no response" case, not a bug), but
       printing that message crashed on the dropped argument. */
    message_scroll_print_wrapped(FUN_0007863c(0xe01));
  }
  else {
    babl_register_builtin(s_babl_menu_00085220,&babl_menu); // was &LAB_0002912c, the no-op stub
    babl_register_builtin(s_babl_fmenu_00085214,FUN_00029358);
    babl_register_builtin(DAT_000845a8,FUN_00029708);
    babl_register_builtin(s_respond_000845ac,FUN_0002977c);
    babl_register_builtin(s_get_quest_00085208,babl_builtin_get_quest);
    babl_register_builtin(s_set_quest_000851fc,babl_builtin_set_quest);
    babl_register_builtin(s_sex_000851f8,babl_builtin_sex);
    babl_register_builtin(s_babl_ask_000851ec,FUN_0002990c);
    babl_register_builtin(s_print_000851e4,FUN_00029850);
    babl_register_builtin(s_show_inv_000851d8,babl_builtin_show_inv);
    babl_register_builtin(s_give_to_npc_000851cc,babl_builtin_give_to_npc);
    babl_register_builtin(s_find_inv_000851c0,babl_builtin_find_inv);
    babl_register_builtin(s_take_from_npc_000851b0,&babl_builtin_take_from_npc);
    babl_register_builtin(s_take_id_from_npc_0008519c,&babl_builtin_take_id_from_npc);
    babl_register_builtin(s_identify_inv_0008518c,babl_builtin_identify_inv);
    babl_register_builtin(s_do_offer_00085180,babl_builtin_do_offer);
    babl_register_builtin(s_do_demand_00085174,babl_builtin_do_demand);
    babl_register_builtin(s_do_decline_00085168,&babl_builtin_do_decline);
    babl_register_builtin(s_do_judgement_00085158,FUN_0001cd3c);
    babl_register_builtin(s_end_barter_0008514c,FUN_0001b7c0);
    babl_register_builtin(s_setup_to_barter_0008513c,FUN_0001b288);
    babl_register_builtin(s_pause_00085134,babl_builtin_pause);
    babl_register_builtin(s_set_likes_dislikes_00085120,babl_builtin_set_likes_dislikes);
    babl_register_builtin(s_do_inv_create_00085110,&babl_builtin_do_inv_create);
    babl_register_builtin(s_do_inv_delete_00085100,babl_builtin_do_inv_delete);
    babl_register_builtin(s_check_inv_quality_000850ec,babl_builtin_check_inv_quality);
    babl_register_builtin(s_set_inv_quality_000850dc,babl_builtin_set_inv_quality);
    babl_register_builtin(s_count_inv_000850d0,babl_builtin_count_inv);
    babl_register_builtin(s_gronk_door_000850c4,babl_builtin_gronk_door);
    babl_register_builtin(s_set_attitude_000850b4,babl_builtin_set_attitude);
    babl_register_builtin(s_set_race_attitude_000850a0,babl_builtin_set_race_attitude);
    babl_register_builtin(s_take_from_npc_inv_0008508c,babl_builtin_take_from_npc_inv);
    babl_register_builtin(s_add_to_npc_inv_0008507c,babl_builtin_add_to_npc_inv);
    babl_register_builtin(s_place_object_0008506c,babl_builtin_place_object);
    babl_register_builtin(s_remove_talker_0008505c,FUN_0001825c);
    babl_register_builtin(s_x_skills_00085050,babl_builtin_x_skills);
    babl_register_builtin(s_x_traps_00085048,babl_builtin_x_traps);
    babl_register_builtin(s_x_obj_stuff_0008503c,babl_builtin_x_obj_stuff);
    babl_register_builtin(s_x_obj_pos_00085030,babl_builtin_x_obj_pos);
    babl_register_builtin(s_find_barter_00085024,babl_builtin_find_barter);
    babl_register_builtin(s_find_barter_total_00085010,babl_builtin_find_barter_total);
    babl_register_builtin(s_give_ptr_npc_00085000,babl_builtin_give_ptr_npc);
    sync_conv_vars_from_npc(DAT_00100674);
    DAT_001007b8 = babl_alloc(0xa0);
    if ((*(byte *)(DAT_00100674 + 0xe) & 0x10) == 0) {
      FUN_000798c4();
    }
    /* Debug-only static dump of every string in this NPC's own compiled
       conversation, independent of which branches a live playthrough
       happens to reach -- see bragit-talk-again-investigation. Message
       ids are (page<<9)|subindex (FUN_0007863c's own comment); page 0
       is this just-loaded conversation's own string table. */
    if (getenv("UW_DEBUG_DUMP_CONV_STRINGS")) {
      int _dump_i;
      for (_dump_i = 0; _dump_i < 0x200; _dump_i++) {
        char *_dump_s = FUN_0007863c((ushort)_dump_i);
        if (_dump_s && *_dump_s) {
          fprintf(stderr, "[babl] conv string msgid=%d: \"%s\"\n", _dump_i, _dump_s);
        }
      }
    }
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] start_npc_conversation: about to call FUN_0001a1c8()\n");
    FUN_0001a1c8();
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] start_npc_conversation: FUN_0001a1c8() returned\n");
    uVar3 = 500;
    iVar2 = sync_conv_vars_to_npc(DAT_00100674);
    if ((iVar2 != 0) || (DAT_001007b4 == '\0')) {
      uVar3 = 0;
    }
    /* Debug-only re-seed, no UI involved: directly proves out the
       npc_talkedto persistence fix (bglobals-dat-readonly-handle-fix)
       end-to-end without needing to click the NPC a second time through
       a fragile, animation-position-dependent screen coordinate. Safe
       to call standalone -- sync_conv_vars_from_npc just re-reads the object's
       current fields and re-sets babl variables from them. */
    if (getenv("UW_DEBUG_TALK_TWICE")) {
      fprintf(stderr, "[babl] UW_DEBUG_TALK_TWICE: re-seeding from the same object right after natural conversation end\n");
      sync_conv_vars_from_npc(DAT_00100674);
    }
    /* Debug-only: re-runs the exact same object-pick the mouse position
       already used to start this conversation would produce, RIGHT as
       the conversation ends -- same frame, same g_mouse_x/g_mouse_y, no
       real click or screen coordinate involved at all. Directly tests
       whether the pick/stencil table's slot-to-object mapping is still
       consistent immediately after returning from conversation mode,
       sidestepping both "Bragit wandered" and "click landed mid-
       conversation" timing problems entirely. See QA report: "leaving a
       conversation causes 3d-view object-picking to give incorrect
       results". */
    if (getenv("UW_DEBUG_PICK_TWICE")) {
      ushort *_pick2 = pick_object_under_cursor(2);
      if (_pick2) {
        fprintf(stderr, "[pick-twice] re-pick at same mouse=(%d,%d) right after conversation end -> objid=0x%03x\n",
                (int)g_mouse_x, (int)g_mouse_y, (unsigned)(*_pick2 & 0x1ff));
      } else {
        fprintf(stderr, "[pick-twice] re-pick at same mouse=(%d,%d) right after conversation end -> NULL\n",
                (int)g_mouse_x, (int)g_mouse_y);
      }
    }
    FUN_0007f170(uVar3,0);
  }
  return;
}




/* Was a no-op stub (LAB_0002912c, uw.c ~1693's own comment) -- Ghidra
   never resolved this address into a proper function on this port's
   own earlier decompile pass, so babl_menu (registered under that
   exact script name in start_npc_conversation) silently did nothing.
   Bragit's conversation calls this as its very first action, so no
   dialogue text or menu ever appeared even after the babl VM crash
   fixes made the VM itself run correctly end to end (see
   [[npc-talk-crash-babl-vm-resolved]]).

   Recovered from the real ARM binary
   (/Users/ccuddigan/Projects/UW1/uw-arm/UU.exe, image base 0x10000,
   function at 0x2912c) via Ghidra headless disassembly + decompile --
   it's structurally identical to babl_fmenu just below (FUN_00029358,
   already correctly ported) with the second (filter-list) parameter
   and its `if (sVar4 != 0)` gate removed: babl_menu shows every item
   in its list unconditionally, where babl_fmenu only shows the ones
   whose parallel filter-list entry is nonzero. Confirmed line-for-line
   against the real disassembly; every global/helper this calls
   (DAT_00100790/794/78c/788, DAT_001006d8/100680/1007a0/100770,
   babl_alloc, babl_expand_string_refs, message_scroll_print_wrapped,
   FUN_00028ffc, etc.) is the exact same shared struct/state babl_fmenu
   already uses successfully -- placed here, after babl_fmenu, so those
   are already declared. */
int babl_menu(param_1)
intptr_t param_1; // was `int` -- the real caller (FUN_0001ab30's builtin-call opcode) passes a full 64-bit stack pointer (DAT_000bbf0c + DAT_000bbf78*2), truncated on 64-bit before this function's own `param_1 + -2` dereference; same bug class as babl_set_variable/babl_register_builtin elsewhere in this cluster

{
  char cVar1;
  short sVar2;
  short sVar5;
  undefined4 uVar6;
  /* uVar7/iVar8/iVar9 were `undefined4`/`int` (4 bytes) but hold real
     string pointers from FUN_0007863c/babl_expand_string_refs/
     Ordinal_1068 -- and DAT_001006d8/DAT_00100680 (the per-item raw-
     string / expanded-string caches, both raw byte-array backings
     manually indexed) were stored/read with a `* 4` stride sized for
     32-bit pointers, same bug class as DAT_000bbf00's own fix earlier
     in this cluster. Confirmed live via lldb: this is the crash one
     step past babl_menu's own `param_1` truncation fix. Widened to
     intptr_t and `* 8` throughout (also fixed in babl_fmenu just below
     and its two other readers, FUN_00028ffc/FUN_000295b4). */
  intptr_t uVar7;
  intptr_t iVar8;
  intptr_t iVar9;
  char *pcVar10;
  char *pcVar11;
  int iVar12;
  short sVar13;
  /* Was 4 separate stack locals (`local_c4`, `local_c3`, `local_c2`,
     `acStack_c1[157]`) that the print loop below relies on being laid
     out contiguously in memory (writing local_c3/local_c2 then reading
     the whole thing back starting from `&local_c4`) -- a real
     assumption about THIS FUNCTION's specific stack frame in the
     original 32-bit ARM binary that no C compiler guarantees to
     reproduce (and this one doesn't: confirmed live, the "assembled"
     string read back as just the 1-byte index digit followed
     immediately by a stray NUL, silently dropping the ". " and the
     actual dialogue text -- this is why menu options rendered as bare
     "1"/"2" with no text). Same bug class as this file's many
     "Ghidra split one real buffer into separate globals" fixes, just
     on the stack instead of at file scope. Merged into one real
     160-byte buffer (1 digit + ". " + up to 157 bytes of text). */
  char local_c4 [160];

  sVar13 = 0;
  DAT_00100790 = 1;
  DAT_00100794 = 1;
  sVar2 = *(short *)(param_1 + -2);
  uVar6 = FUN_0001adc4((int)sVar2);
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_menu entry: param_1=%p sVar2(local-slot-idx)=%d DAT_000bbf78(stack-depth)=%d uVar6(first-msgid)=%u\n", (void *)param_1, (int)sVar2, (int)DAT_000bbf78, (unsigned)uVar6);
  iVar12 = 1;
  sVar5 = (short)uVar6;
  while (sVar5 != 0) {
    uVar7 = (intptr_t)FUN_0007863c(uVar6);
    *(intptr_t *)(&DAT_001006d8 + DAT_00100794 * 8) = uVar7;
    iVar8 = (intptr_t)babl_expand_string_refs((char *)uVar7);
    sVar5 = DAT_00100794;
    iVar9 = (int)DAT_00100794;
    *(intptr_t *)(&DAT_00100680 + iVar9 * 8) = iVar8;
    if (iVar8 == *(intptr_t *)(&DAT_001006d8 + iVar9 * 8)) {
      iVar9 = Ordinal_1068(*(intptr_t *)(&DAT_001006d8 + iVar9 * 8));
      pcVar10 = (char *)babl_alloc(iVar9 + 1);
      iVar9 = (int)DAT_00100794;
      *(char **)(&DAT_00100680 + iVar9 * 8) = pcVar10;
      pcVar11 = *(char **)(&DAT_001006d8 + iVar9 * 8);
      do {
        cVar1 = *pcVar11;
        pcVar11 = pcVar11 + 1;
        *pcVar10 = cVar1;
        pcVar10 = pcVar10 + 1;
        sVar5 = DAT_00100794;
      } while (cVar1 != '\0');
    }
    DAT_00100794 = sVar5 + 1;
    *(short *)(&DAT_001007a0 + sVar5 * 2) = (short)uVar6;
    iVar12 = iVar12 + 1;
    uVar6 = FUN_0001adc4(iVar12 + sVar2 + -1);
    sVar5 = (short)uVar6;
  }
  FUN_0007f140();
  msg_scroll_panel_reset(1);
  FUN_0007ec50();
  iVar12 = 0;
  do {
    (&DAT_00100770)[iVar12] = 0xffff;
    iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
  } while (iVar12 < 10);
  iVar12 = 1;
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_menu print-loop: DAT_00100794(item_count)=%d\n", (int)DAT_00100794);
  if (1 < DAT_00100794) {
    do {
      pcVar10 = *(char **)(&DAT_00100680 + iVar12 * 8);
      local_c4[0] = (char)iVar12 + '0';
      local_c4[1] = 0x2e;
      local_c4[2] = 0x20;
      pcVar11 = local_c4 + 3;
      do {
        cVar1 = *pcVar10;
        pcVar10 = pcVar10 + 1;
        *pcVar11 = cVar1;
        pcVar11 = pcVar11 + 1;
      } while (cVar1 != '\0');
      if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] babl_menu item %d text: \"%s\"\n", iVar12, local_c4);
      Ordinal_1063(local_c4,&s_scroll_newline_0008522c);
      sVar5 = message_scroll_print_wrapped(local_c4);
      FUN_0007ec50();
      for (iVar9 = (int)sVar13; iVar9 <= sVar5; iVar9 = (iVar9 + 1) * 0x10000 >> 0x10) {
        (&DAT_00100770)[iVar9] = (short)iVar12;
      }
      iVar12 = (iVar12 + 1) * 0x10000 >> 0x10;
      sVar13 = sVar5 + 1;
    } while (iVar12 < DAT_00100794);
  }
  /* Debug-only regression-test aid: end-to-end verifying npc_talkedto
     persistence (see bglobals-dat-readonly-handle-fix) needs driving a
     conversation all the way to a real "Farewell"/"Bye" exit, but which
     numbered topic reaches one varies conversation to conversation and
     is sometimes randomized turn to turn (confirmed live: the same
     first answer led down different branches on different runs), so
     scripting a fixed key sequence in a demo file is not reliable.
     When set, auto-selects the first item whose text looks like a
     farewell, exactly as if the player had picked it, instead of
     blocking on real input -- lets a demo script reach a natural
     conversation end deterministically for testing. */
  if (getenv("UW_DEBUG_AUTO_FAREWELL") && (1 < DAT_00100794)) {
    int _far_i;
    int _far_pick = 1; /* no farewell offered this turn -- keep the conversation moving */
    /* UW_DEBUG_AUTO_PICK=N overrides the "no farewell offered" default
       away from item 1, to explore branches a rigid "always pick 1"
       playthrough never reaches (e.g. hunting for where a script might
       call get_quest/set_quest) -- clamped into range, never overrides
       an actual farewell match below. */
    { const char *_pick_env = getenv("UW_DEBUG_AUTO_PICK");
      if (_pick_env) {
        int _pick_n = atoi(_pick_env);
        if (_pick_n >= 1 && _pick_n < DAT_00100794) _far_pick = _pick_n;
      }
    }
    for (_far_i = 1; _far_i < DAT_00100794; _far_i = (_far_i + 1) * 0x10000 >> 0x10) {
      char *_far_txt = *(char **)(&DAT_00100680 + _far_i * 8);
      if (_far_txt && (strcasestr(_far_txt, "farewell") || strcasestr(_far_txt, "bye") || strcasestr(_far_txt, "goodbye"))) {
        _far_pick = _far_i;
        break;
      }
    }
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] UW_DEBUG_AUTO_FAREWELL: auto-selecting item %d (\"%s\")\n", _far_pick, *(char **)(&DAT_00100680 + _far_pick * 8));
    FUN_000295b4((short)_far_pick);
    return (int)*(short *)(&DAT_001007a0 + DAT_00100788 * 2);
  }
  FUN_0007f0e0();
  DAT_0010078c = 1;
  DAT_00250718 = 1;
  FUN_00028ffc();
  return (int)*(short *)(&DAT_001007a0 + DAT_00100788 * 2);
}




// was FUN_000298d8
undefined4 babl_builtin_pause(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "pause" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  int iVar1;

  wait_for_click_release(0);
  iVar1 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  FUN_0007f170(iVar1 * 500,0);
  return 1;
}




// was FUN_000299b0
undefined4 babl_builtin_show_inv(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "show_inv" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  short local_24 [4];
  short local_1c [4];
  
  uVar3 = FUN_0001d1c0(local_24,local_1c);
  iVar5 = 0;
  do {
    sVar1 = (short)iVar5;
    if (iVar5 < (short)uVar3) {
      FUN_0001ade4((int)*(short *)(param_1 + -4) + (int)sVar1,(int)local_24[iVar5]);
      sVar2 = *(short *)(param_1 + -2);
      iVar4 = (int)local_1c[iVar5];
    }
    else {
      FUN_0001ade4((int)*(short *)(param_1 + -2) + (int)sVar1,0);
      sVar2 = *(short *)(param_1 + -4);
      iVar4 = 0;
    }
    FUN_0001ade4((int)sVar2 + (int)sVar1,iVar4);
    iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
  } while (iVar5 < 4);
  return uVar3;
}



// was FUN_00029a58
int babl_builtin_find_barter(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "find_barter" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  uint uVar1;
  int iVar2;
  short sVar3;
  short sVar4;
  int iVar5;
  short asStack_10014 [32764];
  short local_1c [4];
  short asStack_14 [4];
  
  sVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  sVar4 = FUN_0001d1c0(local_1c,asStack_14);
  uVar1 = (uint)sVar3;
  iVar2 = (int)sVar4;
  if ((int)uVar1 < 1000) {
    iVar5 = 0;
    if (0 < iVar2) {
      do {
        sVar3 = (short)iVar5;
        if ((int)local_1c[iVar5] == uVar1) {
LAB_00029b4c:
          return (int)asStack_14[sVar3];
        }
        iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
      } while (iVar5 < iVar2);
    }
  }
  else {
    iVar5 = 0;
    if (0 < iVar2) {
      do {
        sVar3 = (short)iVar5;
        if ((((int)local_1c[iVar5] >> 4 & 0xfffffffcU) == (uVar1 - 1000 & 0xfffffffc)) &&
           ((uVar1 & 3) == (int)((int)local_1c[iVar5] & 0x30U) >> 4)) goto LAB_00029b4c;
        iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
      } while (iVar5 < iVar2);
    }
  }
  return 0;
}



// was FUN_00029b60
bool babl_builtin_find_barter_total(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "find_barter_total" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short asStack_1002c [32752];
  short local_4c [8];
  short local_3c [8];
  short local_2c [6];
  
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -8));
  iVar4 = 0;
  iVar6 = 0;
  sVar2 = FUN_0001d1c0(local_4c,local_3c);
  if ((sVar1 < 1000) && (0 < sVar2)) {
    iVar5 = 0;
    do {
      if (local_4c[iVar5] == sVar1) {
        iVar3 = FUN_000535fc((int)local_3c[iVar5]);
        local_2c[(short)iVar4] = local_3c[iVar5];
        if (((*(byte *)(iVar3 + 1) & 0x80) == 0) || ((*(ushort *)(iVar3 + 6) & 0x8000) != 0)) {
          iVar6 = iVar6 + 1;
        }
        else {
          iVar6 = iVar6 + (uint)(*(ushort *)(iVar3 + 6) >> 6);
        }
        iVar4 = ((short)iVar4 + 1) * 0x10000 >> 0x10;
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < sVar2);
  }
  FUN_0001ade4((int)*(short *)(param_1 + -6),iVar4);
  FUN_0001ade4((int)*(short *)(param_1 + -2),iVar6);
  if (0 < (short)iVar4) {
    iVar5 = 0;
    do {
      FUN_0001ade4((int)*(short *)(param_1 + -4) + (int)(short)iVar5,(int)local_2c[iVar5]);
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < (short)iVar4);
  }
  return 0 < (short)iVar6;
}



// was FUN_00029cc8
undefined4 babl_builtin_give_to_npc(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "give_to_npc" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  int iVar1;
  short sVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  short asStack_10044 [32768];
  short local_44 [12];
  undefined1 auStack_2c [8];
  
  sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  sVar3 = FUN_0001d1c0(auStack_2c,local_44 + 8);
  iVar5 = (int)sVar3;
  iVar1 = (int)sVar2;
  if (iVar5 < iVar1) {
LAB_00029e2c:
    uVar4 = 0;
  }
  else {
    local_44[7] = 0xffff;
    iVar7 = 0;
    local_44[6] = 0xffff;
    local_44[5] = 0xffff;
    local_44[4] = 0xffff;
    local_44[3] = 0xffff;
    local_44[2] = 0xffff;
    local_44[1] = 0xffff;
    local_44[0] = -1;
    if (0 < iVar1) {
      do {
        iVar6 = 0;
        if (0 < iVar5) {
          do {
            sVar2 = FUN_0001adc4((int)*(short *)(param_1 + -2) + (int)(short)iVar7);
            if ((local_44[iVar6 + 8] == sVar2) && (local_44[iVar6] == -1)) {
              local_44[iVar7 + 4] = (short)iVar6;
              local_44[(short)iVar6] = (short)iVar7;
              break;
            }
            iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
          } while (iVar6 < iVar5);
        }
        if (local_44[iVar7 + 4] == -1) goto LAB_00029e2c;
        iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      } while (iVar7 < iVar1);
      if (0 < iVar1) {
        iVar5 = 0;
        do {
          FUN_0001adc4((int)*(short *)(param_1 + -2) + (int)(short)iVar5);
          FUN_0001d3ac();
          iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
        } while (iVar5 < iVar1);
      }
    }
    uVar4 = 1;
  }
  return uVar4;
}



// was FUN_00029e34
undefined4 babl_builtin_give_ptr_npc(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "give_ptr_npc" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  undefined4 uVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  short local_1c [4];
  short local_14 [4];
  
  uVar1 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  FUN_0001d1c0(local_1c,local_14);
  iVar2 = 0;
  do {
    if (local_1c[iVar2] != 0) {
      if ((short)uVar1 == local_14[iVar2]) {
        FUN_0001d3ac(uVar1);
        goto LAB_00029f2c;
      }
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 4);
  uVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  iVar2 = FUN_000535fc(uVar1);
  if (-1 < (short)uVar3) {
    if ((*(byte *)(iVar2 + 1) & 0x80) != 0) {
      if ((*(byte *)(iVar2 + 7) & 0x80) == 0) goto LAB_00029efc;
    }
  }
  uVar3 = 0xffffffff;
LAB_00029efc:
  iVar4 = reduce_object_count(iVar2,uVar3);
  if (iVar4 == 0) {
    uVar1 = 0;
  }
  else {
    FUN_0001d258(iVar2);
LAB_00029f2c:
    uVar1 = 1;
  }
  return uVar1;
}



// was FUN_00029f38
void babl_builtin_do_inv_delete(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "do_inv_delete" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  FUN_0001adc4((int)*(short *)(param_1 + -2));
  FUN_0001da00();
  return;
}



// was FUN_00029f4c
void babl_builtin_find_inv(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "find_inv" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  int iVar1;
  ushort uVar2;
  short sVar3;
  ushort uVar4;
  char *local_10;
  
  sVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar4 = FUN_0001adc4((int)*(short *)(param_1 + -4));
  local_10 = g_player_object;
  if ((sVar3 == 0) && (local_10 = DAT_00100674, (*(byte *)(DAT_00100674 + 0xe) & 0x10) == 0)) {
    FUN_000798c4();
    local_10 = DAT_00100674;
  }
  local_10 = local_10 + 6;
  if ((short)uVar4 < 1000) {
    iVar1 = (int)(short)uVar4 >> 6;
    uVar2 = uVar4 & 0xf;
    uVar4 = (short)uVar4 >> 4;
  }
  else {
    iVar1 = (int)(short)((short)uVar4 + -1000 >> 2);
    uVar2 = 0xffff;
  }
  FUN_000537d0(&local_10,1,iVar1,uVar4 & 3,uVar2);
  encode_object_slot_index();
  return;
}



// was FUN_00029fb0
undefined4 babl_builtin_identify_inv(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "identify_inv" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  char *wptr_15610;
  char *wptr_15618;
  short sVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  char cVar8;
  ushort uVar9;
  char acStack_852bc [4];
  char acStack_852b8 [545324];
  undefined1 auStack_8c [8];
  char local_84 [16];
  char local_74 [80];
  
  uVar2 = FUN_0001adc4((int)*(short *)(param_1 + -8));
  sVar1 = FUN_0001adc4((int)*(short *)(param_1 + -6));
  uVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar4 = FUN_0001cfa8(1,uVar2,(int)DAT_000bbfbc);
  iVar5 = FUN_000535fc(uVar2);
  if (((*(byte *)(iVar5 + 1) & 0x80) == 0) || ((*(ushort *)(iVar5 + 6) & 0x8000) != 0)) {
    uVar9 = 1;
  }
  else {
    uVar9 = *(ushort *)(iVar5 + 6) >> 6;
  }
  local_74[0] = '\0';
  local_84[0] = '\0';
  iVar6 = FUN_00048b6c(iVar5,uVar3,local_84);
  cVar8 = '\0';
  if (iVar6 != 0) {
    cVar8 = local_84[0];
  }
  if (((cVar8 == '\0') || (sVar1 == 0)) || (uVar9 != 1)) {
    if (uVar9 < 2) goto LAB_0002a154;
    uVar2 = Ordinal_1025(uVar9,auStack_8c,10);
    Ordinal_1063(local_74,uVar2);
    Ordinal_1063(local_74,&DAT_00085240);
  }
  else if (((cVar8 == 'a') || (cVar8 == 'e')) ||
          ((cVar8 == 'i' || ((cVar8 == 'o' || (cVar8 == 'u')))))) {
    pcVar7 = &DAT_00085244;
    wptr_15610 = acStack_852b8;
    do {
      cVar8 = *pcVar7;
      *wptr_15610 = cVar8; wptr_15610 = wptr_15610 + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar8 != '\0');
  }
  else {
    pcVar7 = &DAT_00085248;
    wptr_15618 = acStack_852bc;
    do {
      cVar8 = *pcVar7;
      *wptr_15618 = cVar8; wptr_15618 = wptr_15618 + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar8 != '\0');
  }
  sVar1 = 0;
LAB_0002a154:
  if (local_84[0] != '\0') {
    Ordinal_1063(local_74,local_84);
  }
  iVar6 = Ordinal_1068(local_74);
  FUN_00078b18(local_74 + iVar6,iVar5,(int)sVar1,1 < uVar9);
  FUN_00048bf0(iVar5,uVar3,local_74);
  iVar5 = Ordinal_1068(local_74);
  iVar5 = babl_alloc(iVar5 + 1);
  pcVar7 = local_74;
  do {
    cVar8 = *pcVar7;
    pcVar7[iVar5 - (int)local_74] = cVar8;
    pcVar7 = pcVar7 + 1;
  } while (cVar8 != '\0');
  uVar2 = FUN_0007873c(iVar5,0x7c);
  FUN_0001ade4((int)*(short *)(param_1 + -4),uVar2);
  return uVar4;
}



// was FUN_0002a1fc
ushort babl_builtin_count_inv(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "count_inv" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  ushort uVar1;
  int iVar2;

  FUN_0001adc4((int)*(short *)(param_1 + -2));
  iVar2 = FUN_000535fc();
  if (((*(byte *)(iVar2 + 1) & 0x80) == 0) || ((*(ushort *)(iVar2 + 6) & 0x8000) != 0)) {
    uVar1 = 1;
  }
  else {
    uVar1 = *(ushort *)(iVar2 + 6) >> 6;
  }
  return uVar1;
}



// was FUN_0002a258
byte babl_builtin_check_inv_quality(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "check_inv_quality" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  int iVar1;

  FUN_0001adc4((int)*(short *)(param_1 + -2));
  iVar1 = FUN_000535fc();
  return *(byte *)(iVar1 + 4) & 0x3f;
}



// was FUN_0002a27c
undefined4 babl_builtin_set_inv_quality(param_1)
intptr_t param_1; // was `int` -- same pointer-truncation bug class as every sibling babl builtin's own `param_1` fix (this "set_inv_quality" builtin was simply never exercised deep enough to crash/misbehave visibly yet)
{
  undefined2 uVar1;
  byte bVar2;
  byte bVar3;
  int iVar4;
  
  FUN_0001adc4((int)*(short *)(param_1 + -4));
  iVar4 = FUN_000535fc();
  bVar3 = FUN_0001adc4((int)*(short *)(param_1 + -2));
  uVar1 = *(undefined2 *)(iVar4 + 4);
  bVar2 = (byte)uVar1;
  *(byte *)(iVar4 + 4) = (bVar2 ^ bVar3) & 0x3f ^ bVar2;
  *(char *)(iVar4 + 5) = (char)((ushort)uVar1 >> 8);
  return 1;
}




/* was sync_conv_vars_from_npc -- NOT a debug/cheat tool (an earlier pass through
   this file mislabeled it that way from its shape alone; tracing its
   real caller corrects that). Called exactly once, from FUN_000286cc
   (uw.c ~19025 -- loads the NPC's head portrait via "genhead",
   draws the conversation UI, then calls change_game_mode(1): this is
   real conversation-open setup, unconditional on every "talk to NPC",
   not gated behind any debug/cheat flag), as
   `sync_conv_vars_from_npc(DAT_00100674)` where DAT_00100674 is the NPC
   just talked to (assigned in FUN_00028488's own interact-with-object
   path). Publishes every field babl conversation scripts can read --
   npc_xhome/npc_yhome/npc_goal/npc_gtarg/npc_talkedto/npc_level/
   npc_attitude/npc_hp/npc_health/npc_arms/npc_power/npc_hunger/
   npc_whoami/npc_name, plus the PLAYER's own play_health/play_hp/
   play_hunger/play_mana/play_power/play_arms/play_level/play_sex/
   play_poison/play_drawn/play_name, plus dungeon_level/game_time/
   game_mins/game_days -- via babl_set_variable, immediately before the
   conversation bytecode interpreter (FUN_0001a1c8) actually runs. This
   is the real object-record/console-variable binding the "npc_xhome"/
   "npc_yhome" evidence for uw_object_hdr_t's quality/owner fields (see
   struct-recovery-plan.md) came from. */
void sync_conv_vars_from_npc(param_1)
ushort * param_1;

{
  byte bVar1;
  undefined4 uVar2;
  ushort extraout_r1;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  ushort local_20 [2];
  
  iVar3 = ((byte)*param_1 & 0x3f) * 0x30;
  local_20[0] = (ushort)(byte)param_1[0xd];
  babl_set_variable(s_npc_whoami_000853a0,local_20,1);
  local_20[0] = 0x10;
  if ((*(byte *)((char *)param_1 + 0x19) & 0x80) == 0) {
    local_20[0] = 0xc0;
  }
  babl_set_variable(s_npc_hunger_00085394,local_20,1);
  if ((&g_monster_max_stats_table)[iVar3] == '\0') {
    local_20[0] = 0x80;
  }
  else {
    local_20[0] = Ordinal_2005((&g_monster_max_stats_table)[iVar3],(uint)(byte)param_1[4] << 8);
  }
  babl_set_variable(s_npc_health_00085388,local_20,1);
  local_20[0] = (ushort)(byte)param_1[4];
  babl_set_variable(s_npc_hp_00085380,local_20,1);
  local_20[0] = (ushort)(char)(&DAT_001007e3)[iVar3];
  babl_set_variable(s_npc_arms_00085374,local_20,1);
  local_20[0] = (ushort)(byte)(&DAT_001007d5)[iVar3] + (ushort)((byte)(&DAT_001007fd)[iVar3] >> 1);
  babl_set_variable(s_npc_power_00085368,local_20,1);
  local_20[0] = *(byte *)((char *)param_1 + 0xb) & 0xf;
  babl_set_variable(s_npc_goal_0008535c,local_20,1);
  local_20[0] = (ushort)((*(ushort *)((char *)param_1 + 0xb) & 0xff0) >> 4);
  babl_set_variable(s_npc_gtarg_00085350,local_20,1);
  local_20[0] = (ushort)(((byte)param_1[7] & 0x20) >> 5);
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] sync_conv_vars_from_npc: seeding npc_talkedto=%d from object byte@0xe=0x%02x (obj=%p)\n", (int)local_20[0], (unsigned)(byte)param_1[7], (void *)param_1);
  babl_set_variable(s_npc_talkedto_00085340,local_20,1);
  local_20[0] = (byte)(&DAT_001007dd)[iVar3] & 0xf;
  babl_set_variable(s_npc_level_00085334,local_20,1);
  local_20[0] = (byte)param_1[2] & 0x3f;
  babl_set_variable(s_npc_xhome_00085328,local_20,1);
  local_20[0] = (byte)param_1[3] & 0x3f;
  babl_set_variable(s_npc_yhome_0008531c,local_20,1);
  if ((byte)param_1[0xd] == 0) {
    local_20[0] = *param_1 & 0x1ff | 0x800;
  }
  else {
    local_20[0] = (byte)param_1[0xd] + 0x10 | 0xe00;
  }
  babl_set_variable(s_npc_name_00085310,local_20,1);
  uVar4 = *(ushort *)((char *)param_1 + 0xb) & 0xf;
  bVar5 = uVar4 == 5;
  if (bVar5) {
    uVar4 = *(ushort *)((char *)param_1 + 0xb) & 0xff0;
  }
  if (bVar5 && uVar4 == 0x10) {
    local_20[0] = 0;
  }
  else if ((*(byte *)((char *)param_1 + 0x19) & 0x40) == 0) {
    local_20[0] = (ushort)(byte)((byte)param_1[7] >> 6);
  }
  else {
    local_20[0] = 6;
  }
  babl_set_variable(s_npc_attitude_000845f8,local_20,1);
  bVar1 = *g_player_object;
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x39);
  babl_set_variable(s_play_hunger_00085304,local_20,1);
  if ((&g_monster_max_stats_table)[(bVar1 & 0x3f) * 0x30] == '\0') {
    local_20[0] = 0x80;
  }
  else {
    /* Was `g_player_object[8]` -- g_player_object is `ushort *`, so the
       plain-index form reads byte offset 16 (8*2), not byte offset 8
       where the player's real HP byte lives (matches every other real
       reader of this field elsewhere in the file, e.g.
       `*(char*)((char*)g_player_object+8)` in sync_conv_vars_to_npc's own sync-
       back a few lines below and in sync_player_stats_to_hud). Same
       ushort/byte pointer-scaling bug class as the NPC-AI cluster
       fixed earlier this project. Confirmed against the real ARM
       disassembly: both this "play_health" calc and the "play_hp" set
       just below load `ldrb r3,[r4,#0x8]` -- a byte-sized load at
       offset 8, not 16. Confirmed live: this fed a stale/wrong
       "play_hp" babl variable (default 0 for a fresh character) at
       conversation start, and sync_conv_vars_to_npc's own sync-back at
       conversation end then faithfully wrote that 0 into the REAL
       player HP byte, zeroing it and triggering
       sync_player_stats_to_hud's death-sequence branch, which then hit
       a separate missing-NULL-guard crash in FUN_0003c038 (fixed
       there to match change_game_mode's own existing guard). */
    local_20[0] = Ordinal_2005((&g_monster_max_stats_table)[(bVar1 & 0x3f) * 0x30],(uint)*(byte *)((char *)g_player_object + 8) << 8);
  }
  babl_set_variable(s_play_health_000852f8,local_20,1);
  local_20[0] = (ushort)*(byte *)((char *)g_player_object + 8);
  babl_set_variable(s_play_hp_000852f0,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x1e) + (ushort)*(byte *)(DAT_00086df8 + 0x21);
  babl_set_variable(s_play_arms_000852e4,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x27) + (ushort)*(byte *)(DAT_00086df8 + 0x37) +
                (ushort)*(byte *)(DAT_00086df8 + 0x1f);
  babl_set_variable(s_play_power_000852d8,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x37);
  babl_set_variable(s_play_mana_000852cc,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x3d);
  babl_set_variable(s_play_level_000852c0,local_20,1);
  local_20[0] = DAT_00201b68;
  babl_set_variable(s_dungeon_level_000852b0,local_20,1);
  local_20[0] = Ordinal_2008(0x3bc4,*(undefined4 *)(DAT_00086df8 + 0xce));
  babl_set_variable(s_game_time_000852a4,local_20,1);
  uVar2 = Ordinal_2008(0x3bc4,*(undefined4 *)(DAT_00086df8 + 0xce));
  Ordinal_2008(0x5a0,uVar2);
  local_20[0] = extraout_r1;
  babl_set_variable(s_game_mins_00085298,local_20,1);
  local_20[0] = Ordinal_2008(0x1502e80,*(undefined4 *)(DAT_00086df8 + 0xce));
  babl_set_variable(s_game_days_0008528c,local_20,1);
  local_20[0] = 0;
  babl_set_variable(s_new_player_exp_0008527c,local_20,1);
  local_20[0] = (ushort)((*(byte *)(DAT_00086df8 + 100) & 2) >> 1);
  babl_set_variable(s_play_sex_00085270,local_20,1);
  local_20[0] = (ushort)((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) >> 2);
  babl_set_variable(s_play_poison_00085264,local_20,1);
  local_20[0] = (ushort)((*(byte *)(DAT_00086df8 + 0x5f) & 2) >> 1);
  babl_set_variable(s_play_drawn_00085258,local_20,1);
  local_20[0] = DAT_00201c74;
  babl_set_variable(s_play_name_0008524c,local_20,1);
  return;
}



/* was sync_conv_vars_to_npc -- the write-back mirror of sync_conv_vars_from_npc,
   called once from the same FUN_000286cc, right after the conversation
   bytecode interpreter (FUN_0001a1c8) runs. Reads back whatever the
   script itself set via babl_get_variable and applies it to the real object
   record: npc_xhome/npc_yhome/npc_goal/npc_gtarg/npc_talkedto/
   npc_attitude/npc_hunger(as a derived "is starving" flag, not a raw
   counter)/npc_hp, plus the player's play_hunger/play_hp/play_mana/
   play_poison, plus granting new_player_exp if the script set it
   nonzero. This is how a conversation script changes an NPC's
   disposition toward the player, or rewards experience for a correct
   answer -- real gameplay effects of dialogue choices, not a debug
   tool. Return value reflects whether npc_attitude ended up 0 after the
   script ran; the caller uses it (OR'd with DAT_001007b4) to decide
   whether to skip a post-conversation delay. */
bool sync_conv_vars_to_npc(param_1)
char *param_1;

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  bool bVar4;
  ushort local_10;
  undefined2 local_e;

  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] sync_conv_vars_to_npc: ENTRY param_1=%p\n", (void *)param_1);
  babl_get_variable(s_npc_hunger_00085394,&local_10,1);
  *(byte *)(param_1 + 0x19) = ((short)local_10 < 0x20) << 7 | *(byte *)(param_1 + 0x19) & 0x7f;
  babl_get_variable(s_npc_hp_00085380,&local_10,1);
  *(char *)(param_1 + 8) = (char)local_10;
  babl_get_variable(s_npc_xhome_00085328,&local_10,1);
  uVar1 = *(undefined2 *)(param_1 + 4);
  bVar2 = (byte)uVar1;
  *(byte *)(param_1 + 4) = (bVar2 ^ (byte)local_10) & 0x3f ^ bVar2;
  *(char *)(param_1 + 5) = (char)((ushort)uVar1 >> 8);
  babl_get_variable(s_npc_yhome_0008531c,&local_10,1);
  uVar1 = *(undefined2 *)(param_1 + 6);
  bVar2 = (byte)uVar1;
  *(byte *)(param_1 + 6) = (bVar2 ^ (byte)local_10) & 0x3f ^ bVar2;
  *(char *)(param_1 + 7) = (char)((ushort)uVar1 >> 8);
  babl_get_variable(s_npc_goal_0008535c,&local_10,1);
  babl_get_variable(s_npc_gtarg_00085350,&local_e,1);
  FUN_00034ac4(param_1,(undefined1)local_10,local_e);
  uVar1 = *(undefined2 *)(param_1 + 0xd);
  *(char *)(param_1 + 0xd) = (char)uVar1;
  *(byte *)(param_1 + 0xe) = (byte)((ushort)uVar1 >> 8) | 0x20;
  babl_get_variable(s_npc_attitude_000845f8,&local_10,1);
  if ((short)local_10 < 4) {
    uVar3 = *(ushort *)(param_1 + 0xd) & 0x3fff;
    *(char *)(param_1 + 0xd) = (char)uVar3;
    *(byte *)(param_1 + 0xe) = (byte)(uVar3 >> 8) | (byte)(((local_10 & 3) << 0xe) >> 8);
  }
  else {
    uVar1 = *(undefined2 *)(param_1 + 0xd);
    *(char *)(param_1 + 0xd) = (char)uVar1;
    *(byte *)(param_1 + 0xe) = (byte)((ushort)uVar1 >> 8) | 0xc0;
    *(byte *)(param_1 + 0x19) = *(byte *)(param_1 + 0x19) | 0x40;
  }
  bVar4 = local_10 == 0;
  uVar1 = *(undefined2 *)(param_1 + 0xd);
  *(char *)(param_1 + 0xd) = (char)uVar1;
  *(byte *)(param_1 + 0xe) = (byte)((ushort)uVar1 >> 8) | 0x20;
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] sync_conv_vars_to_npc: wrote npc_talkedto bit into object byte@0xe=0x%02x (obj=%p), attitude==0?%d\n", (unsigned)*(byte *)(param_1 + 0xe), (void *)param_1, (int)bVar4);
  babl_get_variable(s_play_hunger_00085304,&local_10,1);
  *(char *)(DAT_00086df8 + 0x39) = (char)local_10;
  babl_get_variable(s_play_hp_000852f0,&local_10,1);
  *(char *)((char *)g_player_object + 8) = (char)local_10;
  babl_get_variable(s_play_mana_000852cc,&local_10,1);
  *(char *)(DAT_00086df8 + 0x37) = (char)local_10;
  babl_get_variable(s_play_poison_00085264,&local_10,1);
  uVar3 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
  *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar3 | (byte)((local_10 & 0xf) << 2);
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar3 >> 8);
  babl_get_variable(s_new_player_exp_0008527c,&local_10,1);
  if (local_10 != 0) {
    grant_experience_points((int)(short)local_10);   /* dropped arg: the parsed exp value */
  }
  return bVar4;
}






undefined4 load_npc_conversation_record(param_1,param_2)
char *param_1;
undefined1 *param_2;

{
  short sVar1;
  int iVar2;
  undefined1 *puVar3;
  char *local_28;
  undefined1 auStack_20 [16];

  /* Was `undefined4 param_2` (32-bit) -- truncated the real 64-bit
     buffer pointer (DAT_00100784 + 0x400, passed in from start_npc_conversation)
     before it ever reached FUN_00019660's own `*param_1 = 0xff` write,
     the Talk-mode crash in bug-critter-talk.txt (EXC_BAD_ACCESS at the
     truncated 32-bit address, confirmed live via lldb: param_2 came in
     as 0x58270400, the real 0x158270400 buffer address with its high
     32 bits dropped). Same truncation-bug class as the tilemap_lookup
     pointer-truncation sweep earlier this session. */
  FUN_00019660(param_2);
  DAT_000bbf30 = 0;
  DAT_000bbf20 = param_1;
  iVar2 = open_level_archive(auStack_20,param_1);
  if (iVar2 == 0) {
    FUN_0003c3c8(0x300a);
  }
  else {
    DAT_000bbf18 = babl_alloc(0x4000);
    if (DAT_000bbf18 == 0) {
      FUN_0003c3c8(4);
    }
    local_28 = DAT_000bbf18;
    /* Was `read_archive_entry(auStack_20,DAT_001007c4)` -- a dropped 3rd
       argument. read_archive_entry's real signature takes a destination
       buffer (its own `param_3`, see its comment); the real ARM code
       (0x194d0-0x194dc: `cpy r5,r2` then `bl 0x1613c` with NO reload of
       r2 in between) relies on r2 still holding local_28 from several
       instructions earlier -- a register-forwarding trick this host's
       own C codegen has no reason to reproduce for a call site that's
       only ever told about 2 arguments. Confirmed via lldb this was the
       real reason EVERY NPC's Talk (not just Bragit's) failed with "You
       get no response": Bragit's own directory-table slot (record 67)
       is genuinely non-empty (199494, confirmed live) -- read_archive_
       entry's early "empty slot" check was never the problem, the
       actual FUN_0002285c(fd,param_3,len) read was silently failing on
       whatever garbage this host happened to leave in the argument
       register. */
    sVar1 = read_archive_entry(auStack_20,DAT_001007c4,local_28);
    FUN_00015a58(auStack_20);
    if (sVar1 < 1) {
      /* Was `message_scroll_print_wrapped(...); return 1;` -- a second,
         separate bug on top of the already-fixed dropped-argument one
         (see the surviving half of this comment below): the real
         disassembly (0x194fc-0x1950c) falls straight through to this
         function's shared epilogue after the two `bl`s with NO `mov
         r0,#1` of its own, so the real return value here is whatever
         message_scroll_print_wrapped() itself returns, not a hardcoded
         1. Hardcoding 1 (a non-negative "success") made start_npc_conversation's
         own `if (sVar1 < 0)` caller-side check always take its SUCCESS
         branch even on this "no CNV record for this NPC" path -- which
         then read never-initialized DAT_000bbf70 (still 0 from this
         run, since the real per-record setup in build_babl_symbol_table() below
         never got a chance to run) as a base pointer inside
         babl_register_builtin, crashing at DAT_000bbf70+0x18. This is the exact
         crash in bug-critter-talk.txt: Bragit has no real conversation
         record, so this early-return path is supposed to be the one
         taken. Was: message_scroll_print_wrapped(FUN_0007863c(0xe01));
         return 1; -- two separate calls with message_scroll_print_
         wrapped()'s arg dropped; fresh Ghidra disassembly (0x44c90-
         0x44c94) shows no register load between the two `bl`s --
         FUN_0007863c's return (char *) flows straight into
         message_scroll_print_wrapped as its argument. */
      return message_scroll_print_wrapped(FUN_0007863c(0xe01));
    }
  }
  iVar2 = build_babl_symbol_table();
  if (-1 < iVar2) {
    FUN_0001a1a4(iVar2);
    babl_free(local_28);
    DAT_000bbf14 = babl_alloc((DAT_000bbf7c + 0x800) * 2);
    load_npc_conversation_variables(DAT_000bbf14,(int)DAT_000bbf7c);
    DAT_000bbf84 = DAT_000bbf7c;
    DAT_000bbf0c = DAT_000bbf14 + DAT_000bbf7c * 2;
    puVar3 = (undefined1 *)babl_alloc(1);
    *puVar3 = 0;
    DAT_000bbf88 = FUN_0007873c(puVar3,0x7c);
    FUN_0001b0a4();
    babl_register_builtin(s_compare_000845a0,babl_builtin_compare);
    babl_register_builtin(s_random_00084598,babl_builtin_random);
    babl_register_builtin(s_plural_00084590,babl_builtin_plural);
    babl_register_builtin(s_contains_00084584,babl_builtin_contains);
    babl_register_builtin(s_append_0008457c,babl_builtin_append);
    babl_register_builtin(s_copy_00084574,babl_builtin_copy);
    babl_register_builtin(s_find_0008456c,babl_builtin_find);
    babl_register_builtin(s_length_00084564,&babl_builtin_length);
    babl_register_builtin(s_val_00084560,babl_builtin_val);
    return 1;
  }
  return 0xffffffff;
}




void save_npc_conversation_variables()

{
  char stack0xffdc3240_buf [256];
  char *stack0xffdc3240_ptr;
  char cVar1;
  short sVar2;
  intptr_t uVar3; // was `undefined4` -- truncated the real 64-bit DAT_000bbf14 pointer on assignment, same bug class as load_npc_conversation_variables's own `param_1` fix (its load-side mirror); dormant until the scan-alignment fix below let execution actually reach this write
  char *pcVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  /* Was two separate stack locals (`short local_120; short local_11e;`)
     read as ONE 4-byte record via `&local_120,4` -- the same "Ghidra
     split one real contiguous buffer into separate stack locals" bug
     class fixed dozens of times elsewhere in this file, just never
     caught here since it doesn't crash, it just silently corrupts
     local_11e (the record's LENGTH) with whatever garbage byte this
     compiler's own stack layout happens to place after local_120 (the
     record's ID) -- nothing forces the two to stay adjacent once
     recompiled. Confirmed via the real ARM disassembly that both reads
     genuinely are meant to be one 4-byte record (matching
     load_npc_conversation_variables's own identical pattern, its own load-side mirror).
     The corrupted length then feeds FUN_00022850's own seek-forward-
     to-next-record call, misaligning every subsequent scan iteration
     -- this is the actual root cause of "talking to Bragit again
     starts fresh": his own script-local conversation state (a SEPARATE
     persistence path from the engine-level npc_talkedto bit, which
     was already confirmed working) never successfully finds or
     updates its own saved record, because the scan wanders off into
     garbage after the very first skipped-record seek. */
  undefined1 local_120_backing[4];
  #define local_120 (*(short *)(local_120_backing + 0))
  #define local_11e (*(short *)(local_120_backing + 2))
  char acStack_118 [260];

  FUN_00078a04(0x7c);
  sVar2 = DAT_000bbf7c;
  uVar3 = DAT_000bbf14;
  pcVar4 = &DAT_0023cca8;
    stack0xffdc3240_ptr = acStack_118;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc3240_ptr = cVar1; stack0xffdc3240_ptr = stack0xffdc3240_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_118,s__SAVE0_bglobals_dat_00084538);
  iVar5 = FUN_00022810(acStack_118);
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] save_npc_conversation_variables: open %s -> handle=%d, wanted conv-id(DAT_001007c4)=%d, sVar2(DAT_000bbf7c)=%d, buf(DAT_000bbf14)=%p first10=%d %d %d %d %d %d %d %d %d %d\n",
          acStack_118, iVar5, (int)DAT_001007c4, (int)sVar2, (void*)uVar3,
          (int)((short*)uVar3)[0], (int)((short*)uVar3)[1], (int)((short*)uVar3)[2], (int)((short*)uVar3)[3], (int)((short*)uVar3)[4],
          (int)((short*)uVar3)[5], (int)((short*)uVar3)[6], (int)((short*)uVar3)[7], (int)((short*)uVar3)[8], (int)((short*)uVar3)[9]);
  if (iVar5 != -1) {
    while( true ) {
      uVar6 = FUN_0002285c(iVar5,local_120_backing,4);
      if ((uVar6 < 4) ||
         (uVar7 = (uint)local_120, uVar6 = (uint)DAT_001007c4,
         uVar7 != uVar6 && (int)uVar6 <= (int)uVar7)) {
        if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] save_npc_conversation_variables: scan gave up, uVar6=%u local_120=%d (no matching record -- write SKIPPED entirely)\n", uVar6, (int)local_120);
        goto LAB_00019460;
      }
      if (uVar7 == uVar6) break;
      FUN_00022850(iVar5,(int)local_11e << 1,1);
    }
    if (sVar2 < local_11e) {
      local_11e = sVar2;
    }
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] save_npc_conversation_variables: MATCH id=%d, writing %d bytes\n", (int)local_120, (int)local_11e << 1);
    FUN_00022884(iVar5,uVar3,(int)local_11e << 1);
LAB_00019460:
    Ordinal_553(iVar5);
  }
  #undef local_120
  #undef local_11e
  return;
}

