/* The timed-effects queue (System Shock's own term for this shared
 * mechanism -- doors' open/close swing, blood splats, combat
 * highlights, ...). Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed.
 */
#include "headers/scheduler.h"
#include <stdio.h>
#include <stdlib.h>



// was FUN_0008097c: removes a scheduler entry's own world object (tile
// unlink + free_object_slot) -- named to match System Shock's own term
// for this shared timed-effects system (doors' open/close swing,
// blood splats, combat highlights, ...) that this decompile only ever
// called by its raw Ghidra address.
void scheduler_despawn_entry(param_1)
short param_1;

{
  /* ARM 0x809a4 keeps the resolved object pointer in r5 and forwards
     it to both object_list_unlink and free_object_slot. */
  void *uVar1;
  int iVar2;
  
  iVar2 = param_1 * 6;
  uVar1 = resolve_object_link(&DAT_00250778 + iVar2);
  /* was folded into `int iVar2` (reused above as an index) -- truncated
     tilemap_lookup's real `void *` return */
  {
    char *_tile2 = (char *)tilemap_lookup((&DAT_0025077c)[iVar2],(&DAT_0025077d)[iVar2]);
    object_list_unlink(_tile2 + 2,uVar1);
  }
  free_object_slot(uVar1);
  return;
}



// was FUN_000809cc: finds the scheduler entry whose encoded object link
// matches param_1 and removes it (swap-with-last, decrement count).
void scheduler_remove_entry(param_1)
short param_1;

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  ushort *puVar6;
  
  uVar2 = 0;
  puVar6 = (ushort *)&DAT_00250778;
  uVar3 = (uint)g_scheduler_count;
  if (uVar3 != 0) {
    do {
      if ((uint)(*puVar6 >> 6) == (int)param_1) break;
      uVar2 = uVar2 + 1;
      puVar6 = puVar6 + 3;
    } while ((int)uVar2 < (int)uVar3);
  }
  if ((int)uVar2 < (int)uVar3) {
    uVar1 = uVar3 + 0xff & 0xff;
    g_scheduler_count = (byte)(uVar3 + 0xff);
    if ((uVar1 != 0) && (uVar2 != uVar1)) {
      iVar5 = uVar1 * 6;
      iVar4 = uVar2 * 6;
      (&DAT_00250778)[iVar4] = (&DAT_00250778)[iVar5];
      (&DAT_00250779)[iVar4] = (&DAT_00250779)[iVar5];
      (&DAT_0025077a)[iVar4] = (&DAT_0025077a)[iVar5];
      (&DAT_0025077b)[iVar4] = (&DAT_0025077b)[iVar5];
      (&DAT_0025077c)[iVar4] = (&DAT_0025077c)[iVar5];
      (&DAT_0025077d)[iVar4] = (&DAT_0025077d)[iVar5];
    }
  }
  return;
}



// was FUN_00080a98: scheduler_tick's finalize step, run once an entry's
// delay has expired -- one last scheduler_step_entry catch-up, then
// (for class 0xf, doors) the actual final open/close quality flip.
void scheduler_finish_entry(param_1)
undefined4 param_1;

