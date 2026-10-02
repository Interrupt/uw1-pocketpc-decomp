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
  unregister_game_view_interact_zones();
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
  iVar3 = blit_fullscreen_bitmap_file(0xffffffff,acStack_41c,0);
  if (iVar3 == 0) {
    report_fatal_error_and_exit(0x300b);
  }
  enter_dungeon_view_hud_init();
  set_pending_update_flags(0x7dfe);
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
       g_current_container_link's own comments. Further widened by 0x180
       bytes right after that for g_scheduler_table (the scheduled-
       effects queue's own link table) -- see its own (DAT_00250778's)
       comment. */
    DAT_002029cc = Ordinal_1041(0x7c08 + 0x3a + 0x180);
    if (DAT_002029cc == 0) {
      report_categorized_fatal_error(0x1002);
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
    report_fatal_error_and_exit(3);
  }
  sVar2 = scheduler_load(auStack_20,param_2);
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
  /* g_scheduler_table lives in this same arena buffer too, right after
     g_backpack_slot_table's own 0x3a-byte reservation -- see
     DAT_00250778's own comment for the full explanation, and
     init_level_object_arena's/resolve_object_link's for the matching
     allocation-size/bounds widening by this same 0x180. */
  g_scheduler_table = DAT_002029cc + 0x7c08 + 0x3a;
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
    reset_equipment_and_container_state();
  }
  g_scheduler_count = 0;
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
    load_player_save_record(0);
    if (0 < iVar2) {
      load_level_texture_ids(auStack_1c,param_1);
      clear_automap_reveal_buffer();
      reset_npc_path_cache();
      clear_last_attacker_record();
      if (iVar2 == 1) {
        load_automap_reveal_from_archive(auStack_1c,param_1);
      }
    }
    close_level_archive(auStack_1c);
  }
  return iVar2;
}







// was FUN_0006c79c -- level-transition entry point: cancels any held
// cursor item (same "drop what you're holding" guard as elsewhere),
// snapshots the leaving level's special per-level state
// (save_or_restore_level_special_state(param_1, 1)), commits the leaving
// level to its save slot, loads the new level, and on success restores
// the new level's own special state (save_or_restore_level_special_state
// (param_2, 0)).
int transition_to_level(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  short sVar1;
  int iVar2;
  int iVar3;

  cancel_weapon_swing();
  if ((g_cursor_holding_state == 2) && (g_selected_object != 0)) {
    g_cursor_holding_state = 0;
    g_selected_object = 0;
    FUN_00057cac(3);
  }
  save_or_restore_level_special_state(param_1,1);
  iVar2 = commit_level_to_save_slot(param_1);
  iVar3 = 0;
  if (iVar2 != 0) {
    sVar1 = load_level(param_2);
    iVar3 = (int)sVar1;
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      save_or_restore_level_special_state(param_2,0);
    }
  }
  return iVar3;
}






// was FUN_0006c834 -- saves (param_2==1) or restores (param_2==0) a
// leaving/entering level's special transient per-level state, called
// from transition_to_level around commit_level_to_save_slot/load_level.
// Only levels 7 and 9 have any such state: level 7's floor-hazard byte
// (DAT_00086df8+0x38/+0x37, restored via update_level7_floor_hazard_state)
// and level 9's DAT_00086b20 special value. param_2==3 (level 9 only)
// clears DAT_00086b20 outright rather than saving/restoring it. Only
// takes the save/restore/clear path when DAT_00086df8+0x60's bit 4 is
// clear or this is a save/clear call (param_2!=0); a restore
// (param_2==0) with that bit set instead calls reset_level_arena_and_invalidate(0).
void save_or_restore_level_special_state(param_1,param_2)
short param_1;
short param_2;

{
  if (((*(byte *)(DAT_00086df8 + 0x60) & 0x10) == 0) || (param_2 != 0)) {
    if (param_2 == 0) {
      clear_last_attacker_record();
    }
    else if (param_2 == 1) {
      advance_mobile_objects();
    }
    if (param_1 == 7) {
      if ((*(byte *)(DAT_00086df8 + 0x60) & 0x20) == 0) {
        if (param_2 == 0) {
          *(undefined1 *)(DAT_00086df8 + 0xb0) = *(undefined1 *)(DAT_00086df8 + 0x38);
          *(undefined1 *)(DAT_00086df8 + 0x38) = 0;
          *(undefined1 *)(DAT_00086df8 + 0x37) = 0;
          update_level7_floor_hazard_state(*(byte *)(DAT_00086df8 + 0x62) >> 4 & 1);
        }
        else if (param_2 == 1) {
          *(undefined1 *)(DAT_00086df8 + 0x38) = *(undefined1 *)(DAT_00086df8 + 0xb0);
          *(byte *)(DAT_00086df8 + 0x37) = *(byte *)(DAT_00086df8 + 0xb0) >> 2;
        }
      }
    }
    else if (param_1 == 9) {
      if (param_2 == 0) {
        *(char *)(DAT_00086df8 + 0xb0) = (char)DAT_00086b20;
        DAT_00086b20 = 0;
      }
      else if (param_2 == 1) {
        DAT_00086b20 = (uint)*(byte *)(DAT_00086df8 + 0xb0);
      }
      else if (param_2 == 3) {
        DAT_00086b20 = 0;
      }
    }
  }
  else {
    reset_level_arena_and_invalidate(0);
  }
  return;
}






