/* Top-level program flow: WinMain's real body (window/subsystem init and
 * the OS message pump) and the title/main menu loop. Split out of uw.c
 * (the original monolithic decompile) once these functions' real roles
 * were confirmed. */
#include "headers/game.h"
#include "debug.h"



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
      FUN_00011000(0,0xf0,0,0x140);
      Ordinal_1044(g_uw_framebuffer,uVar3,0x25800);
      flush_dirty_rect_to_display_240();
      Ordinal_496(2000);
      Ordinal_1018(uVar3);
      FUN_00022b54(0,0xffffffff);
      FUN_00014294();
      DAT_0023c44c = Ordinal_1041(0x4cce);
      DAT_0023cca0 = Ordinal_1041(64000);
      DAT_0023cef0 = Ordinal_1041(0x7fff);
      Ordinal_1047(DAT_0023c44c,0,0x4cce);
      iVar2 = 0x140;
      puVar4 = &DAT_0023c7a0;
      while (iVar2 = iVar2 + -1, -1 < iVar2) {
        *puVar4 = 0;
        puVar4 = puVar4 + 1;
      }
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
      DAT_0023c210 = Ordinal_1041(64000);
      Ordinal_1047(DAT_0023c210,0,64000);
      DAT_0023c214 = DAT_0023c210;
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
          DAT_0023c648 = FUN_0002294c();
          DAT_0023c448 = 0;
        }
        iVar2 = Ordinal_864(auStack_40,0,0,0,1);
        if (iVar2 != 0) {
          if (local_3c == 0x12) break;
          Ordinal_870(auStack_40);
          Ordinal_859(auStack_40);
        }
        FUN_000497cc();
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
     DAT_0023bf6c and then read back through FUN_0006a200/menu_button_list_navigate
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
     FUN_0006a200 reads back out at pcVar_rec+8/+10 -- previously always
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
  FUN_00011000(0,200,0,0x140);
  DAT_0023bf6c = &local_82c;
  FUN_0006bde0(auStack_4d4,local_83c);
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
  FUN_000570b4();
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
      // HACK: deviation from the real binary -- was FUN_00040e24(2, temp_buf),
      /* confirmed via ARM disassembly of the original UU.exe
         (main_menu_loop == FUN_0006a3d8, calls FUN_00040e24 directly at
         both its own palette-load points, never through FUN_00040efc).
         That's a genuine shipped bug, not a decompile artifact:
         FUN_00040e24 installs g_palette_rgb565 correctly for the menu's own
         draw, but never syncs DAT_00088d98 -- the buffer
         FUN_0007e99c() (called periodically by the menu's own hover-
         loop timer, FUN_0006a168) always reinstalls from. Since nothing
         else keeps DAT_00088d98 current for the menu screen, it holds
         whatever palette some other screen last loaded via
         FUN_00040efc, and the timer clobbers the menu's correct
         palette back to that stale one on the very next hover/redraw
         (confirmed via UW_DEBUG_LEVEL=TRACE: g_palette_rgb565 flips from
         pals.dat index 2 to a leftover index 5). Using FUN_00040efc(2)
         here instead keeps DAT_00088d98 in sync, so that clobber
         reinstalls the *same* correct palette instead of a stale one. */
      FUN_00040efc(2);
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
      FUN_000570b4();
      if ((DAT_0023bf70 == 0) ||
         /* Was a literal 0 here (an earlier fix pass believed this
            mirrored sibling call sites like FUN_00041a78's genuine
            "no postprocessing needed" case) -- but FUN_0006a0c8 is
            exactly the postprocess_cb this resource load needs: same
            3-arg shape as chargen's LAB_000255d0 (see its comment near
            DAT_000fb880), and it writes the per-button bitmap-pointer/
            width/height fields FUN_0006a200 reads out of DAT_0023bf6c's
            record table -- which is otherwise only ever zeroed
            (local_82c's memset above), never populated. Same orphaned-
            callback bug class as LAB_000255d0 was, just already
            decompiled as a named function instead of staying raw
            undecompiled ARM. */
         (iVar10 = FUN_000417b4(s_opbtn_00086ee4,0,0xffffffff,&LAB_0006a0ac,&FUN_0006a0c8), iVar10 == 0)) {
        FUN_0003c3c8(0x300d);
      }
      if (local_838 != 3) {
        FUN_0006a200(uVar8,DAT_0023bf6c,0,uVar2);
        // HACK: same DAT_00088d98-sync deviation as this function's other
        // palette-load point above -- see that comment.
        FUN_00040efc(2);
        fade_in(0,0,g_uw_framebuffer,200);
      }
    }
    sVar3 = menu_button_list_navigate(uVar8,DAT_0023bf6c,0,uVar2);
    local_838 = (int)sVar3;
    if (local_838 == -1) {
      FUN_0003baf4(0);
      FUN_00082388(1);
    }
    else if (local_838 == 0) {
      FUN_00037c14(0);
    }
    else if (local_838 == 1) {
      DAT_0024af74 = 1;
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
           FUN_0006bc28 below fails, bouncing straight back to the menu
           instead of entering the dungeon. */
        Ordinal_164(auStack_22c,auStack_434,0);
        uw_file_copy(s__DATA_lev_ark_00085734, s__SAVE0_lev_ark_000842fc);
        sVar3 = FUN_00019120();
        if (sVar3 != 0) {
          FUN_0003c3c8();
        }
        sVar3 = FUN_0006bc28(1);
        if (sVar3 < 1) {
          bVar11 = false;
        }
        else {
          bVar11 = true;
          set_player_tile_position(0x20,2,1);
          FUN_0006c834(1,0);
        }
      }
      DAT_0024af74 = 0;
    }
    else if (local_838 == 2) {
      iVar4 = FUN_0002294c();
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
        iVar10 = FUN_0002294c();
        sVar3 = FUN_00057a70();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = FUN_0002294c();
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
        iVar10 = FUN_0002294c();
        sVar3 = FUN_00057a70();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = FUN_0002294c();
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
        iVar10 = FUN_0002294c();
        sVar3 = FUN_00057a70();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      FUN_00049924(0x7ffe);
    }
    else if (local_838 == 3) {
      sVar3 = FUN_0006b178();
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
        FUN_00040d00(s_FONTBIG_SYS_00085454);
        *DAT_0008429c = 0xa2;
        *DAT_00084298 = 0xa2;
        sVar3 = FUN_000112a0(uVar7);
        iVar4 = (int)sVar3;
        if (iVar4 < 0) {
          iVar4 = iVar4 + 1;
        }
        draw_text_string(uVar7,0xa0 - (short)(iVar4 >> 1),0x5a);
        FUN_000570b4();
        while (sVar3 = FUN_00057a70(), sVar3 < 0) {
          FUN_0006a168();
        }
        FUN_00040d00(s_FONT5X6P_SYS_00084e9c);
      }
      else if (bVar11) {
        FUN_00040004();
      }
    }
    Ordinal_1018(local_834);
  } while (!bVar11);
  FUN_00057cac(3);
  FUN_000570b4();
  set_game_mode(1);
  FUN_00049924(0x7ffe);
  DAT_000868d8 = 0;
  return;
}
