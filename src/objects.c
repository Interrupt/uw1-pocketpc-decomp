/* The object table: slot allocation/free, the per-tile/per-container
 * linked-list primitives (insert/append/unlink/resolve), and object
 * spawning. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/objects.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

undefined4 DAT_00202c84;
undefined2 DAT_002020a0;
undefined2 DAT_002020a4;
byte *DAT_00202c6c;
/* Was a lone `undefined1` scalar, but (like DAT_00202c39/3a/3c below,
   already fixed) every real use is `(&DAT_00202c38)[i*6]` -- one field of
   a repeating 6-byte-stride per-candidate record in
   collision_height_envelope/sort_collision_candidates's up-to-256-entry collision
   candidate list (the ARM loads at +0/+1/+2/+3/+4/+5 and next-record
   sort reads at +6/+7 confirm the 6-byte stride). Indexing past element
   0 read/wrote whatever memory happened to follow this single byte in
   the link order -- confirmed via a real crash (a plain, non-debugger
   run walking toward a critter; the same bug reproduced fine under
   lldb/ASan since they lay out globals differently, masking it there).
   Keep the aliases in uw.h: independent arrays lose the link high byte. */
 undefined1 DAT_00202c38_backing[8192];
 undefined1 DAT_00202c90_backing[65536];
/* Was `int` despite being assigned real pointer values derived from
   DAT_002046b8 (see there) and itself assigned into g_player_object
   (`char *`) -- truncating on this 64-bit host, part of the same crash
   chain (reset_player_object_record's ce_memset call reading g_player_object). */
char *DAT_0023b82c;
undefined1 DAT_002027d0_backing[256];
 undefined1 DAT_00202800_backing[65536];
byte *g_scratch_object_ptr;
short DAT_00101454;
short DAT_0010144c;
short DAT_00202a3c;
byte *DAT_002046c0;
byte *DAT_002046c8;
/* Was a plain tentative definition (no initializer), so a truly fresh
   process starts it at C's default zero instead of the real "no
   container open" resting state. Every genuine reset in this file
   (FUN_0003bcd8, probe_save_slots's caller, journey_onward_load_slot_menu's
   own setup) explicitly sets this to 0xffff/-1, and every reader treats
   it as signed (`-1 < DAT_00202080` gates load_player_save_record's
   object_list_unlink call below) -- 0 reads as "container slot 0 is
   open", spuriously unlinking g_player_object from a wild address
   computed off a container that was never really open. Confirmed live:
   SIGBUS in object_list_unlink on the very first "new game" of a
   process that never had an earlier save to leave this at a sane value
   (this codebase's regression scripts had been silently relying on
   stale state left over from a prior interactive session to avoid ever
   hitting this fresh-process path). */
short DAT_00202080 = -1;
ushort *DAT_002046b4;
undefined1 DAT_002029f8_backing[256];
char *DAT_002046a4;
char *DAT_002046a8;
char * DAT_002046bc;
char *DAT_0020469c;
undefined1 DAT_002029d8_backing[256];
short DAT_00202a40;
ushort DAT_00202a48;
short DAT_00202a38;
ushort DAT_00202a4c;
/* FUN_0004ad10 reads word 1 (position) and word 12 (heading). */
ushort *DAT_00202a44;
undefined2 DAT_00202a50;
undefined2 DAT_00202a54;
static char s__DATA_comobj_dat_00086894[] = "\\DATA\\comobj.dat";
static char s__DATA_objects_dat_000868a8[] = "\\DATA\\objects.dat";
short DAT_002046b0;
static int DAT_002046d4;
static int DAT_002046ec;
/* Was a lone `undefined` scalar, but the real class6 variant-effect
   lookup (uw.c ~46760, class6_variant_effect_table_lookup) indexes it
   as `&DAT_0024cfe0 + nibble` for nibble 0..0xf, and its boot-time
   loader (load_class6_variant_effect_table) reads exactly 0x10 bytes
   into it -- same lone-scalar-treated-as-array bug class fixed
   repeatedly elsewhere in this file. */
undefined1 DAT_0024cfe0_backing[8192];
undefined1 DAT_00250730_backing[65536];






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
      cVar4 = ordint_divmod(6,(uint)(byte)(&DAT_00202c90)[(*DAT_00202a44 & 0x1ff) * 0xd] * 5).quot;
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
    sVar1 = ordint_divmod(0x1b,param_1 - DAT_002046b8).quot;
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
    sVar3 = ordint_divmod(0x1b,param_2 - DAT_002046b8).quot;
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
    sVar1 = ordint_divmod(0x1b,param_2 - DAT_002046b8).quot;
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
    sVar1 = ordint_divmod(0x1b,param_1 - DAT_002046b8).quot;
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
/* ARM 0x3803c forwards the damaging actor's address to the door callback.
   Keep it pointer-sized rather than truncating it through undefined4. */
undefined4 apply_object_destruction_effect(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
ushort *param_2;
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
          uVar5 = ce_rand();
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

  ce_memset(local_80,0,0x14);
  ce_memset(local_58,0,0x14);
  ce_memset(auStack_98,0,9);
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
  ce_memset(acStack_11c,0,0x104);
  pcVar7 = &DAT_0023cca8;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
  pcVar2 = pcVar7;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_objects_dat_000868a8);
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
    CloseHandle(iVar3);
    ce_memset(acStack_11c,0,0x104);
    do {
      cVar1 = *pcVar7;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_11c,s__DATA_comobj_dat_00086894);
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
      CloseHandle(iVar5);
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
  local_24[3] = &class3_variant_effect_stub;
  local_14 = &class4_variant_effect_stub;
  local_10 = &class5_variant_effect_stub;
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


