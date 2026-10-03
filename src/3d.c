/* The 3D transform/rasterization pipeline: vertex math, view matrix
 * construction, camera-space transform/projection, near-plane
 * clipping, and the triangle rasterizer (edge setup, perspective-
 * correct texture span drawing). Split out of uw.c (the original
 * monolithic decompile) once these functions' real roles were
 * confirmed.
 */
#include "headers/3d.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>




// was FUN_000116a4 -- set the active viewport/clip rectangle (DAT_000a85c4/c8 top-left, DAT_000842a4/a8 bottom-right)
void set_viewport_clip_rect(param_1,param_2,param_3,param_4)
undefined2 param_1;
undefined2 param_2;
undefined2 param_3;
undefined2 param_4;

{
  DAT_000a85c4 = param_1;
  DAT_000a85c8 = param_2;
  DAT_000842a4 = param_3;
  DAT_000842a8 = param_4;
  return;
}




// was FUN_000137c0 -- elementwise 3-float vector subtract, param_3 = param_2
// - param_1. Confirmed by tracing its two call sites in parse_e_model_file
// (was FUN_00020a74): both feed a shared vertex-position array (the
// model's own POINTS, 0xc-byte stride) and the results go straight into
// vec3_cross (was FUN_00013904) as the two edge vectors of a real
// per-face normal computation -- see vec3_cross's own comment for why
// that computed normal never actually gets used.
void vec3_sub(param_1,param_2,param_3)
undefined4 * param_1;
undefined4 * param_2;
undefined1 * param_3;

{
  undefined4 uVar1;
  
  uVar1 = Ordinal_2015(*param_2,*param_1);
  *param_3 = (char)uVar1;
  param_3[1] = (char)((uint)uVar1 >> 8);
  param_3[2] = (char)((uint)uVar1 >> 0x10);
  param_3[3] = (char)((uint)uVar1 >> 0x18);
  uVar1 = Ordinal_2015(param_2[1],param_1[1]);
  param_3[4] = (char)uVar1;
  param_3[5] = (char)((uint)uVar1 >> 8);
  param_3[6] = (char)((uint)uVar1 >> 0x10);
  param_3[7] = (char)((uint)uVar1 >> 0x18);
  uVar1 = Ordinal_2015(param_2[2],param_1[2]);
  param_3[8] = (char)uVar1;
  param_3[9] = (char)((uint)uVar1 >> 8);
  param_3[10] = (char)((uint)uVar1 >> 0x10);
  param_3[0xb] = (char)((uint)uVar1 >> 0x18);
  return;
}



// was FUN_00013904 -- standard 3-float cross product, param_3 = param_1 x
// param_2 (confirmed component-by-component, including the Y term's sign
// flip the textbook formula requires). Its one real caller,
// parse_e_model_file (was FUN_00020a74), uses it to compute each PARTS
// face's real normal (two vec3_sub edge vectors, v1-v0 and v2-v0, crossed
// together) right after reading that face's vertex-index list -- a
// genuine, deliberate per-face normal computation. Traced the real ARM
// disassembly at its call site (0x00021aa4, not just this decompile) to
// rule out a dropped-store decompile bug: the instruction immediately
// after `bl 0x00013904` is unrelated vertex-count bookkeeping, with no
// store of the result anywhere in between. The original shipped binary
// computes this normal and then genuinely never uses it -- not a
// decompile loss, a real dead computation in the original game. See
// object-rendering-findings.txt's UPDATE (7) ("THE .E PARSER COMPUTES A
// REAL FACE NORMAL -- AND THROWS IT AWAY") for the full writeup, and
// UPDATE (8) for the companion finding that UV data doesn't exist in
// this format at all (never computed, unlike this normal).
void vec3_cross(param_1,param_2,param_3)
undefined4 * param_1;
undefined4 * param_2;
undefined1 * param_3;

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  uVar1 = Ordinal_2026(param_1[1],param_2[2]);
  uVar2 = Ordinal_2026(param_1[2],param_2[1]);
  uVar1 = Ordinal_2015(uVar1,uVar2);
  *param_3 = (char)uVar1;
  param_3[1] = (char)((uint)uVar1 >> 8);
  param_3[2] = (char)((uint)uVar1 >> 0x10);
  param_3[3] = (char)((uint)uVar1 >> 0x18);
  uVar1 = Ordinal_2026(param_2[2],*param_1);
  uVar2 = Ordinal_2026(param_1[2],*param_2);
  Ordinal_2015(uVar1,uVar2);
  uVar1 = Ordinal_2023();
  param_3[4] = (char)uVar1;
  param_3[5] = (char)((uint)uVar1 >> 8);
  param_3[6] = (char)((uint)uVar1 >> 0x10);
  param_3[7] = (char)((uint)uVar1 >> 0x18);
  uVar1 = Ordinal_2026(param_2[1],*param_1);
  uVar2 = Ordinal_2026(param_1[1],*param_2);
  uVar1 = Ordinal_2015(uVar1,uVar2);
  param_3[8] = (char)uVar1;
  param_3[9] = (char)((uint)uVar1 >> 8);
  param_3[10] = (char)((uint)uVar1 >> 0x10);
  param_3[0xb] = (char)((uint)uVar1 >> 0x18);
  return;
}




// was FUN_00014350 -- textured-triangle driver: viewport-culls, sorts
// the 3 verts by Y, builds 3 edges via raster_edge_setup, walks
// scanlines stepping edges (raster_edge_step) and emitting spans
// (raster_textured_span)
//
// UW_DEBUG_RASTER=1: logs every call's screen-space verts/clip rect/
// texture id, which of the four bounding-box trivial-reject checks (if
// any) fired, and the final raster_textured_span call count. Added
// while tracing a QA report that a TMAP decal (catalog 22) draws
// visible pixels from the front but none from behind, despite an
// identical raster_triangle call count either way -- confirmed by
// reading the whole function that there is no winding/normal-based
// reject anywhere in it (the only early-outs are the four axis-aligned
// bbox trivial-rejects above, each screen-space-only); a boulder face
// sweep (catalog 7, which self-occludes so a silently-empty back face
// would never have been visually noticed) showed span_calls>0 on every
// one of 52 faces, so whatever's producing the decal's blank back side
// still needs to be traced with this at the decal's own repro position.
void raster_triangle(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8)
undefined4 param_1;
void *param_2; /* was undefined4 -- the framebuffer base (g_uw_framebuffer) */
undefined4 * param_3;
undefined4 param_4;
undefined4 param_5;
undefined4 param_6;
intptr_t param_7; /* was undefined4 -- the tile's texture pixel data pointer */
int * param_8;

{
  undefined4 uVar1;
  int iVar2;
  undefined1 *puVar3;
  undefined4 uVar4;
  undefined1 *puVar5;
  undefined4 uVar6;
  uint uVar7;
  undefined4 uVar8;
  uint uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  /* auStack_c4 / auStack_7c were 12-byte locals but raster_edge_setup (called
     on each below) writes its edge record out to param_6[10] == byte
     0x2b, overflowing them; Ghidra named the tail of each overflow
     `local_b8` / `local_70` (the param_6[3] scanline-count field, byte
     0xc). Widened to real 72-byte buffers like their siblings and
     local_b8 / local_70 folded back in as element [3]. With them
     undersized the edge-walk counts came back as stack garbage, so
     raster_triangle's `while (local_70 != 0 && ...)` never ran the span
     rasterizer raster_textured_span. */
  undefined1 auStack_154 [72];
  undefined1 auStack_10c [72];
  undefined1 auStack_c4 [72];
  undefined1 auStack_7c [72];
#define local_b8 (*(int *)(auStack_c4 + 0xc))
#define local_70 (*(int *)(auStack_7c + 0xc))

  if (getenv("UW_DEBUG_RASTER")) {
    fprintf(stderr, "[raster] ENTRY texid=0x%x v0=(%g,%g) v1=(%g,%g) v2=(%g,%g) clip=(%d,%d,%d,%d) tex=%p\n",
            (unsigned)param_4,
            *(float *)param_3, *(float *)(param_3 + 1),
            *(float *)(param_3 + 5), *(float *)(param_3 + 6),
            *(float *)(param_3 + 10), *(float *)(param_3 + 11),
            param_8[0], param_8[1], param_8[2], param_8[3], (void *)param_7);
  }
  uVar8 = param_3[6];
  uVar10 = param_3[0xb];
  uVar6 = param_3[1];
  uVar1 = Ordinal_2032(*param_8);
  uVar4 = *param_3;
  iVar2 = Ordinal_2028(uVar4,uVar1);
  if (((iVar2 != 0) && (iVar2 = Ordinal_2028(param_3[5],uVar1), iVar2 != 0)) &&
     (iVar2 = Ordinal_2038(param_3[10],uVar1), iVar2 == 0)) {
    if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] REJECT: all verts left of clip-left\n");
    return;
  }
  uVar1 = Ordinal_2032(param_8[2]);
  iVar2 = Ordinal_2036(uVar4,uVar1);
  if (((iVar2 != 0) && (iVar2 = Ordinal_2036(param_3[5],uVar1), iVar2 != 0)) &&
     (iVar2 = Ordinal_2030(param_3[10],uVar1), iVar2 == 0)) {
    if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] REJECT: all verts right of clip-right\n");
    return;
  }
  uVar1 = Ordinal_2032(param_8[1]);
  iVar2 = Ordinal_2028(uVar6,uVar1);
  if (((iVar2 != 0) && (iVar2 = Ordinal_2028(uVar8,uVar1), iVar2 != 0)) &&
     (iVar2 = Ordinal_2038(uVar10,uVar1), iVar2 == 0)) {
    if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] REJECT: all verts above clip-top\n");
    return;
  }
  uVar1 = Ordinal_2032(param_8[3]);
  iVar2 = Ordinal_2036(uVar6,uVar1);
  if (((iVar2 != 0) && (iVar2 = Ordinal_2036(uVar8,uVar1), iVar2 != 0)) &&
     (iVar2 = Ordinal_2030(uVar10,uVar1), iVar2 == 0)) {
    if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] REJECT: all verts below clip-bottom\n");
    return;
  }
  if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] passed bbox reject, entering scanline setup\n");
  int _uw_span_calls = 0;
  iVar2 = Ordinal_2028(uVar6,uVar8);
  if (iVar2 == 0) {
    iVar2 = Ordinal_2028(uVar10,uVar8);
    if (iVar2 != 0) {
      uVar11 = 2;
      uVar1 = 1;
      uVar4 = 0;
      uVar7 = 1;
      uVar9 = 0;
      goto LAB_00014684;
    }
    uVar11 = 1;
    iVar2 = Ordinal_2028(uVar6,uVar10);
    if (iVar2 == 0) {
      uVar4 = 0;
      uVar9 = 3;
      goto LAB_0001467c;
    }
    uVar1 = 0;
    uVar7 = 3;
  }
  else {
    iVar2 = Ordinal_2028(uVar10,uVar6);
    if (iVar2 != 0) {
      uVar11 = 2;
      uVar1 = 0;
      uVar4 = 1;
      uVar7 = 0;
      uVar9 = 1;
      goto LAB_00014684;
    }
    uVar11 = 0;
    iVar2 = Ordinal_2028(uVar8,uVar10);
    if (iVar2 == 0) {
      uVar4 = 1;
      uVar9 = 1;
LAB_0001467c:
      uVar1 = 2;
      uVar7 = 2;
      goto LAB_00014684;
    }
    uVar1 = 1;
    uVar7 = 1;
  }
  uVar4 = 2;
  uVar9 = 2;