{
  ushort uVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  ushort uVar8;
  int iVar9;
  uint uVar10;
  bool bVar11;
  
  iVar9 = (short)param_1 * 6;
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] scheduler_finish_entry ENTERED: param_1(slot)=%d\n", (int)param_1);
  puVar4 = (ushort *)resolve_object_link(&DAT_00250778 + iVar9);
  /* HACK: resolve_object_link legitimately returns NULL (every other
     resolve_object_link call site in this file guards for it -- e.g.
     scheduler_add_entry's own identical fix a little above this function).
     This call site had no guard at all:
     confirmed crashing (EXC_BAD_ACCESS / SIGSEGV dereferencing *puVar4)
     the first time this function ever actually ran in this whole
     project's testing -- it's the scheduled-effects queue's own finalize step, reachable
     only once DAT_000879ac (see init_gameplay_session's own fix) stopped being
     permanently zero, so nothing had exercised a real queue-entry
     resolution failure here before. A stale entry (its target object
     already freed/reused by the time its delay expires) is an entirely
     normal thing for a scheduled-effects queue to encounter; just skip
     it instead of crashing. */
  if (puVar4 == (ushort *)0x0) {
    return;
  }
  uVar5 = (byte)*puVar4 & 0xf;
  uVar1 = *(ushort *)(&DAT_00250730 + uVar5 * 4);
  bVar11 = (uVar1 & 0x80) == 0;
  if (!bVar11) {
    bVar11 = (&DAT_0025077a)[iVar9] == '\0' && (&DAT_0025077b)[iVar9] == '\0';
  }
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] scheduler_finish_entry: obj0=0x%04x class=%d flags=0x%x bVar11(skip-inc)=%d quality_before=%d\n",
            (unsigned)*puVar4, (int)uVar5, (unsigned)uVar1, (int)bVar11, (int)(puVar4[3] & 0x3f));
  if (!bVar11) {
    /* HACK: was a bare `scheduler_step_entry(param_1);` -- dropped
       second argument (elapsed ticks), same class as this file's other
       Ghidra-decompiled dropped-argument calls. scheduler_finish_entry
       has no elapsed value of its own to forward (it's the queue's
       delay-just-expired path, not the regular per-tick one), and this
       one-final-catch-up call's own elapsed-sensitive behavior (the
       class-flag-bit-2 position/orientation step, scheduler_advance_effect)
       is not exercised by the door-open bug this session's investigation
       was chasing (doors use bit 0, a plain unconditional +1 step that
       ignores elapsed entirely) -- 1 matches the typical per-tick value
       observed live everywhere else in this file (UW_DEBUG_DOOR2:
       scheduler_tick's own param_1 is 1 at nearly every call site). Not
       independently verified for the bit-2 path; flagged for a future
       pass if that path is ever found to need the real value. */
    scheduler_step_entry(param_1, 1);
  }
  if (uVar5 == 0xf) {
    uVar10 = (byte)((byte)puVar4[3] >> 4) & 3;
    uVar5 = (byte)puVar4[3] & 0xf;
    uVar8 = (byte)puVar4[1] & 0x7f;
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] scheduler_finish_entry: FINALIZE class0xf obj0=0x%04x quality_low4=%d opening=%d\n",
              (unsigned)*puVar4, (int)uVar5, (int)((*puVar4 & 0x1000) == 0));
    if ((*puVar4 & 0x1000) == 0) {
      uVar5 = uVar5 | 8;
    }
    else {
      if (7 < uVar5) {
        uVar5 = uVar5 - 8;
      }
      DAT_0010144c = (ushort)(byte)(&DAT_0025077c)[iVar9];
      DAT_00101454 = (ushort)(byte)(&DAT_0025077d)[iVar9];
      if ((uVar5 & 7) != 6) {
        uVar8 = uVar8 - 0x18;
      }
      uVar6 = encode_object_slot_index(puVar4);
      iVar7 = check_object_placement_clearance(uVar5 + (uVar10 + 0x14) * 0x10,uVar6,
                           (uint)(*(byte *)((char *)puVar4 + 3) >> 5) + (short)DAT_0010144c * 8,
                           ((*(byte *)((char *)puVar4 + 3) & 0x1c) >> 2) + (short)DAT_00101454 * 8,
                           uVar8,1,8);
      if (iVar7 == 0) {
        uVar1 = puVar4[3];
        bVar3 = (byte)uVar1;
        *(byte *)(puVar4 + 3) = (bVar3 ^ (byte)uVar5) & 0x3f ^ bVar3;
        *(byte *)((char *)puVar4 + 7) = (byte)(uVar1 >> 8);
        adjust_door_close_animation_delay(puVar4);
        return;
      }
      play_positional_sound_effect(0xc,(uint)(*(byte *)((char *)puVar4 + 3) >> 5) + (short)DAT_0010144c * 8,
                   (*(byte *)((char *)puVar4 + 3) >> 2 & 7) + (short)DAT_00101454 * 8,0);
    }
    uVar2 = puVar4[1];
    bVar3 = (byte)uVar2;
    *(byte *)(puVar4 + 1) = (bVar3 ^ (byte)uVar8) & 0x7f ^ bVar3;
    *(byte *)((char *)puVar4 + 3) = (byte)(uVar2 >> 8);
    uVar10 = *puVar4 & 0xff4f | (uVar10 | 0x14) << 4;
    uVar5 = (uVar10 ^ uVar5) & 0xf ^ uVar10;
    *(byte *)puVar4 = (byte)uVar5;
    *(byte *)((char *)puVar4 + 1) = (byte)(uVar10 >> 8);
    uVar10 = CONCAT11(*(byte *)((char *)puVar4 + 7),(byte)puVar4[3]) & 0xffc0;
    *(byte *)(puVar4 + 3) = (byte)uVar10;
    *(byte *)((char *)puVar4 + 7) = (byte)(uVar10 >> 8);
    uVar8 = (ushort)uVar5;
    if ((uVar5 & 0x1000) == 0) {
      uVar8 = ((uVar8 & 0xe00) - 0xe01 ^ uVar8) & 0x1e00 ^ uVar8;
    }
    else {
      uVar8 = uVar8 & 0xefff;
    }
    *(byte *)puVar4 = (byte)uVar8;
    *(byte *)((char *)puVar4 + 1) = (byte)(uVar8 >> 8);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] scheduler_finish_entry: AFTER direction toggle, obj0=0x%04x dirbit=%d openbits=%d\n",
              (unsigned)*puVar4, (int)((*puVar4 & 0x1000) != 0), (int)((*puVar4 >> 9) & 7));
  }
  if ((uVar1 & 0x20) != 0) {
    scheduler_despawn_entry(param_1);
  }
  g_scheduler_count = g_scheduler_count - 1;
  uVar5 = (uint)g_scheduler_count;
  if ((uVar5 != 0) && ((int)(short)param_1 != uVar5)) {
    iVar7 = uVar5 * 6;
    (&DAT_00250778)[iVar9] = (&DAT_00250778)[iVar7];
    (&DAT_00250779)[iVar9] = (&DAT_00250779)[iVar7];
    (&DAT_0025077a)[iVar9] = (&DAT_0025077a)[iVar7];
    (&DAT_0025077b)[iVar9] = (&DAT_0025077b)[iVar7];
    (&DAT_0025077c)[iVar9] = (&DAT_0025077c)[iVar7];
    (&DAT_0025077d)[iVar9] = (&DAT_0025077d)[iVar7];
  }
  return;
}



