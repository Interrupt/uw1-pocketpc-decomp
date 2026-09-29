/* The dungeon tile map: the tile-record lookup accessor, the per-frame
 * visible-tile walk/collection, per-tile wall/floor/object emission,
 * and the final visible-tile-list rasterization pass. Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/tmap.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00020370
void render_visible_tile_list()

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  int *piVar14;
  int iVar15;
  int iVar16;
  int iVar17;
  void **local_98; // was `undefined4 *`, misaligning the DAT_000c4838 pointer-array walk below now that its elements are real 8-byte pointers
  int local_94;
  /* Ghidra named the 4 words of the viewport-clip-rect struct passed to
     raster_triangle (as param_8) as 4 separate locals. The recompiler is
     free to lay them out in any order / non-contiguously, so param_8[1..3]
     read stack garbage and raster_triangle's `*(int*)(puVar3+8) < param_8[3]`
     never let it call the span rasterizer. Real 4-int array. */
  undefined4 local_70_rect[4];
#define local_70 (local_70_rect[0])
#define local_6c (local_70_rect[1])
#define local_68 (local_70_rect[2])
#define local_64 (local_70_rect[3])
  /* Same bug as local_70_rect above: Ghidra named the 15 words of the
     triangle-vertex struct passed to raster_triangle as param_3 (three
     vertices x 5 floats: x, y, w, u, v) as 15 separate locals. The
     recompiler lays them out non-contiguously, so raster_triangle_perspective_setup /
     raster_edge_setup read stack garbage for every field past [0] -- every
     transformed vertex came out (x,0,0) and the triangle setup produced
     -inf/nan, so no texel was ever sampled. Real 15-float array. */
  undefined4 local_60_arr[15];
#define local_60 (local_60_arr[0])
#define local_5c (local_60_arr[1])
#define local_58 (local_60_arr[2])
#define local_54 (local_60_arr[3])
#define local_50 (local_60_arr[4])
#define local_4c (local_60_arr[5])
#define local_48 (local_60_arr[6])
#define local_44 (local_60_arr[7])
#define local_40 (local_60_arr[8])
#define local_3c (local_60_arr[9])
#define local_38 (local_60_arr[10])
#define local_34 (local_60_arr[11])
#define local_30 (local_60_arr[12])
#define local_2c (local_60_arr[13])
#define local_28 (local_60_arr[14])
  
  local_94 = 0;
  local_70 = DAT_0008462c;
  local_68 = DAT_00084634;
  local_6c = DAT_00084630;
  local_64 = DAT_00084638;
  DEBUG(TRACE, "[tmap-diag] render_visible_tile_list: DAT_000c8c98 (visible-tile count) = %d", DAT_000c8c98);
  if (0 < DAT_000c8c98) {
    local_98 = &DAT_000c4838;
    iVar15 = DAT_000c8c98;
    do {
      piVar14 = (int *)*local_98;
      iVar1 = piVar14[1];
      iVar2 = piVar14[2];
      iVar17 = piVar14[3];
      local_54 = Ordinal_2032(piVar14[0x10]);
      local_50 = Ordinal_2032(piVar14[0x11]);
      iVar16 = 1;
      DEBUG(TRACE, "[tmap-diag] record %d: *piVar14 (point count) = %d", local_94, *piVar14);
      if (1 < *piVar14 + -1) {
        uVar6 = Ordinal_2047(0x3f800000,iVar17);
        uVar7 = Ordinal_2026(iVar17,0x3a2ec33e);
        iVar17 = 0xc;
        do {
          uVar11 = *(undefined4 *)((char *)piVar14 + iVar17 + 4);
          uVar12 = *(undefined4 *)((char *)piVar14 + iVar17 + 8);
          uVar3 = *(undefined4 *)((char *)piVar14 + iVar17 + 0xc);
          local_40 = Ordinal_2032(piVar14[iVar16 * 2 + 0x10]);
          local_3c = Ordinal_2032(piVar14[iVar16 * 2 + 0x11]);
          uVar13 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x10);
          uVar4 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x14);
          uVar5 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x18);
          local_2c = Ordinal_2032(piVar14[iVar16 * 2 + 0x12]);
          local_28 = Ordinal_2032(piVar14[iVar16 * 2 + 0x13]);
          uVar8 = Ordinal_2032(DAT_00084610);
          uVar9 = Ordinal_2026(uVar6,uVar8);
          uVar9 = Ordinal_2026(uVar9,iVar1);
          local_60 = Ordinal_2051(uVar9,0x430c0000);
          uVar9 = Ordinal_2026(uVar6,uVar8);
          uVar9 = Ordinal_2026(uVar9,iVar2);
          uVar9 = Ordinal_2026(uVar9,0x3f666666);
          local_5c = Ordinal_2015(0x42a00000,uVar9);
          local_58 = uVar7;
          uVar9 = Ordinal_2047(0x3f800000,uVar3);
          uVar10 = Ordinal_2026(uVar9,uVar8);
          uVar11 = Ordinal_2026(uVar10,uVar11);
          local_4c = Ordinal_2051(uVar11,0x430c0000);
          uVar11 = Ordinal_2026(uVar9,uVar8);
          uVar11 = Ordinal_2026(uVar11,uVar12);
          uVar11 = Ordinal_2026(uVar11,0x3f666666);
          local_48 = Ordinal_2015(0x42a00000,uVar11);
          local_44 = Ordinal_2026(uVar3,0x3a2ec33e);
          uVar11 = Ordinal_2047(0x3f800000,uVar5);
          uVar12 = Ordinal_2026(uVar11,uVar8);
          uVar13 = Ordinal_2026(uVar12,uVar13);
          local_38 = Ordinal_2051(uVar13,0x430c0000);
          uVar11 = Ordinal_2026(uVar11,uVar8);
          uVar11 = Ordinal_2026(uVar11,uVar4);
          uVar11 = Ordinal_2026(uVar11,0x3f666666);
          local_34 = Ordinal_2015(0x42a00000,uVar11);
          local_30 = Ordinal_2026(uVar5,0x3a2ec33e);
          DAT_000da47c = (undefined2)piVar14[0x1d];
          DEBUG(TRACE, "[tmap-diag] raster_triangle call: tex=0x%x x=%.0f y=%.0f w(0x1c)=%d stride(0x1b)=%d",
                piVar14[0x1e], ((float*)local_60_arr)[0], ((float*)local_60_arr)[1], piVar14[0x1c], piVar14[0x1b]);
          raster_triangle(0x140,g_uw_framebuffer,local_60_arr,piVar14[0x1e],
                       piVar14[0x1b],piVar14[0x1c] * piVar14[0x1b],
                       ((unsigned)local_94 < UW_MAX_VIS_TILES)
                         ? (intptr_t)g_tile_texptr_out[local_94]
                         : (intptr_t)piVar14[0x1a],
                       local_70_rect);
          { char _facetag[32];
            snprintf(_facetag, sizeof(_facetag), "rec%03d_tri%d_tex0x%x", local_94, iVar16, piVar14[0x1e]);
            uw_debug_dump_3d_face(_facetag);
          }
          iVar16 = iVar16 + 1;
          iVar17 = iVar17 + 0xc;
          piVar14 = (int *)*local_98;
          iVar15 = DAT_000c8c98;
        } while (iVar16 < *piVar14 + -1);
      }
      local_94 = local_94 + 1;
      local_98 = local_98 + 1;
    } while (local_94 < iVar15);
  }
  debug_framebuffer_dump("render_visible_tile_list");
  { int _dumped = uw_debug_3d_frame_dump_finish();
    if (_dumped >= 0) {
      char _msg[80];
      snprintf(_msg, sizeof(_msg), "[debug] dumped %d 3D faces to %s\n",
               _dumped, uw_debug_3d_frame_dump_last_dir());
      message_scroll_print_wrapped(_msg);
    }
  }
  return;
}
#undef local_70
#undef local_6c
#undef local_68
#undef local_64
#undef local_60
#undef local_5c
#undef local_58
#undef local_54
#undef local_50
#undef local_4c
#undef local_48
#undef local_44
#undef local_40
#undef local_3c
#undef local_38
#undef local_34
#undef local_30
#undef local_2c
#undef local_28


// was FUN_0005d9cc
void walk_visible_tiles()

{
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  uint uVar6;
  int iVar7;
  byte *pbVar8;
  undefined1 *puVar9;
  
  DAT_0023b818 = 0xe0;
  DAT_0023b4f0 = DAT_0023b4a0 * 4 + UW_B50_LIT(0x86b60);
  iVar4 = DAT_0023b4a0 * 6;
  sVar2 = *(short *)(&DAT_00086a00 + iVar4);
  iVar7 = (int)sVar2;
  sVar3 = *(short *)(&DAT_00086a02 + iVar4);
  puVar9 = &g_visibility_ring_buffer + g_visibility_ring_depth * 0x42;
  pbVar8 = (byte *)(DAT_0023aecc + ((int)sVar3 * (int)g_visibility_ring_depth + iVar7 * -0x10) * 4);
  DAT_0023b814 = tilemap_lookup(0,0);
  DAT_0023b808 = tilemap_lookup(0x3f,0x3f);
  DAT_0023b83c = 0;
  uVar6 = (uint)(short)((int)pbVar8 - (int)DAT_0023b814 >> 2);
  DAT_0023b838 = 0;
  /* Also clear the arena's own count fields (offset 0 = vertex count,
     offset 4 = record count). process_visible_tile_cell normally keeps
     them in step with DAT_0023b838 / DAT_0023b83c as it emits, but a
     frame where it emits nothing (all tiles culled, or the overflow
     guard trips for every tile) would otherwise leave last frame's stale
     counts for near_clip_visible_tiles / render_visible_tile_list to
     re-draw -- the "view stuck on the tiles from the overflow frame" bug. */
  *(int *)((char *)DAT_000a85d0_backing + 0) = 0;
  *(int *)((char *)DAT_000a85d0_backing + 4) = 0;
  if (0x2000 < (int)uVar6) {
    uVar6 = uVar6 - 0x4000;
  }
  update_wall_partition_phase(0xfffffff6);
  DAT_0023b4e8 = g_visibility_ring_depth;
  if (-1 < g_visibility_ring_depth) {
    do {
      update_wall_partition_phase(2);
      sVar1 = (short)uVar6;
      DAT_0023b4e4 = 0;
      uVar6 = (uint)sVar1;
      DAT_0023b820 = puVar9;
      DAT_0023b4ec = pbVar8;
      do {
        if ((uVar6 & 0xf000) == 0) {
          process_visible_tile_cell(&DAT_000b99d0 + (short)uVar6);
        }
        DAT_0023b4e4 = DAT_0023b4e4 + 1;
        DAT_0023b4ec = DAT_0023b4ec + iVar7 * 4;
        DAT_0023b820 = DAT_0023b820 + 2;
        uVar6 = ((short)uVar6 + iVar7) * 0x10000 >> 0x10;
      } while (DAT_0023b4e4 < 0x10);
      update_wall_partition_phase(1);
      iVar4 = 0x20;
      DAT_0023b820 = puVar9 + 0x40;
      DAT_0023b4e4 = 0x20;
      DAT_0023b4ec = pbVar8 + iVar7 * 0x80;
      uVar6 = ((int)sVar1 + iVar7 * 0x20) * 0x10000 >> 0x10;
      do {
        if ((uVar6 & 0xf000) == 0) {
          process_visible_tile_cell(&DAT_000b99d0 + (short)uVar6);
          iVar4 = (int)DAT_0023b4e4;
        }
        DAT_0023b4ec = DAT_0023b4ec + iVar7 * -4;
        iVar4 = iVar4 + -1;
        uVar6 = (int)(short)uVar6 - (int)sVar2;
        DAT_0023b4e4 = (short)iVar4;
        DAT_0023b820 = DAT_0023b820 + -2;
      } while (0x10 < iVar4 * 0x10000 >> 0x10);
      update_wall_partition_phase(0);
      if ((uVar6 * 0x10000 & 0xf0000000) == 0) {
        process_visible_tile_cell(&DAT_000b99d0 + ((int)(uVar6 * 0x10000) >> 0x10));
      }
      puVar9 = puVar9 + -0x42;
      *DAT_00110fc0 = 0xb0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      pbVar8 = pbVar8 + sVar3 * -4;
      iVar4 = (int)DAT_0023b4e8;
      uVar6 = (int)sVar1 - (int)sVar3;
      DAT_0023b4e8 = (short)(iVar4 + -1);
    } while (-1 < (iVar4 + -1) * 0x10000 >> 0x10);
  }
  DAT_0023b4ec = pbVar8;
  pcVar5 = &DAT_000b99d0 + (short)uVar6;
  DAT_0023b4e4 = 0;
  do {
    // HACK: this trailing one-row sweep (33 tiles wide, confirmed via a
    // recorded repro to land one row "behind" the player -- e.g.
    // dy=-1 at heading 0 -- outside the range run_visibility_flood's
    // ring-walk ever populates) has no g_visibility_ring_buffer byte
    // of its own to check at all, unlike process_visible_tile_cell's
    // per-cell reveal (see that function's own bVar25!=0 fix). It was
    // revealing every in-bounds, not-yet-revealed cell unconditionally
    // -- with zero flood/line-of-sight justification -- contributing
    // to the same perfect-rectangle over-reveal bug. No ring-buffer
    // data exists here to check instead, so just stop revealing
    // through this path; genuinely visible tiles still get revealed
    // through the main ring-walk / process_visible_tile_cell above.
    if (0) {
      if (((uVar6 & 0xf000) == 0) && (*pcVar5 == '\0')) {
        *pcVar5 = automap_reveal_byte(DAT_0023b4ec);
      }
    }
    DAT_0023b4e4 = DAT_0023b4e4 + 1;
    DAT_0023b4ec = DAT_0023b4ec + iVar7 * 4;
    uVar6 = ((short)uVar6 + iVar7) * 0x10000 >> 0x10;
    pcVar5 = pcVar5 + iVar7;
  } while (DAT_0023b4e4 < 0x21);
  return;
}




