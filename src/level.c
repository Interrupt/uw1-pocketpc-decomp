/* Level loading: the object-table arena init/reset, per-level object
 * table load, and the top-level "enter dungeon view"/"load level"
 * entry points. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/level.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was enter_dungeon_view -- 3D dungeon-view entry transition (fade out, load PALS.DAT
// bank 0, redraw dungeon, fade in)
void enter_dungeon_view()

{
  char stack0xffdc2f3c_buf [256];
  char *stack0xffdc2f3c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char acStack_41c [264];
  undefined1 auStack_314 [768];
  
  FUN_00057118();
  dirty_rect_union(0,200,0,0x140);
  FUN_000678e0();
  FUN_0005b758(0x34,0x14,0xab,0x70);
  Ordinal_1044(auStack_314,&DAT_00088d98,0x300);
  fade_out(0,0,g_uw_framebuffer,200,0x140,0,0,auStack_314,2,0);
  load_pals_bank(0,auStack_314);
  /* load_pals_bank loads PALS.DAT bank 0 (the 3D dungeon-view palette --
     cf. set_palette_bank(0) at the game-mode switch) into the local
     auStack_314 and installs it, but leaves the global DAT_00088d98
     holding whatever bank the main menu last loaded (bank 2). The torch
     palette-cycle loop (palette_cycle_range -> reinstall_active_palette) then re-installs
     g_palette_rgb565 straight from DAT_00088d98 on the very next redraw,
     so the dungeon flips from its real bank-0 colours to the stale menu
     palette (grey -> gold) after the first frame. Mirror the loaded
     palette into DAT_00088d98 so the cycle loop keeps re-installing
     bank 0. */
  Ordinal_1044(&DAT_00088d98,auStack_314,0x300);
  Ordinal_1047(acStack_41c,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc2f3c_ptr = acStack_41c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc2f3c_ptr = cVar1; stack0xffdc2f3c_ptr = stack0xffdc2f3c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_41c,s__DATA_main_byt_000857a8);
  iVar3 = FUN_0006c98c(0xffffffff,acStack_41c,0);
  if (iVar3 == 0) {
    FUN_0003c3c8(0x300b);
  }
  enter_dungeon_view_hud_init();
  FUN_00049924(0x7dfe);
  refresh_player_equipment_effects();
  full_dungeon_redraw();
  weapon_overlay_and_full_redraw();
  cursor_show_idle_tick();
  fade_in(0,0,g_uw_framebuffer,200,0x140,0,0,auStack_314,2,0);
  return;
}




undefined4 init_level_object_arena()

{
  if (DAT_002029cc == 0) {
    /* Widened by 0x3a bytes: 28 backpack/equipment slots * 2 bytes
       (0x38) plus g_current_container_link's own 2 bytes, both now reserved at
       this buffer's tail -- see reset_level_object_arena and g_equipped_items's/
       g_current_container_link's own comments. */
    DAT_002029cc = Ordinal_1041(0x7c08 + 0x3a);
    if (DAT_002029cc == 0) {
      FUN_0003c3b4(0x1002);
    }
  }
  reset_level_object_arena();
  return 1;
}




int load_level_object_table(param_1,param_2)
undefined1 * param_1;
int param_2;

{
  bool bVar1;
  short sVar2;
  char *iVar3;
  int iVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  short *psVar7;
  undefined1 auStack_20 [16];
  
  if (param_1 == (undefined1 *)0x0) {
    iVar3 = open_level_archive(auStack_20,s__SAVE0_lev_ark_000842fc);
    if (iVar3 == 0) {
      return 0;
    }
  }
  else {
    iVar3 = 0xf;
    puVar5 = param_1;
    puVar6 = auStack_20;
    do {
      iVar4 = iVar3 + -1;
      *puVar6 = *puVar5;
      bVar1 = 0 < iVar3;
      iVar3 = iVar4;
      puVar5 = puVar5 + 1;
      puVar6 = puVar6 + 1;
    } while (iVar4 != 0 && bVar1);
  }
  iVar3 = DAT_002029cc;
  psVar7 = (short *)(DAT_002029cc + 0x7c06);
  *psVar7 = 0;
  read_archive_entry(auStack_20,param_2 + -1,DAT_002029cc);
  if (*psVar7 == 0x7577) {
    DAT_002046a8 = DAT_002046a4 + *(short *)(iVar3 + 0x7c02) * 2;
    DAT_0020469c = DAT_002046bc + *(short *)(iVar3 + 0x7c04) * 2;
    DAT_002046c8 = DAT_002046c0 + *(short *)(iVar3 + 0x7c00);
    DAT_002029d0 = 0;
    /* Debug tool (UW_DEBUG_DUMP_TMAP): dump this level's 64x64 tile map
       right after a real load, magic marker and all -- see gx_stub.h's
       comment. */
    uw_debug_dump_tmap(param_2, (unsigned char *)iVar3);
    /* Diagnostic (UW_DEBUG_BAG_TRACE): scan for a type-0x8f (rune bag)
       object's tile linkage IMMEDIATELY after the raw level block lands
       in the arena, before any other code (chargen-completion, HUD init,
       etc.) gets a chance to touch it -- to tell apart "the file's raw
       bytes never link it" from "something clears/corrupts the link
       shortly after load". */
    if (getenv("UW_DEBUG_BAG_TRACE")) {
      int _found = 0;
      for (int _i = 0x100; _i < 0x100 + 1064; _i++) {
        unsigned char *_rec = (unsigned char *)DAT_002046c4 + (_i - 0x100) * 8;
        unsigned _type = (_rec[0] | (_rec[1] << 8)) & 0x1ff;
        if (_type == 0x8f) {
          fprintf(stderr, "[bag-trace] post-load large-table slot=%d addr=%p word0=0x%04x word1=0x%04x\n",
                  _i, (void *)_rec, (unsigned)(_rec[0] | (_rec[1] << 8)), (unsigned)(_rec[2] | (_rec[3] << 8)));
          _found++;
          int _hits = 0;
          for (int _row = 0; _row < 64; _row++) {
            for (int _col = 0; _col < 64; _col++) {
              void *_tile_rec = tilemap_lookup(_row, _col);
              if (!_tile_rec) continue;
              unsigned short *_link = (unsigned short *)((char *)_tile_rec + 2);
              void *_obj;
              int _guard = 0;
              while ((_obj = resolve_object_link(_link)) != NULL && _guard++ < 64) {
                if (_obj == (void *)_rec) {
                  fprintf(stderr, "[bag-trace]   linked on tile (%d,%d)\n", _row, _col);
                  _hits++;
                }
                _link = (unsigned short *)_obj + 2;
              }
            }
          }
          fprintf(stderr, "[bag-trace]   tile-chain hits=%d\n", _hits);
        }
      }
      if (!_found) fprintf(stderr, "[bag-trace] post-load: no type-0x8f object found at all\n");
    }
  }
  else {
    FUN_0003c3c8(3);
  }
  sVar2 = FUN_00081ce4(auStack_20,param_2);
  if (param_1 == (undefined1 *)0x0) {
    close_level_archive(auStack_20);
  }
  return (int)sVar2;
}




