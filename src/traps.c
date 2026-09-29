/* Tile trap/link "type" effect dispatch: the classic-UW trap-type
 * switch fired when a trap/link record's chain is triggered. Split
 * out of uw.c (the original monolithic decompile) once its real role
 * was confirmed.
 */
#include "headers/traps.h"
#include <stdio.h>
#include <stdlib.h>



// was FUN_0007d0b0 -- the tile trap/link "type" effect dispatcher
// wrapped by apply_trap_or_link_effect: param_1 is the trap/link
// record (its low 6 bits, &0x3f, select one of 17 effect types via
// this switch), param_2/param_3 the tile (x,y) coordinates it fired
// at. Each case is a distinct classic-UW trap/trigger effect; only a
// few are pinned down with real confidence from cross-referencing
// already-named callees and sibling code:
//   case 6:  triggers a babl conversation script directly (calls
//            FUN_00039d1c, the same function
//            trigger_object_use_babl_script's own comment already
//            names as "triggers a babl conversation script").
//   case 7:  spawns a brand-new object at this tile from a linked
//            template record (allocates a slot, copies the template,
//            calls place_object_in_world, optionally resolves a
//            quality-link sub-object, and schedules a follow-up
//            entry for door-class results) -- a "spawn trap".
//   case 8:  door control -- reads a trigger-state nibble and calls
//            open_door_object/close_door_object/toggle_door_object;
//            has its own UW_DEBUG_DOOR-gated fprintf tracing, like
//            the other door-dispatch code in uw.c.
//   case 0xb: unlinks and frees a linked object outright -- a
//            "destroy object" trap.
//   case 0xd: reads/writes a bitfield in the player record at offset
//            +0x70 (set/clear/toggle/AND/OR/XOR/shift by an op code)
//            -- reads as a "quest flag/variable" trap.
//   case 0xe: compares a computed value against the player's +0x70
//            state and, on mismatch, resolves a linked lock/use
//            record and delegates to resolve_skill_gated_unlock_or_use
//            -- a "conditional trigger" trap.
//   case 0x10: prints a message-table string via
//            message_scroll_print_wrapped -- a "text trap" (its own
//            debug string literally says "Look,_it's_a_text_trap").
// The remaining cases (0-5, 9, 0xa, 0xc, 0xf) call still-unnamed
// helper functions (FUN_00039bd8, FUN_000396a0, FUN_0004ac98,
// dispatch_quest_event_code, FUN_00039790, FUN_0007ed20, FUN_000452dc) whose own
// purpose isn't pinned down yet, so their exact trap semantics are
// left undetermined here rather than guessed at. After the switch,
// if the record has a linked "next" object, it either recurses into
// itself (another trap-class link) or delegates to
// resolve_skill_gated_unlock_or_use (a non-trap-class link, e.g. a
// lock) -- so trap/lock records can be chained.
int dispatch_trap_type_effect(param_1,param_2,param_3)
ushort * param_1;
uint param_2;
uint param_3;

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  uint uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  ushort *puVar8;
  undefined1 *puVar9;
  undefined1 *puVar10;
  int iVar11;
  /* HACK: case 8's own two FUN_000537d0 results (real `ushort *`
     returns, see that function's own signature) were stored into
     iVar16/iVar11 -- both plain `int`, truncating a real 64-bit
     pointer on this host. Confirmed live (bug-pull-chain-crash.txt):
     pulling a chain crashed with EXC_BAD_ACCESS inside
     object_list_insert_head, param_1 (== `(char*)(iVar16+6)`) having
     read as an invalid address reconstructed from a truncated iVar16.
     iVar16/iVar11 themselves are reused for genuinely unrelated small
     integers in every OTHER case of this switch (and even earlier in
     this same case, in iVar11's case) -- not safe to blanket-retype --
     so case 8's own pointer-holding uses get these two dedicated,
     correctly-typed locals instead, scoped to exactly that case. */
  ushort *_case8_p1;
  ushort *_case8_p2;
  ushort *puVar12;
  undefined2 uVar13;
  uint uVar14;
  ushort *puVar15;
  int iVar16;
  uint uVar17;
  uint uVar18;
  bool bVar19;
  undefined4 in_stack_ffffffb4;
  undefined2 uVar20;
  undefined4 in_stack_ffffffb8;
  undefined2 uVar21;
  undefined1 auStack_38 [4];
  char *local_34;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  int local_30;
  
  uVar20 = (undefined2)((uint)in_stack_ffffffb4 >> 0x10);
  uVar21 = (undefined2)((uint)in_stack_ffffffb8 >> 0x10);
  sVar3 = (short)param_3;
  iVar16 = 2;
  switch(*param_1 & 0x3f) {
  case 0:
    iVar16 = rand_below(10);
    uVar6 = 2;
    if (6 < iVar16) {
      uVar6 = 0;
    }
    sVar3 = -1;
    if ((param_1[3] & 0x3f) == 0) {
      sVar3 = 1;
    }
    uVar7 = encode_object_slot_index(DAT_0024cff4);
    iVar16 = FUN_00039bd8(uVar7,((byte)param_1[2] & 0x3f) * (int)sVar3,4,uVar6);
    break;
  case 1:
    iVar16 = FUN_000396a0(DAT_0024cff4,(byte)param_1[2] & 0x3f,(byte)param_1[3] & 0x3f,
                          (byte)param_1[1] & 0x7f);
    break;
  case 2:
    FUN_0004ac98(param_1,param_2,param_3);
    break;
  case 3:
    iVar16 = dispatch_quest_event_code(param_1,param_2,param_3);
    break;
  case 4:
    break;
  case 5:
    uVar4 = param_1[1];
    iVar16 = (uVar4 >> 6 & 0xe) + ((byte)param_1[2] & 1);
    uVar13 = (undefined2)iVar16;
    if (iVar16 * 0x10000 >> 0x10 == 0xf) {
      uVar13 = 10;
    }
    iVar16 = FUN_00039790(param_2,param_3,(byte)param_1[3] & 0x3f,((byte)param_1[2] & 0x3e) >> 1,
                          CONCAT22(uVar20,uVar4 >> 3) & 0xffff000f,CONCAT22(uVar21,uVar13),
                          uVar4 >> 0xd,uVar4 >> 10 & 7,0);
    break;
  case 6:
    iVar16 = FUN_00039d1c(param_2,param_3,param_1,DAT_0024cff4,
                          CONCAT22(uVar20,(ushort)(byte)param_1[2]) & 0xffff003f,
                          CONCAT22(uVar21,(ushort)(byte)param_1[3]) & 0xffff003f);
    break;
  case 7:
    iVar16 = rand_below(0x3f);
    if (iVar16 < (int)((byte)param_1[2] & 0x3f)) {
      return 2;
    }
    if ((*param_1 & 0x8000) != 0) {
      return 2;
    }
    puVar12 = (ushort *)resolve_object_link(param_1 + 3);
    if (puVar12 == (ushort *)0x0) {
      return 2;
    }
    if (((*puVar12 & 0x1c0) == 0x40) && (iVar16 = check_object_area_for_spawn_block(puVar12), iVar16 != 0)) {
      return 2;
    }
    object_ptr_in_arena(puVar12);
    puVar8 = (ushort *)alloc_object_slot();
    if (puVar8 != (ushort *)0x0) {
      iVar16 = object_ptr_in_arena(puVar12);
      if (iVar16 == 0) {
        *(char *)puVar8 = (char)*puVar12;
        *(undefined1 *)((char *)puVar8 + 1) = *(undefined1 *)((char *)puVar12 + 1);
        *(char *)(puVar8 + 1) = (char)puVar12[1];
        *(undefined1 *)((char *)puVar8 + 3) = *(undefined1 *)((char *)puVar12 + 3);
        *(char *)(puVar8 + 2) = (char)puVar12[2];
        *(undefined1 *)((char *)puVar8 + 5) = *(undefined1 *)((char *)puVar12 + 5);
        *(char *)(puVar8 + 3) = (char)puVar12[3];
        *(undefined1 *)((char *)puVar8 + 7) = *(undefined1 *)((char *)puVar12 + 7);
      }
      else {
        iVar16 = 0x1b;
        puVar15 = puVar8;
        do {
          iVar11 = iVar16 + -1;
          *(char *)puVar15 = (char)*puVar12;
          bVar19 = 0 < iVar16;
          iVar16 = iVar11;
          puVar15 = (ushort *)((char *)puVar15 + 1);
          puVar12 = (ushort *)((char *)puVar12 + 1);
        } while (iVar11 != 0 && bVar19);
      }
      DAT_00202c84 = 1;
      uVar4 = puVar8[1];
      local_30 = place_object_in_world((uint)(uVar4 >> 0xd) + param_2 * 8,
                              ((uVar4 & 0x1c00) >> 10) + param_3 * 8,uVar4 & 0x7f,puVar8,
                              CONCAT22(uVar20,4),0);
      DAT_00202c84 = 0;
      if (local_30 != 0) {
        if ((((*puVar8 & 0x8000) == 0) && ((puVar8[3] & 0xffc0) != 0)) &&
           (puVar9 = (undefined1 *)alloc_object_slot(0), puVar9 != (undefined1 *)0x0)) {
          puVar10 = (undefined1 *)FUN_000535fc(puVar8[3] >> 6);
          *puVar9 = *puVar10;
          puVar9[1] = puVar10[1];
          puVar9[2] = puVar10[2];
          puVar9[3] = puVar10[3];
          puVar9[4] = puVar10[4];
          puVar9[5] = puVar10[5];
          puVar9[6] = puVar10[6];
          puVar9[7] = puVar10[7];
          uVar14 = encode_object_slot_index(puVar9);
          *(byte *)(puVar8 + 3) = (byte)puVar8[3] & 0x3f | (byte)((uVar14 & 0x3ff) << 6);
          *(char *)((char *)puVar8 + 7) = (char)((uVar14 << 0x16) >> 0x18);
          if ((*(ushort *)(puVar9 + 4) & 0xffc0) != 0) {
            puVar9[5] = 0;
            puVar9[4] = (byte)*(ushort *)(puVar9 + 4) & 0x3f;
          }
          if (((puVar9[1] & 0x80) == 0) && ((*(ushort *)(puVar9 + 6) & 0xffc0) != 0)) {
            puVar9[6] = (byte)*(ushort *)(puVar9 + 6) & 0x3f;
            puVar9[7] = 0;
          }
        }
        if ((*puVar8 & 0x1c0) == 0x1c0) {
          uVar6 = encode_object_slot_index(puVar8);
          scheduler_add_entry(uVar6,0xffffffff,0,param_2 & 0xff,param_3 & 0xff);
        }
      }
    }
    return 2;
  case 8:
    local_34 = (char *)tilemap_lookup(param_2,param_3);
    local_34 = local_34 + 2;
    _case8_p1 = FUN_000537d0(&local_34,0,5,0,CONCAT22(uVar20,0xffff));
    DAT_002020a0 = (undefined2)param_2;
    DAT_002020a4 = sVar3;
    if (_case8_p1 == (ushort *)0x0) {
      _case8_p1 = FUN_000537d0(&local_34,0,7,0xffffffff,0xf);
      if (_case8_p1 == (ushort *)0x0) {
        return 2;
      }
      uVar4 = param_1[2] & 0x3f;
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[door] dispatch_trap_type_effect case8(branchA): trigger_state(uVar4)=%d target_nibble=%d target_obj0=0x%04x\n",
                (int)uVar4, (int)(*(byte *)((char *)_case8_p1 + 6) & 0xf), (unsigned)*_case8_p1);
      if (7 < (*(byte *)((char *)_case8_p1 + 6) & 0xf)) {
        if ((uVar4 != 1) && (uVar4 != 3)) {
          return 2;
        }
        goto LAB_0007dbc0;
      }
      if (uVar4 < 2) {
        return 2;
      }
      if (3 < uVar4) {
        return 2;
      }
    }
    else {
      local_34 = (char *)_case8_p1 + 6;
      _case8_p2 = FUN_000537d0(&local_34,0,4,0,0xf);
      if (_case8_p2 != (ushort *)0x0) {
        object_list_unlink(local_34,_case8_p2);
        free_object_slot(_case8_p2);
      }
      if (((*param_1 & 0x8000) == 0) && ((param_1[3] & 0xffc0) != 0)) {
        puVar9 = (undefined1 *)resolve_object_link(param_1 + 3);
        puVar10 = (undefined1 *)alloc_object_slot(0);
        if (puVar10 != (undefined1 *)0x0) {
          *puVar10 = *puVar9;
          puVar10[1] = puVar9[1];
          puVar10[2] = puVar9[2];
          puVar10[3] = puVar9[3];
          puVar10[4] = puVar9[4];
          puVar10[5] = puVar9[5];
          puVar10[6] = puVar9[6];
          puVar10[7] = puVar9[7];
          /* HACK: was a bare `object_list_insert_head(local_34);` --
             dropped second argument, same class as this file's other
             Ghidra-decompiled dropped-argument calls. Every other call
             site of object_list_insert_head passes exactly two
             arguments (a list head and the object to insert), and
             puVar10 -- the object slot this block just allocated and
             populated a few lines above -- is obviously the intended
             one here (nothing else newly-relevant is in scope).
             Confirmed live (bug-pull-chain-crash.txt): pulling a chain
             crashed with EXC_BAD_ACCESS dereferencing NULL inside
             object_list_insert_head, param_2 having read as garbage
             (0) from whatever register happened to be left over. */
          object_list_insert_head(local_34,puVar10);
        }
      }
      uVar4 = param_1[2] & 0x3f;
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[door] dispatch_trap_type_effect case8(branchB): trigger_state(uVar4)=%d target_obj0=0x%04x\n",
                (int)uVar4, (unsigned)*_case8_p1);
      if (uVar4 == 1) {
LAB_0007dbc0:
        /* HACK: was `close_door_object(DAT_0024cff4,iVar16);` -- same
           truncated-pointer class as _case8_p1's own fix a few lines
           above (see this switch case's top comment). This label is
           reached either by falling through from here (where
           _case8_p1 still holds this case's first FUN_000537d0 call)
           or by `goto` from the if-branch above (where _case8_p1 was
           reassigned to that branch's own FUN_000537d0 call) -- in
           both cases _case8_p1 is the object close_door_object needs,
           `iVar16` (a plain, truncated int here) was never it. */
        close_door_object(DAT_0024cff4,_case8_p1);
        return 2;
      }
      if (uVar4 != 2) {
        if (uVar4 == 3) {
          toggle_door_object(DAT_0024cff4,_case8_p1);
          return 2;
        }
        return 2;
      }
    }
    open_door_object(iVar16);
    return 2;
  case 9:
    goto LAB_0007dce4;
  case 10:
LAB_0007dce4:
    if (DAT_0024cff4 == (byte *)0x0) {
      return 2;
    }
    if (((param_1[2] & 0x3f) != 0x3f) && (((*DAT_0024cff4 & 0xf ^ param_1[2]) & 0x3f) != 0)) {
      return 2;
    }
    sVar3 = rand_below(*(undefined1 *)(DAT_00086df8 + 0x2a));
    uVar6 = get_message_string(0x2f5);
    FUN_0007ed20(uVar6,*(ushort *)((char *)g_player_object + 0x16) >> 10,
                 (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4,0,
                 CONCAT22(uVar20,*(ushort *)(DAT_0024cff4 + 0x16) >> 10),
                 CONCAT22(uVar21,(*(ushort *)(DAT_0024cff4 + 0x16) & 0x3f0) >> 4),0,0);
    uVar6 = encode_object_slot_index(DAT_0024cff4);
    iVar16 = FUN_00039bd8(uVar6,sVar3 + 3,4,0);
    return iVar16;
  case 0xb:
    local_34 = (char *)tilemap_lookup(param_1[2] & 0x3f,(byte)param_1[3] & 0x3f);
    local_34 = local_34 + 2;
    uVar6 = resolve_object_link(param_1 + 3);
    unlink_and_free_object(local_34,uVar6);
    FUN_00049924(2);
    return 2;
  case 0xc:
    uVar4 = (byte)param_1[3] & 0x3f | ((byte)param_1[2] & 0x3f) << 5;
    iVar11 = FUN_000452dc((short)uVar4 >> 6,(short)uVar4 >> 4 & 3,(byte)param_1[3] & 0xf,4,
                          auStack_38);
    if (iVar11 == 0) {
      return 2;
    }
    if ((((((byte)param_1[1] & 0x7f) != 0) && ((*(byte *)(iVar11 + 1) & 0x80) != 0)) &&
        ((*(ushort *)(iVar11 + 6) & 0x8000) == 0)) &&
       (*(ushort *)(iVar11 + 6) >> 6 < ((byte)param_1[1] & 0x7f))) {
      return 2;
    }
    break;
  case 0xd:
    uVar1 = param_1[1];
    uVar18 = (uint)(byte)param_1[3];
    uVar14 = uVar1 >> 10 & 7;
    uVar5 = uVar14 | (uVar18 & 0x3f) << 3;
    uVar4 = uVar1 >> 7 & 7;
    iVar11 = (int)(short)(uVar1 & 0x7f);
    if (iVar11 == 0) {
      uVar14 = (uint)(short)uVar5;
      if (uVar4 == 1) {
        uVar14 = *(uint *)(DAT_00086df8 + 0x65) & ~(1 << (uVar14 & 0xff));
      }
      else if (uVar4 == 5) {
        uVar14 = *(uint *)(DAT_00086df8 + 0x65) ^ 1 << (uVar14 & 0xff);
      }
      else {
        uVar14 = *(uint *)(DAT_00086df8 + 0x65) | 1 << (uVar14 & 0xff);
      }
      *(char *)(DAT_00086df8 + 0x65) = (char)uVar14;
      *(char *)(DAT_00086df8 + 0x66) = (char)(uVar14 >> 8);
      *(char *)(DAT_00086df8 + 0x67) = (char)(uVar14 >> 0x10);
      *(char *)(DAT_00086df8 + 0x68) = (char)(uVar14 >> 0x18);
      break;
    }
    bVar2 = (byte)uVar14;
    if (uVar4 == 0) {
      bVar2 = *(char *)(iVar11 + DAT_00086df8 + 0x70) + (bVar2 | (byte)((uVar18 & 0x1f) << 3));
LAB_0007d45c:
      *(byte *)(iVar11 + DAT_00086df8 + 0x70) = bVar2;
    }
    else {
      if (uVar4 == 1) {
        bVar2 = *(char *)(iVar11 + DAT_00086df8 + 0x70) - (bVar2 | (byte)((uVar18 & 0x1f) << 3));
        goto LAB_0007d45c;
      }
      if (uVar4 != 2) {
        if (uVar4 == 3) {
          bVar2 = *(byte *)(iVar11 + DAT_00086df8 + 0x70) & (bVar2 | (byte)((uVar18 & 0x1f) << 3));
        }
        else if (uVar4 == 4) {
          bVar2 = *(byte *)(iVar11 + DAT_00086df8 + 0x70) | bVar2 | (byte)((uVar18 & 0x1f) << 3);
        }
        else if (uVar4 == 5) {
          bVar2 = *(byte *)(iVar11 + DAT_00086df8 + 0x70) ^ (bVar2 | (byte)((uVar18 & 0x1f) << 3));
        }
        else {
          if (uVar4 != 6) goto LAB_0007d460;
          bVar2 = *(char *)(iVar11 + DAT_00086df8 + 0x70) << (uVar14 | (uVar18 & 0x1f) << 3);
        }
        goto LAB_0007d45c;
      }
      *(char *)(iVar11 + DAT_00086df8 + 0x70) = (char)uVar5;
    }
LAB_0007d460:
    *(byte *)(iVar11 + DAT_00086df8 + 0x70) = *(byte *)(iVar11 + DAT_00086df8 + 0x70) & 0x3f;
    break;
  case 0xe:
    uVar4 = param_1[1];
    uVar5 = (uint)(short)((int)(short)uVar4 & 0x7fU);
    uVar18 = (int)(((uVar4 >> 7 & 7) + ((int)(short)uVar4 & 0x7fU)) * 0x10000) >> 0x10;
    uVar14 = 0;
    if (uVar5 <= uVar18) {
      do {
        bVar19 = (uVar4 & 0xe000) != 0;
        uVar17 = uVar5 + DAT_00086df8;
        if (bVar19) {
          uVar17 = (uint)*(byte *)(uVar17 + 0x70);
        }
        if (bVar19) {
          uVar14 = uVar17 + uVar14;
        }
        else {
          uVar17 = *(byte *)(uVar17 + 0x70) & 7;
          uVar14 = (int)(short)uVar14 << 0x13;
        }
        uVar5 = (int)((uVar5 + 1) * 0x10000) >> 0x10;
        if (!bVar19) {
          uVar14 = uVar17 | (int)uVar14 >> 0x10;
        }
      } while ((int)uVar5 <= (int)uVar18);
      param_3 = (uint)sVar3;
    }
    if (((ushort)uVar14 !=
         (ushort)(uVar4 >> 10 & 7 | (param_1[3] & 0x3f | ((byte)param_1[2] & 0x3f) << 5) << 3)) &&
       ((param_1[3] & 0xffc0) != 0)) {
      iVar16 = resolve_object_link(param_1 + 3);
      if ((*(ushort *)(iVar16 + 4) & 0xffc0) == 0) {
        return 2;
      }
      uVar6 = resolve_object_link((ushort *)(iVar16 + 4));
      iVar16 = resolve_skill_gated_unlock_or_use(DAT_0024cff4,DAT_0024cff0,uVar6,0xffffffff);
      return iVar16;
    }
    break;
  case 0xf:
    break;
  case 0x10:
    iVar11 = get_message_string((byte)param_1[3] & 0x3f | ((byte)param_1[2] & 0x2f | 0x90) << 5);
    FUN_0007ea34(s_Look__it_s_a_text_trap_00087918);
    if (iVar11 != 0) {
      message_scroll_print_wrapped(iVar11);
    }
  }
  if ((param_1[3] & 0xffc0) != 0) {
    puVar12 = (ushort *)resolve_object_link(param_1 + 3);
    if ((*puVar12 & 0x1c0) == 0x180) {
      if ((*puVar12 & 0x30) < 0x20) {
        uVar4 = dispatch_trap_type_effect(puVar12,param_2,param_3);
      }
      else {
        uVar4 = resolve_skill_gated_unlock_or_use(DAT_0024cff4,DAT_0024cff0,puVar12,0xffffffff);
      }
      iVar16 = (int)(short)(uVar4 | (ushort)iVar16);
    }
  }
  return iVar16;
}