// was FUN_0005e604
void process_visible_tile_cell(param_1)
byte * param_1;

{
  uint uVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  undefined1 uVar8;
  undefined1 uVar9;
  undefined1 uVar10;
  undefined1 uVar11;
  undefined1 uVar12;
  undefined1 uVar13;
  undefined1 uVar14;
  byte bVar15;
  intptr_t iVar16; /* was int -- also holds the DAT_00086e6c view-record pointer */
  undefined4 uVar17;
  int iVar18;
  int iVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  uint uVar22;
  ushort *puVar23;
  undefined1 uVar24;
  byte bVar25;
  ushort uVar26;
  ushort uVar27;
  uint uVar28;
  short *psVar29;
  int iVar30;
  short sVar31;
  int iVar32;
  int iVar33;
  int iVar34;
  byte *pbVar35;
  int iVar36;
  char *pcVar37;
  int iVar38;
  bool bVar39;
  byte local_84;
  byte local_83;
  byte local_81;
  byte local_80;
  uint local_54;
  undefined1 auStack_50 [4];
  uint local_4c;
  uint local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  int local_34;
  uint local_30;
  
  bVar25 = *DAT_0023b820;
  local_48 = (uint)(short)(ushort)bVar25;
  if (getenv("UW_DEBUG_GEOMETRY_DIST")) {
    intptr_t _dcell = (DAT_0023b4ec - (byte *)DAT_002029cc) / 4;
    ushort *_dpp = (ushort *)g_player_object;
    int _dcx = (int)(_dcell & 0x3f), _dcy = (int)(_dcell >> 6);
    int _dpx = (int)(_dpp[0xb] >> 10), _dpy = (int)((_dpp[0xb] & 0x3f0) >> 4);
    int _ddx = _dcx - _dpx; if (_ddx < 0) _ddx = -_ddx;
    int _ddy = _dcy - _dpy; if (_ddy < 0) _ddy = -_ddy;
    fprintf(stderr, "[geom-dist] bit80=%d rawbyte=0x%02x tile=(%d,%d) player=(%d,%d) dist=%d willreveal=%d\n",
            (local_48 & 0x80) != 0, (unsigned)bVar25, _dcx, _dcy, _dpx, _dpy, _ddx > _ddy ? _ddx : _ddy,
            (int)(*param_1 == 0));
  }
  if ((local_48 & 0x80) == 0) {
    // HACK: bVar25==0 means run_visibility_flood's own clearing loop
    // explicitly zeroed this cell -- the ray-flood never touched it at
    // all -- as opposed to a nonzero-but-bit80-clear byte, which would
    // mean the flood *did* reach this cell but just didn't flag it for
    // 3D geometry. Before this check, both cases fell through to the
    // same unconditional reveal, so the wide (~33-tile) rendering-
    // frustum sweep this is called from revealed everything it swept
    // over, touched or not -- confirmed live via a recorded repro
    // (bug-fresh-map.txt): every "far" (>3 tiles) revealed cell had
    // rawbyte==0, while every genuinely-reached near cell was already
    // nonzero with bit 0x80 set. Root cause, not the door/light
    // theories floated earlier (checked and ruled out: the revealed
    // shape was a mathematically perfect rectangle, not a flood-fill
    // following room/door connectivity).
    if ((*param_1 == 0) && (bVar25 != 0)) {
      /* Same floor-texture-aware reveal encoding as walk_visible_tiles's
         ring-walk. Was DAT_00086bf0[type], which made every floor the
         same (all blue, with the earlier reconstruction). */
      *param_1 = automap_reveal_byte(DAT_0023b4ec);
      DAT_0023b810 = DAT_0023b810 + 1;
    }
    flush_pending_tile_features();
    return;
  }
  /* This branch emits a visible tile's 3D geometry slice for the dungeon
     viewport. It now renders a real textured room end to end -- the
     visibility flood-fill (run_visibility_flood / process_reaction_
     entry / compute_visibility_ray_offset / extend_visibility_ray_row) and the
     software span rasterizer (raster_triangle / raster_textured_span)
     were resurrected across this session's commits (see git tags
     milestone-3d-tiles-render, milestone-3d-room). Enabled by default;
     set UW_DISABLE_3D_GEOMETRY to fall back to the automap-reveal-only
     path (the old behaviour). */
  { static int _disabled = -1;
    if (_disabled < 0) _disabled = (getenv("UW_DISABLE_3D_GEOMETRY") != NULL);
    /* Arena overflow guard. The DAT_000a85d0_backing arena packs the raw,
       camera-space and projected vertex arrays at 0x8 / 0x1808 / 0x3008
       (0xc stride), and near_clip_visible_tiles reads a record's stored
       vertex index as `idx*0xc + base + 0x3010` -- so once the vertex
       count passes ~512 the projected coords run into the 0x4814 record
       region and near_clip then dereferences a garbage vertex index
       (wild-pointer crash / black view when looking down a long open
       hallway). Records likewise cap near 490. One tile emits up to ~28
       verts / ~6 records, so stop emitting geometry for further tiles
       well before that; walk_visible_tiles rings outward from the camera,
       so it's the farthest tiles that drop. Test DAT_0023b838 /
       DAT_0023b83c -- the working counters walk_visible_tiles resets each
       frame -- NOT the arena's offset-0 count (which persists and would
       make the guard latch on forever after one overflow). */
    if (_disabled
        || (int)(uint)DAT_0023b838 >= 512 - 28
        || (int)DAT_0023b83c >= 490 - 6) {
      if (*param_1 == 0) {
        *param_1 = automap_reveal_byte(DAT_0023b4ec);
        DAT_0023b810 = DAT_0023b810 + 1;
      }
      return;
    }
  }
  DAT_0023b4d0 = 200;
  bVar15 = g_current_tile->floor_height;
  uVar1 = (uint)bVar15;
  DAT_0023b4e0 = DAT_0023b820[1] & 0xf;
  if (DAT_0023b4e0 < 8) {
    /* `*DAT_0023b4ec >> 10` decompiled from a 16-bit tile-record read
       but DAT_0023b4ec is a byte* here, so as written it always read
       DAT_0023ae40[0]. floor-tex index is byte 1 bits 2-5. Shared
       helper with walk_visible_tiles's ring-walk. */
    local_84 = automap_reveal_byte(DAT_0023b4ec);
  }
  else {
    local_84 = *param_1;
    if (local_84 == 0) {
      local_84 = (&DAT_00086bf0)[g_current_tile->tile_type];
    }
  }
  local_30 = (int)(short)(ushort)bVar25 & 0x44;
  if (local_30 == 4) {
    local_4c = bVar25 & 3;
  }
  else {
    local_4c = 4;
  }
  iVar33 = local_4c * 4;
  pbVar35 = (byte *)(iVar33 + UW_B50_LIT(0x86b70));
  if (local_4c == 4) {
    if (*(short *)(&DAT_00085d20 + uVar1 * 2) < g_current_view->view_elevation) {
LAB_0005e988:
      bVar39 = true;
      goto LAB_0005e7e0;
    }
  }
  else {
    iVar16 = local_4c * 3;
    if (((int)*(short *)(&DAT_00085d20 + (uVar1 + *pbVar35) * 2) -
        (int)g_current_view->view_elevation) * (int)*(char *)(UW_B50_LIT(0x86be1) + iVar16) +
        (DAT_0023b4e8 * 0x100 - (int)g_current_view->view_y) *
        (int)*(char *)(UW_B50_LIT(0x86be2) + iVar16) +
        ((DAT_0023b4e4 + -0x10) * 0x100 - (int)g_current_view->view_x) *
        (int)*(char *)(UW_B50_LIT(0x86be0) + iVar16) < 0) goto LAB_0005e988;
  }
  bVar39 = false;
LAB_0005e7e0:
  DAT_0023b818 = 0xe0;
  iVar16 = DAT_00086e6c;
  if (bVar39) {
    (*DAT_0023b4f4)(auStack_50,DAT_0023b4e0,g_current_tile->floor_tex);
    uVar28 = g_current_tile->floor_tex;
    if ((short)(ushort)DAT_0023b4e0 < DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((DAT_0023b4e0 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      iVar16 = uVar28 + 0x30;
      DAT_0023b4d8 = 0x400;
      uVar24 = 0x20;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
    }
    else {
      iVar16 = uVar28 + 0x6a;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      uVar24 = 0x10;
      DAT_0023b824 = 0x10;
    }
    iVar32 = DAT_0023b83c * 0x60;
    (&DAT_000ace00)[iVar32] = uVar24;
    (&DAT_000ace01)[iVar32] = 0;
    (&DAT_000ace02)[iVar32] = 0;
    (&DAT_000ace03)[iVar32] = 0;
    (&DAT_000ace04)[iVar32] = uVar24;
    (&DAT_000ace05)[iVar32] = 0;
    (&DAT_000ace06)[iVar32] = 0;
    (&DAT_000ace07)[iVar32] = 0;
    { void *_tp = get_texture_page(iVar16); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
    iVar32 = DAT_0023b83c;
    iVar30 = DAT_0023b83c * 0x60;
    (&DAT_000acdfc)[iVar30] = (char)uVar17;
    iVar18 = (int)DAT_0023b4e4;
    (&DAT_000acdfd)[iVar30] = (char)((uint)uVar17 >> 8);
    (&DAT_000acdfe)[iVar30] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000acdff)[iVar30] = (char)((uint)uVar17 >> 0x18);
    sVar31 = DAT_000da47c;
    (&DAT_000ace30)[iVar30] = (char)DAT_000da47c;
    (&DAT_000ace31)[iVar30] = (char)((ushort)sVar31 >> 8);
    cVar2 = (char)(sVar31 >> 0xf);
    (&DAT_000ace32)[iVar30] = cVar2;
    (&DAT_000ace33)[iVar30] = cVar2;
    uVar17 = Ordinal_2032(iVar18 << 8);
    iVar16 = DAT_0023b838;
    iVar34 = DAT_0023b838 * 0xc;
    iVar19 = (int)DAT_0023b4e8;
    (&DAT_000a85d8)[iVar34] = (char)uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85d9)[iVar34] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85da)[iVar34] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85db)[iVar34] = uVar4;
    uVar20 = Ordinal_2032((iVar19 + 1) * 0x100);
    (&DAT_000a85e0)[iVar34] = (char)uVar20;
    uVar5 = (undefined1)((uint)uVar20 >> 8);
    (&DAT_000a85e1)[iVar34] = uVar5;
    uVar6 = (undefined1)((uint)uVar20 >> 0x10);
    (&DAT_000a85e2)[iVar34] = uVar6;
    uVar7 = (undefined1)((uint)uVar20 >> 0x18);
    (&DAT_000a85e3)[iVar34] = uVar7;
    uVar21 = Ordinal_2032((uVar1 + *(byte *)(UW_B50_LIT(0x86b72) + iVar33)) * 0x40);
    (&DAT_000a85dc)[iVar34] = (char)uVar21;
    (&DAT_000a85dd)[iVar34] = (char)((uint)uVar21 >> 8);
    (&DAT_000a85de)[iVar34] = (char)((uint)uVar21 >> 0x10);
    (&DAT_000a85df)[iVar34] = (char)((uint)uVar21 >> 0x18);
    (&DAT_000acde8)[iVar30] = (char)iVar16;
    iVar38 = iVar16 + 1;
    DAT_0023b838 = iVar38;
    (&DAT_000acde9)[iVar30] = (char)((uint)iVar16 >> 8);
    (&DAT_000acdea)[iVar30] = (char)((uint)iVar16 >> 0x10);
    (&DAT_000acdeb)[iVar30] = (char)((uint)iVar16 >> 0x18);
    (&DAT_000ace08)[iVar30] = 0;
    (&DAT_000ace09)[iVar30] = 0;
    (&DAT_000ace0a)[iVar30] = 0;
    (&DAT_000ace0b)[iVar30] = 0;
    (&DAT_000ace0c)[iVar30] = 0;
    (&DAT_000ace0d)[iVar30] = 0;
    (&DAT_000ace0e)[iVar30] = 0;
    (&DAT_000ace0f)[iVar30] = 0;
    iVar34 = iVar38 * 0xc;
    (&DAT_000a85d8)[iVar34] = (char)uVar17;
    (&DAT_000a85d9)[iVar34] = uVar24;
    (&DAT_000a85da)[iVar34] = uVar3;
    (&DAT_000a85db)[iVar34] = uVar4;
    uVar17 = Ordinal_2032(iVar19 << 8);
    (&DAT_000a85e0)[iVar34] = (char)uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85e1)[iVar34] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85e2)[iVar34] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85e3)[iVar34] = uVar4;
    uVar21 = Ordinal_2032((uVar1 + *pbVar35) * 0x40);
    (&DAT_000a85dc)[iVar34] = (char)uVar21;
    (&DAT_000a85dd)[iVar34] = (char)((uint)uVar21 >> 8);
    (&DAT_000a85de)[iVar34] = (char)((uint)uVar21 >> 0x10);
    (&DAT_000a85df)[iVar34] = (char)((uint)uVar21 >> 0x18);
    (&DAT_000acdec)[iVar30] = (char)iVar38;
    iVar34 = iVar16 + 2;
    DAT_0023b838 = iVar34;
    (&DAT_000acded)[iVar30] = (char)((uint)iVar38 >> 8);
    (&DAT_000acdee)[iVar30] = (char)((uint)iVar38 >> 0x10);
    (&DAT_000acdef)[iVar30] = (char)((uint)iVar38 >> 0x18);
    (&DAT_000ace10)[iVar30] = 0;
    (&DAT_000ace11)[iVar30] = 0;
    (&DAT_000ace12)[iVar30] = 0;
    (&DAT_000ace13)[iVar30] = 0;
    iVar19 = DAT_0023b824 + -1;
    uVar8 = (undefined1)iVar19;
    (&DAT_000ace14)[iVar30] = uVar8;
    uVar9 = (undefined1)((uint)iVar19 >> 8);
    (&DAT_000ace15)[iVar30] = uVar9;
    uVar10 = (undefined1)((uint)iVar19 >> 0x10);
    (&DAT_000ace16)[iVar30] = uVar10;
    uVar11 = (undefined1)((uint)iVar19 >> 0x18);
    (&DAT_000ace17)[iVar30] = uVar11;
    uVar21 = Ordinal_2032((iVar18 + 1) * 0x100);
    iVar18 = iVar34 * 0xc;
    (&DAT_000a85d8)[iVar18] = (char)uVar21;
    uVar12 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar18] = uVar12;
    uVar13 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar18] = uVar13;
    uVar14 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar18] = uVar14;
    (&DAT_000a85e0)[iVar18] = (char)uVar17;
    (&DAT_000a85e1)[iVar18] = uVar24;
    (&DAT_000a85e2)[iVar18] = uVar3;
    (&DAT_000a85e3)[iVar18] = uVar4;
    uVar17 = Ordinal_2032((uVar1 + *(byte *)(UW_B50_LIT(0x86b71) + iVar33)) * 0x40);
    (&DAT_000a85dc)[iVar18] = (char)uVar17;
    (&DAT_000a85dd)[iVar18] = (char)((uint)uVar17 >> 8);
    (&DAT_000a85de)[iVar18] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000a85df)[iVar18] = (char)((uint)uVar17 >> 0x18);
    (&DAT_000acdf0)[iVar30] = (char)iVar34;
    (&DAT_000acdf1)[iVar30] = (char)((uint)iVar34 >> 8);
    (&DAT_000acdf2)[iVar30] = (char)((uint)iVar34 >> 0x10);
    (&DAT_000acdf3)[iVar30] = (char)((uint)iVar34 >> 0x18);
    (&DAT_000ace18)[iVar30] = uVar8;
    iVar19 = iVar16 + 3;
    DAT_0023b838 = iVar19;
    (&DAT_000ace19)[iVar30] = uVar9;
    (&DAT_000ace1a)[iVar30] = uVar10;
    (&DAT_000ace1b)[iVar30] = uVar11;
    (&DAT_000ace1c)[iVar30] = uVar8;
    (&DAT_000ace1d)[iVar30] = uVar9;
    (&DAT_000ace1e)[iVar30] = uVar10;
    (&DAT_000ace1f)[iVar30] = uVar11;
    iVar18 = iVar19 * 0xc;
    (&DAT_000a85d8)[iVar18] = (char)uVar21;
    (&DAT_000a85d9)[iVar18] = uVar12;
    (&DAT_000a85da)[iVar18] = uVar13;
    (&DAT_000a85db)[iVar18] = uVar14;
    (&DAT_000a85e0)[iVar18] = (char)uVar20;
    (&DAT_000a85e1)[iVar18] = uVar5;
    (&DAT_000a85e2)[iVar18] = uVar6;
    (&DAT_000a85e3)[iVar18] = uVar7;
    uVar17 = Ordinal_2032((uVar1 + *(byte *)(UW_B50_LIT(0x86b73) + iVar33)) * 0x40);
    (&DAT_000a85dc)[iVar18] = (char)uVar17;
    (&DAT_000a85dd)[iVar18] = (char)((uint)uVar17 >> 8);
    DAT_000a85d0 = iVar16 + 4;
    DAT_0023b838 = DAT_000a85d0;
    (&DAT_000a85de)[iVar18] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000a85df)[iVar18] = (char)((uint)uVar17 >> 0x18);
    (&DAT_000acdf4)[iVar30] = (char)iVar19;
    (&DAT_000acdf5)[iVar30] = (char)((uint)iVar19 >> 8);
    (&DAT_000acdf6)[iVar30] = (char)((uint)iVar19 >> 0x10);
    (&DAT_000acdf7)[iVar30] = (char)((uint)iVar19 >> 0x18);
    (&DAT_000ace20)[iVar30] = uVar8;
    (&DAT_000ace21)[iVar30] = uVar9;
    (&DAT_000ace22)[iVar30] = uVar10;
    (&DAT_000ace23)[iVar30] = uVar11;
    (&DAT_000ace24)[iVar30] = 0;
    (&DAT_000ace25)[iVar30] = 0;
    (&DAT_000ace26)[iVar30] = 0;
    (&DAT_000ace27)[iVar30] = 0;
    (&DAT_000acde4)[iVar30] = 4;
    (&DAT_000acde5)[iVar30] = 0;
    (&DAT_000acde6)[iVar30] = 0;
    iVar16 = DAT_00086e6c;
    (&DAT_000acde7)[iVar30] = 0;
    if (!g_uw_hide_walls) {
      DAT_000a85d4 = iVar32 + 1;
      DAT_0023b83c = DAT_000a85d4;
    }
  }
  if (*(short *)(iVar16 + 0xe) < 0x3f5) {
    (*DAT_0023b80c)(auStack_50,DAT_0023b4e0,9);
    if ((short)(ushort)DAT_0023b4e0 < DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((DAT_0023b4e0 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      DAT_0023b4d8 = 0x400;
      uVar24 = 0x20;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
      uVar17 = 0x39;
    }
    else {
      uVar17 = 0x73;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      uVar24 = 0x10;
      DAT_0023b824 = 0x10;
    }
    iVar33 = DAT_0023b83c * 0x60;
    (&DAT_000ace00)[iVar33] = uVar24;
    (&DAT_000ace01)[iVar33] = 0;
    (&DAT_000ace02)[iVar33] = 0;
    (&DAT_000ace03)[iVar33] = 0;
    (&DAT_000ace04)[iVar33] = uVar24;
    (&DAT_000ace05)[iVar33] = 0;
    (&DAT_000ace06)[iVar33] = 0;
    (&DAT_000ace07)[iVar33] = 0;
    { void *_tp = get_texture_page(uVar17); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
    iVar19 = DAT_0023b83c * 0x60;
    (&DAT_000acdfc)[iVar19] = (char)uVar17;
    (&DAT_000acdfd)[iVar19] = (char)((uint)uVar17 >> 8);
    (&DAT_000acdfe)[iVar19] = (char)((uint)uVar17 >> 0x10);
    (&DAT_000acdff)[iVar19] = (char)((uint)uVar17 >> 0x18);
    sVar31 = DAT_000da47c;
    (&DAT_000ace30)[iVar19] = (char)DAT_000da47c;
    iVar16 = (int)DAT_0023b4e4;
    (&DAT_000ace31)[iVar19] = (char)((ushort)sVar31 >> 8);
    cVar2 = (char)(sVar31 >> 0xf);
    (&DAT_000ace32)[iVar19] = cVar2;
    (&DAT_000ace33)[iVar19] = cVar2;
    uVar17 = Ordinal_2032(iVar16 << 8);
    iVar18 = DAT_0023b838 * 0xc;
    (&DAT_000a85d8)[iVar18] = (char)uVar17;
    iVar32 = (int)DAT_0023b4e8;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85d9)[iVar18] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85da)[iVar18] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85db)[iVar18] = uVar4;
    uVar20 = Ordinal_2032(iVar32 << 8);
    (&DAT_000a85e0)[iVar18] = (char)uVar20;
    uVar5 = (undefined1)((uint)uVar20 >> 8);
    (&DAT_000a85e1)[iVar18] = uVar5;
    uVar6 = (undefined1)((uint)uVar20 >> 0x10);
    (&DAT_000a85e2)[iVar18] = uVar6;
    uVar7 = (undefined1)((uint)uVar20 >> 0x18);
    (&DAT_000a85e3)[iVar18] = uVar7;
    iVar33 = DAT_0023b838;
    (&DAT_000a85dc)[iVar18] = 0;
    (&DAT_000a85dd)[iVar18] = 0;
    (&DAT_000a85de)[iVar18] = 0x80;
    (&DAT_000a85df)[iVar18] = 0x44;
    (&DAT_000acde8)[iVar19] = (char)iVar33;
    iVar18 = iVar33 + 1;
    iVar30 = iVar18 * 0xc;
    (&DAT_000acde9)[iVar19] = (char)((uint)iVar33 >> 8);
    (&DAT_000acdea)[iVar19] = (char)((uint)iVar33 >> 0x10);
    (&DAT_000acdeb)[iVar19] = (char)((uint)iVar33 >> 0x18);
    (&DAT_000ace08)[iVar19] = 0;
    (&DAT_000ace09)[iVar19] = 0;
    (&DAT_000ace0a)[iVar19] = 0;
    (&DAT_000ace0b)[iVar19] = 0;
    (&DAT_000ace0c)[iVar19] = 0;
    (&DAT_000ace0d)[iVar19] = 0;
    (&DAT_000ace0e)[iVar19] = 0;
    (&DAT_000ace0f)[iVar19] = 0;
    (&DAT_000a85d8)[iVar30] = (char)uVar17;
    (&DAT_000a85d9)[iVar30] = uVar24;
    (&DAT_000a85da)[iVar30] = uVar3;
    (&DAT_000a85db)[iVar30] = uVar4;
    uVar17 = Ordinal_2032((iVar32 + 1) * 0x100);
    (&DAT_000a85e0)[iVar30] = (char)uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    (&DAT_000a85e1)[iVar30] = uVar24;
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    (&DAT_000a85e2)[iVar30] = uVar3;
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    (&DAT_000a85e3)[iVar30] = uVar4;
    (&DAT_000a85dc)[iVar30] = 0;
    (&DAT_000a85dd)[iVar30] = 0;
    (&DAT_000a85de)[iVar30] = 0x80;
    (&DAT_000a85df)[iVar30] = 0x44;
    (&DAT_000acdec)[iVar19] = (char)iVar18;
    (&DAT_000acded)[iVar19] = (char)((uint)iVar18 >> 8);
    (&DAT_000acdee)[iVar19] = (char)((uint)iVar18 >> 0x10);
    (&DAT_000acdef)[iVar19] = (char)((uint)iVar18 >> 0x18);
    (&DAT_000ace10)[iVar19] = 0;
    (&DAT_000ace11)[iVar19] = 0;
    (&DAT_000ace12)[iVar19] = 0;
    (&DAT_000ace13)[iVar19] = 0;
    iVar32 = DAT_0023b824 + -1;
    uVar8 = (undefined1)iVar32;
    (&DAT_000ace14)[iVar19] = uVar8;
    uVar9 = (undefined1)((uint)iVar32 >> 8);
    (&DAT_000ace15)[iVar19] = uVar9;
    uVar10 = (undefined1)((uint)iVar32 >> 0x10);
    (&DAT_000ace16)[iVar19] = uVar10;
    uVar11 = (undefined1)((uint)iVar32 >> 0x18);
    (&DAT_000ace17)[iVar19] = uVar11;
    iVar18 = iVar33 + 2;
    uVar21 = Ordinal_2032((iVar16 + 1) * 0x100);
    iVar16 = iVar18 * 0xc;
    (&DAT_000a85d8)[iVar16] = (char)uVar21;
    uVar12 = (undefined1)((uint)uVar21 >> 8);
    (&DAT_000a85d9)[iVar16] = uVar12;
    uVar13 = (undefined1)((uint)uVar21 >> 0x10);
    (&DAT_000a85da)[iVar16] = uVar13;
    uVar14 = (undefined1)((uint)uVar21 >> 0x18);
    (&DAT_000a85db)[iVar16] = uVar14;
    (&DAT_000a85e0)[iVar16] = (char)uVar17;
    (&DAT_000a85e1)[iVar16] = uVar24;
    (&DAT_000a85e2)[iVar16] = uVar3;
    (&DAT_000a85e3)[iVar16] = uVar4;
    (&DAT_000a85dc)[iVar16] = 0;
    (&DAT_000a85dd)[iVar16] = 0;
    (&DAT_000a85de)[iVar16] = 0x80;
    (&DAT_000a85df)[iVar16] = 0x44;
    (&DAT_000acdf0)[iVar19] = (char)iVar18;
    iVar32 = iVar33 + 3;
    (&DAT_000acdf1)[iVar19] = (char)((uint)iVar18 >> 8);
    (&DAT_000acdf2)[iVar19] = (char)((uint)iVar18 >> 0x10);
    (&DAT_000acdf3)[iVar19] = (char)((uint)iVar18 >> 0x18);
    (&DAT_000ace18)[iVar19] = uVar8;
    (&DAT_000ace19)[iVar19] = uVar9;
    (&DAT_000ace1a)[iVar19] = uVar10;
    (&DAT_000ace1b)[iVar19] = uVar11;
    (&DAT_000ace1c)[iVar19] = uVar8;
    (&DAT_000ace1d)[iVar19] = uVar9;
    (&DAT_000ace1e)[iVar19] = uVar10;
    (&DAT_000ace1f)[iVar19] = uVar11;
    iVar16 = iVar32 * 0xc;
    (&DAT_000a85d8)[iVar16] = (char)uVar21;
    (&DAT_000a85d9)[iVar16] = uVar12;
    (&DAT_000a85da)[iVar16] = uVar13;
    (&DAT_000a85db)[iVar16] = uVar14;
    (&DAT_000a85e0)[iVar16] = (char)uVar20;
    DAT_000a85d0 = iVar33 + 4;
    (&DAT_000a85e1)[iVar16] = uVar5;
    DAT_0023b838 = DAT_000a85d0;
    (&DAT_000a85e2)[iVar16] = uVar6;
    (&DAT_000a85e3)[iVar16] = uVar7;
    (&DAT_000a85dc)[iVar16] = 0;
    (&DAT_000a85dd)[iVar16] = 0;
    (&DAT_000a85de)[iVar16] = 0x80;
    (&DAT_000a85df)[iVar16] = 0x44;
    (&DAT_000acdf4)[iVar19] = (char)iVar32;
    (&DAT_000acdf5)[iVar19] = (char)((uint)iVar32 >> 8);
    iVar16 = DAT_00086e6c;
    (&DAT_000acdf6)[iVar19] = (char)((uint)iVar32 >> 0x10);
    (&DAT_000acdf7)[iVar19] = (char)((uint)iVar32 >> 0x18);
    (&DAT_000ace20)[iVar19] = uVar8;
    (&DAT_000ace21)[iVar19] = uVar9;
    (&DAT_000ace22)[iVar19] = uVar10;
    (&DAT_000ace23)[iVar19] = uVar11;
    (&DAT_000ace24)[iVar19] = 0;
    (&DAT_000ace25)[iVar19] = 0;
    (&DAT_000ace26)[iVar19] = 0;
    (&DAT_000ace27)[iVar19] = 0;
    (&DAT_000acde4)[iVar19] = 4;
    (&DAT_000acde5)[iVar19] = 0;
    (&DAT_000acde6)[iVar19] = 0;
    (&DAT_000acde7)[iVar19] = 0;
    if (!g_uw_hide_walls) {
      DAT_000a85d4 = DAT_0023b83c + 1;
      DAT_0023b83c = DAT_000a85d4;
    }
  }
  DAT_0023b818 = 0;
  local_54 = 0;
  puVar23 = DAT_0023b4ec;
  uVar27 = 0x40;
  local_83 = DAT_0023b4e0;
  bVar25 = DAT_0023b4e0;
  do {
    if (((short)uVar27 >> 1 & (ushort)local_48) != 0) {
      iVar33 = local_54 * 6;
      if ((DAT_0023b820[1] & uVar27) == 0) {
        local_81 = 0x10;
        local_80 = 0x10;
        iVar16 = ((-uVar1 & 0xff) - (uint)*(byte *)(UW_B50_LIT(0x86b90) + local_54 * 5 + local_4c)) + 0x10;
      }
      else {
        local_81 = (byte)puVar23[*(short *)(&DAT_00086a00 +
                                           (DAT_0023b4a0 * 3 + (uint)(byte)(&DAT_00086c00)[local_54]
                                           ) * 2) * 2] >> 4;
        uVar28 = (byte)(&DAT_00086a20)
                       [((byte)puVar23[*(short *)(&DAT_00086a00 +
                                                 (DAT_0023b4a0 * 3 +
                                                 (uint)(byte)(&DAT_00086c00)[local_54]) * 2) * 2] &
                        0xf) + DAT_0023b4a0 * 0x10] - 6;
        if (((&DAT_000878d0)
             [(byte)(&DAT_00086a20)
                    [((byte)puVar23[*(short *)(&DAT_00086a00 +
                                              (DAT_0023b4a0 * 3 +
                                              (uint)(byte)(&DAT_00086c00)[local_54]) * 2) * 2] & 0xf
                     ) + DAT_0023b4a0 * 0x10]] & 0x20) != 0x20) {
          uVar28 = 4;
        }
        uVar28 = uVar28 & 0xff;
        iVar16 = (((uint)*(byte *)(UW_B50_LIT(0x86b90) + (local_54 + 3) * 5 + uVar28) -
                  (uint)*(byte *)(UW_B50_LIT(0x86b90) + local_54 * 5 + local_4c)) - uVar1) + (uint)local_81;
        local_80 = *(char *)((uint)(byte)(&DAT_00086b88)[local_54] + uVar28 * 4 + UW_B50_LIT(0x86b70)) +
                   local_81;
        local_81 = *(char *)((uint)(byte)(&DAT_00086b84)[local_54] + uVar28 * 4 + UW_B50_LIT(0x86b70)) +
                   local_81;
        bVar25 = local_83;
      }
      /* UW1 tile word2 (bytes 2-3) bits 0-5 = wall texture index; word1's
         high byte (byte 1) holds the floor texture / height and was almost
         always 0 here, so every wall drew arena slot 0 (plain grey) instead
         of the level's real -- often mossy -- wall texture. Ghidra read the
         wrong byte. (automap_reveal_byte / the floor path correctly take the
         floor index from byte 1 bits 2-5.) */
      (*DAT_0023b4d4)(auStack_50,bVar25,iVar16,(byte)puVar23[2] & 0x3f);
      uVar26 = (ushort)DAT_0023b4e0;
      bVar25 = (byte)g_current_tile->wall_tex;
      if ((short)uVar26 < DAT_00086b24) {
        DAT_0023b81c = 4;
        if ((uVar26 != 0) || (DAT_00087938 != 'd')) {
          DAT_0023b81c = DAT_00086b30 + 4;
        }
        DAT_0023b4d8 = 0x1000;
        DAT_0023b824 = 0x40;
        sVar31 = (ushort)bVar15 << 10;
      }
      else {
        bVar39 = uVar26 != 0;
        psVar29 = (short *)0x0;
        if (bVar39) {
          psVar29 = &DAT_00086b30;
        }
        DAT_0023b81c = 0;
        bVar25 = bVar25 + 0x3a;
        if (bVar39) {
          psVar29 = (short *)(int)*psVar29;
        }
        if (bVar39) {
          DAT_0023b81c = (short)psVar29;
        }
        sVar31 = (ushort)bVar15 << 6;
        DAT_0023b4d8 = 0x100;
        DAT_0023b824 = 0x10;
      }
      DAT_0023b828 = sVar31 + -1;
      iVar16 = DAT_0023b83c * 0x60;
      uVar24 = (undefined1)DAT_0023b824;
      (&DAT_000ace00)[iVar16] = uVar24;
      (&DAT_000ace01)[iVar16] = 0;
      (&DAT_000ace02)[iVar16] = 0;
      (&DAT_000ace03)[iVar16] = 0;
      (&DAT_000ace04)[iVar16] = uVar24;
      (&DAT_000ace05)[iVar16] = 0;
      (&DAT_000ace06)[iVar16] = 0;
      (&DAT_000ace07)[iVar16] = 0;
      { void *_tp = get_texture_page(bVar25); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
      iVar32 = DAT_0023b83c;
      iVar18 = DAT_0023b83c * 0x60;
      (&DAT_000acdfc)[iVar18] = (char)uVar17;
      (&DAT_000acdfd)[iVar18] = (char)((uint)uVar17 >> 8);
      (&DAT_000acdfe)[iVar18] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000acdff)[iVar18] = (char)((uint)uVar17 >> 0x18);
      sVar31 = DAT_000da47c;
      (&DAT_000ace30)[iVar18] = (char)DAT_000da47c;
      iVar19 = (int)DAT_0023b4e4;
      (&DAT_000ace31)[iVar18] = (char)((ushort)sVar31 >> 8);
      cVar2 = (char)(sVar31 >> 0xf);
      (&DAT_000ace32)[iVar18] = cVar2;
      (&DAT_000ace33)[iVar18] = cVar2;
      local_34 = iVar18;
      local_44 = Ordinal_2032((iVar19 + (uint)(byte)(&DAT_00086bb0)[iVar33]) * 0x100);
      iVar16 = DAT_0023b838;
      iVar34 = DAT_0023b838 * 0xc;
      (&DAT_000a85d8)[iVar34] = (char)local_44;
      (&DAT_000a85d9)[iVar34] = (char)((uint)local_44 >> 8);
      iVar30 = (int)DAT_0023b4e8;
      (&DAT_000a85da)[iVar34] = (char)((uint)local_44 >> 0x10);
      (&DAT_000a85db)[iVar34] = (char)((uint)local_44 >> 0x18);
      local_40 = Ordinal_2032((iVar30 + (uint)(byte)(&DAT_00086bb1)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar34] = (char)local_40;
      (&DAT_000a85e1)[iVar34] = (char)((uint)local_40 >> 8);
      (&DAT_000a85e2)[iVar34] = (char)((uint)local_40 >> 0x10);
      (&DAT_000a85e3)[iVar34] = (char)((uint)local_40 >> 0x18);
      uVar28 = (uint)local_81 * 0x40;
      uVar22 = 0x400;
      if (local_81 == 0x10 || uVar28 < 0x400) {
        uVar22 = uVar28;
      }
      uVar17 = Ordinal_2032(uVar22);
      (&DAT_000a85dc)[iVar34] = (char)uVar17;
      (&DAT_000a85dd)[iVar34] = (char)((uint)uVar17 >> 8);
      iVar38 = (int)DAT_0023b824;
      (&DAT_000a85de)[iVar34] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000a85df)[iVar34] = (char)((uint)uVar17 >> 0x18);
      (&DAT_000acde8)[iVar18] = (char)iVar16;
      (&DAT_000acde9)[iVar18] = (char)((uint)iVar16 >> 8);
      (&DAT_000acdea)[iVar18] = (char)((uint)iVar16 >> 0x10);
      (&DAT_000acdeb)[iVar18] = (char)((uint)iVar16 >> 0x18);
      (&DAT_000ace08)[iVar18] = 0;
      (&DAT_000ace09)[iVar18] = 0;
      (&DAT_000ace0a)[iVar18] = 0;
      (&DAT_000ace0b)[iVar18] = 0;
      uVar17 = Ordinal_2032(iVar38 + -1);
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar34));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar20 = Ordinal_2020();
      (&DAT_000ace0c)[iVar18] = (char)uVar20;
      iVar36 = iVar16 + 1;
      DAT_0023b838 = iVar36;
      (&DAT_000ace0d)[iVar18] = (char)((uint)uVar20 >> 8);
      (&DAT_000ace0e)[iVar18] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace0f)[iVar18] = (char)((uint)uVar20 >> 0x18);
      iVar34 = iVar36 * 0xc;
      (&DAT_000a85d8)[iVar34] = (char)local_44;
      (&DAT_000a85d9)[iVar34] = (char)((uint)local_44 >> 8);
      (&DAT_000a85da)[iVar34] = (char)((uint)local_44 >> 0x10);
      (&DAT_000a85db)[iVar34] = (char)((uint)local_44 >> 0x18);
      (&DAT_000a85e0)[iVar34] = (char)local_40;
      (&DAT_000a85e1)[iVar34] = (char)((uint)local_40 >> 8);
      (&DAT_000a85e2)[iVar34] = (char)((uint)local_40 >> 0x10);
      (&DAT_000a85e3)[iVar34] = (char)((uint)local_40 >> 0x18);
      uVar20 = Ordinal_2032((uVar1 + pbVar35[(byte)(&DAT_00086bb2)[iVar33]]) * 0x40);
      (&DAT_000a85dc)[iVar34] = (char)uVar20;
      (&DAT_000a85dd)[iVar34] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85de)[iVar34] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85df)[iVar34] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000acdec)[iVar18] = (char)iVar36;
      (&DAT_000acded)[iVar18] = (char)((uint)iVar36 >> 8);
      (&DAT_000acdee)[iVar18] = (char)((uint)iVar36 >> 0x10);
      (&DAT_000acdef)[iVar18] = (char)((uint)iVar36 >> 0x18);
      (&DAT_000ace10)[iVar18] = 0;
      (&DAT_000ace11)[iVar18] = 0;
      (&DAT_000ace12)[iVar18] = 0;
      (&DAT_000ace13)[iVar18] = 0;
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar34));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar20 = Ordinal_2020();
      (&DAT_000ace14)[iVar18] = (char)uVar20;
      iVar34 = iVar16 + 2;
      DAT_0023b838 = iVar34;
      (&DAT_000ace15)[iVar18] = (char)((uint)uVar20 >> 8);
      (&DAT_000ace16)[iVar18] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace17)[iVar18] = (char)((uint)uVar20 >> 0x18);
      local_3c = Ordinal_2032((iVar19 + (uint)(byte)(&DAT_00086bb3)[iVar33]) * 0x100);
      iVar19 = iVar34 * 0xc;
      (&DAT_000a85d8)[iVar19] = (char)local_3c;
      (&DAT_000a85d9)[iVar19] = (char)((uint)local_3c >> 8);
      (&DAT_000a85da)[iVar19] = (char)((uint)local_3c >> 0x10);
      (&DAT_000a85db)[iVar19] = (char)((uint)local_3c >> 0x18);
      local_38 = Ordinal_2032((iVar30 + (uint)(byte)(&DAT_00086bb4)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar19] = (char)local_38;
      (&DAT_000a85e1)[iVar19] = (char)((uint)local_38 >> 8);
      (&DAT_000a85e2)[iVar19] = (char)((uint)local_38 >> 0x10);
      (&DAT_000a85e3)[iVar19] = (char)((uint)local_38 >> 0x18);
      uVar20 = Ordinal_2032((uVar1 + pbVar35[(byte)(&DAT_00086bb5)[iVar33]]) * 0x40);
      (&DAT_000a85dc)[iVar19] = (char)uVar20;
      (&DAT_000a85dd)[iVar19] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85de)[iVar19] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85df)[iVar19] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000acdf0)[iVar18] = (char)iVar34;
      (&DAT_000acdf1)[iVar18] = (char)((uint)iVar34 >> 8);
      (&DAT_000acdf2)[iVar18] = (char)((uint)iVar34 >> 0x10);
      (&DAT_000acdf3)[iVar18] = (char)((uint)iVar34 >> 0x18);
      iVar33 = iVar38 + -1;
      (&DAT_000ace18)[iVar18] = (char)iVar33;
      uVar24 = (undefined1)((uint)iVar33 >> 8);
      (&DAT_000ace19)[iVar18] = uVar24;
      uVar3 = (undefined1)((uint)iVar33 >> 0x10);
      (&DAT_000ace1a)[iVar18] = uVar3;
      uVar4 = (undefined1)((uint)iVar33 >> 0x18);
      (&DAT_000ace1b)[iVar18] = uVar4;
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar19));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar20 = Ordinal_2020();
      (&DAT_000ace1c)[iVar18] = (char)uVar20;
      iVar30 = iVar16 + 3;
      (&DAT_000ace1d)[iVar18] = (char)((uint)uVar20 >> 8);
      (&DAT_000ace1e)[iVar18] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace1f)[iVar18] = (char)((uint)uVar20 >> 0x18);
      iVar19 = iVar30 * 0xc;
      (&DAT_000a85d8)[iVar19] = (char)local_3c;
      (&DAT_000a85d9)[iVar19] = (char)((uint)local_3c >> 8);
      (&DAT_000a85da)[iVar19] = (char)((uint)local_3c >> 0x10);
      (&DAT_000a85db)[iVar19] = (char)((uint)local_3c >> 0x18);
      (&DAT_000a85e0)[iVar19] = (char)local_38;
      (&DAT_000a85e1)[iVar19] = (char)((uint)local_38 >> 8);
      (&DAT_000a85e2)[iVar19] = (char)((uint)local_38 >> 0x10);
      (&DAT_000a85e3)[iVar19] = (char)((uint)local_38 >> 0x18);
      uVar28 = (uint)local_80 * 0x40;
      if (local_80 != 0x10 && 0x3ff < uVar28) {
        uVar28 = 0x400;
      }
      uVar20 = Ordinal_2032(uVar28);
      (&DAT_000a85dc)[iVar19] = (char)uVar20;
      (&DAT_000a85dd)[iVar19] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85de)[iVar19] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85df)[iVar19] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000acdf4)[iVar18] = (char)iVar30;
      (&DAT_000acdf5)[iVar18] = (char)((uint)iVar30 >> 8);
      (&DAT_000acdf6)[iVar18] = (char)((uint)iVar30 >> 0x10);
      (&DAT_000acdf7)[iVar18] = (char)((uint)iVar30 >> 0x18);
      (&DAT_000ace20)[iVar18] = (char)iVar33;
      (&DAT_000ace21)[iVar18] = uVar24;
      (&DAT_000ace22)[iVar18] = uVar3;
      (&DAT_000ace23)[iVar18] = uVar4;
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar19));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar17 = Ordinal_2020();
      (&DAT_000ace24)[iVar18] = (char)uVar17;
      (&DAT_000ace25)[iVar18] = (char)((uint)uVar17 >> 8);
      (&DAT_000ace26)[iVar18] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000ace27)[iVar18] = (char)((uint)uVar17 >> 0x18);
      DAT_000a85d0 = iVar16 + 4;
      DAT_0023b838 = DAT_000a85d0;
      while ((*(int *)(&DAT_000ace14 + local_34) < 0 || (*(int *)(&DAT_000ace1c + local_34) < 0))) {
        iVar33 = *(int *)(&DAT_000ace0c + local_34) + iVar38;
        (&DAT_000ace0c)[iVar18] = (char)iVar33;
        (&DAT_000ace0d)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace0e)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace0f)[iVar18] = (char)((uint)iVar33 >> 0x18);
        iVar33 = *(int *)(&DAT_000ace14 + local_34) + iVar38;
        (&DAT_000ace14)[iVar18] = (char)iVar33;
        (&DAT_000ace15)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace16)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace17)[iVar18] = (char)((uint)iVar33 >> 0x18);
        iVar33 = *(int *)(&DAT_000ace1c + local_34) + iVar38;
        (&DAT_000ace1c)[iVar18] = (char)iVar33;
        (&DAT_000ace1d)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace1e)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace1f)[iVar18] = (char)((uint)iVar33 >> 0x18);
        iVar33 = *(int *)(&DAT_000ace24 + local_34) + iVar38;
        (&DAT_000ace24)[iVar18] = (char)iVar33;
        (&DAT_000ace25)[iVar18] = (char)((uint)iVar33 >> 8);
        (&DAT_000ace26)[iVar18] = (char)((uint)iVar33 >> 0x10);
        (&DAT_000ace27)[iVar18] = (char)((uint)iVar33 >> 0x18);
      }
      (&DAT_000acde4)[iVar18] = 4;
      (&DAT_000acde5)[iVar18] = 0;
      (&DAT_000acde6)[iVar18] = 0;
      (&DAT_000acde7)[iVar18] = 0;
      if (!g_uw_hide_walls) DAT_000a85d4 = iVar32 + 1;
      local_83 = DAT_0023b4e0;
      puVar23 = DAT_0023b4ec;
      iVar16 = DAT_00086e6c;
      bVar25 = DAT_0023b4e0;
      if (!g_uw_hide_walls) DAT_0023b83c = DAT_000a85d4;
    }
    local_54 = local_54 + 1 & 0xff;
    uVar27 = (short)uVar27 >> 1;
  } while (local_54 < 3);
  if (local_30 == 0x44) {
    iVar33 = (local_48 & 3) * 6;
    pcVar37 = &DAT_00086bc8 + iVar33;
    if ((((int)*pcVar37 + (int)DAT_0023b4e4 + -0x10) * 0x100 - (int)*(short *)(iVar16 + 10)) *
        (int)(char)(&DAT_00086bcc)[iVar33] +
        (((int)(char)(&DAT_00086bc9)[iVar33] + (int)DAT_0023b4e8) * 0x100 -
        (int)*(short *)(iVar16 + 0x12)) * (int)(char)(&DAT_00086bcd)[iVar33] < 0) {
      /* diagonal-wall face: same wall-texture-index byte fix as the
         orthogonal branch above (word2 byte 2 bits 0-5, not byte 1). */
      (*DAT_0023b4d4)(auStack_50,bVar25,0x10 - (uint)bVar15,(byte)puVar23[2] & 0x3f);
      uVar27 = (ushort)DAT_0023b4e0;
      bVar25 = (byte)g_current_tile->wall_tex;
      if ((short)uVar27 < DAT_00086b24) {
        DAT_0023b81c = 4;
        if ((uVar27 != 0) || (DAT_00087938 != 'd')) {
          DAT_0023b81c = DAT_00086b30 + 4;
        }
        DAT_0023b4d8 = 0x1000;
        sVar31 = (ushort)bVar15 << 10;
        DAT_0023b824 = 0x40;
      }
      else {
        bVar39 = uVar27 != 0;
        psVar29 = (short *)0x0;
        if (bVar39) {
          psVar29 = &DAT_00086b30;
        }
        DAT_0023b81c = 0;
        if (bVar39) {
          psVar29 = (short *)(int)*psVar29;
        }
        sVar31 = (ushort)bVar15 << 6;
        bVar25 = bVar25 + 0x3a;
        if (bVar39) {
          DAT_0023b81c = (short)psVar29;
        }
        DAT_0023b4d8 = 0x100;
        DAT_0023b824 = 0x10;
      }
      DAT_0023b828 = sVar31 + -1;
      iVar16 = DAT_0023b83c * 0x60;
      uVar24 = (undefined1)DAT_0023b824;
      (&DAT_000ace00)[iVar16] = uVar24;
      (&DAT_000ace01)[iVar16] = 0;
      (&DAT_000ace02)[iVar16] = 0;
      (&DAT_000ace03)[iVar16] = 0;
      (&DAT_000ace04)[iVar16] = uVar24;
      (&DAT_000ace05)[iVar16] = 0;
      (&DAT_000ace06)[iVar16] = 0;
      (&DAT_000ace07)[iVar16] = 0;
      { void *_tp = get_texture_page(bVar25); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
      iVar34 = DAT_0023b83c * 0x60;
      (&DAT_000acdfc)[iVar34] = (char)uVar17;
      (&DAT_000acdfd)[iVar34] = (char)((uint)uVar17 >> 8);
      (&DAT_000acdfe)[iVar34] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000acdff)[iVar34] = (char)((uint)uVar17 >> 0x18);
      sVar31 = DAT_000da47c;
      (&DAT_000ace30)[iVar34] = (char)DAT_000da47c;
      iVar38 = (int)DAT_0023b4e4;
      (&DAT_000ace31)[iVar34] = (char)((ushort)sVar31 >> 8);
      cVar2 = (char)(sVar31 >> 0xf);
      (&DAT_000ace32)[iVar34] = cVar2;
      (&DAT_000ace33)[iVar34] = cVar2;
      iVar32 = DAT_0023b838 * 0xc;
      uVar17 = Ordinal_2032((iVar38 + *pcVar37) * 0x100);
      (&DAT_000a85d8)[iVar32] = (char)uVar17;
      (&DAT_000a85d9)[iVar32] = (char)((uint)uVar17 >> 8);
      iVar18 = (int)DAT_0023b4e8;
      (&DAT_000a85da)[iVar32] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000a85db)[iVar32] = (char)((uint)uVar17 >> 0x18);
      uVar17 = Ordinal_2032((iVar18 + (char)(&DAT_00086bc9)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar32] = (char)uVar17;
      (&DAT_000a85e1)[iVar32] = (char)((uint)uVar17 >> 8);
      (&DAT_000a85e2)[iVar32] = (char)((uint)uVar17 >> 0x10);
      (&DAT_000a85e3)[iVar32] = (char)((uint)uVar17 >> 0x18);
      (&DAT_000a85dc)[iVar32] = 0;
      (&DAT_000a85dd)[iVar32] = 0;
      (&DAT_000a85de)[iVar32] = 0x80;
      (&DAT_000a85df)[iVar32] = 0x44;
      iVar16 = DAT_0023b838;
      (&DAT_000acde8)[iVar34] = (char)DAT_0023b838;
      (&DAT_000acde9)[iVar34] = (char)((uint)iVar16 >> 8);
      (&DAT_000acdea)[iVar34] = (char)((uint)iVar16 >> 0x10);
      (&DAT_000acdeb)[iVar34] = (char)((uint)iVar16 >> 0x18);
      (&DAT_000ace08)[iVar34] = 0;
      (&DAT_000ace09)[iVar34] = 0;
      (&DAT_000ace0a)[iVar34] = 0;
      (&DAT_000ace0b)[iVar34] = 0;
      iVar19 = DAT_0023b824 + -1;
      /* Ghidra dropped the argument: this is Ordinal_2032(iVar19), the
         int->float of (texture_size - 1) used as the V-texcoord scale for
         all four corners of this tile-emit branch -- exactly as the sibling
         branch does at the `Ordinal_2032(iVar38 + -1)` site above. Left
         no-arg, uVar17 took a stale register (the 512.0f / 1024.0f literal
         bit pattern from the projection scratch), so every V texcoord this
         branch emitted came out as ~1.14e9 -> the back-wall dither and
         part of the ceiling breakup in the 3D view. */
      uVar17 = Ordinal_2032(iVar19);
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar32));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar20 = Ordinal_2020();
      (&DAT_000ace0c)[iVar34] = (char)uVar20;
      (&DAT_000ace0d)[iVar34] = (char)((uint)uVar20 >> 8);
      iVar32 = iVar16 + 1;
      DAT_0023b838 = iVar32;
      (&DAT_000ace0e)[iVar34] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace0f)[iVar34] = (char)((uint)uVar20 >> 0x18);
      iVar30 = iVar32 * 0xc;
      uVar20 = Ordinal_2032((iVar38 + *pcVar37) * 0x100);
      (&DAT_000a85d8)[iVar30] = (char)uVar20;
      (&DAT_000a85d9)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85da)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85db)[iVar30] = (char)((uint)uVar20 >> 0x18);
      uVar20 = Ordinal_2032((iVar18 + (char)(&DAT_00086bc9)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar30] = (char)uVar20;
      (&DAT_000a85e1)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85e2)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85e3)[iVar30] = (char)((uint)uVar20 >> 0x18);
      local_30 = Ordinal_2032(uVar1 << 6);
      (&DAT_000a85dc)[iVar30] = (char)local_30;
      (&DAT_000a85dd)[iVar30] = (char)(local_30 >> 8);
      (&DAT_000a85de)[iVar30] = (char)(local_30 >> 0x10);
      (&DAT_000a85df)[iVar30] = (char)(local_30 >> 0x18);
      (&DAT_000acdec)[iVar34] = (char)iVar32;
      (&DAT_000acded)[iVar34] = (char)((uint)iVar32 >> 8);
      (&DAT_000acdee)[iVar34] = (char)((uint)iVar32 >> 0x10);
      (&DAT_000acdef)[iVar34] = (char)((uint)iVar32 >> 0x18);
      (&DAT_000ace10)[iVar34] = 0;
      (&DAT_000ace11)[iVar34] = 0;
      (&DAT_000ace12)[iVar34] = 0;
      (&DAT_000ace13)[iVar34] = 0;
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar30));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar20 = Ordinal_2020();
      (&DAT_000ace14)[iVar34] = (char)uVar20;
      (&DAT_000ace15)[iVar34] = (char)((uint)uVar20 >> 8);
      iVar32 = iVar16 + 2;
      DAT_0023b838 = iVar32;
      (&DAT_000ace16)[iVar34] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000ace17)[iVar34] = (char)((uint)uVar20 >> 0x18);
      iVar30 = iVar32 * 0xc;
      uVar20 = Ordinal_2032((iVar38 + (char)(&DAT_00086bca)[iVar33]) * 0x100);
      (&DAT_000a85d8)[iVar30] = (char)uVar20;
      (&DAT_000a85d9)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85da)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85db)[iVar30] = (char)((uint)uVar20 >> 0x18);
      uVar20 = Ordinal_2032((iVar18 + (char)(&DAT_00086bcb)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar30] = (char)uVar20;
      (&DAT_000a85e1)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85e2)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85e3)[iVar30] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000a85dc)[iVar30] = (char)local_30;
      (&DAT_000a85dd)[iVar30] = (char)(local_30 >> 8);
      (&DAT_000a85de)[iVar30] = (char)(local_30 >> 0x10);
      (&DAT_000a85df)[iVar30] = (char)(local_30 >> 0x18);
      (&DAT_000acdf0)[iVar34] = (char)iVar32;
      (&DAT_000acdf1)[iVar34] = (char)((uint)iVar32 >> 8);
      (&DAT_000acdf2)[iVar34] = (char)((uint)iVar32 >> 0x10);
      (&DAT_000acdf3)[iVar34] = (char)((uint)iVar32 >> 0x18);
      (&DAT_000ace18)[iVar34] = (char)iVar19;
      uVar24 = (undefined1)((uint)iVar19 >> 8);
      (&DAT_000ace19)[iVar34] = uVar24;
      uVar3 = (undefined1)((uint)iVar19 >> 0x10);
      (&DAT_000ace1a)[iVar34] = uVar3;
      uVar4 = (undefined1)((uint)iVar19 >> 0x18);
      (&DAT_000ace1b)[iVar34] = uVar4;
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar30));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar20 = Ordinal_2020();
      (&DAT_000ace1c)[iVar34] = (char)uVar20;
      (&DAT_000ace1d)[iVar34] = (char)((uint)uVar20 >> 8);
      iVar32 = iVar16 + 3;
      DAT_0023b838 = iVar32;
      (&DAT_000ace1e)[iVar34] = (char)((uint)uVar20 >> 0x10);
      iVar30 = iVar32 * 0xc;
      (&DAT_000ace1f)[iVar34] = (char)((uint)uVar20 >> 0x18);
      uVar20 = Ordinal_2032((iVar38 + (char)(&DAT_00086bca)[iVar33]) * 0x100);
      (&DAT_000a85d8)[iVar30] = (char)uVar20;
      (&DAT_000a85d9)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85da)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85db)[iVar30] = (char)((uint)uVar20 >> 0x18);
      uVar20 = Ordinal_2032((iVar18 + (char)(&DAT_00086bcb)[iVar33]) * 0x100);
      (&DAT_000a85e0)[iVar30] = (char)uVar20;
      (&DAT_000a85e1)[iVar30] = (char)((uint)uVar20 >> 8);
      (&DAT_000a85e2)[iVar30] = (char)((uint)uVar20 >> 0x10);
      (&DAT_000a85e3)[iVar30] = (char)((uint)uVar20 >> 0x18);
      (&DAT_000a85dc)[iVar30] = 0;
      (&DAT_000a85dd)[iVar30] = 0;
      (&DAT_000a85de)[iVar30] = 0x80;
      (&DAT_000a85df)[iVar30] = 0x44;
      (&DAT_000acdf4)[iVar34] = (char)iVar32;
      (&DAT_000acdf5)[iVar34] = (char)((uint)iVar32 >> 8);
      (&DAT_000acdf6)[iVar34] = (char)((uint)iVar32 >> 0x10);
      (&DAT_000acdf7)[iVar34] = (char)((uint)iVar32 >> 0x18);
      (&DAT_000ace20)[iVar34] = (char)iVar19;
      (&DAT_000ace21)[iVar34] = uVar24;
      (&DAT_000ace22)[iVar34] = uVar3;
      (&DAT_000ace23)[iVar34] = uVar4;
      uVar20 = Ordinal_2015(0x44800000,*(undefined4 *)(&DAT_000a85dc + iVar30));
      uVar20 = Ordinal_2026(uVar20,0x3b800000);
      Ordinal_2026(uVar20,uVar17);
      uVar17 = Ordinal_2020();
      (&DAT_000ace24)[iVar34] = (char)uVar17;
      (&DAT_000ace25)[iVar34] = (char)((uint)uVar17 >> 8);
      DAT_000a85d0 = iVar16 + 4;
      DAT_0023b838 = DAT_000a85d0;
      (&DAT_000ace26)[iVar34] = (char)((uint)uVar17 >> 0x10);
      if (!g_uw_hide_walls) {
        DAT_000a85d4 = DAT_0023b83c + 1;
        DAT_0023b83c = DAT_000a85d4;
      }
      (&DAT_000ace27)[iVar34] = (char)((uint)uVar17 >> 0x18);
      (&DAT_000acde4)[iVar34] = 4;
      (&DAT_000acde5)[iVar34] = 0;
      (&DAT_000acde6)[iVar34] = 0;
      (&DAT_000acde7)[iVar34] = 0;
      puVar23 = DAT_0023b4ec;
    }
  }
  /* emit_tile_features renders this tile's animated features and the objects
     sitting on it (doors, switches, bridges, item billboards). It used to
     walk a bogus object count and deref a NULL slot from FUN_000535fc
     because of dropped-arg bugs in it and its callees; those are fixed, so
     it now runs by default. Set UW_DISABLE_TILE_FEATURES to skip it (the
     wall / floor / diagonal geometry for the tile is already emitted above
     via the DAT_0023b4f4/b80c/b4d4 calls). */
  {
    static int _tile_features = -1;
    if (_tile_features < 0)
      _tile_features = (getenv("UW_DISABLE_TILE_FEATURES") == NULL);
    if (_tile_features) {
      emit_tile_features(puVar23 + 1);
    }
  }
  cVar2 = DAT_0023b834;
  if (((puVar23 + 1 != (ushort *)0x0) && (DAT_0023b834 != '\0')) &&
     (DAT_0023b834 = '\0', DAT_0023b4e0 < 8)) {
    local_84 = cVar2 << 6 | local_84;
  }
  if (DAT_00086b20 != 0) {
    *param_1 = local_84;
  }
  return;
}




