/* The object table: slot allocation/free, the per-tile/per-container
 * linked-list primitives (insert/append/unlink/resolve), and object
 * spawning. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/objects.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0004ad10 -- spawn a copy of the "template" object (DAT_00202a44)
// as a new object slot placed near the player's own tile (DAT_00202a4c/
// DAT_00202a50), used by drop_held_object_near_player's "split a stack,
// throw one" path. Crash site of the throw-item bug (tilemap_lookup's
// pointer truncated into iVar8, see that fix's own comment below).
ushort *spawn_object_near_player()

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  char cVar4;
  short sVar5;
  ushort *puVar6;
  uint uVar7;
  int iVar8;
  char *pbTile;
  ushort uVar9;

  puVar6 = (ushort *)alloc_object_slot(1);
  if (puVar6 == (ushort *)0x0) {
LAB_0004b06c:
    puVar6 = (ushort *)0x0;
  }
  else {
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-height] seeding puVar6[1] from garbage=0x%x with template DAT_00202a44[1]=0x%x\n",
              (unsigned)puVar6[1], (unsigned)DAT_00202a44[1]);
    /* EXPERIMENTAL, not yet disassembly-verified: puVar6[1] (byte offset
       2-3) starts as whatever alloc_object_slot's free-list handed back
       (real leftover data from that slot's previous occupant -- alloc_
       object_slot itself never clears it, and every later read-modify-
       write of this field in this function, confirmed faithful to the
       real disassembly, deliberately preserves bits 0-6 of it rather
       than resetting them). Those exact bits are what the height field
       (param_1[0xf]/[0x10] inside compute_object_placement_fields, and again at the
       `iVar8=((byte)puVar6[1]&0x7f)<<3` line below) is computed from --
       so a freshly-recycled slot gives the spawned item a height derived
       from uninitialized memory. Seeding from the template object's
       (DAT_00202a44, the player in this call path) own same field before
       any of this function's bit-blending runs is the most defensible
       guess at what the original game relied on already being true of a
       reused slot, but has NOT been confirmed against real disassembly
       the way this session's other fixes were -- flagged for a follow-up
       pass rather than shipped as a confirmed fix. */
    *(char *)(puVar6 + 1) = (char)DAT_00202a44[1];
    *(char *)((char *)puVar6 + 3) = (char)(DAT_00202a44[1] >> 8);
    *(byte *)(puVar6 + 2) = (byte)puVar6[2] & 0x3f;
    *(undefined1 *)((char *)puVar6 + 5) = 0;
    uVar7 = CONCAT11(*(undefined1 *)((char *)puVar6 + 1),(char)*puVar6) | 0x8000;
    *(char *)puVar6 = (char)*puVar6;
    *(char *)((char *)puVar6 + 1) = (char)(uVar7 >> 8);
    *(byte *)(puVar6 + 3) = (byte)puVar6[3] & 0x3f | 0x40;
    *(undefined1 *)((char *)puVar6 + 7) = 0;
    uVar7 = (uVar7 ^ (int)DAT_00202a38) & 0x1ff ^ uVar7;
    *(char *)puVar6 = (char)uVar7;
    *(char *)((char *)puVar6 + 1) = (char)(uVar7 >> 8);
    uVar9 = 0;
    if (DAT_00202a54 != 0) {
      uVar9 = (byte)DAT_00202a44[0xc] & 0x1f;
    }
    DAT_00202a54 = (DAT_00202a44[1] >> 2 & 0xffe0) + DAT_00202a40 + uVar9 & 0xff;
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-pos] DAT_00202a4c(tilex_in)=%d DAT_00202a50(tiley_in)=%d\n",
              (int)DAT_00202a4c, (int)DAT_00202a50);
    compute_object_placement_fields(puVar6,(int)DAT_00202a4c,(int)DAT_00202a50);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-pos] after compute_object_placement_fields: puVar6[0xb]=0x%x tilex_out=%d tiley_out=%d\n",
              (unsigned)puVar6[0xb], (int)(puVar6[0xb] >> 10), (int)((puVar6[0xb] & 0x3f0) >> 4));
    uVar7 = puVar6[1] & 0xfc7f | ((int)(short)(DAT_00202a54 & 0xe0) >> 5) << 7;
    *(char *)(puVar6 + 1) = (char)uVar7;
    *(char *)((char *)puVar6 + 3) = (char)(uVar7 >> 8);
    *(byte *)(puVar6 + 0xc) = ((byte)DAT_00202a54 ^ (byte)puVar6[0xc]) & 0x1f ^ (byte)puVar6[0xc];
    *(char *)((char *)puVar6 + 9) = (char)DAT_00202a54;
    uVar9 = *puVar6;
    *(char *)puVar6 = (char)(uVar9 & 0xdfff);
    *(char *)((char *)puVar6 + 1) = (char)((uVar9 & 0xdfff) >> 8);
    uVar7 = (uint)CONCAT11(*(undefined1 *)((char *)puVar6 + 3),(char)puVar6[1]);
    uVar7 = ((byte)DAT_00202a44[1] ^ uVar7) & 0x7f ^ uVar7;
    *(char *)(puVar6 + 1) = (char)uVar7;
    *(undefined1 *)((char *)puVar6 + 3) = *(undefined1 *)((char *)puVar6 + 3);
    uVar7 = (uVar7 ^ DAT_00202a44[1]) & 0x1fff ^ (uint)DAT_00202a44[1];
    bVar1 = (byte)uVar7;
    *(byte *)(puVar6 + 1) = bVar1;
    bVar2 = (byte)(uVar7 >> 8);
    *(byte *)((char *)puVar6 + 3) = bVar2;
    bVar2 = (*(byte *)((char *)DAT_00202a44 + 3) ^ bVar2) & 0x1c ^ bVar2;
    *(byte *)(puVar6 + 1) = bVar1;
    *(byte *)((char *)puVar6 + 3) = bVar2;
    if ((byte)(&DAT_00202c90)[(*DAT_00202a44 & 0x1ff) * 0xd] != 0) {
      cVar4 = Ordinal_2005(6,(uint)(byte)(&DAT_00202c90)[(*DAT_00202a44 & 0x1ff) * 0xd] * 5);
      bVar3 = (cVar4 + (char)DAT_00202a3c * '\x02' + (bVar1 & 0x7f) ^ bVar1) & 0x7f ^ bVar1;
      *(byte *)(puVar6 + 1) = bVar3;
      *(byte *)((char *)puVar6 + 3) = bVar2;
      if ((DAT_00202a44 == g_player_object) && (0x50 < *(byte *)(DAT_00086df8 + 0xb9))) {
        *(byte *)(puVar6 + 1) =
             (((char)DAT_00202a3c * '\x02' - (*(byte *)(DAT_00086df8 + 0xb9) >> 3)) +
              (&DAT_00202c90)[(*DAT_00202a44 & 0x1ff) * 0xd] + (bVar1 & 0x7f) ^ bVar3) & 0x7f ^
             bVar3;
        *(byte *)((char *)puVar6 + 3) = bVar2;
      }
      iVar8 = check_object_drop_height(puVar6,DAT_00202a44);
      if (iVar8 == 0) {
        free_object_slot(puVar6);
        goto LAB_0004b06c;
      }
    }
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-spawn] *puVar6=0x%x (&0x1c0=0x%x) puVar6[0xb]_before=0x%x DAT_00202a44_type=0x%x\n",
              (unsigned)*puVar6, (unsigned)(*puVar6 & 0x1c0), (unsigned)puVar6[0xb],
              (unsigned)(*DAT_00202a44 & 0x1ff));
    if ((*puVar6 & 0x1c0) != 0x40) {
      sVar5 = 0;
      iVar8 = (*(byte *)((char *)puVar6 + 3) & 0xe0) + ((puVar6[0xb] & 0xfc00) >> 2) + 0xf;
      *(char *)((char *)puVar6 + 0xb) = (char)iVar8;
      *(char *)(puVar6 + 6) = (char)((uint)iVar8 >> 8);
      iVar8 = (*(byte *)((char *)puVar6 + 3) & 0x1c) * 8 + (puVar6[0xb] & 0x3f0) * 0x10 + 0xf;
      *(char *)((char *)puVar6 + 0xd) = (char)iVar8;
      *(char *)(puVar6 + 7) = (char)((uint)iVar8 >> 8);
      iVar8 = ((byte)puVar6[1] & 0x7f) << 3;
      *(char *)((char *)puVar6 + 0xf) = (char)iVar8;
      *(char *)(puVar6 + 8) = (char)((uint)iVar8 >> 8);
      if (((*DAT_00202a44 & 0x1c0) == 0x40) && (sVar5 = encode_object_slot_index(), 0xff < sVar5)) {
        sVar5 = 0;
      }
      *(char *)(puVar6 + 9) = (char)sVar5;
      *(byte *)((char *)puVar6 + 0x15) = *(byte *)((char *)puVar6 + 0x15) & 0x7f;
    }
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-spawn] puVar6[0xb]_after=0x%x tilex=%d tiley=%d\n",
              (unsigned)puVar6[0xb], (int)(puVar6[0xb] >> 10), (int)((puVar6[0xb] & 0x3f0) >> 4));
    *(byte *)(puVar6 + 10) = (char)DAT_00202a3c * '\b' + 0x87U & 0xf9 | 1;
    *(byte *)((char *)puVar6 + 0x13) =
         ((byte)DAT_00202a48 ^ *(byte *)((char *)puVar6 + 0x13)) & 0x7f ^ *(byte *)((char *)puVar6 + 0x13)
    ;
    if (g_object_type_props[DAT_00202a38].is_container) {
      uVar9 = puVar6[3];
      *(char *)(puVar6 + 3) = (char)(uVar9 & 0xffc0);
      *(char *)((char *)puVar6 + 7) = (char)((uVar9 & 0xffc0) >> 8);
    }
    /* Was `iVar8 = tilemap_lookup(...); object_list_insert_head(iVar8 + 2,...)`
       -- tilemap_lookup returns a real 64-bit tile-record pointer, but
       iVar8 is `int` (used throughout this function for genuine small
       integer scratch math, so not safe to widen wholesale); truncating
       the pointer into it and adding +2 produced a wild, non-dereferenced
       -able address that crashed inside object_list_insert_head the
       moment this (previously dead/untested) throw-item spawn path first
       got real exercise. Same class as object_list_insert_head/
       object_list_append_tail/discard_misplaced_object's own params, already fixed
       elsewhere -- this just never got a properly-typed local to feed
       them. Confirmed live: crashed 100% of the time replaying the
       user's bug-throw-item.txt once its trailing WAIT gave the object-
       drop tick enough time to run. */
    pbTile = (char *)tilemap_lookup(puVar6[0xb] >> 10,(puVar6[0xb] & 0x3f0) >> 4);
    DEBUG(INFO, "[drop] object id=0x%03x landed at tile=(%d,%d)\n",
          (unsigned)(*puVar6 & 0x1ff), puVar6[0xb] >> 10, (puVar6[0xb] & 0x3f0) >> 4);
    object_list_insert_head(pbTile + 2,puVar6);
    play_sound_effect_at_object(10,puVar6,0);
    /* HACK, not disassembly-derived at this call site -- same fix as
       drop_held_object_near_player's trajectory branch, see that
       comment for the full explanation. This function (like that one)
       places its result via alloc_object_slot(1), the MOBILE object
       arena; complete the mobile->immobile settle transition
       synchronously here too, since nothing else will. On by default;
       set UW_DISABLE_SETTLE_IMMOBILE to fall back to the old (mobile-
       forever, un-pickable) behavior. settle_mobile_to_immobile unconditionally
       frees its input object (via its own discard_misplaced_object(
       ...,1) call) regardless of whether the immobile copy succeeds,
       so puVar6 must always be reassigned to its return value here --
       including NULL, on the (class-gated, rare) chance it rolled the
       object's own decay/destroy check -- never left pointing at the
       now-freed original. */
    if (!getenv("UW_DISABLE_SETTLE_IMMOBILE")) {
      ushort *pImmobile;
      undefined2 uVarSavedTileX = DAT_0010144c;
      undefined2 uVarSavedTileY = DAT_00101454;
      DAT_0010144c = (ushort)(puVar6[0xb] >> 10);
      DAT_00101454 = (ushort)((puVar6[0xb] & 0x3f0) >> 4);
      pImmobile = settle_mobile_to_immobile(puVar6);
      DAT_0010144c = uVarSavedTileX;
      DAT_00101454 = uVarSavedTileY;
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[settle-immobile] settle_mobile_to_immobile(%p) -> %p in_arena=%d\n",
                (void *)puVar6, (void *)pImmobile,
                pImmobile ? (int)object_ptr_in_arena((char *)pImmobile) : -1);
      puVar6 = pImmobile;
    }
  }
  return puVar6;
}