// was FUN_0007e0d8 -- per-object callback passed to
// for_each_object_of_type (see dispatch_quest_event_code's case 0x32,
// which sweeps every object of class 0xd8). When the object's flags
// nibble at +0xb is 7, resets it to 1. Also unconditionally resets
// the cursor confine rect (reset_cursor_confine_rect) and calls
// FUN_00028488 (not yet named) on the object. Reads as "reset a
// stuck class-0xd8 object's UI-confine state", but the exact meaning
// of the flag nibble isn't pinned down further here.
undefined4 reset_object_ui_state_callback(param_1)
int param_1;

{
  uint uVar1;
  
  if ((*(ushort *)(param_1 + 0xb) & 0xf) == 7) {
    uVar1 = *(ushort *)(param_1 + 0xb) & 0xfff1;
    *(byte *)(param_1 + 0xb) = (byte)uVar1 | 1;
    *(char *)(param_1 + 0xc) = (char)(uVar1 >> 8);
  }
  reset_cursor_confine_rect();
  FUN_00028488(param_1);
  return 0;
}



// was FUN_0007e12c -- dispatch_trap_type_effect's case 3 handler
// (called there as `FUN_0007e12c(param_1,param_2,param_3)`, the trap/
// link record and its tile x,y). Switches on the record's quality
// field (bits 0x3f at +4) across ~20 distinct codes, mostly
// delegating to still-unnamed helpers (FUN_0003a4a0, FUN_0003a2b0,
// FUN_0003a29c, FUN_00039f04, FUN_0003a0e8, FUN_0003a57c,
// FUN_0003a5ec, FUN_0003dc78) whose own purpose isn't pinned down
// yet. A few codes are more legible: code 2 calls
// restore_view_from_object_record; code 0x32 sweeps every class-0xd8
// object via for_each_object_of_type(reset_object_ui_state_callback);
// codes 0x3b-0x3e are gated on DAT_0024cff4 == g_player_object (the
// current trap-trigger context being the player); code 0x3f sets a
// quest-ish byte (DAT_0023c27c) and calls FUN_00049924(0x400). Reads
// as a "quest/cutscene event code" dispatcher, but most individual
// codes' real meaning is left undetermined here rather than guessed
// at.
undefined4 dispatch_quest_event_code(param_1,param_2,param_3)
int param_1;
undefined4 param_2;
undefined4 param_3;