// Was `int`, truncating the real DAT_002029cc pointer arithmetic result below
// (same pointer-truncation pattern fixed elsewhere this session).
// was FUN_00068100 -- (tileX,tileY) -> 4-byte tile record ptr in the level map, NULL if either coord is outside 0..63
void *tilemap_lookup(param_1,param_2)
short param_1;
short param_2;

{
  char *iVar1;

  /* DAT_002029cc is set once, early (init_level_object_arena/
     reset_level_object_arena, a real malloc'd pointer via Ordinal_1041),
     but has been separately observed (FUN_00066e90's own comment) to no
     longer hold that pointer by later points in a session -- some other
     write elsewhere in this file lands on its storage, a real,
     documented, not-yet-root-caused bug. FUN_00066e90 already guards
     its own use with this same bounds check; tilemap_lookup is the
     single shared accessor behind 70+ call sites, so guard here too
     rather than just the one caller -- confirmed live crashing via a
     wild dereference several calls downstream (object_list_insert_head)
     the first time NPC AI (sync_object_tile_position, reached only after this
     session's other npc_ai_tick/tick_mobile_objects fixes) called this with
     DAT_002029cc already corrupted. Treat a corrupted base the same as
     an out-of-range coordinate: every caller already has to tolerate
     this function's documented NULL return. */
  if ((((int)param_2 & 0xffffffc0U) + ((int)param_1 & 0xffffffc0U) == 0) &&
      ((uintptr_t)DAT_002029cc >= 0x10000)) {
    iVar1 = DAT_002029cc + ((int)param_1 + param_2 * 0x40) * 4;
  }
  else {
    iVar1 = 0;
  }
  return iVar1;
}