LAB_00014684:
  raster_triangle_perspective_setup(param_3,auStack_10c);
  raster_edge_setup(auStack_10c,param_3,uVar11,uVar4,param_8[1],auStack_154);
  raster_edge_setup(auStack_10c,param_3,uVar11,uVar1,param_8[1],auStack_c4);
  raster_edge_setup(auStack_10c,param_3,uVar1,uVar4,param_8[1],auStack_7c);
  if (getenv("UW_DEBUG_RASTER")) {
    fprintf(stderr, "[raster] sort top=%u mid=%u bot=%u  uVar7(short-half-idx)=%u uVar9(cmp)=%u  long_x0=%d short1_x0=%d short2_x0=%d\n",
            (unsigned)uVar11, (unsigned)uVar1, (unsigned)uVar4,
            (unsigned)uVar7, (unsigned)uVar9,
            *(int *)(auStack_154 + 0x28) >> 0xe,
            *(int *)(auStack_c4 + 0x28) >> 0xe,
            *(int *)(auStack_7c + 0x28) >> 0xe);
  }
  if (uVar9 < uVar7) {
    puVar3 = auStack_154;
    puVar5 = auStack_c4;
  }
  else {
    puVar3 = auStack_c4;
    puVar5 = auStack_154;
  }
  if (getenv("UW_DEBUG_RASTER")) {
    fprintf(stderr, "[raster] first-half puVar3(assumed-left)_x0=%d puVar5(assumed-right)_x0=%d\n",
            *(int *)(puVar3 + 0x28) >> 0xe, *(int *)(puVar5 + 0x28) >> 0xe);
  }
  iVar2 = local_b8;
  while( true ) {
    if (iVar2 == 0) {
      if (uVar9 < uVar7) {
        puVar3 = auStack_154;
        puVar5 = auStack_7c;
      }
      else {
        puVar3 = auStack_7c;
        puVar5 = auStack_154;
      }
      /* Second-half (mid vertex -> bottom vertex) scanline walk. Ghidra
         collapsed the original's private loop counter into the memory
         reference `local_70` -- which IS the short edge auStack_7c's
         remaining-scanline field (byte +0xc) -- AND kept an explicit
         `local_70--`. raster_edge_step(auStack_7c) already decrements that
         same field every iteration, so the counter was consumed twice per
         scanline and the bottom half of every triangle drew only half its
         rows. That was the diagonal white seam splitting each tile quad
         (and the ceiling "wedge" gaps). Mirror the first-half loop above:
         count down a private copy, let raster_edge_step own the edge
         field. */
      iVar2 = local_70;
      while ((iVar2 != 0 && (*(int *)(puVar3 + 8) < param_8[3]))) {
        if ((*(int *)(puVar3 + 0x28) >> 0xe < param_8[2]) &&
           (*param_8 < *(int *)(puVar5 + 0x28) >> 0xe)) {
          _uw_span_calls++;
          raster_textured_span(param_1,param_2,auStack_10c,puVar3,puVar5,param_5,param_6,param_7,param_8,
                       param_4);
        }
        raster_edge_step(auStack_7c);
        raster_edge_step(auStack_154);
        iVar2 = iVar2 + -1;
      }
      if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] DONE span_calls=%d\n", _uw_span_calls);
      return;
    }
    iVar2 = iVar2 + -1;
    if (param_8[3] <= *(int *)(puVar3 + 8)) break;
    if ((*(int *)(puVar3 + 0x28) >> 0xe < param_8[2]) && (*param_8 < *(int *)(puVar5 + 0x28) >> 0xe)
       ) {
      _uw_span_calls++;
      raster_textured_span(param_1,param_2,auStack_10c,puVar3,puVar5,param_5,param_6,param_7,param_8,param_4
                  );
    }
    raster_edge_step(auStack_c4);
    raster_edge_step(auStack_154);
  }
  if (getenv("UW_DEBUG_RASTER")) fprintf(stderr, "[raster] DONE (broke on clip-bottom) span_calls=%d\n", _uw_span_calls);
  return;
}
#undef local_b8
#undef local_70




// was FUN_00014868 -- advance one scanline down an edge record
int raster_edge_step(param_1)
intptr_t param_1; /* was int -- edge-walk struct pointer */

{
  int iVar1;

  *(int *)(param_1 + 8) = *(int *)(param_1 + 8) + 1;
  iVar1 = *(int *)(param_1 + 0xc) + -1;
  *(int *)(param_1 + 0xc) = iVar1;
  *(int *)(param_1 + 0x28) = *(int *)(param_1 + 0x2c) + *(int *)(param_1 + 0x28);
  *(int *)(param_1 + 0x38) = *(int *)(param_1 + 0x3c) + *(int *)(param_1 + 0x38);
  *(int *)(param_1 + 0x40) = *(int *)(param_1 + 0x44) + *(int *)(param_1 + 0x40);
  *(int *)(param_1 + 0x30) = *(int *)(param_1 + 0x34) + *(int *)(param_1 + 0x30);
  return iVar1;
}



// was FUN_000148c8 -- per-triangle perspective setup: 1/w, u/w, v/w per
// vertex plus the screen-space interpolation gradients, into the
// edge-coefficient array raster_edge_setup reads
void raster_triangle_perspective_setup(param_1,param_2)
undefined4 * param_1;
undefined4 * param_2;

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int iVar8;
  undefined4 uVar9;
  
  uVar5 = param_1[0xb];
  uVar4 = param_1[10];
  uVar1 = Ordinal_2015(param_1[1],uVar5);
  uVar2 = Ordinal_2015(param_1[5],uVar4);
  uVar1 = Ordinal_2026(uVar1,uVar2);
  uVar2 = Ordinal_2015(param_1[6],uVar5);
  uVar4 = Ordinal_2015(*param_1,uVar4);
  uVar2 = Ordinal_2026(uVar2,uVar4);
  uVar1 = Ordinal_2015(uVar1,uVar2);
  uVar1 = Ordinal_2047(0x3f800000,uVar1);
  uVar2 = Ordinal_2023();
  puVar6 = param_2 + 6;
  iVar8 = 3;
  puVar7 = param_1;
  do {
    uVar4 = Ordinal_2047(0x3f800000,puVar7[2]);
    puVar6[-6] = uVar4;
    uVar5 = Ordinal_2026(puVar7[3],uVar4);
    puVar6[-3] = uVar5;
    uVar4 = Ordinal_2026(puVar7[4],uVar4);
    iVar8 = iVar8 + -1;
    *puVar6 = uVar4;
    puVar6 = puVar6 + 1;
    puVar7 = puVar7 + 5;
  } while (iVar8 != 0);
  uVar5 = param_2[2];
  uVar4 = Ordinal_2015(param_2[1],uVar5);
  uVar9 = param_1[0xb];
  uVar5 = Ordinal_2015(*param_2,uVar5);
  uVar3 = Ordinal_2015(param_1[1],uVar9);
  uVar3 = Ordinal_2026(uVar3,uVar4);
  uVar9 = Ordinal_2015(param_1[6],uVar9);
  uVar9 = Ordinal_2026(uVar9,uVar5);
  uVar3 = Ordinal_2015(uVar3,uVar9);
  uVar3 = Ordinal_2026(uVar3,uVar1);
  param_2[9] = uVar3;
  uVar9 = param_1[10];
  uVar3 = Ordinal_2015(*param_1,uVar9);
  uVar4 = Ordinal_2026(uVar3,uVar4);
  uVar3 = Ordinal_2015(param_1[5],uVar9);
  uVar5 = Ordinal_2026(uVar3,uVar5);
  uVar4 = Ordinal_2015(uVar4,uVar5);
  uVar4 = Ordinal_2026(uVar4,uVar2);
  uVar5 = param_2[5];
  param_2[10] = uVar4;
  uVar4 = Ordinal_2015(param_2[4],uVar5);
  uVar9 = param_1[0xb];
  uVar5 = Ordinal_2015(param_2[3],uVar5);
  uVar3 = Ordinal_2015(param_1[1],uVar9);
  uVar3 = Ordinal_2026(uVar3,uVar4);
  uVar9 = Ordinal_2015(param_1[6],uVar9);
  uVar9 = Ordinal_2026(uVar9,uVar5);
  uVar3 = Ordinal_2015(uVar3,uVar9);
  uVar3 = Ordinal_2026(uVar3,uVar1);
  param_2[0xb] = uVar3;
  uVar9 = param_1[10];
  uVar3 = Ordinal_2015(*param_1,uVar9);
  uVar4 = Ordinal_2026(uVar3,uVar4);
  uVar3 = Ordinal_2015(param_1[5],uVar9);
  uVar5 = Ordinal_2026(uVar3,uVar5);
  uVar4 = Ordinal_2015(uVar4,uVar5);
  uVar4 = Ordinal_2026(uVar4,uVar2);
  uVar5 = param_2[8];
  param_2[0xc] = uVar4;
  uVar4 = Ordinal_2015(param_2[7],uVar5);
  uVar9 = param_1[0xb];
  uVar5 = Ordinal_2015(param_2[6],uVar5);
  uVar3 = Ordinal_2015(param_1[1],uVar9);
  uVar3 = Ordinal_2026(uVar3,uVar4);
  uVar9 = Ordinal_2015(param_1[6],uVar9);
  uVar9 = Ordinal_2026(uVar9,uVar5);
  uVar3 = Ordinal_2015(uVar3,uVar9);
  uVar1 = Ordinal_2026(uVar3,uVar1);
  param_2[0xd] = uVar1;
  uVar3 = param_1[10];
  uVar1 = Ordinal_2015(*param_1,uVar3);
  uVar1 = Ordinal_2026(uVar1,uVar4);
  uVar4 = Ordinal_2015(param_1[5],uVar3);
  uVar4 = Ordinal_2026(uVar4,uVar5);
  uVar1 = Ordinal_2015(uVar1,uVar4);
  uVar1 = Ordinal_2026(uVar1,uVar2);
  param_2[0xe] = uVar1;
  Ordinal_2026(param_2[9],0x45800000);
  uVar1 = Ordinal_2020();
  param_2[0xf] = uVar1;
  Ordinal_2026(param_2[0xb],0x45800000);
  uVar1 = Ordinal_2020();
  param_2[0x10] = uVar1;
  Ordinal_2026(param_2[0xd],0x45800000);
  uVar1 = Ordinal_2020();
  param_2[0x11] = uVar1;
  return;
}



// was FUN_00014ef4 -- per-edge setup: given two vertex indices, the
// starting value and per-scanline step for x, u/w, v/w and 1/w
void raster_edge_setup(param_1,param_2,param_3,param_4,param_5,param_6)
intptr_t param_1; /* was int -- edge-coeff array pointer */
intptr_t param_2; /* was int -- vertex array pointer (stride 0x14) */
int param_3;
int param_4;
int param_5;
undefined4 * param_6;

{
  int iVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  undefined4 uVar12;
  int local_34;
  
  puVar11 = (undefined4 *)(param_3 * 0x14 + param_2);
  Ordinal_2026(puVar11[1],0x45800000);
  uVar2 = Ordinal_2020();
  if ((uVar2 & 0xfff) != 0) {
    uVar2 = (uVar2 - (uVar2 & 0xfff)) + 0x1000;
  }
  iVar1 = (int)uVar2 >> 0xc;
  param_6[2] = iVar1;
  local_34 = 0;
  if (iVar1 < param_5) {
    local_34 = param_5 - iVar1;
  }
  puVar10 = (undefined4 *)(param_4 * 0x14 + param_2);
  Ordinal_2026(puVar10[1],0x45800000);
  uVar2 = Ordinal_2020();
  if ((uVar2 & 0xfff) != 0) {
    uVar2 = (uVar2 - (uVar2 & 0xfff)) + 0x1000;
  }
  iVar7 = ((int)uVar2 >> 0xc) - iVar1;
  iVar3 = iVar7 - local_34;
  if (iVar3 < 0) {
    iVar7 = 0;
  }
  param_6[3] = iVar3;
  if (iVar3 < 0) {
    param_6[3] = iVar7;
  }
  uVar8 = puVar11[1];
  uVar4 = Ordinal_2032(iVar1);
  uVar4 = Ordinal_2015(uVar4,uVar8);
  uVar8 = Ordinal_2015(puVar10[1],uVar8);
  uVar9 = *puVar11;
  uVar5 = Ordinal_2015(*puVar10,uVar9);
  uVar6 = Ordinal_2032(local_34);
  uVar4 = Ordinal_2051(uVar6,uVar4);
  uVar8 = Ordinal_2047(0x3f800000,uVar8);
  uVar6 = Ordinal_2026(uVar4,uVar5);
  uVar6 = Ordinal_2026(uVar6,uVar8);
  uVar6 = Ordinal_2051(uVar6,uVar9);
  *param_6 = uVar6;
  uVar8 = Ordinal_2026(uVar8,uVar5);
  param_6[1] = uVar8;
  uVar12 = *param_6;
  uVar5 = Ordinal_2015(uVar12,*puVar11);
  param_6[2] = iVar1 + local_34;
  uVar6 = Ordinal_2026(*(undefined4 *)(param_1 + 0x28),uVar4);
  uVar9 = Ordinal_2026(*(undefined4 *)(param_1 + 0x24),uVar5);
  uVar6 = Ordinal_2051(uVar6,uVar9);
  puVar11 = (undefined4 *)(param_1 + param_3 * 4);
  uVar6 = Ordinal_2051(uVar6,*puVar11);
  param_6[4] = uVar6;
  uVar6 = Ordinal_2026(*(undefined4 *)(param_1 + 0x24),uVar8);
  uVar6 = Ordinal_2051(uVar6,*(undefined4 *)(param_1 + 0x28));
  param_6[5] = uVar6;
  uVar6 = Ordinal_2026(*(undefined4 *)(param_1 + 0x30),uVar4);
  uVar9 = Ordinal_2026(*(undefined4 *)(param_1 + 0x2c),uVar5);
  uVar6 = Ordinal_2051(uVar6,uVar9);
  uVar6 = Ordinal_2051(uVar6,puVar11[3]);
  param_6[6] = uVar6;
  uVar6 = Ordinal_2026(*(undefined4 *)(param_1 + 0x2c),uVar8);
  uVar6 = Ordinal_2051(uVar6,*(undefined4 *)(param_1 + 0x30));
  param_6[7] = uVar6;
  uVar4 = Ordinal_2026(*(undefined4 *)(param_1 + 0x38),uVar4);
  uVar5 = Ordinal_2026(*(undefined4 *)(param_1 + 0x34),uVar5);
  uVar4 = Ordinal_2051(uVar4,uVar5);
  uVar4 = Ordinal_2051(uVar4,puVar11[6]);
  param_6[8] = uVar4;
  uVar4 = Ordinal_2026(*(undefined4 *)(param_1 + 0x34),uVar8);
  uVar4 = Ordinal_2051(uVar4,*(undefined4 *)(param_1 + 0x38));
  param_6[9] = uVar4;
  Ordinal_2026(uVar12,0x46800000);
  uVar4 = Ordinal_2020();
  param_6[10] = uVar4;
  Ordinal_2026(param_6[4],0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0xc] = uVar4;
  Ordinal_2026(param_6[6],0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0xe] = uVar4;
  Ordinal_2026(param_6[8],0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0x10] = uVar4;
  Ordinal_2026(uVar8,0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0xb] = uVar4;
  Ordinal_2026(param_6[5],0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0xd] = uVar4;
  Ordinal_2026(param_6[7],0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0xf] = uVar4;
  Ordinal_2026(param_6[9],0x46800000);
  uVar4 = Ordinal_2020();
  param_6[0x11] = uVar4;
  return;
}