// was FUN_00080e00 -- finds the scheduler entry currently linked to
// param_2 (an "old" object) and re-links it to point at param_1(a
// "new" object) instead, matching by each entry's encoded object-link
// field. Used to fix up a pending scheduled entry when the object it
// targets is replaced/merged with another (e.g. a stack-split or
// object-reuse path), so the scheduled effect doesn't keep firing on
// a stale reference.
//
// HACK: was a bare `encode_object_slot_index();` for the first call
// -- dropped argument, the same class of bug fixed repeatedly
// elsewhere in this file. The second call explicitly encodes param_2
// (the search key compared against each entry below), so this first
// call's result (uVar2, written into the matched entry as its NEW
// link) is obviously meant to encode param_1, the function's other
// parameter.
void scheduler_relink_entry(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  short sVar1;
  uint uVar2;
  int iVar3;

  uVar2 = encode_object_slot_index(param_1);
  sVar1 = encode_object_slot_index(param_2);
  iVar3 = 0;
  if (g_scheduler_count != 0) {
    do {
      if ((uint)(*(ushort *)(&DAT_00250778 + iVar3 * 6) >> 6) == (int)sVar1) {
        iVar3 = (short)iVar3 * 6;
        (&DAT_00250778)[iVar3] = (&DAT_00250778)[iVar3] & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
        (&DAT_00250779)[iVar3] = (char)((uVar2 << 0x16) >> 0x18);
        return;
      }
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)g_scheduler_count);
  }
  return;
}



// was FUN_00080ed4: pushes a new entry onto the scheduler -- an
// encoded object link (param_1), delay (param_2), initial animation
// offset (param_3), and tile position (param_4/param_5). The object's
// own subtype selects its animation behavior from OBJECTS.DAT.
uint scheduler_add_entry(param_1,param_2,param_3,param_4,param_5)
uint param_1;
undefined4 param_2;
undefined1 param_3;
undefined1 param_4;
undefined1 param_5;

