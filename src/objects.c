/* The object table: slot allocation/free, the per-tile/per-container linked-list primitives
   (insert/append/unlink/resolve), and object spawning. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/objects.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

undefined4 DAT_00202c84;
undefined2 DAT_002020a0;
undefined2 DAT_002020a4;
byte *DAT_00202c6c;
/* Was a lone `undefined1` scalar, but (like DAT_00202c39/3a/3c below, already fixed) every real use
   is `(&DAT_00202c38)[i*6]` -- one field of a repeating 6-byte-stride per-candidate record in
   collision_height_envelope/sort_collision_candidates's up-to-256-entry collision candidate list... */
/* Sizing-audit pass: up-to-256-entry collision candidate list (per
   the comment above), 6-byte stride -- HARD: 256*6=1536. Down from
   8192. */
 undefined1 DAT_00202c38_backing[1536];
/* Sizing pass: the real COMOBJ "class 0" object-record table, indexed throughout ai.c as `(id &
   0x1ff) * 0xd` (13-byte stride) -- real max 511*13+13=6656 bytes. Its DAT_002034b5 alias (ai.c,
   offset 0x825) sits comfortably within that same bound. */
undefined1 DAT_00202c90_backing[8192];
/* Was `int` despite being assigned real pointer values derived from DAT_002046b8 (see there) and
   itself assigned into g_player_object (`char *`) -- truncating on this 64-bit host, part of the
   same crash chain (reset_player_object_record's ce_memset call reading g_player_object). */
char *DAT_0023b82c;
/* Sizing-audit pass: `read_file_handle(param_1,&DAT_002027d0,0x30)` (resources.c) reads exactly 48
   bytes, matching its own nibble*3-stride indexing (max 15*3+2=47). HARD exact. Down from 256. */
undefined1 DAT_002027d0_backing[48];
/* Sizing pass: resources.c's own loader confirms the exact real size --
   `read_file_handle(param_1,&DAT_00202800,0x80);` (128 bytes). Also indexed as `&DAT_00202800 +
   nibble*8` (nibble 0-15, max 15*8+8=128) throughout combat.c/objects.c/player.c -- same bound. */
undefined1 DAT_00202800_backing[256];
byte *g_scratch_object_ptr;
short DAT_00101454;
short DAT_0010144c;
short DAT_00202a3c;
byte *DAT_002046c0;
byte *DAT_002046c8;
/* Was a plain tentative definition (no initializer), so a truly fresh process starts it at C's
   default zero instead of the real "no container open" resting state. */
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
/* Was a lone `undefined` scalar, but the real class6 variant-effect lookup (uw.c ~46760,
   class6_variant_effect_table_lookup) indexes it as `&DAT_0024cfe0 + nibble` for nibble 0..0xf, and
   its boot-time loader (load_class6_variant_effect_table) reads exactly 0x10 bytes into it... */
/* Sizing-audit pass: `read_file_handle(param_1,&DAT_0024cfe0,0x10)`
   reads exactly 16 bytes, matching its own nibble (0-0xf) indexing.
   HARD exact. Down from 8192. */
undefined1 DAT_0024cfe0_backing[16];
/* Sizing pass: own loader confirms the exact real size --
   `read_file_handle(param_1,&DAT_00250730,0x40);` (64 bytes). Also indexed as `&DAT_00250730 +
   nibble*4` (nibble 0-15, max 15*4+4=64) -- same bound. */
undefined1 DAT_00250730_backing[128];






// was FUN_0004ad10 -- spawn a copy of the "template" object (DAT_00202a44) as a new object slot
// placed near the player's own tile (DAT_00202a4c/ DAT_00202a50), used by
// drop_held_object_near_player's "split a stack, throw one" path.
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
    /* Was `iVar8 = tilemap_lookup(...); object_list_insert_head(iVar8 + 2,...)` -- tilemap_lookup
       returns a real 64-bit tile-record pointer, but iVar8 is `int` (used throughout this function
       for genuine small integer scratch math, so not safe to widen wholesale)... */
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




/* was FUN_00052f28. Was `int FUN_00052f28(...)` with a local `int iVar1` holding the computed slot
   address (`DAT_002046b8/DAT_002046c4 + offset`, both real pointers) -- truncated the pointer to 32
   bits on this 64-bit host. */