// was FUN_0001548c -- the textured span rasterizer: for one scanline
// span between two edges, perspective-divides per pixel, samples the
// tile texture, shade-corrects and writes RGB565 into g_uw_framebuffer
//
// Checked for a "special/self-illuminated colour" exclusion from the
// distance-shade multiply (user's global fire/water palette-animation
// search) -- there isn't one, and none is needed: every texel's colour
// is scaled by the same distance/light factor (DAT_000b5638) regardless
// of palette index, BUT the colour itself is sampled from g_palette_rgb565
// fresh on every single frame (unlike the 2D HUD/paperdoll icon path,
// which composites once into the framebuffer and never re-reads the
// palette -- see mode-icon-and-hud-icon-flicker-fixes memory). So any
// wall/floor/ceiling texel whose palette index falls inside a range
// palette_cycle_range rotates would already animate through this exact
// code, for free, with no extra plumbing. Confirmed real lava-shaped
// textures exist using exactly the fire-gradient range (16-23) already
// wired up for the torch-icon fix: F32.TR/F16.TR entries 24/25 are
// 94-100% pixels in that range (entry 23 ~28%), W64.TR/W16.TR entry 206
// is ~93% -- unmistakably lava floor and a lava/torch wall texture. The
// level loaded from a fresh game (UW_DEBUG_TEXIDS) doesn't reference any
// of those specific texture ids in its own 48-wall/10-floor id lists, so
// this couldn't be verified live from the default spawn point -- would
// need a level that actually places one of them on screen.
void raster_textured_span(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8,param_9,param_10)
int param_1;
intptr_t param_2; /* framebuffer base */
intptr_t param_3; /* edge struct */
intptr_t param_4; /* edge struct */
intptr_t param_5; /* edge struct */
int param_6;
int param_7;
intptr_t param_8; /* texture pixel data */
int * param_9;
byte param_10;

{
  byte bVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  short sVar7;
  uint uVar8;
  int iVar9;
  ushort *puVar10;
  int iVar11;
  /* Ghidra merged two different variables into one `char *iVar12`: the
     DAT_0023cca0-based stencil-buffer walker (used up to the puVar13
     init) and, inside the span loop, a plain signed texel index. As a
     pointer type the guard `-1 < iVar12` and the wrap test
     `param_7 < iVar12` were unsigned pointer compares -- `-1` became
     0xFFFF...F so `-1 < iVar12` was ALWAYS false and the texel fetch
     `bVar1 = *(byte*)(iVar12 + param_8)` never ran (every span sampled
     the flat fallback colour 0 -> nothing drawn). Signed intptr_t makes
     both roles behave. */
  intptr_t iVar12;
  undefined1 *puVar13;
  int iVar14;
  int local_38;
  int local_34;
  intptr_t local_4; /* fb row pointer */
  
  iVar12 = (intptr_t)DAT_0023cca0;
  uVar2 = *(uint *)(param_4 + 0x28);
  uVar8 = uVar2 & 0x3fff;
  if (uVar8 != 0) {
    uVar2 = (uVar2 - uVar8) + 0x4000;
  }
  iVar6 = (int)uVar2 >> 0xe;
  iVar3 = 0x4000 - uVar8;
  uVar2 = *(uint *)(param_5 + 0x28);
  if (uVar8 == 0) {
    iVar3 = 0;
  }
  uVar8 = uVar2 & 0x3fff;
  iVar3 = iVar3 >> 2;
  if (uVar8 != 0) {
    uVar2 = uVar2 - uVar8;
  }
  if (uVar8 != 0) {
    uVar2 = uVar2 + 0x4000;
  }
  iVar11 = ((int)uVar2 >> 0xe) - iVar6;
  local_38 = (*(int *)(param_3 + 0x3c) * iVar3 >> 0xc) + (*(int *)(param_4 + 0x30) >> 2);
  iVar9 = 0;
  iVar14 = (*(int *)(param_3 + 0x40) * iVar3 >> 0xc) + (*(int *)(param_4 + 0x38) >> 2);
  local_34 = (*(int *)(param_3 + 0x44) * iVar3 >> 0xc) + (*(int *)(param_4 + 0x40) >> 2);
  if (iVar6 < *param_9) {
    iVar9 = *param_9 - iVar6;
  }
  if (param_9[2] < iVar11 + iVar6) {
    iVar11 = param_9[2] - iVar6;
  }
  local_4 = param_2;
  if (iVar9 != 0) {
    uVar4 = Ordinal_2032(iVar9);
    uVar5 = Ordinal_2026(*(undefined4 *)(param_3 + 0x24),uVar4);
    Ordinal_2026(uVar5,0xc5800000);
    iVar3 = Ordinal_2020();
    local_38 = local_38 - iVar3;
    uVar5 = Ordinal_2026(*(undefined4 *)(param_3 + 0x2c),uVar4);
    Ordinal_2026(uVar5,0xc5800000);
    iVar3 = Ordinal_2020();
    iVar14 = iVar14 - iVar3;
    uVar4 = Ordinal_2026(*(undefined4 *)(param_3 + 0x34),uVar4);
    Ordinal_2026(uVar4,0xc5800000);
    iVar3 = Ordinal_2020();
    iVar12 = iVar12 + iVar9;
    iVar11 = iVar11 - iVar9;
    local_34 = local_34 - iVar3;
    local_4 = param_2 + iVar9 * 2;
  }
  if (0 < iVar11) {
    iVar6 = *(int *)(param_4 + 8) * param_1 + iVar6;
    puVar13 = (undefined1 *)(iVar6 + iVar12);
    puVar10 = (ushort *)(local_4 + iVar6 * 2);
    do {
      iVar6 = Ordinal_2005(local_38,0x1000000);
      iVar12 = (local_34 >> 6) * iVar6 >> 0x12;
      bVar1 = param_10;
      if ((param_8 != 0) && (-1 < iVar12)) {
        for (iVar12 = (int)(iVar12) * param_6 + ((iVar14 >> 6) * iVar6 >> 0x12); param_7 < iVar12;
            iVar12 = iVar12 - param_7) {
        }
        bVar1 = *(byte *)(iVar12 + param_8);
      }
      if (bVar1 != 0) {
        iVar12 = ((iVar6 >> 4) + (int)DAT_000842b0) * 0x10000 >> 0x10;
        if (iVar12 < 0) {
          iVar12 = 0;
        }
        sVar7 = (short)iVar12;
        uVar2 = (uint)(ushort)(&g_palette_rgb565)[bVar1];
        if (0x9f < sVar7) {
          sVar7 = 0x9f;
        }
        iVar12 = (&DAT_000b5638)[sVar7];
        *puVar10 = (ushort)(((((int)((uVar2 & 0xf800) << 1) >> 6) * (int)(iVar12) >> 0x12) << 6 |
                            ((int)((uVar2 & 0x7e0) << 7) >> 6) * (int)(iVar12) >> 0x12) << 5) |
                   (ushort)(((int)((uVar2 & 0x1f) << 0xc) >> 6) * (int)(iVar12) >> 0x12);
        if (DAT_0023b830 != '\0') {
          *puVar13 = (char)DAT_000da47c;
        }
      }
      iVar11 = iVar11 + -1;
      puVar10 = puVar10 + 1;
      puVar13 = puVar13 + 1;
      local_38 = *(int *)(param_3 + 0x3c) + local_38;
      iVar14 = *(int *)(param_3 + 0x40) + iVar14;
      local_34 = *(int *)(param_3 + 0x44) + local_34;
    } while (iVar11 != 0);
  }
  return;
}




// was FUN_0001de0c -- build the view/camera matrix into DAT_000c8ac0 from the camera translation (DAT_000db438/43c/440) and 3 axis rotations (DAT_000db448/44c/450)
void build_view_matrix()

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  /* This function's four matrices (local_198.., auStack_158, local_118,
     auStack_d8) were each declared as only as many bytes as this function
     happens to name individual elements of, but set_identity_matrix4x4 (called on
     each below) zeroes+identity-inits a real 0x40(64)-byte/16-element 4x4
     float matrix at every one of these base pointers, and multiply_matrix4x4
     (the matrix multiply also called below) reads/writes the full 16
     elements of whichever buffers it's given -- e.g. local_118 was only
     `undefined4[2]` (8 bytes) despite being passed as a matrix-multiply
     operand read up to element 10. That's a real stack-buffer overflow
     (confirmed crashing with a __stack_chk_fail SIGABRT on a real run),
     not just a decompiler cosmetic gap. Ghidra split each matrix into
     these oddly-offset scalar names only because this function happens to
     assign a handful of specific elements by name (a 2x2 rotation block
     plus, for one matrix, a translation column) -- the untouched elements
     still need to keep set_identity_matrix4x4's identity-matrix values, which
     requires them to actually share one real contiguous 64-byte buffer.
     Widened all four to real 16-element arrays and switched every named
     element write to an indexed one at its correct offset (verified
     against each matrix's original Ghidra byte offset from its base). */
  undefined4 local_198_mtx [16];
  undefined1 auStack_158 [64];
  undefined4 local_118 [16];
  undefined1 auStack_d8 [64];
  undefined1 auStack_98 [64];
  undefined1 auStack_58 [64];

  /* build_trig_tables fills the per-degree sin/cos tables (DAT_000d9ed8 /
     DAT_000d9930) this function's rotation blocks read from. Ghidra
     recovered no caller for it anywhere, so the tables stayed zero and
     every view matrix came out degenerate (all vertices projected to
     one screen point). Build them once, lazily, right before first use. */
  {
    static int dd2c_done = 0;
    if (!dd2c_done) { dd2c_done = 1; build_trig_tables(); }
  }

  set_identity_matrix4x4(auStack_d8);
  set_identity_matrix4x4(auStack_158);
  set_identity_matrix4x4(local_118);
  set_identity_matrix4x4(local_198_mtx);
  ((undefined4 *)auStack_d8)[12] = Ordinal_2023(DAT_000db438);
  ((undefined4 *)auStack_d8)[13] = Ordinal_2023(DAT_000db43c);
  ((undefined4 *)auStack_d8)[14] = Ordinal_2023(DAT_000db440);
  uVar1 = (&DAT_000d9ed8)[DAT_000db448];
  uVar3 = (&DAT_000d9930)[DAT_000db448];
  ((undefined4 *)auStack_158)[5] = uVar1;
  ((undefined4 *)auStack_158)[6] = Ordinal_2023(uVar3);
  Ordinal_2023(uVar3);
  ((undefined4 *)auStack_158)[9] = Ordinal_2023();
  uVar2 = (&DAT_000d9ed8)[DAT_000db44c];
  uVar3 = (&DAT_000d9930)[DAT_000db44c];
  ((undefined4 *)auStack_158)[10] = uVar1;
  local_118[0] = uVar2;
  Ordinal_2023(uVar3);
  local_118[2] = Ordinal_2023();
  local_118[8] = Ordinal_2023(uVar3);
  uVar1 = (&DAT_000d9ed8)[DAT_000db450];
  uVar3 = (&DAT_000d9930)[DAT_000db450];
  local_198_mtx[0] = uVar1;
  local_118[10] = uVar2;
  local_198_mtx[1] = Ordinal_2023(uVar3);
  Ordinal_2023(uVar3);
  local_198_mtx[4] = Ordinal_2023();
  local_198_mtx[5] = uVar1;
  multiply_matrix4x4(auStack_d8,local_118,auStack_98);
  multiply_matrix4x4(auStack_98,auStack_158,auStack_58);
  multiply_matrix4x4(auStack_58,local_198_mtx,&DAT_000c8ac0);
  return;
}