{
  uint uVar1;
  
  uVar1 = *(ushort *)(param_1 + 4) & 0x3f;
  if (uVar1 < 0x2a) {
    if (uVar1 == 0x29) {
      FUN_0003a4a0();
    }
    else if (uVar1 == 2) {
      restore_view_from_object_record();
    }
    else if (2 < uVar1) {
      if (uVar1 < 5) {
        FUN_0003a2b0((*(byte *)(DAT_0024cff0 + 1) & 0x1e) >> 1,param_1,param_2,param_3);
      }
      else if (uVar1 == 5) {
        FUN_0003a29c(*(ushort *)(param_1 + 6) & 0x3f);
      }
      else if (uVar1 == 0x18) {
        FUN_00039f04(*(ushort *)(param_1 + 6) & 0x3f);
      }
      else if (uVar1 == 0x28) {
        FUN_0003a0e8();
      }
    }
  }
  else if (uVar1 == 0x2a) {
    FUN_0003a57c();
  }
  else if (uVar1 == 0x32) {
    for_each_object_of_type(0xd8,0,0,reset_object_ui_state_callback);
  }
  else if (uVar1 == 0x39) {
    FUN_0003a5ec();
  }
  else if (0x3b < uVar1) {
    if (uVar1 < 0x3f) {
      if (DAT_0024cff4 == g_player_object) {
        FUN_0003dc78((*(ushort *)(param_1 + 4) & 0x3f) - 0x3b,*(ushort *)(param_1 + 6) & 0x3f);
      }
    }
    else if (uVar1 == 0x3f) {
      DAT_0023c27c = (*(byte *)(param_1 + 6) & 0x3f) + 1;
      FUN_00049924(0x400);
    }
  }
  return 2;
}