// was FUN_00064d34 -- tracks which phase of the per-ring wall/tile
// scan is current (recorded in DAT_0023bb94, read back by bitmap.c's
// sprite-vs-wall depth-partition dispatch) and maintains a rolling
// window of up to 8 recent wall-edge entries
// (DAT_0023b908/DAT_0023b928) across ring boundaries: mode -10/2 does
// a full reset, mode 1 copies the current window into the "previous"
// slot, mode 0 appends the ring's own edge data (trimmed to the 8-
// entry cap). Called once per ring phase from walk_visible_tiles.
// Exact consumer semantics of the wall-edge data are not fully traced
// -- named for its role in the state machine, not a confirmed meaning
// of the buffer contents themselves.
void update_wall_partition_phase(param_1)
char param_1;

{
  uint uVar1;
  uint uVar2;

  if (param_1 == -10) {
    Ordinal_1047(&DAT_0023b940,0,0x252);
  }
  else {
    if (param_1 == '\0') {
      uVar1 = (uint)DAT_0023b908;
      if (uVar1 == 0) {
        DAT_0023bb94 = param_1;
        return;
      }
      uVar2 = (uint)DAT_0023b928;
      if (8 < uVar2 + uVar1) {
        uVar1 = 8 - uVar2;
        DAT_0023b908 = (ushort)uVar1;
      }
      Ordinal_1044(&DAT_0023b928 + uVar2 + 1,&DAT_0023b90a,(uVar1 & 0xffff) << 1);
      DAT_0023b928 = DAT_0023b928 + (short)uVar1;
      DAT_0023bb94 = param_1;
      return;
    }
    if (param_1 == '\x01') {
      Ordinal_1044(&DAT_0023b908,&DAT_0023b928,0x12);
      DAT_0023b928 = 0;
      DAT_0023bb94 = param_1;
      return;
    }
    if (param_1 != '\x02') {
      DAT_0023bb94 = param_1;
      return;
    }
  }
  Ordinal_1047(&DAT_0023b908,0,0x12);
  Ordinal_1047(&DAT_0023b928,0,0x12);
  DAT_0023bb94 = param_1;
  return;
}