// was FUN_0001dfe8 -- per visible-tile vertex: subtract the camera position (Ordinal_2051) to get camera-relative coords; also clears the per-tile visible flags
void translate_verts_to_camera_space(param_1)
int * param_1;

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  
  iVar3 = 0;
  if (0 < *param_1) {
    piVar2 = param_1;
    do {
      uVar1 = Ordinal_2051(piVar2[2],param_1[0x1202]);
      *(char *)(piVar2 + 0x602) = (char)uVar1;
      *(char *)((char *)piVar2 + 0x1809) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x180a) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x180b) = (char)((uint)uVar1 >> 0x18);
      uVar1 = Ordinal_2051(piVar2[3],param_1[0x1203]);
      *(char *)(piVar2 + 0x603) = (char)uVar1;
      *(char *)((char *)piVar2 + 0x180d) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x180e) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x180f) = (char)((uint)uVar1 >> 0x18);
      uVar1 = Ordinal_2051(piVar2[4],param_1[0x1204]);
      *(char *)(piVar2 + 0x604) = (char)uVar1;
      *(char *)((char *)piVar2 + 0x1811) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x1812) = (char)((uint)uVar1 >> 0x10);
      iVar3 = iVar3 + 1;
      *(char *)((char *)piVar2 + 0x1813) = (char)((uint)uVar1 >> 0x18);
      piVar2 = piVar2 + 3;
    } while (iVar3 < *param_1);
  }
  iVar3 = 0;
  piVar2 = param_1;
  if (getenv("UW_DEBUG_DOOR_POS"))
    fprintf(stderr, "[doorpos] translate_verts_to_camera_space: second-list record count param_1[1]=%d\n", param_1[1]);
  if (0 < param_1[1]) {
    do {
      *(undefined1 *)(piVar2 + 0x121b) = 1;
      iVar3 = iVar3 + 1;
      *(undefined1 *)((char *)piVar2 + 0x486d) = 0;
      *(undefined1 *)((char *)piVar2 + 0x486e) = 0;
      *(undefined1 *)((char *)piVar2 + 0x486f) = 0;
      *(undefined1 *)(piVar2 + 0x121c) = 0;
      *(undefined1 *)((char *)piVar2 + 0x4871) = 0;
      *(undefined1 *)((char *)piVar2 + 0x4872) = 0;
      *(undefined1 *)((char *)piVar2 + 0x4873) = 0;
      piVar2 = piVar2 + 0x18;
    } while (iVar3 < param_1[1]);
  }
  return;
}



// was FUN_0001e274 -- per vertex: multiply-accumulate the camera-relative coord through the 4x4 view matrix DAT_000c8ac0 (Ordinal_2026 mul, Ordinal_2051 add) -> projected x,y,z,w
void project_verts_through_view_matrix(param_1)
int * param_1;

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int *piVar6;
  int iVar7;
  
  iVar7 = 0;
  piVar6 = param_1;
  if (-1 < *param_1) {
    do {
      iVar1 = piVar6[0x604];
      iVar2 = piVar6[0x603];
      iVar3 = piVar6[0x602];
      uVar4 = Ordinal_2026(iVar3,DAT_000c8ac0);
      uVar5 = Ordinal_2026(iVar2,DAT_000c8ad0);
      uVar4 = Ordinal_2051(uVar4,uVar5);
      uVar5 = Ordinal_2026(iVar1,DAT_000c8ae0);
      uVar4 = Ordinal_2051(uVar4,uVar5);
      uVar4 = Ordinal_2051(uVar4,DAT_000c8af0);
      *(char *)(piVar6 + 0xc02) = (char)uVar4;
      *(char *)((char *)piVar6 + 0x3009) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)piVar6 + 0x300a) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)piVar6 + 0x300b) = (char)((uint)uVar4 >> 0x18);
      uVar4 = Ordinal_2026(iVar3,DAT_000c8ac4);
      uVar5 = Ordinal_2026(iVar2,DAT_000c8ad4);
      uVar4 = Ordinal_2051(uVar4,uVar5);
      uVar5 = Ordinal_2026(iVar1,DAT_000c8ae4);
      uVar4 = Ordinal_2051(uVar4,uVar5);
      uVar4 = Ordinal_2051(uVar4,DAT_000c8af4);
      *(char *)(piVar6 + 0xc03) = (char)uVar4;
      *(char *)((char *)piVar6 + 0x300d) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)piVar6 + 0x300e) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)piVar6 + 0x300f) = (char)((uint)uVar4 >> 0x18);
      uVar4 = Ordinal_2026(iVar3,DAT_000c8ac8);
      uVar5 = Ordinal_2026(iVar2,DAT_000c8ad8);
      uVar4 = Ordinal_2051(uVar4,uVar5);
      uVar5 = Ordinal_2026(iVar1,DAT_000c8ae8);
      uVar4 = Ordinal_2051(uVar4,uVar5);
      uVar4 = Ordinal_2051(uVar4,DAT_000c8af8);
      *(char *)(piVar6 + 0xc04) = (char)uVar4;
      iVar7 = iVar7 + 1;
      *(char *)((char *)piVar6 + 0x3011) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)piVar6 + 0x3012) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)piVar6 + 0x3013) = (char)((uint)uVar4 >> 0x18);
      piVar6 = piVar6 + 3;
    } while (iVar7 <= *param_1);
  }
  return;
}




/* param_1 (and every local below that's assigned an address derived from
   it -- iVar5/6/7/12/14, local_50) was `int`, truncating the real 64-bit
   &DAT_000a85d0 pointer this is always called with. Confirmed crashing
   (EXC_BAD_ACCESS, param_1 read back as a tiny ~1MB-range garbage value)
   on a real run. iVar4/13/18/19 and the local_7c/78/74/64/4c/48 group stay
   `int` -- they're genuinely counts/loop indices/array indices, never
   dereferenced as addresses themselves (confirmed by reading every use).
   Same pointer-truncation pattern fixed repeatedly this session. */
