/* Top-level program flow: WinMain's real body (window/subsystem init and
 * the OS message pump) and the title/main menu loop. Split out of uw.c
 * (the original monolithic decompile) once these functions' real roles
 * were confirmed. */
#include "headers/game.h"
#include "headers/debug.h"
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
    FUN_000773ac(param_1,u_UltimaUW_00087678);
    iVar2 = FUN_00077408(param_1,param_4);
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
      uVar3 = FUN_00077860(param_1,local_38);
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
     (placeholder, overwritten by FUN_0006a0c8), 2-byte H (same)].
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
     (overwritten by FUN_0006a0c8 once the real bitmap loads) at
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
  FUN_0006a1c4(param_1);
  FUN_00057c5c(0x106c);
  cursor_show_idle_tick();
  bVar11 = false;
  local_838 = 0;
  do {
    iVar4 = local_838;
    FUN_000735fc();
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
      FUN_0007ee4c(acStack_7ec,pvVar_buf10000,64000);
      FUN_00057118();
      // HACK: deviation from the real binary -- was load_pals_bank(2, temp_buf),
      /* confirmed via ARM disassembly of the original UU.exe
         (main_menu_loop == FUN_0006a3d8, calls load_pals_bank directly at
         both its own palette-load points, never through set_palette_bank).
         That's a genuine shipped bug, not a decompile artifact:
         load_pals_bank installs g_palette_rgb565 correctly for the menu's own
         draw, but never syncs DAT_00088d98 -- the buffer
         reinstall_active_palette() (called periodically by the menu's own hover-
         loop timer, FUN_0006a168) always reinstalls from. Since nothing
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
            "no postprocessing needed" case) -- but FUN_0006a0c8 is
            exactly the postprocess_cb this resource load needs: same
            3-arg shape as chargen's LAB_000255d0 (see its comment near
            DAT_000fb880), and it writes the per-button bitmap-pointer/
            width/height fields draw_menu_item_list reads out of DAT_0023bf6c's
            record table -- which is otherwise only ever zeroed
            (local_82c's memset above), never populated. Same orphaned-
            callback bug class as LAB_000255d0 was, just already
            decompiled as a named function instead of staying raw
            undecompiled ARM. */
         (iVar10 = load_gr_resource_entries(s_opbtn_00086ee4,0,0xffffffff,&LAB_0006a0ac,&FUN_0006a0c8), iVar10 == 0)) {
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
      FUN_00082388(1);
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
        FUN_0006c560(acStack_6e4);
        /* load_game_from_slot (was FUN_0006c0c0; the numbered-save-slot
           "Save Game" path) reads \SAVE0\player.dat before duplicating
           SAVE0 into the chosen slot, but nothing ever created that file
           for a freshly-started character. write_player_save_record
           (was FUN_00043fd8) is the only other writer (confirmed by its
           body: malloc+serialize+CreateFile+WriteFile) -- called here
           too, alongside the \SAVE0\lev.ark seed a few lines down. First
           attempt chased a red herring: this newly reaches
           write_player_status_block->FUN_0007ef78 with a genuinely truncated pointer
           (fixed, FUN_0007ef78's param_3), but the *fatal* oversized-
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
          FUN_0006c834(1,0);
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
        FUN_0006c98c(2,acStack_7ec,1);
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
        FUN_0006c98c(2,acStack_7ec,1);
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
        FUN_0006c98c(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      FUN_00049924(0x7ffe);
    }
    else if (local_838 == 3) {
      sVar3 = journey_onward_load_slot_menu();
      bVar11 = sVar3 == 1;
      if (sVar3 == -1) {
        uVar7 = FUN_0007863c(0x2a9);
        Ordinal_1047(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_7ec,s__DATA_opscr_byt_00086eec);
        FUN_0006c98c(0xffffffff,acStack_7ec,1);
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
          FUN_0006a168();
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
  FUN_0006ff08(0);
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
     already queues a correct, gradual animation via FUN_0007c3f4, and
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
    DAT_00201c74 = FUN_0007873c(DAT_00086df8,0x7d);
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
  register_key_binding(0x33,1,0x11,&FUN_000680d0);
  register_key_binding(0x31,0xffffffff,0x11,&FUN_000680d0);
  register_key_binding(0x32,0,0x11,&FUN_000680d0);
  register_key_binding(0x6a,7,0x1b,move_command_dispatch);
  register_key_binding(0x4a,6,0x1b,move_command_dispatch);
  register_key_binding(0x86,0,0x1b,toggle_stats_panel);
  register_key_binding(0x89,0,0x1b,&FUN_00071ac4);
  register_key_binding(0x88,2,0x1b,&FUN_0007036c);
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
  FUN_00078c80(0x113);
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
  FUN_0006ff08(6);
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
  uVar5 = FUN_00013774(iVar7 * iVar7 + iVar6 * iVar6);
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