void reset_level_object_arena()

{
  undefined2 *puVar1;
  char *iVar2;
  int iVar3;
  
  iVar3 = 0;
  iVar2 = DAT_002029cc;
  do {
    *(byte *)(iVar2 + 2) = *(byte *)(iVar2 + 2) & 0x3f;
    *(undefined1 *)(iVar2 + 3) = 0;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    iVar2 = iVar2 + 4;
  } while (iVar3 < 0x1000);
  DAT_002046b8 = DAT_002029cc + 0x4000;
  DAT_002046c4 = DAT_002029cc + 0x5b00;
  puVar1 = (undefined2 *)(DAT_002029cc + 0x7300);
  DAT_002046a8 = DAT_002029cc + 0x74fa;
  DAT_002046bc = DAT_002029cc + 0x74fc;
  DAT_0020469c = DAT_002029cc + 0x7afa;
  /* g_backpack_slot_table lives in this same arena buffer, in the 0x38
     bytes init_level_object_arena added past the buffer's old real end (0x7c08 --
     note that's past this function's own highest touched offset,
     0x7b00, and past resolve_object_link's old checked upper bound,
     DAT_002046c4+0x1800=0x7300 -- both already-spoken-for, so the new
     reservation goes after the *entire* old buffer instead of trying
     to squeeze into either gap). resolve_object_link's valid-range
     upper bound is widened to this same new true end (0x7c08+0x38) --
     see its own comment -- so this table is both physically present
     and accepted by resolve_object_link's guard. */
  g_backpack_slot_table = DAT_002029cc + 0x7c08;
  iVar3 = 2;
  DAT_002046a0 = DAT_0020469c;
  DAT_002046a4 = puVar1;
  DAT_002046ac = DAT_002046a8;
  do {
    *puVar1 = (short)iVar3;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    puVar1 = puVar1 + 1;
  } while (iVar3 < 0x400);
  if (g_player_object != 0) {
    *(byte *)((char *)g_player_object + 4) = *(byte *)((char *)g_player_object + 4) & 0x3f;
    *(undefined1 *)((char *)g_player_object + 5) = 0;
    *(byte *)((char *)g_player_object + 6) = *(byte *)((char *)g_player_object + 6) & 0x3f;
    *(undefined1 *)((char *)g_player_object + 7) = 0;
    FUN_000465c8();
  }
  DAT_00250770 = 0;
  DAT_002046c0 = DAT_002046a0 + 2;
  DAT_002046c8 = DAT_002046a0 + 2;
  return;
}




int load_level(param_1)
undefined4 param_1;

{
  short sVar1;
  int iVar2;
  undefined1 auStack_1c [16];
  
  write_player_save_record(0);
  if (-1 < DAT_00202080) {
    DAT_00202080 = -1;
  }
  iVar2 = open_level_archive(auStack_1c,s__SAVE0_lev_ark_000842fc);
  if (iVar2 == 0) {
    iVar2 = 0;
  }
  else {
    sVar1 = load_level_object_table(auStack_1c,param_1);
    iVar2 = (int)sVar1;
    FUN_00044624(0);
    if (0 < iVar2) {
      load_level_texture_ids(auStack_1c,param_1);
      FUN_000165bc();
      FUN_0002dba4();
      FUN_000359f4();
      if (iVar2 == 1) {
        FUN_000164e4(auStack_1c,param_1);
      }
    }
    close_level_archive(auStack_1c);
  }
  return iVar2;
}

