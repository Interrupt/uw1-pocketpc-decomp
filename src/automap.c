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
  set_pending_music_track(0xd);
  update_ingame_music_track();
  save_automap_reveal_to_archive(0,(int)DAT_00201b68);
  draw_automap_screen((int)DAT_00201b68);
  DAT_000b99c0 = register_click_region(0,200,0x13f,1,0,2,handle_automap_note_click);
  set_cursor_confine_rect(0,199,0x13f,0);
  decrement_cursor_hide_depth();
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
  
  decrement_cursor_hide_depth();
  unregister_key_binding((int)DAT_000b99c0);
  FUN_00057cac(0);
  save_automap_notes_to_archive((int)DAT_000ba9d0);
  if ((DAT_000ba9d0 != DAT_00201b68) &&
     (iVar1 = open_level_archive(auStack_1c,s__SAVE0_lev_ark_000842fc), iVar1 != 0)) {
    load_automap_reveal_from_archive(auStack_1c,(int)DAT_00201b68);
    close_level_archive(auStack_1c);
  }
  pick_random_pending_music_track();
  clear_screen_and_restore_cursor();
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
   but read_buffer_from_file (the actual read-into-buffer call) still failed --
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
  decrement_cursor_hide_depth();
  pcVar4 = &DAT_0023cca8;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_11c,s__DATA_blnkmap_byt_00084338);
  iVar5 = read_buffer_from_file(acStack_11c,uVar3,64000);
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
    load_automap_notes_from_archive(param_1);
    *g_draw_color_index = 0x2d;
    *DAT_00084298 = 0x2d;
    select_active_font(s_fontbig_sys_0008432c);
    itoa_radix(iVar5,auStack_124,10);
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




// was FUN_00016434 -- writes the DAT_000b99d0 automap-reveal buffer
// (64x64 grid, one nibble/byte per tile -- see automap.c's readers) to
// archive entry param_2+0x1a. If param_1 is NULL, opens/closes
// \SAVE0\lev.ark itself via open_level_archive/close_level_archive;
// otherwise param_1 is a caller-owned 16-byte archive-handle struct
// (copied in/out here) and the caller manages its lifetime.
undefined4 save_automap_reveal_to_archive(param_1,param_2)
undefined1 * param_1;
int param_2;

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined1 *puVar4;
  int iVar5;
  undefined1 *puVar6;
  undefined1 auStack_1c [16];
  
  if (param_1 == (undefined1 *)0x0) {
    iVar2 = open_level_archive(auStack_1c,s__SAVE0_lev_ark_000842fc);
    if (iVar2 == 0) {
      return 0;
    }
  }
  else {
    iVar2 = 0xf;
    puVar4 = param_1;
    puVar6 = auStack_1c;
    do {
      iVar3 = iVar2 + -1;
      *puVar6 = *puVar4;
      bVar1 = 0 < iVar2;
      iVar2 = iVar3;
      puVar4 = puVar4 + 1;
      puVar6 = puVar6 + 1;
    } while (iVar3 != 0 && bVar1);
  }
  iVar2 = write_archive_entry(auStack_1c,param_2 + 0x1a,&DAT_000b99d0,0x1000);
  if (param_1 == (undefined1 *)0x0) {
    close_level_archive(auStack_1c);
  }
  else {
    iVar3 = 0xf;
    puVar4 = auStack_1c;
    do {
      iVar5 = iVar3 + -1;
      *param_1 = *puVar4;
      bVar1 = 0 < iVar3;
      iVar3 = iVar5;
      puVar4 = puVar4 + 1;
      param_1 = param_1 + 1;
    } while (iVar5 != 0 && bVar1);
  }
  if (iVar2 == 0) {
    return 0;
  }
  return 1;
}



// was FUN_000164e4 -- reads archive entry param_2+0x1a back into the
// DAT_000b99d0 automap-reveal buffer (the read-side counterpart to
// save_automap_reveal_to_archive).
undefined4 load_automap_reveal_from_archive(param_1,param_2)
/* .ark handle-struct pointer -- was `undefined4`, truncating it before
   read_archive_entry. */