void *alloc_object_slot(int region)
{
  void *pvVar1;
  ushort *puVar2;
  /* Was `undefined4 *puVar3` -- a 32-bit-wide alias onto DAT_0020469c/ DAT_002046a8 (both real
     64-bit `char *` globals). */
  char **puVar3;

  if (region == 0) {
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
void free_object_slot(char *object)
{
  short sVar1;
  short *psVar2;

  /* DAT_002046a8/DAT_0020469c are byte pointers into a `short` array (see alloc_object_slot's
     matching fix) -- `+ 1` only advanced them by one BYTE instead of one short-element (2 bytes),
     the mirror image of alloc_object_slot's own "-1" pop bug... */
  if (object < DAT_002046c4) {
    psVar2 = (short *)(DAT_002046a8 + 2);
    DAT_002046a8 = (char *)psVar2;
    sVar1 = ordint_divmod(0x1b,object - DAT_002046b8).quot;
    *psVar2 = sVar1;
    if (object == DAT_0023b82c) {
      enter_free_camera_mode((int)*(short *)DAT_002046a8);
    }
    active_mobile_list_remove((int)*(short *)DAT_002046a8);
  }
  else {
    DAT_0020469c = DAT_0020469c + 2;
    *(short *)DAT_0020469c = (short)((int)(object - DAT_002046c4) >> 3) + 0x100;
  }
}



// was FUN_000530c4
/* Object-record pointer -- was `uint`, truncating it (e.g. set_player_tile_position passes the
   real g_player_object player-object pointer here; truncated it crashed placing the player into
   the level). */
void object_list_insert_head(byte *link_field, char *object)
{
  undefined2 uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;

  uVar1 = *(undefined2 *)link_field;
  bVar2 = (byte)uVar1;
  *(byte *)(object + 4) = (*(byte *)(object + 4) ^ bVar2) & 0x3f ^ bVar2;
  *(char *)(object + 5) = (char)((ushort)uVar1 >> 8);
  if (object < DAT_002046c4) {
    sVar3 = ordint_divmod(0x1b,object - DAT_002046b8).quot;
    uVar4 = *link_field & 0x3f | sVar3 << 6;
  }
  else {
    uVar4 = *link_field & 0x3f ^ ((short)((int)(object - DAT_002046c4) >> 3) + 0x100) * 0x40;
  }
  *link_field = (byte)uVar4;
  link_field[1] = (byte)(uVar4 >> 8);
}



// was FUN_000531a0
/* Object-record pointer -- was `uint`, truncating it (same class as object_list_insert_head
   above). */
void object_list_append_tail(byte *link_field, char *object)
{
  short sVar1;
  byte *pbVar2;
  ushort uVar3;

  /* iVar2 was `int`, truncating resolve_object_link's real pointer return -- same
     tile/object-chain-walk bug as object_list_unlink (see there), just never exercised yet (this
     walks a different list, e.g. a container's contents, to append object at its tail). */
  while (pbVar2 = (byte *)resolve_object_link(link_field), pbVar2 != 0) {
    link_field = pbVar2 + 4;
  }
  *(byte *)(object + 4) = *(byte *)(object + 4) & 0x3f;
  *(undefined1 *)(object + 5) = 0;
  if (object < DAT_002046c4) {
    sVar1 = ordint_divmod(0x1b,object - DAT_002046b8).quot;
    uVar3 = *link_field & 0x3f | sVar1 << 6;
  }
  else {
    uVar3 = *link_field & 0x3f ^ ((short)((int)(object - DAT_002046c4) >> 3) + 0x100) * 0x40;
  }
  *link_field = (byte)uVar3;
  link_field[1] = (byte)(uVar3 >> 8);
}



/* param_2 was `int`, and the local holding resolve_object_link's return value was `int iVar4` --
   both truncating real pointers on this 64-bit host. */
// was FUN_00053274
void object_list_unlink(byte *link_field, byte *object)
{
  short sVar1;
  undefined2 uVar2;
  byte bVar3;
  byte *pbVar4;
  int iVar5;

  iVar5 = 0;
  if (object != 0) {
    while( true ) {
      pbVar4 = (byte *)resolve_object_link(link_field);
      if (pbVar4 == 0) {
        return;
      }
      sVar1 = (short)iVar5;
      iVar5 = (sVar1 + 1) * 0x10000 >> 0x10;
      if (0x400 < sVar1) {
        return;
      }
      if (pbVar4 == object) break;
      link_field = pbVar4 + 4;
    }
    uVar2 = *(undefined2 *)(object + 4);
    bVar3 = (byte)uVar2;
    *link_field = (*link_field ^ bVar3) & 0x3f ^ bVar3;
    link_field[1] = (byte)((ushort)uVar2 >> 8);
    *(byte *)(object + 4) = *(byte *)(object + 4) & 0x3f;
    *(undefined1 *)(object + 5) = 0;
  }
}




// was FUN_000533e4 -- resolve param_1 (a link-field address) to the object it points at and delete
// it: recurse into two nested-object link fields first (offsets 4/6, e.g. contained items or a
// wielded weapon)...
/* was `undefined4` -- truncated the real object-record pointer (passed straight to
   resolve_object_link), latent until that call started actually using it */
void free_linked_object_recursive(char *link_field)
{
  ushort *puVar1;
  
  puVar1 = (ushort *)resolve_object_link(link_field); /* confirmed via ARM disassembly, 0x533e4 */
  if (puVar1 != (ushort *)0x0) {
    if ((*puVar1 & 0x1c0) == 0x180) {
      free_trap_class_object(link_field,puVar1);
    }
    else {
      if ((puVar1[2] & 0xffc0) != 0) {
        free_linked_object_recursive((char *)(puVar1 + 2));  /* ARM 0x5342c: add r0,r4,#4 */
      }
      if ((*puVar1 & 0x8000) == 0) {
        if ((puVar1[3] & 0xffc0) != 0) {
          free_linked_object_recursive((char *)(puVar1 + 3));  /* ARM 0x53470: add r0,r4,#6 */
        }
      }
      object_list_unlink(link_field,puVar1);
      free_object_slot(puVar1);
    }
  }
}



// was FUN_000534a8 -- delete param_2: free its own "contains" link field first (via
// free_linked_object_recursive, for a container/ wielded item), unlink param_2 from the list headed
// at param_1 (if given), then free its slot. discard_misplaced_object's actual deletion step.
/* Was `int param_1; int param_2;` -- both real object-record pointers (param_2 is dereferenced
   directly; both are forwarded to object_list_unlink/free_object_slot, which already declare
   pointer params), truncated to 32 bits on this host... */
void unlink_and_free_object(char *link_field, char *object)
{
  /* Dropped argument: free_linked_object_recursive takes the address of a link field to recursively
     free (its own declared link_field) -- here that's object's own "contains" field (+6, this file's
     standard container-contents offset) -- but it was called bare... */
  if (((*(byte *)(object + 1) & 0x80) == 0) && ((*(ushort *)(object + 6) & 0xffc0) != 0)) {
    free_linked_object_recursive(object + 6);
  }
  if (link_field != 0) {
    object_list_unlink((byte *)link_field,(byte *)object);
  }
  free_object_slot(object);
}



// was FUN_00053514
/* Was `int`, truncating the same DAT_002046b8/DAT_002046c4 object-record
   pointer arithmetic as get_object_record_by_slot_index above (fixed earlier this session)
   -- same fix. */
void *resolve_object_link(ushort *link_field)
{
  ushort uVar1;

  /* ARM FUN_00053514 accepts any valid link-word address, including
     the stack copy used at 0x52e58. Requiring the word to live inside the
     level arena rejected that original contract. Keep the pre-load check
     on the object tables, rather than restricting the word's location. */
  if ((link_field != (ushort *)0x0) && (DAT_002046b8 != NULL) &&
      (DAT_002046c4 != NULL)) {
    uVar1 = *link_field;
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
int encode_object_slot_index(char *object)
{
  short sVar1;
  int iVar2;
  
  if (object == 0) {
    iVar2 = 0;
  }
  else if (object < DAT_002046c4) {
    sVar1 = ordint_divmod(0x1b,object - DAT_002046b8).quot;
    iVar2 = (int)sVar1;
  }
  else {
    iVar2 = (short)((int)(object - DAT_002046c4) >> 3) + 0x100;
  }
  return iVar2;
}




// was FUN_00068138
/* Was `undefined4 FUN_00068138(...)` ending in a hardcoded `return 0;` that discarded the
   freshly-allocated object pointer (puVar3) on every call, even on success. */
void *spawn_new_object(uint object_type, int region)
{
  undefined1 uVar1;
  byte bVar2;
  undefined1 *puVar3;
  uint uVar4;
  uint uVar5;
  
  puVar3 = (undefined1 *)alloc_object_slot(region);
  if (puVar3 != (undefined1 *)0x0) {
    puVar3[2] = 0;
    puVar3[3] = 0x6c;
    uVar4 = ((byte)puVar3[1] & 0x80) << 8 ^ object_type & 0x1ff;
    uVar1 = (undefined1)(object_type & 0x1ff);
    *puVar3 = uVar1;
    bVar2 = (byte)(uVar4 >> 8);
    puVar3[1] = bVar2;
    puVar3[4] = 0x28;
    puVar3[5] = 0;
    uVar5 = CONCAT11(puVar3[7],puVar3[6]) & 0xffc0;
    puVar3[6] = (char)uVar5;
    puVar3[7] = (char)(uVar5 >> 8);
    if ((((&DAT_00202c93)[(short)object_type * 0xd] & 0xc0) == 0) ||
       (((&DAT_00202c93)[(short)object_type * 0xd] & 0xc0) == 0x80)) {
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



// was FUN_00037fe8 -- resets an object (param_2) whose burnt-out/ spent counterpart type is being
// assigned (its only known caller checks item type ids 0xd5/0xd6, the same "spent" marker ids seen
// elsewhere as a candle/torch-style burnout transition): for a mobile object...
/* Object-record pointer -- was `uint`, truncating it (same class as
   object_list_insert_head/object_list_append_tail below). */
int reset_burnt_out_item_state(int tile_link, char *object)
{
  int iVar1;

  if (object < DAT_002046c4) {
    *(undefined1 *)(object + 8) = 0;
  }
  else {
    iVar1 = discard_misplaced_object(tile_link,object,0);
    if (iVar1 == 0) {
      return 1;
    }
  }
  return 0;
}


// was FUN_00038028 -- applies a destruction/transformation effect (from
// apply_typed_damage_to_object's dispatch, its only known caller) to a non-NPC object (param_1) at
// tile param_4/param_5: doors get their contents discarded...
/* ARM 0x3803c forwards the damaging actor's address to the door callback.
   Keep it pointer-sized rather than truncating it through undefined4. */
int apply_object_destruction_effect(ushort *object, ushort *attacker, uint damage_type_mask, int tile_x, short tile_y)
{
  ushort uVar1;
  short sVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  uint uVar6;
  
  sVar2 = (short)tile_x;
  uVar6 = 0xfffffffe;
  if (sVar2 < 0) {
LAB_000382ac:
    uVar4 = 1;
  }
  else {
    uVar1 = *object;
    if ((uVar1 & 0x1f0) == 0x140) {
      if ((uVar1 & 0xf) < 8) {
        DAT_002020a4 = tile_y;
        DAT_002020a0 = sVar2;
        close_door_object(attacker,object);
      }
      discard_container_contents(object,1);
LAB_00038100:
      uVar6 = 0xffffffff;
    }
    else if (((uVar1 & 0x1ff) == 0x15d) || ((uVar1 & 0x1ff) == 0x15b)) {
      DAT_002020a4 = tile_y;
      DAT_002020a0 = sVar2;
      discard_container_contents(object,0);
      try_combine_or_stow_object(0,object,0);
    }
    else if ((uVar1 & 0x1f0) == 0x80) {
      iVar3 = roll_object_destroy_chance(10,object);
      if (iVar3 == 0) goto LAB_00038100;
      try_empty_container(object,0);
    }
    else {
      if ((damage_type_mask & 8) != 0) {
        if (((uVar1 & 0x1ff) == 0xd5) || ((uVar1 & 0x1ff) == 0xd6)) {
          /* was folded into `int iVar3` (reused elsewhere in this function
             for unrelated int values) -- truncated tilemap_lookup's real
             `void *` return */
          char *_tile3 = (char *)tilemap_lookup(tile_x,(int)tile_y);
          iVar3 = reset_burnt_out_item_state(_tile3 + 2,object);
          if (iVar3 != 0) goto LAB_000382ac;
          uVar6 = 0xffffffff;
        }
        else {
          uVar5 = ce_rand();
          if ((uVar5 & 3) == 0) {
            uVar4 = roll_dice_sum(6,10);
            spawn_scheduled_effect_object(object,8,uVar4,0,0,sVar2,tile_y);
            sVar2 = rand_below(2);
            uVar6 = (int)sVar2 + 0xd5;
          }
        }
      }
      if (((*object & 0x8000) == 0) && ((object[3] & 0xffc0) != 0)) {
        free_linked_object_recursive(object + 3);
      }
    }
    if ((short)uVar6 < -1) {
      sVar2 = rand_below(2);
      uVar6 = (int)sVar2 + 0xd5;
    }
    if (-1 < (short)uVar6) {
      uVar5 = (*object ^ uVar6) & 0x1ff ^ (uint)*object;
      *(char *)object = (char)uVar5;
      *(char *)((char *)object + 1) = (char)(uVar5 >> 8);
      if ((DAT_002046c4 <= object) &&
         (iVar3 = settle_dropped_object(object,tile_x,(int)tile_y,1), iVar3 == 0)) goto LAB_000382ac;
    }
    uVar4 = 1;
    if (-2 < (short)uVar6) {
      uVar4 = 0;
    }
  }
  return uVar4;
}


// WARNING: Type propagation algorithm not settling

// was FUN_00038d4c -- searches outward from tile (param_2,param_3) via a double-buffered BFS
// flood-fill (local_80/local_58, each a 10-entry x/y coordinate-pair frontier list)...
int find_placement_via_tile_flood_fill(ushort *object, short tile_x, short tile_y, short *out_x, short *out_y, int strict)
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
  /* Ghidra split the visited columns at adjacent stack offsets 0x2a/ 0x2c. Keep the preceding
     column in the same array: expressions that used &uStack_9a index one column before auStack_98. */
  ushort visited_storage [13] = {0};
  ushort *auStack_98 = visited_storage + 1;
  /* ARM 0x38e4c/0x38e5c stores X/Y at sp+0x44/sp+0x45, the first coordinate pair in one buffer.
     Both frontiers span 0x28 bytes on the original stack and hold up to 0x14 pairs. A separate
     local_7f made the search read Y=0; a 0x14-byte buffer overflowed after swaps. */
  undefined1 local_80 [40];
  undefined1 local_58 [40];

  ce_memset(local_80,0,0x14);
  ce_memset(local_58,0,0x14);
  ce_memset(auStack_98,0,9);
  iVar9 = tile_x + -4;
  if (iVar9 < 1) {
    iVar9 = 1;
  }
  cVar21 = (char)iVar9;
  if ('9' < cVar21) {
    cVar21 = ':';
  }
  iVar9 = tile_y + -4;
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
  local_80[0] = (char)tile_x;
  local_80[1] = (char)tile_y;
  iVar9 = (int)cVar21;
  iVar1 = (int)cVar7;
  auStack_98[tile_x - iVar9] =
       auStack_98[tile_x - iVar9] | (ushort)(1 << (tile_y - iVar1 & 0xffU));
  local_a0 = 1;
  do {
    puVar6 = local_b0;
    uVar20 = 0;
    local_a8 = 0;
    do {
      cVar21 = (local_a4 + local_a8 * 2)[1];
      cVar7 = local_a4[local_a8 * 2];
      pbVar10 = (byte *)tilemap_lookup((int)cVar7,(int)cVar21);
      if (strict != 0) {
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
      uVar13 = encode_object_slot_index(object);
      iVar12 = (int)(short)cVar21;
      iVar2 = (int)(short)cVar7;
      iVar14 = check_object_placement_clearance(*object & 0x1ff,uVar13,((iVar2 << 0x13) >> 0x10) + 3,
                            ((iVar12 << 0x13) >> 0x10) + 3,(*pbVar10 >> 4) * '\b' + cVar18,0,8);
      if (iVar14 != 0) {
        *out_x = (short)cVar7;
        *out_y = (short)cVar21;
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
// walk_object_tree/clear_temp_flags_on_all_objects): for a non-arena object (object_ptr_in_arena)
// whose class isn't a door (0x140) or other special type (0x180)...
int clear_object_temp_flag_callback(ushort *object)
{
  ushort uVar1;
  int iVar2;
  uint uVar3;

  iVar2 = object_ptr_in_arena(object);
  if (iVar2 == 0) {
    uVar3 = *object & 0x1c0;
    if (((uVar3 != 0x140) && (uVar3 != 0x180)) &&
       (((&DAT_00202c9a)[(*object & 0x1ff) * 0xd] & 3) != 2)) {
      uVar1 = object[1];
      *(char *)(object + 1) = (char)(uVar1 & 0xfdff);
      *(char *)((char *)object + 3) = (char)((uVar1 & 0xfdff) >> 8);
    }
  }
  return 0;
}



// was FUN_0003aea8 -- sweeps the entire 64x64 tile grid (DAT_002029cc) and, for every tile with a
// non-empty object list, recursively walks each object's tree (walk_object_tree, not yet named)
// applying clear_object_temp_flag_callback to every object found...
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


// was FUN_000444b0 -- free_linked_object_recursive's sibling, specifically for the player's own
// carried-inventory chain: every known call site passes g_player_object+6 (the "contents"/sp_link
// field).
/* was `undefined4` -- truncated the real g_player_object+6 pointer
   close_panels_before_level_change passes in. Pre-existing bug, but never bit until
   resolve_object_link (this function's own first call) started actually using its argument instead
   of being called with no argument at all. */
void free_player_inventory_chain(char *link_field)
{
  /* Was `int iVar1;` -- truncated resolve_object_link's real 64-bit `void *` return to 32 bits on
     this recompile (harmless on the original 32-bit ARM binary). */
  char *iVar1;

  iVar1 = resolve_object_link(link_field);
  if (iVar1 != 0) {
    if ((*(byte *)(iVar1 + 1) & 0x80) == 0) {
      if ((*(ushort *)(iVar1 + 6) & 0xffc0) != 0) {
        free_player_inventory_chain(iVar1 + 6); /* was called with no argument; confirmed via ARM disassembly, 0x44500 */
      }
    }
    if ((*(ushort *)(iVar1 + 4) & 0xffc0) != 0) {
      free_player_inventory_chain(iVar1 + 4); /* was called with no argument; confirmed via ARM disassembly, 0x4451c */
    }
    object_list_unlink(link_field,iVar1);
    free_object_slot(iVar1);
  }
}


// was FUN_00046260 -- computes an object's weight: looks up the per-class base weight
// (&DAT_00202c91, stride 0xd), multiplied by quantity for stackable items (the 0x8000 flag set), or
// -- for a non-stackable object that's itself a container...
uint calculate_object_weight(ushort *object)
{
  ushort uVar1;
  uint uVar2;
  int iVar3;
  ushort local_8 [2];

  uVar1 = *object;
  iVar3 = (uVar1 & 0x1ff) * 0xd;
  if (((uVar1 & 0x8000) == 0) || ((object[3] & 0x8000) != 0)) {
    local_8[0] = *(ushort *)(&DAT_00202c91 + iVar3) >> 4;
    uVar2 = (uint)local_8[0];
    if ((uVar1 & 0x8000) == 0) {
      if ((object[3] & 0xffc0) != 0) {
        sum_container_weight(object + 3,local_8);
        uVar2 = (uint)(short)local_8[0];
      }
    }
  }
  else {
    uVar2 = (uint)(*(ushort *)(&DAT_00202c91 + iVar3) >> 4) * (uint)(object[3] >> 6);
  }
  return uVar2;
}


// was FUN_00052674 -- boot-time loader for the game's core object definition data: opens
// "objects.dat" and dispatches to 8 per-class variant/effect table loaders...
int load_object_catalog_data()

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



/* Was `undefined4` -- same 64-bit-pointer-truncated-through-a-32-bit- return-type bug as
   get_equipped_item_at_slot's (see its own comment): this function returns a POINTER into one of
   the runtime tables class2_variant_effect_table_lookup and friends compute... */
// was FUN_000528a8
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
  /* Was `(*(code *)local_24[...])(); return 0;` -- Ghidra couldn't trace a return value through the
     indirect call and fabricated a "return 0" placeholder. */
  return (*(void *(*)())local_24[(short)((*g_scratch_object_ptr & 0x1c0) >> 6)])();
}



// was FUN_00052af4 -- generic recursive object-tree walker: calls callback param_2 on param_1, then
// (unless param_1 is flagged "no contents") recurses into its contents link (+6), then advances to
// its next-in-chain link (+4) and repeats...
/* was `int` -- truncated the real object-record pointer (dereferenced throughout this function via
   casts, and passed to resolve_object_link/itself), latent until those calls started actually
   using their arguments */
int walk_object_tree(char *object, int (*callback)())
{
  int iVar1;
  char *pcVar2;

  /* Dropped argument (both call sites below): callback is a callback (object_exceeds_size_threshold
     at every call site reached so far) that declares one parameter -- the object/link being tested,
     i.e. this function's own object -- but was invoked bare... */
  iVar1 = (*callback)(object);
  while( true ) {
    if (iVar1 != 0) {
      return 1;
    }
    if (((*(byte *)(object + 1) & 0x80) == 0) && ((*(ushort *)(object + 6) & 0xffc0) != 0)) {
      /* Was `undefined4 uVar2` -- truncated resolve_object_link's real
         pointer return before forwarding it into the recursive call
         just below, same class as object itself above. */
      pcVar2 = (char *)resolve_object_link((ushort *)(object + 6)); /* confirmed via ARM disassembly, 0x52b54 */
      iVar1 = walk_object_tree(pcVar2,callback);
      if (iVar1 != 0) {
        return 1;
      }
    }
    if ((*(ushort *)(object + 4) & 0xffc0) == 0) break;
    object = (char *)resolve_object_link((ushort *)(object + 4)); /* confirmed via ARM disassembly, 0x52b84 */
    iVar1 = (*callback)(object);
  }
  return 0;
}



// was FUN_00052bac -- checks whether object param_1's size/weight class exceeds the current
// threshold in DAT_002046b0 (set by its caller, e.g. roll_object_destroy_chance, just before use):
// container-flagged objects (0x2000) always report "exceeds" (1)...
int object_exceeds_size_threshold(ushort *object)
{
  ushort uVar1;
  undefined4 uVar2;
  short sVar3;
  int iVar4;
  
  uVar1 = *object;
  if ((uVar1 & 0x2000) == 0) {
    if (((uVar1 & 0x8000) == 0) || ((object[3] & 0x8000) != 0)) {
      sVar3 = 0;
    }
    else {
      sVar3 = (object[3] >> 6) - 1;
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


// was FUN_00052d24 -- if link param_2 points to a real object, resolves it and rolls
// roll_object_destroy_chance(param_1, object).
int should_destroy_linked_object(int base_chance, ushort *link_field)
{
  char *pcVar1;

  if ((*link_field & 0xffc0) != 0) {
    /* ARM 0x52d54..0x52d64 forwards the object address in r1
       and leaves the destruction result in r0 for its caller. */
    pcVar1 = resolve_object_link(link_field);
    return roll_object_destroy_chance(base_chance,pcVar1);
  }
  return 0;
}



// was FUN_00052d68 -- reclaims object slots by probabilistically destroying objects whose
// tile Manhattan distance from the player exceeds (10-keep_rows), up to max_destroyed destructions.
void despawn_objects_outside_radius(int keep_rows, short max_destroyed)
{
  uint uVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  char *pcVar4;
  void *pvVar5;
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
  local_30 = 10 - (short)keep_rows;
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
          /* ARM 0x52e5c..0x52e68 reads +4/+5 from the resolved
             record address. Preserve the native pointer here. */
          pcVar4 = resolve_object_link(local_3c);
          uVar3 = *(ushort *)(pcVar4 + 4);
          iVar4 = should_destroy_linked_object(keep_rows,local_3c);
          if (iVar4 != 0) {
            pvVar5 = get_object_record_by_slot_index(local_3c[0] >> 6);
            unlink_and_free_object((ushort *)(iVar9 + 2),pvVar5);
            iVar10 = iVar10 + 1;
            if ((int)max_destroyed <= iVar10 * 0x10000 >> 0x10) {
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
}



// was FUN_00053334 -- despite the name this settled on, it's a DESTROY path, not a placement one:
// when param_3==0 it rolls roll_object_destroy_chance(10, param_2), which (see that function's own
// comment) returns true with ~100% probability under normal conditions...
/* Was `int param_1` -- a real object-record pointer (drop_held_object_ near_player passes
   pDropTile+2, a resolve_object_link-style address) truncated to 32 bits on this 64-bit host, same
   class as several other fixes this session. */
ushort *discard_misplaced_object(char *tile_link, ushort *object, int skip_roll)
{
  ushort uVar1;
  int iVar2;
  ushort local_10 [2];

  /* Dropped argument: roll_object_destroy_chance's declared signature takes (short, char*) and
     dereferences its second parameter -- but it was called here with only the literal 10, leaving
     the real argument (object, the object being placed) as leftover-register garbage. */
  if ((skip_roll != 0) || (iVar2 = roll_object_destroy_chance(10,(char *)object), iVar2 != 0)) {
    uVar1 = encode_object_slot_index(object);
    local_10[0] = local_10[0] & 0x3f | uVar1 << 6;
    if ((*object & 0x1c0) == 0x1c0) {
      scheduler_remove_entry(uVar1 & 0x3ff);
    }
    if (tile_link == 0) {
      free_linked_object_recursive(local_10);
    }
    else {
      unlink_and_free_object(tile_link,object);
    }
    object = (ushort *)0x0;
  }
  return object;
}



/* The fundamental "object slot index -> record pointer" accessor (70 call sites): slots 0-0xff are
   0x1b-byte records in the DAT_002046b8 table, slots >=0x100 are 8-byte records in the DAT_002046c4
   table. */
// was FUN_000535fc
void *get_object_record_by_slot_index(short slot_index)
{
  intptr_t iVar1;

  iVar1 = (int)slot_index;
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else if (iVar1 < 0) {
    /* No caller has ever legitimately passed a negative slot -- a real UW1 level has exactly 1024
       object slots (0-0x3ff), 256 static + 768 mobile -- but nothing bounded the input... */
    DEBUG(ERR, "[get_object_record_by_slot_index] negative slot %d, returning NULL\n", (int)slot_index);
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
    DEBUG(ERR, "[get_object_record_by_slot_index] slot %d exceeds 0x3ff, returning NULL\n", (int)slot_index);
    iVar1 = 0;
  }
  return (void *)iVar1;
}


// was FUN_00053644 -- recursively searches the chain/contents rooted at link param_1 for an object
// whose encode_object_slot_index() matches target slot param_3 (param_2 is always passed 1, a
// recurse- into-contents flag like find_object_in_chain's)...
ushort *find_object_by_encoded_slot_in_chain(ushort *link_field, int recurse, int slot)
{
  ushort *puVar1;
  short sVar2;
  byte *iVar3;
  ushort *iVar4;

  if ((*link_field & 0xffc0) == 0) {
LAB_00053720:
    iVar4 = 0;
    puVar1 = DAT_002046b4;
  }
  else {
    DAT_002046b4 = link_field;
    iVar3 = resolve_object_link(link_field);
    while ((sVar2 = encode_object_slot_index(iVar3), iVar4 = (ushort *)iVar3, puVar1 = link_field, sVar2 != (short)slot &&
           ((((*(byte *)(iVar3 + 1) & 0x80) != 0 || ((*(ushort *)(iVar3 + 6) & 0xffc0) == 0)) ||
            (iVar4 = find_object_by_encoded_slot_in_chain((ushort *)(iVar3 + 6),recurse,slot), puVar1 = DAT_002046b4,
            iVar4 == 0))))) {
      if ((*(ushort *)(iVar3 + 4) & 0xffc0) == 0) goto LAB_00053720;
      iVar3 = resolve_object_link((ushort *)(iVar3 + 4));
    }
  }
  DAT_002046b4 = puVar1;
  return iVar4;
}



// was FUN_00053728
int object_ptr_in_arena(char *object)
{
  undefined4 uVar1;
  
  if ((object == 0) || (uVar1 = 1, DAT_002046c4 <= object)) {
    uVar1 = 0;
  }
  return uVar1;
}



// was active_mobile_list_add
// was FUN_00053750
void active_mobile_list_add(byte slot)
{
  *DAT_002046c8 = slot;
  DAT_002046c8 = DAT_002046c8 + 1;
}



// was active_mobile_list_remove
// was FUN_00053774
void active_mobile_list_remove(char slot)
{
  char *pcVar1;
  
  pcVar1 = DAT_002046c0;
  while( true ) {
    if (DAT_002046c8 <= pcVar1) {
      return;
    }
    if (*pcVar1 == slot) break;
    pcVar1 = pcVar1 + 1;
  }
  DAT_002046c8 = DAT_002046c8 + -1;
  if (DAT_002046c8 <= pcVar1) {
    return;
  }
  *pcVar1 = *DAT_002046c8;
}



/* param_1 was `undefined4 *`, so `resolve_object_link(*param_1)` and `*param_1 = local_28`
   truncated the 64-bit object-list pointer the callers hand in by address... */
// was FUN_000537d0 -- searches the object chain starting at *param_1 for one matching class param_3
// (>>6&7 of the type word), subclass param_4 (>>4&3), and quality param_5 (&0xf), each -1/0xffff
// ("wildcard") skipping that check...
ushort *find_object_in_chain(ushort **link_cursor, int recurse, int object_class, int subclass, short quality)
{
  ushort *puVar1;
  ushort *puVar2;
  uint uVar3;
  ushort *local_28;
  
  puVar1 = (ushort *)resolve_object_link(*link_cursor);
  if (puVar1 != (ushort *)0x0) {
    do {
      if ((((int)(short)object_class == 0xffffffff) ||
          (uVar3 = (uint)*puVar1, (*puVar1 >> 6 & 7) == (int)(short)object_class)) &&
         (((int)(short)subclass == 0xffffffff ||
          (uVar3 = (uint)*puVar1, (*puVar1 >> 4 & 3) == (int)(short)subclass)))) {
        if ((int)quality == 0xffffffff) {
          return puVar1;
        }
        uVar3 = (uint)*puVar1;
        if ((uVar3 & 0xf) == (int)quality) {
          return puVar1;
        }
      }
      if ((((recurse != 0) && ((uVar3 & 0x8000) == 0)) && ((puVar1[3] & 0xffc0) != 0)) &&
         (local_28 = puVar1 + 3,
         puVar2 = (ushort *)find_object_in_chain(&local_28,recurse,object_class,subclass,quality),
         puVar2 != (ushort *)0x0)) {
        *link_cursor = local_28;
        return puVar2;
      }
      puVar1 = (ushort *)resolve_object_link(puVar1 + 2);
    } while (puVar1 != (ushort *)0x0);
  }
  return (ushort *)0x0;
}


// was FUN_00053920 -- returns whether object param_1 itself encodes type param_2 (&0x1ff of its
// type word), or -- if it isn't flagged "no contents" -- whether find_object_in_chain finds a match
// for that type (decoded into class/subclass/quality) among its contents.
int object_or_contents_has_type(ushort *object, ushort type_id)
{
  undefined4 uVar1;
  int iVar2;
  ushort *local_8;
  
  if ((*object & 0x1ff) == (int)(short)type_id) {
    uVar1 = 1;
  }
  else {
    if ((*object & 0x8000) == 0) {
      local_8 = object + 3;
      iVar2 = find_object_in_chain(&local_8,1,(int)(short)type_id >> 6,(short)type_id >> 4 & 3,type_id & 0xf
                          );
      if (iVar2 != 0) {
        return 1;
      }
    }
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_000539b0 -- the world-wide counterpart to find_object_in_chain: scans the 64x64 tile grid
// (DAT_002029cc) tile by tile, calling find_object_in_chain on each tile's object chain with class
// param_1/ subclass param_2/quality param_3...
ushort *find_object_in_world(int object_class, int subclass, short quality, short *out_x, short *out_y)
{
  short sVar1;
  int iVar2;
  /* Ghidra used 32-bit integers for the tile cursor and object return.
     Preserve both pointers on the 64-bit host, including resurrection's
     check_scheduled_object_level_match call after a player death. */
  char *iVar3;
  ushort *puVar6;
  ushort *local_24;

  if (0x3f < *out_x) {
    *out_x = 0;
    *out_y = *out_y + 1;
  }
  iVar2 = (int)*out_y;
  iVar3 = DAT_002029cc + ((int)*out_x + iVar2 * 0x40) * 4;
  do {
    if (0x3f < iVar2) {
      return 0;
    }
    if (*out_x < 0x40) {
      do {
        local_24 = (ushort *)(iVar3 + 2);
        if (((*local_24 & 0xffc0) != 0) &&
           (puVar6 = find_object_in_chain(&local_24,1,object_class,subclass,quality), puVar6 != 0)) {
          return puVar6;
        }
        sVar1 = *out_x;
        iVar3 = iVar3 + 4;
        *out_x = (short)(sVar1 + 1);
      } while ((sVar1 + 1) * 0x10000 >> 0x10 < 0x40);
    }
    *out_x = 0;
    sVar1 = *out_y;
    *out_y = (short)(sVar1 + 1);
    iVar2 = (sVar1 + 1) * 0x10000 >> 0x10;
  } while( true );
}


// was FUN_00055ef8 -- finalizes the position fields of a just- settled object's placement snapshot
// (param_1, the same snapshot struct build_object_placement_snapshot fills): if DAT_002046d4 is
// clear (settled cleanly)...
void randomize_settled_snapshot_position(char *snapshot)
{
  char cVar1;
  short sVar2;
  int iVar3;
  
  if (DAT_002046d4 == 0) {
    cVar1 = ce_rand();
    *(byte *)(snapshot + 0x14) = (cVar1 + 1U & 3) * '/';
    *(undefined1 *)(snapshot + 0x15) = 0;
    *(undefined1 *)(snapshot + 0x10) = 0xfc;
    *(undefined1 *)(snapshot + 0x11) = 0xff;
  }
  else {
    sVar2 = ce_rand();
    iVar3 = (((int)sVar2 & 0x3fffU) - 0x2000) + (int)*(short *)(snapshot + 0x21);
    *(char *)(snapshot + 0x21) = (char)iVar3;
    *(char *)(snapshot + 0x22) = (char)((uint)iVar3 >> 8);
    *(undefined1 *)(snapshot + 0x14) = 0xbc;
    *(undefined1 *)(snapshot + 0x15) = 0;
  }
}



// was FUN_00055f98 -- finalize a just-placed object's rest position at (param_2,param_3): validate
// it can actually reach this floor height, route genuinely-misplaced objects into
// discard_misplaced_object (which destroys them, see its own comment)...
ushort *settle_dropped_object(ushort *object, short tile_x, short tile_y, int force)
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
  /* iVar12 is reused throughout this function as a plain int (bitfield math, array indices) -- real
     uses, left alone -- but the one use at LAB_000564d8 held tilemap_lookup's real 64-bit pointer
     return... */
  char *pDropTile;
  undefined1 local_4c [24];

  DAT_002046d4 = 0;
  DAT_002046ec = 0;
  DAT_00202c6c = local_4c;
  bVar1 = false;
  uVar6 = encode_object_slot_index(object);
  DAT_00202c6c[10] = (char)uVar6;
  DAT_00202c6c[0xb] = (char)((ushort)uVar6 >> 8);
  iVar12 = (*object & 0x1ff) * 0xd;
  bVar5 = (&DAT_00202c93)[iVar12];
  if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
    fprintf(stderr, "[f98] ENTER object=%p type=0x%x tile=(%d,%d) flags-byte=0x%x\n",
            (void *)object, (unsigned)(*object & 0x1ff), (int)tile_x, (int)tile_y, (unsigned)bVar5);
  do {
    if ((bVar5 & 8) != 0) {
      if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: flag8 set on class table, returning object unchanged\n");
      return object;
    }
    DAT_00202c6c[8] = (&DAT_00202c91)[iVar12] & 7;
    DAT_00202c6c[9] = (&DAT_00202c90)[iVar12];
    DAT_00202c6c[4] = (byte)object[1] & 0x7f;
    DAT_00202c6c[5] = 0;
    iVar12 = tile_x * 8 + (uint)(*(byte *)((char *)object + 3) >> 5);
    *DAT_00202c6c = (char)iVar12;
    DAT_00202c6c[1] = (char)((uint)iVar12 >> 8);
    iVar12 = tile_y * 8 + ((*(byte *)((char *)object + 3) & 0x1c) >> 2);
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
    if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
      fprintf(stderr, "[f98] uVar2(local_4c+0xc)=0x%x local_4c+0xe=0x%x local_4c[0x15]=%d iVar12=%d\n",
              (unsigned)uVar2, (unsigned)*(ushort *)(DAT_00202c6c + 0xe),
              (int)DAT_00202c6c[0x15], iVar12);
    if ((((*(ushort *)(DAT_00202c6c + 0xe) | uVar2) & 0x300) != 0) || (DAT_00202c6c[0x15] != '\0'))
    {
      cVar4 = '\x01';
LAB_000564d0:
      if (cVar4 == '\0') {
        if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
          fprintf(stderr, "[f98] BAIL at LAB_000564d0 (cVar4==0), returning object unchanged\n");
        return object;
      }
LAB_000564d8:
      if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] -> discard_misplaced_object fallback path (not reallocate_object_to_arena replace)\n");
      pDropTile = (char *)tilemap_lookup((int)tile_x,(int)tile_y);
      puVar9 = (ushort *)discard_misplaced_object(pDropTile + 2,object,0);
      return puVar9;
    }
    if ((uVar2 & 7) == 5) goto LAB_000564d8;
    if ((uVar2 & 7) == 6) {
      if (((&DAT_00202c97)[(*object & 0x1ff) * 0xd] & 0xc) == 0xc) {
        if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
          fprintf(stderr, "[f98] BAIL: (uVar2&7)==6 class-table gate, returning object unchanged\n");
        return object;
      }
      cVar4 = resolve_damage_type_resistance(object,1,8);
      goto LAB_000564d0;
    }
    if ((uVar2 & 8) != 0) {
      if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: (uVar2&8)!=0, returning object unchanged\n");
      return object;
    }
    if (DAT_002046ec != 0) {
      if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] BAIL: DAT_002046ec!=0, returning object unchanged\n");
      return object;
    }
    if (iVar12 == 0) {
      if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
        fprintf(stderr, "[f98] -> reallocate_object_to_arena replace path, coords=(%d,%d)\n", (int)tile_x, (int)tile_y);
      DAT_0010144c = tile_x;
      DAT_00101454 = tile_y;
      puVar9 = (ushort *)reallocate_object_to_arena(object);
      DAT_0010144c = uVar6;
      DAT_00101454 = uVar3;
      if (DAT_002046d4 != 0) {
        *(byte *)((char *)puVar9 + 0x13) = *(byte *)((char *)puVar9 + 0x13) & 0x83 | 3;
        uVar10 = ce_rand();
        uw_ord2005_rem_119 = ((int)(uVar10)) % (9);
        *(char *)((char *)puVar9 + 9) = *(char *)((char *)puVar9 + 9) + (uw_ord2005_rem_119 + '\f') * '\x10';
      }
      if (force == 0) {
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
    uVar6 = encode_object_slot_index(object);
    DAT_00202c6c[10] = (char)uVar6;
    DAT_00202c6c[0xb] = (char)((ushort)uVar6 >> 8);
    iVar12 = (*object & 0x1ff) * 0xd;
    bVar5 = (&DAT_00202c93)[iVar12];
  } while( true );
}


/* was FUN_0001582c: dispatch slot 7 of FUN_00052674's boot-time objects.dat table-loader list
   (siblings load_armor_variant_tables/ load_light_food_effect_tables sit at slots 0/2, called the
   same way: `(*local_13c[i])(iVar3)` with iVar3 = the open objects.dat handle). */
void load_class7_variant_effect_table(int file_handle)
{
  read_file_handle(file_handle,&DAT_00250730,0x40);
}
/* was FUN_0007cd6c: dispatch slot 6, same boot-time loader list. */
void load_class6_variant_effect_table(int file_handle)
{
  read_file_handle(file_handle,&DAT_0024cfe0,0x10);
}
/* was FUN_0007cd7c: class6_variant_effect_table_lookup, dispatch slot 6 of
   get_scanned_object_class_effect_ptr's per-class table... */
void *class6_variant_effect_table_lookup()

{
  ushort uVar1;

  uVar1 = *(ushort *)g_scratch_object_ptr;
  if ((uVar1 & 0x30) == 0x20) {
    return &DAT_0024cfe0 + (uVar1 & 0xf);
  }
  return 0;
}
/* was FUN_0001583c: class7_variant_effect_table_lookup, dispatch slot 7 (local_8). Indexes
   DAT_00250730 (loaded above by load_class7_variant_effect_table) at 4-byte stride, unconditionally
   -- unlike its class6 sibling, every family/nibble combination is valid here. */
void *class7_variant_effect_table_lookup()

{
  return &DAT_00250730 + (*(byte *)g_scratch_object_ptr & 0xf) * 4;
}
/* was FUN_0002a2d8: class1_variant_effect_table_lookup, dispatch slot 1 of
   get_scanned_object_class_effect_ptr's local_24 array (the same 4-entry array
   class0/class2/class3's handlers sit in). */
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
   effect_ptr's 8-entry table -- reached for any object whose class is 0 (id&0x1c0)>>6==0... */
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
   &DAT_0004a070; (*(code*)local_24[idx])();`) for any object whose class is 2 (id&0x1c0)>>6==2... */
/* Return type was `undefined4` -- same 64-bit-pointer-truncation bug already flagged on
   get_scanned_object_class_effect_ptr itself: this handler hands back a pointer into a runtime
   table, and undefined4 drops its upper 32 bits on a 64-bit build... */
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
/* param_4 was `int` -- a real object pointer (forwarded to find_object_placement, which already
   declares its own param_1 as `ushort *`) truncated to 32 bits on this host. */
int place_object_in_world(uint tile_x, uint tile_y, int height, char *object, short radius, int skip_roll)
{
  int iVar1;
  uint uVar2;
  
  iVar1 = find_object_placement(object,tile_x,tile_y,height,radius);
  if (iVar1 == 0) {
    if ((skip_roll == 0) && (iVar1 = roll_object_destroy_chance(10,object), iVar1 != 0)) {
      unlink_and_free_object(0,object);
      return 0;
    }
    uVar2 = *(ushort *)(object + 2) & 0x3ff;
    *(char *)(object + 2) = (char)uVar2;
    *(byte *)(object + 3) =
         (byte)(uVar2 >> 8) | (byte)(((tile_y & 7 | (tile_x & 0x1fff) << 3) << 10) >> 8);
    /* was folded into `int iVar1` (reused above for unrelated int
       values) -- truncated tilemap_lookup's real `void *` return */
    char *_tile1 = (char *)tilemap_lookup((int)(short)tile_x >> 3,(int)(short)tile_y >> 3);
    object_list_insert_head(_tile1 + 2,object);
  }
  return 1;
}


// was FUN_0005578c -- finalize an object record's placement at tile (param_2,param_3): recomputes
// its render/collision height from the low 7 bits of its own offset 2-3 field...
void compute_object_placement_fields(byte *object, uint tile_x, uint tile_y)
{
  char cVar1;
  uint uVar2;
  int iVar3;
  byte bVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  
  uVar7 = (uint)*(ushort *)(object + 2);
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[throw-height] raw object[2..3](uVar7 src)=0x%x -> height_field=(uVar7&0x7f)<<3=%d\n",
            (unsigned)uVar7, (int)((uVar7 & 0x7f) << 3));
  object[9] = (byte)(*(ushort *)(object + 2) >> 2) & 0xe0;
  object[0x18] = object[0x18] & 0xe0;
  object[0x14] = object[0x14] & 7 | 0x80;
  uVar6 = (uint)CONCAT11(object[1],*object);
  bVar4 = (((&DAT_00202c93)[(uVar6 & 0x1ff) * 0xd] & 8) == 0) << 7;
  object[0x13] = bVar4 | object[0x13] & 0x7f;
  uVar2 = tile_y & 0x3f | (tile_x & 0x3ff) << 6;
  object[0x16] = object[0x16] & 0xf | (byte)(uVar2 << 4);
  object[0x17] = (char)(uVar2 >> 4);
  cVar1 = DAT_00101928;
  object[0x13] = bVar4;
  object[10] = (cVar1 + 1U ^ object[10]) & 0xf ^ object[10];
  object[0x14] = 0x82;
  *object = (char)(uVar6 & 0xbfff);
  object[1] = (char)((uVar6 & 0xbfff) >> 8);
  object[8] = 0x3f;
  object[10] = object[10] & 0x8f;
  if ((uVar6 & 0x1c0) != 0x40) {
    iVar5 = ((uVar7 & 0x1c00) >> 5) + tile_y * 0x100 + 0xf;
    object[0xd] = (char)iVar5;
    object[0xe] = (char)((uint)iVar5 >> 8);
    iVar5 = (uVar7 & 0x7f) << 3;
    object[0xf] = (char)iVar5;
    iVar3 = ((uVar7 & 0xe000) >> 8) + (tile_x & 0xff) * 0x100 + 0xf;
    object[0xb] = (char)iVar3;
    object[0x10] = (char)((uint)iVar5 >> 8);
    object[0x12] = 0;
    object[0xc] = (char)((uint)iVar3 >> 8);
  }
}


// was FUN_00055610 -- the "spawn and replace" mechanism: allocate a fresh low-region object slot
// (alloc_object_slot(1), same allocator spawn_object_near_player uses -- the only region
// emit_tile_objects's object_ptr_in_arena gate treats as renderable)...
ushort *reallocate_object_to_arena(ushort *object)
{
  char *iVar1;  /* was `int` -- truncated tilemap_lookup's real pointer */
  ushort *puVar2;

  iVar1 = (char *)tilemap_lookup((int)DAT_0010144c,(int)DAT_00101454);
  if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80) {
    ushort *pWalk;
    int n = 0;
    fprintf(stderr, "[replace] ENTER type=0x%x object=%p tile=(%d,%d) tilerec=%p\n",
            (unsigned)(*object & 0x1ff), (void *)object,
            (int)DAT_0010144c, (int)DAT_00101454, (void *)iVar1);
    fprintf(stderr, "[replace] pre-unlink list @ %p:", (void *)(iVar1 + 2));
    pWalk = (ushort *)resolve_object_link(iVar1 + 2);
    while (pWalk != NULL && n < 20) {
      fprintf(stderr, " [%p type=0x%x%s]", (void *)pWalk, (unsigned)(*pWalk & 0x1ff),
              pWalk == object ? "<-TARGET" : "");
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
    *(char *)puVar2 = (char)*object;
    *(undefined1 *)((char *)puVar2 + 1) = *(undefined1 *)((char *)object + 1);
    *(char *)(puVar2 + 1) = (char)object[1];
    *(undefined1 *)((char *)puVar2 + 3) = *(undefined1 *)((char *)object + 3);
    *(char *)(puVar2 + 2) = (char)object[2];
    *(undefined1 *)((char *)puVar2 + 5) = *(undefined1 *)((char *)object + 5);
    *(char *)(puVar2 + 3) = (char)object[3];
    *(undefined1 *)((char *)puVar2 + 7) = *(undefined1 *)((char *)object + 7);
    compute_object_placement_fields(puVar2,(int)DAT_0010144c,(int)DAT_00101454);
    *(byte *)(puVar2 + 4) = (byte)object[2] & 0x3f;
    if (((*object & 0x1c0) != 0x140) && (((&DAT_00202c9a)[(*object & 0x1ff) * 0xd] & 3) != 2)) {
      *(byte *)(puVar2 + 0xd) = (byte)(object[1] >> 7) & 7;
    }
    if ((*puVar2 & 0x1c0) == 0x1c0) {
      scheduler_relink_entry(puVar2,object);
    }
    if (getenv("UW_DEBUG_THROW") && (*object & 0x1ff) == 0x80)
      fprintf(stderr, "[replace] new copy puVar2=%p type=0x%x height(f/10)=%d in_arena=%d\n",
              (void *)puVar2, (unsigned)(*puVar2 & 0x1ff),
              (int)*(short *)((char *)puVar2 + 0xf), (int)object_ptr_in_arena((char *)puVar2));
    object_list_unlink(iVar1 + 2,object);
    free_object_slot(object);
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
int find_object_placement(ushort *object, uint tile_x, uint tile_y, short height, short radius)
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
    if ((bVar3 != 0) || (uVar4 = tile_x, uVar6 = tile_y, DAT_00202c84 == 0)) {
      iVar5 = (int)(short)(radius * 2 + 1);
      /* Was `ordint_divmod(iVar5,uVar2); ... */
      uVar2 = ce_rand();
      uVar4 = (ordint_divmod(iVar5,(int)uVar2).rem - (int)radius) + tile_x;
      uVar2 = ce_rand();
      uVar6 = (ordint_divmod(iVar5,(int)uVar2).rem - (int)radius) + tile_y;
    }
    uVar2 = encode_object_slot_index(object);
    iVar5 = check_object_placement_clearance(*object & 0x1ff,uVar2,uVar4,uVar6,height,1,0);
    if (iVar5 != 0) break;
    bVar3 = bVar3 + 1;
    if (0x17 < bVar3) {
      return 0;
    }
  }
  pTile = (char *)tilemap_lookup((int)uVar4 >> 3,(int)uVar6 >> 3);
  uVar1 = object[1];
  bVar3 = (byte)(uVar1 & 0x3ff);
  *(byte *)(object + 1) = (bVar3 ^ (byte)height) & 0x7f ^ bVar3;
  *(byte *)((char *)object + 3) =
       (byte)((uVar1 & 0x3ff) >> 8) | (byte)(((uVar6 & 7 | (uVar4 & 0x1fff) << 3) << 10) >> 8);
  object_list_append_tail(pTile + 2,object);
  iVar5 = object_ptr_in_arena(object);
  if (iVar5 == 0) {
    settle_dropped_object(object,(int)uVar4 >> 3,(int)uVar6 >> 3,1);
  }
  else {
    uVar4 = ((int)(short)((ushort)uVar4 & 0x1f8) >> 3) << 6 |
            (int)(((int)(short)uVar6 & 0x1f8U) << 0x10) >> 0x13;
    *(byte *)(object + 0xb) = (byte)object[0xb] & 0xf | (byte)(uVar4 << 4);
    *(char *)((char *)object + 0x17) = (char)(uVar4 >> 4);
  }
  return 1;
}


int class3_variant_effect_stub()

{
  /* Confirmed via a direct Ghidra headless lookup by address (0x7913c): `undefined4
     FUN_0007913c(void) { return 0; }` -- this genuinely IS a no-op in the real binary too, not a
     "Ghidra gave up" placeholder. Kept as-is; not a bug. */
  return 0;
}
int class5_variant_effect_stub()

{
  /* Confirmed via a direct Ghidra headless lookup by address (0x6b3d4): `undefined4
     FUN_0006b3d4(void) { return 0; }` -- this genuinely IS a no-op in the real binary too, not a
     "Ghidra gave up" placeholder. Kept as-is; not a bug. */
  return 0;
}
int class4_variant_effect_stub()

{
  /* Confirmed via a direct Ghidra headless lookup by address (0x73b10): `undefined4
     FUN_00073b10(void) { return 0; }` -- this genuinely IS a no-op in the real binary too, not a
     "Ghidra gave up" placeholder. Kept as-is; not a bug. */
  return 0;
}
