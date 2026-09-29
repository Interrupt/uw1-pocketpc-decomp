/* The automap screen: entering/exiting automap mode, and drawing the
 * revealed tile grid (cell walls/doors, edges) into the automap view.
 * Split out of uw.c (the original monolithic decompile) once these
 * functions' real roles were confirmed.
 */
#include "headers/automap.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_00016354
void enter_automap_screen()

{
  if (DAT_000bbefc == 0) {
    register_key_binding(0x1b,1,2,change_game_mode);
    DAT_000bbefc = 1;
  }
  FUN_000735b0(0xd);
  FUN_00073634();
  FUN_00016434(0,(int)DAT_00201b68);
  draw_automap_screen((int)DAT_00201b68);
  DAT_000b99c0 = register_click_region(0,200,0x13f,1,0,2,FUN_00016ef8);
  set_cursor_confine_rect(0,199,0x13f,0);
  FUN_00057118();
  FUN_00057c5c(0x1078);
  cursor_show_idle_tick();
  DAT_000b99c4 = 0;
  return;
}




// was FUN_0001651c
void exit_automap_screen()

{
  int iVar1;
  undefined1 auStack_1c [16];
  
  FUN_00057118();
  unregister_key_binding((int)DAT_000b99c0);
  FUN_00057cac(0);
  FUN_00017768((int)DAT_000ba9d0);
  if ((DAT_000ba9d0 != DAT_00201b68) &&
     (iVar1 = open_level_archive(auStack_1c,s__SAVE0_lev_ark_000842fc), iVar1 != 0)) {
    FUN_000164e4(auStack_1c,(int)DAT_00201b68);
    FUN_00015a58(auStack_1c);
  }
  FUN_000735c0();
  FUN_00040df0();
  DAT_000bbef4 = 0;
  reset_cursor_confine_rect();
  cursor_show_idle_tick();
  return;
}




// was FUN_000165d0
void draw_automap_tiles()

