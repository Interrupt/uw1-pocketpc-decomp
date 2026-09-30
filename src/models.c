/* The 3D "catalog object" model-rendering pipeline: animation-record
 * ticking (resolving a catalog index to its real .E model geometry),
 * emitting a catalog object (door, bridge, decal, sign) as textured
 * model geometry, and door animation-frame emission. Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/models.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>




/* Ghidra lost the return value (literal `return 0`), so the sole caller
   (emit_catalog_object) dereferenced NULL at `*(int *)(iVar29 + 4)` -> crash the
   moment an animated tile object (door, etc.) came into view. The
   function ticks animation record `catalog` in place; it returns that
   record's base, &DAT_00189590 + catalog*0x3c2c (== piVar2 before the
   loop walks it).

   REAL FIX: that address-walk formula only works in the original binary,
   where DAT_00110ff0 and the 29 model buffers were one contiguous array
   (see g_anim_model_slot's own comment for the full trace) -- in this
   port every DAT_XXXXXXXX is its own separate C global, so the walk
   lands in unrelated always-zero memory and this whole function would
   silently return an empty record for every catalog. Now resolves
   `catalog` through g_anim_model_slot (the real per-catalog model
   address, in the same order load_3d_object_models loads them) and hands back a
   fresh copy in g_anim_model_scratch -- a real npts/nparts/point-list/
   face-list a caller can actually use, without ever aliasing (and
   risking emit_catalog_object's own scratch writes corrupting) the
   real model buffers. Falls back to the original (harmless, always-
   empty) address-walk behavior for any catalog with no real model --
   e.g. plain sprite/critter catalogs were never meant to reach this
   table at all. */
// was FUN_0001dc04
void *tick_anim_record(catalog)
short catalog;

{
  undefined4 uVar1;
  int *piVar2;
  undefined *puVar3;
  int iVar4;
  int iVar5;
  void *rec_base;

  /* Native 3D catalog-object rendering (doors/frames drawing as real .E
     model geometry instead of flat sprites) is enabled by default --
     no env var needed, unlike this project's earlier, now-removed
     g_model_map hack (which defaulted off). UW_DISABLE_3D_OBJECTS is
     the opt-out, for QA comparison against the pre-this-feature
     behavior, matching the naming convention UW_DISABLE_3D_GEOMETRY
     (this file's own sibling flag for the tile/wall/floor renderer)
     already established. Gated here, tick_anim_record's own single
     choke point for every caller (doors via emit_anim_object_frames,
     bridges/decals via the generic catalog dispatch) -- when set,
     every catalog falls through to the address-walk below exactly as
     it did before this session's fix, which lands in unrelated always-
     zero memory and returns an empty (point_count==0) record, so
     callers draw nothing for these objects rather than a stale flat
     sprite (there's no old sprite path left to fall back to -- see
     object-rendering-findings.txt). */
  { static int _disabled = -1;
    if (_disabled < 0) _disabled = (getenv("UW_DISABLE_3D_OBJECTS") != NULL);
    if (!_disabled && catalog > 0 && catalog < 30 && g_anim_model_slot[catalog] != 0) {
      void *dest = g_anim_model_scratch[catalog];
      memcpy(dest, g_anim_model_slot[catalog], 16384);
      return dest;
    }
  }

  iVar4 = catalog * 0x3c2c;
  piVar2 = (int *)(&DAT_00189590 + iVar4);
  rec_base = piVar2;
  iVar5 = *piVar2;
  if (0 < iVar5) {
    puVar3 = &DAT_00110ff0 + iVar4;
    do {
      iVar5 = iVar5 + -1;
      uVar1 = *(undefined4 *)(puVar3 + 8);
      *(char *)(piVar2 + 2) = (char)uVar1;
      *(char *)((char *)piVar2 + 9) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 10) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xb) = (char)((uint)uVar1 >> 0x18);
      uVar1 = *(undefined4 *)(&DAT_00110ffc + iVar4);
      (&DAT_0018959c)[iVar4] = (char)uVar1;
      (&DAT_0018959d)[iVar4] = (char)((uint)uVar1 >> 8);
      (&DAT_0018959e)[iVar4] = (char)((uint)uVar1 >> 0x10);
      (&DAT_0018959f)[iVar4] = (char)((uint)uVar1 >> 0x18);
      uVar1 = *(undefined4 *)(puVar3 + 0x10);
      puVar3 = puVar3 + 0xc;
      *(char *)(piVar2 + 4) = (char)uVar1;
      *(char *)((char *)piVar2 + 0x11) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x12) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x13) = (char)((uint)uVar1 >> 0x18);
      piVar2 = piVar2 + 3;
      iVar4 = iVar4 + 0xc;
    } while (iVar5 != 0);
  }
  return rec_base;
}




// WARNING: Removing unreachable block (ram,0x00064024)

// was FUN_00061e60
void emit_catalog_object(catalog,obj,heading,frame_or_texid)
byte catalog;
/* Object-record pointer -- was `uint`, truncating it (same class as
   object_list_insert_head above). */
char *obj;
char heading;
short frame_or_texid;