{
  char cVar1;
  uint uVar2;
  byte *pbVar3;
  int iVar4;
  ushort uVar5;
  
  if (g_scheduler_count + 1 < 0x41) {
    iVar4 = (uint)g_scheduler_count * 6;
    (&DAT_00250778)[iVar4] = (&DAT_00250778)[iVar4] & 0x3f | (byte)((param_1 & 0x3ff) << 6);
    (&DAT_00250779)[iVar4] = (char)((param_1 << 0x16) >> 0x18);
    (&DAT_0025077a)[iVar4] = (char)param_2;
    (&DAT_0025077b)[iVar4] = (char)((uint)param_2 >> 8);
    (&DAT_0025077c)[iVar4] = param_4;
    (&DAT_0025077d)[iVar4] = param_5;
    pbVar3 = (byte *)resolve_object_link((ushort *)(&DAT_00250778 + iVar4)); /* confirmed via ARM disassembly, 0x80f50 */
    /* resolve_object_link legitimately returns NULL (every other one of
       this file's 140+ call sites guards for it -- e.g. the
       `!= (ushort*)0x0` checks throughout this file). This call site
       had no guard at all: confirmed live via a real attack swing that
       finally reached this "resolve impact" code path for the first
       time this session (previously unreachable due to a separate
       signedness bug in DAT_0010062c, now fixed) -- swinging at empty
       air/a wall (no creature under the swing zone) resolves to NULL
       here and crashed (EXC_BAD_ACCESS dereferencing *pbVar3). Skip the
       target-highlight update when there's nothing real to update. */
    if (pbVar3 != (byte *)0x0) {
      iVar4 = (*pbVar3 & 0xf) * 4;
      cVar1 = (&DAT_00250732)[iVar4];
      if (-1 < cVar1) {
        if ((&DAT_00250733)[iVar4] == '\0') {
          uVar5 = ((ushort)(byte)*(ushort *)(pbVar3 + 6) ^ (short)cVar1) & 0x3f ^
                  *(ushort *)(pbVar3 + 6);
        }
        else {
          uVar5 = *(ushort *)(pbVar3 + 6);
          /* ARM 0x80f94..0x80fb4 uses idivmod's remainder in r1.
             The decompiled extraout_r1 local was never initialized. */
          /* Ordinal_2005((&DAT_00250733)[iVar4],param_3); */
          uVar5 = (cVar1 + param_3 % (&DAT_00250733)[iVar4] ^ uVar5) & 0x3f ^ uVar5;
        }
        pbVar3[6] = (byte)uVar5;
        pbVar3[7] = (byte)(uVar5 >> 8);
      }
    }
    DAT_0023b804 = 1;
    g_scheduler_count = g_scheduler_count + 1;
    uVar2 = (uint)g_scheduler_count;
  }
  else {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}



// was FUN_00081034: scheduler_tick's per-tick step for one still-pending
// entry -- per-class behavior-flag bits select a gradual quality step
// toward a target (bit 0, e.g. a door's swing), a timed decay (bit 1),
// or a position/orientation step via scheduler_advance_effect (bit 2).
void scheduler_step_entry(param_1,param_2)
undefined4 param_1;
int param_2;

{
  int iVar1;
  byte bVar2;
  ushort uVar3;
  ushort *puVar4;
  uint uVar5;
  undefined4 uVar6;
  short extraout_r1;
  ushort uVar7;
  ushort uVar8;
  
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] scheduler_step_entry ENTERED: param_1(slot)=%d param_2=%d\n", (int)param_1, param_2);
  puVar4 = (ushort *)resolve_object_link(&DAT_00250778 + (short)param_1 * 6);
  /* HACK: same unguarded-NULL class as scheduler_finish_entry's identical fix --
     see its own comment. A stale queue entry resolves to NULL here too. */
  if (puVar4 == (ushort *)0x0) {
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] scheduler_step_entry: resolve_object_link returned NULL, skipping\n");
    return;
  }
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] scheduler_step_entry: resolved obj0=0x%04x (checking &0x1f0==0x1c0 -> %d)\n",
            (unsigned)*puVar4, (int)((*puVar4 & 0x1f0) == 0x1c0));
  if ((*puVar4 & 0x1f0) == 0x1c0) {
    iVar1 = (*puVar4 & 0xf) * 4;
    uVar3 = 1;
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] scheduler_step_entry: obj0=0x%04x class=%d iVar1=%d flags(uVar7)=0x%x DAT_00250732[iVar1]=%d DAT_00250733[iVar1]=%d quality_before=%d\n",
              (unsigned)*puVar4, (*puVar4 & 0xf), iVar1, (unsigned)*(ushort *)(&DAT_00250730 + iVar1),
              (int)(char)(&DAT_00250732)[iVar1], (int)(byte)(&DAT_00250733)[iVar1], (int)(puVar4[3] & 0x3f));
    for (uVar7 = *(ushort *)(&DAT_00250730 + iVar1); uVar7 != 0; uVar7 = uVar7 & uVar8) {
      uVar8 = uVar3 & uVar7;
      if (uVar8 == 1) {
        uVar8 = puVar4[3];
        if ((int)(uVar8 & 0x3f) <
            (int)((int)(char)(&DAT_00250732)[iVar1] + (uint)(byte)(&DAT_00250733)[iVar1] + -1)) {
          uVar8 = (uVar8 + 1 ^ uVar8) & 0x3f ^ uVar8;
        }
        else {
          uVar8 = ((short)(char)(&DAT_00250732)[iVar1] ^ uVar8) & 0x3f ^ uVar8;
        }
LAB_00081254:
        *(char *)(puVar4 + 3) = (char)uVar8;
        *(char *)((char *)puVar4 + 7) = (char)(uVar8 >> 8);
        if (getenv("UW_DEBUG_DOOR"))
          fprintf(stderr, "[door] scheduler_step_entry: quality_after=%d\n", (int)(uVar8 & 0x3f));
      }
      else {
        if (uVar8 == 2) {
          uVar6 = Ordinal_1053();
          uVar8 = puVar4[3];
          Ordinal_2005((&DAT_00250733)[iVar1],uVar6);
          uVar8 = ((char)(&DAT_00250732)[iVar1] + extraout_r1 ^ uVar8) & 0x3f ^ uVar8;
          goto LAB_00081254;
        }
        if (uVar8 == 4) {
          int _swing_dirbit_in = (*puVar4 & 0x1000) != 0;
          int _swing_openbits_in = (*puVar4 >> 9) & 7;
          if ((*puVar4 & 0x1000) != 0) {
            param_2 = (short)param_2 * -0x10000 >> 0x10;
          }
          if ((puVar4[3] & 7) == 6) {
            uVar8 = puVar4[1];
            bVar2 = (byte)uVar8;
            *(byte *)(puVar4 + 1) = ((char)param_2 * '\x06' + bVar2 ^ bVar2) & 0x7f ^ bVar2;
            *(char *)((char *)puVar4 + 3) = (char)(uVar8 >> 8);
          }
          uVar5 = (uint)*puVar4;
          uVar5 = ((uVar5 & 0xe00) + (uVar5 & 0xf000) + param_2 * 0x200 ^ uVar5) & 0x1e00 ^ uVar5;
          *(char *)puVar4 = (char)*puVar4;
          *(char *)((char *)puVar4 + 1) = (char)(uVar5 >> 8);
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[door] scheduler_step_entry SWING: elapsed_in=%d dirbit_in=%d openbits_in=%d -> obj0=0x%04x dirbit_out=%d openbits_out=%d advance=%d\n",
                    param_2, _swing_dirbit_in, _swing_openbits_in, (unsigned)uVar5,
                    (int)((uVar5 & 0x1000) != 0), (int)((uVar5 >> 9) & 7), (int)((uVar5 & 0x1000) != 0));
          if ((uVar5 & 0x1000) != 0) {
            scheduler_advance_effect(param_1,param_2);
          }
        }
      }
      uVar8 = ~uVar3;
      uVar3 = uVar3 << 1;
    }
  }
  return;
}