undefined1 * param_1;
int param_2;

{
  short sVar1;
  undefined4 uVar2;
  
  sVar1 = read_archive_entry(param_1,param_2 + 0x1a,&DAT_000b99d0);
  if ((sVar1 == 0) || (uVar2 = 0, sVar1 == 0x1000)) {
    uVar2 = 1;
  }
  return uVar2;
}



// was FUN_000165bc
void clear_automap_reveal_buffer()

{
  Ordinal_1047(&DAT_000b99d0,0,0x1000);
  return;
}




// was FUN_00016d7c -- given two note-button label records (param_1,
// param_2) and a click point (param_3,param_4), measures each label's
// rendered text-box distance to the click and returns whichever
// pointer is closer (used by handle_automap_note_click's hit-testing).
char *pick_closer_note_label(param_1,param_2,param_3,param_4)
char * param_1;
char * param_2;
short param_3;
short param_4;

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  char cVar5;
  short sVar6;
  char *pcVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  char acStack_50 [52];
  
  pcVar7 = param_2;
  if ((param_1 != (char *)0x0) && (pcVar7 = param_1, param_2 != (char *)0x0)) {
    do {
      cVar5 = *pcVar7;
      pcVar7[(int)(acStack_50 + -(int)param_1)] = cVar5;
      pcVar7 = pcVar7 + 1;
    } while (cVar5 != '\0');
    sVar6 = measure_text_width(acStack_50);
    iVar8 = (int)sVar6;
    if (iVar8 < 0) {
      iVar8 = iVar8 + 1;
    }
    uVar9 = ((iVar8 >> 1) - (int)param_3) + (int)*(short *)(param_1 + 0x32);
    uVar1 = (int)uVar9 >> 0x1f;
    uVar10 = ((int)param_4 - (int)*(short *)(param_1 + 0x34)) + 0xca;
    uVar2 = (int)uVar10 >> 0x1f;
    pcVar7 = param_2;
    do {
      cVar5 = *pcVar7;
      pcVar7[(int)(acStack_50 + -(int)param_2)] = cVar5;
      pcVar7 = pcVar7 + 1;
    } while (cVar5 != '\0');
    sVar6 = measure_text_width(acStack_50);
    iVar8 = (int)sVar6;
    if (iVar8 < 0) {
      iVar8 = iVar8 + 1;
    }
    uVar11 = ((iVar8 >> 1) - (int)param_3) + (int)*(short *)(param_2 + 0x32);
    uVar3 = (int)uVar11 >> 0x1f;
    uVar12 = ((int)param_4 - (int)*(short *)(param_2 + 0x34)) + 0xca;
    uVar4 = (int)uVar12 >> 0x1f;
    pcVar7 = param_2;
    if (((int)(((uVar12 ^ uVar4) - uVar4) * 0x10000) >> 0x10 <=
         (int)(short)(((uVar10 ^ uVar2) - uVar2) * 0x10000 >> 0x10)) &&
       ((int)(short)(((uVar9 ^ uVar1) - uVar1) * 0x10000 >> 0x10) <=
        (int)(((uVar11 ^ uVar3) - uVar3) * 0x10000) >> 0x10)) {
      pcVar7 = param_1;
    }
  }
  return pcVar7;
}



// was FUN_00016ef8 -- automap "add/edit note" click handler: resolves
// where the player clicked (map area vs. UI chrome), places, edits, or
// removes a note into the DAT_000ba9d8 note-text array, and can invoke
// switch_automap_level_display for the level-page navigation arrows.
void handle_automap_note_click()

