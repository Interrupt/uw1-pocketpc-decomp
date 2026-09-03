/* Low-level pixel-primitive functions: color state, rect fill/save/
 * restore, and paletted-bitmap blitting into the game's internal
 * software framebuffer. Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed. */
#include "uw.h"

/* Scratch buffer for rect_fill_or_save_restore's save/restore modes --
 * only ever used within this function, so it stays local to this file
 * (unlike DAT_0024ad60_backing, which uw.c also needs and is extern'd in
 * uw.h instead). */
static undefined2 DAT_000879b8_backing[32768];
#define DAT_000879b8 DAT_000879b8_backing[0]



void set_draw_color(param_1)
undefined2 param_1;

{
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
  
  iVar14 = (int)(short)param_1;
  iVar13 = (param_3 - iVar14) * 0x10000;
  iVar11 = iVar13 >> 0x10;
  iVar4 = (int)(short)param_2;
  iVar15 = (param_4 - iVar4) * 0x10000;
  iVar12 = iVar15 >> 0x10;
  FUN_00011000(param_2 & 0xffff,param_4,param_1,param_3);
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
                     (&DAT_0024ad60)[DAT_000a85c0];
              }
              uVar5 = uVar5 + 1;
              iVar13 = iVar13 + 0x140;
            } while ((int)uVar5 < (int)(uVar9 & 0xffff));
          }
        }
      }
    }
  }
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
     pixel-data pointer, e.g. FUN_0006c98c's OPSCR.BYT load buffer). This
     accumulator reconstructs a moving source-row address from it each
     iteration, so it needs to stay a full-width pointer-sized value. */
  intptr_t local_34;

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
  FUN_00011000(iVar7,iVar7 + iVar2,iVar8);
  iVar5 = (int)sVar14;
  if (DAT_00088960 == 0) {
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
                 (&DAT_0024ad60)[*pbVar4];
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
                 (&DAT_0024ad60)[uVar10];
          }
          iVar7 = iVar7 + 1;
        } while (iVar7 < iVar9 - sVar13);
      }
      iVar5 = iVar5 + 1;
      iVar8 = iVar8 + 0x140;
      local_34 = iVar11 + local_34;
    } while (iVar5 < iVar2 - sVar12);
  }
  return;
}