// was FUN_00064e3c -- bubble-sorts adjacent-index pairs in
// DAT_0023b8c8/DAT_0023b8c9 (see the array-layout comment on their
// declaration) over [param_1, param_2) by each entry's depth key
// (compute_feature_depth_key's output, cached in DAT_0023bb98). Part
// of emit_tile_features' per-tile object/feature draw-order sort.
void sort_feature_pairs_by_depth(param_1,param_2)
short param_1;
int param_2;

{
  int iVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = (param_2 + -1) * 0x10000 >> 0x10;
  iVar1 = (int)param_1;
  if (iVar1 <= iVar5) {
    iVar4 = iVar1;
    if (iVar5 < iVar1) goto LAB_00064ea8;
    do {
      do {
        cVar3 = (&DAT_0023b8c8)[iVar4];
        iVar2 = (iVar4 + 1) * 0x10000 >> 0x10;
        if ((char)(&DAT_0023bb98)[cVar3 * 4] <
            (char)(&DAT_0023bb98)[(char)(&DAT_0023b8c9)[iVar4] * 4]) {
          (&DAT_0023b8c8)[iVar4] = (&DAT_0023b8c9)[iVar4];
          (&DAT_0023b8c9)[iVar4] = cVar3;
        }
        iVar4 = iVar2;
      } while (iVar2 <= iVar5);
LAB_00064ea8:
      iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
      iVar4 = iVar1;
    } while (iVar1 <= iVar5);
  }
  return;
}