/* was FUN_00052f28. Was `int FUN_00052f28(...)` with a local `int iVar1`
   holding the computed slot address (`DAT_002046b8/DAT_002046c4 +
   offset`, both real pointers) -- truncated the pointer to 32 bits on
   this 64-bit host. Every call site casts the return value straight to
   a pointer type (e.g. `(ushort *)alloc_object_slot(...)`), so the
   caller got a wild address with zeroed-out upper 32 bits. This is the
   confirmed root cause of the crash the new TELEPORT demomode command
   exposed: the player object's slot, handed out by this function once
   already during chargen, had its upper bits silently dropped, and the
   second set_player_tile_position call (via
   object_list_unlink/resolve_object_link, walking the tile's object
   chain to unlink the player before its move) dereferenced that
   truncated address and crashed (EXC_BAD_ACCESS on an address matching
   the low 32 bits of a real heap pointer, upper 32 bits zero). */
void *alloc_object_slot(param_1)
int param_1;

{
  void *pvVar1;
  ushort *puVar2;
  /* Was `undefined4 *puVar3` -- a 32-bit-wide alias onto DAT_0020469c/
     DAT_002046a8 (both real 64-bit `char *` globals). The write-back
     below (`*puVar3 = puVar2 + -1`) only ever stored the low 32 bits of
     the decremented free-list-top pointer, zeroing its upper half on
     the very first allocation. Every later call then read a bogus,
     low (<4GB-looking) "pointer" back out of the corrupted global,
     producing exactly the unmapped, oddly-small addresses (e.g.
     0x3e8b37a0) seen crashing find_object_placement on the first-ever exercise
     of this dead-until-now object-spawn path (spawn_new_object always
     returning 0 previously masked this entirely). Also fixed the two
     `*DAT_xxx` reads immediately below: DAT_0020469c/DAT_002046a8 are
     byte pointers into a `short` array (confirmed by the manual `* 2`
     / `>> 1` scaling used elsewhere in this file for the same globals),
     so reading through them as `char` truncated the stored slot index
     to one byte instead of two. */
  char **puVar3;

  if (param_1 == 0) {
    puVar3 = &DAT_0020469c;
    if ((DAT_0020469c < DAT_002046bc) && (despawn_objects_outside_radius(3,10), DAT_0020469c < DAT_002046bc)) {
      return 0;
    }
    pvVar1 = DAT_002046c4 + (*(short *)DAT_0020469c - 0x100) * 8;
    puVar2 = (ushort *)DAT_0020469c;
  }
  else {
    puVar3 = &DAT_002046a8;
    if ((DAT_002046a8 < DAT_002046a4) && (despawn_objects_outside_radius(3,5), DAT_002046a8 < DAT_002046a4)) {
      return 0;
    }
    active_mobile_list_add((int)*(short *)DAT_002046a8);
    pvVar1 = (uint)*(ushort *)DAT_002046a8 * 0x1b + DAT_002046b8;
    puVar2 = (ushort *)DAT_002046a8;
  }
  *puVar3 = (char *)(puVar2 + -1);
  return pvVar1;
}



// was FUN_00053004
void free_object_slot(param_1)
char *param_1;

{
  short sVar1;
  short *psVar2;

  /* DAT_002046a8/DAT_0020469c are byte pointers into a `short` array
     (see alloc_object_slot's matching fix) -- `+ 1` only advanced them
     by one BYTE instead of one short-element (2 bytes), the mirror
     image of alloc_object_slot's own "-1" pop bug, and the bare
     `*DAT_xxx` reads below truncated the stored slot index to one
     byte. Left uncaught until spawn_new_object (which calls this on the
     retry path) started actually running instead of always failing. */
  if (param_1 < DAT_002046c4) {
    psVar2 = (short *)(DAT_002046a8 + 2);
    DAT_002046a8 = (char *)psVar2;
    sVar1 = Ordinal_2005(0x1b,param_1 - DAT_002046b8);
    *psVar2 = sVar1;
    if (param_1 == DAT_0023b82c) {
      enter_free_camera_mode((int)*(short *)DAT_002046a8);
    }
    active_mobile_list_remove((int)*(short *)DAT_002046a8);
  }
  else {
    DAT_0020469c = DAT_0020469c + 2;
    *(short *)DAT_0020469c = (short)((int)(param_1 - DAT_002046c4) >> 3) + 0x100;
  }
  return;
}



// was FUN_000530c4
void object_list_insert_head(param_1,param_2)
byte * param_1;
/* Object-record pointer -- was `uint`, truncating it (e.g. set_player_tile_position
   passes the real g_player_object player-object pointer here; truncated it
   crashed placing the player into the level). */
char *param_2;