// was FUN_00053644 -- recursively searches the chain/contents
// rooted at link param_1 for an object whose encode_object_slot_index()
// matches target slot param_3 (param_2 is always passed 1, a recurse-
// into-contents flag like find_object_in_chain's); tracks the current
// search object in DAT_002046b4. Confirmed used both directly
// (interact.c's "look up by slot index and unlink if found") and by
// item_use.c for the same pattern.
// BUG FIX (unit-testing-framework merge): encode_object_slot_index was
// called bare below -- dropped argument, confirmed by every other call
// site in this file passing one, and by the loop's own intent (checking
// the just-resolved iVar3 link's encoded slot against param_3).
// BUG FIX (unit-testing-framework merge): iVar3/iVar4 and this
// function's own return type were `int`, truncating resolve_object_link's
// real pointer to 32 bits on this 64-bit host -- caught live by
// test_inventory's test_open_sack_finds_contents_through_inventory_widget
// (encode_object_slot_index received a truncated object pointer that no
// longer matched any real fixture object). Widened to real pointer types,
// matching every other dropped-argument/pointer-truncation fix this
// project has made.
ushort *find_object_by_encoded_slot_in_chain(param_1,param_2,param_3)
ushort * param_1;
undefined4 param_2;
undefined4 param_3;

{
  ushort *puVar1;
  short sVar2;
  byte *iVar3;
  ushort *iVar4;

  if ((*param_1 & 0xffc0) == 0) {
LAB_00053720:
    iVar4 = 0;
    puVar1 = DAT_002046b4;
  }
  else {
    DAT_002046b4 = param_1;
    iVar3 = resolve_object_link(param_1);
    while ((sVar2 = encode_object_slot_index(iVar3), iVar4 = (ushort *)iVar3, puVar1 = param_1, sVar2 != (short)param_3 &&
           ((((*(byte *)(iVar3 + 1) & 0x80) != 0 || ((*(ushort *)(iVar3 + 6) & 0xffc0) == 0)) ||
            (iVar4 = find_object_by_encoded_slot_in_chain((ushort *)(iVar3 + 6),param_2,param_3), puVar1 = DAT_002046b4,
            iVar4 == 0))))) {
      if ((*(ushort *)(iVar3 + 4) & 0xffc0) == 0) goto LAB_00053720;
      iVar3 = resolve_object_link((ushort *)(iVar3 + 4));
    }
  }
  DAT_002046b4 = puVar1;
  return iVar4;
}



// was FUN_00053728
undefined4 object_ptr_in_arena(param_1)
char *param_1;

{
  undefined4 uVar1;
  
  if ((param_1 == 0) || (uVar1 = 1, DAT_002046c4 <= param_1)) {
    uVar1 = 0;
  }
  return uVar1;
}



// was active_mobile_list_add
void active_mobile_list_add(param_1)
undefined1 param_1;

{
  *DAT_002046c8 = param_1;
  DAT_002046c8 = DAT_002046c8 + 1;
  return;
}



// was active_mobile_list_remove
void active_mobile_list_remove(param_1)
char param_1;

{
  char *pcVar1;
  
  pcVar1 = DAT_002046c0;
  while( true ) {
    if (DAT_002046c8 <= pcVar1) {
      return;
    }
    if (*pcVar1 == param_1) break;
    pcVar1 = pcVar1 + 1;
  }
  DAT_002046c8 = DAT_002046c8 + -1;
  if (DAT_002046c8 <= pcVar1) {
    return;
  }
  *pcVar1 = *DAT_002046c8;
  return;
}



/* param_1 was `undefined4 *`, so `resolve_object_link(*param_1)` and
   `*param_1 = local_28` truncated the 64-bit object-list pointer the
   callers hand in by address (crashing e.g. a right-click "look" at the
   spawn-room sack: trigger_object_trap_or_use_action -> here -> resolve_object_link(garbage)).
   It's a pointer-to-pointer -- ushort **. */
// was FUN_000537d0 -- searches the object chain starting at *param_1
// for one matching class param_3 (>>6&7 of the type word), subclass
// param_4 (>>4&3), and quality param_5 (&0xf), each -1/0xffff
// ("wildcard") skipping that check; recurses into an object's own
// contents when param_2 is set and it isn't flagged "no contents".
// On success, advances *param_1 to the matching object's own link
// (letting the caller resume the search past it on a repeat call --
// the classic "find next matching object" pattern). Confirmed by
// dozens of call sites across babl.c/containers.c/item_use.c/
// interact.c/object_actions.c/traps.c, all passing a class/subclass/
// quality filter triple.
ushort *find_object_in_chain(param_1,param_2,param_3,param_4,param_5)
ushort ** param_1;
int param_2;
undefined4 param_3;
undefined4 param_4;
short param_5;

{
  ushort *puVar1;
  ushort *puVar2;
  uint uVar3;
  ushort *local_28;
  
  puVar1 = (ushort *)resolve_object_link(*param_1);
  if (puVar1 != (ushort *)0x0) {
    do {
      if ((((int)(short)param_3 == 0xffffffff) ||
          (uVar3 = (uint)*puVar1, (*puVar1 >> 6 & 7) == (int)(short)param_3)) &&
         (((int)(short)param_4 == 0xffffffff ||
          (uVar3 = (uint)*puVar1, (*puVar1 >> 4 & 3) == (int)(short)param_4)))) {
        if ((int)param_5 == 0xffffffff) {
          return puVar1;
        }
        uVar3 = (uint)*puVar1;
        if ((uVar3 & 0xf) == (int)param_5) {
          return puVar1;
        }
      }
      if ((((param_2 != 0) && ((uVar3 & 0x8000) == 0)) && ((puVar1[3] & 0xffc0) != 0)) &&
         (local_28 = puVar1 + 3,
         puVar2 = (ushort *)find_object_in_chain(&local_28,param_2,param_3,param_4,param_5),
         puVar2 != (ushort *)0x0)) {
        *param_1 = local_28;
        return puVar2;
      }
      puVar1 = (ushort *)resolve_object_link(puVar1 + 2);
    } while (puVar1 != (ushort *)0x0);
  }
  return (ushort *)0x0;
}