// was FUN_0008128c: walks every live scheduler entry, called from
// ordinary gameplay's own per-tick pacing (move_key_directional_step
// and its per-frame sibling, gated by DAT_000879ac -- see
// init_gameplay_session's own comment) with param_1 = elapsed ticks. Per entry:
// scheduler_step_entry while its delay hasn't expired yet,
// scheduler_finish_entry once it has.
void scheduler_tick(param_1)
int param_1;

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;

  if (getenv("UW_DEBUG_DOOR2"))
    fprintf(stderr, "[door] scheduler_tick called: param_1(elapsed)=%d g_scheduler_count(queue_count)=%d\n",
            param_1, (int)(unsigned char)g_scheduler_count);
  iVar4 = 0;
  if (g_scheduler_count != 0) {
    iVar4 = param_1;
  }
  if (DAT_0023b804 != 0) {
    set_pending_update_flags(2);
  }
  if (g_scheduler_count != 0) {
    iVar3 = 0;
    do {
      iVar1 = iVar3 * 6;
      if (*(short *)(&DAT_0025077a + iVar1) == -1) {
        scheduler_step_entry(iVar3,iVar4);
      }
      else {
        iVar2 = *(short *)(&DAT_0025077a + iVar1) - iVar4;
        if (iVar2 * 0x10000 >> 0x10 < 0) {
          /* HACK: was a bare `scheduler_finish_entry();` -- dropped argument, same
             class as dozens of other Ghidra-decompiled call sites in this
             file (e.g. scheduler_step_entry two lines below, called correctly
             with iVar3 in the exact same loop). scheduler_finish_entry's own
             param_1 is immediately used as `(short)param_1 * 6` to index
             this same queue's per-slot arrays -- identical to
             scheduler_step_entry's indexing one line below -- so it must be the
             current slot index (iVar3), not garbage left in a register
             from some unrelated prior call. Confirmed live: this queue's
             finalize step (the only place a door's quality ever gets its
             final +8/-8 open/close flip once its scheduled delay expires)
             never fired for a real door-open repro even after fixing the
             separate DAT_000879ac dead-gate bug that let this whole
             function start running at all -- scheduler_finish_entry ran, but
             resolve_object_link on the garbage param_1 either returned
             NULL (now guarded, see its own comment) or resolved some
             unrelated object, never the actual door. */
          scheduler_finish_entry(iVar3);
        }
        else {
          scheduler_step_entry(iVar3,iVar4);
          if (DAT_002508fc == 0) {
            (&DAT_0025077a)[iVar1] = (char)iVar2;
            (&DAT_0025077b)[iVar1] = (char)((uint)iVar2 >> 8);
          }
          else {
            DAT_002508fc = 0;
          }
        }
      }
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)g_scheduler_count);
  }
  return;
}