{
  int uw_ord2005_rem_123 = 0; int uw_ord2005_rem_124 = 0;
  int iVar1;
  int iVar2;
  int iVar3;
  byte catalog_flags;
  byte bVar5;
  byte *pbVar6;
  short sVar7;
  byte bVar8;
  char cVar9;
  undefined2 uVar10;
  ushort tex_w;
  ushort tex_h;
  short sVar13;
  uint catalog_u;
  char *pcVar15;
  int iVar16;
  /* iVar16 stays `int` for its FIRST role (a small face-index scalar,
     `faces_remaining-1`, used only to seed iVar22/local_58 before the
     loop). Inside the loop it gets reassigned to the CURRENT face
     record's address (`_anim + iVar22 + 0xc14`) and used purely as a
     pointer from then on -- a real 64-bit-pointer-truncated-through-a-
     32-bit-int bug (this whole project's own well-established bug
     class -- see DAT_00110fc0/DAT_0023aed0's own history) that never
     triggered here because this loop never ran with real face data
     until tick_anim_record's own fix (see its comment) made local_48/
     faces_remaining nonzero for the first time. Split into its own
     real pointer, `_face_rec`, scoped to exactly its second role. */
  char *_face_rec;
  undefined4 uVar17;
  int iVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  uint uVar21;
  short extraout_r1;
  short extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int iVar22;
  byte *pbVar23;
  undefined1 *puVar24;
  ushort *puVar25;
  undefined4 *puVar26;
  int iVar27;
  undefined4 *puVar28;
  int iVar29;
  char *_anim;
  int iVar30;
  /* Same truncated-pointer bug as _face_rec (see its own comment), one
     variable over: iVar30 has a genuine dual role. In the ceiling-clamp
     pre-pass (catalog_u==1 branch, the do/while over local_60) it's a real
     small vertex-index integer, into a 4-entry table -- left as `int`
     there, untouched. From its first REAL pointer assignment onward
     (`_face_rec + 8` face-record field, dereferenced to build a vertex
     address), it's a full address -- split into its own pointer, `_vptr`. */
  char *_vptr;
  /* DELIBERATE DEVIATION from the real binary. The per-corner UV read
     below is fixed at point.X (U) / point.Y (V) for every face in the
     real ARM code (fsub/fdiv/fmul at 0x63104/0x63108/0x637f4 -- no Z
     term, no flat-face branch), transform_points_by_matrix copies those
     ints verbatim into the arena and the rasterizer interpolates them.
     For a horizontal face (FBRIDGE.E's 256x16x256 deck: all 4 corners at
     Y=16) that gives V=31 on every corner -- one texture row stretched
     along the whole bridge. That IS what the shipped binary drew (the
     draw-list commands the same branch emits -- `2 <reg 0xb>
     DAT_00086d60[flags]`, `0xb2 6` -- have no consumer anywhere in
     UU.exe: the list-cursor accessors FUN_00038624/644/664 have zero
     callers), but per direct request the deck should carry the full
     32x32 plank/slab image like the DOS game. So, PER FACE: when every
     corner shares one Y, take V from point.Z over the model's Z extent
     (computed here the same way parse_e_model_file computes X/Y's);
     every face with any Y variation keeps the exact original mapping.
     An earlier model-wide version of this used Z but still divided by
     the Y extent (16 units) -- V ran -248..248 on a 32-texel texture,
     the "garbage bridge texture" QA report. */
  int _v_offset;
  byte *_floor_tex = (byte *)0x0;
  undefined4 _vmin_bits;
  undefined4 _vext_bits;
  float _model_minz;
  float _model_extz;
  undefined4 *puVar31;
  undefined4 *puVar32;
  ushort local_7c;
  ushort local_7a;
  byte *texptr;
  int local_60;
  byte *local_58;
  int faces_remaining;
  
  catalog_u = (uint)catalog;
  iVar1 = catalog_u * 4;
  catalog_flags = (&DAT_00086c08)[iVar1];
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] emit_catalog_object: catalog_idx=%d heading(heading)=%d frame_or_texid(frame_or_id)=%d DAT_00086c08[idx]=0x%02x\n",
            (int)catalog, (int)heading, (int)frame_or_texid, (unsigned)catalog_flags);
  *DAT_00110fc0 = 2;
  local_7a = 0xffff;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  local_58 = (byte *)0x0;
  uVar10 = FUN_00038a8c(10);
  *DAT_00110fc0 = uVar10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)DAT_0023bc88 * DAT_00086b30;
  puVar25 = DAT_00110fc0 + 1;
  DAT_00189584 = (ushort)DAT_0023bc88 * DAT_00086b30;
  DAT_00110fc0 = puVar25;
  if ((catalog_flags & 0x20) == 0) {
    if ((catalog_flags & 0x80) == 0) {
      uVar21 = (int)(short)(ushort)catalog_flags & 7;
      if (uVar21 != 0) {
        iVar29 = 0;
        do {
          *puVar25 = 2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = FUN_00038a8c(iVar29);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (ushort)DAT_0023bc88 * DAT_00086b30 * 0x100;
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[billboard] static sub-frame %d: mesh_slot=0x%04x pushed_val=0x%04x (catalog_byte=0x%02x)\n",
                    iVar29, (unsigned)tex_w, (unsigned)*DAT_00110fc0,
                    (unsigned)(byte)(&DAT_00086c09)[iVar29 + iVar1]);
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
          (&DAT_00189570)[iVar29] =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (ushort)DAT_0023bc88 * DAT_00086b30 * 0x100;
          iVar29 = (iVar29 + 1) * 0x10000 >> 0x10;
        } while (iVar29 < (int)uVar21);
      }
    }
    else {
      DAT_0023b804 = 1;
      uVar21 = read_realtime_clock_units();
      tex_w = (ushort)(uVar21 >> 6);
      local_7c = tex_w & 7;
      if ((uVar21 >> 6 & 4) != 0) {
        local_7c = 3 - (tex_w & 3);
      }
      uVar21 = (int)(short)(ushort)catalog_flags & 7;
      puVar25 = DAT_00110fc0;
      if (uVar21 != 0) {
        iVar29 = 0;
        do {
          *puVar25 = 2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = FUN_00038a8c(iVar29);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (*(ushort *)(obj + 6) >> 6 & 0x1ff) + local_7c;
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
          (&DAT_00189570)[iVar29] =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               ((*(ushort *)(obj + 6) & 0x7fc0) >> 6) + local_7c;
          iVar29 = (iVar29 + 1) * 0x10000 >> 0x10;
        } while (iVar29 < (int)uVar21);
      }
    }
  }
  else {
    local_58 = (byte *)get_texture_page((int)frame_or_texid);
    if (local_58 == (byte *)0x0) {
      /* frame_or_texid out of get_texture_page's 0..0x73 range -- reached with
         (uVar27 & 0xf) + DAT_00202734 (~0x2b8) from emit_tile_objects's
         `(*catalog & 0x30) == 0x30` branch, i.e. a special animated
         object (door frame etc.) whose texture lives in a different bank
         than the wall/floor tile pages this helper knows. Rather than
         dereference NULL (crash the instant such a tile comes into view),
         skip this object's textured billboard. */
      return;
    }
    bVar5 = *local_58;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = FUN_00038a8c(0);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)bVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = FUN_00038a8c(10);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_0023b4e0 * DAT_00086b30;
    DAT_00189584 = (ushort)DAT_0023b4e0 * DAT_00086b30;
    puVar25 = DAT_00110fc0 + 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189570 = (ushort)bVar5;
  }
  iVar29 = (int)frame_or_texid;
  if ((catalog_flags & 0x10) != 0) {
    bVar5 = (&DAT_00086c0b)[iVar1];
    if (frame_or_texid < 0) {
      if (catalog_u == 2) {
        bVar8 = (bVar5 >> 5) + 1;
        if ((*(byte *)(obj + 1) >> 1 & 0xf) < bVar8) {
          DAT_0023b834 = 2;
          Ordinal_2005(bVar8,*(byte *)(obj + 1) >> 1 & 0xf);
          /* real ARM idivmod leaves the remainder in r1 (Ghidra's extraout_r1) */
          extraout_r1 = (short)((*(byte *)(obj + 1) >> 1 & 0xf) % bVar8);
          uVar21 = (uint)DAT_00202734;
          *puVar25 = 2;
          iVar29 = (bVar5 & 0x1f) + (int)extraout_r1 + uVar21 + 0x10;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = FUN_00038a8c(0xb);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = *(ushort *)(&DAT_00086d60 + (*(byte *)(obj + 1) >> 1 & 0xf) * 2);
          DAT_00110fc0 = DAT_00110fc0 + 1;
          DAT_00189586 = *(undefined2 *)(&DAT_00086d60 + (*(byte *)(obj + 1) >> 1 & 0xf) * 2);
          *DAT_00110fc0 = 0xb2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = 6;
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
        }
        else {
          emit_floor_texture_select(0,DAT_0023b4e0,
                       ((*(byte *)(obj + 1) >> 1 & 0xf) - (uint)(bVar5 >> 5)) + -1);
          /* The real branch textures the bridge through draw-list
             commands (0x3e/0xb2) this port has no consumer for -- resolve
             the same floor texture emit_floor_texture_select just selected (index
             +0x30 full-res / +0x6a low-res, its own level threshold)
             directly, so a flags>=2 bridge isn't left with a NULL
             texture. Not live-verified: every level-1 bridge has
             flags 0/1. */
          _floor_tex = (byte *)get_texture_page(
              (((*(byte *)(obj + 1) >> 1 & 0xf) - (uint)(bVar5 >> 5)) + -1) +
              (((int)(DAT_0023b4e0 & 0xff) < (int)DAT_00086b24) ? 0x30 : 0x6a));
          iVar29 = -1;
          *DAT_00110fc0 = 0xb2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = DAT_0023b81c;
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
        }
      }
      else {
        cVar9 = (bVar5 >> 5) + 1;
        if (cVar9 != '\0') {
          Ordinal_2005(cVar9,*(byte *)(obj + 1) >> 1 & 0xf);
          extraout_r1_00 = (short)((*(byte *)(obj + 1) >> 1 & 0xf) % (unsigned char)cVar9);
          iVar29 = (bVar5 & 0x1f) + (int)extraout_r1_00 + (uint)DAT_00202734 + 0x10;
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[billboard] extra-frame: bVar5=0x%02x cVar9=%d extraout_r1_00=%d DAT_00202734=%d -> iVar29=%d\n",
                    (unsigned)bVar5, (int)cVar9, (int)extraout_r1_00, (int)DAT_00202734, iVar29);
        }
      }
    }
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[billboard] extra-frame check: iVar29=%d (short)(ushort)iVar29=%d -> %s\n",
              iVar29, (int)(short)(ushort)iVar29,
              (-1 < (short)(ushort)iVar29) ? "PUSHED" : "SKIPPED");
    if (-1 < (short)(ushort)iVar29) {
      *puVar25 = 0xc0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)iVar29;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023bc88 * DAT_00086b30;
      puVar25 = DAT_00110fc0 + 1;
      DAT_00110fc0 = puVar25;
    }
    DAT_0023b818 = 0xe0;
  }
  tex_w = DAT_0023b91c;
  if ((catalog_flags & 8) != 0) {
    *puVar25 = 0x4c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x400 - tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x800;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + 0x30;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (0x400 - tex_w) * 2 - 1;
    puVar25 = DAT_00110fc0 + 1;
    DAT_00110fc0 = puVar25;
  }
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[billboard] position anchor: DAT_0023b904=%d DAT_0023b91c=%d DAT_0023b920=%d\n",
            (int)(short)DAT_0023b904, (int)(short)DAT_0023b91c, (int)(short)DAT_0023b920);
  *puVar25 = 0x18;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b904;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b904 >> 0x10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b91c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b91c >> 0x10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b920;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b920 >> 0x10;
  cVar9 = DAT_0023b4a0;
  puVar25 = DAT_00110fc0 + 1;
  DAT_00110fc0 = puVar25;
  if (heading < '\0') {
    uw_ord2005_rem_123 = ((int)((*(ushort *)(obj + 2) >> 7 & 7) + (4 - DAT_0023b4a0) * 2)) % (8);
    local_7c = (ushort)((uint)(uw_ord2005_rem_123 << 0x1d) >> 0x10);
  }
  else {
    local_7c = ((short)heading + DAT_0023b4a0 * -4) * 0x1000;
  }
  if (((catalog_flags & 0x40) != 0) && ((catalog_flags & 0x10) == 0)) {
    if (obj < DAT_002046c4) {
      tex_w = ((*(byte *)(obj + 0x14) >> 3) - 0x10) * 0x266;
      uw_ord2005_rem_124 = ((int)((*(ushort *)(obj + 2) >> 2 & 0xe0) + cVar9 * -0x40 +
                         (*(byte *)(obj + 0x18) & 0x1f) + 0x100)) % (0x100);
      local_7c = (ushort)((uint)(uw_ord2005_rem_124 << 0x18) >> 0x10);
    }
    else {
      tex_w = 0;
    }
    *puVar25 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_h = FUN_00038a8c(5);
    *DAT_00110fc0 = tex_h;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = tex_w;
    puVar25 = DAT_00110fc0 + 1;
    DAT_00110fc0 = puVar25;
    DAT_0018957a = tex_w;
  }
  if (((catalog_u == 0x10) || (catalog_u == 0x11)) && (DAT_0023b830 == '\0' && DAT_00086b2c == 0)) {
    local_7a = 0;
  }
  else if (((DAT_0023b830 == '\0') && ((*(byte *)(DAT_00086df8 + 0xb5) & 0xf0) == 0x10)) &&
          (catalog_u == 2)) {
    local_7a = 1;
  }
  if (local_7a != 0xffff) {
    *puVar25 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = FUN_00038a8c(8);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = local_7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = local_7a;
  }
  sVar13 = (short)iVar29;
  if ((sVar13 < 0) || ((sVar13 == 0 && (catalog_u == 0xc)))) {
    tex_w = 0x40;
    tex_h = 0x40;
    texptr = (byte *)0x0;
  }
  else if (local_58 == (byte *)0x0) {
    pcVar15 = (char *)FUN_000408fc(iVar29);
    tex_w = (ushort)(byte)pcVar15[1];
    tex_h = (ushort)(byte)pcVar15[2];
    if (*pcVar15 == '\x04') {
      texptr = (byte *)(pcVar15 + 5);
    }
    else {
      texptr = (byte *)decompress_gr_bitmap(pcVar15 + 4,&DAT_00202520 + (uint)(byte)pcVar15[3] * 0x10);
    }
  }
  else {
    texptr = local_58;
    tex_w = DAT_0023b824;
    tex_h = DAT_0023b824;
  }
  if (_floor_tex != (byte *)0x0) {
    texptr = _floor_tex;
    tex_w = DAT_0023b824;
    tex_h = DAT_0023b824;
  }
  _anim = (char *)tick_anim_record(catalog);
  faces_remaining = *(int *)(_anim + 4);
  if (getenv("UW_DEBUG_FACE51") && catalog == 7) {
    static int _dumped_once = 0;
    if (!_dumped_once) {
      _dumped_once = 1;
      int _kk;
      fprintf(stderr, "[face51] model dump: catalog=%d faces_remaining=%d\n", (int)catalog, faces_remaining);
      for (_kk = 0; _kk < faces_remaining; _kk++) {
        int _pc = *(int *)(_anim + 0xc14 + _kk * 0x60);
        fprintf(stderr, "[face51] model k=%d point_count=%d\n", _kk, _pc);
      }
    }
  }
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[billboard] tick_anim_record(catalog=%d) -> _anim=%p point_count=%d face_count(faces_remaining)=%d\n",
            (int)catalog, (void *)_anim, *(int *)_anim, faces_remaining);
  /* DOOR.E's own local X range is [0,128] (confirmed live via the print
     below, and by reading the raw data/DATA3D/DOOR.E file directly) --
     NOT centered on 0, unlike every other model this path draws
     (DFRAME.E's real opening, points 0-7, is exactly [-64,64] -- the
     same 128-unit width, but centered). No per-catalog local offset
     exists anywhere in the real disassembly for this call chain (traced
     emit_anim_object_frames and this function itself, both confirmed
     matching the real ARM instructions) -- DFRAME and DOOR share the
     exact same world anchor and heading with nothing shifting one
     relative to the other. Confirmed live (QA report: "door leaf...
     offset into the door frame and not perfectly in the opening"):
     drawing DOOR.E's raw [0,128] range at the same anchor as DFRAME's
     centered opening leaves half the opening empty and pushes the leaf
     128 units off-axis, half sticking out past the frame into the wall.
     This is a data-convention mismatch specific to this PORT'S OWN .E
     export (the original engine's real door leaf asset was presumably
     already centered, matching how every other model here behaves) --
     not a missing piece of original logic to port, so fix it as a
     narrow compatibility shift using the model's own already-computed
     bounding box (parse_e_model_file's real +0x3c1c min-X/+0x3c20
     extent-X fields) rather than a bare hardcoded -64: re-centers
     whatever this port's own DOOR.E actually contains, and is a no-op
     for every already-correctly-centered model (DFRAME's own full
     [-128,128] bounding box, including its riser posts, centers to a
     0.0 shift). Scoped to catalog==14 only -- every other catalog this
     path draws was already confirmed correctly positioned this
     session, so don't risk perturbing them. */
  if (catalog == 14) {
    int _pcx = *(int *)_anim;
    float _minX = *(float *)(_anim + 0x3c1c);
    float _extX = *(float *)(_anim + 0x3c20);
    float _shiftX = -(_minX + _extX * 0.5f);
    int _px;
    for (_px = 0; _px < _pcx; _px++) {
      *(float *)(_anim + 8 + _px*0xc) += _shiftX;
    }
    /* The per-face U computation just below reads point.X back against
       this SAME model's own +0x3c1c min-X field (see its own comment --
       `(point.X - min_X) / extent_X`, mapped across the texture width).
       Shifting the points without also shifting min-X by the identical
       amount leaves U computed against the model's OLD, now-stale
       origin -- confirmed live (QA report: "door UVs are incorrect...
       U seems offset by half"): half of U's range went negative,
       visibly wrapping the texture's own left/right edges into the
       middle of the door instead of its true edges. extent_X is
       unchanged by a pure translation, so only min-X needs updating. */
    *(float *)(_anim + 0x3c1c) = _minX + _shiftX;
    if (getenv("UW_DEBUG_DOOR_POS"))
      fprintf(stderr, "[doorpos] catalog=14 (DOOR.E) re-centered: minX=%g extX=%g shiftX=%g new_minX=%g\n",
              (double)_minX, (double)_extX, (double)_shiftX, (double)(_minX + _shiftX));
  }
  if (getenv("UW_DEBUG_DOOR_POS")) {
    int _pc2 = *(int *)_anim;
    float _minx = 0.0f, _maxx = 0.0f;
    int _pj;
    for (_pj = 0; _pj < _pc2; _pj++) {
      float _x = *(float *)(_anim + 8 + _pj*0xc);
      if (_pj == 0 || _x < _minx) _minx = _x;
      if (_pj == 0 || _x > _maxx) _maxx = _x;
    }
    fprintf(stderr, "[doorpos] catalog=%d anchor=(%d,%d,%d) heading=%d local_X=[%g,%g] bbox_minX=%g bbox_extX=%g\n",
            (int)catalog, (int)(short)DAT_0023b904, (int)(short)DAT_0023b91c, (int)(short)DAT_0023b920,
            (int)heading, (double)_minx, (double)_maxx,
            (double)*(float *)(_anim + 0x3c1c), (double)*(float *)(_anim + 0x3c20));
  }
  _model_minz = 0.0f;
  _model_extz = 1.0f;
  { int _pc = *(int *)_anim;
    if (_pc > 0) {
      float _maxz = 0.0f;
      int _pi;
      for (_pi = 0; _pi < _pc; _pi++) {
        float _z = *(float *)(_anim + 8 + _pi*0xc + 8);
        if (_pi == 0 || _z < _model_minz) _model_minz = _z;
        if (_pi == 0 || _z > _maxz) _maxz = _z;
      }
      if (_maxz > _model_minz) _model_extz = _maxz - _model_minz;
    }
  }
  iVar16 = faces_remaining + -1;
  if (-1 < iVar16) {
    iVar2 = (int)(short)tex_w;
    iVar3 = (int)(short)tex_h;
    iVar22 = iVar16 * 0x60;
    local_58 = (byte *)(iVar16 * 0x18);
    do {
      sVar7 = DAT_000da47c;
      _face_rec = iVar22 + _anim + 0xc14;
      _v_offset = 0xc;
      _vmin_bits = *(undefined4 *)(_anim + 0x3c24);
      _vext_bits = *(undefined4 *)(_anim + 0x3c28);
      { int _vc = *(int *)_face_rec, _ci, _flat = (_vc > 1);
        float _y0 = *(float *)(_anim + 8 + *(int *)(_face_rec + 4) * 0xc + 4);
        for (_ci = 1; _ci < _vc && _ci < 4; _ci++)
          if (*(float *)(_anim + 8 + *(int *)(_face_rec + 4 + _ci * 4) * 0xc + 4) != _y0) _flat = 0;
        if (_flat) {
          _v_offset = 0x10;
          memcpy(&_vmin_bits, &_model_minz, 4);
          memcpy(&_vext_bits, &_model_extz, 4);
        }
      }
      *(char *)(_face_rec + 0x4c) = (char)DAT_000da47c;
      *(char *)(_face_rec + 0x4d) = (char)((ushort)sVar7 >> 8);
      cVar9 = (char)(sVar7 >> 0xf);
      *(char *)(_face_rec + 0x4e) = cVar9;
      *(char *)(_face_rec + 0x4f) = cVar9;
      cVar9 = (&DAT_00086c09)[iVar1];
      pbVar23 = &DAT_00086c08 + iVar1;
      pbVar6 = (byte *)0x0;
      if (cVar9 != '\0') {
        pbVar23 = (byte *)(uint)(byte)(&DAT_00086c0a)[iVar1];
        pbVar6 = pbVar23;
      }
      if (cVar9 != '\0' && pbVar6 != (byte *)0x0) {
        uVar10 = (undefined2)((uint)pbVar23 >> 8);
        *(char *)(_face_rec + 0x50) = (char)pbVar23;
      }
      else {
        uVar10 = 0;
        *(char *)(_face_rec + 0x50) = cVar9;
      }
      *(char *)(_face_rec + 0x51) = (char)uVar10;
      *(char *)(_face_rec + 0x52) = (char)((ushort)uVar10 >> 8);
      *(undefined1 *)(_face_rec + 0x53) = 0;
      *(char *)(_face_rec + 0x18) = (char)texptr;
      *(char *)(_face_rec + 0x19) = (char)((uint)texptr >> 8);
      *(char *)(_face_rec + 0x1a) = (char)((uint)texptr >> 0x10);
      *(char *)(_face_rec + 0x1b) = (char)((uint)texptr >> 0x18);
      *(char *)(_face_rec + 0x1c) = (char)tex_w;
      *(char *)(_face_rec + 0x1d) = (char)(tex_w >> 8);
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x1e) = (short)tex_w >> 0xf;
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x1f) = (short)tex_w >> 0xf;
      *(char *)(_face_rec + 0x20) = (char)tex_h;
      *(char *)(_face_rec + 0x21) = (char)(tex_h >> 8);
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x22) = (short)tex_h >> 0xf;
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x23) = (short)tex_h >> 0xf;
      if (catalog_u == 1) {
        local_60 = 0;
        do {
          iVar27 = (int)(short)DAT_0023b91c;
          iVar30 = *(int *)(_anim + 0xc14 + ((int)local_58 + local_60) * 4 + 4);
          uVar17 = Ordinal_2032(iVar27);
          uVar17 = Ordinal_2051(*(undefined4 *)(iVar30 * 0xc + _anim + 0xc),uVar17);
          iVar18 = Ordinal_2036(uVar17,0x44800000);
          if (iVar18 != 0) {
            uVar17 = Ordinal_2032(0x400 - iVar27);
            puVar24 = (undefined1 *)((iVar30 + 1) * 0xc + _anim);
            *puVar24 = (char)uVar17;
            puVar24[1] = (char)((uint)uVar17 >> 8);
            puVar24[2] = (char)((uint)uVar17 >> 0x10);
            puVar24[3] = (char)((uint)uVar17 >> 0x18);
          }
          local_60 = (local_60 + 1) * 0x10000 >> 0x10;
        } while (local_60 < 4);
        _vptr = *(int *)(_face_rec + 8) * 0xc + _anim;
        uVar17 = Ordinal_2032(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar19 = Ordinal_2026(uVar19,0x3b800000);
        Ordinal_2026(uVar19,uVar17);
        uVar19 = Ordinal_2020();
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = Ordinal_2032(iVar3 + -1);
        puVar28 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2026(uVar20,0x3b800000);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2026(uVar20,0x3b800000);
        Ordinal_2026(uVar20,uVar17);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2026(uVar20,0x3b800000);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2026(uVar20,0x3b800000);
        Ordinal_2026(uVar20,uVar17);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2026(uVar20,0x3b800000);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xf),
                          CONCAT12(*(undefined1 *)(_face_rec + 0xe),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0xd),
                                            *(undefined1 *)(_face_rec + 0xc)))) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2026(uVar20,0x3b800000);
        Ordinal_2026(uVar20,uVar17);
        uVar17 = Ordinal_2020();
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = Ordinal_2026(uVar17,0x3b800000);
        Ordinal_2026(uVar17,uVar19);
        uVar17 = Ordinal_2020();
      }
      else if (((catalog_u == 0xe) || (catalog_u == 0xf)) || (catalog_u == 0x13)) {
        _vptr = *(int *)(_face_rec + 0xc) * 0xc + _anim;
        uVar17 = Ordinal_2032(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        puVar28 = (undefined4 *)(_anim + 0x3c20);
        uVar19 = Ordinal_2047(uVar19,*puVar28);
        Ordinal_2026(uVar19,uVar17);
        uVar19 = Ordinal_2020();
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = Ordinal_2032(iVar3 + -1);
        puVar31 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        puVar32 = (undefined4 *)(_anim + 0x3c28);
        uVar20 = Ordinal_2047(uVar20,_vext_bits);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2047(uVar20,*puVar28);
        Ordinal_2026(uVar20,uVar17);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2047(uVar20,_vext_bits);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2047(uVar20,*puVar28);
        Ordinal_2026(uVar20,uVar17);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2047(uVar20,_vext_bits);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xb),
                          CONCAT12(*(undefined1 *)(_face_rec + 10),
                                   CONCAT11(*(undefined1 *)(_face_rec + 9),*(undefined1 *)(_face_rec + 8))
                                  )) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2047(uVar20,*puVar28);
        Ordinal_2026(uVar20,uVar17);
        uVar17 = Ordinal_2020();
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = Ordinal_2047(uVar17,_vext_bits);
        Ordinal_2026(uVar17,uVar19);
        uVar17 = Ordinal_2020();
      }
      else {
        _vptr = *(int *)(_face_rec + 8) * 0xc + _anim;
        uVar17 = Ordinal_2032(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        puVar28 = (undefined4 *)(_anim + 0x3c20);
        uVar19 = Ordinal_2047(uVar19,*puVar28);
        Ordinal_2026(uVar19,uVar17);
        uVar19 = Ordinal_2020();
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = Ordinal_2032(iVar3 + -1);
        puVar31 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        puVar32 = (undefined4 *)(_anim + 0x3c28);
        uVar20 = Ordinal_2047(uVar20,_vext_bits);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2047(uVar20,*puVar28);
        Ordinal_2026(uVar20,uVar17);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2047(uVar20,_vext_bits);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2047(uVar20,*puVar28);
        Ordinal_2026(uVar20,uVar17);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = Ordinal_2047(uVar20,_vext_bits);
        Ordinal_2026(uVar20,uVar19);
        uVar20 = Ordinal_2020();
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xf),
                          CONCAT12(*(undefined1 *)(_face_rec + 0xe),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0xd),
                                            *(undefined1 *)(_face_rec + 0xc)))) * 0xc + _anim;
        uVar20 = Ordinal_2015(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = Ordinal_2047(uVar20,*puVar28);
        Ordinal_2026(uVar20,uVar17);
        uVar17 = Ordinal_2020();
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = Ordinal_2015(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = Ordinal_2047(uVar17,_vext_bits);
        Ordinal_2026(uVar17,uVar19);
        uVar17 = Ordinal_2020();
      }
      *(char *)(_face_rec + 0x40) = (char)uVar17;
      *(char *)(_face_rec + 0x41) = (char)((uint)uVar17 >> 8);
      *(char *)(_face_rec + 0x42) = (char)((uint)uVar17 >> 0x10);
      *(char *)(_face_rec + 0x43) = (char)((uint)uVar17 >> 0x18);
      local_58 = (byte *)((char *)local_58 + -0x18);
      iVar22 = iVar22 + -0x60;
      faces_remaining = faces_remaining + -1;
    } while (faces_remaining != 0);
  }
  uVar17 = Ordinal_2032((int)(short)DAT_0023b904);
  *(char *)(_anim + 0xc08) = (char)uVar17;
  *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
  uVar17 = Ordinal_2032((int)(short)DAT_0023b91c);
  *(char *)(_anim + 0xc0c) = (char)uVar17;
  *(char *)(_anim + 0xc0d) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc0e) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc0f) = (char)((uint)uVar17 >> 0x18);
  uVar17 = Ordinal_2032((int)(short)DAT_0023b920);
  *(char *)(_anim + 0xc10) = (char)uVar17;
  *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  if (((catalog_u != 0xe) && (catalog_u != 0xf)) && (catalog_u != 0xc)) goto LAB_000640ec;
  uVar21 = (int)((*(ushort *)(obj + 2) >> 7 & 7) + 1) >> 1;
  if (3 < uVar21) {
    uVar21 = 0;
  }
  switch(((uw_mobile_object_t *)g_player_object)->hdr.heading) {
  case 0:
    break;
  case 1:
    goto LAB_00064070;
  case 2:
LAB_00064070:
    uVar19 = (&DAT_00086cec)[uVar21 * 8];
    uVar17 = (&DAT_00086ce8)[uVar21 * 8];
    goto LAB_000640c0;
  case 3:
    goto LAB_00064088;
  case 4:
LAB_00064088:
    uVar19 = (&DAT_00086cf4)[uVar21 * 8];
    uVar17 = (&DAT_00086cf0)[uVar21 * 8];
    goto LAB_000640c0;
  case 5:
    goto LAB_0006409c;
  case 6:
LAB_0006409c:
    uVar19 = (&DAT_00086cfc)[uVar21 * 8];
    uVar17 = (&DAT_00086cf8)[uVar21 * 8];
    goto LAB_000640c0;
  case 7:
    break;
  default:
    goto switchD_00064038_default;
  }
  uVar19 = (&DAT_00086ce4)[uVar21 * 8];
  uVar17 = (&DAT_00086ce0)[uVar21 * 8];