// was FUN_00053920 -- returns whether object param_1 itself encodes
// type param_2 (&0x1ff of its type word), or -- if it isn't flagged
// "no contents" -- whether find_object_in_chain finds a match for
// that type (decoded into class/subclass/quality) among its
// contents. Confirmed called with the same literal type 0x126 at
// both call sites (checking the selected/interact object for a
// specific item type, directly or nested inside).
undefined4 object_or_contents_has_type(param_1,param_2)
ushort * param_1;
ushort param_2;

{
  undefined4 uVar1;
  int iVar2;
  ushort *local_8;
  
  if ((*param_1 & 0x1ff) == (int)(short)param_2) {
    uVar1 = 1;
  }
  else {
    if ((*param_1 & 0x8000) == 0) {
      local_8 = param_1 + 3;
      iVar2 = find_object_in_chain(&local_8,1,(int)(short)param_2 >> 6,(short)param_2 >> 4 & 3,param_2 & 0xf
                          );
      if (iVar2 != 0) {
        return 1;
      }
    }
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_000539b0 -- the world-wide counterpart to find_object_in_chain:
// scans the 64x64 tile grid (DAT_002029cc) tile by tile, calling
// find_object_in_chain on each tile's object chain with class param_1/
// subclass param_2/quality param_3, resuming from (and updating) the
// saved tile-column/tile-row cursor at *param_4/*param_5 -- the same
// "find next match" resumable-search pattern. Confirmed used by
// doors.c (locating a door's matching key/trigger by packed tile
// coordinates) and traps.c (scanning for trap-relevant objects).
ushort *find_object_in_world(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
undefined2 param_3;
short * param_4;
short * param_5;

{
  short sVar1;
  int iVar2;
  /* Ghidra used 32-bit integers for the tile cursor and object return.
     Preserve both pointers on the 64-bit host, including resurrection's
     check_scheduled_object_level_match call after a player death. */
  char *iVar3;
  ushort *puVar6;
  ushort *local_24;

  if (0x3f < *param_4) {
    *param_4 = 0;
    *param_5 = *param_5 + 1;
  }
  iVar2 = (int)*param_5;
  iVar3 = DAT_002029cc + ((int)*param_4 + iVar2 * 0x40) * 4;
  do {
    if (0x3f < iVar2) {
      return 0;
    }
    if (*param_4 < 0x40) {
      do {
        local_24 = (ushort *)(iVar3 + 2);
        if (((*local_24 & 0xffc0) != 0) &&
           (puVar6 = find_object_in_chain(&local_24,1,param_1,param_2,param_3), puVar6 != 0)) {
          return puVar6;
        }
        sVar1 = *param_4;
        iVar3 = iVar3 + 4;
        *param_4 = (short)(sVar1 + 1);
      } while ((sVar1 + 1) * 0x10000 >> 0x10 < 0x40);
    }
    *param_4 = 0;
    sVar1 = *param_5;
    *param_5 = (short)(sVar1 + 1);
    iVar2 = (sVar1 + 1) * 0x10000 >> 0x10;
  } while( true );
}


// was FUN_00055ef8 -- finalizes the position fields of a just-
// settled object's placement snapshot (param_1, the same snapshot
// struct build_object_placement_snapshot fills): if DAT_002046d4 is
// clear (settled cleanly), sets a random quarter-heading and a fixed
// "parked" offset marker (0xfc/0xff) at +0x10/+0x11; if set (settled
// on top of a blocking surface, per settle_dropped_object's own use
// of this flag), instead randomizes the heading-ish field at +0x21
// within a +/-0x2000 range and marks +0x14/+0x15 with a different
// marker (0xbc/0). Called only after settle_dropped_object succeeds
// and the object resolved to a static (non-arena) slot.
void randomize_settled_snapshot_position(param_1)
int param_1;

{
  char cVar1;
  short sVar2;
  int iVar3;
  
  if (DAT_002046d4 == 0) {
    cVar1 = ce_rand();
    *(byte *)(param_1 + 0x14) = (cVar1 + 1U & 3) * '/';
    *(undefined1 *)(param_1 + 0x15) = 0;
    *(undefined1 *)(param_1 + 0x10) = 0xfc;
    *(undefined1 *)(param_1 + 0x11) = 0xff;
  }
  else {
    sVar2 = ce_rand();
    iVar3 = (((int)sVar2 & 0x3fffU) - 0x2000) + (int)*(short *)(param_1 + 0x21);
    *(char *)(param_1 + 0x21) = (char)iVar3;
    *(char *)(param_1 + 0x22) = (char)((uint)iVar3 >> 8);
    *(undefined1 *)(param_1 + 0x14) = 0xbc;
    *(undefined1 *)(param_1 + 0x15) = 0;
  }
  return;
}



// was FUN_00055f98 -- finalize a just-placed object's rest position at
// (param_2,param_3): validate it can actually reach this floor height,
// route genuinely-misplaced objects into discard_misplaced_object
// (which destroys them, see its own comment), or reallocate a never-
// before-placed object into the renderable arena via
// reallocate_object_to_arena before returning it.
ushort *settle_dropped_object(param_1,param_2,param_3,param_4)
ushort * param_1;
short param_2;
short param_3;
int param_4;

{
  int uw_ord2005_rem_119 = 0;
  bool bVar1;
  ushort uVar2;
  undefined2 uVar3;
  char cVar4;
  byte bVar5;
  undefined2 uVar6;
  short *psVar7;
  uint uVar8;
  ushort *puVar9;
  undefined4 uVar10;
  char extraout_r1;
  int iVar11;
  int iVar12;
  /* iVar12 is reused throughout this function as a plain int (bitfield
     math, array indices) -- real uses, left alone -- but the one use at
     LAB_000564d8 held tilemap_lookup's real 64-bit pointer return,
     truncating it on this host (same class as drop_held_object_near_
     player's own identical bug just above it in this file). New,
     properly-typed local for just that one pointer use; every other
     iVar12 use is separated from it by an early `return`, so this
     doesn't touch any of them. */
  char *pDropTile;
  undefined1 local_4c [24];

  DAT_002046d4 = 0;
  DAT_002046ec = 0;
  DAT_00202c6c = local_4c;
  bVar1 = false;
  uVar6 = encode_object_slot_index(param_1);
  DAT_00202c6c[10] = (char)uVar6;
  DAT_00202c6c[0xb] = (char)((ushort)uVar6 >> 8);
  iVar12 = (*param_1 & 0x1ff) * 0xd;
  bVar5 = (&DAT_00202c93)[iVar12];
  if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
    fprintf(stderr, "[f98] ENTER param_1=%p type=0x%x tile=(%d,%d) flags-byte=0x%x\n",
            (void *)param_1, (unsigned)(*param_1 & 0x1ff), (int)param_2, (int)param_3, (unsigned)bVar5);
  do {
    if ((bVar5 & 8) != 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: flag8 set on class table, returning param_1 unchanged\n");
      return param_1;
    }
    DAT_00202c6c[8] = (&DAT_00202c91)[iVar12] & 7;
    DAT_00202c6c[9] = (&DAT_00202c90)[iVar12];
    DAT_00202c6c[4] = (byte)param_1[1] & 0x7f;
    DAT_00202c6c[5] = 0;
    iVar12 = param_2 * 8 + (uint)(*(byte *)((char *)param_1 + 3) >> 5);
    *DAT_00202c6c = (char)iVar12;
    DAT_00202c6c[1] = (char)((uint)iVar12 >> 8);
    iVar12 = param_3 * 8 + ((*(byte *)((char *)param_1 + 3) & 0x1c) >> 2);
    DAT_00202c6c[2] = (char)iVar12;
    DAT_00202c6c[3] = (char)((uint)iVar12 >> 8);
    collision_build_height_field(DAT_00202c6c[8]);
    if (((int)((uint)(byte)DAT_00202c6c[8] + (uint)(byte)DAT_00202c6c[0x10]) <
         (int)*(short *)(DAT_00202c6c + 4)) || (iVar12 = 1, bVar1)) {
      iVar12 = 0;
    }
    collision_height_envelope(iVar12,1);
    sort_collision_candidates();
    DAT_00086998 = -1;
    if (((DAT_00202c6c[0x15] == '\0') && (iVar11 = (int)(char)DAT_00202c6c[0x16], 0 < iVar11)) &&
       (iVar11 <= (int)(uint)(byte)DAT_00202c6c[0x14])) {
      iVar11 = (iVar11 + -1) * 0x1000000 >> 0x18;
      do {
        DAT_00202c6c[0x16] = (char)iVar11;
        cVar4 = DAT_00202c6c[0x16];
        if ((cVar4 < 0) ||
           ((ushort)(byte)(&DAT_00202c38)[cVar4 * 6] != *(ushort *)(DAT_00202c6c + 4))) break;
        DAT_00086998 = cVar4;
        psVar7 = (short *)resolve_object_link(&DAT_00202c3a + cVar4 * 6);
        uVar8 = (int)*psVar7 & 0x1ff;
        DAT_00086999 = (undefined1)uVar8;
        DAT_0008699a = (undefined1)(uVar8 >> 8);
        if (((&DAT_00202c93)[(short)uVar8 * 0xd] & 2) == 2) {
          if (((&DAT_00202c3a)[DAT_00086998 * 6] & 0x10) != 0) {
            DAT_002046ec = 1;
            break;
          }
          DAT_002046d4 = 1;
        }
        iVar11 = (char)DAT_00202c6c[0x16] + -1;
      } while( true );
    }
    uVar3 = DAT_00101454;
    uVar6 = DAT_0010144c;
    uVar2 = *(ushort *)(DAT_00202c6c + 0xc);
    if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
      fprintf(stderr, "[f98] uVar2(local_4c+0xc)=0x%x local_4c+0xe=0x%x local_4c[0x15]=%d iVar12=%d\n",
              (unsigned)uVar2, (unsigned)*(ushort *)(DAT_00202c6c + 0xe),
              (int)DAT_00202c6c[0x15], iVar12);
    if ((((*(ushort *)(DAT_00202c6c + 0xe) | uVar2) & 0x300) != 0) || (DAT_00202c6c[0x15] != '\0'))
    {
      cVar4 = '\x01';
LAB_000564d0:
      if (cVar4 == '\0') {
        if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
          fprintf(stderr, "[f98] BAIL at LAB_000564d0 (cVar4==0), returning param_1 unchanged\n");
        return param_1;
      }
LAB_000564d8:
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] -> discard_misplaced_object fallback path (not reallocate_object_to_arena replace)\n");
      pDropTile = (char *)tilemap_lookup((int)param_2,(int)param_3);
      puVar9 = (ushort *)discard_misplaced_object(pDropTile + 2,param_1,0);
      return puVar9;
    }
    if ((uVar2 & 7) == 5) goto LAB_000564d8;
    if ((uVar2 & 7) == 6) {
      if (((&DAT_00202c97)[(*param_1 & 0x1ff) * 0xd] & 0xc) == 0xc) {
        if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
          fprintf(stderr, "[f98] BAIL: (uVar2&7)==6 class-table gate, returning param_1 unchanged\n");
        return param_1;
      }
      cVar4 = resolve_damage_type_resistance(param_1,1,8);
      goto LAB_000564d0;
    }
    if ((uVar2 & 8) != 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: (uVar2&8)!=0, returning param_1 unchanged\n");
      return param_1;
    }
    if (DAT_002046ec != 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: DAT_002046ec!=0, returning param_1 unchanged\n");
      return param_1;
    }
    if (iVar12 == 0) {
      if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] -> reallocate_object_to_arena replace path, coords=(%d,%d)\n", (int)param_2, (int)param_3);
      DAT_0010144c = param_2;
      DAT_00101454 = param_3;
      puVar9 = (ushort *)reallocate_object_to_arena(param_1);
      DAT_0010144c = uVar6;
      DAT_00101454 = uVar3;
      if (DAT_002046d4 != 0) {
        *(byte *)((char *)puVar9 + 0x13) = *(byte *)((char *)puVar9 + 0x13) & 0x83 | 3;
        uVar10 = ce_rand();
        uw_ord2005_rem_119 = ((int)(uVar10)) % (9);
        *(char *)((char *)puVar9 + 9) = *(char *)((char *)puVar9 + 9) + (uw_ord2005_rem_119 + '\f') * '\x10';
      }
      if (param_4 == 0) {
        return puVar9;
      }
      bVar5 = ce_rand();
      *(byte *)((char *)puVar9 + 0x13) =
           ((bVar5 & 3) + 1 ^ *(byte *)((char *)puVar9 + 0x13)) & 0x7f ^ *(byte *)((char *)puVar9 + 0x13);
      bVar5 = ce_rand();
      *(byte *)(puVar9 + 10) = (byte)puVar9[10] & 7 ^ ((bVar5 & 3) + 0xe) * '\b';
      return puVar9;
    }
    DAT_00202c6c = local_4c;
    bVar1 = true;
    uVar6 = encode_object_slot_index(param_1);
    DAT_00202c6c[10] = (char)uVar6;
    DAT_00202c6c[0xb] = (char)((ushort)uVar6 >> 8);
    iVar12 = (*param_1 & 0x1ff) * 0xd;
    bVar5 = (&DAT_00202c93)[iVar12];
  } while( true );
}


/* was FUN_0001582c: dispatch slot 7 of FUN_00052674's boot-time
   objects.dat table-loader list (siblings load_armor_variant_tables/
   load_light_food_effect_tables sit at slots 0/2, called the same way:
   `(*local_13c[i])(iVar3)` with iVar3 = the open objects.dat handle).
   Reads 0x40 bytes -- 16 nibble-indexed entries at a 4-byte stride --
   into DAT_00250730, the exact buffer class7_variant_effect_table_lookup
   indexes below. Recovered via Ghidra headless; read_file_handle is this
   file's uw_file_read wrapper. */
void load_class7_variant_effect_table(param_1)
int param_1;
{
  read_file_handle(param_1,&DAT_00250730,0x40);
  return;
}
/* was FUN_0007cd6c: dispatch slot 6, same boot-time loader list. Reads
   0x10 bytes -- 16 nibble-indexed entries at a 1-byte stride -- into
   DAT_0024cfe0, the buffer class6_variant_effect_table_lookup indexes
   below (which is also why that global needed widening from a lone
   scalar to a real 16-byte array). */
void load_class6_variant_effect_table(param_1)
int param_1;
{
  read_file_handle(param_1,&DAT_0024cfe0,0x10);
  return;
}
/* was FUN_0007cd7c: class6_variant_effect_table_lookup, dispatch slot 6
   of get_scanned_object_class_effect_ptr's per-class table (uw.c below,
   local_c -- Ghidra split the trailing 4 array slots of local_24[4] into
   separate stack variables local_14/local_10/local_c/local_8 for classes
   4-7, the same split-symbol-cluster pattern as several other stack
   arrays in this file). Same id-split-then-table-lookup shape as
   class0_variant_effect_table_lookup/class2_variant_effect_table_lookup,
   but only defined for family==2 (id&0x30==0x20): indexes DAT_0024cfe0
   (loaded above by load_class6_variant_effect_table) at 1-byte stride;
   every other family returns 0, matching this table's real, deliberately
   partial coverage. */
void *class6_variant_effect_table_lookup()

{
  ushort uVar1;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  if ((uVar1 & 0x30) == 0x20) {
    return &DAT_0024cfe0 + (uVar1 & 0xf);
  }
  return 0;
}
/* was FUN_0001583c: class7_variant_effect_table_lookup, dispatch slot 7
   (local_8). Indexes DAT_00250730 (loaded above by
   load_class7_variant_effect_table) at 4-byte stride, unconditionally --
   unlike its class6 sibling, every family/nibble combination is valid
   here. */
void *class7_variant_effect_table_lookup()

{
  return &DAT_00250730 + (*(byte *)g_scratch_object_ptr & 0xf) * 4;
}
/* was FUN_0002a2d8: class1_variant_effect_table_lookup, dispatch slot 1
   of get_scanned_object_class_effect_ptr's local_24 array (the same
   4-entry array class0/class2/class3's handlers sit in). Same id-split
   as its siblings, but ALSO caches the split family/nibble into
   DAT_001013f4/DAT_001013f0 as a side effect (two freshly-declared
   globals -- not otherwise read/written by any already-named code in
   this file, so their consumer, if any, is still unrecovered) before
   indexing DAT_001007d0 at a 0x30-byte stride, family*16+nibble. */
short DAT_001013f4;
short DAT_001013f0;
void *class1_variant_effect_table_lookup()

{
  short sVar1;
  ushort uVar2;
  byte *pbVar3;

  pbVar3 = (byte *)g_scratch_object_ptr;
  sVar1 = (short)((*pbVar3 & 0x30) >> 4);
  DAT_001013f4 = sVar1;
  uVar2 = *pbVar3 & 0xf;
  DAT_001013f0 = uVar2;
  return &DAT_001007d0 + (sVar1 * 0x10 + (int)(short)uVar2) * 0x30;
}


/* class0_variant_effect_table_lookup: dispatch target index 0 of get_scanned_object_class_
   effect_ptr's 8-entry table -- reached for any object whose class is
   0 (id&0x1c0)>>6==0, which check_object_fits_in_slot treats as the
   ARMOR class (its own uVar1==0 checks gate the body-slot validation
   at uw.c ~36952). Was a no-op `return 0;` stub like
   class2_variant_effect_table_lookup used to be, and for the exact
   same reason: check_object_fits_in_slot dereferences this function's
   return value at `+3` to read the equipped piece's slot-type byte,
   so a hardcoded 0 crashed on address 3 the instant a real armor
   piece was checked. Real disassembly (0x41e84-0x41f2c) shows the
   same id-split-then-table-lookup shape as
   class2_variant_effect_table_lookup, just with 3 possible tables
   instead of one: family=(id&0x30)>>4 selects DAT_00202800 (stride 8,
   family 0), DAT_002027d0 (stride 3, family 1), or DAT_00202750
   (stride 4, families 2 and 3 -- family 3 adds 16 to the nibble index
   into the same table). All three are already real, non-orphaned
   globals loaded from objects.dat by the already-correct load_armor_variant_tables
   (called via load_object_catalog_data's boot-time dispatch table, same loader
   that reaches load_light_food_effect_tables) and already read
   elsewhere in this file (resolve_equipped_weapon_attack, uw.c ~17840). */
void *class0_variant_effect_table_lookup()

{
  ushort uVar1;
  int family;
  int nibble;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  family = (uVar1 & 0x30) >> 4;
  nibble = uVar1 & 0xf;
  if (family == 0) {
    return &DAT_00202800 + nibble * 8;
  }
  if (family == 1) {
    return &DAT_002027d0 + nibble * 3;
  }
  if (family == 3) {
    nibble = nibble + 16;
  }
  return &DAT_00202750 + nibble * 4;
}
/* class2_variant_effect_table_lookup: was `undefined DAT_0004a070;` -- a plain data byte, not a
   function. get_scanned_object_class_effect_ptr takes its address and CALLS it (`local_24[2] =
   &DAT_0004a070; (*(code*)local_24[idx])();`) for any object whose class
   is 2 (id&0x1c0)>>6==2 -- exactly the 0x90-class light sources
   refresh_player_equipment_effects's and decay_equipped_light_sources's light-scan loops filter for. Taking
   the address of a data byte and jumping into it crashed the instant a
   real torch was found by the (now-fixed) scan loop. Real disassembly
   (0x4a070-0x4a108) shows this reads the scanned object's id (via
   g_scratch_object_ptr, the same object pointer get_scanned_object_class_effect_ptr's other handlers
   already read), splits it into family=(id&0x30)>>4 and nibble=(id&0xf),
   then returns a pointer into one of three already-recovered runtime
   tables (g_carry_weight_limit_table/g_light_radius_table/g_food_effect_table, populated from
   objects.dat by load_light_food_effect_tables via load_object_catalog_data's boot-time loader --
   confirmed reachable, not orphaned) indexed by nibble at that family's
   stride (3/2/1 bytes). Family 2 (torches' actual family, id=0x9X ->
   (0x9X&0x30)>>4==1 -- so torches hit the *1*-stride table, not this
   branch, but it's included for the other 0x90-class objects that do
   route here) returns 0, matching the sibling LAB_ stub functions'
   "Ghidra couldn't resolve, no-op returns 0" convention for entries
   this table genuinely leaves unused. */
/* Return type was `undefined4` -- same 64-bit-pointer-truncation bug
   already flagged on get_scanned_object_class_effect_ptr itself: this handler hands back a
   pointer into a runtime table, and undefined4 drops its upper 32 bits
   on a 64-bit build, producing a wild address in the caller. */
void *class2_variant_effect_table_lookup()

{
  ushort uVar1;
  int family;
  int nibble;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  family = (uVar1 & 0x30) >> 4;
  nibble = uVar1 & 0xf;
  if (family == 0) {
    return &g_carry_weight_limit_table + nibble * 3;
  }
  if (family == 1) {
    return &g_light_radius_table + nibble * 2;
  }
  if (family == 2) {
    return 0;
  }
  return &g_food_effect_table + nibble;
}


// was FUN_000522f0
undefined4 place_object_in_world(param_1,param_2,param_3,param_4,param_5,param_6)
/* param_4 was `int` -- a real object pointer (forwarded to
   find_object_placement, which already declares its own param_1 as `ushort *`)
   truncated to 32 bits on this host. Confirmed live: spawn_new_object now
   actually returns a live pointer instead of always 0 (see its fix),
   and this truncation crashed find_object_placement the first time this
   never-before-exercised path ran with a real object. */
uint param_1;
uint param_2;
undefined4 param_3;
char *param_4;
undefined2 param_5;
int param_6;

{
  int iVar1;
  uint uVar2;
  
  iVar1 = find_object_placement(param_4,param_1,param_2,param_3,param_5);
  if (iVar1 == 0) {
    if ((param_6 == 0) && (iVar1 = roll_object_destroy_chance(10,param_4), iVar1 != 0)) {
      unlink_and_free_object(0,param_4);
      return 0;
    }
    uVar2 = *(ushort *)(param_4 + 2) & 0x3ff;
    *(char *)(param_4 + 2) = (char)uVar2;
    *(byte *)(param_4 + 3) =
         (byte)(uVar2 >> 8) | (byte)(((param_2 & 7 | (param_1 & 0x1fff) << 3) << 10) >> 8);
    /* was folded into `int iVar1` (reused above for unrelated int
       values) -- truncated tilemap_lookup's real `void *` return */
    char *_tile1 = (char *)tilemap_lookup((int)(short)param_1 >> 3,(int)(short)param_2 >> 3);
    object_list_insert_head(_tile1 + 2,param_4);
  }
  return 1;
}


// was FUN_0005578c -- finalize an object record's placement at tile
// (param_2,param_3): recomputes its render/collision height from the
// low 7 bits of its own offset 2-3 field (the same "height_field =
// (raw&0x7f)<<3" formula emit_tile_objects and decode_tile_object_billboard_texture both use),
// caching it into offsets 0xb-0x12 alongside the tile sub-position, and
// sets a handful of per-object flag bytes (0x13/0x14/0x16-0x18). Called
// by both spawn_object_near_player and reallocate_object_to_arena
// whenever a fresh object copy needs a real position/height, not just a
// carried-over one.
void compute_object_placement_fields(param_1,param_2,param_3)
undefined1 * param_1;
uint param_2;
uint param_3;

{
  char cVar1;
  uint uVar2;
  int iVar3;
  byte bVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  
  uVar7 = (uint)*(ushort *)(param_1 + 2);
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-height] raw param_1[2..3](uVar7 src)=0x%x -> height_field=(uVar7&0x7f)<<3=%d\n",
            (unsigned)uVar7, (int)((uVar7 & 0x7f) << 3));
  param_1[9] = (byte)(*(ushort *)(param_1 + 2) >> 2) & 0xe0;
  param_1[0x18] = param_1[0x18] & 0xe0;
  param_1[0x14] = param_1[0x14] & 7 | 0x80;
  uVar6 = (uint)CONCAT11(param_1[1],*param_1);
  bVar4 = (((&DAT_00202c93)[(uVar6 & 0x1ff) * 0xd] & 8) == 0) << 7;
  param_1[0x13] = bVar4 | param_1[0x13] & 0x7f;
  uVar2 = param_3 & 0x3f | (param_2 & 0x3ff) << 6;
  param_1[0x16] = param_1[0x16] & 0xf | (byte)(uVar2 << 4);
  param_1[0x17] = (char)(uVar2 >> 4);
  cVar1 = DAT_00101928;
  param_1[0x13] = bVar4;
  param_1[10] = (cVar1 + 1U ^ param_1[10]) & 0xf ^ param_1[10];
  param_1[0x14] = 0x82;
  *param_1 = (char)(uVar6 & 0xbfff);
  param_1[1] = (char)((uVar6 & 0xbfff) >> 8);
  param_1[8] = 0x3f;
  param_1[10] = param_1[10] & 0x8f;
  if ((uVar6 & 0x1c0) != 0x40) {
    iVar5 = ((uVar7 & 0x1c00) >> 5) + param_3 * 0x100 + 0xf;
    param_1[0xd] = (char)iVar5;
    param_1[0xe] = (char)((uint)iVar5 >> 8);
    iVar5 = (uVar7 & 0x7f) << 3;
    param_1[0xf] = (char)iVar5;
    iVar3 = ((uVar7 & 0xe000) >> 8) + (param_2 & 0xff) * 0x100 + 0xf;
    param_1[0xb] = (char)iVar3;
    param_1[0x10] = (char)((uint)iVar5 >> 8);
    param_1[0x12] = 0;
    param_1[0xc] = (char)((uint)iVar3 >> 8);
  }
  return;
}


