/* Top-level program flow: WinMain's real body (window/subsystem init and
 * the OS message pump) and the title/main menu loop. Split out of uw.c
 * (the original monolithic decompile) once these functions' real roles
 * were confirmed. */
#include "headers/game.h"
#include "headers/debug.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>



// WinMain's real body: single-instance mutex check, window class/window creation, framebuffer + subsystem init, shows the main menu once, then runs the PeekMessage/Translate/Dispatch message pump until quit.
undefined4 app_main_loop(param_1,param_2,param_3,param_4)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  uint uVar1;
  int iVar2;
  void *uVar3;
  undefined4 *puVar4;
  undefined1 auStack_40 [4];
  int local_3c;
  undefined4 local_38;

  uVar1 = Ordinal_286(u_UltimaUW_00087678,u_Ultima_Under_World_00087690);
  if (uVar1 == 0) {
    DAT_0023c59e = 0;
    DAT_0023c5a0 = 0;
    DAT_0023c540 = param_1;
    spawn_message_dispatch_thread(param_1,u_UltimaUW_00087678);
    iVar2 = create_main_window_and_init_display(param_1,param_4);
    if (iVar2 != 0) {
      uVar3 = Ordinal_1041(0x25800);
      /* was a CONCAT22 pair split across _DAT_0023c5ac/DAT_0023c5b0 --
         see g_uw_framebuffer's declaration comment. */
      g_uw_framebuffer = uVar3;
      uVar3 = Ordinal_1041(0x25800);
      FUN_0003af28(param_1,0xca,uVar3);
      dirty_rect_union(0,0xf0,0,0x140);
      Ordinal_1044(g_uw_framebuffer,uVar3,0x25800);
      flush_dirty_rect_to_display_240();
      Ordinal_496(2000);
      Ordinal_1018(uVar3);
      build_rgb565_palette(0,0xffffffff);
      build_shade_lut();
      DAT_0023c44c = Ordinal_1041(0x4cce);
      DAT_0023cca0 = Ordinal_1041(64000);
      DAT_0023cef0 = Ordinal_1041(0x7fff);
      Ordinal_1047(DAT_0023c44c,0,0x4cce);
      /* DAT_0023c7a0 is now a real void*[] (widened from Ghidra's
         `undefined4`); zero it as one so the whole 8-byte slots clear. */
      for (iVar2 = 0; iVar2 < 0x140; iVar2++) {
        DAT_0023c7a0_arr[iVar2] = 0;
      }
      (void)puVar4;
      Ordinal_1047(DAT_0023cca0,0,64000);
      Ordinal_1047(DAT_0023cef0,0,0x7fff);
      DAT_0023cca4 = DAT_0023c44c;
      DAT_0024ad58 = DAT_0023c44c;
      DAT_00248410 = DAT_0023c44c;
      DAT_0024af78 = Ordinal_1041(0x1800);
      Ordinal_1047(DAT_0024af78,0,0x1800);
      DAT_0024af7c = Ordinal_1041(0x1800);
      Ordinal_1047(DAT_0024af7c,0,0x1800);
      DAT_000879b0 = Ordinal_1041(0xc);
      DAT_000890a4 = Ordinal_1041(0x1080);
      g_weapon_swing_current_frame = Ordinal_1041(64000);
      Ordinal_1047(g_weapon_swing_current_frame,0,64000);
      g_weapon_swing_startup_scratch_buffer = g_weapon_swing_current_frame;
      *DAT_000876bc = 0;
      *DAT_000876c0 = 0;
      FUN_000228d4();
      FUN_0003b820();
      FUN_0001dd2c();
      FUN_0003bb60();
      main_menu_loop(1);
      DAT_00201c98 = 1;
      while (DAT_00201b6c != 0) {
        if (DAT_000876c8 == 0) {
          if ((DAT_0024af60 == 0) || (100 < DAT_0024af6c)) {
            if (DAT_0024af6c < 0x33) {
              DAT_0024af6c = (short)((int)DAT_0024af6c << 1);
            }
          }
          else {
            DAT_0024af6c = (short)((int)DAT_0024af6c << 2);
          }
        }
        else {
          DAT_0023c648 = read_realtime_clock_units();
          DAT_0023c448 = 0;
        }
        /* One real game tick -- see uw_advance_game_tick's own comment
           for why this must be called from exactly here (this loop, once
           per iteration) rather than from inside uw_pump_events() itself,
           which Ordinal_864 below triggers but which can also be
           reached from other polling loops within a single iteration of
           this one. */
        uw_advance_game_tick();
        {
          static unsigned int _dbg_t0 = 0, _dbg_t1 = 0;
          int _dbg = getenv("UW_DEBUG_ITERSPLIT") != NULL;
          if (_dbg) _dbg_t0 = read_realtime_clock_units() * 4;
          iVar2 = Ordinal_864(auStack_40,0,0,0,1);
          if (iVar2 != 0) {
            if (local_3c == 0x12) break;
            Ordinal_870(auStack_40);
            Ordinal_859(auStack_40);
          }
          if (_dbg) _dbg_t1 = read_realtime_clock_units() * 4;
          main_loop_hud_flush();
          if (_dbg) {
            unsigned int _dbg_t2 = read_realtime_clock_units() * 4;
            fprintf(stderr, "[itersplit] ordinal864_ms=%u hudflush_ms=%u\n",
                    _dbg_t1 - _dbg_t0, _dbg_t2 - _dbg_t1);
          }
        }
      }
      uVar3 = window_message_noop_handler(param_1,local_38);
      return uVar3;
    }
  }
  else {
    Ordinal_702(uVar1 | 1);
  }
  return 0;
}



// Title/main menu loop: builds the menu layout, dispatches on the selected option (0=continue?, 1=new game -> character_generator_loop, 2=show CREDIT1/2/3.BYT credits screens, 3=load a saved game), looping back to the menu until a game session actually starts.
void main_menu_loop(param_1)
undefined4 param_1;