LAB_000640c0:
  apply_model_position_offset(_anim,uVar17,0,uVar19);
switchD_00064038_default:
  scale_model_part_offsets(_anim,0x3f800000,0x3f99999a,0x3f800000);
LAB_000640ec:
  if (sVar13 < 0) {
    if (catalog_u == 7) {
      scale_model_part_offsets(_anim,0x40200000,0x40200000,0x40200000);
    }
    if ((sVar13 < 0) && ((catalog_u == 0x1b || (catalog_u == 0x19)))) {
      scale_model_part_offsets(_anim,0x40000000,0x40000000,0x40000000);
    }
  }
  if ((catalog_u == 0xe) || (catalog_u == 0xf)) {
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] swing: catalog=%d DAT_0018957a=%d local_7c(before)=%d\n",
              (int)catalog_u, (int)(short)DAT_0018957a, (int)(short)local_7c);
    uVar17 = Ordinal_2032((int)(short)DAT_0018957a);
    uVar19 = Ordinal_2032((int)(short)local_7c);
    Ordinal_2051(uVar17,uVar19);
    local_7c = Ordinal_2020();
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] swing: local_7c(after)=%d\n", (int)(short)local_7c);
  }
  uVar17 = Ordinal_2032((int)(short)local_7c);
  uVar17 = Ordinal_2026(uVar17,0x38000000);
  Ordinal_2026(uVar17,0x43340000);
  for (sVar13 = Ordinal_2020(); 0x168 < sVar13; sVar13 = sVar13 + -0x168) {
  }
  for (; sVar13 < 0; sVar13 = sVar13 + 0x168) {
  }
  /* General object tuner (UW_MODEL_TUNER=1) -- runs for every catalog
     this path draws, not just doors, so whatever real .E-model object
     is currently on screen (boulder, bridge, door frame, ...) gets a
     live rotation_offset field. Reset to 0 whenever the catalog on
     screen changes so a leftover rotation from tuning one object
     doesn't silently carry into the next. Applied directly to the
     model's own real final rotation angle (degrees) before it's handed
     to build_euler_rotation_matrix -- nudging this while walking around
     an object spins the OBJECT, letting every face's true orientation
     be checked without needing to physically walk a full circle around
     it in the level (not always possible -- against a wall, etc). Door-
     specific fields (wide_center/edge_offset) stay conditional on
     catalog_u==1 in the SAME panel/dbgui_begin call, since dbgui_begin
     resets the field list each time it's called and only one object's
     panel can be shown per frame anyway (whichever ran last). */
  if ((int)catalog_u != g_tune_last_catalog) {
    g_tune_last_catalog = (int)catalog_u;
    g_tune_rotation_offset = 0.0;
  }
  /* Was gated behind UW_MODEL_TUNER=1 -- on unconditionally now, per
     direct request ("turn the debug panel on by default instead of
     needing an env var"), so no relaunch-with-env-var step is needed
     to use it. Still only POPULATES the field list here; the panel
     itself stays hidden until backtick (dbgui_visible()/g_visible in
     debug_ui.c, unchanged), so this has zero effect on normal play or
     any of the regression demo scripts -- none of them press backtick. */
  { char _tune_title[48];
    snprintf(_tune_title, sizeof(_tune_title), "Object Tuner (catalog=%d)", (int)catalog_u);
    dbgui_begin(_tune_title);
    dbgui_field_double("rotation_offset", &g_tune_rotation_offset, 5.0);
    /* HACK: was `if (catalog_u == 1)` / `if (catalog_u == 0xe || 0xf)`
       separately -- each door-related tunable only showed up in the
       panel on whichever exact catalog happened to be the LAST thing
       drawn in the whole frame (dbgui_begin's own field list resets on
       every single catalog change, not once per door), so with a
       frame/leaf pair (or any other scene content) drawing in between,
       the panel would show catalog=1's row often and catalog=0xe/0xf's
       hardly ever, or vice versa, depending on draw order -- confirmed
       live via QA report ("only able to tune leaf_hinge_offset on
       doors of type 14, not 1"). Show every door-family tunable
       together whenever ANY door catalog (frame or either leaf id)
       last drew, instead of splitting them by exact catalog, so
       whichever one happens to land last this frame still exposes the
       whole set. */
    if ((catalog_u == 1) || (catalog_u == 0xe) || (catalog_u == 0xf)) {
      dbgui_field_double("wide_center", &g_tune_wide_center, 1.0);
      dbgui_field_double("edge_offset", &g_tune_edge_offset, 1.0);
      dbgui_field_double("leaf_hinge_offset", &g_tune_leaf_hinge_offset, 8.0);
    }
    dbgui_field_button("dump_3d_frame", uw_debug_request_3d_frame_dump);
    dbgui_field_toggle("hide_walls", &g_uw_hide_walls);
    dbgui_field_toggle("pick_diag", &g_uw_debug_pick_diag);
    dbgui_end();
  }
  sVar13 = (short)((int)sVar13 + (int)g_tune_rotation_offset);
  for (; 0x168 < sVar13; sVar13 = sVar13 + -0x168) {
  }
  for (; sVar13 < 0; sVar13 = sVar13 + 0x168) {
  }
  /* Real fix for the QA report "door frame... offset 16 units into the
     wall... depending on direction" -- the generic per-object anchor
     emit_tile_features computed is a floor-item slot position (one of
     8 sub-tile slots, 32 units apart); it can land near a tile's true
     center (128 from the tile's own origin) but, with only 8 discrete
     slots, can never land exactly ON it (the two closest slots, 3 and
     4, are 112/144 -- each 16 units off from 128, confirmed live via
     UW_DEBUG_DOOR_POS's tile-grid dump). A full-tile-wide object like
     DFRAME.E needs its along-the-wall axis at the tile's EXACT center,
     not a slot approximation -- confirmed via a fresh Ghidra decompile
     of process_visible_tile_cell that wall vertices themselves sit at
     exact tile boundaries (`tileIndex * 256`), never slot-quantized.
     Recompute both axes from the tile grid index: the axis DFRAME.E's
     own wide local X rotates into (from the model's real final rotation
     angle, not assumed) gets the tile's exact center; the wall-
     perpendicular axis the model's thin local Z rotates into.

     The perpendicular axis is ALSO the tile's exact center, not an
     edge-relative offset -- live QA via the tuner (g_tune_wide_center/
     g_tune_edge_offset below) confirmed both at 128.0 look correct once
     a separate real bug (the anchor being baked into this model's own
     scratch buffer BEFORE this fix used to run, so only the leaf's
     later, separate call ever picked up an edited value -- see that
     fix's own commit) stopped masking whether the frame was actually
     responding. The earlier "wall has real thickness, perpendicular
     axis sits at edge+16" theory was itself wrong, arrived at while
     that masking bug made the frame look like it needed a different
     number than the leaf when actually neither did -- it just wasn't
     visibly moving. At edge_offset==128 the near/far edge-side branch
     below collapses to the same value either way (128 or 256-128), so
     this is really just "exact tile center on both axes," the edge-
     relative framing kept only because a future non-full-tile-width
     model might genuinely need it. Scoped to catalog_u==1 (DFRAME,
     always drawn first) since DFRAME and the leaf share this same
     anchor. */
  if (catalog_u == 1) {
    /* wide_center/edge_offset are now populated by the general object-
       tuner panel above (see its own comment) -- kept live-editable via
       the SAME globals, just no longer with their own separate
       dbgui_begin call here. */
    double _rad = (double)sVar13 * (3.14159265358979 / 180.0);
    int _wideIsX = fabs(cos(_rad)) > fabs(sin(_rad));
    int _tileOriginX = (int)DAT_0023b4e4 * 256;
    int _tileOriginZ = (int)DAT_0023b4e8 * 256;
    int _wide = (int)g_tune_wide_center;
    int _edge = (int)g_tune_edge_offset;
    if (_wideIsX) {
      DAT_0023b904 = (short)(_tileOriginX + _wide);
      DAT_0023b920 = (short)(_tileOriginZ +
          (((int)(short)DAT_0023b920 - _tileOriginZ < 128) ? _edge : 256 - _edge));
    } else {
      DAT_0023b920 = (short)(_tileOriginZ + _wide);
      DAT_0023b904 = (short)(_tileOriginX +
          (((int)(short)DAT_0023b904 - _tileOriginX < 128) ? _edge : 256 - _edge));
    }
    if (getenv("UW_DEBUG_DOOR_POS"))
      fprintf(stderr, "[doorpos] wall-plane fix: angle=%d wideIsX=%d tileOrigin=(%d,%d) wide=%d edge=%d -> anchor=(%d,%d)\n",
              (int)sVar13, _wideIsX, _tileOriginX, _tileOriginZ, _wide, _edge,
              (int)(short)DAT_0023b904, (int)(short)DAT_0023b920);
    /* REAL BUG (found via QA: "this seems to just tune the door leaf
       position, not the door frame"): the world anchor was already
       baked into THIS model's own scratch buffer (_anim + 0xc08..0xc13,
       the translation build_euler_rotation_matrix/transform_points_by_
       matrix actually apply) several dozen lines above, from whatever
       DAT_0023b904/920 held BEFORE this fix ran -- so adjusting the
       globals here came too late to affect the frame's (catalog_u==1)
       own transform this same call; only the LEAF's separate call
       (catalog_u==14, later, re-running this same bake with the
       by-then-already-modified globals) ever picked up the change.
       Re-bake right here with the corrected values so this call's own
       transform (a few lines below) actually uses them -- same
       Ordinal_2032 float-encode + byte-split writes as the original
       bake, just re-run after the correction instead of before it. */
    uVar17 = Ordinal_2032((int)(short)DAT_0023b904);
    *(char *)(_anim + 0xc08) = (char)uVar17;
    *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
    uVar17 = Ordinal_2032((int)(short)DAT_0023b91c);
    *(char *)(_anim + 0xc0c) = (char)uVar17;
    *(char *)(_anim + 0xc0d) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc0e) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc0f) = (char)((uint)uVar17 >> 0x18);
    uVar17 = Ordinal_2032((int)(short)DAT_0023b920);
    *(char *)(_anim + 0xc10) = (char)uVar17;
    *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  }
  /* See g_tune_leaf_hinge_offset's own comment: the leaf currently
     shares DFRAME's own centered anchor as-is (baked into _anim above,
     on catalog_u==1's own earlier call, and simply left in place for
     this call to reuse) -- offset it here, along the same "wide" axis
     wide_center itself offsets, by a live-tunable amount so the pivot
     can be walked over to the real hinge edge visually instead of
     guessed. Zero by default: no behavior change until tuned. */
  if (((catalog_u == 0xe) || (catalog_u == 0xf)) && (g_tune_leaf_hinge_offset != 0.0)) {
    double _rad = (double)sVar13 * (3.14159265358979 / 180.0);
    int _wideIsX = fabs(cos(_rad)) > fabs(sin(_rad));
    int _off = (int)g_tune_leaf_hinge_offset;
    short _hx = DAT_0023b904;
    short _hz = DAT_0023b920;
    if (_wideIsX) {
      _hx = (short)(_hx + _off);
    } else {
      _hz = (short)(_hz + _off);
    }
    if (getenv("UW_DEBUG_DOOR_POS"))
      fprintf(stderr, "[doorpos] leaf hinge offset: angle=%d wideIsX=%d off=%d anchor=(%d,%d)->(%d,%d)\n",
              (int)sVar13, _wideIsX, _off, (int)DAT_0023b904, (int)DAT_0023b920, (int)_hx, (int)_hz);
    uVar17 = Ordinal_2032((int)_hx);
    *(char *)(_anim + 0xc08) = (char)uVar17;
    *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
    uVar17 = Ordinal_2032((int)_hz);
    *(char *)(_anim + 0xc10) = (char)uVar17;
    *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  }
  { int _rec_start = DAT_0023b83c;
  int _vtx_start = DAT_0023b838;
  build_euler_rotation_matrix(_anim,0,(int)sVar13,0);
  transform_points_by_matrix(&DAT_000a85d0,_anim);
  DAT_0023b83c = DAT_000a85d4;
  DAT_0023b838 = DAT_000a85d0;
  if (getenv("UW_DEBUG_DOOR_POS"))
    fprintf(stderr, "[doorpos] catalog=%d emitted records [%d,%d) vtx [%d,%d) faces_remaining_was=%d\n",
            (int)catalog, _rec_start, (int)DAT_0023b83c, _vtx_start, (int)DAT_0023b838, faces_remaining);
  /* transform_points_by_matrix is original, unmodified code -- it has no
     idea g_tile_texptr_emit[] exists. It copies each face's texture
     pointer (texptr) into the arena record's own byte offset +0x18..+0x1b,
     but that's only a 32-bit field, truncating this platform's real 64-bit
     pointer (the SAME bug class as _face_rec/_vptr above, just baked into
     original code this time). This codebase's own rasterizer doesn't even
     read that embedded field for this record format -- EVERY other writer
     of this same 0x60-byte-stride record instead populates the side-
     channel g_tile_texptr_emit[record_index], which this original
     function was never taught to do. Backfill it for every record this
     call just added. */
  { int _ti; for (_ti = _rec_start; _ti < DAT_0023b83c; _ti++) {
      if ((unsigned)_ti < UW_MAX_VIS_TILES) g_tile_texptr_emit[_ti] = texptr;
    }
  }
  /* QA report: "backwards object model face sorting in a boulder
     object... a portion of the floor shows through the boulder,
     because far faces are drawn but near faces are hidden." This
     engine has no z-buffer and no backface culling (confirmed
     repeatedly this session), so a model's own faces are painted in
     whatever order its .E file happens to list its parts -- a face
     physically BEHIND another one, if listed later, simply overdraws
     it, reading as "a hole in the model" with no geometry/winding/UV
     bug involved. This exact fix (depth-sort a model's own just-
     emitted records, farthest-from-camera first, right after they're
     written) was already built, tested, and confirmed live for the
     OLD emit_model_object/g_model_map path this session (git log
     79e78aa on this project's own e-model-texturing branch) -- ported
     here rather than re-invented, adapted only for this function's own
     record range tracking (_rec_start/DAT_0023b83c, already present
     above for the texptr backfill) since the underlying arena record
     format (&DAT_000acde4 family, 0x60-byte stride) and vertex-position
     storage (DAT_000a85d0_backing, 0xc-byte stride) are the exact same
     shared structures transform_points_by_matrix just wrote into --
     confirmed by reading its own field offsets, not assumed. Opt-out
     via UW_MODEL_NO_DEPTH_SORT=1 for A/B comparison; on by default. */
  if (getenv("UW_MODEL_NO_DEPTH_SORT") == 0 && DAT_0023b83c > _rec_start) {
    double _eye_x = *(float *)&DAT_000db438, _eye_y = *(float *)&DAT_000db43c, _eye_z = *(float *)&DAT_000db440;
    int _n = DAT_0023b83c - _rec_start;
    if (_n <= 64) {
      double _dist[64];
      int _order[64];
      int _k;
      for (_k = 0; _k < _n; _k++) {
        int rec = _rec_start + _k;
        int rb = rec * 0x60;
        int iv0 = *(int *)(&DAT_000acde8 + rb);
        int iv1 = *(int *)(&DAT_000acdec + rb);
        int iv2 = *(int *)(&DAT_000acdf0 + rb);
        int iv3 = *(int *)(&DAT_000acdf4 + rb);
        float *p0 = (float *)((char *)DAT_000a85d0_backing + 8 + iv0*0xc);
        float *p1 = (float *)((char *)DAT_000a85d0_backing + 8 + iv1*0xc);
        float *p2 = (float *)((char *)DAT_000a85d0_backing + 8 + iv2*0xc);
        float *p3 = (float *)((char *)DAT_000a85d0_backing + 8 + iv3*0xc);
        double cx = (p0[0]+p1[0]+p2[0]+p3[0]) * 0.25;
        double cy = (p0[1]+p1[1]+p2[1]+p3[1]) * 0.25;
        double cz = (p0[2]+p1[2]+p2[2]+p3[2]) * 0.25;
        double dx = cx - _eye_x, dy = cy - _eye_y, dz = cz - _eye_z;
        _dist[_k] = dx*dx + dy*dy + dz*dz;
        _order[_k] = _k;
        if (getenv("UW_DEBUG_FACE51") && (_k == 50 || _k == 51 || _k == 52)) {
          fprintf(stderr, "[face51] catalog=%d k=%d iv=(%d,%d,%d,%d) p0=(%g,%g,%g) p1=(%g,%g,%g) p2=(%g,%g,%g) p3=(%g,%g,%g)\n",
                  (int)catalog, _k, iv0, iv1, iv2, iv3,
                  p0[0], p0[1], p0[2], p1[0], p1[1], p1[2],
                  p2[0], p2[1], p2[2], p3[0], p3[1], p3[2]);
        }
      }
      /* Small N -- plain insertion sort, descending distance (farthest
         first, so nearer faces paint last and correctly cover them). */
      { int _a;
        for (_a = 1; _a < _n; _a++) {
          int _oi = _order[_a]; double _od = _dist[_oi];
          int _b = _a - 1;
          while (_b >= 0 && _dist[_order[_b]] < _od) { _order[_b+1] = _order[_b]; _b--; }
          _order[_b+1] = _oi;
        }
      }
      if (getenv("UW_DEBUG_MODEL")) {
        int _changed = 0, _kk;
        for (_kk = 0; _kk < _n; _kk++) if (_order[_kk] != _kk) _changed = 1;
        fprintf(stderr, "[model-depthsort] catalog=%d n=%d order_changed=%d order=[", (int)catalog, _n, _changed);
        for (_kk = 0; _kk < _n; _kk++) fprintf(stderr, "%d ", _order[_kk]);
        fprintf(stderr, "] dist=[");
        for (_kk = 0; _kk < _n; _kk++) fprintf(stderr, "%.0f ", _dist[_kk]);
        fprintf(stderr, "]\n");
      }
      /* Apply via cycle-sort in place, whole-record memcpy plus the
         parallel g_tile_texptr_emit[] side channel. */
      { unsigned char _tmp[0x60]; void *_tmp_tex;
        unsigned char _done[64] = {0};
        int _a;
        for (_a = 0; _a < _n; _a++) {
          int _cur, _src;
          if (_done[_a] || _order[_a] == _a) { _done[_a] = 1; continue; }
          _cur = _a;
          memcpy(_tmp, (char *)&DAT_000acde4 + (_rec_start+_a)*0x60, 0x60);
          _tmp_tex = g_tile_texptr_emit[_rec_start+_a];
          while (!_done[_cur]) {
            _src = _order[_cur];
            _done[_cur] = 1;
            if (_src == _a) break;
            memcpy((char *)&DAT_000acde4 + (_rec_start+_cur)*0x60, (char *)&DAT_000acde4 + (_rec_start+_src)*0x60, 0x60);
            g_tile_texptr_emit[_rec_start+_cur] = g_tile_texptr_emit[_rec_start+_src];
            _cur = _src;
          }
          memcpy((char *)&DAT_000acde4 + (_rec_start+_cur)*0x60, _tmp, 0x60);
          g_tile_texptr_emit[_rec_start+_cur] = _tmp_tex;
        }
      }
      if (getenv("UW_DEBUG_MODEL"))
        fprintf(stderr, "[model-depthsort] catalog=%d rec=[%d,%d) eye=(%g,%g,%g)\n",
                (int)catalog, _rec_start, (int)DAT_0023b83c, _eye_x, _eye_y, _eye_z);
    }
  }
  }
  if (local_7a != 0xffff) {
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = FUN_00038a8c(8);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = local_7a - 1 & 1;
    DAT_00189580 = local_7a - 1 & 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
  }
  *DAT_00110fc0 = 0x18;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  return;
}



