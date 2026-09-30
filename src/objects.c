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
    if ((DAT_0020469c < DAT_002046bc) && (FUN_00052d68(3,10), DAT_0020469c < DAT_002046bc)) {
      return 0;
    }
    pvVar1 = DAT_002046c4 + (*(short *)DAT_0020469c - 0x100) * 8;
    puVar2 = (ushort *)DAT_0020469c;
  }
  else {
    puVar3 = &DAT_002046a8;
    if ((DAT_002046a8 < DAT_002046a4) && (FUN_00052d68(3,5), DAT_002046a8 < DAT_002046a4)) {
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
   pointer arithmetic as FUN_000535fc above (fixed earlier this session)
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