// was FUN_0007129c -- rolls for and triggers one of several as-yet-
// untriggered special per-level dialog/effect ids (tracked as bits in
// the 16-bit DAT_00086df8+0x6e mask): picks a candidate id (favoring
// low ids 0-3 gated by which of that mask's own bits 1/2/4/8 are set,
// falling back to a random id 4-9 if none of those are available or
// already used), then shows it via display_book_or_scroll_page (this file's general
// dialog-box routine, see its own "box drawing routine" comment) and
// marks its bit used. If no id was available at all (or
// DAT_00086df8+0x62 bit 3 is set), just busy-waits ~0x180 clock units
// instead and reports no trigger. Exact meaning of ids 0-9 not
// identified.
undefined4 trigger_random_level_special_event(param_1)
short param_1;

{
  int uw_ord2005_rem_143 = 0;
  undefined4 uVar1;
  short extraout_r1;
  int extraout_r1_00;
  uint uVar2;
  int iVar3;
  
  iVar3 = -1;
  uVar2 = (uint)*(short *)(DAT_00086df8 + 0x6e);
  if ((uVar2 & 1) == 1) {
    if ((DAT_00201b68 < 2) || ((uVar2 & 2) == 2)) {
      if ((uVar2 & 4) == 4) {
        iVar3 = 2;
      }
      else if ((uVar2 & 8) == 8) {
        iVar3 = 3;
      }
    }
    else {
      iVar3 = 1;
    }
  }
  else {
    iVar3 = 0;
  }
  if ((short)iVar3 < 0) {
    uVar1 = Ordinal_1053();
    Ordinal_2005((param_1 + 1) * 4,uVar1);
    if (extraout_r1_00 == 0) {
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_143 = ((int)(uVar1)) % (6);
      iVar3 = uw_ord2005_rem_143 + 4;
      if ((uVar2 & 1 << (iVar3 * 0x10000 >> 0x10 & 0xffU)) != 0) {
        iVar3 = -1;
      }
    }
  }
  if (((short)iVar3 < 0) || ((*(byte *)(DAT_00086df8 + 0x62) & 8) != 0)) {
    iVar3 = read_realtime_clock_units();
    do {
      uVar2 = read_realtime_clock_units();
    } while (uVar2 < iVar3 + 0x180U);
    uVar1 = 0;
  }
  else {
    display_book_or_scroll_page(iVar3 + 0x18);
    uVar2 = (uint)*(ushort *)(DAT_00086df8 + 0x6e) ^ 1 << ((int)(short)iVar3 & 0xffU) & 0xffffU;
    *(char *)(DAT_00086df8 + 0x6e) = (char)uVar2;
    *(char *)(DAT_00086df8 + 0x6f) = (char)(uVar2 >> 8);
    uVar1 = 1;
  }
  return uVar1;
}


// was FUN_000396a0 -- teleports object param_1 to tile
// (param_2,param_3) on level param_4. Confirmed as the "teleporter
// trap" handler (dispatch_trap_type_effect's case 1, teleporting the
// current trigger object DAT_0024cff4 to a trap-record-specified
// tile/level). Only proceeds if the target level matches the current
// level (DAT_00201b68) or the target is the player. Skips the
// find_placement_via_tile_flood_fill relocate step when both
// coordinates are the 0x3f sentinel (used elsewhere purely to refresh
// the player's tracked position/redraw state without moving them).
// Returns 0x10 on success, 2 if blocked (wrong level, or no valid
// nearby tile found).
undefined4 teleport_object_to_level_tile(param_1,param_2,param_3,param_4)
char *param_1;
int param_2;
int param_3;
short param_4;

{
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  short local_1c;
  short local_1a;

  sVar1 = DAT_00201b68;
  if ((param_4 == DAT_00201b68) || (param_1 == g_player_object)) {
    if (((param_4 == 0) || (param_4 == DAT_00201b68)) &&
       (((short)param_2 != 0x3f && ((short)param_3 != 0x3f)))) {
      iVar2 = find_placement_via_tile_flood_fill(param_1,param_2,param_3,&local_1c,&local_1a,0);
      if (iVar2 == 0) goto LAB_00039784;
      param_2 = (int)local_1c;
      param_3 = (int)local_1a;
      param_4 = sVar1;
    }
    if (param_1 == g_player_object) {
      DAT_00201c90 = (undefined2)param_2;
      DAT_00201c8c = (undefined2)param_3;
      DAT_00201c7c = param_4;
      set_pending_update_flags(0x20);
    }
    uVar3 = 0x10;
  }
  else {
LAB_00039784:
    uVar3 = 2;
  }
  return uVar3;
}


// was FUN_0003bc1c -- hard-resets the level object arena
// (reset_level_object_arena), flushes a redraw, and invalidates
// DAT_00202080 (a loaded-level data marker). Used in place of the
// normal save/restore path when a level's transient state can't be
// trusted (save_or_restore_level_special_state's own "needs reset"
// bit case).
void reset_level_arena_and_invalidate()

{
  reset_level_object_arena();
  set_pending_update_flags(2);
  DAT_00202080 = 0xffff;
  return;
}


// was FUN_000499a4 -- frees g_level_tiles (DAT_002029cc) if currently
// allocated, without clearing the pointer itself (callers are
// expected to overwrite it right after, e.g. on loading a new level).
void free_level_tile_arena()

{
  if (DAT_002029cc != 0) {
    Ordinal_1018();
  }
  return;
}