// WARNING: Removing unreachable block (ram,0x000647ac)

// was FUN_00064384
void emit_anim_object_frames(door_type,obj)
uint door_type;
ushort * obj;

{
  short sVar1;
  int iVar3;
  byte bVar4;
  undefined2 uVar5;
  ushort uVar6;
  ushort uVar7;
  int iVar8;
  undefined4 uVar9;
  uint uVar10;
  uint uVar11;
  bool bVar12;
  char local_38;
  char local_37;
  ushort local_36;
  short local_34;
  short local_32;
  char local_30;
  short local_28;
  short sVar2;
  
  door_type = door_type & 7;
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] emit_anim_object_frames: door_type(cond_idx)=%d rec_word0=0x%04x rec_b1=0x%02x\n",
            door_type, (unsigned)*obj, (unsigned)*(byte *)((char *)obj + 1));
  local_38 = '\0';
  local_37 = '\x01';
  local_34 = -1;
  DAT_0023b834 = 1;
  if (door_type == 6) {
    local_34 = DAT_0023b91c;
    local_38 = '\x01';
    local_37 = -1;
    local_32 = DAT_0023b91c + (short)((*(byte *)((char *)obj + 1) & 0xe) >> 1) * -0x30;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar5 = FUN_00038a8c(5);
    *DAT_00110fc0 = uVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = *(byte *)((char *)obj + 1) >> 1 & 7;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_0018957a = (undefined2)((*(byte *)((char *)obj + 1) & 0xe) >> 1);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] anim_frames(type6): obj0=0x%04x bVar1=0x%02x DAT_0018957a=%d\n",
              (unsigned)*obj, (unsigned)*(byte *)((char *)obj + 1), (int)(short)DAT_0018957a);
    *DAT_00110fc0 = 0x4c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (*(byte *)((char *)obj + 1) >> 1 & 7) * -0x30 + 0xd0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x400;
    sVar1 = local_32;
  }
  else {
    if (((*obj & 0xe00) != 0) || ((*obj & 0x1c0) == 0x1c0)) {
      DAT_0023b91c = DAT_0023b91c + -0xc0;
    }
    sVar1 = DAT_0023b91c;
    bVar4 = *(byte *)((char *)obj + 1);
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    /* Reverting the previous "quality" HACK here: fresh Ghidra headless
       decompiles of this exact function (FUN_00064384) and
       scheduler_step_entry (scheduler_step_entry) from the real UU.exe binary
       (Ghidra project /Users/ccuddigan/Projects/UW1/decomp) prove this
       line's original form -- `(bVar4 >> 1 & 7)` -- was always correct,
       and the earlier "fix" (substituting a fabricated quality-derived
       0/1-times-5 value) was itself the bug, not a fix. `bVar4 >> 1 & 7`
       reads bits 9-11 of the door's own word0 -- the exact bits
       scheduler_step_entry's class-flag-bit-2 branch (`uVar8 == 4` a
       few hundred lines down) directly increments by the elapsed-ticks
       parameter every tick it runs, merged back via the same `& 0xe00`
       / `& 0x1e00` masks. Confirmed live (UW_DEBUG_DOOR): doors' real
       loaded class-7 behavior flags are 0x84 -- bit 2 (0x04) set, bit 0
       (0x01, the quality-ramp path this session's earlier fix wrongly
       assumed doors used) NOT set. Quality (obj[3] & 0x3f) really does
       just flip +8/-8 open/closed in one step (via open_door_object/
       scheduler_finish_entry) -- that part of the earlier analysis was
       right -- it's simply not what drives the swing angle at all; the
       gradual six-to-eight-step sweep the original game shows comes
       entirely from this word0 field via the bit-2 path instead, which
       was already correctly implemented elsewhere in this file and
       simply never got a chance to work because this line was
       overriding its result with a fixed, oversized substitute instead
       of reading it. */
    iVar8 = ((bVar4 >> 5 & 1) * 2 + -1) * (bVar4 >> 1 & 7);
    uVar5 = FUN_00038a8c(5);
    *DAT_00110fc0 = uVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)((uint)(iVar8 * 0x10000000) >> 0x10);
    DAT_0018957a = (undefined2)((iVar8 * 0x10000 >> 0x10) << 0xc);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] anim_frames: door_type=%u obj0=0x%04x bVar4(obj+1)=0x%02x openbits=%d sign=%d iVar8=%d DAT_0018957a=%d quality(obj[3]&0x3f)=%d obj[3]=0x%04x\n",
              door_type, (unsigned)*obj, (unsigned)bVar4, (bVar4 >> 1 & 7), (bVar4 >> 5 & 1), iVar8, (int)(short)DAT_0018957a,
              (int)(obj[3] & 0x3f), (unsigned)obj[3]);
  }
  local_36 = 0x330 - sVar1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x4c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = local_36;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x800;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  if (((*(byte *)((char *)obj + 1) & 0xe) == 0) || (local_34 != -1)) goto LAB_000647e4;
  uVar7 = (obj[1] >> 7) + DAT_0023b4a0 * -2;
  iVar8 = ((int)DAT_0023b904 - (int)g_current_view->view_x) * 0x10000;
  iVar3 = ((int)DAT_0023b920 - (int)g_current_view->view_y) * 0x10000;
  uVar6 = uVar7 & 3;
  if (uVar6 == 0) {
LAB_00064794:
    if (iVar3 < 0) {
LAB_0006479c:
      iVar8 = 1;
    }
    else {
LAB_00064754:
      iVar8 = 0;
    }
  }
  else {
    sVar1 = (short)((uint)iVar8 >> 0x10);
    sVar2 = (short)((uint)iVar3 >> 0x10);
    if (uVar6 == 1) {
      bVar12 = SBORROW4((int)sVar1,-(int)sVar2);
      iVar8 = (int)sVar1 + (int)sVar2;
LAB_00064750:
      if (iVar8 < 0 != bVar12) goto LAB_0006479c;
      goto LAB_00064754;
    }
    iVar3 = iVar8;
    if (uVar6 == 2) goto LAB_00064794;
    if (uVar6 == 3) {
      bVar12 = SBORROW4((int)sVar1,(int)sVar2);
      iVar8 = (int)sVar1 - (int)sVar2;
      goto LAB_00064750;
    }
    iVar8 = (int)local_32;
  }
  if (((int)(((uint)(*(byte *)((char *)obj + 1) >> 5) + (int)((short)(uVar7 & 7) >> 2) + iVar8) *
            0x10000) >> 0x10 & 1U) == 0) {
    local_37 = -1;
    local_38 = '\x01';
  }