{
  char cVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  int iVar7;
  int iVar8;
  char *pcVar9;
  int iVar10;
  short local_60;
  short local_5e;
  char local_5c [2];
  short local_5a;
  char local_58 [52];
  
  *g_draw_color_index = 0x2d;
  *DAT_00084298 = 0x2d;
  local_5e = *DAT_00085a6c;
  local_60 = 200 - DAT_00085a6c[1];
  if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] handle_automap_note_click entry: local_5e=%d local_60=%d DAT_00085a6c[3]=%d\n", (int)local_5e, (int)local_60, (int)DAT_00085a6c[3]);
  if (3 < DAT_00085a6c[3]) {
    if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] handle_automap_note_click: early return (DAT_00085a6c[3] > 3)\n");
    return;
  }
  wait_for_click_release(1);
  if ((((local_5e < 0x105) || (0x13f < local_5e)) || (0xb4 < local_60)) || (local_60 < 0x96)) {
    if (((local_5e < 0x105) || (0x13f < local_5e)) || ((0x94 < local_60 || (local_60 < 0x77)))) {
      if (local_5e < 0x114) {
LAB_000170bc:
        sVar2 = 0xfe;
      }
      else if (((local_5e < 0x140) && (local_60 < 0x11)) && (1 < local_60)) {
        sVar2 = 0xfc;
      }
      else if ((((local_5e < 0x114) || (0x13f < local_5e)) || (199 < local_60)) ||
              (sVar2 = 0xfb, local_60 < 0xb7)) goto LAB_000170bc;
    }
    else {
      sVar2 = 0xfd;
      set_cursor_confine_rect(0,199,0x13f,0);
      decrement_cursor_hide_depth();
      FUN_00057c5c(0x1079);
      cursor_show_idle_tick();
      do {
        sVar3 = next_input_event();
      } while (sVar3 != 1);
      get_mouse_position(&local_5e,&local_60);
      set_cursor_confine_rect(0,199,0x13f,0);
      FUN_00057cac(1);
    }
  }
  else {
    sVar2 = 0xff;
    change_game_mode(1);
  }
  if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] handle_automap_note_click: branch sVar2=0x%x DAT_000bbef0(count)=%d\n", (unsigned)sVar2, (int)DAT_000bbef0);
  if (sVar2 == 0xfb) {
    if (0x62 < DAT_000ba9d0) goto LAB_0001764c;
    iVar10 = DAT_000ba9d0 + 1;
  }
  else {
    if (sVar2 != 0xfc) {
      if (sVar2 == 0xfd) {
        if (0 < DAT_000bbef0) {
          pcVar5 = (char *)0x0;
          iVar10 = 0;
          iVar7 = (int)local_5a;
          do {
            iVar8 = iVar10 * 0x36;
            pcVar9 = &DAT_000ba9d8 + iVar8;
            pcVar6 = pcVar9;
            do {
              cVar1 = *pcVar6;
              pcVar6[(int)(local_58 + -(int)pcVar9)] = cVar1;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
            sVar2 = measure_text_width(local_58);
            if (((int)*(short *)(&DAT_000baa0a + iVar8) <= (int)local_5e) &&
               ((int)local_5e <= (int)*(short *)(&DAT_000baa0a + iVar8) + (int)sVar2)) {
              if (((int)local_60 <= *(short *)(&DAT_000baa0c + iVar8) + 5) &&
                 (((int)*(short *)(&DAT_000baa0c + iVar8) <= (int)local_60 &&
                  (pcVar5 = (char *)pick_closer_note_label(pcVar5,pcVar9), pcVar5 == pcVar9)))) {
                iVar7 = iVar10;
              }
            }
            iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
          } while (iVar10 < DAT_000bbef0);
          if (pcVar5 != (char *)0x0) {
            DAT_000b99c4 = 1;
            pcVar6 = pcVar5;
            do {
              cVar1 = *pcVar6;
              pcVar6[(int)(local_58 + -(int)pcVar5)] = cVar1;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
            iVar10 = measure_text_width(local_58);
            set_draw_color(0x1a);
            rect_fill_or_save_restore((uint)*(ushort *)(pcVar5 + 0x32),(uint)*(ushort *)(pcVar5 + 0x34),
                         (uint)*(ushort *)(pcVar5 + 0x32) + iVar10,*(ushort *)(pcVar5 + 0x34) + 5);
            screen_backup_restore_rect((uint)*(ushort *)(pcVar5 + 0x32),(uint)*(ushort *)(pcVar5 + 0x34),
                         (uint)*(ushort *)(pcVar5 + 0x32) + iVar10,*(ushort *)(pcVar5 + 0x34) + 5);
            if ((int)(short)iVar7 == DAT_000bbef0 + -1) {
              DAT_000bbef0 = (short)(DAT_000bbef0 + -1);
            }
            else {
              iVar10 = (short)iVar7 * 0x36;
              (&DAT_000baa0a)[iVar10] = 0xff;
              (&DAT_000baa0b)[iVar10] = 0xff;
            }
            draw_automap_notes();
          }
        }
        cursor_show_idle_tick();
        goto LAB_0001764c;
      }
      if (sVar2 != 0xfe) goto LAB_0001764c;
      DAT_000bbef4 = 1;
      DAT_000bbef8 = 1;
      local_5c[1] = 0;
      if (DAT_000bbef0 != 100) {
        iVar7 = DAT_000bbef0 * 0x36;
        select_active_font(s_font4x5p_sys_0008431c);
        FUN_00057c5c(0x107a);
        iVar10 = -1;
        (&DAT_000baa0a)[iVar7] = (char)local_5e;
        (&DAT_000baa0b)[iVar7] = (char)((ushort)local_5e >> 8);
        (&DAT_000baa0c)[iVar7] = (char)(local_60 + -4);
        (&DAT_000baa0d)[iVar7] = (char)((uint)(local_60 + -4) >> 8);
        local_58[0] = '\0';
        iVar8 = *(short *)(&DAT_000baa0a + iVar7) + -1;
        warp_mouse_cursor(*(short *)(&DAT_000baa0a + iVar7) + 9,local_60 + -0x12);
LAB_000171bc:
        sVar2 = poll_input_event(0);
        if (sVar2 < 0) goto LAB_000171a4;
        goto LAB_000171d0;
      }
      iVar8 = (int)local_5a;
      goto LAB_00017404;
    }
    if (DAT_000ba9d0 < 2) goto LAB_0001764c;
    iVar10 = DAT_000ba9d0 + -1;
  }
  switch_automap_level_display(iVar10);
LAB_0001764c:
  wait_for_click_release(1);
  return;
LAB_000171a4:
  sVar2 = poll_keyboard_char_input(&local_5a);
  if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] key-poll: poll_keyboard_char_input returned %d local_5a=%d\n", (int)sVar2, (int)local_5a);
  if (0 < sVar2) {
LAB_000171d0:
    if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] key-loop: sVar2=%d local_58=\"%s\"\n", (int)sVar2, local_58);
    if (((sVar2 == 0xd) || (sVar2 == 0x1b)) || (sVar2 < 4)) goto LAB_0001739c;
    if ((sVar2 < 0x20) || (0x7a < sVar2)) {
      if (sVar2 == 8) {
        iVar10 = iVar10 + -1;
        if (iVar10 * 0x10000 >> 0x10 < -1) {
          iVar10 = -1;
        }
        iVar8 = measure_text_width(local_58);
        if (0 < (short)iVar8) {
          set_draw_color(0x1a);
          rect_fill_or_save_restore((uint)*(ushort *)(&DAT_000baa0a + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0c + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0a + iVar7) + iVar8,
                       *(ushort *)(&DAT_000baa0c + iVar7) + 6);
          screen_backup_restore_rect((uint)*(ushort *)(&DAT_000baa0a + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0c + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0a + iVar7) + iVar8,
                       *(ushort *)(&DAT_000baa0c + iVar7) + 6);
        }
      }
    }
    else {
      local_5c[0] = Ordinal_1091(sVar2);
      sVar2 = measure_text_width(local_58);
      sVar3 = measure_text_width(local_5c);
      if ((((int)sVar3 + (int)sVar2) * 0x10000 >> 0x10) + (int)*(short *)(&DAT_000baa0a + iVar7) <
          0x13c) {
        iVar8 = (iVar10 + 1) * 0x10000 >> 0x10;
        if (iVar8 < 0x2e) {
          local_58[iVar8] = local_5c[0];
          iVar10 = iVar10 + 1;
        }
        else {
          debug_noop_overflow_hook(300,10);
          iVar10 = 0x2d;
        }
      }
      else {
        debug_noop_overflow_hook(300,10);
      }
    }
    local_58[(short)iVar10 + 1] = '\0';
    iVar4 = measure_text_width(local_58);
    iVar8 = *(short *)(&DAT_000baa0a + iVar7) + iVar4 + -1;
    warp_mouse_cursor(*(short *)(&DAT_000baa0a + iVar7) + iVar4 + 9,local_60 + -0x12);
    draw_text_string(local_58,(int)*(short *)(&DAT_000baa0a + iVar7),
                 (int)*(short *)(&DAT_000baa0c + iVar7));
    flush_dirty_rect_to_display(1);
  }
  goto LAB_000171bc;
