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
// FUN_0007e12c, FUN_00039790, FUN_0007ed20, FUN_000452dc) whose own
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
    iVar16 = FUN_0007e12c(param_1,param_2,param_3);
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
    if (((*puVar12 & 0x1c0) == 0x40) && (iVar16 = FUN_0007e694(puVar12), iVar16 != 0)) {
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