// was FUN_00064ec8 -- initializes DAT_0023b8c8[0..param_1) to the
// identity order (0,1,2,...) before sort_feature_pairs_by_depth
// reorders it.
void init_feature_sort_order(param_1)
short param_1;

{
  int iVar1;
  
  iVar1 = 0;
  if (0 < param_1) {
    do {
      (&DAT_0023b8c8)[iVar1] = (char)iVar1;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < param_1);
  }
  return;
}



/* param_1 (out record) and param_2 (src record) were `int`, truncating
   the real pointers emit_tile_features passes. */
// was FUN_00065210 -- computes a rotated-quad corner's screen X/Y
// offset (param_1[1]/[2]) from a source feature record's facing byte
// (param_2[3]) via the DAT_00086d68/DAT_00086d69 per-view-facing
// corner-index remap table, plus copies a masked flag byte
// (param_2[2] & 0x7f) into param_1[3].
void resolve_billboard_corner_offset(param_1,param_2)
byte *param_1;
byte *param_2;

{
  *(undefined *)(param_1 + 1) =
       (&DAT_00086d68)[((uint)(*(byte *)(param_2 + 3) >> 5) + DAT_0023b4a0 * 8) * 2] +
       (&DAT_00086d68)[((*(byte *)(param_2 + 3) >> 2 & 7) + ((int)DAT_0023b4a0 + 1U & 3) * 8) * 2];
  *(undefined *)(param_1 + 2) =
       (&DAT_00086d69)[((uint)(*(byte *)(param_2 + 3) >> 5) + DAT_0023b4a0 * 8) * 2] +
       (&DAT_00086d69)[((*(byte *)(param_2 + 3) >> 2 & 7) + ((int)DAT_0023b4a0 + 1U & 3) * 8) * 2];
  *(byte *)(param_1 + 3) = *(byte *)(param_2 + 2) & 0x7f;
  return;
}