LAB_000647e4:
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar7 = FUN_00038a8c(3);
  *DAT_00110fc0 = uVar7;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (*(byte *)((char *)obj + 1) >> 1 & 7) + (ushort)(-1 < local_34);
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189576 = (short)((*(byte *)((char *)obj + 1) & 0xe) >> 1) + (ushort)(-1 < local_34);
  uVar10 = (uint)local_38;
  if (uVar10 < 2) {
    do {
      if ((int)uVar10 < 0) {
        return;
      }
      if (uVar10 == 0) {
        if (DAT_0023b818 < '\x01') {
          FUN_0005e3c0(0,DAT_0023bc88,DAT_0023b91c >> 6 & 0xff,g_current_tile->wall_tex);
        }
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = (short)((uint)((int)DAT_0023b824 * (int)DAT_0023b824) >> 8) * local_36 - 1;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar7 = FUN_00038a8c(7);
        *DAT_00110fc0 = uVar7;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_0023b824 * DAT_0023b824 - 1;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar7 = FUN_00038a8c(6);
        *DAT_00110fc0 = uVar7;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        DAT_0018957e = DAT_0023b824 * DAT_0023b824 + -1;
        DAT_0018957c = DAT_000b4620 + DAT_0023b81c * 8;
        if (DAT_0023b830 != 0) {
          *DAT_00110fc0 = 0xae;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = (g_current_tile->wall_tex) + 0xc0;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          DAT_000da47c = (g_current_tile->wall_tex) + 0xc0;
        }
        *DAT_00110fc0 = 0xb2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_0023b81c;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar9 = 1;
        uVar11 = g_current_tile->wall_tex;
LAB_00064cdc:
        emit_catalog_object(uVar9,obj,(obj[1] >> 7 & 7) << 1,uVar11);
      }
      else {
        if (DAT_0023b830 != 0) {
          *DAT_00110fc0 = 0xae;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = DAT_0023b830 - 1;
          DAT_000da47c = DAT_0023b830 - 1;
          DAT_00110fc0 = DAT_00110fc0 + 1;
        }
        if (local_34 < 0) {
          local_28 = (short)door_type;
          if (local_28 == 7) {
            if (DAT_0023b818 < '\x01') {
              FUN_0005e3c0(0,DAT_0023bc88,DAT_0023b91c >> 6 & 0xff,
                           g_current_tile->wall_tex);
            }
            *DAT_00110fc0 = 0xb2;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_0023b81c;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = 2;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_0023b824 * DAT_0023b824 - 1;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            uVar9 = 0xf;
            uVar11 = g_current_tile->wall_tex;
          }
          else {
            /* Was `DAT_00202734 + door_type + 0x30` -- matches
               load_door_frames's own (fixed) scratch base; see that
               function's comment for why the original binary's
               formula collided with the HUD icon preload range, and
               why the base moved again from 60000 to 20000 (the first
               fix broke a DIFFERENT thing: emit_catalog_object's own
               `frame_or_texid < 0` sentinel check, a signed 16-bit
               comparison -- 60000 wrapped negative as a short and got
               silently reinterpreted as "no frame, use the catalog's
               internal animation" instead of a real frame index). */
            uVar11 = 20000 + door_type;
            uVar9 = 0xe;
          }
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[door] emit_anim_object_frames: local_34=%d local_28=%d -> emit_catalog_object(catalog=%d, heading=%d, frame_or_id=%d)\n",
                    (int)local_34, (int)local_28, (int)uVar9, (int)((obj[1] >> 7 & 7) << 1), (int)uVar11);
          goto LAB_00064cdc;
        }
        DAT_0023b91c = local_34;
        if (getenv("UW_DEBUG_DOOR"))
          fprintf(stderr, "[door] emit_anim_object_frames: local_34=%d -> emit_catalog_object(catalog=0xc, heading=%d, frame_or_id=0)\n",
                  (int)local_34, (int)((obj[1] >> 7 & 7) << 1));
        emit_catalog_object(0xc,obj,(obj[1] >> 7 & 7) << 1,0);
        DAT_0023b91c = local_32;
      }
      local_30 = (char)uVar10;
      uVar10 = ((int)local_37 + (int)local_30) * 0x1000000 >> 0x18;
    } while ((int)uVar10 < 2);
  }
  return;
}