{
  undefined2 uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;

  uVar1 = *(undefined2 *)param_1;
  bVar2 = (byte)uVar1;
  *(byte *)(param_2 + 4) = (*(byte *)(param_2 + 4) ^ bVar2) & 0x3f ^ bVar2;
  *(char *)(param_2 + 5) = (char)((ushort)uVar1 >> 8);
  if (param_2 < DAT_002046c4) {
    sVar3 = Ordinal_2005(0x1b,param_2 - DAT_002046b8);
    uVar4 = *param_1 & 0x3f | sVar3 << 6;
  }
  else {
    uVar4 = *param_1 & 0x3f ^ ((short)((int)(param_2 - DAT_002046c4) >> 3) + 0x100) * 0x40;
  }
  *param_1 = (byte)uVar4;
  param_1[1] = (byte)(uVar4 >> 8);
  return;
}



// was FUN_000531a0
void object_list_append_tail(param_1,param_2)
byte * param_1;
/* Object-record pointer -- was `uint`, truncating it (same class as
   object_list_insert_head above). */
char *param_2;

{
  short sVar1;
  byte *pbVar2;
  ushort uVar3;

  /* iVar2 was `int`, truncating resolve_object_link's real pointer return --
     same tile/object-chain-walk bug as object_list_unlink (see there), just
     never exercised yet (this walks a different list, e.g. a
     container's contents, to append param_2 at its tail). */
  while (pbVar2 = (byte *)resolve_object_link(param_1), pbVar2 != 0) {
    param_1 = pbVar2 + 4;
  }
  *(byte *)(param_2 + 4) = *(byte *)(param_2 + 4) & 0x3f;
  *(undefined1 *)(param_2 + 5) = 0;
  if (param_2 < DAT_002046c4) {
    sVar1 = Ordinal_2005(0x1b,param_2 - DAT_002046b8);
    uVar3 = *param_1 & 0x3f | sVar1 << 6;
  }
  else {
    uVar3 = *param_1 & 0x3f ^ ((short)((int)(param_2 - DAT_002046c4) >> 3) + 0x100) * 0x40;
  }
  *param_1 = (byte)uVar3;
  param_1[1] = (byte)(uVar3 >> 8);
  return;
}



/* param_2 was `int`, and the local holding resolve_object_link's return value
   was `int iVar4` -- both truncating real pointers on this 64-bit host.
   Confirmed crashing (EXC_BAD_ACCESS on a wild ~32-bit address) the
   first time this got called with DAT_00202080 already set from a
   prior call (i.e. calling set_player_tile_position/set-player-position a SECOND
   time in one run) -- every demo script this whole session only ever
   called it once per process, so this path had never actually run
   before the new TELEPORT demomode command exercised it. This is a
   linked-list walk (resolve_object_link returns "next node", searching for
   the node matching param_2); same pointer-truncation pattern fixed
   repeatedly this session. Retyped both to real pointers; left the
   30+ other call sites' own argument variables unaudited since only
   this one (g_player_object, already a real pointer, needs no caller-side
   change) has actually been exercised and confirmed fixed. */
// was FUN_00053274
void object_list_unlink(param_1,param_2)
byte * param_1;
byte * param_2;

{
  short sVar1;
  undefined2 uVar2;
  byte bVar3;
  byte *pbVar4;
  int iVar5;

  iVar5 = 0;
  if (param_2 != 0) {
    while( true ) {
      pbVar4 = (byte *)resolve_object_link(param_1);
      if (pbVar4 == 0) {
        return;
      }
      sVar1 = (short)iVar5;
      iVar5 = (sVar1 + 1) * 0x10000 >> 0x10;
      if (0x400 < sVar1) {
        return;
      }
      if (pbVar4 == param_2) break;
      param_1 = pbVar4 + 4;
    }
    uVar2 = *(undefined2 *)(param_2 + 4);
    bVar3 = (byte)uVar2;
    *param_1 = (*param_1 ^ bVar3) & 0x3f ^ bVar3;
    param_1[1] = (byte)((ushort)uVar2 >> 8);
    *(byte *)(param_2 + 4) = *(byte *)(param_2 + 4) & 0x3f;
    *(undefined1 *)(param_2 + 5) = 0;
  }
  return;
}




// was FUN_000533e4 -- resolve param_1 (a link-field address) to the
// object it points at and delete it: recurse into two nested-object
// link fields first (offsets 4/6, e.g. contained items or a wielded
// weapon), then unlink+free the object itself. param_1==0x180 class
// (containers) instead defer to free_trap_class_object.
void free_linked_object_recursive(param_1)
char *param_1;  /* was `undefined4` -- truncated the real object-record
                   pointer (passed straight to resolve_object_link),
                   latent until that call started actually using it */

{
  ushort *puVar1;
  
  puVar1 = (ushort *)resolve_object_link(param_1); /* confirmed via ARM disassembly, 0x533e4 */
  if (puVar1 != (ushort *)0x0) {
    if ((*puVar1 & 0x1c0) == 0x180) {
      free_trap_class_object(param_1,puVar1);
    }
    else {
      if ((puVar1[2] & 0xffc0) != 0) {
        free_linked_object_recursive();
      }
      if ((*puVar1 & 0x8000) == 0) {
        if ((puVar1[3] & 0xffc0) != 0) {
          free_linked_object_recursive();
        }
      }
      object_list_unlink(param_1,puVar1);
      free_object_slot(puVar1);
    }
  }
  return;
}



// was FUN_000534a8 -- delete param_2: free its own "contains" link
// field first (via free_linked_object_recursive, for a container/
// wielded item), unlink param_2 from the list headed at param_1 (if
// given), then free its slot. discard_misplaced_object's actual
// deletion step.
void unlink_and_free_object(param_1,param_2)
/* Was `int param_1; int param_2;` -- both real object-record pointers
   (param_2 is dereferenced directly; both are forwarded to
   object_list_unlink/free_object_slot, which already declare pointer
   params), truncated to 32 bits on this host -- same class as several
   other fixes this session, in the same never-before-exercised
   drop-into-world path. */
char *param_1;
char *param_2;

{
  /* Dropped argument: free_linked_object_recursive takes the address of a link field
     to recursively free (its own declared param_1) -- here that's
     param_2's own "contains" field (+6, this file's standard
     container-contents offset) -- but it was called bare, same idiom
     as free_linked_object_recursive's own two internal self-recursive calls just above
     this function (not touched: not reached by this session's specific
     repro, and free_linked_object_recursive already tolerates a NULL resolve safely). */
  if (((*(byte *)(param_2 + 1) & 0x80) == 0) && ((*(ushort *)(param_2 + 6) & 0xffc0) != 0)) {
    free_linked_object_recursive(param_2 + 6);
  }
  if (param_1 != 0) {
    object_list_unlink((byte *)param_1,(byte *)param_2);
  }
  free_object_slot(param_2);
  return;
}



// was FUN_00053514
/* Was `int`, truncating the same DAT_002046b8/DAT_002046c4 object-record
   pointer arithmetic as get_object_record_by_slot_index above (fixed earlier this session)
   -- same fix. */
void *resolve_object_link(param_1)
ushort * param_1;

{
  ushort uVar1;

  /* Defensive range check -- param_1 should always be either a
     tile-array-relative link cell or an object-record-relative "next"
     field, both within the level blob's fixed object-table span. Base
     the check on DAT_002046b8 (computed ONCE at level load as
     DAT_002029cc+0x4000, see reset_level_object_arena) rather than re-reading the
     LIVE DAT_002029cc: there's an existing, previously-documented,
     never-root-caused bug (see init_gameplay_session's own comment a few
     thousand lines down) where some stray write elsewhere in this file
     corrupts DAT_002029cc's storage well after level load -- confirmed
     here too (the live DAT_002029cc no longer matched the base
     DAT_002046b8/DAT_002046c4 were actually derived from), so
     recomputing "expected range" from the live value validates against
     the wrong base and passes through an address that's actually
     unmapped/unrelated memory. DAT_002046b8/DAT_002046c4 are
     independent globals, stored once and not observed corrupted the
     same way. A caller that chains through resolve_object_link's own
     result repeatedly (collision_height_envelope's neighbouring-tile
     scan) can otherwise walk this into unrelated memory -- confirmed
     via lldb: EXC_BAD_ACCESS reading *param_1 with a wild address,
     reproduced by a mapped movement sequence (12x forward, turn, 3x
     forward, turn, 5x forward). Treat an out-of-range param_1 as "no
     object" instead of crashing, same defensive posture as this file's
     other guards against a data-dependent wild pointer. */
  if (param_1 != (ushort *)0x0) {
    char *_lo = DAT_002046b8 - 0x4000;
    /* (DAT_002046b8-0x4000) is this arena buffer's own base (aliased as
       _lo just above); +0x7c08+0x3a+0x180 is its new true end, covering
       g_backpack_slot_table's reservation there (28 slots + g_current_container_link,
       see both their comments) plus g_scheduler_table's own 0x180-byte
       reservation right after it (see its own, DAT_00250778's, comment)
       -- the buffer itself was widened by the same 0x3a+0x180 bytes in
       init_level_object_arena. This replaces the narrower
       DAT_002046c4+0x1800 the original binary's own object table alone
       would need -- the new reservations sit well past that, in
       previously-unallocated space, not inside it. */
    char *_hi = (DAT_002046b8 - 0x4000) + 0x7c08 + 0x3a + 0x180;
    if ((char *)param_1 < _lo || (char *)param_1 >= _hi) {
      /* Throttled: this guard also fires every idle tick before any level
         is loaded (DAT_002046b8/DAT_002046c4 aren't set up yet, so
         everything looks "out of range"), and logging it unthrottled was
         observed to slow real-time/demo playback to a crawl (dozens of
         lines per tick). Log only the first hit and then one reminder
         every 500 more, instead of every single call. */
      static unsigned _warn_count = 0;
      _warn_count++;
      if (_warn_count == 1 || (_warn_count % 500) == 0) {
        DEBUG(ERR, "[resolve_object_link] param_1=%p out of expected range [%p,%p), returning NULL (x%u so far)\n",
              (void *)param_1, (void *)_lo, (void *)_hi, _warn_count);
      }
      return 0;
    }
    uVar1 = *param_1;
    if ((uVar1 & 0xffc0) != 0) {
      if (0x3fff < (uVar1 & 0xffc0)) {
        return DAT_002046c4 + ((uVar1 >> 6) - 0x100) * 8;
      }
      return (uint)(uVar1 >> 6) * 0x1b + DAT_002046b8;
    }
  }
  return 0;
}