// was FUN_0001f370 -- near-plane (w=DAT_00084608=5.0) Sutherland-Hodgman clip of
// each visible tile quad; writes clipped positions + interpolated texcoords into
// the 0x88-byte render records at DAT_000bc038 and the DAT_000c4838[] pointer table
void near_clip_visible_tiles(param_1,param_2)
intptr_t param_1;
int param_2;

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  int iVar4;
  intptr_t iVar5;
  intptr_t iVar6;
  intptr_t iVar7;
  undefined4 *puVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  intptr_t iVar12;
  int iVar13;
  intptr_t iVar14;
  undefined *puVar15;
  undefined *puVar16;
  undefined *puVar17;
  int iVar18;
  int iVar19;
  undefined *puVar20;
  int local_7c;
  int local_78;
  int local_74;
  int local_64;
  intptr_t local_50;
  int local_4c;
  int local_48;

  if (param_2 == 0) {
    DAT_000c8c98 = 0;
  }
  else {
    local_48 = 0;
    if (0 < *(int *)(param_1 + 4)) {
      local_74 = 0;
      local_7c = DAT_000c8c98;
      local_4c = 0;
      iVar14 = param_1;
      do {
        if ((*(int *)(iVar14 + 0x486c) != 0) && (*(int *)(iVar14 + 0x4870) == 0)) {
          iVar19 = local_7c * 0x88;
          puVar20 = &DAT_000bc038 + iVar19;
          uVar10 = *(undefined4 *)(iVar14 + 0x4860);
          (&DAT_000bc0ac)[iVar19] = (char)uVar10;
          (&DAT_000bc0ad)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0ae)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0af)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + 0x4864);
          (&DAT_000bc0b0)[iVar19] = (char)uVar10;
          (&DAT_000bc0b1)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0b2)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0b3)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + 0x4868);
          (&DAT_000bc0b4)[iVar19] = (char)uVar10;
          (&DAT_000bc0b5)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0b6)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0b7)[iVar19] = (char)((uint)uVar10 >> 0x18);
          iVar4 = *(int *)(iVar14 + 0x486c);
          (&DAT_000bc0b8)[iVar19] = (char)iVar4;
          (&DAT_000bc0b9)[iVar19] = (char)((uint)iVar4 >> 8);
          (&DAT_000bc0ba)[iVar19] = (char)((uint)iVar4 >> 0x10);
          (&DAT_000bc0bb)[iVar19] = (char)((uint)iVar4 >> 0x18);
          iVar4 = *(int *)(iVar14 + 0x4870);
          (&DAT_000bc0bc)[iVar19] = (char)iVar4;
          (&DAT_000bc0bd)[iVar19] = (char)((uint)iVar4 >> 8);
          (&DAT_000bc0be)[iVar19] = (char)((uint)iVar4 >> 0x10);
          iVar18 = 0;
          local_78 = 0;
          (&DAT_000bc0bf)[iVar19] = (char)((uint)iVar4 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + 0x482c);
          (&DAT_000bc0a0)[iVar19] = (char)uVar10;
          (&DAT_000bc0a1)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0a2)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0a3)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + 0x4830);
          (&DAT_000bc0a4)[iVar19] = (char)uVar10;
          (&DAT_000bc0a5)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0a6)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0a7)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + 0x4834);
          (&DAT_000bc0a8)[iVar19] = (char)uVar10;
          (&DAT_000bc0a9)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0aa)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0ab)[iVar19] = (char)((uint)uVar10 >> 0x18);
          iVar4 = *(int *)(iVar14 + 0x4814);
          local_64 = iVar4 + -1;
          if (0 < iVar4) {
            puVar16 = &DAT_000bc044 + iVar19;
            puVar15 = puVar20;
            local_50 = iVar14;
            do {
              iVar7 = *(int *)(local_50 + 0x4818);
              iVar5 = *(int *)(local_4c + local_64 * 4 + param_1 + 0x4818) * 0xc + param_1;
              uVar10 = *(undefined4 *)(iVar5 + 0x3010);
              iVar6 = Ordinal_2038(uVar10,DAT_00084608);
              iVar7 = iVar7 * 0xc + param_1;
              puVar8 = (undefined4 *)(iVar7 + 0x3010);
              uVar11 = *puVar8;
              if (getenv("UW_DEBUG_NEARCLIP_RANGE")) {
                int _lo = 0, _hi = -1;
                sscanf(getenv("UW_DEBUG_NEARCLIP_RANGE"), "%d:%d", &_lo, &_hi);
                if (local_48 >= _lo && local_48 <= _hi)
                  fprintf(stderr, "[nearclip] rec=%d pointcount=%d edge=%d prev_vi=%d cur_vi=%d prev_w=%g cur_w=%g thresh=%g prev_behind=%d\n",
                          local_48, iVar4, local_78, local_64,
                          *(int *)(local_50 + 0x4818),
                          *(float *)&uVar10, *(float *)&uVar11, *(float *)&DAT_00084608, iVar6);
              }
              if (iVar6 == 0) {
                iVar6 = Ordinal_2038(uVar11,DAT_00084608);
                if (iVar6 != 0) {
                  uVar9 = Ordinal_2015(DAT_00084608,uVar10);
                  uVar10 = Ordinal_2015(uVar11,uVar10);
                  uVar11 = Ordinal_2047(uVar9,uVar10);
                  uVar10 = *(undefined4 *)(iVar5 + 0x3008);
                  uVar9 = Ordinal_2015(*(undefined4 *)(iVar7 + 0x3008),uVar10);
                  uVar9 = Ordinal_2026(uVar9,uVar11);
                  uVar10 = Ordinal_2051(uVar9,uVar10);
                  puVar15[4] = (char)uVar10;
                  puVar15[5] = (char)((uint)uVar10 >> 8);
                  puVar15[6] = (char)((uint)uVar10 >> 0x10);
                  puVar15[7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar5 + 0x300c);
                  uVar9 = Ordinal_2015(*(undefined4 *)(iVar7 + 0x300c),uVar10); /* dropped 2nd arg (vert0 ref coord) */
                  uVar9 = Ordinal_2026(uVar9,uVar11);
                  uVar10 = Ordinal_2051(uVar9,uVar10);
                  puVar15[8] = (char)uVar10;
                  puVar15[9] = (char)((uint)uVar10 >> 8);
                  puVar15[10] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0xb] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = DAT_00084608;
                  *puVar16 = (char)DAT_00084608;
                  puVar16[1] = (char)((uint)uVar10 >> 8);
                  puVar16[2] = (char)((uint)uVar10 >> 0x10);
                  puVar16[3] = (char)((uint)uVar10 >> 0x18);
                  iVar6 = param_1 + (local_74 + local_78) * 8;
                  iVar12 = param_1 + (local_74 + local_64) * 8;
                  iVar5 = *(int *)(iVar12 + 0x4838);
                  iVar13 = local_7c * 0x11;
                  uVar10 = Ordinal_2032(*(int *)(iVar6 + 0x4838) - iVar5);
                  uVar10 = Ordinal_2026(uVar10,uVar11);
                  uVar9 = Ordinal_2032(iVar5);
                  Ordinal_2051(uVar10,uVar9);
                  uVar10 = Ordinal_2020();
                  iVar5 = (iVar13 + 8 + iVar18) * 8;
                  (&DAT_000bc038)[iVar5] = (char)uVar10;
                  (&DAT_000bc039)[iVar5] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc03a)[iVar5] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc03b)[iVar5] = (char)((uint)uVar10 >> 0x18);
                  iVar5 = *(int *)(iVar12 + 0x483c);
                  uVar10 = Ordinal_2032(*(int *)(iVar6 + 0x483c) - iVar5);
                  uVar10 = Ordinal_2026(uVar10,uVar11);
                  uVar11 = Ordinal_2032(iVar5);
                  Ordinal_2051(uVar10,uVar11);
                  uVar10 = Ordinal_2020();
                  iVar5 = (iVar13 + iVar18) * 8;
                  (&DAT_000bc07c)[iVar5] = (char)uVar10;
                  (&DAT_000bc07d)[iVar5] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc07e)[iVar5] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc07f)[iVar5] = (char)((uint)uVar10 >> 0x18);
                  uVar1 = *(undefined1 *)(iVar7 + 0x3009);
                  uVar2 = *(undefined1 *)(iVar7 + 0x300a);
                  uVar3 = *(undefined1 *)(iVar7 + 0x300b);
                  puVar15[0x10] = *(undefined1 *)(iVar7 + 0x3008);
                  puVar15[0x11] = uVar1;
                  puVar15[0x12] = uVar2;
                  puVar15[0x13] = uVar3;
                  uVar10 = *(undefined4 *)(iVar7 + 0x300c);
                  puVar15[0x14] = (char)uVar10;
                  puVar15[0x15] = (char)((uint)uVar10 >> 8);
                  puVar15[0x16] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0x17] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *puVar8;
                  puVar17 = puVar16 + 0xc;
                  *puVar17 = (char)uVar10;
                  puVar16[0xd] = (char)((uint)uVar10 >> 8);
                  puVar16[0xe] = (char)((uint)uVar10 >> 0x10);
                  puVar16[0xf] = (char)((uint)uVar10 >> 0x18);
                  iVar7 = (iVar13 + 8 + iVar18 + 1) * 8;
                  iVar5 = (iVar13 + iVar18 + 1) * 8;
                  uVar1 = *(undefined1 *)(iVar6 + 0x4839);
                  uVar2 = *(undefined1 *)(iVar6 + 0x483a);
                  uVar3 = *(undefined1 *)(iVar6 + 0x483b);
                  (&DAT_000bc038)[iVar7] = *(undefined1 *)(iVar6 + 0x4838);
                  (&DAT_000bc039)[iVar7] = uVar1;
                  (&DAT_000bc03a)[iVar7] = uVar2;
                  (&DAT_000bc03b)[iVar7] = uVar3;
                  iVar7 = *(int *)(iVar6 + 0x483c);
                  (&DAT_000bc07c)[iVar5] = (char)iVar7;
                  (&DAT_000bc07d)[iVar5] = (char)((uint)iVar7 >> 8);
                  (&DAT_000bc07e)[iVar5] = (char)((uint)iVar7 >> 0x10);
                  (&DAT_000bc07f)[iVar5] = (char)((uint)iVar7 >> 0x18);
                  iVar18 = iVar18 + 2;
                  puVar15 = puVar15 + 0x18;
                  goto LAB_0002029c;
                }
              }
              else {
                iVar6 = Ordinal_2038(uVar11,DAT_00084608); /* dropped args: is vert1 in front of the near plane? */
                if (iVar6 == 0) {
                  uVar9 = Ordinal_2015(DAT_00084608,uVar10);
                  uVar10 = Ordinal_2015(uVar11,uVar10);
                  uVar11 = Ordinal_2047(uVar9,uVar10);
                  uVar10 = *(undefined4 *)(iVar5 + 0x3008);
                  uVar9 = Ordinal_2015(*(undefined4 *)(iVar7 + 0x3008),uVar10); /* dropped 2nd arg (vert0 ref coord) */
                  uVar9 = Ordinal_2026(uVar9,uVar11);
                  uVar10 = Ordinal_2051(uVar9,uVar10);
                  puVar15[4] = (char)uVar10;
                  puVar15[5] = (char)((uint)uVar10 >> 8);
                  puVar15[6] = (char)((uint)uVar10 >> 0x10);
                  puVar15[7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar5 + 0x300c);
                  uVar9 = Ordinal_2015(*(undefined4 *)(iVar7 + 0x300c),uVar10); /* dropped 2nd arg (vert0 ref coord) */
                  uVar9 = Ordinal_2026(uVar9,uVar11);
                  uVar10 = Ordinal_2051(uVar9,uVar10);
                  puVar15[8] = (char)uVar10;
                  puVar15[9] = (char)((uint)uVar10 >> 8);
                  puVar15[10] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0xb] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = DAT_00084608;
                  *puVar16 = (char)DAT_00084608;
                  puVar16[1] = (char)((uint)uVar10 >> 8);
                  puVar16[2] = (char)((uint)uVar10 >> 0x10);
                  puVar16[3] = (char)((uint)uVar10 >> 0x18);
                  iVar6 = param_1 + (local_74 + local_78) * 8;
                  iVar5 = param_1 + (local_74 + local_64) * 8;
                  iVar7 = *(int *)(iVar5 + 0x4838);
                  uVar10 = Ordinal_2032(*(int *)(iVar6 + 0x4838) - iVar7);
                  uVar10 = Ordinal_2026(uVar10,uVar11);
                  uVar9 = Ordinal_2032(iVar7);
                  Ordinal_2051(uVar10,uVar9);
                  uVar10 = Ordinal_2020();
                  iVar7 = (local_7c * 0x11 + iVar18 + 8) * 8;
                  (&DAT_000bc038)[iVar7] = (char)uVar10;
                  (&DAT_000bc039)[iVar7] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc03a)[iVar7] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc03b)[iVar7] = (char)((uint)uVar10 >> 0x18);
                  iVar7 = *(int *)(iVar5 + 0x483c);
                  uVar10 = Ordinal_2032(*(int *)(iVar6 + 0x483c) - iVar7);
                  uVar10 = Ordinal_2026(uVar10,uVar11);
                  uVar11 = Ordinal_2032(iVar7);
                  Ordinal_2051(uVar10,uVar11);
                  uVar10 = Ordinal_2020();
                }
                else {
                  uVar10 = *(undefined4 *)(iVar7 + 0x3008);
                  puVar15[4] = (char)uVar10;
                  puVar15[5] = (char)((uint)uVar10 >> 8);
                  puVar15[6] = (char)((uint)uVar10 >> 0x10);
                  puVar15[7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar7 + 0x300c);
                  puVar15[8] = (char)uVar10;
                  puVar15[9] = (char)((uint)uVar10 >> 8);
                  puVar15[10] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0xb] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *puVar8;
                  *puVar16 = (char)uVar10;
                  puVar16[1] = (char)((uint)uVar10 >> 8);
                  puVar16[2] = (char)((uint)uVar10 >> 0x10);
                  puVar16[3] = (char)((uint)uVar10 >> 0x18);
                  iVar5 = param_1 + (local_74 + local_78) * 8;
                  iVar7 = (local_7c * 0x11 + iVar18 + 8) * 8;
                  uVar10 = *(undefined4 *)(iVar5 + 0x4838);
                  (&DAT_000bc038)[iVar7] = (char)uVar10;
                  (&DAT_000bc039)[iVar7] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc03a)[iVar7] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc03b)[iVar7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar5 + 0x483c);
                }
                iVar7 = (local_7c * 0x11 + iVar18) * 8;
                (&DAT_000bc07c)[iVar7] = (char)uVar10;
                iVar18 = iVar18 + 1;
                puVar15 = puVar15 + 0xc;
                (&DAT_000bc07d)[iVar7] = (char)((uint)uVar10 >> 8);
                (&DAT_000bc07e)[iVar7] = (char)((uint)uVar10 >> 0x10);
                (&DAT_000bc07f)[iVar7] = (char)((uint)uVar10 >> 0x18);
                puVar17 = puVar16;
LAB_0002029c:
                puVar16 = puVar17 + 0xc;
              }
              local_50 = local_50 + 4;
              local_64 = local_78;
              local_78 = local_78 + 1;
            } while (local_78 < iVar4);
            if (getenv("UW_DEBUG_DOOR_POS") && local_48 >= 26 && local_48 <= 32)
              fprintf(stderr, "[doorpos] near_clip: emit_idx=%d iVar18(clipped_verts)=%d out_idx_if_kept=%d\n",
                      local_48, iVar18, local_7c);
            if (getenv("UW_DEBUG_NEARCLIP_RANGE")) {
              int _lo = 0, _hi = -1;
              sscanf(getenv("UW_DEBUG_NEARCLIP_RANGE"), "%d:%d", &_lo, &_hi);
              if (local_48 >= _lo && local_48 <= _hi)
                fprintf(stderr, "[nearclip] rec=%d FINAL iVar18(clipped_verts)=%d out_idx_if_kept=%d\n",
                        local_48, iVar18, local_7c);
            }
            if (iVar18 != 0) {
              *puVar20 = (char)iVar18;
              (&DAT_000bc039)[iVar19] = (char)((uint)iVar18 >> 8);
              (&DAT_000bc03a)[iVar19] = (char)((uint)iVar18 >> 0x10);
              (&DAT_000c4838)[local_7c] = puVar20;
              /* carry the real texture pointer from emit index to render index */
              if ((unsigned)local_7c < UW_MAX_VIS_TILES && (unsigned)local_48 < UW_MAX_VIS_TILES) {
                g_tile_texptr_out[local_7c] = g_tile_texptr_emit[local_48];
                if (getenv("UW_DEBUG_DOOR_POS") && local_48 >= 26 && local_48 <= 32)
                  fprintf(stderr, "[doorpos] texptr carry: emit_idx=%d out_idx=%d texptr=%p\n",
                          local_48, local_7c, g_tile_texptr_emit[local_48]);
              }
              local_7c = local_7c + 1;
              (&DAT_000bc03b)[iVar19] = (char)((uint)iVar18 >> 0x18);
              DAT_000c8c98 = local_7c;
            }
          }
        }
        local_48 = local_48 + 1;
        local_4c = local_4c + 0x60;
        iVar14 = iVar14 + 0x60;
        local_74 = local_74 + 0xc;
      } while (local_48 < *(int *)(param_1 + 4));
    }
  }
  return;
}