// was FUN_0001e594 -- adds a per-axis float offset (param_2/3/4, each an
// int converted to float via Ordinal_2032) to the model animation
// block's own stored position floats at offsets 0xc08/0xc0c/0xc10 (x/y/z).
// The one real caller (emit_catalog_object, src/models.c) uses it to
// apply a heading-dependent directional offset (looked up from the
// DAT_00086cXX direction tables) before scale_model_part_offsets below
// applies its own per-axis scale -- together these look like the
// position+scale setup for a swinging door/portcullis model's visual
// offset from its tile-grid position.
void apply_model_position_offset(param_1,param_2,param_3,param_4)
char *param_1;  /* was `int` -- truncated the real _anim pointer
                   emit_catalog_object passes in, latent until the
                   DAT_00202c9X object-property fix let real property
                   data reach a nonzero case here */
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  undefined4 uVar1;
  
  uVar1 = Ordinal_2032(param_2);
  uVar1 = Ordinal_2051(*(undefined4 *)(param_1 + 0xc08),uVar1);
  *(char *)(param_1 + 0xc08) = (char)uVar1;
  *(char *)(param_1 + 0xc09) = (char)((uint)uVar1 >> 8);
  *(char *)(param_1 + 0xc0a) = (char)((uint)uVar1 >> 0x10);
  *(char *)(param_1 + 0xc0b) = (char)((uint)uVar1 >> 0x18);
  uVar1 = Ordinal_2032(param_3);
  uVar1 = Ordinal_2051(*(undefined4 *)(param_1 + 0xc0c),uVar1);
  *(char *)(param_1 + 0xc0c) = (char)uVar1;
  *(char *)(param_1 + 0xc0d) = (char)((uint)uVar1 >> 8);
  *(char *)(param_1 + 0xc0e) = (char)((uint)uVar1 >> 0x10);
  *(char *)(param_1 + 0xc0f) = (char)((uint)uVar1 >> 0x18);
  uVar1 = Ordinal_2032(param_4);
  uVar1 = Ordinal_2051(*(undefined4 *)(param_1 + 0xc10),uVar1);
  *(char *)(param_1 + 0xc10) = (char)uVar1;
  *(char *)(param_1 + 0xc11) = (char)((uint)uVar1 >> 8);
  *(char *)(param_1 + 0xc12) = (char)((uint)uVar1 >> 0x10);
  *(char *)(param_1 + 0xc13) = (char)((uint)uVar1 >> 0x18);
  return;
}