// was FUN_0005358c
int encode_object_slot_index(param_1)
char *param_1;

{
  short sVar1;
  int iVar2;
  
  if (param_1 == 0) {
    iVar2 = 0;
  }
  else if (param_1 < DAT_002046c4) {
    sVar1 = Ordinal_2005(0x1b,param_1 - DAT_002046b8);
    iVar2 = (int)sVar1;
  }
  else {
    iVar2 = (short)((int)(param_1 - DAT_002046c4) >> 3) + 0x100;
  }
  return iVar2;
}




// was FUN_00068138
void *spawn_new_object(param_1,param_2)
/* Was `undefined4 FUN_00068138(...)` ending in a hardcoded `return 0;`
   that discarded the freshly-allocated object pointer (puVar3) on every
   call, even on success. Every call site dereferences the return value
   as a pointer (e.g. drop_monster_loot's `iVar5+2`/`+3`/`+4`/`+5` writes,
   object_list_insert_head(iVar4+2,iVar5)) and gates on it being
   non-null, so this whole "spawn a new object" path -- used for
   monster death drops among other things -- was silently dead code.
   Confirmed live: handle_starvation_penalty's per-turn call passed the always-zero
   result straight into place_object_in_world -> find_object_placement, which dereferenced
   the resulting NULL pointer and crashed the first time this
   never-before-exercised turn-processing branch actually ran (hit by
   simply clicking an item -- Bread -- inside an open container). */
uint param_1;
undefined4 param_2;

{
  undefined1 uVar1;
  byte bVar2;
  undefined1 *puVar3;
  uint uVar4;
  uint uVar5;
  
  puVar3 = (undefined1 *)alloc_object_slot(param_2);
  if (puVar3 != (undefined1 *)0x0) {
    puVar3[2] = 0;
    puVar3[3] = 0x6c;
    uVar4 = ((byte)puVar3[1] & 0x80) << 8 ^ param_1 & 0x1ff;
    uVar1 = (undefined1)(param_1 & 0x1ff);
    *puVar3 = uVar1;
    bVar2 = (byte)(uVar4 >> 8);
    puVar3[1] = bVar2;
    puVar3[4] = 0x28;
    puVar3[5] = 0;
    uVar5 = CONCAT11(puVar3[7],puVar3[6]) & 0xffc0;
    puVar3[6] = (char)uVar5;
    puVar3[7] = (char)(uVar5 >> 8);
    if ((((&DAT_00202c93)[(short)param_1 * 0xd] & 0xc0) == 0) ||
       (((&DAT_00202c93)[(short)param_1 * 0xd] & 0xc0) == 0x80)) {
      puVar3[6] = 0x40;
      puVar3[7] = 0;
      *puVar3 = uVar1;
      puVar3[1] = bVar2 | 0x80;
    }
    else {
      uVar4 = uVar4 & 0x7fff;
      *puVar3 = (char)uVar4;
      puVar3[1] = (char)(uVar4 >> 8);
      puVar3[6] = 0;
      puVar3[7] = 0;
    }
  }
  return puVar3;
}



// was FUN_00037fe8 -- resets an object (param_2) whose burnt-out/
// spent counterpart type is being assigned (its only known caller
// checks item type ids 0xd5/0xd6, the same "spent" marker ids seen
// elsewhere as a candle/torch-style burnout transition): for a mobile
// object, just zeroes its HP field; for a plain object-header object,
// discards it if it's misplaced (discard_misplaced_object). Returns 1
// if the object was left alone (not misplaced), 0 if it was reset/
// discarded.
undefined4 reset_burnt_out_item_state(param_1,param_2)
undefined4 param_1;
/* Object-record pointer -- was `uint`, truncating it (same class as
   object_list_insert_head/object_list_append_tail below). */
char *param_2;

{
  int iVar1;

  if (param_2 < DAT_002046c4) {
    *(undefined1 *)(param_2 + 8) = 0;
  }
  else {
    iVar1 = discard_misplaced_object(param_1,param_2,0);
    if (iVar1 == 0) {
      return 1;
    }
  }
  return 0;
}