// was FUN_000652e8 -- computes a feature's draw-order depth key
// (written to param_1[0]) from its X/Y offsets (param_1[1]/[2]),
// combined differently depending on which ring-scan phase is current
// (DAT_0023bb94, see update_wall_partition_phase). Feeds
// sort_feature_pairs_by_depth via DAT_0023bb98.
void compute_feature_depth_key(param_1)
char * param_1;

{
  char cVar1;
  
  if (DAT_0023bb94 == '\0') {
    cVar1 = param_1[2] << 1;
  }
  else if (DAT_0023bb94 == '\x01') {
    cVar1 = param_1[2] + param_1[1] + '\x01';
  }
  else {
    if (DAT_0023bb94 != '\x02') {
      return;
    }
    cVar1 = ('\b' - param_1[1]) + param_1[2];
  }
  *param_1 = cVar1;
  return;
}



// was FUN_00065348 -- flushes any still-pending per-tile feature
// records (a nonzero feature count at the current DAT_0023b940 slot,
// or a nonzero DAT_0023b928 wall-partition entry) via
// emit_tile_features, so nothing queued gets silently dropped.
void flush_pending_tile_features()

{
  if (*(short *)(&DAT_0023b940 + DAT_0023b4e4 * 0x12) != 0) {
    emit_tile_features(0);
  }
  if (DAT_0023b928 != 0) {
    emit_tile_features(0);
  }
  return;
}



// was FUN_00065394
void emit_tile_features(param_1)
ushort * param_1;