// was FUN_0001e6f0 -- multiplies (Ordinal_2026, float MULTIPLY) a model
// animation block's own position floats by per-axis scale factors
// (param_2/3/4). param_1[0] is read as a sub-part count; each iteration
// scales the 3 floats at the current element's own offsets +8/+0xc/+0x10
// (bytes) and then advances by 3 ints (12 bytes) to the next element --
// so this walks an array of per-part transform records, scaling each
// part's position in place. Real call sites (emit_catalog_object,
// src/models.c) use it for door/portcullis-family catalog objects,
// scaling by (1.0,1.2,1.0), (2.5,2.5,2.5) or (2.0,2.0,2.0) depending on
// the specific catalog id -- the exact per-part record layout beyond
// these 3 float fields isn't otherwise confirmed.
void scale_model_part_offsets(param_1,param_2,param_3,param_4)
int * param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  
  iVar3 = 0;
  piVar2 = param_1;
  if (0 < *param_1) {
    do {
      uVar1 = Ordinal_2026(piVar2[2],param_2);
      *(char *)(piVar2 + 2) = (char)uVar1;
      *(char *)((char *)piVar2 + 9) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 10) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xb) = (char)((uint)uVar1 >> 0x18);
      uVar1 = Ordinal_2026(CONCAT13(*(undefined1 *)((char *)piVar2 + 0xf),
                                    CONCAT12(*(undefined1 *)((char *)piVar2 + 0xe),
                                             CONCAT11(*(undefined1 *)((char *)piVar2 + 0xd),
                                                      (char)piVar2[3]))),param_3);
      *(char *)(piVar2 + 3) = (char)uVar1;
      *(char *)((char *)piVar2 + 0xd) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0xe) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xf) = (char)((uint)uVar1 >> 0x18);
      uVar1 = Ordinal_2026(CONCAT13(*(undefined1 *)((char *)piVar2 + 0x13),
                                    CONCAT12(*(undefined1 *)((char *)piVar2 + 0x12),
                                             CONCAT11(*(undefined1 *)((char *)piVar2 + 0x11),
                                                      (char)piVar2[4]))),param_4);
      *(char *)(piVar2 + 4) = (char)uVar1;
      iVar3 = iVar3 + 1;
      *(char *)((char *)piVar2 + 0x11) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x12) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x13) = (char)((uint)uVar1 >> 0x18);
      piVar2 = piVar2 + 3;
    } while (iVar3 < *param_1);
  }
  return;
}