LAB_0001739c:
  select_active_font(s_font5x6p_sys_0008430c);
  if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] COMMIT: local_58=\"%s\" (empty=%d)\n", local_58, local_58[0]=='\0');
  if (local_58[0] != '\0') {
    DAT_000b99c4 = 1;
    pcVar5 = local_58;
    do {
      cVar1 = *pcVar5;
      pcVar5[(int)(&DAT_000ba9d8 + (iVar7 - (int)local_58))] = cVar1;
      pcVar5 = pcVar5 + 1;
    } while (cVar1 != '\0');
    DAT_000bbef0 = DAT_000bbef0 + 1;
    if (getenv("UW_DEBUG_AUTOMAP_NOTE")) fprintf(stderr, "[map-note] COMMIT: stored, new count=%d\n", (int)DAT_000bbef0);
  }
  flush_dirty_rect_to_display(1);
LAB_00017404:
  decrement_cursor_hide_depth();
  draw_automap_notes();
  warp_mouse_cursor(iVar8 + 0x16,local_60 + -7);
  FUN_00057cac(2);
  flush_dirty_rect_to_display(1);
  DAT_000bbef8 = 0;
  DAT_000bbef4 = 1;
  goto LAB_0001764c;
}



// was FUN_0001765c -- redraws every stored automap note (DAT_000bbef0
// count of DAT_000ba9d8 records) as text at its saved screen position.
void draw_automap_notes()