// was FUN_00055610 -- the "spawn and replace" mechanism: allocate a
// fresh low-region object slot (alloc_object_slot(1), same allocator
// spawn_object_near_player uses -- the only region emit_tile_objects's
// object_ptr_in_arena gate treats as renderable), copy param_1's key
// fields into it, recompute its placement via
// compute_object_placement_fields, then unlink param_1 from its tile's
// object list, free its slot, and insert_head the new copy in its
// place. Exists to move an object that was never allocated in the
// renderable arena (e.g. a chargen-default inventory item dropped for
// the first time) into it; without this an object can be correctly
// linked into a tile's list yet still never actually render.
ushort *reallocate_object_to_arena(param_1)
ushort * param_1;

{
  char *iVar1;  /* was `int` -- truncated tilemap_lookup's real pointer */
  ushort *puVar2;

  iVar1 = (char *)tilemap_lookup((int)DAT_0010144c,(int)DAT_00101454);
  if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80) {
    ushort *pWalk;
    int n = 0;
    fprintf(stderr, "[replace] ENTER type=0x%x param_1=%p tile=(%d,%d) tilerec=%p\n",
            (unsigned)(*param_1 & 0x1ff), (void *)param_1,
            (int)DAT_0010144c, (int)DAT_00101454, (void *)iVar1);
    fprintf(stderr, "[replace] pre-unlink list @ %p:", (void *)(iVar1 + 2));
    pWalk = (ushort *)resolve_object_link(iVar1 + 2);
    while (pWalk != NULL && n < 20) {
      fprintf(stderr, " [%p type=0x%x%s]", (void *)pWalk, (unsigned)(*pWalk & 0x1ff),
              pWalk == param_1 ? "<-TARGET" : "");
      pWalk = (ushort *)resolve_object_link((ushort *)((char *)pWalk + 4));
      n++;
    }
    fprintf(stderr, " (n=%d)\n", n);
  }
  puVar2 = (ushort *)alloc_object_slot(1);
  if (puVar2 == (ushort *)0x0) {
    puVar2 = (ushort *)0x0;
  }
  else {
    *(char *)puVar2 = (char)*param_1;
    *(undefined1 *)((char *)puVar2 + 1) = *(undefined1 *)((char *)param_1 + 1);
    *(char *)(puVar2 + 1) = (char)param_1[1];
    *(undefined1 *)((char *)puVar2 + 3) = *(undefined1 *)((char *)param_1 + 3);
    *(char *)(puVar2 + 2) = (char)param_1[2];
    *(undefined1 *)((char *)puVar2 + 5) = *(undefined1 *)((char *)param_1 + 5);
    *(char *)(puVar2 + 3) = (char)param_1[3];
    *(undefined1 *)((char *)puVar2 + 7) = *(undefined1 *)((char *)param_1 + 7);
    compute_object_placement_fields(puVar2,(int)DAT_0010144c,(int)DAT_00101454);
    *(byte *)(puVar2 + 4) = (byte)param_1[2] & 0x3f;
    if (((*param_1 & 0x1c0) != 0x140) && (((&DAT_00202c9a)[(*param_1 & 0x1ff) * 0xd] & 3) != 2)) {
      *(byte *)(puVar2 + 0xd) = (byte)(param_1[1] >> 7) & 7;
    }
    if ((*puVar2 & 0x1c0) == 0x1c0) {
      scheduler_relink_entry(puVar2,param_1);
    }
    if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
      fprintf(stderr, "[replace] new copy puVar2=%p type=0x%x height(f/10)=%d in_arena=%d\n",
              (void *)puVar2, (unsigned)(*puVar2 & 0x1ff),
              (int)*(short *)((char *)puVar2 + 0xf), (int)object_ptr_in_arena((char *)puVar2));
    object_list_unlink(iVar1 + 2,param_1);
    free_object_slot(param_1);
    object_list_insert_head(iVar1 + 2,puVar2);
    if (getenv("UW_DEBUG_THROW") && (*puVar2 & 0x1ff) == 0x80) {
      ushort *pWalk;
      int n = 0;
      int found = 0;
      fprintf(stderr, "[replace] post-insert list @ %p:", (void *)(iVar1 + 2));
      pWalk = (ushort *)resolve_object_link(iVar1 + 2);
      while (pWalk != NULL && n < 20) {
        if (pWalk == puVar2) found = 1;
        fprintf(stderr, " [%p type=0x%x%s]", (void *)pWalk, (unsigned)(*pWalk & 0x1ff),
                pWalk == puVar2 ? "<-NEWCOPY" : "");
        pWalk = (ushort *)resolve_object_link((ushort *)((char *)pWalk + 4));
        n++;
      }
      fprintf(stderr, " (n=%d found_new_copy=%d)\n", n, found);
    }
  }
  return puVar2;
}