{
  /* stack0xffdc2b6c/2c74/2d7c are leftover placeholder scalars (from an
     early undeclared-identifier fix pass) that 8 separate "copy the
     install-dir base path" loops below used as
     `pcVar5[(int)&placeholder] = cVar1;` -- the classic "broken index
     copy loop" Ghidra artifact documented in the README, missed by the
     earlier systematic fix_stack_copy_loops.py/refix_stack_copy_loops.py
     passes. Each loop is immediately followed by Ordinal_1047(REALBUF,
     0,0x104) + Ordinal_1063(REALBUF,...) using the buffer this copy was
     actually meant to fill (acStack_7ec/acStack_6e4/acStack_5dc
     respectively) -- redirected via a real incrementing destination
     pointer instead. */
  char *pcVar_dst;
  unsigned int stack0xffdc2b6c;
  unsigned int stack0xffdc2c74;
  unsigned int stack0xffdc2d7c;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  bool bVar11;
  short local_83c [2];
  int local_838;
  /* Was `int`, holds the same Ordinal_1041(0x10000) pointer as
     DAT_0023bf70 (see its comment), passed to Ordinal_1018 (free) --
     truncating on this 64-bit host. */
  void *local_834;
  /* iVar4 is reused throughout this function for unrelated numeric work
     (timers, loop indices, etc.) after its brief life holding that same
     Ordinal_1041(0x10000) pointer -- pvVar_buf10000 takes over only that
     pointer-holding span instead of retyping iVar4 itself, same pattern
     as other dual-purpose-variable fixes elsewhere in this file. */
  void *pvVar_buf10000;
  /* Declared as a lone 4-byte scalar, but `&local_82c` is handed to
     DAT_0023bf6c and then read back through draw_menu_item_list/menu_button_list_navigate
     as an array of up to 4 (param_1) 0x10-byte-stride records (plus an
     overlapping 4-byte-stride array access) -- another undersized-local
     table, confirmed via ASAN stack-buffer-overflow. Widened directly.

     Ghidra also split the buffer's own first 0x40 bytes into 22 further
     separate locals (local_828 down through local_7ee, originally named
     for their individual stack offsets -0x828..-0x7ee -- each exactly
     0x82c-that_offset bytes into local_82c) instead of recognizing them
     as writes into this same array -- the classic "separate locals
     relied on being contiguous" artifact (see the README). Their
     offsets land EXACTLY on the first 4 button records' fields (4
     records x 0x10 bytes = 0x40): each record is [4-byte bitmap-ptr
     slot for unselected, 4-byte slot for selected (both now unused --
     see g_menu_button_bitmaps), 2-byte X, 2-byte Y, 2-byte W
     (placeholder, overwritten by populate_menu_button_bitmap_entry), 2-byte H (same)].
     Confirmed: their X/Y values (e.g. (0x62,0x52), (0x51,0x69),
     (0x48,0x81), (0x55,0x9a)) are exactly the button position data
     draw_menu_item_list reads back out at pcVar_rec+8/+10 -- previously always
     zero because these locals never actually reached local_82c's
     memory, which is why every button rendered stacked at (0,0). Merged
     directly into offset-based writes into local_82c below instead of
     keeping them as separate, non-aliasing scalars. */
  char local_82c [256];
  char acStack_7ec [264];
  char acStack_6e4 [264];
  char acStack_5dc [264];
  undefined1 auStack_4d4 [160];
  undefined1 auStack_434 [520];
  undefined1 auStack_22c [520];
  
  /* local_82c is now a real array (see its declaration) -- zero the
     whole thing rather than just its first 4 bytes, since it's read
     back as a multi-record table. Every one of the offset writes below
     must happen after this, not before -- see local_82c's declaration
     comment for why they used to be separate, unmerged locals. */
  Ordinal_1047(local_82c,0,sizeof(local_82c));
  /* Record 0 (button 0): bitmap-ptr slots (offsets 0/4) are now unused
     -- see g_menu_button_bitmaps -- X/Y at 8/0xa, W/H placeholders
     (overwritten by populate_menu_button_bitmap_entry once the real bitmap loads) at
     0xc/0xe. */
  *(short *)(local_82c + 8) = 0x62;
  *(short *)(local_82c + 0xa) = 0x52;
  *(short *)(local_82c + 0xc) = 1;
  *(short *)(local_82c + 0xe) = 1;
  /* Record 1 (button 1), same layout at +0x10. */
  *(short *)(local_82c + 0x18) = 0x51;
  *(short *)(local_82c + 0x1a) = 0x69;
  *(short *)(local_82c + 0x1c) = 1;
  *(short *)(local_82c + 0x1e) = 1;
  /* Record 2 (button 2), same layout at +0x20. */
  *(short *)(local_82c + 0x28) = 0x48;
  *(short *)(local_82c + 0x2a) = 0x81;
  *(short *)(local_82c + 0x2c) = 1;
  *(short *)(local_82c + 0x2e) = 1;
  /* Record 3 (button 3), same layout at +0x30. */
  *(short *)(local_82c + 0x38) = 0x55;
  *(short *)(local_82c + 0x3a) = 0x9a;
  *(short *)(local_82c + 0x3c) = 1;
  *(short *)(local_82c + 0x3e) = 1;
  dirty_rect_union(0,200,0,0x140);
  DAT_0023bf6c = &local_82c;
  probe_save_slots(auStack_4d4,local_83c);
  uVar8 = 3;
  if (local_83c[0] != 0) {
    uVar8 = 4;
  }
  uVar2 = 1;
  if (local_83c[0] != 0) {
    uVar2 = 3;
  }
  update_journey_onward_availability(param_1);
  FUN_00057c5c(0x106c);
  cursor_show_idle_tick();
  bVar11 = false;
  local_838 = 0;
  do {
    iVar4 = local_838;
    advance_menu_music_track();
    if ((iVar4 < 4) && (-1 < iVar4)) {
      pvVar_buf10000 = Ordinal_1041(0x10000);
      DAT_0023bf70 = pvVar_buf10000;
      local_834 = pvVar_buf10000;
      Ordinal_1047(acStack_7ec,0,0x104);
      pcVar5 = &DAT_0023cca8;
      pcVar_dst = acStack_7ec;
      do {
        cVar1 = *pcVar5;
        *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      Ordinal_1063(acStack_7ec,s__DATA_opscr_byt_00086eec);
      DEBUG(TRACE, "blitting %s", s__DATA_opscr_byt_00086eec);
      read_buffer_from_file(acStack_7ec,pvVar_buf10000,64000);
      FUN_00057118();
      // HACK: deviation from the real binary -- was load_pals_bank(2, temp_buf),
      /* confirmed via ARM disassembly of the original UU.exe
         (main_menu_loop == FUN_0006a3d8, calls load_pals_bank directly at
         both its own palette-load points, never through set_palette_bank).
         That's a genuine shipped bug, not a decompile artifact:
         load_pals_bank installs g_palette_rgb565 correctly for the menu's own
         draw, but never syncs DAT_00088d98 -- the buffer
         reinstall_active_palette() (called periodically by the menu's own hover-
         loop timer, animate_title_palette_cycle) always reinstalls from. Since nothing
         else keeps DAT_00088d98 current for the menu screen, it holds
         whatever palette some other screen last loaded via
         set_palette_bank, and the timer clobbers the menu's correct
         palette back to that stale one on the very next hover/redraw
         (confirmed via UW_DEBUG_LEVEL=TRACE: g_palette_rgb565 flips from
         pals.dat index 2 to a leftover index 5). Using set_palette_bank(2)
         here instead keeps DAT_00088d98 in sync, so that clobber
         reinstalls the *same* correct palette instead of a stale one. */
      set_palette_bank(2);
      iVar10 = 0;
      do {
        iVar6 = 0;
        do {
          iVar9 = iVar10 * 0x140 + iVar6;
          *(undefined2 *)((g_uw_framebuffer) + iVar9 * 2) =
               (&g_palette_rgb565)[*(byte *)(iVar9 + DAT_0023bf70)];
          iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        } while (iVar6 < 0x140);
        iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
      } while (iVar10 < 200);
      debug_framebuffer_dump("main_menu_loop");
      cursor_show_idle_tick();
      if ((DAT_0023bf70 == 0) ||
         /* Was a literal 0 here (an earlier fix pass believed this
            mirrored sibling call sites like FUN_00041a78's genuine
            "no postprocessing needed" case) -- but populate_menu_button_bitmap_entry is
            exactly the postprocess_cb this resource load needs: same
            3-arg shape as chargen's LAB_000255d0 (see its comment near
            DAT_000fb880), and it writes the per-button bitmap-pointer/
            width/height fields draw_menu_item_list reads out of DAT_0023bf6c's
            record table -- which is otherwise only ever zeroed
            (local_82c's memset above), never populated. Same orphaned-
            callback bug class as LAB_000255d0 was, just already
            decompiled as a named function instead of staying raw
            undecompiled ARM. */
         (iVar10 = load_gr_resource_entries(s_opbtn_00086ee4,0,0xffffffff,&LAB_0006a0ac,&populate_menu_button_bitmap_entry), iVar10 == 0)) {
        FUN_0003c3c8(0x300d);
      }
      if (local_838 != 3) {
        draw_menu_item_list(uVar8,DAT_0023bf6c,0,uVar2);
        // HACK: same DAT_00088d98-sync deviation as this function's other
        // palette-load point above -- see that comment.
        set_palette_bank(2);
        fade_in(0,0,g_uw_framebuffer,200);
      }
    }
    sVar3 = menu_button_list_navigate(uVar8,DAT_0023bf6c,0,uVar2);
    local_838 = (int)sVar3;
    if (getenv("UW_DEBUG_TITLEMENU")) fprintf(stderr, "[titlemenu] uVar8=%d uVar2=%d navigate->%d\n", (int)uVar8, (int)uVar2, local_838);
    if (local_838 == -1) {
      FUN_0003baf4(0);
      terminate_process(1);
    }
    else if (local_838 == 0) {
      FUN_00037c14(0);
    }
    else if (local_838 == 1) {
      g_text_use_palette_color = 1;
      fade_out(0,0,g_uw_framebuffer,200);
      iVar4 = character_generator_start();
      if (iVar4 != 0) {
        Ordinal_1047(acStack_6e4,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_6e4;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_6e4,&DAT_000857a0);
        ensure_save_directory_exists(acStack_6e4);
        /* load_game_from_slot (was FUN_0006c0c0; the numbered-save-slot
           "Save Game" path) reads \SAVE0\player.dat before duplicating
           SAVE0 into the chosen slot, but nothing ever created that file
           for a freshly-started character. write_player_save_record
           (was FUN_00043fd8) is the only other writer (confirmed by its
           body: malloc+serialize+CreateFile+WriteFile) -- called here
           too, alongside the \SAVE0\lev.ark seed a few lines down. First
           attempt chased a red herring: this newly reaches
           write_player_status_block->write_xor_scrambled_block with a genuinely truncated pointer
           (fixed, write_xor_scrambled_block's param_3), but the *fatal* oversized-
           write abort seen afterward was a false trail from a completely
           unrelated, pre-existing bug in seed_conversation_globals_for_new_game (also fixed, see
           its own comment) that this code path happens to run right
           past. */
        write_player_save_record(acStack_6e4);
        Ordinal_1047(acStack_6e4,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_6e4;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_6e4,s__DATA_lev_ark_00085734);
        uVar7 = FUN_0002295c(acStack_6e4);
        Ordinal_61(auStack_22c,uVar7);
        Ordinal_1047(acStack_5dc,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_5dc;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_5dc,s__SAVE0_lev_ark_000842fc);
        uVar7 = FUN_0002295c(acStack_5dc);
        Ordinal_61(auStack_434,uVar7);
        /* The original does CopyFileW(auStack_22c, auStack_434) here to
           seed the new game's world from the pristine template. That path
           relies on the coredll wide-string ordinals (Ordinal_196/61/164),
           which are no-op stubs -- and the pointer FUN_0002295c returns
           gets truncated through this function's `undefined4` locals, so
           making them real would crash. Do the copy directly against the
           game paths instead: without it \SAVE0\lev.ark never exists and
           load_level below fails, bouncing straight back to the menu
           instead of entering the dungeon. */
        Ordinal_164(auStack_22c,auStack_434,0);
        uw_file_copy(s__DATA_lev_ark_00085734, s__SAVE0_lev_ark_000842fc);
        sVar3 = seed_conversation_globals_for_new_game();
        if (sVar3 != 0) {
          FUN_0003c3c8();
        }
        sVar3 = load_level(1);
        if (sVar3 < 1) {
          bVar11 = false;
        }
        else {
          bVar11 = true;
          set_player_tile_position(0x20,2,1);
          debug_print_player_position("chargen-spawn");
          save_or_restore_level_special_state(1,0);
        }
      }
      g_text_use_palette_color = 0;
    }
    else if (local_838 == 2) {
      iVar4 = read_realtime_clock_units();
      do {
        Ordinal_1047(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_7ec,s__DATA_CREDIT1_BYT_00086ed0);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = read_realtime_clock_units();
      do {
        Ordinal_1047(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_7ec,s__DATA_CREDIT2_BYT_00086ebc);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = read_realtime_clock_units();
      do {
        Ordinal_1047(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_7ec,s__DATA_CREDIT3_BYT_00086ea8);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      FUN_00049924(0x7ffe);
    }
    else if (local_838 == 3) {
      sVar3 = journey_onward_load_slot_menu();
      bVar11 = sVar3 == 1;
      if (sVar3 == -1) {
        uVar7 = get_message_string(0x2a9);
        Ordinal_1047(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_7ec,s__DATA_opscr_byt_00086eec);
        blit_fullscreen_bitmap_file(0xffffffff,acStack_7ec,1);
        select_active_font(s_FONTBIG_SYS_00085454);
        *g_draw_color_index = 0xa2;
        *DAT_00084298 = 0xa2;
        sVar3 = measure_text_width(uVar7);
        iVar4 = (int)sVar3;
        if (iVar4 < 0) {
          iVar4 = iVar4 + 1;
        }
        draw_text_string(uVar7,0xa0 - (short)(iVar4 >> 1),0x5a);
        cursor_show_idle_tick();
        while (sVar3 = next_input_event(), sVar3 < 0) {
          animate_title_palette_cycle();
        }
        select_active_font(s_FONT5X6P_SYS_00084e9c);
      }
      else if (bVar11) {
        unready_weapon();
      }
    }
    Ordinal_1018(local_834);
  } while (!bVar11);
  FUN_00057cac(3);
  cursor_show_idle_tick();
  set_game_mode(1);
  FUN_00049924(0x7ffe);
  DAT_000868d8 = 0;
  return;
}



// was FUN_00066c90 -- closes the backpack container UI and clears the
// player's transient inventory-view state before a level transition
// (FUN_0003bee4, a resurrect/reset-position path) or a fresh level
// load (load_level), so no dangling container reference survives the
// change.
void close_panels_before_level_change()

{
  close_backpack_container();
  FUN_000444b0((char *)g_player_object + 6);
  FUN_000465c8();
  return;
}



// was FUN_00066cb4 -- zeroes g_player_object's whole 0x1b-byte record
// then re-sets it to a fresh blank object header/mobile-record: a
// default heading/quality pattern, item-id 0x7f (the player's fixed
// item-id), and clears the container/link/status bitfields. Called
// once from init_gameplay_session at the start of every session.
void reset_player_object_record()

{
  ushort uVar1;

  Ordinal_1047(g_player_object,0,0x1b);
  *(byte *)((char *)g_player_object + 3) = (byte)g_player_object[3] & 0x3f;
  *(undefined1 *)((char *)g_player_object + 7) = 0;
  *(undefined1 *)((char *)g_player_object + 0xd) = 0xfd;
  uVar1 = *g_player_object;
  *(char *)g_player_object = (char)(uVar1 & 0x7fff);
  *(char *)((char *)g_player_object + 1) = (char)((uVar1 & 0x7fff) >> 8);
  uVar1 = *g_player_object;
  *(char *)g_player_object = (char)uVar1;
  *(byte *)((char *)g_player_object + 1) = (byte)(uVar1 >> 8) | 0x20;
  uVar1 = *g_player_object;
  *(char *)g_player_object = (char)(uVar1 & 0xbfff);
  *(char *)((char *)g_player_object + 1) = (char)((uVar1 & 0xbfff) >> 8);
  uVar1 = g_player_object[1];
  *(char *)((char *)g_player_object + 1) = (char)(uVar1 & 0xfc7f);
  *(char *)((char *)g_player_object + 3) = (char)((uVar1 & 0xfc7f) >> 8);
  *(byte *)((char *)g_player_object + 0xc) = (byte)g_player_object[0xc] & 0xe0;
  uVar1 = g_player_object[2];
  *(char *)((char *)g_player_object + 2) = (char)(uVar1 & 0xffc0);
  *(char *)((char *)g_player_object + 5) = (char)((uVar1 & 0xffc0) >> 8);
  *(byte *)((char *)g_player_object + 2) = (byte)g_player_object[2] & 0x3f;
  *(undefined1 *)((char *)g_player_object + 5) = 0;
  uVar1 = g_player_object[3];
  *(char *)((char *)g_player_object + 3) = (char)(uVar1 & 0xffc0);
  *(char *)((char *)g_player_object + 7) = (char)((uVar1 & 0xffc0) >> 8);
  *(byte *)((char *)g_player_object + 3) = (byte)g_player_object[3] & 0x3f;
  *(undefined1 *)((char *)g_player_object + 7) = 0;
  *(undefined1 *)((char *)g_player_object + 0x11) = 0;
  uVar1 = *g_player_object;
  *(undefined1 *)g_player_object = 0x7f;
  *(byte *)((char *)g_player_object + 1) = (byte)(uVar1 >> 8) & 0xfe;
  return;
}



// was FUN_00066e90 -- one-time gameplay session setup: initializes
// player/camera/movement state (starting level 1, facing, locomotion
// mode), the player object record (reset_player_object_record),
// several link-time-initialized gameplay-enable flags this port's
// decompile otherwise leaves permanently zero (g_npc_tick_enabled,
// the scheduler-tick gate DAT_000879ac, the keyboard command-mode
// flag DAT_0024af60 -- see each flag's own inline comment for the
// bug this fixes), then registers the whole movement/UI key-binding
// and click-region table. Called once at the start of a session.
void init_gameplay_session()

{
  int iVar1;

  /* DAT_002029cc is set once, early (init_level_object_arena/reset_level_object_arena: a real
     malloc'd pointer via Ordinal_1041), and DAT_002046b8/DAT_002046c4
     are derived from it and never touched again. By the time this
     function runs, though, DAT_002029cc has been observed (via a
     temporary diagnostic print) to no longer hold that pointer -- some
     other write elsewhere in this file is landing on its storage
     between then and now, the same general "stray write corrupts an
     unrelated global" class of bug as DAT_0023c5ac/DAT_0023c5b0 and
     DAT_00110fc8/fc0/fcc earlier, but the actual writer wasn't pinned
     down (not caught by ASAN as an out-of-bounds write, so it's likely
     a plausible-looking but wrong destination computed elsewhere rather
     than a classic overflow). Rather than dereference a pointer derived
     from corrupted state (confirmed crashing in Ordinal_1047 by way of
     reset_player_object_record), bail out defensively if it doesn't look like a
     plausible heap pointer. */
  if ((uintptr_t)DAT_002029cc < 0x10000) {
    return;
  }
  DAT_0023b82c = (byte *)(DAT_002046b8 + 0x1b);
  DAT_00202080 = 0xffff;
  DAT_00201c78 = 0;
  DAT_00201c70 = 0;
  DAT_0023beb4 = 0;
  DAT_0023beb8 = 0;
  /* Command-input mode. When set, handle_keyboard_message folds a WM_CHAR
     letter to its uppercase code before dropping it in DAT_0023c448, so
     the movement key bindings registered just below (W/S/X/A/D = VK
     codes 0x57/0x53/0x58/0x41/0x44) actually match a keypress, and the
     main loop ramps the hold-acceleration counter faster. It is a
     link-time-initialised flag whose real setup Ghidra dropped (same
     silently-zero class as DAT_00086e68 / DAT_0008589c etc.): left at 0
     the keyboard movement keys were dead. Toggled off again by the
     Caps-Lock key (VK 0x14) in handle_keyboard_message; text-entry
     screens that need raw lowercase (chargen name entry) run before this
     function. */
  DAT_0024af60 = 1;
  DAT_00201b68 = 1;
  DAT_002048a7 = 8;
  DAT_002048a3 = 1;
  DAT_002048a4 = 0;
  DAT_002048b8 = &check_and_reset_landing_state;
  DAT_002048b2 = 0x1100;
  DAT_002048b0 = 0;
  g_player_object = DAT_0023b82c;
  load_shading_level_config(0);
  DAT_0023be8c = 0;
  DAT_00086df8 = &DAT_0023bca8;
  /* HACK, same silently-zero class as DAT_0024af60 above and DAT_00086e68 /
     DAT_0008589c elsewhere in this file: g_npc_tick_enabled is read exactly once
     in this whole file, as the enable gate for movement_tick's per-frame
     call to tick_mobile_objects (the real NPC/mobile-object AI+movement
     dispatcher -- walks the mobile object arena, drives NPC pathing via
     FUN_00034c10 and other mobile objects via mobile_object_tick) -- but it is
     never written anywhere in this decompile, so the gate is permanently
     false and NPCs/mobile objects never tick. This is a link-time-
     initialised flag whose real setup Ghidra dropped, exactly like
     DAT_0024af60's movement-key command-mode flag above. Initialize it
     here, alongside this function's other one-time gameplay-enable flags. */
  g_npc_tick_enabled = 1;
  /* HACK, same silently-zero class as g_npc_tick_enabled just above:
     DAT_000879ac gates all three per-tick call sites of scheduler_tick
     (the scheduled-effects queue driver -- walks the queue
     scheduler_add_entry pushes to, ticking scheduler_step_entry's gradual per-object
     step until each entry's delay expires, then scheduler_finish_entry finalizes
     it) that fire from ordinary gameplay: move_key_directional_step's
     per-held-key-frame call, its sibling per-frame movement-pacing
     call, and the per-tile-scan idle-animation call. Declared but never
     assigned anywhere in this decompile (confirmed via a full-session
     trace, UW_DEBUG_DOOR2=1: scheduler_tick never ran once, zero hits
     across 470000+ log lines covering chargen, movement, and object
     interaction), so the entire queue -- doors' real gradual open/close
     swing among its users -- silently never advanced past whatever a
     caller pushed onto it. Root-caused chasing a door-open bug report
     ("the door should animate in six to eight small steps over a few
     seconds, it doesn't"): the door's own open trigger (FUN_0007c708)
     already queues a correct, gradual animation via schedule_door_open_animation, and
     that queue entry sat there forever, un-ticked, until an unrelated
     instant-snap fallback elsewhere silently finished the door in one
     step instead. Initialize alongside this function's other one-time
     gameplay-enable flags, matching g_npc_tick_enabled's own established
     fix immediately above. */
  DAT_000879ac = 1;
  reset_player_object_record();
  iVar1 = (*g_player_object & 0x3f) * 0x30;
  DAT_0023be74 = &DAT_001007d0 + iVar1;
  g_player_object[8] = (&g_monster_max_stats_table)[iVar1];
  if (DAT_00201c74 == 0) {
    DAT_00201c74 = register_interned_string(DAT_00086df8,0x7d);
  }
  register_key_binding(0x3f,0xe,1,move_command_dispatch);
  register_key_binding(0x8d,5,1,move_command_dispatch);
  register_key_binding(0x8f,3,1,move_command_dispatch);
  register_key_binding(0x91,4,1,move_command_dispatch);
  register_key_binding(0x3f,0xe,1,move_command_dispatch);
  register_key_binding(0x8d,5,1,move_command_dispatch);
  register_key_binding(0x8f,3,1,move_command_dispatch);
  register_key_binding(0x91,4,1,move_command_dispatch);
  /* Z / C strafe: the original registered these as raw lowercase ascii
     (0x7a 'z', 0x63 'c'), but every other letter movement key here uses
     the uppercase VK code (W=0x57 ...) and handle_keyboard_message
     upper-cases letters in command mode -- so as shipped the lowercase
     entries could never match. Use the uppercase VK codes (VK_Z 0x5a,
     VK_C 0x43) for consistency with W/S/X/A/D. */
  register_key_binding(0x5a,9,1,move_command_dispatch);
  register_key_binding(0x43,10,1,move_command_dispatch);
  /* Sidestep: the DOS "," / "." strafe keys. decode_movement_command
     already turns input codes 0x2c / 0x2e into g_movement_mode 9 / 10
     (resolve_move_vector cases 9/10 = move at heading -/+ 90 degrees, facing
     unchanged), but nothing routed those codes here -- move_command_dispatch
     with arg 9/10 just re-runs decode_movement_command and returns. The
     gx_stub Z/C keyboard poll feeds 0x2c / 0x2e. */
  register_key_binding(0x2c,9,1,move_command_dispatch);
  register_key_binding(0x2e,10,1,move_command_dispatch);
  register_key_binding(0x93,8,1,move_command_dispatch);
  register_key_binding(0x6c,0xc,0x1b,move_command_dispatch);
  register_key_binding(0x6b,0xd,0x1b,move_command_dispatch);
  register_key_binding(0x41,0xffffffff,1,move_key_directional_step);
  register_key_binding(0x44,1,1,move_key_directional_step);
  register_key_binding(0x53,0,1,move_key_directional_step);
  register_key_binding(0x58,0xfffffffe,1,move_key_directional_step);
  register_key_binding(0x57,2,1,move_key_directional_step);
  register_click_region(0x6b,0xa7,0x7b,0x99,0xffff,1,move_key_directional_step);
  register_click_region(0x82,0xa9,0x92,0x9c,0,1,move_key_directional_step);
  register_click_region(0x9b,0xa7,0xaa,0x99,1,1,move_key_directional_step);
  register_key_binding(0x33,1,0x11,&debug_adjust_view_heading);
  register_key_binding(0x31,0xffffffff,0x11,&debug_adjust_view_heading);
  register_key_binding(0x32,0,0x11,&debug_adjust_view_heading);
  register_key_binding(0x6a,7,0x1b,move_command_dispatch);
  register_key_binding(0x4a,6,0x1b,move_command_dispatch);
  register_key_binding(0x86,0,0x1b,toggle_stats_panel);
  register_key_binding(0x89,0,0x1b,&debug_force_rest_action);
  register_key_binding(0x88,2,0x1b,&print_debug_stat_message);
  register_key_binding(0x87,1,0x1b,FUN_00044d14);
  register_key_binding(0x173,0x173,1,FUN_00056ebc);
  register_key_binding(0x172,0x172,1,FUN_00056ebc);
  register_key_binding(0x16d,0x16d,1,FUN_00056ebc);
  register_key_binding(0x166,0x166,1,FUN_00056ebc);
  register_key_binding(0x164,0x164,1,FUN_00056ebc);
  register_key_binding(0x171,0x171,1,FUN_00056ebc);
  register_key_binding(0x80,5,1,cursor_mode_button_click);
  register_key_binding(0x81,4,1,cursor_mode_button_click);
  register_key_binding(0x82,3,1,cursor_mode_button_click);
  register_key_binding(0x83,2,1,cursor_mode_button_click);
  register_key_binding(0x83,2,4,cursor_mode_button_click);
  register_key_binding(0x84,1,1,cursor_mode_button_click);
  register_key_binding(0x85,0,1,cursor_mode_button_click);
  register_key_binding(0x70,9,1,FUN_00027708);
  register_key_binding(0x2e,3,1,FUN_00027708);
  register_key_binding(0x3b,6,1,FUN_00027708);
  register_key_binding(0x4a3,0x4a3,7,FUN_00058734);
  register_key_binding(9,9,7,FUN_00058734);
  register_key_binding(0x8d,0x8d,7,FUN_00058734);
  register_key_binding(0x93,0x93,7,FUN_00058734);
  register_key_binding(0x8f,0x8f,7,FUN_00058734);
  register_key_binding(0x91,0x91,7,FUN_00058734);
  register_key_binding(0x8c,0x8c,7,FUN_00058734);
  register_key_binding(0x8e,0x8e,7,FUN_00058734);
  register_key_binding(0x92,0x92,7,FUN_00058734);
  register_key_binding(0x94,0x94,7,FUN_00058734);
  register_key_binding(0x95,0x95,7,FUN_00058734);
  register_key_binding(0x96,0x96,7,FUN_00058734);
  register_key_binding(0x1b,4,4,&DAT_00028bfc);
  register_key_binding(0x31,1,4,FUN_000295b4);
  register_key_binding(0x32,2,4,FUN_000295b4);
  register_key_binding(0x33,3,4,FUN_000295b4);
  register_key_binding(0x34,4,4,FUN_000295b4);
  register_click_region(0x52,0x30,0x88,10,4,4,handle_barter_npc_panel_click);
  register_click_region(0x8b,0x30,0xc1,10,4,4,handle_barter_player_panel_click);
  register_click_region(0xf,200,0x131,0xa9,0,4,FUN_000295b4);
  register_click_region(8,0x74,0x20,0xfffffffa,0xffff,4,cursor_mode_button_click_restricted);
  register_key_binding(0x286,0,0x1b,print_help_message);
  register_key_binding(0x30,0,0x1b,print_player_position_debug);
  return;
}




// was FUN_00067950 -- formats and prints a "Lev:d X:.. Y:.. Z:.. F:.."
// style message showing the player's current level, tile position,
// and facing. Registered as the '0' key binding in
// init_gameplay_session -- a debug/cheat "show coordinates" command.
void print_player_position_debug()

{
  int iVar1;
  undefined1 auStack_2c [40];
  
  iVar1 = (int)DAT_00201c70;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 0xff;
  }
  Ordinal_719(auStack_2c,s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08,(int)DAT_00201b68,
              (int)DAT_00204880 >> 8,(int)DAT_00204880 >> 5 & 7,((int)DAT_00204882 << 0x10) >> 0x18,
              ((int)DAT_00204882 << 0x10) >> 0x15 & 7,((int)DAT_00204884 << 0x10) >> 0x13,
              iVar1 >> 8 & 0xffff);
  message_scroll_print_wrapped(auStack_2c);
  return;
}



// was FUN_000679f4 -- prints a help/status message (string id 0x113)
// built into the DAT_00086e00 buffer, one-time-initializing a small
// counter pair (DAT_0023bd84 bit 0 guards it) the first time it's
// shown. Registered as a special key binding in init_gameplay_session.
void print_help_message()

{
  if ((DAT_0023bd84 & 1) == 0) {
    DAT_0023bd84 = DAT_0023bd84 | 1;
    DAT_00086e05 = 10;
    DAT_00086e06 = 0;
  }
  print_scroll_message_by_id(0x113);
  message_scroll_print_wrapped(&DAT_00086e00);
  return;
}



// was FUN_00067a44 -- populates the "look at" override fields
// (DAT_0023be90/be92/be94/bf00/bf02) that
// update_current_view_from_subject's DAT_0023b82c==0 branch reads:
// param_1<2 resets to the player's own live position (param_1==1 also
// applies the eye-height offset), param_1 in [2,0xff) instead resolves
// an object by slot index and copies its position/heading. Forces a
// camera resync (FUN_00049924) when no object is currently the view
// subject.
void set_custom_view_target(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  bool bVar3;
  
  bVar3 = param_1 == 1;
  if (param_1 < 2) {
    DAT_0023be90 = DAT_00204880;
    sVar2 = 0x4880;
    if (bVar3) {
      sVar2 = DAT_00204884;
    }
    DAT_0023be92 = DAT_00204882;
    if (bVar3) {
      DAT_0023be94 = sVar2 + 0xa4;
    }
    DAT_0023bf00 = DAT_00201c70;
    if (!bVar3) {
      DAT_0023be94 = 0x458;
      DAT_0023bf02 = 0xfc00;
    }
  }
  else if (param_1 < 0x100) {
    iVar1 = FUN_000535fc();
    DAT_0023be90 = (*(byte *)(iVar1 + 0x17) & 0xfc) * 0x40 + (*(byte *)(iVar1 + 3) & 0xe0);
    DAT_0023be92 = (*(byte *)(iVar1 + 3) & 0x1c) * 8 + (*(ushort *)(iVar1 + 0x16) & 0x3f0) * 0x10;
    DAT_0023be94 = (*(byte *)(iVar1 + 2) & 0x7f) << 3;
    DAT_0023bf00 = (*(ushort *)(iVar1 + 2) & 0xff80) << 6;
  }
  if (DAT_0023b82c == 0) {
    FUN_00049924(2);
  }
  return;
}




// was FUN_00067b98 -- moves the "custom view target" position
// (DAT_0023be90/be92, set up by set_custom_view_target) based on the
// live mouse cursor position relative to the game-view rect
// (DAT_0023bd80/be88 from register_game_view_interact_zones),
// rotating the view facing (DAT_0023bf00) toward the drag direction
// and clamping the position to valid map bounds. The free-camera
// counterpart to normal player movement, driven from
// handle_game_view_click_hold when DAT_002020d8 (free-camera mode) is
// set.
void move_custom_view_target()

{
  short *psVar1;
  short sVar2;
  uint uVar3;
  int iVar4;
  undefined1 local_14;
  char cStack_13;
  undefined1 local_12;
  char cStack_11;
  
  psVar1 = DAT_00085a6c;
  sVar2 = Ordinal_2005((int)DAT_0023be88,DAT_00085a6c[1] * 3);
  uVar3 = Ordinal_2005((int)DAT_0023bd80,*psVar1 * 3);
  iVar4 = (uint)DAT_0023bf00 + ((uVar3 & 0xffff) + 0x3f) * 0x400;
  DAT_0023bf00 = (ushort)iVar4;
  if (sVar2 != 1) {
    angle_to_screen_delta(iVar4,&local_14,&local_12);
    DAT_0023be90 = (short)cStack_13 * (sVar2 + -1) + DAT_0023be90;
    DAT_0023be92 = (short)cStack_11 * (sVar2 + -1) + DAT_0023be92;
  }
  if (DAT_0023be90 < 0x180) {
    DAT_0023be90 = 0x180;
  }
  if (0x3d80 < DAT_0023be90) {
    DAT_0023be90 = 0x3d80;
  }
  if (DAT_0023be92 < 0x180) {
    DAT_0023be92 = 0x180;
  }
  if (0x3d80 < DAT_0023be92) {
    DAT_0023be92 = 0x3d80;
  }
  if (DAT_0023b82c == 0) {
    FUN_00049924(2);
  }
  return;
}



// was FUN_00067d10 -- sets DAT_0023b82c, the object the camera
// currently tracks (read by update_current_view_from_subject and many
// others), by opcode: -1 clears it (free-camera mode), 0 selects
// whatever object is under the cursor (gated on DAT_000db500, a
// spectate-enable flag), 1 resets to the player, 2/3 step to the
// next/previous mobile-object slot (cycling through NPCs). A
// debug/spectator-mode view-subject switcher.
void set_view_subject_by_command(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  
  if (param_1 == -1) {
    DAT_0023b82c = 0;
    return;
  }
  if (param_1 == 0) {
    if (DAT_000db500 == 0) {
      return;
    }
    sVar2 = encode_object_slot_index();
    iVar1 = (int)sVar2;
    if (iVar1 == 0) {
      return;
    }
    if (0xff < iVar1) {
      return;
    }
    if (iVar1 < 2) {
      return;
    }
    DAT_0023b82c = iVar1 * 0x1b + DAT_002046b8;
  }
  else if (param_1 == 1) {
    if (DAT_0023b82c == g_player_object) {
      return;
    }
    DAT_0023b82c = g_player_object;
  }
  else {
    if (param_1 != 2) {
      if (param_1 != 3) {
        return;
      }
      if (DAT_002046b8 - 0x1b <= DAT_0023b82c) {
        DAT_0023b82c = DAT_002046b8 - 0x36;
        FUN_00049924(2);
      }
    }
    if (DAT_0023b82c < DAT_002046b8) {
      return;
    }
    DAT_0023b82c = DAT_002046b8 - 0x1b;
  }
  FUN_00049924(2);
  return;
}



// was FUN_00067e2c -- enters free-camera mode: resets the custom view
// target to the player's own position, then clears the view subject
// (set_view_subject_by_command(-1)) so move_custom_view_target starts
// driving the camera instead of normal player movement.
//
// BUG FIX: set_custom_view_target was called with zero visible
// arguments despite taking one (same dropped-argument bug class
// documented throughout this project) -- 0 is the "reset to player
// position" case per its own switch, matching this function's own
// role, so pass it explicitly rather than relying on leftover
// register state.
void enter_free_camera_mode()

{
  set_custom_view_target(0);
  set_view_subject_by_command(0xffffffff);
  return;
}



// was FUN_00067e40 -- directly sets the custom view target's full
// state (position/facing) from an object record (param_1) with
// explicit x/y overrides (param_2/param_3), resets a couple of
// tracked deltas, forces a camera resync, briefly clears then
// restores an unrelated toggle (DAT_00086b20) around FUN_00041210,
// and refreshes equipment effects. Purpose consistent with restoring
// a saved/teleported viewpoint; exact caller context not traced.
void restore_view_from_object_record(param_1,param_2,param_3)
int param_1;
short param_2;
short param_3;

{
  int iVar1;
  
  DAT_0023be90 = (*(byte *)(param_1 + 3) & 0xe0) + param_2 * 0x100;
  DAT_0023be92 = (*(byte *)(param_1 + 3) & 0x1c) * 8 + param_3 * 0x100;
  DAT_0023be94 = (*(byte *)(param_1 + 2) & 0x7f) << 3;
  DAT_0023bf00 = (*(ushort *)(param_1 + 2) & 0xff80) << 6;
  DAT_0023bf02 = 0;
  DAT_0023bf04 = 0;
  load_shading_level_config(6);
  iVar1 = DAT_00086b20;
  if (DAT_00086b20 != 0) {
    DAT_00086b20 = 0;
  }
  FUN_00041210();
  if (iVar1 != 0) {
    DAT_00086b20 = 1;
  }
  refresh_player_equipment_effects();
  return;
}



// was spin_view_full_rotation -- spins the view through a full rotation over 64
// substeps (DAT_0023bea4, a rotation-like value, accumulates by a
// fixed 0xccb step each call), redrawing via render_dungeon_frame_timed
// every substep. Its only current call site (FUN_00067dc4-area, ~line
// 60497) is a rare one-shot scripted event, not ordinary player
// turning -- which also makes render_dungeon_frame_timed (and, in
// turn, weapon_swing_draw_tick, the only thing that actually draws the
// weapon-swing overlay) unreachable from normal per-tick gameplay:
// walking/turning redraws via dungeon_view_anim_tick -> full_dungeon_redraw,
// which never calls either. Called with an unused `0xffffffff`
// argument this K&R declaration doesn't accept -- harmless (K&R
// ignores extra args) but not yet understood; flagging rather than
// guessing.
void spin_view_full_rotation()

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  short sVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  
  DAT_0023beb0 = 0x20;
  DAT_0023beac = 0x20;
  set_view_subject_by_command(3);
  iVar6 = (uint)DAT_0023beac * 0x100 - (int)DAT_00204880;
  iVar7 = (uint)DAT_0023beb0 * 0x100 - (int)DAT_00204882;
  uVar5 = integer_sqrt(iVar7 * iVar7 + iVar6 * iVar6);
  uVar5 = (uVar5 & 0xffff) >> 6;
  DAT_0023bea0 = (undefined2)uVar5;
  iVar1 = uVar5 << 6;
  sVar3 = Ordinal_2005(iVar1,iVar6 * 0x8000);
  sVar4 = Ordinal_2005(iVar1,iVar7 * 0x8000);
  DAT_0023bea4 = FUN_00049fb4((int)sVar4,(int)sVar3);
  DAT_0023bf08 = 0;
  do {
    render_dungeon_frame_timed();
    DAT_0023bea4 = DAT_0023bea4 + 0xccb;
    sVar3 = DAT_0023bf08 + 1;
    uVar2 = DAT_0023bf08 + 1;
    DAT_0023bf08 = sVar3;
  } while (uVar2 < 0x40);
  set_view_subject_by_command(1);
  return;
}



// was FUN_00068260 -- the "3D-viewport's own click-and-hold-to-walk
// region" handler (per input.c's own comment), called from
// FUN_0003f420 while a button is held: drives ordinary player
// movement (move_command_dispatch) normally, or
// move_custom_view_target when free-camera mode (DAT_002020d8) is
// active.
void handle_game_view_click_hold()

{
  if (DAT_002020d8 == 0) {
    move_command_dispatch(0xffffffff);
    if (DAT_0023bf0c == '\0') {
      set_cursor_confine_rect((int)DAT_0023be5c,(int)DAT_0023be80,(int)DAT_0023bd80 + (int)DAT_0023be5c + -1,
                   ((int)DAT_0023be80 - (int)DAT_0023be88) + 1);
    }
    DAT_0023bf0c = '\x02';
  }
  else {
    move_custom_view_target(0);
  }
  return;
}




// was FUN_0006a0c8 -- postprocess callback for the main menu's "opbtn"
// (OPBTN.GR) resource load -- populates DAT_0023bf6c's per-button
// record table (bitmap pointer via g_menu_button_bitmaps, plus
// width/height) as each button-state bitmap finishes loading.
bool populate_menu_button_bitmap_entry(param_1,param_2,param_3)
char *param_1;
int param_2;
short param_3;

{
  uint uVar1;
  int iVar3;
  int bmp_idx;

  uVar1 = (int)param_3 & 1;
  iVar3 = (int)param_3 >> 1;
  bmp_idx = uVar1 + iVar3 * 4;
  if ((uint)bmp_idx < sizeof(g_menu_button_bitmaps) / sizeof(g_menu_button_bitmaps[0])) {
    g_menu_button_bitmaps[bmp_idx] = param_1 + 5;
  }
  if ((short)uVar1 == 0) {
    char *rec = DAT_0023bf6c + iVar3 * 0x10;
    rec[0xc] = param_1[1];
    rec[0xd] = 0;
    rec[0xe] = param_1[2];
    rec[0xf] = 0;
  }
  return param_2 != 0;
}







// was FUN_0006a168 -- throttled (14ms via DAT_0023bf74 vs
// read_realtime_clock_units) palette-cycle animation for the main menu's
// title/copyright gold gradient.
void animate_title_palette_cycle()

{
  uint uVar1;
  
  uVar1 = read_realtime_clock_units();
  if (0xd < (int)((uVar1 & 0xffff) - (uint)DAT_0023bf74)) {
    palette_cycle_range(0x40,0x40,1);
    reinstall_active_palette(0x40,0x40,0);
    /* Palette-cycle animation on the menu's "Ultima Underworld" title (and
       the copyright line): palette_cycle_range rotates PALS entries
       0x40..0x7f -- the gold gradient ramp -- and reinstall_active_palette
       rebuilds g_palette_rgb565. On the original 8bpp target the hardware
       palette swap animated the screen for free; this port draws straight
       to RGB565, so the already-composited pixels have to be recoloured
       here. Re-blit exactly the pixels whose OPSCR source index is in the
       cycled range (0x40..0x7f) -- that hits the title/copyright and never
       the menu buttons (drawn on top, over non-gold stone). */
    if (DAT_0023bf70 != (char *)0x0) {
      unsigned char *_src = (unsigned char *)DAT_0023bf70;
      unsigned short *_dst = (unsigned short *)g_uw_framebuffer;
      unsigned short *_lut = &g_palette_rgb565;
      int _i;
      for (_i = 0; _i < 0x140 * 200; _i++) {
        unsigned char _ix = _src[_i];
        if ((_ix & 0xc0) == 0x40) _dst[_i] = _lut[_ix];
      }
      dirty_rect_union(0,200,0,0x140); /* recoloured pixels span the screen -- make sure the flush below carries them */
    }
    DAT_0023bf74 = read_realtime_clock_units();
  }
  flush_dirty_rect_to_display(1);
  return;
}



// was FUN_0006a1c4 -- if param_1 is set, probes the save-slot archives via
// probe_save_slots and, when no valid save slot exists, calls
// FUN_00037c14(0) to disable/grey out the "Journey Onward" main-menu
// option.
void update_journey_onward_availability(param_1)
short param_1;

{
  short local_ac [4];
  undefined1 auStack_a4 [160];

  if ((param_1 != 0) && (probe_save_slots(auStack_a4,local_ac), local_ac[0] == 0)) {
    FUN_00037c14(0);
  }
  return;
}






// was FUN_0006a200. Draws one frame of a menu_button_list_navigate
// list: param_3==0 blits pre-rendered bitmap buttons (the title screen's
// Introduction/Create Character/.../Journey Onward), param_3!=0 draws
// plain text items (e.g. journey_onward_load_slot_menu's save-slot
// descriptions), highlighting whichever index equals param_4.
void draw_menu_item_list(param_1,param_2,param_3,param_4)
short param_1;
char *param_2;
char param_3;
short param_4;

{
  short sVar1;
  int iVar2;
  /* pcVar_rec: dedicated pointer for the param_3=='\0' branch's 0x10-stride
     rect-record array (param_2 was `int`, truncating the pointer). */
  char *pcVar_rec;
  undefined1 uVar3;
  int iVar4;
  /* ppcVar5/pcVar_str: the param_3!=0 branch indexes param_2 as an array
     of char* string pointers. Ghidra saw this as `int *piVar5` with a
     4-byte stride (`param_2 + iVar4 * 4`) and reused the dereferenced
     value (`iVar2`/`iVar6`, both plain `int`) to hold the string pointer
     itself -- correct on the original 32-bit binary where a pointer IS
     4 bytes, but truncating here on 64-bit. Widened to a real char**
     with 8-byte stride (see local_1d0 in journey_onward_load_slot_menu, the only
     populator of this array) and a dedicated pointer variable for the
     string-pointer role; iVar2 keeps its separate int (strlen/measurement)
     role below. */
  char **ppcVar5;
  char *pcVar_str;

  if (param_3 == '\0') {
    FUN_00057118();
    if (0 < param_1) {
      iVar4 = 0;
      do {
        pcVar_rec = param_2 + iVar4 * 0x10;
        /* Was reading the bitmap pointer back out of param_2's packed
           4-byte record slot -- see g_menu_button_bitmaps' declaration
           comment for why that's now routed through a dedicated array
           instead (the packed slot only ever held a truncated 32-bit
           pointer fragment on this host, not a real one). */
        int bmp_idx = (uint)(iVar4 == param_4) + iVar4 * 4;
        bitmap_blit_to_framebuffer((int)*(short *)(pcVar_rec + 8),(int)*(short *)(pcVar_rec + 10),
                     (uint)bmp_idx < sizeof(g_menu_button_bitmaps) / sizeof(g_menu_button_bitmaps[0])
                       ? g_menu_button_bitmaps[bmp_idx] : 0,
                     (int)*(short *)(pcVar_rec + 0xe),*(undefined2 *)(pcVar_rec + 0xc),0,0,1);
        iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      } while (iVar4 < param_1);
    }
  }
  else {
    FUN_00057118();
    iVar4 = 0;
    /* draw_text_string only honours *g_draw_color_index (the palette index this
       loop sets to 0xa2/0xaa to highlight the selected item) when
       g_text_use_palette_color is nonzero; otherwise it falls back to the flat
       g_text_flat_color color, which nothing in the whole decompile ever
       writes (silently 0/black) -- fine as a default ink color for
       message-scroll text on its light parchment background, but
       invisible against this screen's dark title-art backdrop. Force
       the palette-indexed path for the duration of this draw, matching
       what setting *g_draw_color_index here clearly intends. */
    int _saved_af74 = g_text_use_palette_color;
    g_text_use_palette_color = 1;
    if (0 < param_1) {
      do {
        uVar3 = 0xa2;
        if (iVar4 != param_4) {
          uVar3 = 0xaa;
        }
        *g_draw_color_index = uVar3;
        *DAT_00084298 = uVar3;
        ppcVar5 = (char **)(param_2 + iVar4 * 8);
        pcVar_str = *ppcVar5;
        if (getenv("UW_DEBUG_TITLEMENU"))
          fprintf(stderr, "[titlemenu] draw_menu_item_list text branch: item=%d/%d ptr=%p str='%s'\n",
                  iVar4, (int)param_1, (void *)pcVar_str, pcVar_str ? pcVar_str : "(null)");
        while (sVar1 = measure_text_width(pcVar_str), 0x13e < sVar1) {
          pcVar_str = *ppcVar5;
          iVar2 = Ordinal_1068(pcVar_str);
          pcVar_str[iVar2 - 1] = 0;
          pcVar_str = *ppcVar5;
        }
        iVar2 = (int)sVar1;
        if (iVar2 < 0) {
          iVar2 = iVar2 + 1;
        }
        draw_text_string(*ppcVar5,0xa0 - (short)(iVar2 >> 1),iVar4 * 0x16 + 100);
        iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      } while (iVar4 < param_1);
    }
    g_text_use_palette_color = _saved_af74;
  }
  cursor_show_idle_tick();
  return;
}






// was poll_menu_pointer_selection -- pointer/touch-driven hit-test loop for a menu
// item list (param_3=='\0': bitmap buttons; param_3!=0: text items,
// e.g. the save-slot list): while pointer events remain queued, polls
// the current pointer position (FUN_00057504) and tests it against
// each item's hit rect (bitmap mode: the packed 0x10-stride rect
// record; text mode: the item's measured text extent), redrawing via
// draw_menu_item_list whenever the hovered item changes. Also drives
// the title palette cycle animation each iteration so the gold
// gradient keeps shimmering while the pointer is held down. Returns
// the last-hit item's index while the pointer is still over an item;
// once it moves off after having hit one, returns that index offset
// by param_1 instead (its caller, menu_button_list_navigate, decodes
// this by comparing against/subtracting param_1).
int poll_menu_pointer_selection(param_1,param_2,param_3)
undefined4 param_1;
char *param_2;
char param_3;

{
  int iVar1;
  bool bVar2;
  bool bVar3;
  short sVar4;
  short sVar5;
  /* iVar6 doubles as a byte-offset pointer into param_2 (0x10-stride
     rect records, param_3=='\0' branch) and a plain int scratch value
     (distance/threshold math, param_3!=0 branch) -- mutually exclusive,
     but iVar6 stayed `int` either way, truncating the pointer now that
     param_2 is a real 64-bit pointer. Given its own dedicated variable
     for the record-pointer role only. */
  char *pcVar_rec;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  short local_30;
  short local_2e;

  iVar9 = -1;
  bVar3 = true;
  bVar2 = true;
  sVar5 = (short)param_1;
  if (param_3 == '\0') {
    sVar4 = next_input_event();
    if (0 < sVar4) {
      iVar1 = (int)sVar5;
      bVar2 = bVar3;
      do {
        animate_title_palette_cycle();
        FUN_00057504(&local_30,&local_2e);
        iVar8 = 0;
        if (0 < iVar1) {
          do {
            pcVar_rec = param_2 + iVar8 * 0x10;
            if (((int)*(short *)(pcVar_rec + 8) <= (int)local_30) &&
               ((int)local_30 <= (int)*(short *)(pcVar_rec + 8) + (int)*(short *)(pcVar_rec + 0xc) + -1)) {
              if (((int)local_2e <= (int)*(short *)(pcVar_rec + 10) + (int)*(short *)(pcVar_rec + 0xe) + -1)
                 && ((int)*(short *)(pcVar_rec + 10) <= (int)local_2e)) {
                bVar2 = true;
                if ((short)iVar8 != (short)iVar9) {
                  draw_menu_item_list(param_1,param_2,0,iVar8);
                  iVar9 = iVar8;
                }
                break;
              }
            }
            iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
          } while (iVar8 < iVar1);
        }
        if (((short)iVar8 == iVar1) && (bVar2 = true, (short)iVar9 != -1)) {
          bVar2 = false;
        }
        sVar4 = next_input_event();
      } while (0 < sVar4);
    }
  }
  else {
    select_active_font(s_fontbig_sys_0008432c);
    sVar4 = next_input_event();
    bVar2 = bVar3;
    if (0 < sVar4) {
      iVar1 = (int)sVar5;
      do {
        animate_title_palette_cycle();
        FUN_00057504(&local_30,&local_2e);
        iVar8 = 0;
        if (0 < iVar1) {
          iVar8 = 0;
          do {
            sVar4 = measure_text_width(*(char **)(param_2 + iVar8 * 8));
            iVar6 = -(int)sVar4;
            iVar7 = iVar6 + 0x140;
            if (iVar7 < 0) {
              iVar7 = iVar6 + 0x141;
            }
            iVar6 = (int)(short)(iVar7 >> 1);
            if ((iVar6 <= local_30) && ((int)local_30 < iVar6 + sVar4)) {
              iVar6 = (iVar8 * 0x16 + 100) * 0x10000 >> 0x10;
              if ((iVar6 <= local_2e) && ((int)local_2e < iVar6 + *(short *)(DAT_000879b0 + 6))) {
                bVar2 = true;
                if ((short)iVar8 != (short)iVar9) {
                  draw_menu_item_list(param_1,param_2,param_3,iVar8);
                  iVar9 = iVar8;
                }
                break;
              }
            }
            iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
          } while (iVar8 < iVar1);
        }
        if (((short)iVar8 == iVar1) && (bVar2 = true, (short)iVar9 != -1)) {
          bVar2 = false;
        }
        sVar4 = next_input_event();
      } while (0 < sVar4);
    }
    select_active_font(s_FONT5X6P_SYS_00084e9c);
  }
  if (bVar2) {
    sVar5 = 0;
  }
  return iVar9 + sVar5;
}



// was FUN_0006af3c
int menu_button_list_navigate(param_1,param_2,param_3,param_4)
int param_1;
char *param_2;
undefined1 param_3;
int param_4;

{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  bool bVar6;
  
  iVar4 = -2;
  do {
    select_active_font(s_fontbig_sys_0008432c);
    draw_menu_item_list(param_1,param_2,param_3,param_4);
    select_active_font(s_font5x6p_sys_0008430c);
    /* Was: `ushort _cyc_t = DAT_0023bf74; ... if (DAT_0023bf74 != _cyc_t)
       draw_menu_item_list(...)` -- an earlier session's own addition
       (its comment claimed it was needed for the menu-item bitmaps to
       shimmer in step with animate_title_palette_cycle's gold-gradient palette
       rotation), not real recovered code: confirmed via a fresh ARM
       disassembly of this function (0x6af3c) that the real idle-wait
       loop here is exactly `bl advance_menu_music_track; bl animate_title_palette_cycle;`, nothing
       else -- no DAT_0023bf74 comparison, no second draw_menu_item_list
       call. That fabricated redraw ran with the small font selected
       (the line right above switches to it before this loop, which IS
       real/matches disassembly) while the ORIGINAL list draw two lines
       up used the big font and is never erased first -- so every
       palette-cycle tick redrew each list label a second time, in the
       wrong small font, directly on top of the correct big-font text.
       Confirmed live: the title-screen save-slot list showed each
       description doubled, once correctly in the large font and once
       overlaid in the small one. Removed. */
    while (sVar2 = next_input_event(), sVar2 < 0) {
      advance_menu_music_track();
      animate_title_palette_cycle();
    }
    if (getenv("UW_DEBUG_TITLEMENU")) fprintf(stderr, "[titlemenu] menu_button_list_navigate: raw event=0x%x param_4=%d\n", (int)sVar2, (int)param_4);
    sVar1 = (short)param_1;
    iVar3 = param_4;
    iVar5 = iVar4;
    if (0xa7 < sVar2) {
      if (sVar2 < 0x167) {
        if (sVar2 != 0x166) {
          if (sVar2 == 0xa8) {
LAB_0006b0e4:
            iVar3 = param_4 + -1;
            iVar5 = iVar4;
            goto LAB_0006b144;
          }
          if (sVar2 != 0xa9) {
            if (sVar2 != 0xaa) {
              if (sVar2 == 0xab) goto LAB_0006b140;
              if (sVar2 != 0xac) {
                bVar6 = sVar2 == 0x162;
                goto LAB_0006b0e0;
              }
            }
            goto LAB_0006b138;
          }
        }
      }
      else if (sVar2 != 0x16e) {
        if (sVar2 == 0x170) goto LAB_0006b0e4;
        if (sVar2 != 0x23c) {
          if (sVar2 != 0x23e) {
            if (sVar2 == 0x278) {
LAB_0006b130:
              iVar5 = -1;
            }
            goto LAB_0006b144;
          }
          goto LAB_0006b138;
        }
        goto LAB_0006b000;
      }
      goto LAB_0006b140;
    }
    if (sVar2 == 0xa7) {
LAB_0006b000:
      iVar3 = 0;
      iVar5 = iVar4;
    }
    else if (sVar2 < 0x90) {
      if (sVar2 == 0x8f) goto LAB_0006b0e4;
      if (0 < sVar2) {
        if (sVar2 < 4) {
          iVar3 = poll_menu_pointer_selection(param_1,param_2,param_3);
          sVar2 = (short)iVar3;
          if ((((sVar2 < 0) || (sVar1 <= sVar2)) || (iVar5 = iVar3, sVar2 == (short)iVar4)) &&
             (iVar3 = param_4, iVar5 = iVar4, sVar1 <= sVar2)) {
            iVar3 = (int)sVar2 - (int)sVar1;
          }
        }
        else {
          iVar5 = param_4;
          if (sVar2 != 0xd) {
            if (sVar2 == 0x1b) goto LAB_0006b130;
            if (sVar2 != 0x8c) {
              if (sVar2 == 0x8d) goto LAB_0006b0e4;
              iVar5 = iVar4;
              if (sVar2 != 0x8e) goto LAB_0006b144;
            }
            goto LAB_0006b000;
          }
        }
      }
    }
    else if (sVar2 == 0x91) {
LAB_0006b140:
      iVar3 = param_4 + 1;
    }
    else {
      if (sVar2 != 0x92) {
        if (sVar2 == 0x93) goto LAB_0006b140;
        if (sVar2 != 0x94) {
          if (sVar2 != 0xa5) {
            bVar6 = sVar2 == 0xa6;
LAB_0006b0e0:
            if (!bVar6) goto LAB_0006b144;
            goto LAB_0006b0e4;
          }
          goto LAB_0006b000;
        }
      }
LAB_0006b138:
      iVar3 = param_1 + -1;
    }
LAB_0006b144:
    if ((short)iVar3 < 0) {
      iVar3 = 0;
    }
    else if (sVar1 <= (short)iVar3) {
      iVar3 = param_1 + -1;
    }
    param_4 = iVar3;
    iVar4 = iVar5;
    if (-2 < (short)iVar5) {
      return iVar5;
    }
  } while( true );
}





// was FUN_000773ac -- called from app_main_loop (src/game.c, WinMain's
// real body) right before create_main_window_and_init_display below.
// Builds a WinCE thread-creation parameter block (local_34=3, a
// creation-flags constant; local_30=dispatch_window_message, the thread's start
// routine -- a window-message-id dispatch table lookup, not yet
// named; local_24=param_1, the app instance handle, as the thread
// arg; local_18=Ordinal_919(0), likely the calling thread's id;
// local_10=param_2) and passes it to Ordinal_95 (likely CreateThread).
// This WinCE-era windowing/threading plumbing is very likely inert on
// this SDL-based host port, but kept faithful to the original flow.
void spawn_message_dispatch_thread(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  undefined4 local_34;
  code *local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  
  local_34 = 3;
  local_2c = 0;
  local_30 = dispatch_window_message;
  local_28 = 0;
  local_20 = 0;
  local_1c = 0;
  local_24 = param_1;
  local_18 = Ordinal_919(0);
  local_14 = 0;
  local_10 = param_2;
  Ordinal_95(&local_34);
  return;
}



// was FUN_00077408 -- creates the main app window (Ordinal_246, a
// CreateWindowEx-style call) and, if that and the registration check
// (is_product_registered) both succeed, reads 3 install-directory
// registry values (falling back to hardcoded "Program Files\ZIO
// Interactive\..." paths if the registry read fails), shows/updates
// the window, then opens the WinCE GAPI display (GXOpenDisplay) and,
// on an HP Jornada 540, copies the GX display properties and default
// key mappings into global buffers for later use. Returns 1 on full
// success (window + registration + GX display all opened), 0
// otherwise. Called from app_main_loop (src/game.c, WinMain's real
// body) right after spawn_message_dispatch_thread above.
undefined4 create_main_window_and_init_display(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  bool bVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  undefined1 *puVar5;
  undefined *puVar6;
  int iVar7;
  undefined1 *puVar8;
  char *pcVar9;
  char *pcVar10;
  undefined4 local_7d8;
  undefined4 local_7d4;
  undefined4 local_7d0;
  undefined4 local_7c8;
  undefined4 local_7c4;
  undefined4 local_7c0;
  undefined4 local_7bc;
  undefined4 local_7b8 [2];
  undefined1 auStack_7b0 [24];
  undefined1 auStack_798 [96];
  undefined1 auStack_738 [256];
  undefined1 auStack_638 [520];
  undefined1 auStack_430 [520];
  undefined1 auStack_228 [520];
  
  Ordinal_885(1);
  Ordinal_885(0);
  DAT_0023c548 = (HWND__ *)
                 Ordinal_246(0,u_UltimaUW_00087678,u_Ultima_Under_World_00087690,0x10000000);
  if ((DAT_0023c548 != (HWND__ *)0x0) && (iVar3 = is_product_registered(DAT_0023c548,param_1), iVar3 != 0)) {
    pcVar9 = &DAT_0023cca8;
    Ordinal_1047(&DAT_0023cca8,0,0x104);
    pcVar10 = &DAT_0023c698;
    Ordinal_1047(&DAT_0023c698,0,0x104);
    local_7c4 = 1;
    local_7c0 = 0x208;
    Ordinal_1047(auStack_638,0,0x208);
    iVar3 = Ordinal_461(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_0008784c,0,0);
    if (iVar3 == 0) {
      Ordinal_463(local_7d4,u_InstlDir_00087838,0,&local_7c4);
      pcVar4 = (char *)FUN_00022998(auStack_638);
      do {
        cVar2 = *pcVar4;
        pcVar4 = pcVar4 + 1;
        *pcVar9 = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
      Ordinal_455(local_7d4);
    }
    else {
      pcVar9 = s__Program_Files_ZIO_Interactive_U_00087804;
      do {
        cVar2 = *pcVar9;
        pcVar9[0x1b54a4] = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
    }
    local_7c8 = 1;
    local_7bc = 0x208;
    Ordinal_1047(auStack_430,0,0x208);
    iVar3 = Ordinal_461(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_000877a4,0,0);
    if (iVar3 == 0) {
      Ordinal_463(local_7d8,u_InstlDir_00087838,0,&local_7c8);
      pcVar9 = (char *)FUN_00022998(auStack_430);
      do {
        cVar2 = *pcVar9;
        pcVar9 = pcVar9 + 1;
        *pcVar10 = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
      Ordinal_455(local_7d8);
    }
    else {
      pcVar10 = s__Program_Files_ZIO_Interactive_U_00087774;
      do {
        cVar2 = *pcVar10;
        pcVar10[0x1b4f24] = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
    }
    local_7b8[0] = 1;
    Ordinal_1047(auStack_228,0,0x208);
    iVar3 = Ordinal_461(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_0008771c,0,0);
    if (iVar3 == 0) {
      Ordinal_463(local_7d0,u_InstlDir_00087838,0,local_7b8);
      pcVar10 = (char *)FUN_00022998(auStack_228);
      pcVar9 = &DAT_00241f08;
      do {
        cVar2 = *pcVar10;
        pcVar10 = pcVar10 + 1;
        *pcVar9 = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
      Ordinal_455(local_7d0);
    }
    else {
      pcVar10 = s__Program_Files_ZIO_Interactive_U_000876ec;
      do {
        cVar2 = *pcVar10;
        pcVar10[0x1ba81c] = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
    }
    Ordinal_266(DAT_0023c548,param_2);
    Ordinal_267(DAT_0023c548);
    iVar3 = GXOpenDisplay(DAT_0023c548,1);
    if (iVar3 != 0) {
      Ordinal_89(0x102,0x100,auStack_738,0);
      iVar3 = Ordinal_230(auStack_738,u_HP_Jornada_540_000876cc);
      if (iVar3 != 0) {
        GXOpenInput();
        puVar5 = (undefined1 *)GXGetDisplayProperties();
        iVar3 = 0x18;
        puVar8 = auStack_7b0;
        do {
          iVar7 = iVar3 + -1;
          *puVar8 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar5 = &DAT_0023cdb0;
        iVar3 = 0x18;
        puVar8 = auStack_7b0;
        do {
          iVar7 = iVar3 + -1;
          *puVar5 = *puVar8;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar5 = (undefined1 *)GXGetDefaultKeys(auStack_798);
        iVar3 = 0x60;
        puVar8 = auStack_798;
        do {
          iVar7 = iVar3 + -1;
          *puVar8 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar6 = &DAT_0023ce10;
        iVar3 = 0x60;
        puVar5 = auStack_798;
        do {
          iVar7 = iVar3 + -1;
          *puVar6 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar6 = puVar6 + 1;
          iVar3 = iVar7;
          puVar5 = puVar5 + 1;
        } while (iVar7 != 0 && bVar1);
      }
      return 1;
    }
  }
  return 0;
}





// was FUN_00077860 -- trivial passthrough, returns param_2 unchanged.
// Confirmed real use: app_main_loop (src/game.c) calls it at the very
// end of the message pump as a return-value wrapper around its own
// exit code, so despite the WndProc-shaped signature this specific
// call site isn't dispatching a real window message -- it's just
// reusing this identity function to pass the exit code through.
undefined4 window_message_noop_handler(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  return param_2;
}



// was FUN_00077868 -- stores &DAT_00242010 into the window's extra-
// data slot 0x94 via FUN_0003af28 (a SetWindowLong-style helper --
// see its other use in create_main_window_and_init_display storing
// g_uw_framebuffer at slot 0xca). WinCE window-procedure plumbing,
// very likely inert on this SDL-based host port.
void store_window_extra_data_ptr(param_1)
undefined4 param_1;

{
  FUN_0003af28(param_1,0x94,&DAT_00242010);
  return;
}



// was FUN_00077878 -- looks up window message id param_2 in a
// {msg_id, handler_ptr} table (DAT_000830b0/UNK_000830b4, 0x13
// entries, 8-byte stride) and calls the matched handler with no
// forwarded args, or falls back to Ordinal_264 (likely DefWindowProc)
// if no entry matches. This is the thread start routine
// spawn_message_dispatch_thread sets up -- WinCE window-procedure
// plumbing, very likely inert on this SDL-based host port.
void dispatch_window_message(param_1,param_2)
undefined4 param_1;
int param_2;

{
  uint uVar1;
  int *piVar2;
  
  piVar2 = (int *)&DAT_000830b0;
  uVar1 = 0;
  do {
    if (param_2 == *piVar2) {
      (**(code **)(&UNK_000830b4 + uVar1 * 8))();
      return;
    }
    uVar1 = uVar1 + 1;
    piVar2 = piVar2 + 2;
  } while (uVar1 < 0x13);
  Ordinal_264();
  return;
}





// was FUN_00077a38 -- shutdown/cleanup routine: calls FUN_000232b0
// (not yet named), frees several conditionally-allocated resources
// (Ordinal_1018, likely LocalFree/free) and a 0x80-entry pointer
// array (&DAT_00202308), then tears down the GAPI display/input
// (GXCloseDisplay/GXCloseInput) and calls Ordinal_866(0) (likely
// PostQuitMessage/ExitThread). No callers found by grep -- probably
// reached only through dispatch_window_message's message-id table
// (e.g. a WM_DESTROY-style handler), which is itself unpopulated at
// runtime (see its own comment), so this is very likely dead on this
// SDL-based host port.
undefined4 shutdown_game_resources()

{
  int iVar1;
  void **piVar2;

  FUN_000232b0();
  if (DAT_0023c44c != 0) {
    Ordinal_1018();
  }
  if (DAT_0023cca0 != 0) {
    Ordinal_1018();
  }
  if (DAT_000890a4 != 0) {
    Ordinal_1018();
  }
  if (DAT_000879b0 != 0) {
    Ordinal_1018();
  }
  if (DAT_0024af78 != 0) {
    Ordinal_1018();
  }
  if (DAT_0024af7c != 0) {
    Ordinal_1018();
  }
  piVar2 = &DAT_00202308;
  iVar1 = 0x80;
  do {
    if (*piVar2 != 0) {
      Ordinal_1018();
    }
    iVar1 = iVar1 + -1;
    piVar2 = piVar2 + 1;
  } while (iVar1 != 0);
  Ordinal_1018(&DAT_00202308);
  FUN_0003baf4(0);
  GXCloseDisplay();
  GXCloseInput();
  Ordinal_866(0);
  return 0;
}


/* was FUN_0007ea30 -- real body confirmed stripped from the shipped
   ARM code (disassembly is just `cpy pc,lr` -- an immediate return,
   ignoring whatever argument its single call site passes). Likely
   InitDebug()-equivalent from the same
   LG/SS1-heritage debug-print system debug_print belongs to; genuinely
   does nothing in this binary, so left as a no-op. */
void debug_print_init()

{
  return;
}



/* was FUN_0007ea34 -- real body confirmed stripped from the shipped
   ARM code (disassembly:
   the standard vararg prologue -- stmdb saving r0-r3 and r12/lr to the
   stack -- immediately followed by ldmia popping straight back out and
   returning, i.e. the compiler kept the calling convention but the actual
   printf-style body was compiled out, e.g. via #ifdef DEBUG). This is the
   same SS1-engine-style debug-print gateway the remaining format strings
   elsewhere in this file belong to (e.g. "checking_if_%d_and_%d_are_com-
   bin", "objsbecombinable_returns_%d", "At_%d_%d") -- there's no level
   parameter to recover since none of its ~8 call sites pass one and the
   real body never used one, so there's nothing to restore verbatim.
   Implemented here as a real vararg printer instead. Currently defaults
   to ON (UW_DEBUG_PRINT=0 to silence) while this is under active
   development, unlike the original release build which had it fully
   compiled out. */
void debug_print(char *param_1, ...)

{
  const char *diag = getenv("UW_DEBUG_PRINT");
  if ((param_1 != (char *)0x0) && (diag == (char *)0x0 || diag[0] != '0')) {
    va_list ap;
    fprintf(stderr, "[dbg] ");
    va_start(ap, param_1);
    vfprintf(stderr, param_1, ap);
    va_end(ap);
    fprintf(stderr, "\n");
  }
  return;
}





/* was FUN_0007036c. Bound to key 0x88 in mode 0x1b, arg 2 (uw.c
   ~59574, register_key_binding). DAT_00070398 and DAT_00070354 were two
   separate literal-pool constants that Ghidra headless confirms BOTH
   resolve to the exact same address (DAT_0023be64) -- so this guard is
   unconditionally true; kept as an explicit always-true branch (rather
   than silently deleting the check or writing a self-comparison that
   would trip -Wtautological-compare) since why the original had two
   loads of the same global here isn't recovered. `*DAT_0007039c` was
   another literal-pool constant (address of DAT_00086df8, the already-
   named player-stats struct pointer) -- resolved directly to that named
   global rather than left as a fresh DAT_. Prints a resolved string
   (the same "dropped register-forwarding arg" idiom already fixed ~30
   other places in this file: the bare message_scroll_print_wrapped()
   call forwards get_message_string's just-returned r0) plus a newline, except
   uVar2==0xc which instead prints a numeric stat byte from the player
   struct via cast_detect_life_spell. */
undefined4 print_debug_stat_message(param_1)
short param_1;
{
  undefined4 uVar1;
  uint uVar2;

  if (1) {
    uVar2 = ((uint)param_1 + 10) & 0xff;
    if ((uVar2 != 10) && (uVar2 != 0xb)) {
      if (uVar2 == 0xc) {
        cast_detect_life_spell(8,*(undefined1 *)(DAT_00086df8 + (int)param_1 + 0x2b));
      }
      else {
        message_scroll_print_wrapped(get_message_string((((int)(short)uVar2 + 0x1f) | 0x400)));
        message_scroll_print_wrapped(&s_scroll_newline_0008522c);
      }
    }
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


/* was FUN_00071ac4. Bound to key 0x89 in mode 0x1b (uw.c ~59573).
   FUN_000452dc returns `ushort *`; its return was captured into a plain
   `int` in the original decompile, the same pointer-truncation bug
   class fixed ~30 other places in this file. */
void debug_force_rest_action()
{
  ushort *puVar1;
  undefined1 auStack_10 [4];

  puVar1 = FUN_000452dc(4,2,1,4,(undefined2 *)auStack_10);
  handle_rest_action(puVar1 != (ushort *)0x0);
  return;
}


/* was FUN_000680d0. Bound to keys '1'/'2'/'3' (0x31/0x32/0x33) in mode
   0x11 with args -1/0/1 respectively (uw.c ~59567-59569,
   register_key_binding). Nudges a heading field by a fixed step,
   clamped to +-0x1000 (1/256-degree units), marking the view dirty
   (FUN_00049924(2)) whenever it actually changed. DAT_000680f4/DAT_000680f8
   were literal-pool constants resolving to DAT_0023beb4 and
   DAT_0023bf00 respectively; the original's `DAT_000680f8 + 2` was raw
   pointer arithmetic across two separately-declared globals that are
   really adjacent fields of one struct (DAT_0023bf00/DAT_0023bf02,
   already an established pair via their shared use at uw.c ~60832) --
   replaced with a direct reference to DAT_0023bf02 instead of address-
   of-plus-2 arithmetic on an unrelated global. DAT_0023bf2c (from
   DAT_000680fc) is a freshly-declared flag selecting which of the two
   fields this nudges; no other reader/writer of it exists yet in this
   file. */
short DAT_0023bf2c;
void debug_adjust_view_heading(param_1)
undefined4 param_1;
{
  short sVar1;
  short *puVar2;

  puVar2 = &DAT_0023beb4;
  if (DAT_0023bf2c != 0) {
    puVar2 = (short *)&DAT_0023bf02;
  }
  if ((short)param_1 == 0) {
    FUN_00049924(2);
    *puVar2 = 0;
  }
  else {
    sVar1 = 0x1000;
    if ((short)param_1 == -1) {
      sVar1 = -0x1000;
    }
    if (step_value_toward_limit(puVar2,sVar1,0x400,(short)param_1) != 0) {
      FUN_00049924(2);
    }
  }
  return;
}