// was FUN_00038028 -- applies a destruction/transformation effect
// (from apply_typed_damage_to_object's dispatch, its only known caller) to a non-NPC
// object (param_1) at tile param_4/param_5: doors get their contents
// discarded; two special container-ish types (0x15d/0x15b) discard
// contents and try to combine/stow; ordinary containers (class 0x80)
// roll a destroy chance before emptying; a spent-item transition
// (0xd5/0xd6) resets the object via reset_burnt_out_item_state;
// anything else with contents but not already freed gets those
// contents recursively freed. Falls through to a shared tail that
// may randomly transform the object into a spent (0xd5/0xd6) type and
// re-settle it into the world, returning whether the object survived.
undefined4 apply_object_destruction_effect(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
undefined4 param_2;
uint param_3;
undefined4 param_4;
short param_5;

{
  ushort uVar1;
  short sVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  uint uVar6;
  
  sVar2 = (short)param_4;
  uVar6 = 0xfffffffe;
  if (sVar2 < 0) {
LAB_000382ac:
    uVar4 = 1;
  }
  else {
    uVar1 = *param_1;
    if ((uVar1 & 0x1f0) == 0x140) {
      if ((uVar1 & 0xf) < 8) {
        DAT_002020a4 = param_5;
        DAT_002020a0 = sVar2;
        close_door_object(param_2,param_1);
      }
      discard_container_contents(param_1,1);
LAB_00038100:
      uVar6 = 0xffffffff;
    }
    else if (((uVar1 & 0x1ff) == 0x15d) || ((uVar1 & 0x1ff) == 0x15b)) {
      DAT_002020a4 = param_5;
      DAT_002020a0 = sVar2;
      discard_container_contents(param_1,0);
      try_combine_or_stow_object(0,param_1,0);
    }
    else if ((uVar1 & 0x1f0) == 0x80) {
      iVar3 = roll_object_destroy_chance(10,param_1);
      if (iVar3 == 0) goto LAB_00038100;
      try_empty_container(param_1,0);
    }
    else {
      if ((param_3 & 8) != 0) {
        if (((uVar1 & 0x1ff) == 0xd5) || ((uVar1 & 0x1ff) == 0xd6)) {
          /* was folded into `int iVar3` (reused elsewhere in this function
             for unrelated int values) -- truncated tilemap_lookup's real
             `void *` return */
          char *_tile3 = (char *)tilemap_lookup(param_4,(int)param_5);
          iVar3 = reset_burnt_out_item_state(_tile3 + 2,param_1);
          if (iVar3 != 0) goto LAB_000382ac;
          uVar6 = 0xffffffff;
        }
        else {
          uVar5 = Ordinal_1053();
          if ((uVar5 & 3) == 0) {
            uVar4 = roll_dice_sum(6,10);
            spawn_scheduled_effect_object(param_1,8,uVar4,0,0,sVar2,param_5);
            sVar2 = rand_below(2);
            uVar6 = (int)sVar2 + 0xd5;
          }
        }
      }
      if (((*param_1 & 0x8000) == 0) && ((param_1[3] & 0xffc0) != 0)) {
        free_linked_object_recursive(param_1 + 3);
      }
    }
    if ((short)uVar6 < -1) {
      sVar2 = rand_below(2);
      uVar6 = (int)sVar2 + 0xd5;
    }
    if (-1 < (short)uVar6) {
      uVar5 = (*param_1 ^ uVar6) & 0x1ff ^ (uint)*param_1;
      *(char *)param_1 = (char)uVar5;
      *(char *)((char *)param_1 + 1) = (char)(uVar5 >> 8);
      if ((DAT_002046c4 <= param_1) &&
         (iVar3 = settle_dropped_object(param_1,param_4,(int)param_5,1), iVar3 == 0)) goto LAB_000382ac;
    }
    uVar4 = 1;
    if (-2 < (short)uVar6) {
      uVar4 = 0;
    }
  }
  return uVar4;
}


// WARNING: Type propagation algorithm not settling

// was FUN_00038d4c -- searches outward from tile (param_2,param_3)
// via a double-buffered BFS flood-fill (local_80/local_58, each a
// 10-entry x/y coordinate-pair frontier list; local_a4/local_b0 swap
// between them each wave) for a tile where object param_1 can be
// placed (check_object_placement_clearance). Expansion direction from each tile is gated
// by its type (bVar8, 0-5: floor vs. diagonal-wall variants), each
// branch mirroring the same 4-neighbor/diagonal-corner pattern seen
// in resolve_tile_entry_offset, with per-tile visited bitmasks
// (auStack_98/uStack_9a) preventing revisits. Stops and returns 1 as
// soon as a placement succeeds (writing the found tile into
// param_4/param_5), or 0 once the frontier is exhausted. param_6
// gates an extra step that discards misplaced/arena objects
// encountered along the way.
undefined4 find_placement_via_tile_flood_fill(param_1,param_2,param_3,param_4,param_5,param_6)
ushort * param_1;
short param_2;
short param_3;
short * param_4;
short * param_5;
int param_6;

{
  int iVar1;
  int iVar2;
  uint uVar3;
  char cVar4;
  char cVar5;
  undefined1 *puVar6;
  char cVar7;
  byte bVar8;
  int iVar9;
  byte *pbVar10;
  ushort *puVar11;
  int iVar12;
  undefined4 uVar13;
  int iVar14;
  char *pcVar15;
  uint uVar16;
  ushort uVar17;
  char cVar18;
  uint uVar19;
  uint uVar20;
  char cVar21;
  undefined1 *local_b0;
  uint local_a8;
  undefined1 *local_a4;
  uint local_a0;
  ushort uStack_9a;
  ushort auStack_98 [12];
  /* local_80 is the start of a >=0x14-byte struct (Ghidra only tracked
     the first two bytes as named locals); widened to fit the real memset
     below instead of overflowing a 1-byte stack slot. local_7f is now a
     separate, unaliased byte purely to avoid rewriting its few use sites.
     NOT text formatting (a prior pass's guess, now corrected): local_80/
     local_58 are the two BFS frontier buffers, each holding up to 10
     (x,y) tile-coordinate byte pairs -- see this function's own comment. */
  undefined1 local_80 [0x14];
  undefined1 local_7f;
  undefined1 local_58 [40];
  
  Ordinal_1047(local_80,0,0x14);
  Ordinal_1047(local_58,0,0x14);
  Ordinal_1047(auStack_98,0,9);
  iVar9 = param_2 + -4;
  if (iVar9 < 1) {
    iVar9 = 1;
  }
  cVar21 = (char)iVar9;
  if ('9' < cVar21) {
    cVar21 = ':';
  }
  iVar9 = param_3 + -4;
  if (iVar9 < 1) {
    iVar9 = 1;
  }
  cVar7 = (char)iVar9;
  if ('9' < cVar7) {
    cVar7 = ':';
  }
  iVar9 = (cVar21 + 9) * 0x1000000 >> 0x18;
  if (0x3d < iVar9) {
    iVar9 = 0x3e;
  }
  cVar4 = (char)iVar9;
  iVar9 = (cVar7 + 9) * 0x1000000 >> 0x18;
  if (0x3d < iVar9) {
    iVar9 = 0x3e;
  }
  cVar5 = (char)iVar9;
  local_a4 = local_80;
  local_b0 = local_58;
  local_80[0] = (char)param_2;
  local_7f = (char)param_3;
  iVar9 = (int)cVar21;
  iVar1 = (int)cVar7;
  auStack_98[param_2 - iVar9] =
       auStack_98[param_2 - iVar9] | (ushort)(1 << (param_3 - iVar1 & 0xffU));
  local_a0 = 1;
  do {
    puVar6 = local_b0;
    uVar20 = 0;
    local_a8 = 0;
    do {
      cVar21 = (local_a4 + local_a8 * 2)[1];
      cVar7 = local_a4[local_a8 * 2];
      pbVar10 = (byte *)tilemap_lookup((int)cVar7,(int)cVar21);
      if (param_6 != 0) {
        for (puVar11 = (ushort *)(pbVar10 + 2); (*puVar11 & 0xffc0) != 0; puVar11 = puVar11 + 2) {
          puVar11 = (ushort *)resolve_object_link(puVar11);
          if (((&DAT_00202c90)[(*puVar11 & 0x1ff) * 0xd] != '\0') ||
             (iVar12 = object_ptr_in_arena(puVar11), iVar12 != 0)) {
            discard_misplaced_object(pbVar10 + 2,puVar11,0);
          }
        }
      }
      cVar18 = '\x04';
      if (((&DAT_000878d0)[*pbVar10 & 0xf] & 0x20) == 0) {
        cVar18 = '\0';
      }
      uVar13 = encode_object_slot_index(param_1);
      iVar12 = (int)(short)cVar21;
      iVar2 = (int)(short)cVar7;
      iVar14 = check_object_placement_clearance(*param_1 & 0x1ff,uVar13,((iVar2 << 0x13) >> 0x10) + 3,
                            ((iVar12 << 0x13) >> 0x10) + 3,(*pbVar10 >> 4) * '\b' + cVar18,0,8);
      if (iVar14 != 0) {
        *param_4 = (short)cVar7;
        *param_5 = (short)cVar21;
        return 1;
      }
      bVar8 = *pbVar10 & 0xf;
      if ((*pbVar10 & 0xf) != 0) {
        if (bVar8 == 2) {
          uVar19 = iVar12 - iVar1;
          uVar16 = 1 << (uVar19 & 0xff);
          iVar14 = iVar2 - iVar9;
          puVar11 = auStack_98 + iVar14;
          if (((((uVar16 & (int)(short)auStack_98[iVar14 + 1]) == 0) && (uVar20 < 0x14)) &&
              (iVar9 <= iVar2 + 1)) &&
             (((iVar2 + 1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))) {
            cVar18 = '\x01';
            auStack_98[iVar14 + 1] = auStack_98[iVar14 + 1] | (ushort)uVar16;
LAB_00039590:
            local_b0[uVar20 * 2] = cVar7 + cVar18;
            (local_b0 + uVar20 * 2)[1] = cVar21;
            uVar20 = uVar20 + 1 & 0xff;
          }
LAB_000395ac:
          uVar16 = 1 << (uVar19 - 1 & 0xff);
          uVar17 = *puVar11;
          if ((((uVar16 & (int)(short)uVar17) != 0) || (0x13 < uVar20)) ||
             (((iVar2 < iVar9 || ((cVar4 < iVar2 || (iVar12 + -1 < iVar1)))) ||
              ((int)cVar5 < iVar12 + -1)))) goto LAB_00039638;
          pcVar15 = local_b0 + uVar20 * 2;
          *pcVar15 = cVar7;
          cVar21 = cVar21 + -1;
LAB_00039620:
          *puVar11 = uVar17 | (ushort)uVar16;
        }
        else {
          if (bVar8 == 3) {
            uVar19 = iVar12 - iVar1;
            uVar16 = 1 << (uVar19 & 0xff);
            iVar14 = iVar2 - iVar9;
            puVar11 = auStack_98 + iVar14;
            if ((((uVar16 & (int)(short)(&uStack_9a)[iVar14]) == 0) && (uVar20 < 0x14)) &&
               ((iVar9 <= iVar2 + -1 &&
                (((iVar2 + -1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))))) {
              cVar18 = -1;
              (&uStack_9a)[iVar14] = (&uStack_9a)[iVar14] | (ushort)uVar16;
              goto LAB_00039590;
            }
            goto LAB_000395ac;
          }
          if (bVar8 == 4) {
            uVar19 = iVar12 - iVar1;
            uVar16 = 1 << (uVar19 & 0xff);
            iVar14 = iVar2 - iVar9;
            puVar11 = auStack_98 + iVar14;
            if ((((((uVar16 & (int)(short)auStack_98[iVar14 + 1]) == 0) && (uVar20 < 0x14)) &&
                 (iVar9 <= iVar2 + 1)) && ((iVar2 + 1 <= (int)cVar4 && (iVar1 <= iVar12)))) &&
               (iVar12 <= cVar5)) {
              cVar18 = '\x01';
              auStack_98[iVar14 + 1] = auStack_98[iVar14 + 1] | (ushort)uVar16;
LAB_000393ec:
              local_b0[uVar20 * 2] = cVar7 + cVar18;
              (local_b0 + uVar20 * 2)[1] = cVar21;
              uVar20 = uVar20 + 1 & 0xff;
            }
LAB_00039408:
            uVar16 = 1 << (uVar19 + 1 & 0xff);
            uVar17 = *puVar11;
            if (((((uVar16 & (int)(short)uVar17) != 0) || (0x13 < uVar20)) ||
                ((iVar2 < iVar9 || ((cVar4 < iVar2 || (iVar12 + 1 < iVar1)))))) ||
               ((int)cVar5 < iVar12 + 1)) goto LAB_00039638;
            pcVar15 = local_b0 + uVar20 * 2;
            *pcVar15 = cVar7;
            cVar21 = cVar21 + '\x01';
            goto LAB_00039620;
          }
          if (bVar8 == 5) {
            uVar19 = iVar12 - iVar1;
            uVar16 = 1 << (uVar19 & 0xff);
            iVar14 = iVar2 - iVar9;
            puVar11 = auStack_98 + iVar14;
            if ((((uVar16 & (int)(short)(&uStack_9a)[iVar14]) == 0) && (uVar20 < 0x14)) &&
               ((iVar9 <= iVar2 + -1 &&
                (((iVar2 + -1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))))) {
              cVar18 = -1;
              (&uStack_9a)[iVar14] = (&uStack_9a)[iVar14] | (ushort)uVar16;
              goto LAB_000393ec;
            }
            goto LAB_00039408;
          }
          uVar19 = iVar12 - iVar1;
          uVar16 = 1 << (uVar19 & 0xff);
          iVar14 = iVar2 - iVar9;
          puVar11 = auStack_98 + iVar14;
          uVar17 = (&uStack_9a)[iVar14];
          if (((((uVar16 & (int)(short)uVar17) == 0) && (uVar20 < 0x14)) && (iVar9 <= iVar2 + -1))
             && (((iVar2 + -1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))) {
            local_b0[uVar20 * 2] = cVar7 + -1;
            (local_b0 + uVar20 * 2)[1] = cVar21;
            uVar20 = uVar20 + 1 & 0xff;
            (&uStack_9a)[iVar14] = uVar17 | (ushort)uVar16;
          }
          uVar3 = 1 << (uVar19 - 1 & 0xff);
          uVar17 = *puVar11;
          if ((((uVar3 & (int)(short)uVar17) == 0) && (uVar20 < 0x14)) &&
             ((iVar9 <= iVar2 &&
              (((iVar2 <= cVar4 && (iVar1 <= iVar12 + -1)) && (iVar12 + -1 <= (int)cVar5)))))) {
            local_b0[uVar20 * 2] = cVar7;
            *puVar11 = uVar17 | (ushort)uVar3;
            (local_b0 + uVar20 * 2)[1] = cVar21 + -1;
            uVar20 = uVar20 + 1 & 0xff;
          }
          uVar17 = auStack_98[iVar14 + 1];
          if ((((uVar16 & (int)(short)uVar17) == 0) && (uVar20 < 0x14)) &&
             (((iVar9 <= iVar2 + 1 && ((iVar2 + 1 <= (int)cVar4 && (iVar1 <= iVar12)))) &&
              (iVar12 <= cVar5)))) {
            local_b0[uVar20 * 2] = cVar7 + '\x01';
            (local_b0 + uVar20 * 2)[1] = cVar21;
            uVar20 = uVar20 + 1 & 0xff;
            auStack_98[iVar14 + 1] = uVar17 | (ushort)uVar16;
          }
          uVar16 = 1 << (uVar19 + 1 & 0xff);
          uVar17 = *puVar11;
          if ((((((uVar16 & (int)(short)uVar17) != 0) || (0x13 < uVar20)) || (iVar2 < iVar9)) ||
              ((cVar4 < iVar2 || (iVar12 + 1 < iVar1)))) || ((int)cVar5 < iVar12 + 1))
          goto LAB_00039638;
          pcVar15 = local_b0 + uVar20 * 2;
          *pcVar15 = cVar7;
          cVar21 = cVar21 + '\x01';
          *puVar11 = uVar17 | (ushort)uVar16;
        }
        pcVar15[1] = cVar21;
        uVar20 = uVar20 + 1 & 0xff;
      }
LAB_00039638:
      local_a8 = local_a8 + 1 & 0xff;
    } while (local_a8 < local_a0);
    local_b0 = local_a4;
    local_a4 = puVar6;
    local_a0 = uVar20;
    if (uVar20 == 0) {
      return 0;
    }
  } while( true );
}


// was FUN_0003ae00 -- object-tree-walk callback (via
// walk_object_tree/clear_temp_flags_on_all_objects): for a non-arena
// object (object_ptr_in_arena) whose class isn't a door (0x140) or
// other special type (0x180), and whose object-type props don't flag
// it with sub-category 2, clears bit 0x200 of its second word -- a
// "temporary/recently-used" style flag reset.
undefined4 clear_object_temp_flag_callback(param_1)
ushort * param_1;

{
  ushort uVar1;
  int iVar2;
  uint uVar3;

  iVar2 = object_ptr_in_arena(param_1);
  if (iVar2 == 0) {
    uVar3 = *param_1 & 0x1c0;
    if (((uVar3 != 0x140) && (uVar3 != 0x180)) &&
       (((&DAT_00202c9a)[(*param_1 & 0x1ff) * 0xd] & 3) != 2)) {
      uVar1 = param_1[1];
      *(char *)(param_1 + 1) = (char)(uVar1 & 0xfdff);
      *(char *)((char *)param_1 + 3) = (char)((uVar1 & 0xfdff) >> 8);
    }
  }
  return 0;
}



// was FUN_0003aea8 -- sweeps the entire 64x64 tile grid (DAT_002029cc)
// and, for every tile with a non-empty object list, recursively walks
// each object's tree (walk_object_tree, not yet named) applying
// clear_object_temp_flag_callback to every object found -- a global
// "reset the temporary flag on everything in the world" pass.
void clear_temp_flags_on_all_objects()

{
  undefined4 uVar1;
  char *iVar2;
  int iVar3;
  int iVar4;

  iVar4 = 0;
  iVar2 = DAT_002029cc;
  do {
    iVar3 = 0;
    do {
      if ((*(ushort *)(iVar2 + 2) & 0xffc0) != 0) {
        uVar1 = resolve_object_link((ushort *)(iVar2 + 2));
        walk_object_tree(uVar1,clear_object_temp_flag_callback);
      }
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      iVar2 = iVar2 + 4;
    } while (iVar3 < 0x40);
    iVar4 = iVar4 + 1;
  } while (iVar4 * 0x10000 >> 0x10 < 0x40);
  return;
}


// was FUN_000444b0 -- free_linked_object_recursive's sibling,
// specifically for the player's own carried-inventory chain: every
// known call site passes g_player_object+6 (the "contents"/sp_link
// field). Recurses into offsets +6 (nested contents, unless the
// object's own 0x80 flag bit is set) and +4 (next-in-chain) before
// unlinking and freeing the object itself -- no trap-class special
// case, unlike free_linked_object_recursive. Used both to tear the
// live inventory arena state down after it's been separately
// serialized to a save (commit_level_to_save_slot), and before a level
// transition/arena reset (close_panels_before_level_change), since the
// save/restore path -- not direct memory carryover -- is what
// preserves the player's items across levels.
void free_player_inventory_chain(param_1)
char *param_1;  /* was `undefined4` -- truncated the real g_player_object+6
                   pointer close_panels_before_level_change passes in. Pre-existing bug, but
                   never bit until resolve_object_link (this function's
                   own first call) started actually using its argument
                   instead of being called with no argument at all. */

{
  /* Was `int iVar1;` -- truncated resolve_object_link's real 64-bit
     `void *` return to 32 bits on this recompile (harmless on the
     original 32-bit ARM binary). This code path (the recursive
     inventory-unlink walk) was never actually exercised in any session
     until Enter started working correctly in the save/load name-entry
     field (see gx_stub.c's g_keychar_deferred) and a save finally ran
     all the way through to this function -- confirmed via lldb: the
     fault address was exactly g_player_object's low 32 bits (+0x1b),
     the classic signature of a pointer silently narrowed to `int`. Same
     bug class as this function's own param_1 fix above. */
  char *iVar1;

  iVar1 = resolve_object_link(param_1);
  if (iVar1 != 0) {
    if ((*(byte *)(iVar1 + 1) & 0x80) == 0) {
      if ((*(ushort *)(iVar1 + 6) & 0xffc0) != 0) {
        free_player_inventory_chain(iVar1 + 6); /* was called with no argument; confirmed via ARM disassembly, 0x44500 */
      }
    }
    if ((*(ushort *)(iVar1 + 4) & 0xffc0) != 0) {
      free_player_inventory_chain(iVar1 + 4); /* was called with no argument; confirmed via ARM disassembly, 0x4451c */
    }
    object_list_unlink(param_1,iVar1);
    free_object_slot(iVar1);
  }
  return;
}


// was FUN_00046260 -- computes an object's weight: looks up the
// per-class base weight (&DAT_00202c91, stride 0xd), multiplied by
// quantity for stackable items (the 0x8000 flag set), or -- for a
// non-stackable object that's itself a container -- adds the weight
// of everything it contains via sum_container_weight. Used throughout
// the inventory/equipment code for carry-weight bookkeeping.
uint calculate_object_weight(param_1)
ushort * param_1;

{
  ushort uVar1;
  uint uVar2;
  int iVar3;
  ushort local_8 [2];

  uVar1 = *param_1;
  iVar3 = (uVar1 & 0x1ff) * 0xd;
  if (((uVar1 & 0x8000) == 0) || ((param_1[3] & 0x8000) != 0)) {
    local_8[0] = *(ushort *)(&DAT_00202c91 + iVar3) >> 4;
    uVar2 = (uint)local_8[0];
    if ((uVar1 & 0x8000) == 0) {
      if ((param_1[3] & 0xffc0) != 0) {
        sum_container_weight(param_1 + 3,local_8);
        uVar2 = (uint)(short)local_8[0];
      }
    }
  }
  else {
    uVar2 = (uint)(*(ushort *)(&DAT_00202c91 + iVar3) >> 4) * (uint)(param_1[3] >> 6);
  }
  return uVar2;
}


// was FUN_00052674 -- boot-time loader for the game's core object
// definition data: opens "objects.dat" and dispatches to 8 per-class
// variant/effect table loaders (load_armor_variant_tables,
// load_monster_combat_stats, load_light_food_effect_tables,
// load_class6_variant_effect_table, load_class7_variant_effect_table,
// and others), then opens "comobj.dat" and reads 0x200 (512) 13-byte
// records into DAT_00202c90 -- the object-type property table read
// throughout collision/placement code (height, shape, size-class,
// etc. nibbles).
undefined4 load_object_catalog_data()

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  undefined *puVar6;
  char *pcVar7;
  byte local_144 [2];
  undefined1 auStack_142 [6];
  code *local_13c [8];
  char acStack_11c [260];
  
  iVar5 = 0;
  local_13c[3] = (code *)0x0;
  local_13c[0] = load_armor_variant_tables;
  local_13c[4] = (code *)0x0;
  local_13c[1] = load_monster_combat_stats;
  local_13c[5] = (code *)0x0;
  local_13c[2] = load_light_food_effect_tables;
  local_13c[6] = (code *)&load_class6_variant_effect_table;
  local_13c[7] = (code *)&load_class7_variant_effect_table;
  Ordinal_1047(acStack_11c,0,0x104);
  pcVar7 = &DAT_0023cca8;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
  pcVar2 = pcVar7;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_11c,s__DATA_objects_dat_000868a8);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 == -1) {
    uVar4 = 0x3005;
  }
  else {
    read_file_handle(iVar3,auStack_142,2);
    do {
      if (local_13c[iVar5] != (code *)0x0) {
        (*local_13c[iVar5])(iVar3);
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 8);
    Ordinal_553(iVar3);
    Ordinal_1047(acStack_11c,0,0x104);
    do {
      cVar1 = *pcVar7;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
    Ordinal_1063(acStack_11c,s__DATA_comobj_dat_00086894);
    iVar5 = open_file_for_read(acStack_11c);
    if (iVar5 == -1) {
      uVar4 = 0x3006;
    }
    else {
      read_file_handle(iVar5,auStack_142,2);
      puVar6 = &DAT_00202c90;
      iVar3 = 0x200;
      do {
        read_file_handle(iVar5,puVar6,3);
        read_file_handle(iVar5,puVar6 + 3,1);
        read_file_handle(iVar5,puVar6 + 5,2);
        read_file_handle(iVar5,puVar6 + 7,2);
        read_file_handle(iVar5,puVar6 + 9,1);
        read_file_handle(iVar5,local_144,1);
        puVar6[10] = ((puVar6[10] ^ local_144[0]) & 3 ^ puVar6[10] ^ local_144[0]) & 3 ^
                     local_144[0];
        read_file_handle(iVar5,puVar6 + 0xb,1);
        iVar3 = iVar3 + -1;
        puVar6 = puVar6 + 0xd;
      } while (iVar3 != 0);
      Ordinal_553(iVar5);
      uVar4 = 0;
    }
  }
  return uVar4;
}



/* Was `undefined4` -- same 64-bit-pointer-truncated-through-a-32-bit-
   return-type bug as get_equipped_item_at_slot's (see its own comment): this
   function returns a POINTER into one of the runtime tables class2_variant_effect_table_lookup
   and friends compute, and on a 64-bit build `undefined4` silently drops
   the pointer's upper 32 bits, handing the caller a wild address. */
void *get_scanned_object_class_effect_ptr()

{
  undefined1 *local_24 [4];
  undefined1 *local_14;
  undefined1 *local_10;
  undefined1 *local_c;
  undefined1 *local_8;
  
  local_24[0] = &class0_variant_effect_table_lookup;
  local_24[1] = &class1_variant_effect_table_lookup;
  local_24[2] = &class2_variant_effect_table_lookup;
  local_24[3] = &LAB_0007913c;
  local_14 = &LAB_00073b10;
  local_10 = &LAB_0006b3d4;
  local_c = &class6_variant_effect_table_lookup;
  local_8 = &class7_variant_effect_table_lookup;
  /* Was `(*(code *)local_24[...])(); return 0;` -- Ghidra couldn't trace
     a return value through the indirect call and fabricated a "return 0"
     placeholder. Real disassembly (0x52928-0x52938) shows no instruction
     sets r0 before the epilogue -- whatever the dispatched per-class
     handler leaves in r0 IS this function's real return value. Every
     caller relies on that (e.g. refresh_player_equipment_effects's light-scan loop:
     `iVar7 = get_scanned_object_class_effect_ptr(); bVar1 = *(byte*)(iVar7+1);` -- with the
     hardcoded 0 this dereferenced address 1 and crashed the moment a
     real light source was actually found by the scan). */
  return (*(void *(*)())local_24[(short)((*g_scratch_object_ptr & 0x1c0) >> 6)])();
}



// was FUN_00052af4 -- generic recursive object-tree walker: calls
// callback param_2 on param_1, then (unless param_1 is flagged
// "no contents") recurses into its contents link (+6), then advances
// to its next-in-chain link (+4) and repeats -- stopping early and
// returning 1 the moment any callback invocation returns nonzero,
// else 0 once the whole tree/chain is exhausted. Confirmed generic
// by two independent callers with different callbacks:
// object_exceeds_size_threshold (a "does anything in here exceed the
// current size limit" search) and clear_object_temp_flag_callback
// (a "reset a flag on everything" sweep that never early-exits).
undefined4 walk_object_tree(param_1,param_2)
char *param_1;  /* was `int` -- truncated the real object-record pointer
                   (dereferenced throughout this function via casts, and
                   passed to resolve_object_link/itself), latent until
                   those calls started actually using their arguments */
codeval * param_2;

{
  int iVar1;
  char *pcVar2;

  /* Dropped argument (both call sites below): param_2 is a callback
     (object_exceeds_size_threshold at every call site reached so far) that declares one
     parameter -- the object/link being tested, i.e. this function's
     own param_1 -- but was invoked bare, leaving object_exceeds_size_threshold's own
     param_1 as leftover-register garbage. Same idiom as this whole
     session's other dropped-argument fixes; confirmed live
     (UW_DEBUG_INV + demo_dropback_test.txt) crashing in object_exceeds_size_threshold's
     first dereference the moment this never-before-exercised
     drop-into-world path actually ran. */
  iVar1 = (*param_2)(param_1);
  while( true ) {
    if (iVar1 != 0) {
      return 1;
    }
    if (((*(byte *)(param_1 + 1) & 0x80) == 0) && ((*(ushort *)(param_1 + 6) & 0xffc0) != 0)) {
      /* Was `undefined4 uVar2` -- truncated resolve_object_link's real
         pointer return before forwarding it into the recursive call
         just below, same class as param_1 itself above. */
      pcVar2 = (char *)resolve_object_link((ushort *)(param_1 + 6)); /* confirmed via ARM disassembly, 0x52b54 */
      iVar1 = walk_object_tree(pcVar2,param_2);
      if (iVar1 != 0) {
        return 1;
      }
    }
    if ((*(ushort *)(param_1 + 4) & 0xffc0) == 0) break;
    param_1 = (char *)resolve_object_link((ushort *)(param_1 + 4)); /* confirmed via ARM disassembly, 0x52b84 */
    iVar1 = (*param_2)(param_1);
  }
  return 0;
}



// was FUN_00052bac -- checks whether object param_1's size/weight
// class exceeds the current threshold in DAT_002046b0 (set by its
// caller, e.g. roll_object_destroy_chance, just before use):
// container-flagged objects (0x2000) always report "exceeds" (1);
// otherwise combines the object-type's size-class nibble
// (DAT_00202c9a[type*0xd]>>2&0xf) with a stack-quantity-derived term
// and compares against the threshold. Used standalone and as a
// walk_object_tree callback for a "does this or anything inside it
// exceed the limit" recursive check.
undefined4 object_exceeds_size_threshold(param_1)
ushort * param_1;

{
  ushort uVar1;
  undefined4 uVar2;
  short sVar3;
  int iVar4;
  
  uVar1 = *param_1;
  if ((uVar1 & 0x2000) == 0) {
    if (((uVar1 & 0x8000) == 0) || ((param_1[3] & 0x8000) != 0)) {
      sVar3 = 0;
    }
    else {
      sVar3 = (param_1[3] >> 6) - 1;
    }
    iVar4 = (int)sVar3;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 1;
    }
    uVar2 = 1;
    if ((int)(((byte)(&DAT_00202c9a)[(uVar1 & 0x1ff) * 0xd] >> 2 & 0xf) + (iVar4 >> 1)) <=
        (int)DAT_002046b0) {
      uVar2 = 0;
    }
  }
  else {
    uVar2 = 1;
  }
  return uVar2;
}


// was FUN_00052d24 -- if link param_2 points to a real object,
// resolves it and rolls roll_object_destroy_chance(param_1, object).
// Always returns 0 -- the caller (despawn_objects_outside_radius)
// re-derives the actual decision itself rather than using this
// return value, so the roll's effect (if any) only matters via
// whatever roll_object_destroy_chance itself did internally.
undefined4 should_destroy_linked_object(param_1,param_2)
undefined4 param_1;
ushort * param_2;

{
  undefined4 uVar1;

  if ((*param_2 & 0xffc0) != 0) {
    uVar1 = resolve_object_link(param_2);
    roll_object_destroy_chance(param_1,uVar1);
  }
  return 0;
}



// was FUN_00052d68 -- reclaims object slots by probabilistically
// destroying objects in tile rows more than (10-param_1) rows from
// the player's row, up to param_2 destructions. Confirmed by its
// three call sites: objects.c's free-object-slot allocator calls this
// (radius param 3, limits 10/5) when the mobile/static free-list has
// run dry, to try to free slots before giving up; player.c calls it
// too (radius param 1, limit 0x14) on its own cadence. Each
// candidate's actual destruction is decided by
// should_destroy_linked_object/roll_object_destroy_chance.
void despawn_objects_outside_radius(param_1,param_2)
undefined4 param_1;
short param_2;

{
  uint uVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  undefined4 uVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  char *iVar9;
  int iVar10;
  ushort local_3c [2];
  int local_38;
  int local_34;
  int local_30;
  
  iVar10 = 0;
  iVar7 = 0;
  uVar2 = *(ushort *)((char *)g_player_object + 0x16);
  local_38 = (int)(short)(uVar2 >> 10);
  local_30 = 10 - (short)param_1;
  iVar9 = DAT_002029cc;
  do {
    uVar6 = (short)((uVar2 & 0x3f0) >> 4) - iVar7;
    uVar1 = (int)uVar6 >> 0x1f;
    local_34 = (int)(short)(((uVar6 ^ uVar1) - uVar1) * 0x10000 >> 0x10);
    iVar8 = 0;
    do {
      uVar1 = local_38 - iVar8 >> 0x1f;
      if (local_30 < (int)(local_34 + ((local_38 - iVar8 ^ uVar1) - uVar1))) {
        for (local_3c[0] = *(ushort *)(iVar9 + 2); (local_3c[0] & 0xffc0) != 0;
            local_3c[0] = local_3c[0] & 0x3f | uVar3 & 0xffc0) {
          iVar4 = resolve_object_link(local_3c);
          uVar3 = *(ushort *)(iVar4 + 4);
          iVar4 = should_destroy_linked_object(param_1,local_3c);
          if (iVar4 != 0) {
            uVar5 = get_object_record_by_slot_index(local_3c[0] >> 6);
            unlink_and_free_object((ushort *)(iVar9 + 2),uVar5);
            iVar10 = iVar10 + 1;
            if ((int)param_2 <= iVar10 * 0x10000 >> 0x10) {
              return;
            }
          }
        }
      }
      iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      iVar9 = iVar9 + 4;
    } while (iVar8 < 0x40);
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 0x40);
  return;
}



// was FUN_00053334 -- despite the name this settled on, it's a DESTROY
// path, not a placement one: when param_3==0 it rolls
// roll_object_destroy_chance(10, param_2), which (see that function's
// own comment) returns true with ~100% probability under normal
// conditions, then unconditionally unlinks and frees param_2 via
// unlink_and_free_object. Reached by settle_dropped_object whenever an
// object lands somewhere it can't actually rest (floor too high/low,
// blocked corner, etc.) -- confirmed via disassembly this "destroy the
// misplaced object" behavior is genuine original-game logic, not a
// translation bug.
ushort *discard_misplaced_object(param_1,param_2,param_3)
/* Was `int param_1` -- a real object-record pointer (drop_held_object_
   near_player passes pDropTile+2, a resolve_object_link-style address)
   truncated to 32 bits on this 64-bit host, same class as several
   other fixes this session. */
char *param_1;
ushort * param_2;
int param_3;

{
  ushort uVar1;
  int iVar2;
  ushort local_10 [2];

  /* Dropped argument: roll_object_destroy_chance's declared signature takes
     (short, char*) and dereferences its second parameter -- but it was
     called here with only the literal 10, leaving the real argument
     (param_2, the object being placed) as leftover-register garbage.
     Confirmed live (UW_DEBUG_INV + demo_dropback_test.txt): dropping
     an item out of the backpack into the 3D view crashed several
     frames deeper (walk_object_tree/object_exceeds_size_threshold) dereferencing that
     garbage pointer -- this whole collision/placement path had never
     been exercised by any earlier fix or test this session. */
  if ((param_3 != 0) || (iVar2 = roll_object_destroy_chance(10,(char *)param_2), iVar2 != 0)) {
    uVar1 = encode_object_slot_index(param_2);
    local_10[0] = local_10[0] & 0x3f | uVar1 << 6;
    if ((*param_2 & 0x1c0) == 0x1c0) {
      scheduler_remove_entry(uVar1 & 0x3ff);
    }
    if (param_1 == 0) {
      free_linked_object_recursive(local_10);
    }
    else {
      unlink_and_free_object(param_1,param_2);
    }
    param_2 = (ushort *)0x0;
  }
  return param_2;
}



/* The fundamental "object slot index -> record pointer" accessor (70 call
   sites): slots 0-0xff are 0x1b-byte records in the DAT_002046b8 table,
   slots >=0x100 are 8-byte records in the DAT_002046c4 table. Was `int`,
   truncating the real pointer arithmetic below on this 64-bit host --
   many callers already store the result through a pointer-typed local
   (e.g. `puVar4 = (undefined1 *)get_object_record_by_slot_index()`), so they got a
   truncated pointer back regardless of their own care. Confirmed as a
   crash source in reset_npc_path_cache (level-load object-table reset). */
void *get_object_record_by_slot_index(param_1)
short param_1;

{
  intptr_t iVar1;

  iVar1 = (int)param_1;
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else if (iVar1 < 0) {
    /* No caller has ever legitimately passed a negative slot -- a real
       UW1 level has exactly 1024 object slots (0-0x3ff), 256 static +
       768 mobile -- but nothing bounded the input, and a corrupted/
       garbage caller-side read (e.g. collision_height_envelope reading
       *(short*)(DAT_00202c6c+10) as this slot) can hand one in.
       Confirmed via lldb: this exact case crashed dereferencing the
       resulting wild pointer, reproduced by the same mapped movement
       sequence as resolve_object_link's own bounds fix (12x forward,
       turn, 3x forward, turn, 5x forward). */
    DEBUG(ERR, "[get_object_record_by_slot_index] negative slot %d, returning NULL\n", (int)param_1);
    iVar1 = 0;
  }
  else if (iVar1 < 0x100) {
    iVar1 = iVar1 * 0x1b + (intptr_t)DAT_002046b8;
  }
  else if (iVar1 < 0x400) {
    iVar1 = (intptr_t)DAT_002046c4 + (iVar1 + -0x100) * 8;
  }
  else {
    /* >= 1024: past the real 768-slot mobile-object table
       (DAT_002046c4..+0x1800) -- same corrupted/out-of-range slot class
       as the negative case above. */
    DEBUG(ERR, "[get_object_record_by_slot_index] slot %d exceeds 0x3ff, returning NULL\n", (int)param_1);
    iVar1 = 0;
  }
  return (void *)iVar1;
}