// was FUN_00052450
undefined4 find_object_placement(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
uint param_2;
uint param_3;
undefined2 param_4;
short param_5;

{
  ushort uVar1;
  undefined4 uVar2;
  byte bVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  char *pTile;  /* was reuse of `iVar5` (int) -- truncated
                   tilemap_lookup's real pointer; iVar5 itself stays int
                   for its other, unrelated uses in this function */

  bVar3 = 0;
  while( true ) {
    if ((bVar3 != 0) || (uVar4 = param_2, uVar6 = param_3, DAT_00202c84 == 0)) {
      iVar5 = (int)(short)(param_5 * 2 + 1);
      /* Was `ordint_divmod(iVar5,uVar2); ... (int)extraout_r1 ...` (twice)
         -- bare calls whose result was read back via Ghidra's
         extraout_r1 idiom, always uninitialized garbage on this host
         (there's no way to read a second register out of a normal C
         call). ordint_divmod is COREDLL's div/mod ordinal
         (divisor,dividend): the quotient is its real C return value,
         but this caller wants the REMAINDER, now named off its own
         divmod_result instead of a nonexistent second return value:
         this crashed 100% of the time using Use mode on a container
         (find_object_placement is how try_combine_or_stow_object
         scatters emptied contents onto the ground), confirmed live,
         because uVar4/uVar6 below were built from garbage stack
         memory, sending object placement to a wild tile. */
      uVar2 = ce_rand();
      uVar4 = (ordint_divmod(iVar5,(int)uVar2).rem - (int)param_5) + param_2;
      uVar2 = ce_rand();
      uVar6 = (ordint_divmod(iVar5,(int)uVar2).rem - (int)param_5) + param_3;
    }
    uVar2 = encode_object_slot_index(param_1);
    iVar5 = check_object_placement_clearance(*param_1 & 0x1ff,uVar2,uVar4,uVar6,param_4,1,0);
    if (iVar5 != 0) break;
    bVar3 = bVar3 + 1;
    if (0x17 < bVar3) {
      return 0;
    }
  }
  pTile = (char *)tilemap_lookup((int)uVar4 >> 3,(int)uVar6 >> 3);
  uVar1 = param_1[1];
  bVar3 = (byte)(uVar1 & 0x3ff);
  *(byte *)(param_1 + 1) = (bVar3 ^ (byte)param_4) & 0x7f ^ bVar3;
  *(byte *)((char *)param_1 + 3) =
       (byte)((uVar1 & 0x3ff) >> 8) | (byte)(((uVar6 & 7 | (uVar4 & 0x1fff) << 3) << 10) >> 8);
  object_list_append_tail(pTile + 2,param_1);
  iVar5 = object_ptr_in_arena(param_1);
  if (iVar5 == 0) {
    settle_dropped_object(param_1,(int)uVar4 >> 3,(int)uVar6 >> 3,1);
  }
  else {
    uVar4 = ((int)(short)((ushort)uVar4 & 0x1f8) >> 3) << 6 |
            (int)(((int)(short)uVar6 & 0x1f8U) << 0x10) >> 0x13;
    *(byte *)(param_1 + 0xb) = (byte)param_1[0xb] & 0xf | (byte)(uVar4 << 4);
    *(char *)((char *)param_1 + 0x17) = (char)(uVar4 >> 4);
  }
  return 1;
}


undefined4 class3_variant_effect_stub()

{
  /* Confirmed via a direct Ghidra headless lookup by address
     (0x7913c): `undefined4 FUN_0007913c(void) { return 0; }` -- this
     genuinely IS a no-op in the real binary too, not a "Ghidra gave
     up" placeholder. Kept as-is; not a bug. */
  return 0;
}
undefined4 class5_variant_effect_stub()

{
  /* Confirmed via a direct Ghidra headless lookup by address
     (0x6b3d4): `undefined4 FUN_0006b3d4(void) { return 0; }` -- this
     genuinely IS a no-op in the real binary too, not a "Ghidra gave
     up" placeholder. Kept as-is; not a bug. */
  return 0;
}
undefined4 class4_variant_effect_stub()

{
  /* Confirmed via a direct Ghidra headless lookup by address
     (0x73b10): `undefined4 FUN_00073b10(void) { return 0; }` -- this
     genuinely IS a no-op in the real binary too, not a "Ghidra gave
     up" placeholder. Kept as-is; not a bug. */
  return 0;
}
