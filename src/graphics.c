/* Low-level pixel-primitive functions: color state, rect fill/save/
 * restore, paletted-bitmap blitting into the game's internal software
 * framebuffer, the whole-screen backup/restore save state used by
 * transient panels, palette fade in/out, and the per-frame dungeon-view
 * driver/flush, and palette conversion/rotation (PALS.DAT byte
 * expansion, RGB565 LUT rebuild, palette-range cycling). Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed. */
#include "headers/graphics.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* Scratch buffer for rect_fill_or_save_restore's save/restore modes --
 * only ever used within this function, so it stays local to this file
 * (unlike g_palette_rgb565_backing, which uw.c also needs and is extern'd in
 * uw.h instead). */
static undefined2 DAT_000879b8_backing[32768];
#define DAT_000879b8 DAT_000879b8_backing[0]



void set_draw_color(param_1)
undefined2 param_1;

{
  DEBUG(TRACE, "[graphics] set draw color to %u", param_1);
  DAT_000a85c0 = param_1;
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

void rect_fill_or_save_restore(param_1,param_2,param_3,param_4)
ushort param_1;
uint param_2;
short param_3;
short param_4;

{
  short sVar1;
  uint uVar2;
  uint uVar3;
  void *pvVar_buf25800;
  int iVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  undefined2 *puVar8;
  uint uVar9;
  short sVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  
  DEBUG(TRACE, "[graphics] rect_fill_or_save_restore(%u,%u,%u,%u)", param_1, param_2, param_3, param_4);

  if (DAT_00204848 != 0 && getenv("UW_DEBUG_CURSORCLIP")) {
    fprintf(stderr, "[cursorclip] request color=%d rect=(%d,%d,%d,%d) clip=(%d,%d,%d,%d)\n",
            (int)DAT_000a85c0, (int)(short)param_1, (int)(short)param_2, (int)param_3, (int)param_4,
            (int)(short)DAT_000a85c4, (int)(short)DAT_000a85c8,
            (int)(short)DAT_000842a4, (int)(short)DAT_000842a8);
  }

  iVar14 = (int)(short)param_1;
  iVar13 = (param_3 - iVar14) * 0x10000;
  iVar11 = iVar13 >> 0x10;
  iVar4 = (int)(short)param_2;
  iVar15 = (param_4 - iVar4) * 0x10000;
  iVar12 = iVar15 >> 0x10;
  dirty_rect_union(param_2 & 0xffff,param_4,param_1,param_3);
  if ((int)(short)DAT_000a85c4 <= iVar11 + iVar14 + -1) {
    if (iVar14 < (short)DAT_000a85c4) {
      iVar14 = (int)(short)DAT_000a85c4;
      iVar11 = ((int)(short)DAT_000a85c4 - (int)(short)DAT_000a85c4) +
               (int)(short)((uint)iVar13 >> 0x10);
      param_1 = DAT_000a85c4;
    }
    sVar10 = (short)iVar11;
    if (iVar14 <= DAT_000842a4) {
      if ((DAT_000842a4 - iVar14) + 1 < (int)sVar10) {
        sVar10 = (DAT_000842a4 - param_1) + 1;
      }
      sVar1 = (short)((uint)iVar15 >> 0x10);
      if ((int)DAT_000a85c8 <= sVar1 + iVar4) {
        if (iVar4 < DAT_000a85c8) {
          iVar12 = ((int)DAT_000a85c8 - (int)(short)param_2) + (int)sVar1;
          param_2 = (int)DAT_000a85c8;
        }
        if ((int)(short)param_2 <= (int)DAT_000842a8) {
          if (((int)DAT_000842a8 - (int)(short)param_2) + 1 < (int)(short)iVar12) {
            iVar12 = ((int)DAT_000842a8 - param_2) + 1;
          }
          uVar2 = (uint)param_1;
          param_1 = sVar10 + param_1;
          uVar5 = param_2 & 0xffff;
          uVar9 = iVar12 + (param_2 & 0xffff);
          iVar13 = 0;
          // DAT_00204848 is only ever set by the mouse-cursor code (FUN_000584c0 sets it to 1 right before deliberately drawing with color 0x14, to save what's under the cursor), so colors 0x14/0x15 only mean save/restore during that specific sequence -- with DAT_00204848 at its default 0 (every other caller), they're ordinary palette colors and this whole block is skipped in favor of the flat fill below. There are 256 real palette entries (0x100, see the palette-conversion loop), so 20/21 aren't reserved from the palette's own perspective either.
          if (DAT_00204848 != 0 && getenv("UW_DEBUG_CURSORCLIP")) {
            fprintf(stderr, "[cursorclip] PROCEEDING color=%d clipped_rect=(%u,%u)-(%u,%u)\n",
                    (int)DAT_000a85c0, uVar2, uVar5, (uint)param_1, uVar9);
          }
          if (DAT_00204848 != 0) {
            if (DAT_000a85c0 == 0x14) {
              // SAVE mode: copy the rect from g_uw_framebuffer into the DAT_000879b8 scratch buffer.
              if ((uVar9 & 0xffff) <= uVar5) {
                return;
              }
              iVar15 = uVar5 * 0x140;
              pvVar_buf25800 = g_uw_framebuffer;
              do {
                if (63999 < iVar15) {
                  return;
                }
                if (uVar2 < param_1) {
                  puVar8 = &DAT_000879b8 + iVar13;
                  uVar7 = uVar2;
                  do {
                    if (0x13f < (int)uVar7) break;
                    iVar14 = iVar15 + uVar7;
                    uVar7 = uVar7 + 1;
                    iVar13 = iVar13 + 1;
                    *puVar8 = *(undefined2 *)((char *)pvVar_buf25800 + iVar14 * 2);
                    puVar8 = puVar8 + 1;
                  } while ((int)uVar7 < (int)(uint)param_1);
                }
                uVar5 = uVar5 + 1;
                iVar15 = iVar15 + 0x140;
                if ((int)(uVar9 & 0xffff) <= (int)uVar5) {
                  return;
                }
              } while( true );
            }
            if (DAT_000a85c0 == 0x15) {
              // RESTORE mode: copy the rect back from the DAT_000879b8 scratch buffer into g_uw_framebuffer.
              if ((uVar9 & 0xffff) <= uVar5) {
                return;
              }
              iVar15 = uVar5 * 0x140;
              do {
                if (63999 < iVar15) {
                  return;
                }
                if (uVar2 < param_1) {
                  puVar8 = &DAT_000879b8 + iVar13;
                  uVar6 = uVar2;
                  do {
                    if (0x13f < (int)uVar6) break;
                    iVar14 = iVar15 + uVar6;
                    uVar6 = uVar6 + 1;
                    iVar13 = iVar13 + 1;
                    *(undefined2 *)((g_uw_framebuffer) + iVar14 * 2) =
                         *puVar8;
                    puVar8 = puVar8 + 1;
                  } while ((int)uVar6 < (int)(uint)param_1);
                }
                uVar5 = uVar5 + 1;
                iVar15 = iVar15 + 0x140;
                if ((int)(uVar9 & 0xffff) <= (int)uVar5) {
                  return;
                }
              } while( true );
            }
          }
          if (uVar5 < (uVar9 & 0xffff)) {
            // FILL mode (default -- reached whenever save/restore isn't active): flood the rect with the current draw color.
            iVar13 = uVar5 * 0x140;
            do {
              if (63999 < iVar13) {
                return;
              }
              for (uVar6 = uVar2; ((int)uVar6 < (int)(uint)param_1 && ((int)uVar6 < 0x140));
                  uVar6 = uVar6 + 1) {
                *(undefined2 *)
                 ((g_uw_framebuffer) + (iVar13 + uVar6) * 2) =
                     (&g_palette_rgb565)[DAT_000a85c0];
              }
              uVar5 = uVar5 + 1;
              iVar13 = iVar13 + 0x140;
            } while ((int)uVar5 < (int)(uVar9 & 0xffff));
          }
        }
      }
    }
  }
  debug_framebuffer_dump("rect_fill");
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

void bitmap_blit_to_framebuffer(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
ushort param_1;
ushort param_2;
char *param_3;
short param_4;
short param_5;
short param_6;
short param_7;

{
  short sVar1;
  int iVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  short sVar12;
  short sVar13;
  short sVar14;
  short sVar15;
  /* param_3 is the source-bitmap pointer (was `int`, truncating it on
     this 64-bit host -- every caller passes a real malloc'd/global
     pixel-data pointer, e.g. blit_fullscreen_bitmap_file's OPSCR.BYT load buffer). This
     accumulator reconstructs a moving source-row address from it each
     iteration, so it needs to stay a full-width pointer-sized value. */
  intptr_t local_34;
  
  DEBUG(TRACE, "[graphics] bitmap_blit_to_framebuffer(%u,%u,%p,%u,%u,%u,%u)", param_1, param_2, (void *)param_3, param_4, param_5, param_6, param_7);

  sVar13 = 0;
  iVar11 = (int)param_6;
  sVar12 = 0;
  local_34 = (intptr_t)param_3 + (int)param_7 * (int)param_5 + iVar11;
  iVar9 = (uint)param_1 << 0x10;
  iVar8 = iVar9 >> 0x10;
  if (iVar8 < 0) {
    iVar9 = iVar8 * -0x10000;
  }
  sVar15 = 0;
  if (iVar8 < 0) {
    sVar15 = (short)((uint)iVar9 >> 0x10);
  }
  iVar9 = (uint)param_2 << 0x10;
  iVar7 = iVar9 >> 0x10;
  if (iVar7 < 0) {
    iVar9 = iVar7 * -0x10000;
  }
  sVar14 = 0;
  if (iVar7 < 0) {
    sVar14 = (short)((uint)iVar9 >> 0x10);
  }
  iVar9 = ((int)param_5 - (int)param_6) * 0x10000 >> 0x10;
  if (0x140 < iVar8 + iVar9) {
    sVar13 = param_1 + (short)((int)param_5 - (int)param_6) + -0x140;
  }
  sVar1 = (short)((uint)(((int)param_4 - (int)param_7) * 0x10000) >> 0x10);
  iVar2 = (int)sVar1;
  if (200 < iVar7 + iVar2) {
    sVar12 = param_2 + sVar1 + -200;
  }
  /* Was a 3-argument call to a K&R-style `dirty_rect_union()` (no
     prototype, so this compiles without error) -- missing its 4th
     ("right" bound) argument entirely. On real ARM32 hardware this
     genuinely forwarded whatever the caller's own incoming register
     held (same bug class already fixed in extract_and_refresh_slot_item,
     see uw.c's own writeup); on this 64-bit host the callee instead
     reads garbage, so the accumulated dirty rect's right edge doesn't
     reliably extend to cover this blit's actual width. Confirmed live:
     this is the cause of "redraw areas don't match the actual inventory
     button sizes" (both a freshly-placed item's icon and
     close_backpack_container's own panel-background repaint go through
     this call) -- sibling call draw_sprite_by_id already passes all 4
     bounds correctly and was the reference for this fix. */
  if (getenv("UW_DEBUG_BLITRAW")) {
    fprintf(stderr, "[blitfb] dstX=%d dstY=%d w=%d h=%d -> dirty top=%d bottom=%d left=%d right=%d\n",
            (int)param_1, (int)param_2, (int)iVar9, (int)iVar2,
            iVar7, iVar7 + iVar2, iVar8, iVar8 + iVar9);
  }
  dirty_rect_union(iVar7,iVar7 + iVar2,iVar8,iVar8 + iVar9);
  iVar5 = (int)sVar14;
  if (g_blit_transparent_mode == 0) {
    if (iVar5 < iVar2 - sVar12) {
      iVar3 = (int)sVar15;
      iVar8 = (iVar7 + iVar5) * 0x140 + iVar8;
      do {
        if (iVar3 < iVar9 - sVar13) {
          iVar7 = (iVar8 + iVar3) * 2;
          iVar6 = iVar3;
          do {
            pbVar4 = (byte *)(iVar9 * iVar5 + local_34 + iVar6);
            iVar6 = iVar6 + 1;
            *(undefined2 *)(iVar7 + (g_uw_framebuffer)) =
                 (&g_palette_rgb565)[*pbVar4];
            iVar7 = iVar7 + 2;
          } while (iVar6 < iVar9 - sVar13);
        }
        iVar5 = iVar5 + 1;
        iVar8 = iVar8 + 0x140;
        local_34 = iVar11 + local_34;
      } while (iVar5 < iVar2 - sVar12);
    }
  }
  else if (iVar5 < iVar2 - sVar12) {
    iVar8 = (iVar7 + iVar5) * 0x140 + iVar8;
    do {
      if ((int)sVar15 < iVar9 - sVar13) {
        iVar7 = (int)sVar15;
        do {
          uVar10 = (uint)*(byte *)(iVar9 * iVar5 + local_34 + iVar7);
          if (uVar10 != 0) {
            *(undefined2 *)((g_uw_framebuffer) + (iVar8 + iVar7) * 2) =
                 (&g_palette_rgb565)[uVar10];
          }
          iVar7 = iVar7 + 1;
        } while (iVar7 < iVar9 - sVar13);
      }
      iVar5 = iVar5 + 1;
      iVar8 = iVar8 + 0x140;
      local_34 = iVar11 + local_34;
    } while (iVar5 < iVar2 - sVar12);
  }
  debug_framebuffer_dump("blit");
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// Snapshots the current 320x200 framebuffer into the DAT_000891b0 backup
// buffer, skipping any pixel already equal to g_transparent_screen_color.
// First half of the transient-panel idiom: a caller saves a clean
// background here, draws a panel over it leaving untouched areas in the
// transparent key color, then calls screen_backup_restore[_rect] to pour
// the saved pixels back into those gaps.
undefined4 screen_backup_save()

{
  short sVar1;
  short *psVar2;
  short *psVar3;
  int iVar4;
  int iVar5;
  
  sVar1 = g_transparent_screen_color;
  iVar5 = 200;
  psVar3 = (short *)(g_uw_framebuffer);
  psVar2 = psVar3;
  do {
    iVar4 = 0x140;
    do {
      iVar4 = iVar4 + -1;
      if (*psVar2 != sVar1) {
        /* `(intptr_t)&DAT_000891b0` fixed globally across the file (17
           sites) -- taking a global's address then truncating it through
           `(int)` before pointer arithmetic, same bug class as the
           `(TYPE *)((int)VAR + offset)` pattern fixed much earlier, just
           differently shaped so the original regex-based pass missed it.
           `(int)psVar3`/`(int)psVar2` right here are a related but
           distinct case (casting pointer *variables*, not `&global`, to
           int) not swept up by that fix; left alone since psVar2/psVar3
           are both short-array cursors into the same nearby buffers in
           practice and this hasn't been observed to crash, but worth
           revisiting if it does. */
        *(short *)(((intptr_t)&DAT_000891b0 - (int)psVar3) + (int)psVar2) = *psVar2;
      }
      psVar2 = psVar2 + 1;
    } while (iVar4 != 0);
    iVar5 = iVar5 + -1;
  } while (iVar5 != 0);
  return 0;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// Whole-screen composite: every framebuffer pixel still equal to
// g_transparent_screen_color is refilled from the screen_backup_save
// snapshot (DAT_000891b0), then the frame is presented.
void screen_backup_restore()

{
  int iVar1;
  short *psVar2;
  int iVar3;
  
  dirty_rect_union(0,200,0,0x140);
  iVar1 = 0;
  do {
    iVar3 = 0x140;
    do {
      iVar3 = iVar3 + -1;
      psVar2 = (short *)(iVar1 + (g_uw_framebuffer));
      if (*psVar2 == g_transparent_screen_color) {
        *psVar2 = *(short *)((intptr_t)&DAT_000891b0 + iVar1);
      }
      iVar1 = iVar1 + 2;
    } while (iVar3 != 0);
  } while (iVar1 < 0x1f400);
  debug_framebuffer_dump("screen_backup_restore");
  flush_dirty_rect_to_display(1);
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// screen_backup_restore bounded to the rect (param_1,param_2)-(param_3,
// param_4); unlike the full-screen version it does not present.
void screen_backup_restore_rect(param_1,param_2,param_3,param_4)
uint param_1;
uint param_2;
uint param_3;
uint param_4;

{
  uint uVar1;
  int iVar2;
  short *psVar3;
  int iVar4;
  
  dirty_rect_union(0,200,0,0x140);
  param_2 = param_2 & 0xffff;
  if (param_2 < (param_4 & 0xffff)) {
    iVar4 = param_2 * 0x140;
    do {
      if (63999 < iVar4) {
        return;
      }
      uVar1 = param_1 & 0xffff;
      while (((int)uVar1 < (int)(param_3 & 0xffff) && ((int)uVar1 < 0x140))) {
        iVar2 = iVar4 + uVar1;
        uVar1 = uVar1 + 1;
        psVar3 = (short *)(iVar2 * 2 + (g_uw_framebuffer));
        if (*psVar3 == g_transparent_screen_color) {
          *psVar3 = (&DAT_000891b0)[iVar2];
        }
      }
      param_2 = param_2 + 1;
      iVar4 = iVar4 + 0x140;
    } while ((int)param_2 < (int)(param_4 & 0xffff));
  }
  debug_framebuffer_dump("screen_backup_restore_rect");
  return;
}




// was FUN_000122d4
void fade_in(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
ushort *param_3;

{
  int iVar1;
  ushort uVar2;
  ushort *puVar3;
  undefined4 uVar4;
  int iVar5;
  ushort *puVar6;
  int iVar7;
  /* iVar8 held a `param_3 - puVar3` relative offset then re-added to
     puVar6 to reconstruct a destination pointer -- correct as pointer
     *difference* arithmetic, but iVar8/`(int)puVar6` truncated both
     the difference and the re-addition to 32 bits on this 64-bit host
     now that param_3 is a real (not truncated) pointer. Kept as the
     same relative-offset idiom, just computed/applied via intptr_t. */
  intptr_t iVar8;
  int iVar9;
  /* in_stack_0000000c/in_stack_00000014 were declared as fresh locals
     but never assigned anywhere -- reading them was reading
     uninitialized memory. param_1/param_2 are, symmetrically, declared
     but never otherwise used in this function. Classic Ghidra artifact
     where the same two incoming arguments got modeled twice (once as
     real parameters, once as phantom "leftover on the stack" locals)
     due to a calling-convention mismatch; param_1/param_2 are what
     FUN_00040f34 actually needs here. */

  puVar3 = (ushort *)Ordinal_1041(0x1f400);
  FUN_00040f34(param_1,param_2);
  Ordinal_1044(puVar3,param_3,0x1f400);
  iVar9 = 1;
  // HACK: diagnostic addition, not in the original decompile -- timestamps this fade for the TRACE log below.
  uint diag_t0 = read_realtime_clock_units();
  do {
    uVar4 = Ordinal_2032(iVar9);
    uVar4 = Ordinal_2026(uVar4,0x3e000000);
    Ordinal_2026(uVar4,0x45800000);
    iVar5 = Ordinal_2020();
    iVar8 = (intptr_t)param_3 - (intptr_t)puVar3;
    iVar7 = 64000;
    puVar6 = puVar3;
    do {
      iVar7 = iVar7 + -1;
      iVar1 = ((int)((*puVar6 & 0xf800) << 1) >> 6) * iVar5 >> 0x12;
      *(short *)(iVar8 + (intptr_t)puVar6) = (short)((uint)(iVar1 << 0x1b) >> 0x10);
      uVar2 = (ushort)(iVar1 << 0xb) |
              (ushort)((((int)((*puVar6 & 0x7e0) << 7) >> 6) * iVar5 >> 0x12) << 5);
      *(ushort *)(iVar8 + (intptr_t)puVar6) = uVar2;
      *(ushort *)(iVar8 + (intptr_t)puVar6) =
           uVar2 | (ushort)(((int)((*puVar6 & 0x1f) << 0xc) >> 6) * iVar5 >> 0x12);
      puVar6 = puVar6 + 1;
    } while (iVar7 != 0);
    flush_dirty_rect_to_display(1);
    iVar9 = iVar9 + 1;
  } while (iVar9 < 9);
  iVar9 = 64000;
  puVar6 = puVar3;
  do {
    iVar9 = iVar9 + -1;
    *(ushort *)(((intptr_t)param_3 - (intptr_t)puVar3) + (intptr_t)puVar6) = *puVar6;
    puVar6 = puVar6 + 1;
  } while (iVar9 != 0);
  flush_dirty_rect_to_display(1);
  DEBUG(TRACE, "[fade] fade_in total elapsed=%ums", read_realtime_clock_units() - diag_t0);
  debug_framebuffer_dump("fade_in");
  Ordinal_1018(puVar3);
  return;
}



// was FUN_00012444
void fade_out(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
undefined2 * param_3;

{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  ushort *puVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *puVar7;
  ushort *puVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  /* Same phantom in_stack_/unused-param_1,2 artifact as fade_in
     right above -- see its comment. */

  puVar4 = (ushort *)Ordinal_1041(0x1f400);
  FUN_00040f34(param_1,param_2);
  Ordinal_1044(puVar4,param_3,0x1f400);
  iVar11 = 7;
  iVar10 = 64000;
  // HACK: diagnostic addition, not in the original decompile -- timestamps this fade for the TRACE log below.
  uint diag_t0 = read_realtime_clock_units();
  do {
    uVar5 = Ordinal_2032(iVar11);
    uVar5 = Ordinal_2026(uVar5,0x3e000000);
    Ordinal_2026(uVar5,0x45800000);
    iVar6 = Ordinal_2020();
    iVar9 = 64000;
    puVar7 = puVar4;
    do {
      iVar9 = iVar9 + -1;
      iVar1 = ((int)((*puVar7 & 0xf800) << 1) >> 6) * iVar6 >> 0x12;
      /* Same param_3/puVar4/puVar7 offset-reconstruction truncation as
         fade_in right above -- see its comment. */
      puVar8 = (ushort *)(((intptr_t)param_3 - (intptr_t)puVar4) + (intptr_t)puVar7);
      *puVar8 = (ushort)((uint)(iVar1 << 0x1b) >> 0x10);
      uVar3 = (ushort)(iVar1 << 0xb) |
              (ushort)((((int)((*puVar7 & 0x7e0) << 7) >> 6) * iVar6 >> 0x12) << 5);
      *puVar8 = uVar3;
      uVar2 = *puVar7;
      puVar7 = puVar7 + 1;
      *puVar8 = uVar3 | (ushort)(((int)((uVar2 & 0x1f) << 0xc) >> 6) * iVar6 >> 0x12);
    } while (iVar9 != 0);
    flush_dirty_rect_to_display(1);
    iVar11 = iVar11 + -1;
  } while (0 < iVar11);
  while (iVar10 = iVar10 + -1, -1 < iVar10) {
    *param_3 = 0;
    param_3 = param_3 + 1;
  }
  flush_dirty_rect_to_display(1);
  DEBUG(TRACE, "[fade] fade_out total elapsed=%ums", read_realtime_clock_units() - diag_t0);
  debug_framebuffer_dump("fade_out");
  Ordinal_1018(puVar4);
  return;
}


// was FUN_0001294c -- render_dungeon_frame_timed's own per-frame screen
// flush step (see g_suppress_frame_timed_flush above)
void flush_dungeon_frame()

{
  if (!g_suppress_frame_timed_flush) {
    flush_dirty_rect_to_display(1);
  }
  return;
}




// was FUN_00012970 -- 3D dungeon-view frame driver: clears the viewport then runs the whole pipeline (view matrix, visibility walk, vertex transform, near-clip, rasterize, cleanup)
undefined4 render_dungeon_view()

{
  set_draw_color(0);
  rect_fill_or_save_restore(0x34,0x13,0xe0,0x83);
  build_view_matrix();
  near_clip_visible_tiles(0,0);
  translate_verts_to_camera_space(&DAT_000a85d0);
  project_verts_through_view_matrix(&DAT_000a85d0);
  near_clip_visible_tiles(&DAT_000a85d0,1);
  render_visible_tile_list();
  free_frame_geometry_buffers();
  return 0;
}




// was build_shade_lut -- build the 160-entry distance-shade LUT DAT_000b5638
void build_shade_lut()

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  
  puVar3 = &DAT_000b5638;
  iVar2 = 0;
  iVar4 = 0xa0;
  do {
    uVar1 = Ordinal_2032(iVar2 + 0xa0);
    uVar1 = Ordinal_2026(uVar1,0x3bcccccd);
    Ordinal_2026(uVar1,0x45800000);
    uVar1 = Ordinal_2020();
    iVar4 = iVar4 + -1;
    *puVar3 = uVar1;
    iVar2 = iVar2 + -1;
    puVar3 = puVar3 + 1;
  } while (iVar4 != 0);
  return;
}


static int get_ambient_bias_reduction()
{
  int reduction = g_ambient_bias_reduction;
  const char *_p = getenv("UW_AMBIENT_BIAS_REDUCTION");
  if (_p) reduction = atoi(_p);
  return reduction;
}



// was FUN_00014324 -- sets DAT_000842b0, the 3D-view ambient bias
// raster_textured_span adds to every texel's distance-shade LUT index
// (uw.c's own "checked wall/floor texture rasterizer" comment on that
// function has the full formula). MORE NEGATIVE here means BRIGHTER
// (it pulls the effective distance-shade index down toward the "close/
// bright" end of the LUT regardless of a texel's real depth). Called
// with param_1=0 (giving -0x20) from the "a light source IS currently
// equipped and lit" branch of the function that recomputes derived
// player state whenever equipped items change (uw.c ~55910-55926,
// where the sibling `8 - param_1` call handles the "no light source"
// case) -- this is the brightening half of that pair, not the dim one.
void set_ambient_bias_with_light(param_1)
char param_1;

{
  DAT_000842b0 = -0x20 - param_1 + get_ambient_bias_reduction();
  if (getenv("UW_DEBUG_AMBIENT"))
    fprintf(stderr, "[ambient] set_ambient_bias_with_light(%d) -> DAT_000842b0=%d\n", (int)param_1, (int)DAT_000842b0);
  return;
}



void set_ambient_bias_without_light(param_1)
char param_1;

{
  DAT_000842b0 = '\b' - param_1 + get_ambient_bias_reduction();
  if (getenv("UW_DEBUG_AMBIENT"))
    fprintf(stderr, "[ambient] set_ambient_bias_without_light(%d) -> DAT_000842b0=%d\n", (int)param_1, (int)DAT_000842b0);
  return;
}




// was expand_pals_bytes -- expand PALS.DAT 6-bit channel bytes (param_2) to 8-bit into
// param_1; param_3!=0 copies unscaled
void expand_pals_bytes(param_1,param_2,param_3)
char *param_1;
char * param_2;
int param_3;

{
  char *pcVar1;
  char *pcVar2;
  int iVar3;

  /* param_1 was declared `int` despite every caller passing a real
     pointer (e.g. load_pals_bank: `expand_pals_bytes(auStack_318,param_2,0);`)
     -- truncating it on this 64-bit host. The `param_1 - (int)param_2`
     / `param_2 + param_1` dance below reconstructs param_1 as a
     relative *offset* from param_2 so the loop can address both
     buffers through param_2-relative arithmetic; that only works if the
     subtraction/re-addition isn't itself truncating, so param_1 is kept
     a real pointer and the offset computed via intptr_t instead. */
  intptr_t offset = (intptr_t)param_1 - (intptr_t)param_2;
  iVar3 = 0;
  if (param_3 == 0) {
    do {
      pcVar2 = param_2 + offset;
      *pcVar2 = *param_2 << 2;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      pcVar2[1] = param_2[1] << 2;
      pcVar1 = param_2 + 2;
      param_2 = param_2 + 3;
      pcVar2[2] = *pcVar1 << 2;
    } while (iVar3 < 0x100);
  }
  else {
    do {
      pcVar2 = param_2 + offset;
      *pcVar2 = *param_2;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      pcVar2[1] = param_2[1];
      pcVar1 = param_2 + 2;
      param_2 = param_2 + 3;
      pcVar2[2] = *pcVar1;
    } while (iVar3 < 0x100);
  }
  return;
}



// was build_rgb565_palette -- build g_palette_rgb565 from an RGB buffer (param_1; NULL =
// built-in default). param_2==0 also builds the 21-level shade ramp DAT_00248418.
void build_rgb565_palette(param_1,param_2)
undefined1 * param_1;
short param_2;

{
  byte *pbVar1;
  byte *pbVar2;
  byte bVar3;
  short sVar4;
  ushort uVar5;
  ushort uVar6;
  undefined4 uVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  byte *pbVar15;
  undefined2 *puVar16;
  undefined2 *puVar17;
  undefined2 *puVar18;
  undefined2 *puVar19;
  ushort *puVar20;
  int iVar21;

  DEBUG(TRACE, "[palette] build_rgb565_palette installing g_palette_rgb565, param_1=%s param_2=%d",
        param_1 ? "buffer" : "NULL(default)", param_2);
  if (param_1 == (undefined1 *)0x0) {
    puVar20 = &g_palette_rgb565;
    iVar21 = 0x100;
    pbVar15 = &DAT_00084a40;
    do {
      pbVar1 = pbVar15 + 1;
      iVar21 = iVar21 + -1;
      pbVar2 = pbVar15 + 2;
      bVar3 = *pbVar15;
      pbVar15 = pbVar15 + 4;
      *puVar20 = (ushort)bVar3 | ((ushort)*pbVar1 | (ushort)*pbVar2 << 6) << 5;
      puVar20 = puVar20 + 1;
    } while (iVar21 != 0);
  }
  else {
    iVar21 = 0;
    do {
      uVar7 = Ordinal_2032(*param_1);
      Ordinal_2026(uVar7,0x3fc00000);
      iVar8 = Ordinal_2020();
      if (0xff < iVar8) {
        iVar8 = 0xff;
      }
      uVar7 = Ordinal_2032(param_1[1]);
      Ordinal_2026(uVar7,0x3fc00000);
      iVar9 = Ordinal_2020();
      if (0xff < iVar9) {
        iVar9 = 0xff;
      }
      uVar7 = Ordinal_2032(param_1[2]);
      Ordinal_2026(uVar7,0x3fc00000);
      iVar10 = Ordinal_2020();
      if (0xff < iVar10) {
        iVar10 = 0xff;
      }
      param_1 = param_1 + 3;
      *(ushort *)((intptr_t)&g_palette_rgb565 + iVar21) =
           (ushort)(iVar10 >> 3) | (ushort)((iVar9 >> 2 | (iVar8 >> 3) << 6) << 5);
      if (param_2 == 0) {
        uVar7 = Ordinal_2032(iVar8 >> 3);
        uVar11 = Ordinal_2032(iVar9 >> 2);
        uVar12 = Ordinal_2032(iVar10 >> 3);
        iVar8 = 0;
        puVar20 = (ushort *)((intptr_t)&DAT_00248418 + iVar21);
        do {
          uVar13 = Ordinal_2032(iVar8 + 0x14);
          uVar14 = Ordinal_2026(uVar13,uVar7);
          Ordinal_2026(uVar14,0x3d430c31);
          sVar4 = Ordinal_2018();
          uVar14 = Ordinal_2026(uVar13,uVar11);
          Ordinal_2026(uVar14,0x3d430c31);
          uVar5 = Ordinal_2018();
          uVar13 = Ordinal_2026(uVar13,uVar12);
          Ordinal_2026(uVar13,0x3d430c31);
          uVar6 = Ordinal_2018();
          *puVar20 = uVar6 | (uVar5 | sVar4 << 6) << 5;
          iVar8 = iVar8 + -1;
          puVar20 = puVar20 + 0x100;
        } while (-0x14 < iVar8);
      }
      iVar21 = iVar21 + 2;
    } while (iVar21 < 0x200);
  }
  if ((DAT_0024af70 != 0) && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0)) {
    iVar8 = 0x28;
    puVar17 = &DAT_00242010;
    iVar21 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar21 = DAT_0023cdb8 + 1;
    }
    iVar9 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar9 = DAT_0023cdbc + 1;
    }
    /* DAT_0023c430 is the real framebuffer pointer from GXBeginDraw();
       `(int)` here truncated it on this 64-bit host (missed by the
       earlier project-wide `(int)VAR + offset` sweep since here the
       pointer is the second operand, "offset + (int)VAR", not the
       first). First bug actually reached during real frame rendering. */
    puVar18 = (undefined2 *)((iVar21 >> 1) * 400 + (intptr_t)DAT_0023c430);
    do {
      iVar10 = 0x140;
      puVar16 = puVar18;
      puVar19 = puVar17;
      do {
        puVar16 = puVar16 + (iVar9 >> 1);
        iVar10 = iVar10 + -1;
        /* Bounds-guard: this loop's hardcoded `400` initial offset and
           320-iteration span don't fit within the real GAPI hardware
           framebuffer's actual size (240x320 RGB565 = 153600 bytes) for
           every geometry this ends up running under, and the original
           intent behind the literal 400 hasn't been identified -- write
           only if it lands inside the buffer GXBeginDraw() returned,
           rather than risk corrupting unrelated heap memory. */
        if ((char *)puVar16 >= (char *)DAT_0023c430 &&
            (char *)(puVar16 + 1) <= (char *)DAT_0023c430 + 153600) {
          *puVar16 = *puVar19;
        }
        puVar19 = puVar19 + 0x28;
      } while (iVar10 != 0);
      iVar8 = iVar8 + -1;
      puVar18 = puVar18 + (iVar21 >> 1);
      puVar17 = puVar17 + 1;
    } while (iVar8 != 0);
    GXEndDraw();
  }
  return;
}







// was palette_cycle_range -- rotate a contiguous run of DAT_00088d98 palette entries by
// one. Confirmed real callers so far: the title screen's own gold-gradient
// animation (0x40-0x7f), FUN_0003601c's special-illustrated-book/scroll
// view feature (see its own comment -- NOT ordinary lava/water/torch tile
// shimmer, ruled out live), and the equipped-lit-torch HUD icon flicker
// this project added (range 16-23, the confirmed fire gradient in PALS.DAT
// bank 0 -- see mode-icon-and-hud-icon-flicker-fixes memory). Whatever
// drives ordinary per-tile water/lava/wall-torch animation during normal
// walking, if the original game has one at all, is still unfound.
void palette_cycle_range(param_1,param_2,param_3)
uint param_1;
uint param_2;
int param_3;

{
  undefined *puVar1;
  int iVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = (param_1 & 0xff) * 3;
  sVar3 = 3;
  puVar1 = &DAT_00088d98 + iVar5;
  if (param_3 == 0) {
    sVar3 = -3;
  }
  else {
    /* Was `(undefined *)(... + 0x88d95)` -- a literal original-binary
       address (0x88d95 = &DAT_00088d98's real address there, minus 3)
       instead of real pointer arithmetic against the actual (relocated)
       global -- same bug class as probe_save_slots's `-0x87020` fix and
       run_character_generator's pcVar3 fix elsewhere this session.
       Never exercised until Ordinal_535 (GetTickCount) stopped being a
       hardcoded 0 (see its comment): this branch (param_3!=0) is only
       reached from animate_title_palette_cycle's periodic timer, which always saw
       "0ms elapsed" and never fired before that fix. Confirmed via
       ASan SEGV the moment it first ran for real. */
    puVar1 = &DAT_00088d98 + (-3 + (param_2 & 0xff) * 3 + iVar5);
  }
  DAT_001005cc = *puVar1;
  iVar4 = 0;
  DAT_001005cd = puVar1[1];
  DAT_001005ce = puVar1[2];
  iVar5 = (param_2 & 0xff) - 1;
  if (0 < iVar5) {
    do {
      iVar2 = 0;
      do {
        puVar1[iVar2] = puVar1[iVar2 - sVar3];
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < 3);
      iVar4 = iVar4 + 1;
      puVar1 = puVar1 + -(int)sVar3;
    } while (iVar4 * 0x10000 >> 0x10 < iVar5);
  }
  *puVar1 = DAT_001005cc;
  puVar1[1] = DAT_001005cd;
  puVar1[2] = DAT_001005ce;
  return;
}







// was FUN_0006c98c -- loads and displays a raw 320x200 (64000-byte)
// full-screen bitmap file (param_2, a path): optionally selects a
// palette bank first (param_1, skipped if negative -- used for e.g.
// the copyright screen), blits it to the framebuffer, and optionally
// flushes it to the display immediately (param_3).
undefined4 blit_fullscreen_bitmap_file(param_1,param_2,param_3)
undefined4 param_1;
char *param_2;
int param_3;

{
  /* iVar1 was `int`, truncating the Ordinal_1041 (malloc) heap pointer
     it holds -- it's used both as the fread-destination buffer and as
     the source pointer handed to bitmap_blit_to_framebuffer (which now takes a real
     char*). */
  char *iVar1;
  int iVar2;
  undefined4 uVar3;

  iVar1 = Ordinal_1041(64000);
  if (iVar1 == 0) {
    uVar3 = 0;
  }
  else {
    iVar2 = read_buffer_from_file(param_2,iVar1,64000);
    if (iVar2 != 0) {
      if (-1 < (short)param_1) {
        FUN_00040df0();
      }
      set_viewport_clip_rect(0,0,0x13f,199);
      if (-1 < (short)param_1) {
        set_palette_bank(param_1);
      }
      bitmap_blit_to_framebuffer(0,0,iVar1,200,0x140,0,0,0);
      if (param_3 != 0) {
        flush_dirty_rect_to_display(1);
      }
    }
    Ordinal_1018(iVar1);
    uVar3 = 1;
  }
  return uVar3;
}





// was FUN_000778fc -- gated on DAT_0024af70 (likely "GAPI display
// active"): opens a direct hardware framebuffer via GXBeginDraw,
// blits the DAT_00242010 buffer (the same one
// store_window_extra_data_ptr stashes into the window's extra-data
// slot) onto it row by row honoring the display's real pitch
// (DAT_0023cdb8/DAT_0023cdbc from GXGetDisplayProperties) with the
// same bounds-guard as build_rgb565_palette (see its own comment),
// then GXEndDraw. Always marks the full screen dirty
// (dirty_rect_union) regardless of whether the GAPI path ran. This
// is the original WinCE GAPI hardware-present path, distinct from
// (and likely superseded by) flush_dirty_rect_to_display_240's
// SDL-based blit on this host port.
undefined4 blit_framebuffer_to_gx_display()

{
  undefined2 *puVar1;
  undefined2 *puVar2;
  undefined2 *puVar3;
  int iVar4;
  int iVar5;
  undefined2 *puVar6;
  int iVar7;
  int iVar8;
  
  if (DAT_0024af70 != 0) {
    DAT_0023c430 = GXBeginDraw();
    if (DAT_0023c430 == (void *)0x0) {
      return 0;
    }
    iVar7 = 0x28;
    puVar2 = &DAT_00242010;
    iVar4 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar4 = DAT_0023cdb8 + 1;
    }
    iVar5 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar5 = DAT_0023cdbc + 1;
    }
    /* Same DAT_0023c430 (framebuffer pointer) truncation as build_rgb565_palette
       above -- see its comment. */
    puVar3 = (undefined2 *)((iVar4 >> 1) * 400 + (intptr_t)DAT_0023c430);
    do {
      iVar8 = 0x140;
      puVar1 = puVar3;
      puVar6 = puVar2;
      do {
        puVar1 = puVar1 + (iVar5 >> 1);
        iVar8 = iVar8 + -1;
        /* Bounds-guard: see the identical loop in build_rgb565_palette. */
        if ((char *)puVar1 >= (char *)DAT_0023c430 &&
            (char *)(puVar1 + 1) <= (char *)DAT_0023c430 + 153600) {
          *puVar1 = *puVar6;
        }
        puVar6 = puVar6 + 0x28;
      } while (iVar8 != 0);
      iVar7 = iVar7 + -1;
      puVar3 = puVar3 + (iVar4 >> 1);
      puVar2 = puVar2 + 1;
    } while (iVar7 != 0);
    GXEndDraw();
  }
  dirty_rect_union(0,0xf0,0,0x140);
  return 0;
}


// was FUN_0007e99c -- re-expand DAT_00088d98 into DAT_00088640 and re-install it as
// g_palette_rgb565 (real light-level/tint args dropped by Ghidra)
void reinstall_active_palette()

{
  /* expand_pals_bytes's 3rd argument was dropped here -- confirmed via real
     ARM disassembly: this call site (`bl expand_pals_bytes` right after
     loading only r0/r1) never sets r2 itself, so it silently used
     whatever was left over in that register from the caller's own
     context. expand_pals_bytes's param_3 controls whether it scales each
     raw palette byte up from PALS.DAT's 6-bit-per-channel storage
     (param_3==0, `<<2`) or copies it unscaled (param_3!=0) -- and
     DAT_00088d98 (the source here) always holds the RAW, unscaled bytes
     load_pals_bank loaded (it only produces the *scaled* version in its
     own local stack buffer, which doesn't survive past that call). With
     a leftover-nonzero r2, this installed the unscaled (very dark)
     values into g_palette_rgb565 instead of the real palette -- confirmed:
     this is what made the whole screen go dark after wiring
     main_menu_loop through set_palette_bank (which calls this function on
     every palette load, unlike the rarer hover-timer-only path this
     bug previously hid behind). Pass 0 explicitly, matching
     load_pals_bank's own established convention for this exact source
     format. */
  expand_pals_bytes(&DAT_00088640,&DAT_00088d98,0);
  build_rgb565_palette(&DAT_00088640,0xffffffff);
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0007e9c4
void plot_pixel(param_1,param_2,param_3)
short param_1;
short param_2;
short param_3;

{
  int iVar1;

  iVar1 = (int)param_2;
  /* No bounds check on (param_1, iVar1) against the real 320x240
     framebuffer (GX_W/GX_H, gx_stub.c) before this raw write -- callers
     that plot a small crosshair/cursor around a point (e.g. draw_hotspot_crosshair_marker,
     +-1 in x or y around a stored coordinate) can walk one pixel outside
     the screen near an edge with nothing stopping them. Confirmed live:
     ASan-caught heap-buffer-overflow WRITE here reached via ordinary
     Talk-mode interaction. Same defensive "skip instead of touching
     memory outside the real buffer" posture as resolve_object_link's
     own out-of-range guard elsewhere in this file. */
  if ((param_1 < 0) || (0x140 <= param_1) || (iVar1 < 0) || (0xf0 <= iVar1)) {
    return;
  }
  *(undefined2 *)
   ((g_uw_framebuffer) + (iVar1 * 0x140 + (int)param_1) * 2) =
       (&g_palette_rgb565)[param_3];
  dirty_rect_union(iVar1,iVar1,(int)param_1);
  debug_framebuffer_dump("plot_pixel");
  return;
}





// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_000116dc -- draws a horizontal line of pixels at row
// param_2 from column param_1 to param_3, using the current color
// index (DAT_000a85c0) into g_palette_rgb565, and unions the drawn
// span into the dirty-rect tracker. Confirmed live caller
// (src/babl.c) draws a fixed-position line for the barter/talk
// window's own layout.
void draw_horizontal_line(param_1,param_2,param_3)
uint param_1;
uint param_2;
uint param_3;

{
  uint uVar1;
  int iVar2;
  int iVar3;

  param_2 = param_2 & 0xffff;
  uVar1 = param_1 & 0xffff;
  param_3 = param_3 & 0xffff;
  dirty_rect_union(param_2,param_2,uVar1,param_3);
  if (uVar1 < param_3) {
    iVar3 = param_3 - uVar1;
    iVar2 = (param_2 * 0x140 + (param_1 & 0xffff)) * 2;
    do {
      iVar3 = iVar3 + -1;
      *(undefined2 *)(iVar2 + (g_uw_framebuffer)) =
           (&g_palette_rgb565)[DAT_000a85c0];
      iVar2 = iVar2 + 2;
    } while (iVar3 != 0);
  }
  debug_framebuffer_dump("draw_horizontal_line");
  return;
}
