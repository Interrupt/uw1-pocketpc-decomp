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
      if (((*DAT_00202a44 & 0x1c0) == 0x40) && (sVar5 = encode_object_slot_index(DAT_00202a44), 0xff < sVar5)) {
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
    DEBUG(INFO, "[throw] object id=0x%03x spawned at tile=(%d,%d)\n",
          (unsigned)(*puVar6 & 0x1ff), puVar6[0xb] >> 10, (puVar6[0xb] & 0x3f0) >> 4);
    object_list_insert_head(pbTile + 2,puVar6);
    play_sound_effect_at_object(10,puVar6,0);
    /* The original FUN_0004ad10 returns the mobile object here.
       mobile_object_tick integrates its flight and sync_object_tile_position
       converts it to an immobile item only once its velocity reaches zero. */
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

  /* The original FUN_00053514 also accepts copied link words in the
     six-byte collision candidate array (see FUN_0005898c and FUN_0005aea0).
     Keep the port's arena guard, but allow that original call contract. */
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
    uintptr_t link_address = (uintptr_t)param_1;
    uintptr_t candidates = (uintptr_t)DAT_00202c38_backing;
    bool candidate_link = link_address >= candidates + 2 &&
                          link_address < candidates + 9 * 6 &&
                          (link_address - candidates - 2) % 6 == 0;
    if (!candidate_link && ((char *)param_1 < _lo || (char *)param_1 >= _hi)) {
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
// placed (FUN_00051fa0). Expansion direction from each tile is gated
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
  /* Ghidra split the visited columns at adjacent stack offsets 0x2a/
     0x2c. Keep the preceding column in the same array: expressions that
     used &uStack_9a index one column before auStack_98. Initialize the
     whole bitmap, since the original nine-byte memset left high columns
     indeterminate on this host. */
  ushort visited_storage [13] = {0};
  ushort *auStack_98 = visited_storage + 1;
  /* ARM 0x38e4c/0x38e5c stores X/Y at sp+0x44/sp+0x45, the first
     coordinate pair in one buffer. Both frontiers span 0x28 bytes on
     the original stack and hold up to 0x14 pairs. A separate local_7f
     made the search read Y=0; a 0x14-byte buffer overflowed after swaps. */
  undefined1 local_80 [40];
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
  local_80[1] = (char)param_3;
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
      iVar14 = FUN_00051fa0(*param_1 & 0x1ff,uVar13,((iVar2 << 0x13) >> 0x10) + 3,
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
            if ((((uVar16 & (int)(short)(auStack_98 - 1)[iVar14]) == 0) && (uVar20 < 0x14)) &&
               ((iVar9 <= iVar2 + -1 &&
                (((iVar2 + -1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))))) {
              cVar18 = -1;
              (auStack_98 - 1)[iVar14] = (auStack_98 - 1)[iVar14] | (ushort)uVar16;
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
            if ((((uVar16 & (int)(short)(auStack_98 - 1)[iVar14]) == 0) && (uVar20 < 0x14)) &&
               ((iVar9 <= iVar2 + -1 &&
                (((iVar2 + -1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))))) {
              cVar18 = -1;
              (auStack_98 - 1)[iVar14] = (auStack_98 - 1)[iVar14] | (ushort)uVar16;
              goto LAB_000393ec;
            }
            goto LAB_00039408;
          }
          uVar19 = iVar12 - iVar1;
          uVar16 = 1 << (uVar19 & 0xff);
          iVar14 = iVar2 - iVar9;
          puVar11 = auStack_98 + iVar14;
          uVar17 = (auStack_98 - 1)[iVar14];
          if (((((uVar16 & (int)(short)uVar17) == 0) && (uVar20 < 0x14)) && (iVar9 <= iVar2 + -1))
             && (((iVar2 + -1 <= (int)cVar4 && (iVar1 <= iVar12)) && (iVar12 <= cVar5)))) {
            local_b0[uVar20 * 2] = cVar7 + -1;
            (local_b0 + uVar20 * 2)[1] = cVar21;
            uVar20 = uVar20 + 1 & 0xff;
            (auStack_98 - 1)[iVar14] = uVar17 | (ushort)uVar16;
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
// FUN_00052af4/clear_temp_flags_on_all_objects): for a non-arena
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
// each object's tree (FUN_00052af4, not yet named) applying
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
        FUN_00052af4(uVar1,clear_object_temp_flag_callback);
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