{
  char *wptr_5780;
  char *wptr_5787;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  char *pcVar5;
  short sVar6;
  int iVar7;
  char acStack_baa20 [764376];
  undefined1 auStack_48 [52];
  
  select_active_font(s_font4x5p_sys_0008431c);
  *g_draw_color_index = 0x2d;
  *DAT_00084298 = 0x2d;
  if (0 < DAT_000bbef0) {
    iVar7 = 0;
    sVar6 = DAT_000bbef0;
    do {
      iVar4 = iVar7 * 0x36;
      pcVar3 = &DAT_000ba9d8 + iVar4;
    wptr_5787 = (acStack_baa20 + iVar7 * -0x36);
      pcVar5 = pcVar3;
    wptr_5780 = (acStack_baa20 + iVar7 * -0x36);
      do {
        cVar1 = *pcVar5;
        *wptr_5780 = cVar1; wptr_5780 = wptr_5780 + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      sVar2 = *(short *)(&DAT_000baa0a + iVar4);
      if (-1 < sVar2) {
        do {
          cVar1 = *pcVar3;
          *wptr_5787 = cVar1; wptr_5787 = wptr_5787 + 1;
          pcVar3 = pcVar3 + 1;
        } while (cVar1 != '\0');
        draw_text_string(auStack_48,(int)sVar2,(int)*(short *)(&DAT_000baa0c + iVar4));
        sVar6 = DAT_000bbef0;
      }
      iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
    } while (iVar7 < sVar6);
  }
  select_active_font(s_font5x6p_sys_0008430c);
  return;
}



// was FUN_00017768 -- compacts out any deleted (negative-length) note
// records, then writes the remaining DAT_000ba9d8 note array to archive
// entry param_1+0x23.
void save_automap_notes_to_archive(param_1)
int param_1;

{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_2c [16];
  
  if (DAT_000b99c4 != 0) {
    iVar3 = (int)DAT_000bbef0;
    iVar2 = (int)DAT_000bbef0;
    if (iVar2 != 0) {
      sVar1 = DAT_000bbef0;
      if (0 < iVar2) {
        iVar4 = 0;
        do {
          if (*(short *)(&DAT_000baa0a + iVar4 * 0x36) < 0) {
            Ordinal_1044(&DAT_000ba9d8 + iVar4 * 0x36,&DAT_000ba9d8 + (iVar4 + 1) * 0x36,
                         iVar4 * -0x36 + 0x1518);
            iVar3 = (iVar2 + -1) * 0x10000 >> 0x10;
          }
          iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
          iVar2 = (int)(short)iVar3;
          sVar1 = (short)iVar3;
        } while (iVar4 < iVar2);
      }
      DAT_000bbef0 = sVar1;
      iVar2 = open_level_archive(auStack_2c,s__SAVE0_lev_ark_000842fc);
      if (iVar2 != 0) {
        write_archive_entry(auStack_2c,param_1 + 0x23,&DAT_000ba9d8,(uint)(DAT_000bbef0 * 0x360000) >> 0x10
                    );
        close_level_archive(auStack_2c);
      }
    }
  }
  return;
}



// was FUN_0001786c -- reads archive entry param_1+0x23 back into the
// DAT_000ba9d8 note array (the read-side counterpart to
// save_automap_notes_to_archive), then redraws them.
void load_automap_notes_from_archive(param_1)
int param_1;

{
  undefined2 uVar1;
  int iVar2;
  undefined1 auStack_20 [16];
  
  DAT_000bbef0 = 0;
  DAT_000b99c8 = 0;
  iVar2 = open_level_archive(auStack_20,s__SAVE0_lev_ark_000842fc);
  if (iVar2 != 0) {
    uVar1 = read_archive_entry(auStack_20,param_1 + 0x23,&DAT_000ba9d8);
    DAT_000b99c8 = Ordinal_2008(0x36,uVar1);
    DAT_000bbef0 = DAT_000b99c8;
    draw_automap_notes();
    close_level_archive(auStack_20);
  }
  return;
}



// was FUN_00017b38 -- switches which level's automap page is on screen:
// saves the current level's notes, clears the reveal buffer, loads the
// new level's reveal state (if a real dungeon level, param_1<9), then
// draws it.
void switch_automap_level_display(param_1)
undefined4 param_1;

{
  int iVar1;
  undefined1 auStack_18 [16];
  
  save_automap_notes_to_archive((int)DAT_000ba9d0);
  clear_automap_reveal_buffer();
  if (((short)param_1 < 9) &&
     (iVar1 = open_level_archive(auStack_18,s__SAVE0_lev_ark_000842fc), iVar1 != 0)) {
    load_automap_reveal_from_archive(auStack_18,param_1);
    close_level_archive(auStack_18);
  }
  draw_automap_screen(param_1);
  return;
}



// was FUN_0007edec -- always returns 0 and does nothing else; both
// confirmed callers (src/automap.c's note-text composition, when the
// wrapped line buffer overflows its 46-char limit or a word doesn't
// fit) pass literal args (300,10) that this decompiled signature
// takes no parameters for and can't use. Matches the same "dead/
// stripped debug hook" pattern already confirmed for debug_print_init,
// debug_print, and debug_noop_checkpoint elsewhere in this file --
// likely a stripped-out warning/beep for "automap note text
// truncated", though not individually re-checked against the real
// disassembly to confirm.
undefined4 debug_noop_overflow_hook()

{
  return 0;
}