{
  int iVar1;
  uint uVar2;
  short sVar3;
  char *puVar4;  /* was `undefined4 uVar4` -- truncated FUN_000535fc's
                    real pointer before forwarding it into
                    resolve_billboard_corner_offset, which dereferences it (offset+2/+3).
                    Confirmed live: the automap full-level sweep
                    (demo_automap.txt) crashed here on tile (23,8), the
                    first tile whose feature-object slot value made
                    FUN_000535fc actually resolve to a real, non-null
                    pointer. */
  ushort *puVar5;
  ushort *puVar6;
  int iVar7;
  char cVar8;
  ushort uVar9;
  uint uVar10;
  ushort uVar11;
  ushort uVar12;
  int iVar13;
  char *pcVar14;
  int iVar15;
  int iVar16;
  short local_38;
  short local_36;
  undefined4 local_34;
  int local_30;

  local_34 = local_34 & 0xffff0000;
  iVar13 = 0;
  local_36 = -1;
  iVar16 = 0;
  iVar7 = 1;
  local_38 = 0;
  iVar15 = (int)DAT_0023b4e4;
  if (*(short *)(&DAT_0023b940 + iVar15 * 0x12) != 0) {
    do {
      iVar1 = (int)(short)iVar13;
      if (8 < iVar1) break;
      uVar9 = *(ushort *)(&DAT_0023b940 + (iVar15 * 9 + (int)(short)iVar7) * 2);
      (&DAT_0023b848)[iVar1] = uVar9 & 0x3ff;
      /* Ghidra dropped the object-slot arg -- with it defaulting to 0,
         FUN_000535fc returned NULL and resolve_billboard_corner_offset below dereferenced it,
         which is why the whole tile-features/object pass was disabled.
         Pass the slot id just stored, like the other FUN_000535fc call
         sites in this function. */
      puVar4 = (char *)FUN_000535fc((int)(short)(&DAT_0023b848)[iVar1]);
      iVar15 = iVar1 * 4;
      pcVar14 = &DAT_0023bb98 + iVar15;
      /* FUN_000535fc legitimately returns NULL for a slot value that
         isn't a currently-populated object (unlike the dropped-arg bug
         fixed just above, this is a real "nothing here" case, not a
         truncation/garbage-argument one) -- resolve_billboard_corner_offset dereferences
         its second argument immediately, so skip it rather than
         crashing. Confirmed live: demo_automap.txt's full-level sweep
         crashed here on tile (30,17), the first tile whose feature
         slot resolved to a genuinely empty object. */
      if (puVar4 != NULL) {
        resolve_billboard_corner_offset(pcVar14,puVar4);
      }
      if ((uVar9 & 0x1000) != 0) {
        if ((uVar9 & 0x2000) == 0) {
          cVar8 = (&DAT_0023bb99)[iVar15] + '\b';
        }
        else {
          cVar8 = (&DAT_0023bb99)[iVar15] + -8;
        }
        (&DAT_0023bb99)[iVar15] = cVar8;
      }
      if ((uVar9 & 0x4000) != 0) {
        (&DAT_0023bb9a)[iVar15] = (&DAT_0023bb9a)[iVar15] + '\b';
      }
      compute_feature_depth_key(pcVar14);
      if ((uVar9 & 0x8000) != 0) {
        *pcVar14 = *pcVar14 + -1;
      }
      local_38 = (short)((uint)((iVar1 + 1) * 0x10000) >> 0x10);
      iVar13 = (int)local_38;
      iVar7 = ((short)iVar7 + 1) * 0x10000 >> 0x10;
      iVar15 = (int)DAT_0023b4e4;
    } while (iVar7 <= (int)(uint)*(ushort *)(&DAT_0023b940 + iVar15 * 0x12));
  }
  if (DAT_0023b928 == 0) {
    *(undefined2 *)(&DAT_0023b940 + DAT_0023b4e4 * 0x12) = 0;
  }
  else {
    /* Ghidra dropped the size argument; the zero-branch above writes the
       same destination as a plain `undefined2`, so this is a 2-byte
       copy. */
    Ordinal_1044(&DAT_0023b940 + DAT_0023b4e4 * 0x12,&DAT_0023b928,2);
  }
  DAT_0023b928 = 0;
  puVar5 = (ushort *)resolve_object_link(param_1);
  do {
    sVar3 = (short)iVar13;
    if ((puVar5 == (ushort *)0x0) || (local_30 = (int)(short)iVar16, 0x3b < local_30)) {
      uVar10 = local_34;
      if (((ushort)local_34 == 0) || (uVar10 = (uint)sVar3, (int)uVar10 < 2)) {
        local_34 = uVar10;
        init_feature_sort_order(iVar13);
        local_34 = (uint)sVar3;
        uVar10 = local_34;
        if (1 < (int)local_34) {
          sort_feature_pairs_by_depth(0,iVar13 + -1);
          uVar10 = local_34;
        }
      }
      else {
        uVar9 = (ushort)local_34 & 0x3f;
        local_34 = uVar10;
        if (((ushort)local_34 & 0xffc0) == 0x5900) {
          sprite_partition_tmap(uVar9,&local_36,iVar13);  /* args dropped by Ghidra; mirrors the sprite_partition_by_depth call below */
        }
        else {
          sprite_partition_by_depth(uVar9,&local_36,iVar13);
        }
        iVar15 = (int)local_36;
        if (1 < local_36) {
          sort_feature_pairs_by_depth(0,iVar15 + -1);
          iVar15 = (int)local_36;
        }
        if ((int)(short)iVar15 < (int)(uVar10 - 2)) {
          sort_feature_pairs_by_depth(iVar15 + 1,iVar13 + -1);
        }
      }
      if (0 < (int)uVar10) {
        iVar15 = 0;
        do {
          cVar8 = (&DAT_0023b8c8)[iVar15];
          puVar5 = (ushort *)FUN_000535fc((int)(short)(&DAT_0023b848)[cVar8]);
          /* Same "FUN_000535fc can legitimately return NULL for an
             empty slot" case as the fix above -- this loop dereferences
             puVar5 immediately below (and passes it to
             emit_tile_objects), so skip this index instead of crashing. */
          if (puVar5 == (ushort *)0x0) {
            iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
            continue;
          }
          iVar7 = cVar8 * 4;
          if (getenv("UW_DEBUG_OBJPOS") && puVar5 && (*puVar5 & 0x1ff) == 0x166)
            fprintf(stderr, "[objpos] cVar8=%d iVar7=%d bb99=%d bb9a=%d b4e4=%d b4e8=%d\n",
                    (int)cVar8, iVar7, (int)(char)(&DAT_0023bb99)[iVar7], (int)(char)(&DAT_0023bb9a)[iVar7],
                    (int)DAT_0023b4e4, (int)DAT_0023b4e8);
          if (getenv("UW_DEBUG_DOOR_POS") && puVar5 && (*puVar5 & 0x1f0) == 0x140)
            fprintf(stderr, "[doorpos] tile-grid: cVar8=%d slot_x=%d slot_z=%d b4e4(tileX)=%d b4e8(tileZ)=%d tile_origin=(%d,%d)\n",
                    (int)cVar8, (int)(char)(&DAT_0023bb99)[iVar7], (int)(char)(&DAT_0023bb9a)[iVar7],
                    (int)DAT_0023b4e4, (int)DAT_0023b4e8,
                    (int)DAT_0023b4e4 * 256, (int)DAT_0023b4e8 * 256);
          DAT_0023b904 = ((short)(char)(&DAT_0023bb99)[iVar7] +
                         (short)((uint)((int)DAT_0023b4e4 << 0x13) >> 0x10)) * 0x20 + 0x10;
          DAT_0023b920 = ((short)(char)(&DAT_0023bb9a)[iVar7] +
                         (short)((uint)((int)DAT_0023b4e8 << 0x13) >> 0x10)) * 0x20 + 0x10;
          if (((*puVar5 & 0x1c0) == 0x40) || (iVar16 = object_ptr_in_arena(puVar5), iVar16 == 0)) {
            DAT_0023b91c = ((byte)puVar5[1] & 0x7f) << 3;
          }
          else {
            DAT_0023b91c = *(short *)((char *)puVar5 + 0xf);
          }
          if (getenv("UW_DEBUG_THROW") && (*puVar5 & 0x1ff) == 0x80)
            fprintf(stderr, "[throw-scrz] sack DAT_0023b91c=%d cam_ref(DAT_00086e6c+0xe)=%d in_arena=%d\n",
                    (int)(short)DAT_0023b91c, (int)g_current_view->view_elevation,
                    (int)object_ptr_in_arena(puVar5));
          if (DAT_0023b830 == '\0') {
            iVar7 = (int)(short)((int)((int)DAT_0023b904 -
                                      ((int)g_current_view->view_x & 0xffU)) >> 5);
            iVar16 = (int)(short)((int)((int)DAT_0023b920 -
                                       ((int)g_current_view->view_y & 0xffU)) >> 5);
            iVar13 = (int)(short)((int)DAT_0023b91c - (int)g_current_view->view_elevation >> 5);
            if (((iVar7 * iVar7 * 0x10000 >> 0x10) + (iVar16 * iVar16 * 0x10000 >> 0x10) +
                (iVar13 * iVar13 * 0x10000 >> 0x10)) * 0x10000 >> 0x10 < 1) {
              sVar3 = 0;
            }
            else {
              sVar3 = FUN_00013774();
            }
            iVar7 = (int)DAT_002506dc + (int)(short)((int)DAT_0025063c * (int)sVar3 >> 6);
            sVar3 = (short)iVar7;
            if (iVar7 * 0x10000 >> 0x10 < 0) {
              sVar3 = 0;
            }
            DAT_0023bc88 = (undefined1)((int)DAT_0025064c + (int)sVar3);
            if (0xe < ((int)DAT_0025064c + (int)sVar3 & 0xffU)) {
              DAT_0023bc88 = 0xe;
            }
          }
          else {
            iVar16 = (char)(&DAT_0023bb99)[iVar7] + 0x40;
            if (iVar16 < 0) {
              iVar16 = (char)(&DAT_0023bb99)[iVar7] + 0x47;
            }
            iVar7 = (int)(char)(&DAT_0023bb9a)[iVar7];
            if (iVar7 < 0) {
              iVar7 = iVar7 + 7;
            }
            DAT_0023b8c4 = ((short)(iVar16 >> 3) + -8) * DAT_0023bc8c +
                           (short)(iVar7 >> 3) * DAT_0023b8c0;
          }
          emit_tile_objects(puVar5);
          iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
        } while (iVar15 < (int)local_34);
      }
      return;
    }
    uVar10 = (uint)(short)(*puVar5 & 0x1ff);
    if ((uVar10 == 0x164) || (((*puVar5 & 0x1f0) == 0x140 || (uVar10 == 0x1cf)))) {
      uVar2 = local_34 >> 0x10;
      local_34 = CONCAT22((short)uVar2,sVar3 + (short)((uVar10 << 0x16) >> 0x10));
LAB_0006574c:
      iVar15 = (int)sVar3;
      pcVar14 = &DAT_0023bb98 + iVar15 * 4;
      resolve_billboard_corner_offset(pcVar14,puVar5);
LAB_00065770:
      compute_feature_depth_key(pcVar14);
      if ((uVar10 & 0x1c0) == 0x1c0) {
        cVar8 = *pcVar14 + -1;
LAB_000657b0:
        *pcVar14 = cVar8;
      }
      else if ((uVar10 & 0x1fe) == 0x16e) {
        cVar8 = *pcVar14 + ' ';
        goto LAB_000657b0;
      }
      (&DAT_0023b848)[iVar15] = *param_1 >> 6;
      if (iVar15 < 0x3c) {
        local_38 = (short)((uint)((iVar15 + 1) * 0x10000) >> 0x10);
        goto LAB_000657f4;
      }
    }
    else {
      if (((&DAT_00202c91)[uVar10 * 0xd] & 8) == 0) goto LAB_0006574c;
      iVar15 = (int)local_38;
      uVar11 = 0;
      iVar7 = iVar15 * 4;
      pcVar14 = &DAT_0023bb98 + iVar7;
      resolve_billboard_corner_offset(pcVar14,puVar5);
      uVar9 = (byte)(&DAT_00202c91)[uVar10 * 0xd] & 7;
      if ((int)(char)(&DAT_0023bb9a)[iVar7] - (int)(short)uVar9 < 0) {
        uVar11 = 0x4000;
      }
      if (DAT_0023bb94 == '\x01') {
        uVar9 = (ushort)((uint)((short)uVar9 * -0x10000) >> 0x10);
      }
      uVar12 = uVar11;
      if (((DAT_0023bb94 != '\0') &&
          (((int)(char)(&DAT_0023bb99)[iVar7] + (int)(short)uVar9 & 0xfffffff8U) != 0)) &&
         (uVar12 = uVar11 | 0x1000, DAT_0023bb94 == '\x02')) {
        uVar12 = uVar11 | 0x3000;
      }
      if (uVar12 == 0) {
LAB_0006576c:
        iVar13 = (int)local_38;
        goto LAB_00065770;
      }
      uVar12 = uVar12 | *param_1 >> 6;
      if ((uVar10 & 0x1c0) == 0x1c0) {
        uVar12 = uVar12 | 0x8000;
      }
      if ((uVar12 & 0x5000) == 0x5000) {
        puVar6 = (ushort *)&DAT_0023b928;
      }
      else {
        if ((uVar12 & 0x4000) == 0) {
          if ((uVar12 & 0x2000) == 0) {
            puVar6 = (ushort *)(&DAT_0023b92e + DAT_0023b4e4 * 0x12);
            goto LAB_0006570c;
          }
          iVar7 = DAT_0023b4e4 + 1;
        }
        else {
          iVar7 = (int)DAT_0023b4e4;
        }
        puVar6 = (ushort *)(&DAT_0023b940 + iVar7 * 0x12);
      }
LAB_0006570c:
      if (8 < *puVar6) goto LAB_0006576c;
      uVar9 = *puVar6 + 1;
      *puVar6 = uVar9;
      puVar6[uVar9] = uVar12;
LAB_000657f4:
      iVar13 = (int)local_38;
    }
    param_1 = puVar5 + 2;
    /* Ghidra dropped the arg -- advance to the next object in the tile's
       chain via the link field at puVar5+2 (== param_1), same as the
       resolve_object_link(param_1) call that primes this loop. */
    puVar5 = (ushort *)resolve_object_link(param_1);
    iVar16 = (local_30 + 1) * 0x10000 >> 0x10;
  } while( true );
}