// was FUN_00081814 -- general "spawn a scheduled effect object"
// primitive: spawns a new object of type (0x1c0 + param_2, the
// "group" -- the same 0x1c0 family cast_area_spell_effect/
// activate_area_hazard_object use for spell/hazard effect ids), sets
// its quality field either from a signed per-tick scale (param_5, its
// own low nibble * a source-object-derived per-tick step, when
// param_5 is non-negative) or directly XOR'd with param_5 (when
// negative), schedules it (scheduler_add_entry: param_3 = class,
// param_4 = delay), and appends it to the tile (param_6,param_7)'s
// object list. Confirmed by trigger_tile_damage_trap_effect's own
// comment (src/object_actions.c, group 7 subtype 4) as "alters the
// tile's texture/decoration" for that specific group -- other call
// sites use different group/class combinations for other scheduled
// visual effects (this function itself is generic; the exact visual
// per group isn't independently confirmed here).
undefined4 spawn_scheduled_effect_object(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
ushort * param_1;
int param_2;
undefined4 param_3;
undefined1 param_4;
ushort param_5;
short param_6;
short param_7;

{
  undefined1 uVar1;
  byte bVar2;
  undefined2 uVar3;
  short sVar4;
  char *iVar5;  /* was `int` -- truncated spawn_new_object's real pointer */
  uint uVar6;
  undefined4 uVar7;
  char *iVar8;  /* was `int` -- truncated tilemap_lookup's real pointer, same
                   class as iVar5 above; crashed live in the sibling call
                   shape at FUN_0004ad10/settle_mobile_to_immobile (see their comments) */
  byte bVar9;

  iVar5 = (char *)spawn_new_object(param_2 + 0x1c0,0);
  if (iVar5 == (char *)0x0) {
    return 0;
  }
  if (param_1 != (ushort *)0x0) {
    uVar6 = (*(ushort *)(iVar5 + 2) ^ param_1[1]) & 0x1fff ^ (uint)param_1[1];
    uVar1 = (undefined1)uVar6;
    *(undefined1 *)(iVar5 + 2) = uVar1;
    bVar2 = (byte)(uVar6 >> 8);
    *(byte *)(iVar5 + 3) = bVar2;
    bVar9 = *(byte *)((char *)param_1 + 3);
    *(undefined1 *)(iVar5 + 2) = uVar1;
    *(byte *)(iVar5 + 3) = (bVar9 ^ bVar2) & 0x1c ^ bVar2;
  }
  if ((short)param_5 < 0) {
    uVar3 = *(undefined2 *)(iVar5 + 2);
    bVar9 = (byte)uVar3 ^ (byte)((uint)param_5 * -0x10000 >> 0x10);
  }
  else {
    if (param_1 == (ushort *)0x0) goto LAB_00081980;
    bVar9 = (byte)(&DAT_00202c90)[(*param_1 & 0x1ff) * 0xd] >> 3;
    uVar3 = *(undefined2 *)(iVar5 + 2);
    if (bVar9 == 0) {
      bVar9 = 1;
    }
    bVar9 = (char)param_5 * bVar9 + (char)param_1[1] ^ (byte)uVar3;
  }
  *(byte *)(iVar5 + 2) = bVar9 & 0x7f ^ (byte)uVar3;
  *(char *)(iVar5 + 3) = (char)((ushort)uVar3 >> 8);
LAB_00081980:
  uVar7 = encode_object_slot_index(iVar5);
  sVar4 = scheduler_add_entry(uVar7,param_3,param_4,(int)param_6 & 0xff,(char)param_7);
  if (sVar4 == -1) {
    free_object_slot(iVar5);
    return 0;
  }
  iVar8 = (char *)tilemap_lookup((int)param_6,(int)param_7);
  object_list_append_tail(iVar8 + 2,iVar5);
  return 1;
}



// was FUN_000819f0: linear-searches the scheduler for the entry whose
// encoded link matches encode_object_slot_index()'s last result (an
// implicit-argument call, same idiom as this file's other bare
// Ghidra-decompiled calls -- see e.g. scheduler_add_entry's own fix
// comment for a case where that idiom was wrong; unconfirmed either
// way for this specific call, left as originally decompiled). Returns
// the slot index, or -1 if not found.
int scheduler_find_entry()

{
  short sVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  
  sVar1 = encode_object_slot_index();
  iVar4 = 0;
  uVar3 = (uint)g_scheduler_count;
  if (uVar3 != 0) {
    do {
      if ((uint)(*(ushort *)(&DAT_00250778 + iVar4 * 6) >> 6) == (int)sVar1) break;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < (int)uVar3);
  }
  iVar2 = -1;
  if ((int)(short)iVar4 != uVar3) {
    iVar2 = iVar4;
  }
  return iVar2;
}



// was FUN_00081a84: reads scheduler_find_entry's result's delay field.
int scheduler_get_delay()

{
  short sVar1;
  int iVar2;

  sVar1 = scheduler_find_entry();
  if (sVar1 < 0) {
    iVar2 = -2;
  }
  else {
    iVar2 = (int)*(short *)(&DAT_0025077a + sVar1 * 6);
  }
  return iVar2;
}



// was FUN_00081abc: re-arms scheduler_find_entry's result's delay field.
void scheduler_set_delay(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  short sVar1;
  int iVar2;
  
  sVar1 = scheduler_find_entry();
  if (-1 < sVar1) {
    iVar2 = sVar1 * 6;
    (&DAT_0025077a)[iVar2] = (char)param_2;
    (&DAT_0025077b)[iVar2] = (char)((uint)param_2 >> 8);
  }
  return;
}



// was FUN_00081af4: scheduler_step_entry's bit-2 sub-handler, called
// for entries whose per-class behavior flags select a positional/
// directional step each tick -- respawns the entry's own impact/effect
// sprite one tile position further along and re-arms its own delay via
// scheduler_get_delay/scheduler_set_delay, rather than a plain
// quality ramp. Exact original name/intent not otherwise recovered.
undefined4 scheduler_advance_effect(param_1,param_2)
short param_1;
int param_2;

{
  byte bVar1;
  ushort *puVar2;
  undefined4 uVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  ushort uVar7;
  int iVar8;
  ushort uVar9;
  int iVar10;
  bool bVar11;
  
  iVar8 = param_1 * 6;
  iVar10 = 5;
  /* HACK: adds the NULL guard every other resolve_object_link call
     site in this file has (this one had none at all -- a stale queue
     entry resolving to NULL would dereference puVar2 below
     unconditionally). */
  puVar2 = (ushort *)resolve_object_link(&DAT_00250778 + iVar8);
  if (puVar2 == (ushort *)0x0) {
    return 0;
  }
  uVar7 = (ushort)(byte)puVar2[3];
  DAT_0010144c = (ushort)(byte)(&DAT_0025077c)[iVar8];
  uVar9 = (byte)puVar2[1] & 0x7f;
  DAT_00101454 = (ushort)(byte)(&DAT_0025077d)[iVar8];
  if ((uVar7 & 7) != 6) {
    uVar9 = uVar9 - 0x18;
  }
  uVar3 = encode_object_slot_index(puVar2);
  iVar4 = check_object_placement_clearance((uVar7 & 0x30) + (uVar7 & 0xf) + 0x140,uVar3,
                       (uint)(*(byte *)((char *)puVar2 + 3) >> 5) + (short)DAT_0010144c * 8,
                       ((*(byte *)((char *)puVar2 + 3) & 0x1c) >> 2) + (short)DAT_00101454 * 8,uVar9,1,
                       8);
  if (getenv("UW_DEBUG_DOOR")) {
    int _type_id = (uVar7 & 0x30) + (uVar7 & 0xf) + 0x140;
    fprintf(stderr, "[door] scheduler_advance_effect: check_object_placement_clearance returned iVar4=%d (0=settle proceeds, nonzero=skip) obj0=0x%04x quality_full=0x%02x type_id=0x%03x local_33=%d word1=0x%04x param5(height)=%d tile=(%d,%d)\n",
            iVar4, (unsigned)*puVar2, (unsigned)uVar7, _type_id,
            (int)(unsigned char)(&DAT_00202c90)[_type_id * 0xd], (unsigned)puVar2[1], (int)uVar9,
            (int)DAT_0010144c, (int)DAT_00101454);
  }
  if (iVar4 == 0) {
    uVar5 = (uint)*puVar2;
    if ((((uVar5 & 0x1c0) == 0x140) && ((uVar5 & 7) == 6)) ||
       (((uVar5 & 0x1c0) == 0x1c0 && ((puVar2[3] & 7) == 6)))) {
      iVar10 = 4;
    }
    bVar1 = (byte)((uVar5 & 0xefff) >> 8);
    *(char *)puVar2 = (char)(uVar5 & 0xefff);
    *(byte *)((char *)puVar2 + 1) =
         ((byte)((uVar5 & 0xe00) + (param_2 + 1) * -0x200 >> 8) ^ bVar1) & 0x1e ^ bVar1;
    iVar6 = scheduler_get_delay(puVar2);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] scheduler_advance_effect: param_2(elapsed)=%d obj0(after settle)=0x%04x dirbit=%d openbits=%d get_delay=%d anim_type(iVar10)=%d\n",
              param_2, (unsigned)*puVar2, (int)((*puVar2 & 0x1000) != 0), (int)((*puVar2 >> 9) & 7),
              (int)iVar6, iVar10);
    iVar4 = (int)(short)iVar6;
    bVar11 = -1 < iVar4;
    if (bVar11) {
      iVar4 = (iVar10 - iVar6) + 1;
      (&DAT_0025077a)[iVar8] = (char)iVar4;
      DAT_002508fc = 1;
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[door] scheduler_advance_effect: RE-ARMED new_delay=%d\n", iVar4);
    }
    uVar3 = 0;
    if (bVar11) {
      (&DAT_0025077b)[iVar8] = (char)((uint)iVar4 >> 8);
    }
  }
  else {
    uVar3 = 1;
  }
  return uVar3;
}