// was FUN_00038680 -- loads every catalog 3D object model (.E files:
// door frame, footbridge, bench, lotus, rocks, arrow, beam, shrine,
// doors, tilemap decals, grave, gate, table, chest, nightstand,
// barrel/closet, chair, bed) via parse_e_model_file into their
// respective geometry buffers, then decompresses a final large shared
// data block. The one-time 3D model-catalog init.
void load_3d_object_models()

{
  parse_e_model_file(s__DATA3D_DFRAME_E_00085620,&DAT_00114c1c,1);
  parse_e_model_file(s__DATA3D_FBRIDGE_E_0008560c,&DAT_00118848,1);
  parse_e_model_file(s__DATA3D_BENCH_E_000855fc,&DAT_0011c474,0);
  parse_e_model_file(s__DATA3D_40LOTUS_E_000855e8,&DAT_001200a0,0);
  parse_e_model_file(s__DATA3D_ROCKSMAL_E_000855d4,&DAT_00123ccc,0);
  parse_e_model_file(s__DATA3D_ROCKMED_E_000855c0,&DAT_001278f8,0);
  parse_e_model_file(s__DATA3D_ROCKBIG_E_000855ac,&DAT_0012b524,1);
  parse_e_model_file(s__DATA3D_ARROW_E_0008559c,&DAT_0012f150,0);
  parse_e_model_file(s__DATA3D_BEAM_E_0008558c,&DAT_00132d7c,0);
  parse_e_model_file(s__DATA3D_NEWPILL_E_00085578,&DAT_001369a8,0);
  parse_e_model_file(s__DATA3D_SHRINE_E_00085564,&DAT_0013a5d4,0);
  parse_e_model_file(s__DATA3D_NEWPORT_E_00085550,&DAT_0013e200,0);
  parse_e_model_file(s__DATA3D_NEWPORT_E_00085550,&DAT_00141e2c,0);
  parse_e_model_file(s__DATA3D_DOOR_E_00085540,&DAT_00145a58,0);
  parse_e_model_file(s__DATA3D_DOOR_E_00085540,&DAT_00149684,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_0014d2b0,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_00150edc,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_00154b08,0);
  parse_e_model_file(s__DATA3D_GRAVE_E_0008551c,&DAT_00158734,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_0015c360,0);
  parse_e_model_file(s__DATA3D_TMAP32X32_E_00085508,&DAT_0015ff8c,0);
  parse_e_model_file(s__DATA3D_TMAP64X64_E_000854f4,&DAT_00163bb8,0);
  parse_e_model_file(s__DATA3D_GATE_E_000854e4,&DAT_001677e4,0);
  parse_e_model_file(s__DATA3D_TABLF3_E_000854d0,&DAT_0016b410,0);
  parse_e_model_file(s__DATA3D_CHEST_E_000854c0,&DAT_0016f03c,0);
  parse_e_model_file(s__DATA3D_NITESTAN_E_000854ac,&DAT_00172c68,0);
  parse_e_model_file(s__DATA3D_BARRCLOS_E_00085498,&DAT_00176894,0);
  parse_e_model_file(s__DATA3D_CHAIRSIM_E_00085484,&DAT_0017a4c0,0);
  parse_e_model_file(s__DATA3D_BED2_E_00085474,&DAT_0017e0ec,0);
  Ordinal_1044(&DAT_00189590,&DAT_00110ff0,0x78580);
  return;
}