// was FUN_00013b8c -- confirmed by two independent pre-existing
// comments (uw.c's DAT_000c8ac0-family global-layout note, and
// src/3d.c's own build_view_matrix-adjacent comment) as a 4x4
// (really 4x3-affine, homogeneous) matrix multiply: param_1/param_2
// are 16-float (64-byte) input matrices, param_3 the 16-float output.
// Uses Ordinal_2026 (float multiply) and Ordinal_2051 (float add) for
// the 12 real rotation/translation elements; the 4 "column 3" slots
// are hardcoded to the standard affine bottom row (0,0,0,1) rather
// than actually computed.
void multiply_matrix4x4(param_1,param_2,param_3)
undefined4 * param_1;
undefined4 * param_2;
undefined4 * param_3;

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  uVar1 = Ordinal_2026(param_2[8],param_1[2]);
  uVar2 = Ordinal_2026(param_1[1],param_2[4]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(*param_1,*param_2);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  *param_3 = uVar1;
  uVar1 = Ordinal_2026(param_2[9],param_1[2]);
  uVar2 = Ordinal_2026(param_1[1],param_2[5]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_2[1],*param_1);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[1] = uVar1;
  uVar1 = Ordinal_2026(param_2[10],param_1[2]);
  uVar2 = Ordinal_2026(param_2[6],param_1[1]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_2[2],*param_1);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[2] = uVar1;
  param_3[3] = 0;
  uVar1 = Ordinal_2026(param_1[6],param_2[8]);
  uVar2 = Ordinal_2026(param_1[5],param_2[4]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[4],*param_2);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[4] = uVar1;
  uVar1 = Ordinal_2026(param_1[6],param_2[9]);
  uVar2 = Ordinal_2026(param_1[5],param_2[5]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[4],param_2[1]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[5] = uVar1;
  uVar1 = Ordinal_2026(param_1[6],param_2[10]);
  uVar2 = Ordinal_2026(param_1[5],param_2[6]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[4],param_2[2]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[6] = uVar1;
  param_3[7] = 0;
  uVar1 = Ordinal_2026(param_1[10],param_2[8]);
  uVar2 = Ordinal_2026(param_1[9],param_2[4]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[8],*param_2);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[8] = uVar1;
  uVar1 = Ordinal_2026(param_1[10],param_2[9]);
  uVar2 = Ordinal_2026(param_1[9],param_2[5]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[8],param_2[1]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[9] = uVar1;
  uVar1 = Ordinal_2026(param_1[10],param_2[10]);
  uVar2 = Ordinal_2026(param_1[9],param_2[6]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[8],param_2[2]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  param_3[10] = uVar1;
  param_3[0xb] = 0;
  uVar1 = Ordinal_2026(param_1[0xe],param_2[8]);
  uVar2 = Ordinal_2026(param_1[0xd],param_2[4]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[0xc],*param_2);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar1 = Ordinal_2051(uVar1,param_2[0xc]);
  param_3[0xc] = uVar1;
  uVar1 = Ordinal_2026(param_1[0xe],param_2[9]);
  uVar2 = Ordinal_2026(param_1[0xd],param_2[5]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[0xc],param_2[1]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar1 = Ordinal_2051(uVar1,param_2[0xd]);
  param_3[0xd] = uVar1;
  uVar1 = Ordinal_2026(param_1[0xe],param_2[10]);
  uVar2 = Ordinal_2026(param_1[0xd],param_2[6]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar2 = Ordinal_2026(param_1[0xc],param_2[2]);
  uVar1 = Ordinal_2051(uVar1,uVar2);
  uVar1 = Ordinal_2051(uVar1,param_2[0xe]);
  param_3[0xe] = uVar1;
  param_3[0xf] = 0x3f800000;
  return;
}


// was FUN_0001422c -- confirmed by src/3d.c's own pre-existing
// comment ("set_identity_matrix4x4's identity-matrix values") as a 4x4 identity
// matrix setter: zeroes the 16-float (64-byte) buffer, then sets the
// four diagonal elements to 1.0f.
void set_identity_matrix4x4(param_1)
undefined4 * param_1;

{
  Ordinal_1047(param_1,0,0x40);
  param_1[0xf] = 0x3f800000;
  param_1[10] = 0x3f800000;
  param_1[5] = 0x3f800000;
  *param_1 = 0x3f800000;
  return;
}



/* was FUN_00014258 -- copy a 4x4 matrix param_1 -> param_2. param_1
   was `int`, and the body
   computed the source address as `(param_1 - (int)param_2) + (int)puVar1`
   -- a 32-bit byte delta -- so on a 64-bit host both the source pointer
   and the delta truncated (wild read; crashed build_euler_rotation_matrix
   once the object-render path started calling it with real property
   data). It's just element-wise `param_2[i] = param_1[i]` for i in 0..15. */
void copy_matrix4x4(param_1,param_2)
undefined4 * param_1;
undefined4 * param_2;

{
  int i;

  for (i = 0; i < 16; i = i + 1) {
    param_2[i] = param_1[i];
  }
  return;
}




// was FUN_0001dd2c -- builds the renderer's 361-entry (0..360 degrees)
// per-degree sin/cos tables: for each angle, converts degrees to radians
// (multiplying by the pi/180 constant folded into the Ordinal_2027 call),
// then calls cos (Ordinal_1004) into DAT_000d9ed8[angle] and sin
// (Ordinal_1058) into DAT_000d9930[angle] -- see both ordinals' own
// comments in src/ordinal_stubs.c. Every 3D rotation/view-matrix call
// site in src/3d.c and src/player.c reads through these two tables
// instead of calling sin/cos directly.
void build_trig_tables()

{
  undefined4 uVar1;
  int iVar2;
  undefined8 uVar3;
  
  iVar2 = 0;
  do {
    Ordinal_2032(iVar2);
    uVar3 = Ordinal_2021();
    Ordinal_2027((int)uVar3,(int)((ulonglong)uVar3 >> 0x20),0xa50de271,0x3f91df45);
    Ordinal_2044();
    uVar3 = Ordinal_2021();
    Ordinal_1004();
    uVar1 = Ordinal_2044();
    (&DAT_000d9ed8)[iVar2] = uVar1;
    Ordinal_1058((int)uVar3,(int)((ulonglong)uVar3 >> 0x20));
    uVar1 = Ordinal_2044();
    (&DAT_000d9930)[iVar2] = uVar1;
    iVar2 = iVar2 + 1;
  } while (iVar2 < 0x169);
  return;
}


// was FUN_0005b36c -- loads the dungeon-view texture/shade/door-
// frame arenas at game/level startup: builds "\DATA\<filename>" paths
// and calls load_texture_arena four times for the wall/floor texture
// sets, then load_door_frames. Confirmed called at chargen/level-load
// time (chargen.c, visibility.c, babl.c).
void load_dungeon_texture_arenas()

{
  char *wptr_42257;
  char *wptr_42265;
  char *wptr_42273;
  char *wptr_42281;
  char *stack0xffdc3244_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  short local_11c [4];
  char acStack_114 [260];
  /* acStack_86af8 / _86af0 / _86ae8 / _86ae0 were four separate stack
     locals (8, 8, 8, 551364 bytes), but every use is `<base> + iVar3`
     where iVar3 is strlen(acStack_114) after the "\DATA\" prefix -- i.e.
     the code appends each texture filename at path + strlen(path). They
     are all really acStack_114 (the path buffer); Ghidra split the
     `+ iVar3` writes onto per-file base names. Same "one buffer, many
     Ghidra names" bug as build_view_matrix's matrices. With them separate,
     the filename suffix was written to a stray 8-byte local, so
     load_texture_arena opened the bare "...\DATA\" directory and the whole
     texture / shade / colour-light arena (DAT_002049e0) stayed zero --
     which is why the (now-running) 3D span rasterizer drew nothing.
     Fixed by pointing all four `+ iVar3` writes at acStack_114. */

  DAT_0023ae38 = &DAT_002049e0;
  Ordinal_1047(acStack_114,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3244_ptr = acStack_114;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_114,s__DATA__00085970);
  iVar3 = Ordinal_1068(acStack_114);
  pcVar2 = &DAT_000869e4;
    wptr_42257 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42257 = cVar1; wptr_42257 = wptr_42257 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_11c[0] = DAT_0023adb0;
  load_texture_arena(acStack_114,&DAT_0023ae58,local_11c,DAT_0023ae38);
  pcVar2 = &DAT_000869dc;
    wptr_42265 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42265 = cVar1; wptr_42265 = wptr_42265 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae34 = DAT_0023ae38 + DAT_0023adb0 * 0x1000;
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae34);
  pcVar2 = &DAT_000869d4;
    wptr_42273 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42273 = cVar1; wptr_42273 = wptr_42273 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae3c = DAT_0023ae34 + DAT_0023aeb8 * 0x400;
  load_texture_arena(acStack_114,&DAT_0023ae58,local_11c,DAT_0023ae3c);
  pcVar2 = &DAT_000869cc;
    wptr_42281 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42281 = cVar1; wptr_42281 = wptr_42281 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae30 = DAT_0023ae3c + local_11c[0] * 0x100;
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae30);
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] load_dungeon_texture_arenas: about to call load_door_frames (door loader), DAT_00202734=%d\n", (int)DAT_00202734);
  load_door_frames();
  return;
}



// was FUN_0005b758 -- configures the dungeon-view viewport region
// (x=param_1,y=param_2,width=param_3,height=param_4): sets up the
// view-Y bound, tracked hotspot rect, and interact zones for it, and
// picks a frame-time budget based on the current display-mode flags.
// Confirmed called once at level load with the fixed standard
// viewport bounds (level.c).
void configure_dungeon_viewport(param_1,param_2,param_3,param_4)
undefined4 param_1;
int param_2;
undefined4 param_3;
int param_4;

{
  g_dungeon_view_active = 0;
  DAT_0023b020 = (undefined2)param_3;
  DAT_0023aed4 = (undefined2)param_4;
  /* HACK: was `FUN_000129d4(param_1);` -- dropped 2 of 3 arguments,
     the same class of bug fixed repeatedly elsewhere in this file.
     Nothing between this function's own entry and this call touches
     param_2/param_3, so on ARM's register-passthrough calling
     convention they're still sitting in r1/r2 unchanged -- this
     function's own first 3 parameters are the obviously-intended
     arguments. The callee's return value is discarded either way (see
     compute_view_y_bound's own comment on why this fix has no
     observable behavioral effect). */
  compute_view_y_bound(param_1,param_2,param_3);
  set_tracked_hotspot_rect(param_1,param_2,param_3,param_4);
  register_game_view_interact_zones(param_1,param_2 + param_4 + -1,param_3,param_4);
  if ((*(ushort *)(DAT_00085a6c + 8) & 8) == 0) {
    if ((*(ushort *)(DAT_00085a6c + 8) & 1) == 0) {
      DAT_0023aed8 = 0x7ed2;
    }
    else {
      g_dungeon_view_active = 1;
      DAT_0023aed8 = 25000;
    }
  }
  else {
    DAT_0023aed8 = 0x6062;
  }
  return;
}



// was FUN_0005b828 -- one-time dungeon-view rendering init: resets
// the viewport, loads the 3D object models, initializes the glyph-
// width table and draw-command cursor, and builds the initial
// visibility light grid. Confirmed called once from game.c's startup
// sequence.
void init_dungeon_rendering()

{
  reset_viewport_to_fullscreen();
  load_3d_object_models();
  if (getenv("UW_DUMP_MODEL_RAW")) {
    unsigned char *_b = (unsigned char *)&DAT_00123ccc;
    int _k;
    int _npts = *(int *)_b;
    int _nparts = *(int *)(_b + 4);
    fprintf(stderr, "[modelraw] npts=%d nparts=%d\n", _npts, _nparts);
    for (_k = 0; _k < _npts; _k++) {
      float x = *(float *)(_b + 8 + _k*0xc);
      float y = *(float *)(_b + 8 + _k*0xc + 4);
      float z = *(float *)(_b + 8 + _k*0xc + 8);
      fprintf(stderr, "[modelraw] pt[%d] = (%g,%g,%g)\n", _k, x, y, z);
    }
    for (_k = 0; _k < _nparts && _k < 40; _k++) {
      int base = 0xc14 + _k*0x60;
      int vcount = *(int *)(_b + base);
      fprintf(stderr, "[modelraw] part[%d] vcount=%d verts=", _k, vcount);
      int j;
      for (j = 0; j < vcount && j < 8; j++) {
        fprintf(stderr, "%d ", *(int *)(_b + base + 4 + j*4));
      }
      fprintf(stderr, "\n");
    }
  }
  init_glyph_width_table();
  init_draw_command_cursor();
  save_draw_command_cursor();
  DAT_0023aed0 = DAT_00110fc0;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  build_visibility_light_grid(8);
  DAT_0023b49c = DAT_00250650;
  return;
}



// was FUN_0005bac0 -- renders one dungeon-view frame (HUD draw
// commands + the 3D render pass) within the dungeon viewport's clip
// rect. Confirmed used both for normal frame rendering and (per an
// existing comment) to re-render in "pick" mode for mouse-object
// selection (hud.c).
void render_dungeon_view_frame()

{
  draw_command_list_rewind();
  emit_hud_draw_commands();
  finalize_glyph_draw_command(0xa0);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  set_viewport_clip_rect(0,0,DAT_0023b020 + -1,DAT_0023aed4 + -1);
  set_viewport_clip_rect(0x34,0x13,DAT_0023b020 + 0x33,DAT_0023aed4 + 0x12);
  render_dungeon_view();
  set_viewport_clip_rect(0,0,0x13f,199);
  return;
}


// was FUN_0005dd84 -- flat-shaded (low-detail) texture-select emitter
// for the "wall" surface slot (DAT_00086b38_fnptrs[0], and the
// dynamic low-detail fallback for slots [1]/[3]): picks either a
// texture-page byte or a hardcoded flat-shade fallback, then emits
// the draw-command opcode sequence for it. The low-detail counterpart
// to emit_floor_texture_select.
void emit_flat_wall_texture_select(param_1,param_2,param_3)
byte * param_1;
uint param_2;
ushort param_3;

{
  byte *pbVar1;

  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((param_3 & 0xff) + 0x6a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (param_2 & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = (param_3 & 0xff) + 0xf0;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*param_1 << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
  return;
}



// was FUN_0005debc -- flat-shaded (low-detail) texture-select
// emitter for the "floor-or-ceiling" surface slot
// (DAT_00086b38_fnptrs[2]), structurally identical to
// emit_flat_wall_texture_select but with its own fallback shade
// (0xfa) and no detailed/textured counterpart of its own.
void emit_flat_floor_texture_select(param_1,param_2,param_3)
byte * param_1;
uint param_2;
uint param_3;

{
  byte *pbVar1;

  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((param_3 & 0xff) + 0x6a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (param_2 & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = 0xfa;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*param_1 << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
  return;
}



// was FUN_0005dff4 -- flat-shaded (low-detail) texture-select
// emitter for the "diagonal" surface slot (DAT_00086b38_fnptrs[4]),
// using a different texture-page range (+0x3a) and fallback shade
// (0xc0) from its wall/floor siblings. The low-detail counterpart to
// emit_diagonal_wall_texture_select.
void emit_flat_diagonal_texture_select(param_1,param_2,param_3,param_4)
byte * param_1;
uint param_2;
undefined4 param_3;
ushort param_4;

{
  byte *pbVar1;

  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((param_4 & 0xff) + 0x3a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (param_2 & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = (param_4 & 0xff) + 0xc0;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*param_1 << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)param_1[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
  return;
}



// was emit_floor_texture_select
void emit_floor_texture_select(param_1,param_2,param_3)
byte * param_1;
uint param_2;
short param_3;

{
  ushort uVar1;
  
  param_2 = param_2 & 0xff;
  if (((int)param_2 < (int)DAT_00086b28) || (param_1 == (byte *)0x0)) {
    if ((int)param_2 < (int)DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((param_2 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      DAT_0023b4d8 = 0x400;
      uVar1 = param_3 + 0x30;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
    }
    else {
      uVar1 = param_3 + 0x6a;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      DAT_0023b824 = 0x10;
    }
    *DAT_00110fc0 = 0x3e;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b81c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = uVar1 & 0xff;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b4d8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b828;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    if (param_1 != (byte *)0x0) {
      *DAT_00110fc0 = 0x36;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*param_1 << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[3];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[1] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[2];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[2] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[1];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[3] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*DAT_0023b4f0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
  }
  else {
    /* BUG FIX: was `FUN_0005dd84();` -- dropped all 3 arguments. This
       function's own params (param_1,param_2,param_3) exactly match
       emit_flat_wall_texture_select's signature, and nothing between
       entry and this branch repurposes them (param_2 was already
       narrowed to its low byte for the distance check just above,
       which is the correct value to forward) -- same dropped-argument
       idiom fixed repeatedly elsewhere this session. */
    emit_flat_wall_texture_select(param_1,param_2,param_3);
  }
  return;
}



// was FUN_0005e3c0 -- detailed (fully textured) texture-select
// emitter for the "diagonal" surface slot (DAT_00086b38_fnptrs[5]),
// the detailed counterpart to emit_flat_diagonal_texture_select.
// Confirmed used for diagonal wall segments by models.c, which passes
// the tile's own wall_tex field as its texture-id argument.
void emit_diagonal_wall_texture_select(param_1,param_2,param_3,param_4)
byte * param_1;
uint param_2;
uint param_3;
ushort param_4;

{
  short *psVar1;
  short sVar2;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  
  param_2 = param_2 & 0xff;
  if (((int)param_2 < (int)DAT_00086b28) || (param_1 == (byte *)0x0)) {
    if ((int)param_2 < (int)DAT_00086b24) {
      DAT_0023b81c = 4;
      if ((param_2 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 4;
      }
      DAT_0023b4d8 = 0x1000;
      DAT_0023b824 = 0x40;
      sVar2 = (short)((param_3 & 0xff) << 10);
    }
    else {
      psVar1 = (short *)0x0;
      bVar5 = param_2 != 0;
      DAT_0023b81c = 0;
      if (bVar5) {
        psVar1 = &DAT_00086b30;
      }
      DAT_0023b824 = 0x10;
      if (bVar5) {
        psVar1 = (short *)(int)*psVar1;
      }
      sVar2 = (short)((param_3 & 0xff) << 6);
      param_4 = param_4 + 0x3a;
      if (bVar5) {
        DAT_0023b81c = (ushort)psVar1;
      }
      DAT_0023b4d8 = 0x100;
    }
    DAT_0023b828 = sVar2 - 1;
    iVar3 = (int)DAT_0023b818;
    DAT_0023b818 = (char)((uint)((iVar3 + 1) * 0x1000000) >> 0x18);
    if (iVar3 < 1) {
      *DAT_00110fc0 = 0x3e;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = param_4 & 0xff;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b4d8;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b828;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    if (param_1 != (byte *)0x0) {
      uVar4 = 0xa2;
      if (DAT_0023b4dc == 0) {
        uVar4 = 0xa0;
      }
      *DAT_00110fc0 = uVar4;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*param_1 + (ushort)param_1[1] * 0x100;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)param_1[2] + (ushort)param_1[3] * 0x100;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
  }
  else {
    /* BUG FIX: was `FUN_0005dff4();` -- dropped all 4 arguments, the
       same bug fixed just above in emit_floor_texture_select's own
       fallback. This function's own params exactly match
       emit_flat_diagonal_texture_select's signature, and the outer
       condition being false here means none of the branches that
       repurpose param_4 have executed yet, so all 4 incoming values
       are still intact to forward. */
    emit_flat_diagonal_texture_select(param_1,param_2,param_3,param_4);
  }
  return;
}


// was FUN_0005d2b0 -- configures the dynamic entries (indices 1/3,
// DAT_00086b3c/DAT_00086b44) of the tile-surface texture-emit
// function-pointer table based on the texture detail-level setting
// (DAT_00086df8+0xb5's high nibble, confirmed shared with
// draw_detail_level_panel/handle_detail_level_click): higher detail
// levels pick emit_floor_texture_select (full textured), lower pick
// emit_flat_wall_texture_select (flat-shaded fallback). Also sets the
// DAT_00086b2c pair-select index. NOTE: an existing comment on
// DAT_00086b38_fnptrs attributes this patching to "FUN_0005d664",
// which doesn't match this function's own address (0x5d2b0) -- a
// stale/incorrect reference in that comment, corrected below.
void configure_texture_detail_functions()

{
  uint uVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;

  bVar3 = false;
  DAT_00086b2c = 0;
  uVar1 = (uint)(short)(ushort)(*(byte *)(DAT_00086df8 + 0xb5) >> 4);
  bVar4 = false;
  if (uVar1 != 0) {
    bVar6 = SBORROW4(uVar1,1);
    iVar2 = uVar1 - 1;
    bVar5 = uVar1 == 1;
    bVar3 = 1 < uVar1;
    if (1 < uVar1) {
      bVar6 = SBORROW4(uVar1,2);
      iVar2 = uVar1 - 2;
      bVar5 = uVar1 == 2;
    }
    DAT_00086b2c = 1;
    if (!bVar5 && iVar2 < 0 == bVar6) {
      bVar4 = true;
    }
  }
  if (bVar4) {
    DAT_00086b44 = emit_floor_texture_select;
  }
  else {
    DAT_00086b44 = emit_flat_wall_texture_select;
  }
  if (bVar3) {
    DAT_00086b3c = emit_floor_texture_select;
  }
  else {
    DAT_00086b3c = emit_flat_wall_texture_select;
  }
  DAT_00086b30 = 1;
  return;
}


// was FUN_0001e848 -- identity-init then compose up to 3 axis rotation matrices from angle-table indices (DAT_000d9ed8 sin / DAT_000d9930 cos); used by an object/effect transform, not the tile pipeline
void build_euler_rotation_matrix(param_1,param_2,param_3,param_4)
int * param_1;
int param_2;
int param_3;
int param_4;

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  uint extraout_r3;
  uint extraout_r3_00;
  uint extraout_r3_01;
  uint extraout_r3_02;
  uint uVar8;
  int *piVar9;
  undefined4 uVar10;
  uint uVar11;
  undefined4 uVar12;
  int iVar13;
  uint uVar14;
  /* This whole local block was a run of individually-named scalars
     (local_164, local_160, ... auStack_124[5], local_a4[2], ...) instead
     of the real 4x4 (16-`undefined4`/64-byte) matrix buffers
     set_identity_matrix4x4/multiply_matrix4x4/copy_matrix4x4 actually read and write --
     same "split-symbol matrix" bug class as copy_matrix4x4's own pointer-
     truncation fix (see its comment), just on the caller's stack instead
     of a global. Every one of those calls overflowed by 20-60+ bytes
     into whatever locals or padding happened to follow, corrupting the
     stack canary -- latent for as long as build_euler_rotation_matrix's
     only real caller (emit_catalog_object's animation-rotation path)
     never had real per-object-type property data reaching it with a
     nonzero angle; became a guaranteed `__stack_chk_fail` abort the
     moment the DAT_00202c9X object-property fix above let that happen
     (confirmed via ASAN + a stack-canary abort in exactly this
     function). Restructured into four real 16-element matrix buffers
     (one per set_identity_matrix4x4 call site: the unconditional one, then one per
     param_2/3/4 branch), with each formerly-named scalar mapped to its
     real row-major slot -- confirmed against set_identity_matrix4x4's own identity
     writes (indices 0/5/10/15, the standard 4x4 diagonal): the named
     locals for each cluster line up exactly on a 4-wide row stride
     (e.g. local_164/154/144 are 0x10 apart = row 0/1/2 of column 0),
     landing the two clusters' surviving diagonal writes (auStack_124's
     local_fc, local_a4's local_7c) on index 10 as expected. param_2's
     and param_4's branches are dead in every real call (the only call
     site always passes 0 for both) so their exact rotation math wasn't
     re-derived beyond making them memory-safe. */
  undefined4 local_164_arr [16];
  undefined4 auStack_124 [16];
  undefined4 local_e4_arr [16];
  undefined4 local_a4 [16];
  undefined4 auStack_64 [16];
#define local_164 local_164_arr[0]
#define local_160 local_164_arr[1]
#define local_15c local_164_arr[2]
#define local_154 local_164_arr[4]
#define local_150 local_164_arr[5]
#define local_14c local_164_arr[6]
#define local_144 local_164_arr[8]
#define local_140 local_164_arr[9]
#define local_13c local_164_arr[10]
#define local_110 auStack_124[5]
#define local_10c auStack_124[6]
#define local_100 auStack_124[9]
#define local_fc auStack_124[10]
#define local_e4 local_e4_arr[0]
#define local_e0 local_e4_arr[1]
#define local_d4 local_e4_arr[4]
#define local_d0 local_e4_arr[5]
#define local_9c local_a4[2]
#define local_84 local_a4[8]
#define local_7c local_a4[10]

  uVar11 = 0;
  uVar14 = 0;
  if (((param_2 == 0) && (param_3 == 0)) && (param_4 == 0)) {
    return;
  }
  set_identity_matrix4x4(local_164_arr);
  uVar8 = extraout_r3;
  if (param_2 != 0) {
    set_identity_matrix4x4(auStack_124);
    uVar10 = (&DAT_000d9ed8)[param_2];
    local_10c = (&DAT_000d9930)[param_2];
    local_110 = uVar10;
    local_100 = Ordinal_2023();
    uVar8 = extraout_r3_00;
    local_fc = uVar10;
  }
  if (param_3 != 0) {
    set_identity_matrix4x4(local_a4);
    uVar10 = (&DAT_000d9ed8)[param_3];
    uVar12 = (&DAT_000d9930)[param_3];
    uVar11 = uVar14;
    local_a4[0] = uVar10;
    local_9c = Ordinal_2023(uVar12);
    uVar8 = extraout_r3_01;
    uVar14 = uVar11;
    local_84 = uVar12;
    local_7c = uVar10;
  }
  if (param_4 != 0) {
    set_identity_matrix4x4(local_e4_arr);
    uVar10 = (&DAT_000d9ed8)[param_4];
    local_e0 = (&DAT_000d9930)[param_4];
    local_e4 = uVar10;
    local_d4 = Ordinal_2023();
    uVar8 = extraout_r3_02;
    local_d0 = uVar10;
  }
  if (param_2 != 0) {
    uVar11 = 4;
    uVar14 = 4;
    uVar8 = uVar11;
  }
  if (param_3 != 0) {
    uVar11 = uVar11 | 2;
    uVar8 = uVar11;
    uVar14 = uVar11;
  }
  if (param_4 != 0) {
    uVar11 = uVar11 | 1;
    uVar8 = uVar11;
    uVar14 = uVar11;
  }
  if (uVar11 == 1) {
    puVar4 = &local_e4;
  }
  else {
    if (uVar11 != 2) {
      if (uVar11 == 3) {
        puVar4 = local_a4;
LAB_0001e9c4:
        puVar7 = &local_e4;
      }
      else {
        if (uVar11 == 4) {
          puVar4 = auStack_124;
          goto LAB_0001ea10;
        }
        if (uVar11 == 5) {
          puVar7 = &local_e4;
        }
        else {
          if (uVar11 != 6) {
            if (uVar11 != 7) goto LAB_0001ea18;
            multiply_matrix4x4(auStack_124,local_a4,auStack_64,uVar8,uVar14);
            puVar4 = auStack_64;
            goto LAB_0001e9c4;
          }
          puVar7 = local_a4;
        }
        puVar4 = auStack_124;
      }
      multiply_matrix4x4(puVar4,puVar7,&local_164);
      goto LAB_0001ea18;
    }
    puVar4 = local_a4;
  }
LAB_0001ea10:
  copy_matrix4x4(puVar4,&local_164);
LAB_0001ea18:
  iVar13 = 0;
  piVar9 = param_1;
  if (0 < *param_1) {
    do {
      iVar1 = piVar9[4];
      iVar2 = piVar9[3];
      iVar3 = piVar9[2];
      uVar10 = Ordinal_2026(iVar3,local_160);
      uVar12 = Ordinal_2026(iVar2,local_150);
      uVar10 = Ordinal_2051(uVar10,uVar12);
      uVar12 = Ordinal_2026(iVar1,local_140);
      uVar10 = Ordinal_2051(uVar10,uVar12);
      uVar12 = Ordinal_2026(iVar3,local_15c);
      uVar5 = Ordinal_2026(iVar2,local_14c);
      uVar12 = Ordinal_2051(uVar12,uVar5);
      uVar5 = Ordinal_2026(iVar1,local_13c);
      uVar12 = Ordinal_2051(uVar12,uVar5);
      uVar5 = Ordinal_2026(iVar3,local_164);
      uVar6 = Ordinal_2026(iVar2,local_154);
      uVar5 = Ordinal_2051(uVar5,uVar6);
      uVar6 = Ordinal_2026(iVar1,local_144);
      uVar5 = Ordinal_2051(uVar5,uVar6);
      *(char *)(piVar9 + 2) = (char)uVar5;
      iVar13 = iVar13 + 1;
      *(char *)(piVar9 + 3) = (char)uVar10;
      *(char *)(piVar9 + 4) = (char)uVar12;
      *(char *)((char *)piVar9 + 9) = (char)((uint)uVar5 >> 8);
      *(char *)((char *)piVar9 + 10) = (char)((uint)uVar5 >> 0x10);
      *(char *)((char *)piVar9 + 0xb) = (char)((uint)uVar5 >> 0x18);
      *(char *)((char *)piVar9 + 0xd) = (char)((uint)uVar10 >> 8);
      *(char *)((char *)piVar9 + 0xe) = (char)((uint)uVar10 >> 0x10);
      *(char *)((char *)piVar9 + 0xf) = (char)((uint)uVar10 >> 0x18);
      *(char *)((char *)piVar9 + 0x11) = (char)((uint)uVar12 >> 8);
      *(char *)((char *)piVar9 + 0x12) = (char)((uint)uVar12 >> 0x10);
      *(char *)((char *)piVar9 + 0x13) = (char)((uint)uVar12 >> 0x18);
      piVar9 = piVar9 + 3;
    } while (iVar13 < *param_1);
  }
#undef local_164
#undef local_160
#undef local_15c
#undef local_154
#undef local_150
#undef local_14c
#undef local_144
#undef local_140
#undef local_13c
#undef local_110
#undef local_10c
#undef local_100
#undef local_fc
#undef local_e4
#undef local_e0
#undef local_d4
#undef local_d0
#undef local_9c
#undef local_84
#undef local_7c
  return;
}



// was FUN_0001ecb0 -- apply a matrix built by build_euler_rotation_matrix to a point/vertex list
void transform_points_by_matrix(param_1,param_2)
int * param_1;
int * param_2;

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  int *piVar6;
  int *piVar7;
  int iVar8;
  int iVar9;
  int *piVar10;
  int *piVar11;
  int local_30;
  int local_2c;
  
  iVar9 = 0;
  iVar1 = *param_1;
  local_30 = param_1[1];
  iVar8 = iVar1;
  if (0 < *param_2) {
    piVar4 = param_1 + iVar1 * 3;
    piVar3 = param_2;
    do {
      uVar2 = Ordinal_2051(piVar3[2],param_2[0x302]);
      *(char *)(piVar4 + 2) = (char)uVar2;
      *(char *)((char *)piVar4 + 9) = (char)((uint)uVar2 >> 8);
      *(char *)((char *)piVar4 + 10) = (char)((uint)uVar2 >> 0x10);
      *(char *)((char *)piVar4 + 0xb) = (char)((uint)uVar2 >> 0x18);
      uVar2 = Ordinal_2051(piVar3[3],param_2[0x303]);
      *(char *)(piVar4 + 3) = (char)uVar2;
      *(char *)((char *)piVar4 + 0xd) = (char)((uint)uVar2 >> 8);
      *(char *)((char *)piVar4 + 0xe) = (char)((uint)uVar2 >> 0x10);
      *(char *)((char *)piVar4 + 0xf) = (char)((uint)uVar2 >> 0x18);
      uVar2 = Ordinal_2051(piVar3[4],param_2[0x304]);
      *(char *)(piVar4 + 4) = (char)uVar2;
      *(char *)((char *)piVar4 + 0x11) = (char)((uint)uVar2 >> 8);
      *(char *)((char *)piVar4 + 0x12) = (char)((uint)uVar2 >> 0x10);
      *(char *)((char *)piVar4 + 0x13) = (char)((uint)uVar2 >> 0x18);
      iVar9 = iVar9 + 1;
      iVar8 = iVar8 + 1;
      piVar4 = piVar4 + 3;
      piVar3 = piVar3 + 3;
    } while (iVar9 < *param_2);
  }
  *(char *)param_1 = (char)iVar8;
  *(char *)((char *)param_1 + 1) = (char)((uint)iVar8 >> 8);
  local_2c = 0;
  *(char *)((char *)param_1 + 2) = (char)((uint)iVar8 >> 0x10);
  *(char *)((char *)param_1 + 3) = (char)((uint)iVar8 >> 0x18);
  if (0 < param_2[1]) {
    piVar4 = param_1 + local_30 * 0x18;
    piVar3 = param_2;
    do {
      iVar8 = piVar3[0x318];
      *(char *)(piVar4 + 0x1218) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4861) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4862) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4863) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x319];
      *(char *)(piVar4 + 0x1219) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4865) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4866) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4867) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x31a];
      *(char *)(piVar4 + 0x121a) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4869) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x486a) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x486b) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x31b];
      *(char *)(piVar4 + 0x121b) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x486d) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x486e) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x486f) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x31c];
      *(char *)(piVar4 + 0x121c) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4871) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4872) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4873) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x30b];
      *(char *)(piVar4 + 0x120b) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x482d) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x482e) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x482f) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x30c];
      *(char *)(piVar4 + 0x120c) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4831) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4832) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4833) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x30d];
      *(char *)(piVar4 + 0x120d) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4835) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4836) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4837) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x305];
      *(char *)(piVar4 + 0x1205) = (char)iVar8;
      *(char *)((char *)piVar4 + 0x4815) = (char)((uint)iVar8 >> 8);
      *(char *)((char *)piVar4 + 0x4816) = (char)((uint)iVar8 >> 0x10);
      *(char *)((char *)piVar4 + 0x4817) = (char)((uint)iVar8 >> 0x18);
      iVar8 = piVar3[0x305];
      if (0 < iVar8) {
        piVar5 = piVar4 + 0x1206;
        piVar6 = piVar3;
        piVar7 = piVar3;
        piVar11 = piVar4;
        do {
          piVar10 = piVar7 + 0x306;
          iVar8 = iVar8 + -1;
          piVar7 = piVar7 + 1;
          iVar9 = *piVar10 + iVar1;
          *(char *)piVar5 = (char)iVar9;
          *(char *)((char *)piVar5 + 1) = (char)((uint)iVar9 >> 8);
          *(char *)((char *)piVar5 + 2) = (char)((uint)iVar9 >> 0x10);
          *(char *)((char *)piVar5 + 3) = (char)((uint)iVar9 >> 0x18);
          piVar5 = piVar5 + 1;
          iVar9 = piVar6[0x30e];
          *(char *)(piVar11 + 0x120e) = (char)iVar9;
          *(char *)((char *)piVar11 + 0x4839) = (char)((uint)iVar9 >> 8);
          *(char *)((char *)piVar11 + 0x483a) = (char)((uint)iVar9 >> 0x10);
          *(char *)((char *)piVar11 + 0x483b) = (char)((uint)iVar9 >> 0x18);
          piVar10 = piVar6 + 0x30f;
          piVar6 = piVar6 + 2;
          iVar9 = *piVar10;
          *(char *)(piVar11 + 0x120f) = (char)iVar9;
          *(char *)((char *)piVar11 + 0x483d) = (char)((uint)iVar9 >> 8);
          *(char *)((char *)piVar11 + 0x483e) = (char)((uint)iVar9 >> 0x10);
          *(char *)((char *)piVar11 + 0x483f) = (char)((uint)iVar9 >> 0x18);
          piVar11 = piVar11 + 2;
        } while (iVar8 != 0);
      }
      local_2c = local_2c + 1;
      local_30 = local_30 + 1;
      piVar4 = piVar4 + 0x18;
      piVar3 = piVar3 + 0x18;
    } while (local_2c < param_2[1]);
  }
  *(char *)(param_1 + 1) = (char)local_30;
  *(char *)((char *)param_1 + 5) = (char)((uint)local_30 >> 8);
  *(char *)((char *)param_1 + 6) = (char)((uint)local_30 >> 0x10);
  *(char *)((char *)param_1 + 7) = (char)((uint)local_30 >> 0x18);
  return;
}