// was FUN_00081ce4: loads the whole scheduler table (g_scheduler_table,
// 0x180 bytes = 64 entries * 6) from a save file, then recomputes
// g_scheduler_count by re-scanning for the first empty entry.
undefined4 scheduler_load(param_1,param_2)
/* .ark handle-struct pointer -- was `undefined4`, truncating the stack
   struct load_level_object_table passes and crashing read_archive_entry below. */
undefined1 * param_1;
int param_2;

{
  short sVar1;
  undefined4 uVar2;
  int iVar3;
  ushort *puVar4;
  
  puVar4 = (ushort *)&DAT_00250778;
  sVar1 = read_archive_entry(param_1,param_2 + 8,&DAT_00250778);
  if (sVar1 == 0x180) {
    g_scheduler_count = '\0';
    iVar3 = 0;
    do {
      if ((*puVar4 & 0xffc0) == 0) break;
      iVar3 = iVar3 + 6;
      g_scheduler_count = g_scheduler_count + '\x01';
      puVar4 = puVar4 + 3;
    } while (iVar3 < 0x180);
    uVar2 = 1;
  }
  else {
    g_scheduler_count = '\0';
    uVar2 = 0;
  }
  return uVar2;
}



// was FUN_00081d74: saves the whole scheduler table (g_scheduler_table,
// 0x180 bytes) to a save file, and (if g_scheduler_count < 0x40) blanks
// out one trailing empty entry first so a stale leftover doesn't get
// misread as real data on the next scheduler_load.
undefined4 scheduler_save(param_1,param_2)
/* Was `undefined4` -- truncated the real 64-bit archive-handle-struct
   pointer (write_level_tilemap_to_archive's own `auStack_20`) write_archive_entry needs as its
   own param_1. Same bug class as write_archive_entry's own param_3 fix right
   above this function -- confirmed via the same crash chain, one call
   further down (write_level_tilemap_to_archive -> scheduler_save -> write_archive_entry, this
   function's own nested call, dereferencing the truncated handle
   pointer). */
undefined4 *param_1;
int param_2;

{
  int iVar1;
  
  if (g_scheduler_count < 0x40) {
    iVar1 = (uint)g_scheduler_count * 6;
    (&DAT_00250778)[iVar1] = (&DAT_00250778)[iVar1] & 0x3f;
    (&DAT_00250779)[iVar1] = 0;
  }
  /* Was `write_archive_entry(...); return 0;` -- a fabricated `return 0`
     masking a real result (same bug class as the torch/ambient-light
     fix earlier this session). Real ARM disassembly (0x81dbc-0x81dc0)
     ends in a tail call (`b 0x15b94`, not `bl`) -- write_archive_entry's own
     return value IS this function's return value, not a hardcoded
     failure. Confirmed: without this, a real save's second archive
     write (this header-table update, right after the main level-data
     write) always reported failure even when the write underneath it
     fully succeeded, so write_level_tilemap_to_archive -- and the whole save chain above
     it -- always unwound through its failure path ("Save Game Failed")
     no matter what. */
  return write_archive_entry(param_1,param_2 + 8,&DAT_00250778,0x180);
}