{
  char cVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int local_3c;
  int local_34 [4];
  
  local_3c = 1;
  do {
    iVar6 = 1;
    do {
      uVar4 = (byte)(&DAT_000b99d0)[local_3c * 0x40 + iVar6] & 0xf;
      uVar5 = (uint)(short)uVar4;
      if ((uVar5 != 0) && (uVar5 < 10)) {
        draw_automap_cell(uVar4,iVar6,local_3c);
        Ordinal_1047(local_34,0,0x10);
        if (((&DAT_000878d0)[uVar5] & 1) == 0) {
          iVar2 = 0;
          do {
            iVar3 = draw_automap_cell_edge(iVar2,iVar6,local_3c);
            local_34[iVar2] = iVar3;
            iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
          } while (iVar2 < 4);
        }
        else {
          cVar1 = (&DAT_000842f0)[(int)((uVar4 - 2) * 0x10000) >> 0x10];
          iVar2 = draw_automap_cell_edge((int)cVar1,iVar6,local_3c);
          local_34[(short)cVar1] = iVar2;
          uVar5 = (int)cVar1 + 1U & 3;
          iVar2 = draw_automap_cell_edge(uVar5,iVar6,local_3c);
          local_34[(short)uVar5] = iVar2;
        }
        uVar5 = 0;
        do {
          if ((local_34[uVar5] != 0) && (local_34[uVar5 + 1 & 3] != 0)) {
            darken_pixel((((int)((uVar5 & 2) * -0x20000) >> 0x10) +
                         ((iVar6 * 3 + 10) * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                         (((int)((uVar5 & 2) * -0x20000) >> 0x10) +
                         ((local_3c * 3 + 7) * 0x10000 >> 0x10)) * 0x10000 >> 0x10,3,2);
          }
          uVar5 = (int)((uVar5 + 1) * 0x10000) >> 0x10;
        } while ((int)uVar5 < 4);
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < 0x3f);
    local_3c = (local_3c + 1) * 0x10000 >> 0x10;
  } while (local_3c < 0x3f);
  return;
}



// was FUN_000167d4
undefined4 draw_automap_cell_edge(param_1,param_2,param_3)
short param_1;
int param_2;
int param_3;

{
  byte bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  
  iVar6 = param_2 * 3;
  iVar2 = param_3 * 3;
  iVar3 = iVar6 + 7;
  iVar7 = iVar2 + 4;
  if (param_1 == 0) {
    param_3 = param_3 + 1;
  }
  else if (param_1 == 1) {
    param_2 = param_2 + 1;
  }
  else if (param_1 == 2) {
    param_3 = param_3 + -1;
  }
  else if (param_1 == 3) {
    param_2 = param_2 + -1;
  }
  bVar1 = (&DAT_000b99d0)[(short)param_3 * 0x40 + (int)(short)param_2] & 0xf;
  if ((bVar1 != 0) && (bVar1 < 10)) {
    return 0;
  }
  if (bVar1 == 0xb) {
    uVar4 = 0;
    uVar5 = 4;
  }
  else {
    uVar4 = 6;
    uVar5 = 2;
  }
  if (param_1 == 0) {
    iVar7 = iVar2 + 8;
LAB_000168f8:
    iVar2 = 0;
    do {
      darken_pixel((iVar2 + (iVar3 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,iVar7 + -1,uVar4,uVar5);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
  }
  else {
    if (param_1 == 1) {
      iVar3 = iVar6 + 0xb;
    }
    else {
      if (param_1 == 2) goto LAB_000168f8;
      if (param_1 != 3) {
        return 1;
      }
    }
    iVar2 = 0;
    do {
      darken_pixel(iVar3 + -1,((iVar7 * 0x10000 >> 0x10) + iVar2) * 0x10000 >> 0x10,uVar4,uVar5);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
  }
  return 1;
}




// was FUN_00016948
void draw_automap_cell(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  byte bVar1;
  byte bVar2;
  short sVar3;
  short extraout_r1;
  short extraout_r1_00;
  undefined4 uVar4;
  int iVar5;
  ushort uVar6;
  undefined4 uVar7;
  uint uVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  
  if ((short)param_1 != 0) {
    if (5 < (short)param_1) {
      param_1 = 1;
    }
    bVar1 = (byte)(&DAT_000b99d0)[(short)param_3 * 0x40 + (int)(short)param_2] >> 4 & 3;
    bVar2 = (byte)(&DAT_000b99d0)[(short)param_3 * 0x40 + (int)(short)param_2] >> 4 & 0xfc;
    iVar11 = param_3 * 3 + 4;
    iVar10 = param_2 * 3 + 7;
    uVar9 = 0;
    uVar13 = 0;
    do {
      uVar8 = 0;
      uVar12 = 0;
      do {
        if ((&DAT_000842c0)[(((param_1 + -1) * 0x10000 >> 0x10) * 3 + uVar12) * 3 + uVar13] ==
            '\x01') {
          if (bVar1 == 0) {
            /* Normal explored floor. The binary calls darken_pixel
               here (uVar4/uVar7 args are ignored by it) for a 50%
               darken; that's much darker than the reference automap,
               so use the 25% darken instead. Deliberate deviation. */
            darken_pixel_light(((int)(short)uVar9 + (iVar10 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                       ((int)(short)uVar8 + (iVar11 * 0x10000 >> 0x10)) * 0x10000 >> 0x10);
            goto LAB_00016b00;
          }
          if (bVar1 == 1) {
            /* Water fill: (rand % 2) + 0xb1 -> a 2-tone dither between
               palette 0xb1/0xb2, not a flat 0xb1. The original reads
               the modulo from Ordinal_2005's r1 (remainder) leftover;
               Ghidra lost that into an uninitialised `extraout_r1`, so
               compute `& 1` on the rand directly. */
            iVar5 = ((int)Ordinal_1053() & 1) + 0xb1;
          }
          else {
            if (bVar1 != 2) goto LAB_00016b00;
            iVar5 = ((int)Ordinal_1053() & 1) + 0xb5;
          }
          plot_pixel(((int)(short)uVar9 + (iVar10 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                       (((iVar11 * 0x10000 >> 0x10) * -0x10000 >> 0x10) - uVar8) + 200,iVar5);
        }
        else if ((&DAT_000842c0)[(((param_1 + -1) * 0x10000 >> 0x10) * 3 + uVar12) * 3 + uVar13] ==
                 '\x02') {
          uVar7 = 2;
          uVar4 = 6;
LAB_00016acc:
          darken_pixel(((int)(short)uVar9 + (iVar10 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                       ((int)(short)uVar8 + (iVar11 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,uVar4,
                       uVar7);
        }
LAB_00016b00:
        uVar8 = uVar12 + 1 & 0xffff;
        uVar12 = uVar12 + 1 & 0xffff;
      } while (uVar12 < 3);
      uVar9 = uVar13 + 1 & 0xffff;
      uVar13 = uVar13 + 1 & 0xffff;
    } while (uVar13 < 3);
    if (bVar2 == 4) {
      draw_automap_door_edge((int)(short)param_2,(int)(short)param_3,iVar10,iVar11);
    }
    else if (bVar2 == 8) {
      uVar9 = 0;
      do {
        uVar13 = 0;
        uVar6 = 0;
        do {
          sVar3 = rand_below(3);
          plot_pixel(uVar13 + (int)(short)((uint)(iVar10 * 0x10000) >> 0x10),
                       (((iVar11 * 0x10000 >> 0x10) * -0x10000 >> 0x10) - uVar9) + 200,sVar3 + 0xe9)
          ;
          uVar6 = uVar6 + 1;
          uVar13 = (uint)uVar6;
        } while (uVar6 < 3);
        uVar9 = uVar9 + 1;
      } while ((uVar9 & 0xffff) < 3);
    }
    else if ((bVar2 == 0xc) || (bVar2 == 0x10)) {
      uVar9 = 0;
      do {
        uVar13 = 0;
        uVar6 = 0;
        do {
          darken_pixel(uVar9 + (int)(short)((uint)(iVar10 * 0x10000) >> 0x10),
                       uVar13 + (int)(short)((uint)(iVar11 * 0x10000) >> 0x10),6,3);
          uVar6 = uVar6 + 1;
          uVar13 = (uint)uVar6;
        } while (uVar6 < 3);
        uVar9 = uVar9 + 1;
      } while ((uVar9 & 0xffff) < 3);
    }
  }
  return;
}



// was FUN_00016c70
void draw_automap_door_edge(param_1,param_2,param_3,param_4)
short param_1;
short param_2;
int param_3;
int param_4;

{
  int iVar1;
  int iVar2;
  
  param_4 = param_4 + 1;
  param_3 = param_3 + 1;
  darken_pixel(param_3,param_4,6,3);
  iVar2 = 0;
  DAT_000ba9d4 = '\0';
  while( true ) {
    if ((((&DAT_000b99d0)
          [(int)param_1 + ((int)param_2 + (int)(char)(&DAT_000842f4)[iVar2]) * 0x40 +
           (int)(char)(&DAT_000842f8)[iVar2]] & 0xf) == 1) ||
       (((&DAT_000b99d0)
         [(((int)param_2 - (int)(char)(&DAT_000842f4)[iVar2]) * 0x40 -
          (int)(char)(&DAT_000842f8)[iVar2]) + (int)param_1] & 0xf) == 1)) break;
    iVar1 = (iVar2 + 1) * 0x1000000;
    iVar2 = iVar1 >> 0x18;
    DAT_000ba9d4 = (char)((uint)iVar1 >> 0x18);
    if (3 < iVar2) {
      return;
    }
  }
  darken_pixel(param_3 + (char)(&DAT_000842f4)[(char)iVar2],
               param_4 + (char)(&DAT_000842f8)[(char)iVar2],6,3);
  darken_pixel(param_3 - (char)(&DAT_000842f4)[DAT_000ba9d4],
               param_4 - (char)(&DAT_000842f8)[DAT_000ba9d4],6,3);
  return;
}




// was FUN_00017908
/* uVar3 was `undefined4` (4 bytes), truncating Ordinal_1041's real
   64-bit malloc'd pointer on this host -- same pointer-truncation
   pattern fixed repeatedly this session. Confirmed via lldb: this is
   why the automap screen loaded blnkmap.byt's file handle successfully
   but FUN_0007ee4c (the actual read-into-buffer call) still failed --
   it was reading 64000 real bytes into a wild, truncated destination
   address instead of the buffer Ordinal_1041 actually allocated. */
void draw_automap_screen(param_1)
undefined4 param_1;

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  short sVar2;
  void *uVar3;
  char *pcVar4;
  int iVar5;
  undefined1 auStack_124 [8];
  char acStack_11c [260];

  uVar3 = Ordinal_1041(64000);
  FUN_00057118();
  pcVar4 = &DAT_0023cca8;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_11c,s__DATA_blnkmap_byt_00084338);
  iVar5 = FUN_0007ee4c(acStack_11c,uVar3,64000);
  if (iVar5 == 0) {
    cursor_show_idle_tick();
    exit_automap_screen();
  }
  else {
    set_viewport_clip_rect(0,0,0x13f,199);
    set_palette_bank(1);
    bitmap_blit_to_framebuffer(0,1,uVar3,200,0x140,0,0,1);
    uw_debug_dump_revealmap((unsigned char *)&DAT_000b99d0);
    draw_automap_tiles();
    iVar5 = (int)(short)param_1;
    if ((iVar5 == DAT_00201b68) && (iVar5 != 9)) {
      g_blit_transparent_mode = 1;
      draw_sprite_by_id(0x103f,((*(ushort *)((char *)g_player_object + 0x16) >> 10) + 2) * 3,
                   (((*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4) + 3) * -3 + 200,5,8);
      g_blit_transparent_mode = 0;
    }
    DAT_000ba9d0 = (short)param_1;
    set_palette_bank(1);
    screen_backup_save();
    FUN_0001786c(param_1);
    *g_draw_color_index = 0x2d;
    *DAT_00084298 = 0x2d;
    select_active_font(s_fontbig_sys_0008432c);
    FUN_000229e0(iVar5,auStack_124,10);
    sVar2 = measure_text_width(auStack_124);
    iVar5 = (int)sVar2;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 1;
    }
    draw_text_string(auStack_124,0x121 - (short)(iVar5 >> 1),6);
    select_active_font(s_font5x6p_sys_0008430c);
  }
  DAT_000bbef4 = 1;
  cursor_show_idle_tick();
  Ordinal_1018(uVar3);
  return;
}


/* Reveal every walkable tile of the current level's automap in a single
   pass -- no ring-walk, no dungeon redraw. Not part of the original
   game; demomode's REVEALALL uses it to fill the whole map at once
   (the per-tile TELEPORT+REVEAL sweep in demo_automap.txt exists only
   because ordinary movement never reconnects to the reveal ring-walk).
   Uses the same reveal-byte encoding as the ring-walk. */
void automap_reveal_all_tiles(void)
{
  int x;
  int y;
  int shape;
  byte *rec;
  byte *dst;

  for (y = 0; y < 64; y = y + 1) {
    for (x = 0; x < 64; x = x + 1) {
      rec = (byte *)(DAT_002029cc + (x + y * 0x40) * 4);
      shape = *rec & 0xf;
      if ((shape >= 1) && (shape < 10)) {
        dst = (byte *)(&DAT_000b99d0) + (y * 0x40 + x);
        if (*dst == 0) {
          *dst = automap_reveal_byte(rec);
        }
      }
    }
  }
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00016940
void darken_pixel(param_1,param_2)
uint param_1;
int param_2;

{
  ushort *puVar1;

  puVar1 = (ushort *)
           ((g_uw_framebuffer) +
           ((200U - param_2 & 0xffff) * 0x140 + (param_1 & 0xffff)) * 2);
  *puVar1 = *puVar1 >> 1 & 0x7bef;
  debug_framebuffer_dump("darken_pixel");
  return;
}



/* Like darken_pixel but only a 25% cut (x 3/4 brightness) instead of a
   halve: RGB565 (px>>1 & 0x7bef) + (px>>2 & 0x39e7).  Not in the
   original binary -- the Pocket-PC automap 50%-darkens explored floor
   via darken_pixel, which comes out far darker than the reference map
   (whose explored floor is a light tint over the parchment).  Used
   only for the draw_automap_cell floor fill; wall edges / accent
   pixels keep the faithful darken_pixel. */
void darken_pixel_light(param_1,param_2)
uint param_1;
int param_2;

{
  ushort *puVar1;
  ushort uVar2;

  puVar1 = (ushort *)
           ((g_uw_framebuffer) +
           ((200U - param_2 & 0xffff) * 0x140 + (param_1 & 0xffff)) * 2);
  uVar2 = *puVar1;
  *puVar1 = (uVar2 >> 1 & 0x7bef) + (uVar2 >> 2 & 0x39e7);
  debug_framebuffer_dump("darken_pixel_light");
  return;
}