// was FUN_0007e2dc -- allocates two new object slots and links both
// into the tile (param_1,param_2) object list at tilemap_lookup's
// head: the first is initialized with class/flag bits matching
// 0x180-bracket (the same "trap class" test dispatch_trap_type_effect
// uses, `& 0x1c0 == 0x180`) and linked to the second via the
// standard quality-link encoding (offset+2/3, matching
// resolve_object_variant_or_special_link's own field layout); the
// second stores param_3 in its low 4 bits (a trap-type code -- its
// only confirmed caller, cast_summon_or_spawn_effect, passes 9, which
// dispatch_trap_type_effect's case 9 cascades into case 10's "alert
// nearby guards" effect). Returns the first object's encoded slot
// index on success, 0 if either alloc_object_slot call failed. Reads
// as "place a scripted trap object pair at this tile", but the exact
// in-game spell/mechanic this serves beyond its one caller isn't
// confirmed.
undefined4 create_scripted_trap_pair_at_tile(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
uint param_3;

{
  int iVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  ushort *puVar5;
  byte *pbVar6;
  uint uVar7;
  undefined4 uVar8;
  byte bVar9;
  uint uVar10;
  uint uVar11;
  
  puVar4 = (ushort *)alloc_object_slot(0);
  if (puVar4 != (ushort *)0x0) {
    puVar5 = (ushort *)alloc_object_slot(0);
    if (puVar5 != (ushort *)0x0) {
      pbVar6 = (byte *)tilemap_lookup(param_1,param_2);
      uVar2 = *puVar4;
      uVar7 = uVar2 & 0xffa0 | 0x61a0;
      *(char *)puVar4 = (char)uVar7;
      *(char *)((char *)puVar4 + 1) = (char)(uVar7 >> 8);
      uVar7 = CONCAT11(*(undefined1 *)((char *)puVar4 + 3),(char)puVar4[1]) & 0xff80;
      bVar9 = *pbVar6 >> 1 & 0x78;
      *(byte *)(puVar4 + 1) = (byte)uVar7 | bVar9;
      *(char *)((char *)puVar4 + 3) = (char)(uVar7 >> 8);
      *(byte *)(puVar4 + 1) = bVar9;
      *(undefined1 *)((char *)puVar4 + 3) = 0x6c;
      uVar7 = uVar2 & 0xf3a0 | 0x61a0;
      *(char *)puVar4 = (char)uVar7;
      *(byte *)((char *)puVar4 + 1) = (byte)(uVar7 >> 8) | 0x90;
      *(undefined1 *)(puVar4 + 2) = 0;
      *(undefined1 *)((char *)puVar4 + 5) = 0;
      uVar7 = encode_object_slot_index(puVar5);
      iVar1 = (uVar7 & 0x3ff) << 6;
      bVar3 = (byte)puVar4[3] & 0x3f | (byte)iVar1;
      uVar2 = puVar4[2];
      bVar9 = (byte)uVar2;
      *(byte *)(puVar4 + 2) = (bVar9 ^ (byte)param_1) & 0x3f ^ bVar9;
      *(char *)((char *)puVar4 + 5) = (char)(uVar2 >> 8);
      *(byte *)(puVar4 + 3) = (bVar3 ^ (byte)param_2) & 0x3f ^ bVar3;
      *(char *)((char *)puVar4 + 7) = (char)((uint)iVar1 >> 8);
      object_list_insert_head(pbVar6 + 2,puVar4);
      uVar7 = *puVar5 & 0xff8f | 0x180;
      uVar11 = (uVar7 ^ param_3) & 0xf ^ uVar7;
      *(char *)puVar5 = (char)uVar11;
      *(byte *)((char *)puVar5 + 1) = (byte)(uVar7 >> 8) | 0x60;
      bVar9 = *pbVar6 >> 1 & 0x78;
      uVar7 = (uint)CONCAT11(*(undefined1 *)((char *)puVar5 + 3),(char)puVar5[1]);
      uVar10 = uVar7 & 0xff80;
      *(byte *)(puVar5 + 1) = bVar9 | (byte)uVar10;
      *(char *)((char *)puVar5 + 3) = (char)(uVar10 >> 8);
      uVar7 = uVar7 & 0x380;
      *(byte *)(puVar5 + 1) = bVar9 | (byte)uVar7;
      *(byte *)((char *)puVar5 + 3) = (byte)(uVar7 >> 8) | 0x6c;
      *(byte *)(puVar5 + 3) = (byte)puVar5[3] & 0x3f;
      *(undefined1 *)((char *)puVar5 + 7) = 0;
      *(undefined1 *)(puVar5 + 2) = 0x3f;
      *(undefined1 *)((char *)puVar5 + 5) = 0;
      uVar11 = uVar11 & 0xe3ff;
      *(char *)puVar5 = (char)uVar11;
      *(byte *)((char *)puVar5 + 1) = (byte)(uVar11 >> 8) | 0xe2;
      object_list_insert_head(pbVar6 + 2,puVar5);
      uVar8 = encode_object_slot_index(puVar4);
      return uVar8;
    }
    free_object_slot(puVar4);
  }
  return 0;
}





// was FUN_0007e558 -- the special-case cleanup free_trap_class_object
// defers to for a class-0x180 (trap) object being deleted: param_2 is
// the trap object itself, param_1 the link-field address it's being
// unlinked from. Resolves the trap's own linked sub-object (offset
// +6) and reads a 4-bit "remaining count" field from it (bits
// 0x1e00). When the count is down to its last unit (==1), does a
// full refresh sweep instead of an incremental one
// (refresh_object_link_chain on the tile's object list) rather than
// freeing param_2 directly here -- that sweep is expected to catch
// param_2 itself along with any other stale markers. Otherwise,
// decrements the count field in place and unlinks+frees param_2
// immediately (object_list_unlink + free_object_slot).
void remove_trap_chain_marker(param_1,param_2)
undefined4 param_1;
int param_2;

{
  uint uVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  char *iVar5;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  puVar4 = (ushort *)resolve_object_link(param_2 + 6);
  uVar2 = *puVar4;
  uVar1 = (uVar2 & 0x1e00) >> 9;
  if ((short)uVar1 == 1) {
    iVar5 = (char *)tilemap_lookup(*(byte *)(param_2 + 4) & 0x3f,*(ushort *)(param_2 + 6) & 0x3f);
    refresh_object_link_chain(iVar5 + 2,puVar4);
  }
  else {
    bVar3 = (byte)(uVar2 >> 8);
    *(char *)puVar4 = (char)uVar2;
    *(byte *)((char *)puVar4 + 1) = ((byte)(uVar1 * 0x200 + -1 >> 8) ^ bVar3) & 0x1e ^ bVar3;
    object_list_unlink(param_1,param_2);
    free_object_slot(param_2);
  }
  return;
}



// was FUN_0007e610 -- confirmed by its own caller's pre-existing
// comment (free_linked_object_recursive, src/objects.c: "param_1==
// 0x180 class (containers) instead defer to FUN_0007e610") as the
// special-case delete path for a class-0x180 (trap) object, taken
// instead of the normal recursive object-tree free. Dispatches on
// param_2's own low class bits (0x30): a low-class ("open"?) trap
// object goes straight to a full refresh_object_link_chain sweep;
// anything else goes to the incremental
// remove_trap_chain_marker path.
//
// HACK: both calls were bare `refresh_object_link_chain();` /
// `FUN_0007e558();` in the original decompile -- dropped arguments,
// the same class of bug fixed repeatedly elsewhere in this file. This
// function does no other work before either call, so on ARM's
// register-passthrough calling convention param_1/param_2 are still
// sitting in r0/r1 unchanged from this function's own entry; both
// callees take exactly this function's own two parameters (see their
// own signatures), so passing them through explicitly restores the
// evidently-intended behavior.
void free_trap_class_object(param_1,param_2)
undefined4 param_1;
byte * param_2;

{
  if ((*param_2 & 0x30) < 0x11) {
    refresh_object_link_chain(param_1,param_2);
  }
  else {
    remove_trap_chain_marker(param_1,param_2);
  }
  return;
}





// was FUN_0007e694 -- its only confirmed caller is
// dispatch_trap_type_effect's case 7 ("spawn trap"), which aborts the
// spawn when this returns nonzero for the target object (class 0x40).
// Stashes param_1 into DAT_0024cfd4 (for the callback below to read)
// and zeroes DAT_0024cff8 (a shared "result" global) before running
// scan_area_ahead_of_object with &DAT_0007e644 as its callback,
// finally returning whatever DAT_0024cff8 ended up as.
//
// GAP: DAT_0007e644 is declared as a plain zero-initialized data
// array (DAT_0007e644_backing[8192]), not a decompiled function --
// but every other scan_area_ahead_of_object call site (see
// src/object_actions.c) passes a real function or function-pointer-
// table entry in this exact argument position, so &DAT_0007e644 is
// almost certainly meant to be a callback Ghidra never recovered as
// code, the same class of gap already documented for
// DAT_00087604/PTR_FUN_00087614 (uw.c, ~line 1676) in an earlier
// session pass. On this host the callback storage is zero-filled, so
// if scan_area_ahead_of_object ever actually invokes it, real
// behavior can't be inferred here -- left as an honest gap rather
// than guessed at.
undefined4 check_object_area_for_spawn_block(param_1)
undefined4 param_1;

{
  DAT_0024cff8 = 0;
  DAT_0024cfd4 = param_1;
  scan_area_ahead_of_object(param_1,1,&DAT_0007e644,0,0,4);
  return DAT_0024cff8;
}





// was FUN_0007e6e0 -- returns 1 when param_1 is 0, or when the tile
// (param_2,param_3) is more than 7 tiles away from the player's own
// view tile (g_player_object+0x16, matching the "current view tile"
// field used throughout this file) on either axis; returns 0 when
// param_1 is nonzero AND the tile is within 7 tiles on both axes.
// Both confirmed callers (process_nearby_background_traps and
// tick_ambient_doors_and_scheduler) only
// act on their own effect (dispatch_trap_type_effect /
// open_door_object) when this returns nonzero, i.e. when the tile is
// NOT near the player -- reads as "only fire background/ambient
// triggers when the player isn't standing right there to see it",
// though the exact rationale isn't confirmed beyond that pattern.
undefined4 is_out_of_player_range(param_1,param_2,param_3)
int param_1;
short param_2;
short param_3;

{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  
  if (((param_1 == 0) ||
      (uVar3 = (int)(short)(*(ushort *)((char *)g_player_object + 0x16) >> 10) - (int)param_2,
      uVar1 = (int)uVar3 >> 0x1f, 7 < (int)((uVar3 ^ uVar1) - uVar1))) ||
     (uVar3 = (int)(short)((*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4) - (int)param_3,
     uVar1 = (int)uVar3 >> 0x1f, uVar2 = 0, 7 < (int)((uVar3 ^ uVar1) - uVar1))) {
    uVar2 = 1;
  }
  return uVar2;
}





// was FUN_0007e778 -- periodic world-tick helper: scans every type-6
// object within 7 tiles (FUN_000539b0, not yet named) and, for each
// whose class bits (0x1e at +1) are clear, resolves its linked
// sub-object, sets a flag bit on it, and -- only when
// is_out_of_player_range(param_1, tile) is true -- fires
// dispatch_trap_type_effect on it. Two confirmed callers pass
// different param_1 values: src/player.c's rest/tick handler passes 0
// (which is_out_of_player_range treats as "always fire", i.e.
// unconditional regardless of player position), while a periodic
// hunger-tick block in uw.c passes 1 under a random 1-in-4 gate
// (respecting actual player proximity). Reads as "tick background/
// ambient trap objects periodically, gated on the player not being
// right next to them unless explicitly overridden".
void process_nearby_background_traps(param_1)
undefined4 param_1;

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  short local_14;
  short local_12;

  local_14 = 0;
  local_12 = 0;
  iVar2 = FUN_000539b0(6,0,7,&local_14,&local_12);
  while (iVar2 != 0) {
    if ((*(byte *)(iVar2 + 1) & 0x1e) == 0) {
      iVar3 = resolve_object_link(iVar2 + 6);
      /* HACK: was a bare `object_ptr_in_arena();` -- dropped argument,
         the same class of bug fixed repeatedly elsewhere in this
         file. object_ptr_in_arena takes exactly one argument at every
         other call site in this codebase, and iVar3 (just set from
         resolve_object_link on the line above) is obviously the
         intended one here. */
      iVar4 = object_ptr_in_arena(iVar3);
      if (iVar4 != 0) {
        uVar1 = *(undefined2 *)(iVar3 + 0xd);
        *(char *)(iVar3 + 0xd) = (char)uVar1;
        *(byte *)(iVar3 + 0xe) = (byte)((ushort)uVar1 >> 8) | 1;
        iVar3 = is_out_of_player_range(param_1,(int)local_14,(int)local_12);
        if (iVar3 != 0) {
          dispatch_trap_type_effect(iVar2,(int)local_14,(int)local_12);
        }
      }
    }
    local_14 = local_14 + 1;
    iVar2 = FUN_000539b0(6,0,7,&local_14,&local_12);
  }
  return;
}





// was FUN_0007e85c -- periodic world-tick helper, sibling to
// process_nearby_background_traps: scans every type-5 (door) object
// world-wide, and for each unlocked (class bit 0x80 clear), non-
// trivial (quality nibble > 7) door, rolls a 30% chance
// (rand_below(10) < 3) to open it via open_door_object -- but only
// when is_out_of_player_range(param_1, tile) is true, gating the
// effect the same way process_nearby_background_traps does.
// Afterward, when param_1 is 0 and DAT_000879ac is set, advances the
// scheduler 8 ticks (scheduler_tick(1) x8). Its only confirmed caller
// (src/player.c's rest/tick handler, alongside
// process_nearby_background_traps(0) a few lines later) always passes
// 0. Reads as "simulate ambient doors opening and advance scheduled
// events after a rest/wait", though the exact trigger condition for
// the scheduler-advance half isn't confirmed.
void tick_ambient_doors_and_scheduler(param_1)
int param_1;

{
  byte *pbVar1;
  int iVar2;
  short local_1c;
  short local_1a;
  
  local_1c = 0;
  local_1a = 0;
  pbVar1 = (byte *)FUN_000539b0(5,0,0xffffffff,&local_1c,&local_1a);
  while (pbVar1 != (byte *)0x0) {
    /* was folded into `int iVar2` (reused below for unrelated int
       values) -- truncated tilemap_lookup's real `void *` return */
    char *_tile2 = (char *)tilemap_lookup((int)local_1c,(int)local_1a);
    if ((((*(byte *)(_tile2 + 1) & 0x80) == 0) && (7 < (*pbVar1 & 0xf))) &&
       (iVar2 = rand_below(10), iVar2 < 3)) {
      DAT_002020a0 = local_1c;
      DAT_002020a4 = local_1a;
      /* HACK: was a bare `FUN_0007e6e0(param_1);` -- dropped
         arguments, the same class of bug fixed repeatedly elsewhere in
         this file. is_out_of_player_range takes exactly three params
         (an acting object plus a tile x/y), and its sibling caller
         process_nearby_background_traps (just above) calls it with its own loop tile
         coordinates in this exact position; this loop's own
         local_1c/local_1a (the tile just scanned, freshly stored into
         DAT_002020a0/DAT_002020a4 the lines above) are obviously the
         intended arguments here. */
      iVar2 = is_out_of_player_range(param_1,(int)local_1c,(int)local_1a);
      if (iVar2 != 0) {
        open_door_object(pbVar1);
      }
    }
    local_1c = local_1c + 1;
    pbVar1 = (byte *)FUN_000539b0(5,0,0xffffffff,&local_1c,&local_1a);
  }
  if ((param_1 == 0) && (DAT_000879ac != 0)) {
    iVar2 = 0;
    do {
      scheduler_tick(1);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 8);
  }
  return;
}



