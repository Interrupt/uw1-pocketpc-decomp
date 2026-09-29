/* The HUD: dirty-rect tracking/flush, mode icons, cursor-mode button
 * clicks, the per-frame HUD draw/tick dispatch (vitals bar, dragon
 * reaction, compass needle, panel transitions), and the message
 * scroll panel (word-wrap, line-by-line scroll, draw). Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/hud.h"
#include "headers/debug.h"
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>




// was FUN_00011000 -- expand the damaged-region bounds (DAT_00088950..5c) to include the given rect; sibling of dirty_rect_set
void dirty_rect_union(param_1,param_2,param_3,param_4)
int param_1;
int param_2;
int param_3;
int param_4;

{
  if (param_1 < DAT_00088954) {
    DAT_00088954 = param_1;
  }
  if (DAT_0008895c < param_2) {
    DAT_0008895c = param_2;
  }
  if (param_3 < DAT_00088950) {
    DAT_00088950 = param_3;
  }
  if (DAT_00088958 < param_4) {
    DAT_00088958 = param_4;
  }
  return;
}



// was FUN_00011040 -- dirty-rect SET (overwrite the damaged-region
// bounds to exact values; sibling of dirty_rect union dirty_rect_union)
void dirty_rect_set(param_1,param_2,param_3,param_4)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  DAT_00088954 = param_1;
  DAT_0008895c = param_2;
  DAT_00088950 = param_3;
  DAT_00088958 = param_4;
  return;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* This is the game's dirty-rect blit: DAT_00088954/5c/50/58 (top/
   bottom/left/right) accumulate via dirty_rect_union, called from every
   draw (rect fill, text draw, sprite blit, ...) to grow the damaged
   region -- clamped here, then blitted from the software buffer
   (g_uw_framebuffer) into GXBeginDraw()'s real framebuffer and
   presented via GXEndDraw(). Investigated as a suspect for the
   chargen "text flashes then gets covered by a rectangle" bug (SS1
   shares this same Looking Glass dirty-rect heritage): the bounds are
   accumulate-only in the normal UI flow -- the only explicit reset
   (dirty_rect_set, setting them back to an empty/degenerate rect) is a
   single call site elsewhere unrelated to chargen -- so nothing here
   makes the tracked region shrink or exclude an area once drawn to.
   Didn't find a bug in this function itself; the rapid-cycling
   behavior traced back to unfiltered SDL key-repeat instead (see
   gx_stub.c's uw_pump_events), but noting this in case the covered-
   rectangle symptom persists after that fix and this needs a second
   look. */
// was FUN_00022f0c
void flush_dirty_rect_to_display()

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  int iVar10;
  int iVar11;

  if (DAT_00088954 < 0) {
    DAT_00088954 = 0;
  }
  else if (200 < DAT_00088954) {
    DAT_00088954 = 200;
  }
  iVar2 = DAT_00088954;
  if (DAT_0008895c < 0) {
    DAT_0008895c = 0;
  }
  else if (200 < DAT_0008895c) {
    DAT_0008895c = 200;
  }
  iVar3 = DAT_0008895c;
  if (DAT_00088950 < 0) {
    DAT_00088950 = 0;
  }
  else if (0x140 < DAT_00088950) {
    DAT_00088950 = 0x140;
  }
  if (DAT_00088958 < 0) {
    DAT_00088958 = 0;
  }
  else if (0x140 < DAT_00088958) {
    DAT_00088958 = 0x140;
  }
  iVar10 = 0x140 - DAT_00088958;
  iVar11 = 0x140 - DAT_00088950;
  if (getenv("UW_DEBUG_FLUSHGATE")) {
    int willflush = ((0 < DAT_00084f10) ||
      (((g_selected_object == 0 || (g_force_flush != 0)) && ((DAT_0023c63c == 0 || (g_force_flush != 0))))));
    fprintf(stderr, "[flushgate] willflush=%d selected=%p force=%d rect=(%d,%d,%d,%d)\n",
            willflush, (void *)g_selected_object, (int)g_force_flush,
            (int)DAT_00088954, (int)DAT_0008895c, (int)DAT_00088950, (int)DAT_00088958);
  }
  if (((0 < DAT_00084f10) ||
      (((g_selected_object == 0 || (g_force_flush != 0)) && ((DAT_0023c63c == 0 || (g_force_flush != 0)))))
      ) && ((DAT_0023cdc0 == 0x10 && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0))))
  {
    iVar6 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar6 = DAT_0023cdb8 + 1;
    }
    iVar7 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar7 = DAT_0023cdbc + 1;
    }
    puVar5 = (undefined2 *)((char *)DAT_0023c430 + ((iVar7 >> 1) * iVar10 + (iVar6 >> 1) * iVar2) * 2);
    /* DAT_00088958 ("right") is a right-*exclusive* dirty-rect bound
       everywhere else in this function (e.g. `iVar10 = 0x140 -
       DAT_00088958` correctly treats it as a remaining-width count), but
       here it's used directly as a starting column INDEX -- when the
       dirty rect spans the full screen width (right==0x140), this reads
       one full source row past the buffer's end (ASAN heap-buffer-
       overflow). Needs the same -1 every other direct-index use of a
       right/bottom bound in this codebase gets to become the last
       *valid* column instead of one-past-it. */
    puVar4 = (undefined2 *)
             ((g_uw_framebuffer) +
             (DAT_00088954 * 0x140 + (DAT_00088958 - 1)) * 2);
    if (iVar10 < iVar11) {
      iVar11 = iVar11 - iVar10;
      do {
        if (iVar2 < iVar3) {
          iVar10 = iVar3 - iVar2;
          puVar8 = puVar5;
          puVar9 = puVar4;
          do {
            uVar1 = *puVar9;
            iVar10 = iVar10 + -1;
            puVar9 = puVar9 + 0x140;
            *puVar8 = uVar1;
            puVar8 = puVar8 + (iVar6 >> 1);
          } while (iVar10 != 0);
        }
        iVar11 = iVar11 + -1;
        puVar5 = puVar5 + (iVar7 >> 1);
        puVar4 = puVar4 + -1;
      } while (iVar11 != 0);
    }
    if (getenv("UW_DEBUG_FLUSHCALLER")) {
      void *caller = __builtin_return_address(0);
      Dl_info info;
      const char *name = (dladdr(caller, &info) && info.dli_sname) ? info.dli_sname : "?";
      static unsigned int call_count = 0;
      call_count++;
      fprintf(stderr, "[flushcaller] call=%u tick=%u caller=%s(%p)\n", call_count, g_uw_frame_clock_units, name, caller);
    }
    GXEndDraw();
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0002310c -- near-identical twin of flush_dirty_rect_to_display
// above, clamped to a 240px-tall dirty rect instead of 200px; likely a
// different screen-height device variant of the same GX-hardware flush.
void flush_dirty_rect_to_display_240()

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  int iVar10;
  int iVar11;
  
  if (DAT_00088954 < 0) {
    DAT_00088954 = 0;
  }
  else if (0xf0 < DAT_00088954) {
    DAT_00088954 = 0xf0;
  }
  iVar2 = DAT_00088954;
  if (DAT_0008895c < 0) {
    DAT_0008895c = 0;
  }
  else if (0xf0 < DAT_0008895c) {
    DAT_0008895c = 0xf0;
  }
  iVar3 = DAT_0008895c;
  if (DAT_00088950 < 0) {
    DAT_00088950 = 0;
  }
  else if (0x140 < DAT_00088950) {
    DAT_00088950 = 0x140;
  }
  if (DAT_00088958 < 0) {
    DAT_00088958 = 0;
  }
  else if (0x140 < DAT_00088958) {
    DAT_00088958 = 0x140;
  }
  iVar10 = 0x140 - DAT_00088958;
  iVar11 = 0x140 - DAT_00088950;
  if ((DAT_0023cdc0 == 0x10) && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0)) {
    iVar6 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar6 = DAT_0023cdb8 + 1;
    }
    iVar7 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar7 = DAT_0023cdbc + 1;
    }
    puVar5 = (undefined2 *)((char *)DAT_0023c430 + ((iVar7 >> 1) * iVar10 + (iVar6 >> 1) * iVar2) * 2);
    /* DAT_00088958 ("right") is a right-*exclusive* dirty-rect bound
       everywhere else in this function (e.g. `iVar10 = 0x140 -
       DAT_00088958` correctly treats it as a remaining-width count), but
       here it's used directly as a starting column INDEX -- when the
       dirty rect spans the full screen width (right==0x140), this reads
       one full source row past the buffer's end (ASAN heap-buffer-
       overflow). Needs the same -1 every other direct-index use of a
       right/bottom bound in this codebase gets to become the last
       *valid* column instead of one-past-it. */
    puVar4 = (undefined2 *)
             ((g_uw_framebuffer) +
             (DAT_00088954 * 0x140 + (DAT_00088958 - 1)) * 2);
    if (iVar10 < iVar11) {
      iVar11 = iVar11 - iVar10;
      do {
        if (iVar2 < iVar3) {
          iVar10 = iVar3 - iVar2;
          puVar8 = puVar5;
          puVar9 = puVar4;
          do {
            uVar1 = *puVar9;
            iVar10 = iVar10 + -1;
            puVar9 = puVar9 + 0x140;
            *puVar8 = uVar1;
            puVar8 = puVar8 + (iVar6 >> 1);
          } while (iVar10 != 0);
        }
        iVar11 = iVar11 + -1;
        puVar5 = puVar5 + (iVar7 >> 1);
        puVar4 = puVar4 + -1;
      } while (iVar11 != 0);
    }
    GXEndDraw();
  }
  return;
}




// was FUN_0003e44c -- per-frame(ish) HUD/gameplay-mode refresh, called
// from enter_dungeon_view (chargen completion, returning from a menu,
// etc.); re-establishes the mode-icon highlight if a mode is already
// selected, then calls sync_player_stats_to_hud. Its first call
// passes s_init_gamedisp_goes_000858e8 ("init_gamedisp goes..."), a
// leftover original-build debug string strongly suggesting this
// function's real name was closer to init_gamedisp.
void enter_dungeon_view_hud_init()

{
  FUN_0007ea34(s_init_gamedisp_goes_000858e8);
  FUN_00046414();
  FUN_0007f044();
  resume_music_playback();
  FUN_0003e2a4();
  if (DAT_000868d8 == 0) {
    if (g_cursor_mode != 0) {
      /* Dropped argument (confirmed via disassembly of 0x3e44c: r0
         holds g_cursor_mode, untouched since the guard's own load,
         right up to `bl 0x3f99c`) -- the real ARM code passes
         g_cursor_mode through via register reuse. Without it, the
         mode icon's initial highlight on entering the dungeon view
         drew with whatever id happened to be left over in r0. */
      mode_icon_highlight_on((int)g_cursor_mode);
    }
  }
  else {
    FUN_000564f8(1);
  }
  sync_player_stats_to_hud();
  redraw_hud_panels();
  return;
}




// was FUN_0003f99c -- draws the "selected" state for mode icon
// param_1 (1-based) by blitting LFTI.GR's per-icon highlight frame
// (id (param_1-1)*-2+0x200b) at that icon's registered position
// (DAT_000858a8/DAT_000858b8). Called both from
// cursor_mode_button_click's own click handling and from
// enter_dungeon_view_hud_init/close_ui_panel_return_to_game to
// re-establish the highlight when a mode is already selected.
void mode_icon_highlight_on(param_1)
int param_1;

{
  int iVar1;
  short sVar2;
  short sVar3;
  
  iVar1 = (param_1 + -1) * 0x10000 >> 0x10;
  sVar2 = *(short *)(&DAT_000858a8 + iVar1 * 2);
  sVar3 = *(short *)(&DAT_000858b8 + iVar1 * 2);
  FUN_00057118();
  g_blit_transparent_mode = 1;
  /* Confirmed via real ARM disassembly (0x3f99c: `mov r0,#0x2000;
     orr r0,r0,#0xb; sub r0,r0,r4,lsl #0x1`) that `(param_1-1)*-2 +
     0x200b` is exactly what the original compiled code computes --
     NOT a decompile artifact. The "door sprite" bug is NOT here; see
     resolve_sprite_id_to_frame/the resource loader instead. */
  if (getenv("UW_DEBUG_MODEICON"))
    fprintf(stderr, "[modeicon] mode_icon_highlight_on (highlight ON) param_1=%d iVar1=%d id=0x%x x=%d y=%d\n",
            param_1, iVar1, (param_1 + -1) * -2 + 0x200b, (int)sVar2, (int)sVar3);
  draw_sprite_by_id((param_1 + -1) * -2 + 0x200b,(int)sVar2,(int)sVar3,1,1);
  g_blit_transparent_mode = 0;
  cursor_show_idle_tick();
  return;
}



// was FUN_0003fa1c -- un-highlights mode icon param_1 (1-based),
// mode_icon_highlight_on's counterpart: draws LFTI.GR's adjacent
// "unselected" frame (id (0x1005-(param_1-1))*2) at the same position.
void mode_icon_highlight_off(param_1)
int param_1;

{
  int iVar1;
  short sVar2;
  short sVar3;
  
  iVar1 = (param_1 + -1) * 0x10000 >> 0x10;
  sVar2 = *(short *)(&DAT_000858a8 + iVar1 * 2);
  sVar3 = *(short *)(&DAT_000858b8 + iVar1 * 2);
  FUN_00057118();
  g_blit_transparent_mode = 1;
  /* Confirmed via real ARM disassembly (0x3fa1c: `mov r0,#0x1000;
     orr r0,r0,#0x5; sub r0,r0,r4; mov r0,r0,lsl #0x1`) that
     `(0x1005-(param_1-1))*2` is exactly what the original compiled
     code computes -- NOT a decompile artifact. Reverted an earlier
     incorrect "fix" that dropped this doubling; see resolve_sprite_id_to_frame/the
     resource loader for the real "door sprite" bug instead. */
  if (getenv("UW_DEBUG_MODEICON"))
    fprintf(stderr, "[modeicon] mode_icon_highlight_off (highlight OFF) param_1=%d iVar1=%d id=0x%x x=%d y=%d\n",
            param_1, iVar1, (0x1005 - (param_1 + -1)) * 2, (int)sVar2, (int)sVar3);
  draw_sprite_by_id((0x1005 - (param_1 + -1)) * 2,(int)sVar2,(int)sVar3,1,1);
  g_blit_transparent_mode = 0;
  cursor_show_idle_tick();
  return;
}



// was FUN_0003faa0
void cursor_mode_button_click(param_1)
short param_1;

{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  char cVar4;
  short sVar5;
  if (getenv("UW_DEBUG_MODEBTN"))
    fprintf(stderr, "[modebtn] cursor_mode_button_click in: param_1=%d rel_y=%d cursor_mode=%d\n",
            (int)param_1, (int)DAT_00085a6c[1], (int)g_cursor_mode);
  uint uVar6;
  int iVar7;
  
  if ((g_cursor_holding_state == 0) && ((short)DAT_00201b60 == 1)) {
    iVar7 = (int)param_1;
    if (iVar7 == -1) {
      if (DAT_000868d8 == 0) {
        sVar5 = Ordinal_2005(0x12,DAT_00085a6c[1] + 2);
        iVar7 = (int)sVar5;
        if (getenv("UW_DEBUG_MODEBTN"))
          fprintf(stderr, "[modebtn] resolved iVar7=%d\n", iVar7);
        if (5 < iVar7) {
          return;
        }
      }
      else {
        FUN_00056d38((int)*DAT_00085a6c,(int)DAT_00085a6c[1]);
      }
    }
    if (iVar7 == 5) {
      FUN_000564f8(1);
    }
    else {
      set_hud_status_value(8,6);
      uVar6 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar6;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar6 >> 8);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        FUN_00057cac(3);
      }
      iVar7 = (iVar7 + 1) * 0x10000;
      iVar1 = iVar7 >> 0x10;
      if (iVar1 == g_cursor_mode) {
        /* Dropped argument (Ghidra emitted a bare call despite
           mode_icon_highlight_off's own body using param_1 throughout) -- confirmed
           by this same function's sibling call sites elsewhere in the
           file (mode_icon_highlight_off(2), mode_icon_highlight_off(5)) using the correct
           explicit-argument convention. mode_icon_highlight_off un-highlights
           whichever mode icon is currently selected, so it needs the
           OLD g_cursor_mode value (read here, before it's overwritten
           below) -- this is the exact "door image" bug: without it, the
           call ran on register-leftover garbage, resolving to a wild,
           essentially random absolute sprite frame instead of the
           intended icon. */
        mode_icon_highlight_off(g_cursor_mode);
        g_cursor_mode = 0;
      }
      else {
        if (g_cursor_mode != 0) {
          mode_icon_highlight_off(g_cursor_mode);
        }
        g_cursor_mode = (short)((uint)iVar7 >> 0x10);
        if (getenv("UW_DEBUG_MODEBTN"))
          fprintf(stderr, "[modebtn] resulting g_cursor_mode=%d\n", (int)g_cursor_mode);
        if (iVar1 == 2) {
          if ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0) {
            uVar2 = *(undefined2 *)(DAT_00086df8 + 0x5f);
            *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar2 | 2;
            *(char *)(DAT_00086df8 + 0x60) = (char)((ushort)uVar2 >> 8);
            set_hud_status_value(8,4);
            mode_icon_highlight_on((int)g_cursor_mode);
            bVar3 = get_current_music_track();
            if ((bVar3 < 5) || (bVar3 = get_current_music_track(), 7 < bVar3)) {
              FUN_000735b0(8);
            }
          }
          else {
            g_cursor_mode = 0;
          }
        }
        else {
          mode_icon_highlight_on(iVar1);
        }
      }
      if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) && (cVar4 = get_current_music_track(), cVar4 == '\b')) {
        FUN_000735c0();
      }
      wait_for_click_release(1);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        FUN_00057c5c(0x1077);
      }
    }
  }
  return;
}



// was FUN_0003fd14 -- registered over the same mode-icon-bar click
// rect as cursor_mode_button_click but under a different active-mask
// bit (4, not 1), so it's live in a different input context. Near-
// identical body, but only lets the click force-select mode 3 (any
// other resolved index besides toggling the current mode back off is
// ignored) -- a restricted variant of the normal click handler.
void cursor_mode_button_click_restricted(param_1)
short param_1;

{
  int iVar1;
  char cVar2;
  short sVar3;
  uint uVar4;
  int iVar5;
  
  if ((g_cursor_holding_state == 0) && ((short)DAT_00201b60 == 1)) {
    iVar5 = (int)param_1;
    if (iVar5 == -1) {
      if (DAT_000868d8 == 0) {
        sVar3 = Ordinal_2005(0x12,DAT_00085a6c[1] + 2);
        iVar5 = (int)sVar3;
        if (5 < iVar5) {
          return;
        }
      }
      else {
        FUN_00056d38((int)*DAT_00085a6c,(int)DAT_00085a6c[1]);
      }
    }
    if (iVar5 == 5) {
      FUN_000564f8(1);
    }
    else {
      set_hud_status_value(8,6);
      uVar4 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar4;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar4 >> 8);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        FUN_00057cac(3);
      }
      iVar5 = (iVar5 + 1) * 0x10000;
      iVar1 = iVar5 >> 0x10;
      if (iVar1 == g_cursor_mode) {
        /* Same dropped-argument bug as cursor_mode_button_click's own
           two identical sites above -- see that comment. */
        mode_icon_highlight_off(g_cursor_mode);
        g_cursor_mode = 0;
      }
      else if (iVar1 == 3) {
        if (g_cursor_mode != 0) {
          mode_icon_highlight_off(g_cursor_mode);
        }
        g_cursor_mode = (short)((uint)iVar5 >> 0x10);
        mode_icon_highlight_on(3);
      }
      if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) && (cVar2 = get_current_music_track(), cVar2 == '\b')) {
        FUN_000735c0();
      }
      wait_for_click_release(1);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        FUN_00057c5c(0x1077);
      }
    }
  }
  return;
}




// was FUN_000497cc -- runs once per in-game main-loop iteration: resets
// the dirty rect to a degenerate {100,100,100,100}, redraws the small
// HUD/cursor element, and flushes that to the display
void main_loop_hud_flush()

{
  unsigned int _dbg_hf_t0 = 0;
  int _dbg_hf = getenv("UW_DEBUG_HUDSPLIT") != NULL;
  if (_dbg_hf) _dbg_hf_t0 = read_realtime_clock_units() * 4;
  dirty_rect_set(100,100,100,100);
  /* HACK: redraw the 3D dungeon view on every main-loop iteration.
     Normally the redraw is driven off dirty bit 3, which apply_movement_tick
     only sets while a motion flag is live -- so the dungeon view freezes the
     instant the player is idle (and never repaints for anything that changes
     in view without the player moving). */
  int _did_force_redraw = 0;
  {
    static int _force = -1;
    if (_force < 0) _force = (getenv("UW_NO_FORCE_3D_REDRAW") == NULL);
    if (getenv("UW_DEBUG_DOOR")) {
      static int _last_b64 = -1, _last_c90 = -1;
      if ((int)DAT_00201b64 != _last_b64 || (int)DAT_00201c90 != _last_c90) {
        fprintf(stderr, "[door] main_loop_hud_flush: DAT_00201b64=%d DAT_00201c90=%d\n",
                (int)DAT_00201b64, (int)DAT_00201c90);
        _last_b64 = (int)DAT_00201b64;
        _last_c90 = (int)DAT_00201c90;
      }
    }
    if (_force && DAT_00201b64 == 0 && DAT_00201c90 == 0) {
      _did_force_redraw = 1;
      /* Rebuild AND re-rasterise the 3D dungeon view every main-loop
         iteration. An earlier version called only render_dungeon_view()
         over the existing geometry -- but the camera globals it reads
         (DAT_000db438.. position / DAT_000db448.. angles) are only synced
         from the player object by build_frame_draw_list(), and the visible
         -tile geometry only by walk_visible_tiles() inside
         rebuild_dungeon_view(). Skipping both meant the view never changed
         as the player moved or turned -- the exact symptom being fixed.
         render_dungeon_frame_timed() is the real per-frame entry point
         this main-loop hack should have been calling all along (was
         full_dungeon_redraw() -- a strict subset: same rebuild+render,
         minus the conditional-rebuild-skip optimisation, the
         weapon-swing overlay draw, three more per-frame steps, and the
         adaptive-quality timing feed). Found by tracing why
         weapon_swing_draw_tick -- confirmed fully working once wired up
         -- never actually appeared on screen during ordinary play: its
         only call site turned out to be render_dungeon_frame_timed,
         which nothing in the normal per-tick path was calling.
         g_force_redraw_no_xp suppresses full_dungeon_redraw's/
         rebuild_dungeon_view's one unwanted side effect (a per-redraw XP
         trickle that also happens to crash on a dropped arg) --
         render_dungeon_frame_timed reaches the same rebuild_dungeon_view,
         so the guard still applies. render_dungeon_frame_timed does its
         own dirty_rect_union internally (same rect this hack used to set
         by hand), so flush_dirty_rect_to_display(1) below still blits it --
         g_suppress_frame_timed_flush (see flush_dungeon_frame's own comment)
         stops render_dungeon_frame_timed from ALSO doing its own real
         screen flush here, since that was a second real GXEndDraw() every
         tick, each independently vsync-throttled, roughly doubling
         real per-tick time (only visible with keyboard-held input, since
         a mouse-button hold's DAT_0023c63c gate happened to already skip
         one of the two). Skipped while an animation owns the view
         (DAT_00201c90 != 0). Set UW_NO_FORCE_3D_REDRAW to restore the
         motion-gated behaviour. */
      g_force_redraw_no_xp = 1;
      g_suppress_frame_timed_flush = 1;
      render_dungeon_frame_timed();
      g_suppress_frame_timed_flush = 0;
      /* UW_DEBUG_PICK_VIEW: run a pick-mode render pass to fill the pick
         buffer, then paint it over the viewport (see
         uw_debug_blit_pick_buffer). */
      { static int _pv = -1;
        if (_pv < 0) _pv = (getenv("UW_DEBUG_PICK_VIEW") != NULL);
        if (_pv) { FUN_0005bac0(); uw_debug_blit_pick_buffer(); }
      }
      g_force_redraw_no_xp = 0;
    }
  }
  if (DAT_00201c84 != 0) {
    dispatch_sticky_mode_handlers();
  }
  /* HACK: drive the attack-swing state machine (FUN_00027708) every
     main-loop tick. Its own body is a real, correct state machine
     (wind-up -> resolve-impact -> follow-through -> return-to-idle,
     gated on DAT_0010062c/DAT_000870e4 and a real-elapsed-time
     accumulator read via read_realtime_clock_units()), but interact_attack only
     ever calls it ONCE, with a nonzero param_1, to arm the swing
     (DAT_0010062c set to a negative wind-up countdown). Nothing else
     in the normal per-tick path calls FUN_00027708(0) to let that
     countdown actually progress -- its only two "continue" (param_1==0)
     call sites are one-shot level-load/save-load edge cases, not a
     per-frame driver. Confirmed live: a real attack arms correctly
     (weapon raises, [swing] trace shows a real wind-up countdown) but
     then sits frozen forever, since nothing ever asks it to advance
     past that point. Matches this same file's DAT_00085668 per-frame
     dispatch table being link-time data Ghidra couldn't recover (see
     its own comment) -- FUN_00027708(0) was almost certainly one of
     that table's real entries originally. Calling it here is cheap
     when idle (a couple of int compares) and exactly mirrors the
     already-fixed render_dungeon_frame_timed hack above. Set
     UW_NO_FORCE_SWING_TICK to restore the (broken) original behaviour. */
  { static int _swing_tick = -1;
    if (_swing_tick < 0) _swing_tick = (getenv("UW_NO_FORCE_SWING_TICK") == NULL);
    if (_swing_tick) FUN_00027708(0);
  }
  { unsigned int _t1 = 0, _t2 = 0;
    if (_dbg_hf) _t1 = read_realtime_clock_units() * 4;
    poll_input_bindings(DAT_00085a6c);
    if (_dbg_hf) {
      _t2 = read_realtime_clock_units() * 4;
      fprintf(stderr, "[hudsplit] pre_pib_ms=%u pib_ms=%u\n", _t1 - _dbg_hf_t0, _t2 - _t1);
    }
  }
  { static int _div = -1;
    if (_div < 0) _div = (getenv("UW_DEBUG_DRAW_INV_POSITIONS") != NULL);
    if (_div) uw_debug_draw_inv_hotspot_positions();
  }
  /* Debug UI: must draw HERE, after the forced 3D redraw above (or it
     gets painted over) but before flush_dirty_rect_to_display(1) below
     -- that call is the actual screen present for this tick (blits the
     software framebuffer through to GXEndDraw/SDL_RenderPresent, see
     gx_stub.c). Drawing from app_main_loop after this function returns
     is one full tick too late: the present for THIS tick already
     happens inside this function, and the very next tick's forced 3D
     redraw runs and gets flushed before this function is reached
     again -- so the panel's own pixels never survive to reach an
     actually-presented frame. rect_fill_or_save_restore/draw_text_string
     already call dirty_rect_union themselves, so the panel's region is
     automatically included in the flush below once drawn here. */
  dbgui_draw();
  uw_debug_dump_sprite_frames_once();
  uw_debug_dump_critter_sheet_once();
  uw_debug_force_item_id_once();
  /* When the forced 3D redraw ran this frame, push it through even if a
     mouse button is being held in the viewport: DAT_0023c63c (the
     click-hold flag) otherwise blocks flush_dirty_rect_to_display's real
     screen flush for the whole hold, so a click-and-hold-to-walk froze
     the view. */
  if (_did_force_redraw) {
    g_force_flush = 1;
    flush_dirty_rect_to_display(1);
    g_force_flush = 0;
  } else {
    flush_dirty_rect_to_display(1);
  }
  /* REVERTED (was a hand-hacked lit-torch HUD icon flicker -- see
     mode-icon-and-hud-icon-flicker-fixes memory for the full arc).
     Unconditionally rotating palette_cycle_range(16,8,1) every 8 ticks
     from here ran regardless of dungeon-view state and touched the
     shared global palette (DAT_00088d98/g_palette_rgb565), the same
     table raster_textured_span samples fresh every frame for ALL 3D
     wall/floor/ceiling rendering -- including real lava textures this
     project confirmed use this exact fire-gradient range (F32.TR/
     F16.TR entries 24/25, W64.TR/W16.TR entry 206). If the original
     game's own (still-unfound) global fire/water palette-animation
     mechanism turns up later, this hack would already be stomping on
     the same palette range and timing, corrupting or double-animating
     it. Pulled until that original mechanism is found or ruled out for
     good; the equipped lit-torch HUD icon is back to not animating. */
  return;
}




// was FUN_0005d704 -- append the fixed HUD draw-command opcode sequence (compass, panels, sprite ids from FUN_00038a8c) to the draw-command list DAT_00110fc0
void emit_hud_draw_commands()

{
  short sVar1;
  undefined2 uVar2;
  bool bVar3;
  
  DAT_0023b830 = 1;
  sVar1 = g_current_view->view_shake_x;
  bVar3 = sVar1 == 0;
  if (bVar3) {
    sVar1 = g_current_view->view_shake_y;
  }
  DAT_0023b4dc = (uint)(bVar3 && sVar1 == 0);
  *DAT_00110fc0 = 0x38;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  FUN_00038ae8(0xa0,1);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x2200;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x400;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x1100;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x3300;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = FUN_00038a8c(9);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = FUN_00038a8c(8);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = FUN_00038a8c(4);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189582 = 1;
  DAT_00189580 = 1;
  DAT_00189578 = 0;
  *DAT_00110fc0 = 0xd0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (undefined2)DAT_0023b4dc;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_0023b4f4 = DAT_00086b38;
  DAT_0023b80c = DAT_00086b40;
  DAT_0023b4d4 = DAT_00086b48;
  dungeon_view_prepass_stub(2);
  DAT_0023bc8c = *(undefined2 *)(&DAT_00086b50 + DAT_0023b4a0 * 4);
  DAT_0023b8c0 = *(undefined2 *)(&DAT_00086b52 + DAT_0023b4a0 * 4);
  walk_visible_tiles();
  return;
}




// was FUN_0006ca4c -- brief "shake" animation played on a flask's
// shared decoration slot ((&DAT_0023c224)[iVar1]) when
// hud_vitals_bar_tick's health-poisoned or mana threshold check
// crosses over; param_1 selects health(0)/mana(1) and picks which of
// the 3 literal id ranges (0x200c/0x203e/0x2025) to animate through.
void hud_vitals_threshold_shake(param_1)
short param_1;

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  byte *pbVar5;
  
  iVar1 = (int)param_1;
  if (iVar1 == 0) {
    if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) == 0) {
      sVar2 = 0x200c;
    }
    else {
      sVar2 = 0x203e;
    }
    iVar4 = (int)sVar2;
  }
  else {
    if (iVar1 != 1) {
      return;
    }
    iVar4 = 0x2025;
  }
  draw_sprite_by_id(0x2057,(int)*(short *)(&DAT_000870ec + iVar1 * 2),0x7e,1,1);
  iVar3 = 0;
  pbVar5 = &DAT_0023c118 + iVar1;
  if (*pbVar5 != 0) {
    do {
      sprite_list_set_position((int)(short)(&DAT_0023c224)[iVar1],(int)*(short *)(&DAT_000870ec + iVar1 * 2),
                   (int)(short)(&DAT_000870f2)[iVar3]);
      sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[iVar1],iVar3 + iVar4);
      FUN_00076508();
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)*pbVar5);
  }
  (&DAT_0023c128)[iVar1] = *pbVar5;
  return;
}




void redraw_hud_panels()

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;

  DEBUG(INFO, "[hud] Setting up hud graphics?\n");

  if (DAT_0023c23c == 0) {
    iVar3 = 0;
    do {
      uVar1 = sprite_list_alloc_entry(0);
      (&DAT_0023c224)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,0,0,0x18,4);
      uVar1 = sprite_list_alloc_raw_entry(2,0xd,10);
      (&DAT_0023c230)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087170)[iVar3],0x87,0xd,10);
      g_blit_transparent_mode = 1;
      uVar1 = sprite_list_alloc_raw_entry(2,0x25,0x17);
      (&DAT_0023c234)[iVar3] = (short)uVar1;
      g_blit_transparent_mode = 0;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087174)[iVar3],0x92,0x25,0x17);
      uVar1 = sprite_list_alloc_entry(0);
      (&DAT_0023c238)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_000871b4)[iVar3],0x42,0xc,0x1c);
      (&DAT_0023c12c)[iVar3] = 0;
      (&DAT_0023c11c)[iVar3] = 0;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < 2);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c228 = (undefined2)uVar1;
    sprite_list_set_rect(uVar1,0x70,0x84,0x38,0x20);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c22c = (undefined2)uVar1;
    if (getenv("UW_DEBUG_COMPASS")) {
      fprintf(stderr, "[compass] redraw_hud_panels init: sprite_handle=%d x=%d y=%d\n",
              (int)uVar1, (int)DAT_00087130, (int)DAT_00087150);
    }
    sprite_list_set_rect(uVar1,(int)DAT_00087130,(int)DAT_00087150,3,4);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c21c = (short)uVar1;
    sprite_list_set_rect(uVar1,0x80,5,1,1);
    DAT_0023c130 = 6;
    DAT_0023c120 = 6;
    DAT_0023c23c = 1;
  }
  iVar3 = 0;
  do {
    hud_vitals_threshold_shake(iVar3);
    sprite_list_set_frame_id((int)(short)(&DAT_0023c230)[iVar3],(&DAT_000871d4)[iVar3]);
    sprite_list_set_frame_id((int)(short)(&DAT_0023c234)[iVar3],(&DAT_000871d8)[iVar3]);
    iVar2 = 0x12;
    if (iVar3 == 0) {
      iVar2 = 0;
    }
    sprite_list_set_frame_id((int)(short)(&DAT_0023c238)[iVar3],iVar2 + 0x207b);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 2);
  snap_compass_to_heading();
  sprite_list_set_frame_id((int)DAT_0023c21c,0x20a6);
  update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
  FUN_00041a78(s_panels_00087260,g_active_hud_panel,DAT_0023cca4);
  /* bitmap_blit_to_framebuffer doesn't take a real "transparent mode"
     parameter -- it reads the global g_blit_transparent_mode instead (see its own
     definition in graphics.c: g_blit_transparent_mode==0 draws every source byte
     opaquely via the palette, nonzero skips byte==0 as the transparent
     key). Every OTHER caller in this file that wants transparency sets
     this global around the call (draw_sprite_by_id, mode_icon_highlight_on,
     mode_icon_highlight_off all do `g_blit_transparent_mode = 1; ...; g_blit_transparent_mode = 0;`) --
     this call's own trailing literal `1` argument clearly intended the
     same thing (it's not a real parameter bitmap_blit_to_framebuffer
     reads at all, just a leftover Ghidra also emitted at the other
     sites where it happens to coincide with the real fix), but nothing
     here ever sets the global, so this panel background blit ran
     opaque -- painting every transparent-keyed pixel in the panels.GR
     source (byte value 0) as solid black instead of leaving the
     background visible underneath. This is the inventory-area "black
     box" bug (uw.c's own DAT_0023cca4 decode is real panels.GR pixel
     data, confirmed via UW_DEBUG_DRAW framebuffer dumps -- the missing
     piece was purely this transparency-mode flag). */
  g_blit_transparent_mode = 1;
  bitmap_blit_to_framebuffer(0xec,8,DAT_0023cca4,0x72,0x53,0,0,1);
  g_blit_transparent_mode = 0;
  (*(code *)(&g_hud_panel_handlers)[g_active_hud_panel])();
  FUN_00076508();
  return;
}




// was FUN_0006cff4 -- generic "set HUD status slot param_1 to
// param_2" dispatcher: negative param_1 writes a raw byte value
// directly, 0/1 compute a health/mana fill tier (0-12) from the
// player object via Ordinal_2005 (see hud_vitals_bar_tick), and other
// small param_1 values (2,3,4,6,7,8 -- seen at this session's various
// call sites) drive other HUD indicators (compass heading, action-
// animation frame, poison flash, etc.) each with their own encoding.
void set_hud_status_value(param_1,param_2)
byte param_1;
ushort param_2;

{
  int iVar1;
  char cVar2;
  byte bVar3;
  undefined1 uVar4;
  ushort uVar5;
  ushort uVar6;
  
  iVar1 = (int)(char)param_1;
  uVar4 = (undefined1)param_2;
  if (iVar1 < 0) {
LAB_0006d09c:
    DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << (uint)param_1);
    (&DAT_0023c118)[iVar1] = uVar4;
    return;
  }
  if (iVar1 < 2) {
    if (iVar1 == 1) {
      cVar2 = *(char *)(DAT_00086df8 + 0x38);
    }
    else {
      cVar2 = *(char *)(DAT_0023be74 + 4);
    }
    if (cVar2 == '\0') {
      (&DAT_0023c118)[iVar1] = 0;
    }
    else {
      uVar4 = Ordinal_2005(cVar2,(short)param_2 * 0xc);
      (&DAT_0023c118)[iVar1] = uVar4;
    }
    if (0xb < (byte)(&DAT_0023c118)[iVar1]) {
      (&DAT_0023c118)[iVar1] = 0xc;
    }
    goto LAB_0006d17c;
  }
  if (iVar1 == 2) {
    if (param_2 == DAT_0023c12a) {
      return;
    }
    DAT_0023c11a = uVar4;
    DAT_0023c1d8 = DAT_0023c1d8 | 4;
    return;
  }
  if (iVar1 == 3) {
    if (param_2 == 9) {
      DAT_0023c11b = uVar4;
      DAT_0023c1d8 = DAT_0023c1d8 | 8;
      return;
    }
    DAT_0023c11b = uVar4;
    DAT_0023c1e0 = DAT_0023c1e0 | 8;
    return;
  }
  if (iVar1 != 4) {
    if (iVar1 == 6) {
      if (g_active_hud_panel == '\x04') {
        return;
      }
    }
    else if (iVar1 == 8) {
      if ((DAT_000870d8 != DAT_000870dc) && (DAT_0023c120 == '\x06')) {
        return;
      }
      DAT_0023c120 = uVar4;
      DAT_0023c1dc = DAT_0023c1dc | 0x100;
      return;
    }
    goto LAB_0006d09c;
  }
  if (DAT_0023c11c == param_2) {
    return;
  }
  uVar6 = (ushort)DAT_0023c11d;
  if (uVar6 == param_2) {
    return;
  }
  if (DAT_0023c12c == param_2) {
    return;
  }
  uVar5 = (ushort)DAT_0023c12d;
  if (uVar5 == param_2) {
    return;
  }
  if (DAT_0023c12c == 0) {
joined_r0x0006d150:
    if (uVar5 == 0) {
      bVar3 = Ordinal_1053();
      param_1 = (bVar3 & 1) + param_1;
    }
  }
  else if (uVar5 == 0) {
LAB_0006d164:
    param_1 = 5;
  }
  else {
    uVar5 = uVar6;
    if (DAT_0023c11c == 0) goto joined_r0x0006d150;
    if (uVar6 == 0) goto LAB_0006d164;
  }
  /* Was `(&DAT_0023c118)[(char)param_1] = uVar4;` -- correct for the
     iVar1<2 (health/mana) branch above, which jumps straight to
     LAB_0006d17c without reaching this line, but this specific write
     only executes for the iVar1==4 dragon-reaction branch, where
     param_1 is 4 or 5 (the resolved left/right dragon side). In the
     original 32-bit binary DAT_0023c118+4/+5 IS the same memory as
     DAT_0023c11c/DAT_0023c11d (see their own comments) -- an address
     coincidence this decompile's split, unrelated C globals don't
     preserve. hud_dragon_reaction_tick (the function this value is FOR)
     reads it back as `(&DAT_0023c11c)[iVar6]` where iVar6=param_1-4,
     never DAT_0023c118 at all -- so on this host the old line silently
     wrote a value nothing ever read, and hud_dragon_reaction_tick's own
     "has a reaction been requested" gate (`(&DAT_0023c11c)[iVar6] !=
     0`) was never satisfied, meaning the whole dragon reaction/wing-
     flap animation this function drives never started, no matter how
     many times set_hud_status_value(4,...) was called (e.g. every
     message-scroll line, msg_scroll_scroll_up_line). Write to the real
     target instead. */
  (&DAT_0023c11c)[param_1 + -4] = uVar4;
LAB_0006d17c:
  DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << (uint)param_1);
  return;
}



// was FUN_0006d284
void hud_panel_redraw_dispatch()

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  uint uVar5;
  byte bVar6;
  int iVar7;
  bool bVar8;
  int iVar9;

  bVar2 = read_realtime_clock_units();
  bVar8 = false;
  if (DAT_0023c1e0 != 0) {
    iVar7 = 1;
    iVar9 = 0;
    uVar4 = DAT_0023c1e0;
    do {
      uVar1 = (ushort)iVar7;
      if ((uVar1 & uVar4) != 0) {
        (*(code *)(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
        uVar4 = DAT_0023c1e0 & ~uVar1;
        bVar8 = true;
        DAT_0023c1e0 = uVar4;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)uVar1 << 0x11) >> 0x10;
    } while (iVar9 < 9);
  }
  bVar6 = DAT_0023c150;
  if (((DAT_0023c150 ^ bVar2) & 0xe0) != 0) {
    iVar7 = 1;
    iVar9 = 0;
    do {
      if (((ushort)iVar7 & DAT_0023c1dc) != 0) {
        (*(code *)(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
        bVar6 = DAT_0023c150;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)(ushort)iVar7 << 0x11) >> 0x10;
    } while (iVar9 < 9);
    bVar8 = true;
  }
  if (((bVar6 ^ bVar2) & 0xc0) != 0) {
    sVar3 = Ordinal_1053();
    if (sVar3 < 0x666) {
      uVar5 = (int)sVar3 & 1;
      if (*(int *)(&DAT_0023c1f0 + uVar5 * 4) == 0) {
        *(int *)(&DAT_0023c1f0 + uVar5 * 4) = 1;
        DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << uVar5);
      }
    }
    sVar3 = Ordinal_1053();
    if (sVar3 < 0x666) {
      uVar5 = (int)sVar3 & 1;
      if (*(int *)(&DAT_0023c1f8 + uVar5 * 4) == 0) {
        *(int *)(&DAT_0023c1f8 + uVar5 * 4) = 1;
        DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << uVar5);
      }
    }
    iVar7 = 1;
    iVar9 = 0;
    if (getenv("UW_DEBUG_CLICKREGION") && DAT_0023c1d8 != 0)
      fprintf(stderr, "[stats] hud_panel_redraw_dispatch: DAT_0023c1d8=0x%x clock-gate open, scanning\n", (unsigned)DAT_0023c1d8);
    do {
      if (((ushort)iVar7 & DAT_0023c1d8) != 0) {
        if (getenv("UW_DEBUG_CLICKREGION"))
          fprintf(stderr, "[stats] hud_panel_redraw_dispatch: dispatching g_hud_panel_ticker_handlers[%d] (table index %d)\n", iVar9, iVar9 + 4);
        (*(code *)(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)(ushort)iVar7 << 0x11) >> 0x10;
    } while (iVar9 < 9);
    bVar8 = true;
  }
  if (bVar8) {
    FUN_00076508();
    DAT_0023c150 = bVar2;
  }
  return;
}



// was FUN_0006d4a4
void hud_vitals_bar_tick(param_1)
short param_1;

{
  int iVar1;
  uint uVar2;
  int iVar3;
  short sVar4;
  short sVar5;
  undefined4 uVar6;
  byte *pbVar7;
  uint uVar8;
  uint uVar9;
  short *psVar10;
  short *psVar11;
  ushort local_30;
  short local_2e;
  short local_2c;
  
  uVar2 = (uint)param_1;
  if (uVar2 == 0) {
    if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) == 0) {
      local_30 = 0x200c;
      local_2c = 0x2019;
      local_2e = 0x2024;
      if ((0x204a < DAT_00087254) && (DAT_00087254 < 0x2057)) {
        hud_vitals_threshold_shake(0);
        DAT_00087254 = DAT_00087254 + -0x32;
      }
    }
    else {
      local_30 = 0x203e;
      local_2c = 0x204b;
      local_2e = 0x2056;
      if ((0x2018 < DAT_00087254) && (DAT_00087254 < 0x2025)) {
        hud_vitals_threshold_shake(0);
        DAT_00087254 = DAT_00087254 + 0x32;
      }
    }
  }
  else {
    if (uVar2 != 1) {
      return;
    }
    local_30 = 0x2025;
    local_2c = 0x2032;
    local_2e = 0x203d;
  }
  iVar1 = uVar2 * 2;
  psVar11 = (short *)(&DAT_0023c244 + iVar1);
  if (*psVar11 == 0) {
    uVar6 = sprite_list_alloc_entry(0);
    *psVar11 = (short)uVar6;
    sprite_list_set_rect(uVar6,(int)*(short *)(&DAT_000870ec + iVar1),0x7e,0x18,0x21);
    uVar6 = sprite_list_alloc_entry(0);
    *(short *)(&DAT_0023c240 + iVar1) = (short)uVar6;
    sprite_list_set_rect(uVar6,0,0,0x18,4);
    uVar6 = sprite_list_alloc_entry(0);
    *(short *)(&DAT_0023c248 + iVar1) = (short)uVar6;
    sprite_list_set_rect(uVar6,(int)*(short *)(&DAT_000870ec + iVar1),0x7e,0x18,4);
  }
  pbVar7 = &DAT_0023c128 + uVar2;
  uVar8 = (uint)*pbVar7;
  iVar3 = (int)(((byte)(&DAT_0023c118)[uVar2] - uVar8) * 0x10000) >> 0x10;
  if (iVar3 < 1) {
    if (iVar3 < 0) {
      uVar9 = uVar8 + 0xff;
      sVar4 = *(short *)(&DAT_000870ec + iVar1);
      uVar8 = uVar9 & 0xff;
      *pbVar7 = (byte)uVar9;
      iVar3 = (int)(short)uVar8;
      sVar5 = (&DAT_000870f2)[iVar3];
      sprite_list_set_rect((int)*psVar11,(int)sVar4,(int)sVar5,0x18,
                   (&DAT_00087114)[iVar3]);
      sprite_list_set_lifetime((int)*psVar11,sVar5 + -0x7e);
      sprite_list_set_frame_id((int)*psVar11,0x2057);
      if (iVar3 != 0) {
        sprite_list_set_position((int)(short)(&DAT_0023c224)[uVar2],(int)*(short *)(&DAT_000870ec + iVar1),
                     (int)*(short *)(&DAT_000870f0 + iVar3 * 2));
        sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
      }
    }
    else if (*(int *)(&DAT_0023c1f0 + uVar2 * 4) == 0) {
      DAT_0023c1d8 = DAT_0023c1d8 & ~(ushort)(1 << (uVar2 & 0xff));
    }
  }
  else {
    uVar9 = uVar8 + 1;
    sVar4 = *(short *)(&DAT_000870ec + iVar1);
    uVar8 = uVar9 & 0xff;
    *pbVar7 = (byte)uVar9;
    sprite_list_set_position((int)(short)(&DAT_0023c224)[uVar2],(int)sVar4,
                 (int)*(short *)(&DAT_000870f0 + (short)uVar8 * 2));
    sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
  }
  if (((*(int *)(&DAT_0023c1f0 + uVar2 * 4) == 1) && (uVar9 = (uint)(short)uVar8, uVar9 < 8)) &&
     (uVar9 != 0)) {
    psVar11 = &DAT_00087254 + uVar2;
    if (*psVar11 == local_2e) {
      *psVar11 = local_2c;
      sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
      *(int *)(&DAT_0023c1f0 + uVar2 * 4) = 0;
    }
    else {
      psVar10 = (short *)(&DAT_000870f0 + uVar9 * 2);
      sprite_list_set_position((int)*(short *)(&DAT_0023c240 + iVar1),(int)*(short *)(&DAT_000870ec + iVar1),
                   (int)*psVar10);
      sVar4 = *(short *)(&DAT_0023c240 + iVar1);
      *psVar11 = *psVar11 + 1;
      sprite_list_set_frame_id((int)sVar4,(int)*psVar11);
      psVar11 = (short *)(&DAT_0023c248 + iVar1);
      sprite_list_set_lifetime((int)*psVar11,*psVar10 + -0x7e);
      sprite_list_set_position((int)*psVar11,(int)*(short *)(&DAT_000870ec + iVar1),(int)*psVar10);
      sprite_list_set_frame_id_transparent((int)*psVar11,0x2058);
    }
  }
  return;
}



// was FUN_0006d894, briefly named hud_damage_flash_tick by an earlier
// pass. Renamed again: despite the "damage" name, its 3 real callers
// (msg_scroll_scroll_up_line on every message-scroll line,
// sync_player_stats_to_hud on an HP/poison threshold, FUN_00027f14 on
// a trap/switch-type object trigger) are mostly unrelated to damage --
// "damage" only describes one of the three. What this function
// actually drives, dispatched via set_hud_status_value's status
// category 4/5 (param_1, left/right dragon) through
// g_hud_panel_handlers_table/g_hud_panel_ticker_handlers alongside its hud_X_tick
// siblings: a small state machine (param_1-4 -> iVar6, indexing every
// DAT_0023c11c/DAT_0023c12c-family global 0=left/1=right) that plays
// the dragon decoration's reactive TAIL whip (DAT_0023c238's frame,
// stepped through DAT_000871b8's per-side sequence) together with a
// short-lived HEAD-animation overlay sprite (DAT_0023c1e8's slot,
// distinct from DAT_0023c230's own static head sub-sprite) positioned
// via the recovered DAT_00087178/DAT_00087188/PTR_DAT_00087198/
// PTR_DAT_000871a8 rect table (see that table's own comment for the
// "drew at 0,0" bug this state machine's dormancy used to hide).
// "Dragon reacting to a HUD-worthy event" is the real generalization;
// the event doesn't have to be damage.
void hud_dragon_reaction_tick(param_1)
int param_1;

{
  int iVar1;
  uint uVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  short *psVar7;
  int iVar8;
  short *psVar9;
  int *piVar10;
  short *psVar11;
  short local_40 [8];
  short local_30 [6];
  
  local_40[0] = 0x206f;
  local_40[1] = 0x2073;
  local_40[2] = 0x2077;
  local_40[3] = 0x2081;
  local_40[4] = 0x2085;
  local_40[5] = 0x2089;
  local_30[0] = 0x2072;
  local_30[1] = 0x2076;
  local_30[2] = 0x207a;
  local_30[3] = 0x2084;
  local_30[4] = 0x2088;
  local_30[5] = 0x208c;
  uVar2 = (uint)(short)param_1;
  if ((uVar2 != 4) && (uVar2 != 5)) {
    return;
  }
  iVar6 = (param_1 + -4) * 0x10000 >> 0x10;
  iVar1 = iVar6 * 2;
  psVar11 = &DAT_0023c1e8 + iVar6;
  if (*psVar11 == 0) {
    g_blit_transparent_mode = 1;
    sVar4 = sprite_list_alloc_raw_entry(3,0x28,0x18);
    g_blit_transparent_mode = 0;
    *psVar11 = sVar4;
  }
  piVar10 = (int *)(&DAT_0023c1f8 + iVar6 * 4);
  if (*piVar10 == 1) {
    iVar5 = (int)DAT_0023c250;
    DAT_0023c250 = DAT_0023c250 + 1;
    sprite_list_set_frame_id((int)(short)(&DAT_0023c238)[iVar6],
                 *(undefined2 *)(&DAT_000871b8 + (iVar6 * 7 + iVar5) * 2));
    if (6 < DAT_0023c250) {
      DAT_0023c250 = 0;
      *piVar10 = 0;
    }
  }
  psVar7 = &DAT_0023c1e4 + iVar6;
  if (getenv("UW_DEBUG_DRAGON"))
    fprintf(stderr, "[dragon] tick param_1=%d iVar6=%d target=%d playing=%d\n", param_1, iVar6, (int)(&DAT_0023c11c)[iVar6], (int)(&DAT_0023c12c)[iVar6]);
  if ((*psVar7 == 0) && ((&DAT_0023c11c)[iVar6] != '\0')) {
    (&DAT_0023c12c)[iVar6] = (&DAT_0023c11c)[iVar6];
    *psVar7 = 1;
    if (getenv("UW_DEBUG_DRAGON"))
      fprintf(stderr, "[dragon] STARTED animation iVar6=%d playing=%d\n", iVar6, (int)(&DAT_0023c12c)[iVar6]);
  }
  cVar3 = (&DAT_0023c12c)[iVar6];
  if (cVar3 == '\0') {
    if (*piVar10 != 0) {
      return;
    }
    DAT_0023c1d8 = DAT_0023c1d8 & ~(ushort)(1 << (uVar2 & 0xff));
    return;
  }
  if (cVar3 == '\x01') {
    sVar4 = *psVar7;
    if (sVar4 == 1) {
      (&DAT_0023c11c)[iVar6] = 0;
      iVar5 = iVar6 * 6;
      sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                   (int)*(short *)(&DAT_00087188 + iVar5),
                   (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                   *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
      *(short *)(&DAT_0023c24c + iVar1) = local_40[iVar6 * 3];
      *(undefined2 *)(&DAT_0023c124 + iVar1) = 1;
      *psVar7 = 3;
LAB_0006dec8:
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      // HACK: was draw-then-check (`sprite_list_set_frame_id(...); if
      // (local_30[iVar6*3] < *psVar9) { reset-for-next-time; }`).
      // Confirmed via real ARM disassembly that this exact `<` and
      // draw-before-check order is what the original binary computes,
      // not a decompiler artifact -- but it means the call where the
      // counter first exceeds local_30[iVar6*3] (this reaction's own
      // last legitimate frame) still draws THAT out-of-range value
      // before resetting the counter for the next cycle. The frame
      // actually shown is local_40[iVar6*3+1], the START frame of a
      // completely different reaction type, briefly flashing here.
      // Confirmed live via a frame-id trace: 0x2070,0x2071,0x2072,
      // then 0x2073 (belongs to the trap/switch reaction, not this
      // scroll one) before resetting back to 0x206f. Harmless-looking
      // on the original hardware's real frame timing, clearly visible
      // on this port's -- deliberately deviating from authentic
      // behavior here (user's call) by resetting BEFORE drawing when
      // the counter overshoots, so the foreign frame is never actually
      // handed to sprite_list_set_frame_id (this cycle just redraws
      // its own start frame, local_40[iVar6*3], one call early instead).
      if (local_30[iVar6 * 3] < *psVar9) {
        *psVar9 = local_40[iVar6 * 3];
        *(short *)(&DAT_0023c124 + iVar1) = *(short *)(&DAT_0023c124 + iVar1) + -1;
      }
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      if ((&DAT_0023c11c)[iVar6] == '\0') {
        sVar4 = *(short *)(&DAT_0023c124 + iVar1);
LAB_0006df34:
        if (sVar4 != 0) {
          return;
        }
      }
LAB_0006df3c:
      sVar4 = 4;
    }
    else {
      if (sVar4 == 3) goto LAB_0006dec8;
      if (sVar4 != 4) {
LAB_0006ddf0:
        if (sVar4 != 5) {
          return;
        }
        FUN_00076488((int)*psVar11);
LAB_0006de00:
        (&DAT_0023c12c)[iVar6] = 0;
        *psVar7 = 0;
        return;
      }
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      // HACK: was `sprite_list_set_frame_id(...); if (*psVar9 <=
      // local_30[iVar6*3]) return;` -- i.e. draw first, THEN decide
      // whether the counter overshot. Confirmed via real ARM
      // disassembly (0x6de4c `cmp r2,r3` / 0x6de50 `ble`) that this
      // exact `<=` and draw-before-check order is what the original
      // binary computes, not a decompiler artifact. But it means the
      // draw already happened with an out-of-range value on the call
      // where the counter first exceeds local_30[iVar6*3] (the scroll
      // reaction's own last legitimate frame) -- the actual frame
      // shown is local_40[iVar6*3+1], the START frame of the NEXT
      // reaction type, briefly flashing in this reaction's overlay
      // right before it transitions away. Confirmed live via a
      // frame-id trace showing e.g. 0x2073 (belongs to a different
      // reaction entirely) drawn here. Harmless-looking on the
      // original hardware's real frame timing, clearly visible on
      // this port's -- deliberately deviating from authentic behavior
      // here (user's call) by checking BEFORE drawing instead, so the
      // out-of-range value is never actually handed to
      // sprite_list_set_frame_id.
      if (local_30[iVar6 * 3] < *psVar9) {
        goto LAB_0006de54;
      }
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      return;
LAB_0006de54:
      sVar4 = 5;
    }
    *psVar7 = sVar4;
  }
  else {
    if (cVar3 == '\x02') {
      sVar4 = *psVar7;
      if (sVar4 != 1) {
        if (sVar4 == 2) goto LAB_0006dd88;
        if (sVar4 != 3) {
          if (sVar4 != 4) goto LAB_0006ddf0;
          psVar9 = (short *)(&DAT_0023c24c + iVar1);
          sVar4 = *psVar11;
          *psVar9 = *psVar9 + -1;
          sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
          if (local_40[iVar6 * 3 + 1] <= *psVar9) {
            return;
          }
          goto LAB_0006de54;
        }
        psVar9 = (short *)(&DAT_0023c24c + iVar1);
        sVar4 = *psVar11;
        *psVar9 = *psVar9 + 1;
        sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
        iVar5 = iVar6 * 3 + 1;
        if (local_30[iVar5] < *psVar9) {
          *psVar9 = local_40[iVar5] + 2;
          *(short *)(&DAT_0023c124 + iVar1) = *(short *)(&DAT_0023c124 + iVar1) + -1;
        }
        if ((&DAT_0023c11c)[iVar6] == '\0') {
          sVar4 = *(short *)(&DAT_0023c124 + iVar1);
          goto LAB_0006df34;
        }
        goto LAB_0006df3c;
      }
      (&DAT_0023c11c)[iVar6] = 0;
      iVar8 = iVar6 * 3 + 1;
      iVar5 = iVar8 * 2;
      sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                   (int)*(short *)(&DAT_00087188 + iVar5),
                   (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                   *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
      sVar4 = local_40[iVar8];
      *(undefined2 *)(&DAT_0023c124 + iVar1) = 3;
      *(short *)(&DAT_0023c24c + iVar1) = sVar4;
      *psVar7 = 2;
LAB_0006dd88:
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      if ((int)*psVar9 <= local_40[iVar6 * 3 + 1] + 1) {
        return;
      }
    }
    else {
      if (cVar3 != '\x03') {
        return;
      }
      sVar4 = *psVar7;
      if (sVar4 == 1) {
        (&DAT_0023c11c)[iVar6] = 0;
        FUN_00076488((int)(short)(&DAT_0023c234)[iVar6]);
        iVar8 = iVar6 * 3 + 2;
        iVar5 = iVar8 * 2;
        sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                     (int)*(short *)(&DAT_00087188 + iVar5),
                     (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                     *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
        *(short *)(&DAT_0023c24c + iVar1) = local_40[iVar8];
        *(undefined2 *)(&DAT_0023c124 + iVar1) = 6;
        *psVar7 = 2;
      }
      else if (sVar4 != 2) {
        if (sVar4 == 3) {
          if (((&DAT_0023c11c)[iVar6] == '\0') &&
             (iVar6 = *(short *)(&DAT_0023c124 + iVar1) + -1,
             *(short *)(&DAT_0023c124 + iVar1) = (short)iVar6, iVar6 * 0x10000 >> 0x10 != 0)) {
            return;
          }
          *psVar7 = 4;
          return;
        }
        if (sVar4 != 4) {
          if (sVar4 != 5) {
            return;
          }
          FUN_00076488((int)*psVar11);
          sprite_list_set_frame_id((int)(short)(&DAT_0023c234)[iVar6],(&DAT_000871d8)[iVar6]);
          goto LAB_0006de00;
        }
        psVar9 = (short *)(&DAT_0023c24c + iVar1);
        sVar4 = *psVar11;
        *psVar9 = *psVar9 + -1;
        sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
        if (*psVar9 != local_40[iVar6 * 3 + 2]) {
          return;
        }
        goto LAB_0006de54;
      }
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      sprite_list_set_frame_id((int)sVar4,*psVar9); if (getenv("UW_DEBUG_DRAGON")) fprintf(stderr, "[dragon] set_frame iVar6=%d cVar3=%d frame=0x%x\n", iVar6, (int)cVar3, (unsigned)(unsigned short)*psVar9);
      if ((int)*psVar9 <= (int)local_30[iVar6 * 3 + 2]) {
        return;
      }
      *psVar9 = (short)((uint)((*psVar9 + -1) * 0x10000) >> 0x10);
    }
    *psVar7 = 3;
  }
  return;
}



// was FUN_0006df70 -- one of the 13 entries in g_hud_panel_handlers_table
// (the per-tick HUD panel redraw dispatch, alongside hud_vitals_bar_tick
// and hud_dragon_reaction_tick, its naming siblings). Steps the compass
// needle's displayed heading (DAT_0023c12a) one increment toward the
// player's real heading (DAT_0023c11a) each call, clearing the "needle
// dirty" bit in DAT_0023c1d8 once it catches up. Updates the needle
// sprite via sprite_list_set_frame_id (compass rose frame) and
// sprite_list_set_position (DAT_00087130/DAT_00087150, the needle's
// recovered per-heading ellipse position table -- see their own
// comments) using the two sprite-list slot handles allocated once at
// startup by redraw_hud_panels (DAT_0023c228/DAT_0023c22c).
void hud_compass_needle_tick()

{
  int iVar1;
  short sVar2;
  uint uVar3;
  uint uVar4;

  uVar4 = (uint)DAT_0023c12a;
  sVar2 = (short)(DAT_0023c11a - uVar4);
  iVar1 = (int)((DAT_0023c11a - uVar4) * 0x10000) >> 0x10;
  if (iVar1 == 0) {
    DAT_0023c1d8 = DAT_0023c1d8 & 0xfffb;
  }
  else {
    if (iVar1 < 0) {
      sVar2 = sVar2 + 0x10;
    }
    uVar3 = uVar4 + 1;
    if (8 < sVar2) {
      uVar3 = uVar4 - 1;
    }
    uVar4 = uVar3 & 0xf;
    sprite_list_set_frame_id((int)DAT_0023c228,(uVar3 & 3) + 0x2059);
    if (getenv("UW_DEBUG_COMPASS")) {
      fprintf(stderr, "[compass] heading=%u x=%d y=%d frame_id=0x%x\n", uVar4,
              (int)(short)(&DAT_00087130)[(short)uVar4], (int)(short)(&DAT_00087150)[(short)uVar4],
              (unsigned)uVar4 + 0x205d);
    }
    sprite_list_set_position((int)DAT_0023c22c,(int)(short)(&DAT_00087130)[(short)uVar4],
                 (int)(short)(&DAT_00087150)[(short)uVar4]);
    sprite_list_set_frame_id((int)DAT_0023c22c,uVar4 + 0x205d);
    DAT_0023c12a = (byte)uVar4;
  }
  return;
}




void tick_hud_panel_transition()

{
  int iVar1;

  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] tick_hud_panel_transition tick: current=%d target=%d in_progress=%d\n",
            (int)g_committed_hud_panel, (int)g_target_hud_panel, (int)DAT_0023c20c);
  if (g_committed_hud_panel != g_target_hud_panel) {
    if (DAT_0023c20c == 0) {
      DAT_0023c20c = 1;
      begin_hud_panel_flip(g_target_hud_panel,0xec,8,0x53,0x72);
      g_active_hud_panel = '\x04';
    }
    iVar1 = advance_hud_panel_flip();
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] tick_hud_panel_transition: advance_hud_panel_flip() -> %d\n", iVar1);
    if (iVar1 == 1) {
      g_committed_hud_panel = g_target_hud_panel;
      g_active_hud_panel = g_target_hud_panel;
      DAT_0023c20c = 0;
      DAT_0023c1d8 = DAT_0023c1d8 & 0xffbf;
      if (getenv("UW_DEBUG_CLICKREGION"))
        fprintf(stderr, "[stats] tick_hud_panel_transition: transition COMPLETE, now showing panel %d\n", (int)g_active_hud_panel);
    }
  }
  return;
}




void redraw_active_hud_panel()

{
  int iVar1;
  
  iVar1 = FUN_00041a78(s_panels_00087260,g_active_hud_panel,DAT_0023cca4);
  if (iVar1 == 0) {
    FUN_0007ea34(&DAT_00087298);
  }
  else {
    FUN_00057118();
    bitmap_blit_to_framebuffer(0xec,8,DAT_0023cca4,0x72,0x53,0,0,1);
    (*(code *)(&g_hud_panel_handlers)[g_active_hud_panel])();
    set_draw_color(0x1a);
    flush_dirty_rect_to_display(1);
    cursor_show_idle_tick();
  }
  return;
}




// was FUN_0007f208
undefined4 msg_scroll_draw_edges()

{
  int iVar1;
  
  draw_sprite_by_id(DAT_00250724 + 0x20d5,0xb,0xa9,0x1c,4);
  draw_sprite_by_id(DAT_00250724 + 0x20da,0x132,0xa9,0x1c,4);
  iVar1 = (int)DAT_00250724;
  DAT_00250724 = (short)(iVar1 + 1);
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 5) {
    DAT_00250724 = 0;
  }
  return 0;
}




// was FUN_0007f340
void msg_scroll_scroll_up_line(param_1)
int param_1;

{
  short sVar1;
  short sVar2;
  
  sVar1 = *(short *)(DAT_00250704 + 0xe);
  sVar2 = *(short *)(DAT_00250704 + 4);
  FUN_00012850((int)sVar2,((int)*(short *)(DAT_000879b0 + 6) + (int)sVar1) * 0x10000 >> 0x10,
               ((int)*(short *)(DAT_00250704 + 6) - (int)sVar2) * 0x10000 >> 0x10,
               ((sVar1 * -0x10000 >> 0x10) - (int)*(short *)(DAT_000879b0 + 6)) + param_1,sVar2,
               sVar1);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(*(undefined2 *)(DAT_00250704 + 4),*(undefined2 *)(DAT_00250704 + 10),
               *(undefined2 *)(DAT_00250704 + 6),param_1 + 1);
  if (DAT_00250704 == &g_msg_scroll_panel_state) {
    set_hud_status_value(4,1);
    msg_scroll_draw_edges();
  }
  else {
    FUN_0007f290();
  }
  return;
}



// was FUN_0007f454
void msg_scroll_more_prompt()

{
  undefined2 *puVar1;
  undefined1 uVar2;
  short sVar3;
  
  msg_scroll_scroll_up_line(((int)*(short *)(DAT_000879b0 + 6) + (int)*(short *)(DAT_00250704 + 10)) * 0x10000 >>
               0x10);
  sVar3 = *(short *)(DAT_00250704 + 10);
  uVar2 = *g_draw_color_index;
  *g_draw_color_index = 0xd4;
  draw_text_string(s__MORE__00087994,(int)*(short *)(DAT_00250704 + 0xc),(int)sVar3);
  FUN_0007f170(0,1);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(*(undefined2 *)(DAT_00250704 + 0xc),(int)sVar3,*(undefined2 *)(DAT_00250704 + 6),
               *(undefined2 *)(DAT_00250704 + 2));
  *g_draw_color_index = uVar2;
  DAT_00250710 = *(short *)(DAT_00250704 + 0x14) + -1;
  puVar1 = (undefined2 *)(DAT_00250704 + 0xc);
  *(char *)(DAT_00250704 + 8) = (char)*puVar1;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)*puVar1 >> 8);
  return;
}



// was FUN_0007f570 -- print a string to the message scroll, word-wrapped
// at ~0x31 columns (one FUN_0007f6fc call per line).
int message_scroll_print_wrapped(param_1)
char *param_1;

{
  undefined1 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  int extraout_r3;
  int extraout_r3_00;
  /* Ghidra split these into two locals (their own stack-offset names,
     0x54 and 0x23, differ by exactly 0x31 = sizeof(auStack_54)) -- same
     "adjacent stack locals are really one buffer" pattern fixed
     elsewhere this session. They ARE meant to be contiguous: when the
     word-wrap loop below finds no space within a 49-byte chunk,
     Ordinal_1407 returns NULL and the fallback `puVar4 = local_23`
     is meant to NUL-terminate right at auStack_54's own end (offset 49)
     -- not a separate, unrelated 3-byte buffer the C compiler is free to
     place anywhere. Without the merge, that terminator write misses
     auStack_54 entirely, so FUN_0007f6fc prints past its real content
     into whatever stack garbage follows until it happens to hit a zero
     byte -- confirmed via a real inscription message ("The writing
     reads: We attacked the entrance...") long enough to need this
     no-space-found fallback: it printed correctly up to the wrap point
     then trailed into garbage characters. */
  undefined1 auStack_54_backing [52];
  #define auStack_54 auStack_54_backing
  #define local_23 (auStack_54_backing + 49)

  iVar2 = (int)(short)DAT_00201b60;
  /* Debug: log every string handed to the message scroll.
     param_1 is NULL at the call sites that only flush a pending
     inline graphic token (FUN_0007863c). DAT_00201b60 (1 or 4) is the
     "message scroll is the active text sink" gate -- anything else is
     dropped on the floor, so note that too. */

    DEBUG(INFO, "[scroll] add %s\"%s\" (mode=%d)\n",
            (iVar2 == 1 || iVar2 == 4) ? "" : "DROPPED ",
            (param_1 != (char *)0x0) ? param_1 : "(inline-graphic)",
            iVar2);

  if (iVar2 == 1 || iVar2 == 4) {
    FUN_0007f094(iVar2);
    iVar2 = extraout_r3;
    if (DAT_00250708 != 0) {
      FUN_00057118();
      iVar2 = extraout_r3_00;
    }
    if (DAT_00250718 != 0) {
      iVar2 = (int)DAT_00250714;
    }
    if (DAT_00250718 != 0 && iVar2 != 1) {
      DAT_00250718 = 0;
      msg_scroll_panel_reset(0);
    }
    DAT_00250710 = *(undefined2 *)(DAT_00250704 + 0x14);
    DAT_0025071c = 0;
    *g_draw_color_index = *(undefined1 *)(DAT_00250704 + 0x16);
    *DAT_00084298 = 0x2a;
    uVar3 = Ordinal_1068(param_1);
    for (uVar3 = uVar3 & 0xffff; 0x31 < (uVar3 & 0xffff);
        uVar3 = ((short)uVar3 - iVar2) * 0x10000 >> 0x10) {
      Ordinal_1044(auStack_54,param_1,0x31);
      local_23[0] = 0;
      puVar4 = (undefined1 *)Ordinal_1407(auStack_54,0x20);
      if (puVar4 == (undefined1 *)0x0) {
        puVar4 = local_23;
      }
      uVar1 = *puVar4;
      *puVar4 = 0;
      iVar2 = ((int)puVar4 - (int)auStack_54) * 0x10000 >> 0x10;
      FUN_0007f6fc(auStack_54,1);
      *puVar4 = uVar1;
      param_1 = iVar2 + param_1;
    }
    Ordinal_1044(auStack_54,param_1,(short)uVar3 + 1);
    FUN_0007f6fc(auStack_54,0);
    DAT_00250720 = read_realtime_clock_units();
    if (DAT_00250708 != 0) {
      cursor_show_idle_tick();
    }
    iVar2 = (int)*(short *)(DAT_00250704 + 0x14);
  }
  else {
    iVar2 = -1;
  }
  return iVar2;
}
#undef auStack_54
#undef local_23




// was FUN_0007f7cc
void msg_scroll_draw_wrapped_span(param_1,param_2)
char * param_1;
undefined4 param_2;

{
  undefined2 *puVar1;
  char cVar2;
  undefined2 uVar3;
  uint uVar4;
  char *iVar5;
  undefined1 uVar6;
  int iVar7;
  /* Recursion-depth safety valve for the msg_scroll_draw_wrapped_span<->msg_scroll_wrap_split_line word-
     wrap pair: msg_scroll_wrap_split_line's search-for-a-space-to-split-on has no
     fallback once the remainder is down to a single character/space that
     still doesn't fit the remaining line width (its own retry at
     LAB_0007fc64 hands the SAME unshrinkable string straight back here),
     which is a genuine stack-overflow-via-infinite-recursion for that
     input, not a symptom of any pointer/memory bug already fixed this
     session (confirmed: reached with param_1==" " on a real run after
     every other known corruption source was already fixed). Rather than
     reverse-engineer the exact original cursor-reset semantics for that
     edge case, force this call to take the normal "print it" path once
     recursion goes needlessly deep -- printing slightly past the margin
     beats crashing the whole game over HUD message text. */
  static int s_wrap_recursion_depth = 0;
  s_wrap_recursion_depth++;

  iVar5 = 0;
  if ((g_scroll_control_codes_enabled != 0) && (*param_1 == '\\')) {
    cVar2 = param_1[1];
    param_1 = param_1 + 2;
    if (cVar2 < '6') {
      if (cVar2 == '5') {
        uVar6 = 0xc4;
      }
      else if ((cVar2 == '0') || (cVar2 == '1')) {
LAB_0007f860:
        uVar6 = 0x60;
      }
      else if (cVar2 == '2') {
        uVar6 = 0xf1;
      }
      else {
        if (cVar2 == '3') goto LAB_0007f860;
        if (cVar2 != '4') goto LAB_0007f8b8;
        uVar6 = 0xb4;
      }
LAB_0007f8b0:
      *g_draw_color_index = uVar6;
    }
    else {
      if (cVar2 == '6') {
        uVar6 = 0xd4;
        goto LAB_0007f8b0;
      }
      if (cVar2 == 'P') {
LAB_0007f894:
        FUN_0007f170(iVar5 + 200,1);
      }
      else if (cVar2 == 'm') {
        msg_scroll_more_prompt();
      }
      else if (cVar2 == 'p') {
        iVar5 = 400;
        goto LAB_0007f894;
      }
    }
LAB_0007f8b8:
    *(undefined1 *)(DAT_00250704 + 0x16) = *g_draw_color_index;
    *(undefined1 *)(DAT_00250704 + 0x17) = 0;
  }
  if (*(int *)(DAT_00250704 + 0x10) == 0) goto LAB_0007fa30;
  iVar5 = (int)*(short *)(DAT_00250704 + 10) + (int)*(short *)(DAT_000879b0 + 6);
  uVar3 = (undefined2)iVar5;
  iVar7 = (int)*(short *)(DAT_000879b0 + 6) + ((int)(iVar5) * 0x10000 >> 0x10);
  iVar5 = *(short *)(DAT_00250704 + 2) + 1;
  if ((int)DAT_00250710 - (int)(short)param_2 < 0) {
    if (iVar5 < iVar7) {
      msg_scroll_more_prompt();
      uVar3 = *(undefined2 *)(DAT_00250704 + 10);
    }
    else {
LAB_0007f9ac:
      iVar5 = *(short *)(DAT_00250704 + 0x14) + 1;
      *(char *)(DAT_00250704 + 0x14) = (char)iVar5;
      *(char *)(DAT_00250704 + 0x15) = (char)((uint)iVar5 >> 8);
    }
  }
  else {
    if (iVar7 <= iVar5) goto LAB_0007f9ac;
    /* Ghidra dropped msg_scroll_scroll_up_line's argument here: it's the
       bottom Y of the block to shift up -- cursor_y + line_h, i.e. uVar3
       as computed at the top of this function (msg_scroll_more_prompt's own call
       passes the identical expression). Without it the scroll ran with a
       garbage height and the last line was overwritten in place instead
       of the panel scrolling up. */
    msg_scroll_scroll_up_line((int)(short)uVar3);
    uVar3 = *(undefined2 *)(DAT_00250704 + 10);
    DAT_00250710 = DAT_00250710 + -1;
  }
  *(char *)(DAT_00250704 + 10) = (char)uVar3;
  *(char *)(DAT_00250704 + 0xb) = (char)((ushort)uVar3 >> 8);
  puVar1 = (undefined2 *)(DAT_00250704 + 0xc);
  *(char *)(DAT_00250704 + 8) = (char)*puVar1;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)*puVar1 >> 8);
  *(undefined1 *)(DAT_00250704 + 0x10) = 0;
  *(undefined1 *)(DAT_00250704 + 0x11) = 0;
  *(undefined1 *)(DAT_00250704 + 0x12) = 0;
  *(undefined1 *)(DAT_00250704 + 0x13) = 0;
LAB_0007fa30:
  iVar7 = measure_text_width(param_1);
  iVar5 = DAT_00250704;
  if (((*(short *)(DAT_00250704 + 8) + iVar7) * 0x10000 >> 0x10 < (int)*(short *)(DAT_00250704 + 6))
      || (32 < s_wrap_recursion_depth))
  {
    uVar4 = Ordinal_1068(param_1);
    if (param_1[(int)(((uVar4 & 0xffff) - 1) * 0x10000) >> 0x10] == '\n') {
      param_1[(int)(((uVar4 & 0xffff) - 1) * 0x10000) >> 0x10] = '\0';
      *(undefined1 *)(DAT_00250704 + 0x10) = 1;
      *(undefined1 *)(DAT_00250704 + 0x11) = 0;
      *(undefined1 *)(DAT_00250704 + 0x12) = 0;
      *(undefined1 *)(DAT_00250704 + 0x13) = 0;
      iVar5 = DAT_00250704;
    }
    draw_text_string(param_1,(int)*(short *)(iVar5 + 8),(int)*(short *)(iVar5 + 10));
    iVar5 = measure_text_width(param_1);
    iVar5 = *(short *)(DAT_00250704 + 8) + iVar5;
    *(char *)(DAT_00250704 + 8) = (char)iVar5;
    *(char *)(DAT_00250704 + 9) = (char)((uint)iVar5 >> 8);
  }
  else {
    msg_scroll_wrap_split_line(param_1,param_2);
  }
  s_wrap_recursion_depth--;
  return;
}



// was FUN_0007fb2c
void msg_scroll_wrap_split_line(param_1,param_2)
char * param_1;
undefined4 param_2;

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  char cVar6;

  /* Guard against infinite msg_scroll_draw_wrapped_span<->msg_scroll_wrap_split_line recursion on an
     empty string: msg_scroll_draw_wrapped_span sends param_1 here whenever its pixel width
     doesn't fit the remaining line width, but an empty string has zero
     width and can never be split any narrower -- every one of this
     function's exits below hands param_1 straight back to msg_scroll_draw_wrapped_span
     unchanged, which (if the line is already full) sends it right back
     here forever. There's nothing to wrap for an empty string, so just
     stop. Confirmed via a real crash: reached with param_1="" once (this
     session) the actual upstream bug (a lone-scalar DAT_00248418 palette
     table smashing ~10KB of adjacent memory on every palette install,
     since fixed) had already been eliminated, so this is a genuine
     separate edge case, not just a symptom of that corruption. */
  if (Ordinal_1068(param_1) == 0) {
    return;
  }
  pcVar3 = (char *)Ordinal_1407(param_1,0x20);
  if (pcVar3 != (char *)0x0) {
    cVar6 = ' ';
    do {
      *pcVar3 = '\0';
      sVar2 = measure_text_width(param_1);
      if ((int)*(short *)(DAT_00250704 + 8) + (int)sVar2 < (int)*(short *)(DAT_00250704 + 6))
      goto LAB_0007fc2c;
      pcVar4 = (char *)Ordinal_1407(param_1,0x20);
      *pcVar3 = ' ';
      pcVar3 = pcVar4;
    } while (pcVar4 != (char *)0x0);
  }
  iVar5 = Ordinal_1068(param_1);
  cVar6 = param_1[iVar5 + -1];
  pcVar3 = param_1 + iVar5 + -2;
  do {
    pcVar3[1] = cVar6;
    pcVar3 = pcVar3 + -1;
    cVar6 = *pcVar3;
    *pcVar3 = '\0';
    if (pcVar3 <= param_1) {
      /* Was `&s_scroll_newline_0008522c` -- confirmed via real ARM
         disassembly (0x7fc74: `ldr r0,[0x7fc88]`, and DAT_0007fc88's own
         stored value IS 0x8522c) that the original binary passes this
         exact same shared "\n" constant's address here too, so this
         isn't a porting artifact. But msg_scroll_draw_wrapped_span
         unconditionally self-NULs byte 0 of whatever buffer it's handed
         once it decides that buffer's last real char was '\n' (see its
         own comment/disassembly, confirmed no restore anywhere in that
         function) -- fine for every OTHER caller in this file, which
         all go through message_scroll_print_wrapped's own local
         auStack_54 copy first, but this is the ONE call site that
         invokes msg_scroll_draw_wrapped_span directly on the shared,
         permanent global, so hitting this fallback even once (confirmed
         live via an lldb watchpoint during ordinary Bragit dialogue --
         not some exotic edge case) permanently zeroes the "\n" every
         other caller in the game relies on, silently collapsing every
         later multi-line message (babl_menu's numbered responses among
         them) onto one line for the rest of the process's life. Give
         this call its own disposable copy instead of the shared
         original. */
      char local_newline_copy[2];
      local_newline_copy[0] = '\n';
      local_newline_copy[1] = '\0';
      msg_scroll_draw_wrapped_span(local_newline_copy,1);
      goto LAB_0007fc64;
    }
    sVar2 = measure_text_width(param_1);
  } while ((int)*(short *)(DAT_00250704 + 6) <= (int)*(short *)(DAT_00250704 + 8) + (int)sVar2);
LAB_0007fc2c:
  *pcVar3 = cVar6;
  cVar1 = pcVar3[1];
  *pcVar3 = '\n';
  pcVar3[1] = '\0';
  msg_scroll_draw_wrapped_span(param_1,1);
  *pcVar3 = cVar6;
  pcVar3[1] = cVar1;
  param_1 = pcVar3 + (cVar6 == ' ');
LAB_0007fc64:
  msg_scroll_draw_wrapped_span(param_1,param_2);
  return;
}



// was FUN_0007fc8c
void msg_scroll_panel_init(param_1,param_2,param_3,param_4,param_5)
int param_1;
int param_2;
int param_3;
int param_4;
int param_5;

{
  char *ctx;

  if (param_5 != 0) {
    set_draw_color(0xf1);
    rect_fill_or_save_restore(param_1 + 0xe,param_2 + 1,param_3 + -0xf,param_4 + -1);
  }
  set_draw_color(0x2a);
  rect_fill_or_save_restore(param_1,param_2,param_3,param_4);

  /* Populate the message-scroll context struct (DAT_00250704 ->
     g_msg_scroll_panel_state) from the region rectangle. An earlier session's own
     comment here claimed "the decompile lost this" from msg_scroll_panel_init's
     real body -- re-checked via a fresh Ghidra disassembly of 0x7fc8c
     this session and that's NOT accurate: the real function only draws
     the (up to) two background rects and tail-calls
     rect_fill_or_save_restore once more, nothing else -- this whole
     struct-populate block has no match in the real binary at this
     address. Left in place anyway (not reverted) because it's the only
     place currently seeding these fields at all, and empirically
     produces a correct, working panel (confirmed visually: the save/
     load name prompt and the save-slot description list both render
     correctly with it). Real ARM disassembly of msg_scroll_panel_reset (see its
     own comment) independently confirmed the byte layout this block
     writes to (+2 bottom_y, +4 left_x, +6 right_x, +8/+0xa draw cursor
     x/y, +0xc/+0xe new-line-reset x/y) is at least self-consistent with
     how the rest of the widget reads it. What's still missing: +0x00
     ("top y", read by msg_scroll_panel_reset's own erase-rect on every reset) was
     never written here either -- confirmed as the cause of that erase
     covering the whole screen instead of just this panel's own strip,
     fixed below by seeding it the same as +0x0e. Wherever the REAL
     populate code for this struct actually lives is still unknown; flagged
     for future investigation rather than solved here. */
  ctx = (char *)DAT_00250704;
  if (ctx != (char *)0x0) {
    *(short *)(ctx + 0x00) = (short)param_2;   /* top y (erase rect)   */
    *(short *)(ctx + 0x02) = (short)param_4;   /* bottom y             */
    *(short *)(ctx + 0x04) = (short)param_1;   /* left x               */
    *(short *)(ctx + 0x06) = (short)param_3;   /* right x              */
    *(short *)(ctx + 0x08) = (short)param_1;   /* draw cursor x        */
    *(short *)(ctx + 0x0a) = (short)(param_2 + 4); /* draw cursor y (small top margin) */
    *(short *)(ctx + 0x0c) = (short)param_1;   /* new-line left margin */
    *(short *)(ctx + 0x0e) = (short)param_2;   /* top y (scroll blit)  */
    *(int   *)(ctx + 0x10) = 0;                /* pending-newline flag */
    *(short *)(ctx + 0x14) = 0;                /* lines printed        */
    ctx[0x16] = 0x60;                          /* default text colour  */
    ctx[0x17] = 0;
  }
  return;
}



/* Every field-offset constant below that was written as a bare
   `DAT_00250704 + N` (no cast before the addition) was wrong -- half
   what it should be. DAT_00250704 is declared `undefined *`
   (uw.h: `typedef unsigned char undefined`), a real byte pointer, but
   these specific expressions were decompiled as if it scaled by
   sizeof(undefined2)==2, so every one of them landed N/2 bytes early.
   The OTHER offsets in this same function, written with an explicit
   `(char *)DAT_00250704 + N` cast placed *before* the addition, were
   already byte-correct -- this mixed styling (both forms decompiled
   from the same real ARM code, which is unambiguously byte-addressed
   throughout) is what hid the bug: half the fields in this "reset the
   scroll panel" struct landed at the right place, half didn't.
   Confirmed via real ARM disassembly (0x7fd14-0x7fdd8): the struct's
   real byte layout is top_y@0, bottom_y@2, left_x@4, right_x@6 (used
   by the rect_fill_or_save_restore call below), base_x@0xc, base_y@0xe
   (the panel's static origin, populated once by msg_scroll_panel_init),
   cur_x@8, cur_y@0xa (the live draw-cursor these get copied into on
   every reset -- this is the actual bug: cur_y was landing at byte 5,
   splitting a partial write across the middle of top_y/bottom_y's own
   bytes instead of the real cursor field, so it read back as garbage
   or zero and every scroll message before the first real scroll-up
   drew off in the weeds instead of at the panel's visible top row),
   and three more zeroed fields at 0x10/0x12/0x14 (a 0x11/0x13/0x15
   counterpart to each was already correct). Root cause of both the
   invisible "Enter a save name" prompt and the invisible save-slot
   list text -- same struct, same reset function, same bug. */
// was FUN_0007fce8
void msg_scroll_panel_reset(param_1)
int param_1;

{
  char *pStruct;
  undefined2 uVar1;
  int iVar2;

  if ((param_1 != 0) && (FUN_0007f094(), DAT_00250708 != 0)) {
    FUN_00057118();
  }
  set_draw_color(0x2a);
  pStruct = (char *)DAT_00250704;
  rect_fill_or_save_restore(*(short *)(pStruct + 4),*(short *)(pStruct + 0),
               (ushort)*(short *)(pStruct + 6) + 1,(ushort)*(short *)(pStruct + 2) + 1);
  uVar1 = *(undefined2 *)(pStruct + 0xe);
  *(char *)(pStruct + 0xa) = (char)uVar1;
  *(char *)(pStruct + 0xb) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(pStruct + 0xc);
  *(char *)(pStruct + 8) = (char)uVar1;
  *(char *)(pStruct + 9) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(pStruct + 0x10) = 0;
  *(undefined1 *)(pStruct + 0x11) = 0;
  *(undefined1 *)(pStruct + 0x12) = 0;
  *(undefined1 *)(pStruct + 0x13) = 0;
  *(undefined1 *)(pStruct + 0x14) = 0;
  *(undefined1 *)(pStruct + 0x15) = 0;
  if (DAT_00250704 == (undefined *)&g_msg_scroll_panel_state) {
    set_hud_status_value(4,1);
    iVar2 = msg_scroll_draw_edges();
  }
  else {
    iVar2 = FUN_0007f290();
  }
  if (param_1 != 0) {
    iVar2 = DAT_00250708;
  }
  if (param_1 != 0 && iVar2 != 0) {
    cursor_show_idle_tick();
  }
  return;
}







// was FUN_0006cb74 -- snaps the compass dial (DAT_0023c228) and needle
// (DAT_0023c22c) sprites straight to the player's real current heading
// (DAT_0023c11a), unlike hud_compass_needle_tick's own one-increment-
// per-call stepping toward it via DAT_0023c12a (which this function
// never touches). Used where the needle shouldn't visibly animate into
// place -- e.g. on HUD panel open/reset.
void snap_compass_to_heading()

{
  byte bVar1;
  uint uVar2;

  bVar1 = DAT_0023c11a;
  uVar2 = (uint)DAT_0023c11a;
  sprite_list_set_frame_id((int)DAT_0023c228,(uVar2 & 3) + 0x2059);
  sprite_list_set_position((int)DAT_0023c22c,(int)(short)(&DAT_00087130)[(short)(ushort)bVar1],
               (int)(short)(&DAT_00087150)[(short)(ushort)bVar1]);
  sprite_list_set_frame_id((int)DAT_0023c22c,uVar2 + 0x205d);
  FUN_00076508();
  return;
}



// was FUN_0006cbf0 -- resets the HUD panel subsystem's transient
// animation/selection state: zeroes the two 9-entry per-panel-button
// state arrays (DAT_0023c118/DAT_0023c128), hides the two sprites
// DAT_0023c1e8/DAT_0023c1ea via FUN_00076488, clears the active-panel
// selector (g_active_hud_panel) and the panel-switch animation counters
// hud_panel_wipe_transition_tick drives (DAT_0023c220 and friends), and reseeds
// DAT_0023c11f/DAT_0023c120/DAT_0023c130/DAT_000870e0/DAT_000870e4 back
// to their startup defaults (matching redraw_hud_panels's own initial
// values for the latter two).
void reset_hud_panel_animation_state()

{
  int iVar1;

  iVar1 = 0;
  do {
    (&DAT_0023c118)[iVar1] = 0;
    (&DAT_0023c128)[iVar1] = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 9);
  FUN_00076488((int)DAT_0023c1e8);
  FUN_00076488((int)DAT_0023c1ea);
  DAT_0023c1e6 = 0;
  g_active_hud_panel = 0;
  DAT_0023c1e4 = 0;
  DAT_0023c220 = 0;
  DAT_0023c1d8 = DAT_0023c1d8 & 0xff7f;
  DAT_0023c11f = 4;
  DAT_0023c120 = 6;
  DAT_0023c130 = 6;
  DAT_000870e0 = 6;
  DAT_000870e4 = 0;
  FUN_00076508();
  return;
}






// was thunk_FUN_0006edb8 -- Ghidra's own name (not related to the
// unrelated, differently-addressed release_hud_panel_flip_grtiles defined later in this
// file, despite the identical-looking suffix -- this project's
// established split-symbol/naming-collision bug class, not a real
// thunk relationship). Releases the 3 grtile handles
// (DAT_0023c200/202/204, see that array's own declaration comment)
// backing the HUD panel-switch wipe transition, clearing each that's
// still set via the currently-no-op FUN_0004995c.
void release_panel_wipe_grtiles()

{
  int iVar1;

  iVar1 = 0;
  do {
    if ((&DAT_0023c200)[iVar1] != 0) {
      FUN_0004995c();
      (&DAT_0023c200)[iVar1] = 0;
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  return;
}






// was FUN_0006e038 -- updates a small HUD status-icon sprite
// (DAT_0023c254, allocated on first use) from the state code
// DAT_0023c11b (0..0xd/13; out-of-range values leave the icon alone).
// Most values just select a single static frame (0x2098 + value); the
// special value 9 instead cycles through frames 0x2098+DAT_00087258
// (wrapping 9..0xd) once per call, matching an animated variant of
// whatever this icon represents, and sets bit 3 of DAT_0023c1d8 (a
// "dirty"/"animating" flag other icons in this cluster also use, e.g.
// hud_compass_needle_tick's own bit 2). Exact icon identity not
// confirmed (no icon-name string or comment found nearby) -- named for
// its mechanism, not its meaning.
void update_hud_status_icon_frame()

{
  uint uVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;

  cVar2 = DAT_0023c11b;
  uVar1 = (uint)DAT_0023c11b;
  if ((-1 < (int)uVar1) && ((int)uVar1 < 0xe)) {
    if (DAT_0023c254 == 0) {
      uVar3 = sprite_list_alloc_entry(0);
      DAT_0023c254 = (short)uVar3;
      sprite_list_set_rect(uVar3,4,0x8c,1,1);
    }
    if (uVar1 == 9) {
      iVar4 = (int)DAT_00087258;
      DAT_00087258 = DAT_00087258 + 1;
      sprite_list_set_frame_id((int)DAT_0023c254,iVar4 + 0x2098);
      if (0xd < DAT_00087258) {
        DAT_00087258 = 9;
      }
      DAT_0023c1d8 = DAT_0023c1d8 | 8;
    }
    else {
      if (DAT_0023c258 == 9) {
        DAT_00087258 = 9;
      }
      sprite_list_set_frame_id((int)DAT_0023c254,(uVar1 & 0xffff) + 0x2098);
      DAT_0023c1d8 = DAT_0023c1d8 & 0xfff7;
    }
    DAT_0023c258 = (short)cVar2;
  }
  return;
}






// was FUN_0006e1d4 -- per-tick driver for the small HUD panel-switch
// wipe-transition icon (sprite handle DAT_0023c21c, same one
// snap_compass_to_heading's sibling reset_hud_panel_animation_state resets
// to frame 0x20a6 ("idle") and redraw_hud_panels allocates at a 1x1
// screen position). Steps a wipe-progress counter (DAT_0023c12f)
// toward its target (DAT_0023c11f, advanced by 4 each time it's caught
// up to) via a small state machine (DAT_0023c220/DAT_0023c25c) that
// selects successive frames from the table at 0x87200, then resets
// everything back to idle once DAT_0023c220 exceeds 5.
void hud_panel_wipe_transition_tick()

{
  int iVar1;

  if ((uint)DAT_0023c12f == (uint)DAT_0023c11f) {
    DAT_0023c220 = 2;
    DAT_0023c25c = 0;
  }
  else {
    if ((uint)DAT_0023c12f == DAT_0023c11f - 4) goto LAB_0006e244;
    if (DAT_0023c25c != 0) {
      DAT_0023c220 = 2;
      DAT_0023c25c = 0;
    }
    DAT_0023c12f = DAT_0023c11f;
  }
  DAT_0023c11f = DAT_0023c11f + 4;
LAB_0006e244:
  iVar1 = (int)DAT_0023c220;
  if ((iVar1 == 3) && (DAT_0023c25c < 0x10)) {
    DAT_0023c25c = DAT_0023c25c + 1;
  }
  else {
    DAT_0023c220 = DAT_0023c220 + 1;
    sprite_list_set_frame_id((int)DAT_0023c21c,
                 (uint)DAT_0023c12f * 3 + -3 + (uint)*(ushort *)(iVar1 * 2 + 0x87200));
  }
  if (5 < DAT_0023c220) {
    DAT_0023c25c = 0;
    DAT_0023c220 = 0;
    DAT_0023c12f = 0;
    sprite_list_set_frame_id((int)DAT_0023c21c,0x20a6);
    DAT_0023c1d8 = DAT_0023c1d8 & 0xff7f;
  }
  return;
}






// was FUN_0006e96c -- the "ready to cast" rune-slot icon updater (see
// DAT_0023c268's own declaration comment): allocates 3 icon sprites on
// first use (positioned via DAT_00087210) and, for each of the 3
// selected-rune bytes at param_1[0..2], either shows the matching rune
// icon (value+0xe8) or hides the slot (value >= 0x18).
void update_ready_rune_slot_icons(param_1)
/* Was `int`, truncating the real pointer callers pass (DAT_00086df8 +
   0x47, DAT_00086df8 being a genuine `char *`). */
char *param_1;

{
  undefined4 uVar1;
  int iVar2;
  
  if (DAT_0023c268 == 0) {
    iVar2 = 0;
    g_blit_transparent_mode = 1;
    do {
      uVar1 = sprite_list_alloc_raw_entry(1,0x10,0x10);
      (&DAT_0023c268)[iVar2] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087210)[iVar2],0x8b,0x10,0x10);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
    g_blit_transparent_mode = 0;
  }
  iVar2 = 0;
  do {
    if (*(byte *)(iVar2 + param_1) < 0x18) {
      sprite_list_set_frame_id((int)(&DAT_0023c268)[iVar2],*(byte *)(iVar2 + param_1) + 0xe8);
    }
    else {
      FUN_00076488((int)(&DAT_0023c268)[iVar2]);
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 3);
  FUN_00076508();
  return;
}






// was FUN_0006ea54 -- HUD light-color indicator: shows up to 3 small
// icons (mirrored off the opposite screen edge from
// update_ready_rune_slot_icons's rune slots -- DAT_00087218's X
// positions decrease where DAT_00087210's increase, same sprite/icon
// infrastructure reused for a different purpose) representing the
// player's currently lit light sources' colors, driven by
// compute_light_source_colors's own output (see its comment, which
// names this function as its HUD consumer). Active only in the rarer
// game mode *(short*)(DAT_00085a6c+8)==1 (exact mode not identified).
void update_light_source_color_icons(param_1)
/* Same truncation bug as its sibling update_ready_rune_slot_icons above. */
char *param_1;

{
  undefined4 uVar1;
  int iVar2;
  
  if (*(short *)(DAT_00085a6c + 8) == 1) {
    if (DAT_0023c270 == 0) {
      iVar2 = 0;
      g_blit_transparent_mode = 1;
      do {
        uVar1 = sprite_list_alloc_raw_entry(1,0x10,0x12);
        (&DAT_0023c270)[iVar2] = (short)uVar1;
        sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087218)[iVar2],0x89,0x10,0x12);
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < 3);
      g_blit_transparent_mode = 0;
    }
    iVar2 = 0;
    do {
      if (*(byte *)(iVar2 + param_1) < 0x15) {
        sprite_list_set_frame_id((int)(&DAT_0023c270)[iVar2],*(byte *)(iVar2 + param_1) + 0x20c0);
      }
      else {
        FUN_00076488((int)(&DAT_0023c270)[iVar2]);
      }
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
    FUN_00076508();
  }
  return;
}






// was FUN_0006eb64 -- begins the HUD panel-switch flip transition to
// param_1 (the target panel): lazily allocates the 3 flip grtile slots
// (DAT_0023c200/202/204) on first use, cleaning up via
// release_hud_panel_flip_grtiles on failure, then captures the source
// panel's current screen content into DAT_0023c200 and draws+captures
// the target panel's content into DAT_0023c202 (restoring the source
// content to screen afterward) so advance_hud_panel_flip's first tick
// has both halves ready. Called once per transition by
// tick_hud_panel_transition, which then drives advance_hud_panel_flip
// every tick until it reports done.
void begin_hud_panel_flip(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined2 param_2;
undefined2 param_3;
undefined2 param_4;
undefined2 param_5;

{
  undefined1 uVar1;
  /* Was `ushort` -- too narrow for alloc_flip_grtile_slot's real 4-byte
     grtile key now that it's no longer a stub (harmless before, when
     it always returned 0). Still reused a few lines down as a plain
     0/1 success flag (FUN_00041a78's return), which fits fine in the
     wider type too. */
  undefined4 uVar2;
  ushort uVar3;
  /* Was `undefined4` -- truncated resolve_flip_grtile_slot's real
     pointer return (see its own comment) to 32 bits on this host
     before handing it to FUN_00041a78/bitmap_blit_to_framebuffer.
     Harmless while resolve_flip_grtile_slot was a stub always
     returning 0; a real truncated-pointer bug now that it isn't. */
  char *uVar4;
  /* Was `int` -- doubles as this loop's plain counter (0..2, fine
     either way) AND, further down, resolve_flip_grtile_slot's real
     pointer return used in pointer arithmetic (`iVar5 + 0x2800`),
     which does need the wider type now that that call isn't a stub. */
  intptr_t iVar5;
  ushort uVar6;

  uVar6 = 1;
  DAT_0023c140 = param_5;
  DAT_0023c144 = param_4;
  DAT_0023c148 = param_2;
  DAT_0023c14c = param_3;
  if (DAT_0023c278 == 0) {
    iVar5 = 0;
    do {
      if ((&DAT_0023c200)[iVar5] == 0) {
        uVar2 = alloc_flip_grtile_slot();
        /* Not decompiled -- see alloc_flip_grtile_slot's own comment.
           This slot's newly-allocated key was never actually stored
           back into the array, so this "already allocated?" check
           above would see 0 again on every subsequent call even after
           a real (non-stub) allocation succeeded -- invisible while
           the allocator was a stub (there was never a real key to
           lose), but a real bug once it does something. */
        (&DAT_0023c200)[iVar5] = uVar2;
        /* Was `uVar6 = uVar6 & uVar2;` -- a bitwise AND of the
           success accumulator against uVar2 directly made sense when
           uVar2 could only ever be the stub's constant 0, but uVar2 is
           now a real (large, effectively-arbitrary-bit-pattern) grtile
           key, so ANDing it directly could clear uVar6's low bit --
           and so the whole accumulator -- on a perfectly successful
           allocation just because that key's low bit happened to be
           0. Normalize to a real boolean success check instead. */
        uVar6 = uVar6 & (uVar2 != 0);
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 3);
    if (uVar6 == 0) {
      release_hud_panel_flip_grtiles();
    }
    else {
      g_flip_grtile_cache_ready = g_flip_grtile_cache_ready | 1;
    }
    DAT_0023c278 = 1;
  }
  if (getenv("UW_DEBUG_CLICKREGION"))
    fprintf(stderr, "[stats] begin_hud_panel_flip entry: param_1(target)=%d g_flip_grtile_cache_ready=0x%x DAT_0023c278=%d uVar6=%d\n",
            (int)param_1, (unsigned)g_flip_grtile_cache_ready, (int)DAT_0023c278, (int)uVar6);
  if ((g_flip_grtile_cache_ready & 1) != 0) {
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    uVar2 = FUN_00041a78(s_panels_00087260,param_1,uVar4);
    iVar5 = resolve_flip_grtile_slot(DAT_0023c200);
    uVar3 = FUN_00041a78(s_panels_00087260,3,iVar5 + 0x2800);
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] begin_hud_panel_flip: uVar4(dst202)=%u uVar2(decode1 ok)=%u iVar5(dst200)=%d uVar3(decode2 ok)=%u\n",
              (unsigned)uVar4, (unsigned)uVar2, iVar5, (unsigned)uVar3);
    if ((uVar2 & uVar3 & uVar6) == 0) {
      if (getenv("UW_DEBUG_CLICKREGION"))
        fprintf(stderr, "[stats] begin_hud_panel_flip: DECODE FAILED, calling FUN_0003c3c8(0x300e)\n");
      FUN_0003c3c8(0x300e);
    }
    FUN_00057118();
    /* Not decompiled -- capture the CURRENT (source/old panel's) live
       screen content into DAT_0023c200's offset-0 region (its
       0x2800 offset already holds the decoded chain graphic from
       just above, so this doesn't collide) before the target panel's
       content gets drawn over it below. Without this, advance_hud_panel_flip's
       first tick captured "whatever's currently on screen" into
       DAT_0023c200 believing it was grabbing the front (source) face
       of the flip -- but by that point this function had already
       drawn and captured the TARGET panel here, leaving it visible on
       screen, so DAT_0023c200 ended up with the same target content
       as DAT_0023c202. Both flip halves showed the target panel
       instead of source-then-target. QA: "clicking the chain does
       flip... but shows stats for both halves, should only switch at
       the edge-on midpoint." */
    uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
    FUN_0007e998(uVar4,0xec,8,0x53,0x72);
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    if (getenv("UW_DEBUG_CLICKREGION"))
      fprintf(stderr, "[stats] begin_hud_panel_flip: pre-draw blit source uVar4(dst202)=%u\n", (unsigned)uVar4);
    bitmap_blit_to_framebuffer(0xec,8,uVar4,0x72,0x53,0,0,1);
    uVar1 = g_active_hud_panel;
    g_active_hud_panel = (undefined1)param_1;
    DAT_00085c54 = 0;
    (*(code *)(&g_hud_panel_handlers)[(short)param_1])();
    DAT_00085c54 = 1;
    g_active_hud_panel = uVar1;
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    FUN_0007e998(uVar4,0xec,8,0x53,0x72);
    /* Not decompiled -- put the source content (just captured above)
       back on screen now that we're done using the screen as a
       scratch surface to capture the target. Otherwise the target
       panel stays visible here, and advance_hud_panel_flip's first tick's own
       (unchanged) "capture whatever's on screen into DAT_0023c200"
       step would just re-capture the target again, undoing the fix
       above. */
    uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
    bitmap_blit_to_framebuffer(0xec,8,uVar4,0x72,0x53,0,0,1);
    cursor_show_idle_tick();
  }
  DAT_0023c134 = (short)param_1;
  return;
}



// was FUN_0006edb8 -- byte-for-byte identical body to
// release_panel_wipe_grtiles (this project's established split-symbol/
// naming-collision bug class -- see that function's own comment; not
// merged into one, kept as separately-named/addressed functions per
// this project's convention of preserving what Ghidra recovered).
// Releases the 3 flip grtile handles (DAT_0023c200/202/204), called by
// begin_hud_panel_flip on allocation failure.
void release_hud_panel_flip_grtiles()

{
  int iVar1;

  iVar1 = 0;
  do {
    if ((&DAT_0023c200)[iVar1] != 0) {
      FUN_0004995c();
      (&DAT_0023c200)[iVar1] = 0;
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  return;
}



// was FUN_0006edfc -- per-tick step of the HUD panel-switch flip
// animation begun by begin_hud_panel_flip: advances a multi-stage
// counter (DAT_0023c208, stages 1-7) drawing the squashed-panel flip
// visual at each stage via squash_hud_panel_flip_rows/rect_fill_or_save_restore/
// bitmap_blit_to_framebuffer, and finally swaps in the target panel
// (g_active_hud_panel/g_hud_panel_handlers) partway through. Returns
// true once the stage counter resets to 0 (transition complete),
// matching tick_hud_panel_transition's own use of the return value.
bool advance_hud_panel_flip()

{
  undefined1 uVar1;
  byte bVar2;
  /* Were `undefined4` -- truncated the real 64-bit pointers this
     function passes around (DAT_0023cca4 itself, and resolve_flip_grtile_slot's
     return value) to 32 bits on this host before handing them to
     bitmap_blit_to_framebuffer/squash_hud_panel_flip_rows/FUN_0007e998, which then
     reconstructed a wild pointer from just the low half. Same
     truncated-pointer-local class as everywhere else this session --
     this is what crashed the panel-switch wipe transition the first
     time it ever actually ran. */
  char *uVar3;
  char *uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  bool bVar10;
  /* Was `iVar7 + 0x2800` (iVar7 declared `int`) -- iVar7 is reused as
     a plain int scratch everywhere else in this function, but in the
     DAT_0023c208==4 stage it briefly holds resolve_flip_grtile_slot's
     real 64-bit pointer, truncated to 32 bits before the +0x2800
     offset, producing a wild address. Same pointer-truncation class
     as uVar3/uVar4 above; needs its own real-pointer local since
     iVar7's other uses in this function are genuine int arithmetic. */
  char *pFlipSrc4;
  
  uVar3 = DAT_0023cca4;
  bVar2 = DAT_0023c208 + 1;
  if ((g_flip_grtile_cache_ready & 1) != 0) {
    DAT_0023c208 = bVar2;
    FUN_00057118();
    uVar3 = resolve_flip_grtile_slot(DAT_0023c204);
    if (DAT_0023c208 == 1) {
      uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
      FUN_0007e998(uVar4,(int)(short)DAT_0023c148,(int)(short)DAT_0023c14c,(int)DAT_0023c144,
                   DAT_0023c140);
      squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
      set_draw_color(0xf1);
      iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
      iVar7 = (int)DAT_0023c144 - (int)DAT_0023c13c;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      iVar9 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      if (iVar9 < 0) {
        iVar9 = iVar9 + 1;
      }
      /* Not decompiled -- was `(iVar9 >> 1) - DAT_0023c14c`. Confirmed
         via real ARM disassembly (0006f21c-0006f24c) that the shipped
         binary genuinely computes it this way, so this is a real,
         never-fixed bug in the original game's own compiled code for
         this feature (which this whole investigation independently
         confirmed is never reachable in any shipped build -- never
         QA'd). QA (live): iVar9 (= DAT_0023c138-DAT_0023c140) stays
         small (0-7) across the whole animation -- DAT_0023c138 is a
         "should stay ~constant" height reference that actually
         wobbles up to 106% of DAT_0023c140 due to the same curve
         table's overshoot -- so the ORIGINAL buggy subtraction put
         the panel's edge-erase strips and its squashed-content blit
         ~15-16px ABOVE the panel's real top (DAT_0023c14c=8) instead
         of a few px below it ("draws 16 pixels too high"). First fix
         attempt just flipped the operand order (`DAT_0023c14c +
         delta`), which was closer but still wrong: it anchors the
         TOP edge at DAT_0023c14c and lets the panel grow downward as
         DAT_0023c138 overshoots, drifting a few extra px low each
         time the height wobbles ("shifts down a bit too much"). The
         correct fix keeps the panel's VERTICAL CENTER fixed (not its
         top) as its height wobbles -- `DAT_0023c14c -
         (iVar9 >> 1)` -- since top = center - height/2 =
         (DAT_0023c14c + DAT_0023c140/2) - DAT_0023c138/2 =
         DAT_0023c14c - (DAT_0023c138-DAT_0023c140)/2. Verified live:
         this keeps the computed center within 0.5px of the true
         center (DAT_0023c14c+DAT_0023c140/2) at every stage, vs. the
         addition version drifting up to 6px low at the most extreme
         wobble (stage 3/5, DAT_0023c138=120). */
      rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar9 >> 1 & 0xffffU),
                   (int)(short)DAT_0023c148 + (iVar7 >> 1 & 0xffffU),
                   (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
      iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
      iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      iVar9 = (int)DAT_0023c13c + (int)DAT_0023c144;
      if (iVar9 < 0) {
        iVar9 = iVar9 + 1;
      }
      /* Not decompiled -- same "16 pixels too high" fix as above. */
      rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar9 >> 1) & 0xffff,
                   (int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                   (int)DAT_0023c144 + (uint)DAT_0023c148,(uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff
                  );
      iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      /* Not decompiled -- same "16 pixels too high" fix as above,
         this time for the actual squashed-content blit position. */
      bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                   (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                   DAT_0023c13c,0,0,1);
    }
    else if (1 < DAT_0023c208) {
      if (DAT_0023c208 < 4) {
        uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
        squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
        set_draw_color(0xf1);
        iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar7 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        iVar9 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        /* Not decompiled -- "16 pixels too high" fix, see the
           identical block in the DAT_0023c208==1 branch above for the
           full explanation (disassembly-confirmed real bug, not a
           decompiler artifact). */
        rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar9 >> 1 & 0xffffU),
                     (int)(short)DAT_0023c148 + (iVar7 >> 1 & 0xffffU),
                     (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
        iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        iVar9 = (int)DAT_0023c13c + (int)DAT_0023c144;
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar9 >> 1) & 0xffff,
                     (int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                     (int)DAT_0023c144 + (uint)DAT_0023c148,
                     (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
        iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                     (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                     DAT_0023c13c,0,0,1);
      }
      else if (DAT_0023c208 == 4) {
        pFlipSrc4 = resolve_flip_grtile_slot(DAT_0023c200);
        set_draw_color(0xf1);
        iVar9 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar5 = (int)DAT_0023c144 + (int)DAT_0023c13c;
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        iVar8 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        if (iVar8 < 0) {
          iVar8 = iVar8 + 1;
        }
        iVar6 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar6 < 0) {
          iVar6 = iVar6 + 1;
        }
        /* Not decompiled -- "16 pixels too high" fix, see the
           DAT_0023c208==1 branch above for the full explanation. */
        rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar6 >> 1) & 0xffff,
                     (int)DAT_0023c14c - (iVar8 >> 1 & 0xffffU),
                     (uint)DAT_0023c148 + (iVar5 >> 1) & 0xffff,
                     (uint)DAT_0023c14c + (iVar9 >> 1) & 0xffff);
        iVar5 = -(int)DAT_0023c140 + 0x78;
        if (iVar5 < 0) {
          iVar5 = -(int)DAT_0023c140 + 0x79;
        }
        iVar9 = DAT_0023c144 + -3;
        if (iVar9 < 0) {
          iVar9 = DAT_0023c144 + -2;
        }
        bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar9 >> 1),
                     (int)(short)(iVar5 >> 1) - (int)(short)DAT_0023c14c,pFlipSrc4 + 0x2800,0x78,3,0,0,1
                    );
      }
      else if (4 < DAT_0023c208) {
        if (DAT_0023c208 < 8) {
          uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
          set_draw_color(0xf1);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          /* Was missing its 4th argument (y2) -- real disassembly
             (0006f3d8-0006f400) shows r3 genuinely computed as
             `(short)DAT_0023c14c + (short)(iVar7 >> 1)` right before
             the call, matching the same y1/y2-around-center pattern
             every other rect_fill_or_save_restore call in this
             function uses; the decompiler just dropped it from the
             call's C syntax. Previously left as the original 3-arg
             dropped-argument call because applying this fix crashed a
             few ticks later -- that turned out to be a side effect of
             FUN_0007e998/FUN_00041a78 being broken (this rect_fill
             finally actually running exposed their bugs, rather than
             being wrong itself); now that both are fixed, re-applying
             this fix is what it takes for the panel-flip's "erase old
             content" pass to bound itself correctly instead of wiping
             out the static flask/chain area below the panel with a
             leftover-register y2. */
          /* Not decompiled -- "16 pixels too high" fix, see the
             DAT_0023c208==1 branch above for the full explanation. */
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          iVar7 = (int)DAT_0023c138 + (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c140 + (uint)DAT_0023c14c,
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
          if (iVar5 < 0) {
            iVar5 = iVar5 + 1;
          }
          /* Not decompiled -- "16 pixels too high" fix (the
             squashed-content blit position itself this time). */
          bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                       (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                       DAT_0023c13c,0,0,1);
        }
        else if (DAT_0023c208 == 8) {
          uVar3 = resolve_flip_grtile_slot(DAT_0023c202);
          set_draw_color(0xf1);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          /* Was missing its 4th argument (y2) -- same dropped-argument
             bug as the sibling call above (real disassembly
             0006f56c-0006f594, identical instruction pattern);
             re-applied for the same reason (see that comment). Y1 also
             fixed for the same "16 pixels too high" bug as every other
             occurrence in this function (see DAT_0023c208==1 branch). */
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          iVar7 = (int)DAT_0023c138 + (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c140 + (uint)DAT_0023c14c,
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          bitmap_blit_to_framebuffer((int)(short)DAT_0023c148,(int)(short)DAT_0023c14c,uVar3,(int)DAT_0023c140,
                       DAT_0023c144,0,0,1);
          DAT_0023c208 = 0;
        }
      }
    }
    draw_sprite_by_id(DAT_0023c208 + 0x20b8,0x110,4,1,1);
    draw_sprite_by_id(DAT_0023c208 + 0x20b0,0x110,0x7a,1,1);
    cursor_show_idle_tick();
    goto LAB_0006f6c8;
  }
  if (DAT_0023c208 == '\x02') {
    DAT_0023c208 = bVar2;
    FUN_00041a78(s_panels_00087260,3,DAT_0023cca4);
    FUN_00057118();
    set_draw_color(0xf1);
    rect_fill_or_save_restore(0xec,8,0x13f,0x7a);
    draw_sprite_by_id(0x20bc,0x110,4,1,1);
    draw_sprite_by_id(0x20b4,0x110,0x7a,1,1);
    bitmap_blit_to_framebuffer(0x114,0xfffffffb,uVar3,0x78,3,0,0,1);
LAB_0006f008:
    cursor_show_idle_tick();
  }
  else {
    if (DAT_0023c208 == '\x05') {
      DAT_0023c208 = bVar2;
      FUN_00041a78(s_panels_00087260,(int)DAT_0023c134,DAT_0023cca4);
      FUN_00057118();
      set_draw_color(0xf1);
      rect_fill_or_save_restore(0x114,5,0x117,0x7d);
      uVar1 = g_active_hud_panel;
      g_active_hud_panel = (undefined1)DAT_0023c134;
      screen_backup_restore_rect(0xec,8,0x13f,0x7a);
      bitmap_blit_to_framebuffer(0xec,8,uVar3,0x72,0x53,0,0,1);
      (*(code *)(&g_hud_panel_handlers)[DAT_0023c134])();
      screen_backup_save();
      g_active_hud_panel = uVar1;
      draw_sprite_by_id(0x20b8,0x110,4,1,1);
      draw_sprite_by_id(0x20b0,0x110,0x7a,1,1);
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xec,8,0x13e,0x79);
      goto LAB_0006f008;
    }
    bVar10 = DAT_0023c208 == '\a';
    DAT_0023c208 = bVar2;
    if (bVar10) {
      DAT_0023c208 = 0;
    }
  }
  screen_backup_restore_rect(0xec,8,0x13f,0x7a);
LAB_0006f6c8:
  return DAT_0023c208 == 0;
}






// was FUN_0006f6e0 -- draws one stage of the HUD panel-flip's squashed-
// panel visual: looks up this stage's squash amount from the curve
// table u_dgijjjigd_G__000871e0 (indexed by param_3, the stage number)
// to compute DAT_0023c13c (squashed width) and DAT_0023c138 (current
// panel height) for this stage, then copies each destination column
// via copy_hud_panel_flip_column, sweeping the full source width
// (DAT_0023c144) across the narrower destination via a fixed-point
// accumulator (squashAccum/squashSrcCol) -- see the accumulator's own
// comment for why it's needed (the original per-call-site dropped-
// argument bugs made this a left-aligned crop instead of a real
// resample before being fixed).
void squash_hud_panel_flip_rows(param_1,param_2,param_3)
char *param_1;
char *param_2;
short param_3;

{
  /* Were `undefined4` -- truncated the real 64-bit source/dest pointers
     (already fixed to real pointers at advance_hud_panel_flip's call sites)
     back down to 32 bits on entry. Same pointer-truncation class as
     everywhere else this session. */
  short sVar1;
  wchar_t wVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  /* Not decompiled -- QA: "the panel should fully squish horizontally
     during the flip, ours just crops part of it". Root cause: every
     copy_hud_panel_flip_column() call site in this function (all disassembly-
     confirmed dropped-argument fixes from earlier this session)
     advances param_1 (source column) and param_2 (dest column) by
     exactly 1 EACH, every single call, with no exception anywhere in
     this function -- confirmed at the instruction level, not a
     decompiler artifact. Since the total number of calls always
     equals DAT_0023c13c (the squashed width, strictly less than
     DAT_0023c144's full 83 except at stage 0/8), that lockstep means
     param_1 only ever reaches the first DAT_0023c13c source columns
     and never reads the rest -- a left-aligned crop, not a resample.
     A real squash needs param_1 to sweep the FULL source width
     (DAT_0023c144) over the same DAT_0023c13c destination writes.
     Added a simple fixed-point accumulator (new, not decompiled) to
     do that: advance a running source-position accumulator by
     DAT_0023c144 on every destination column written, and step
     param_1 by however many whole source columns that accumulator
     just crossed -- so by the last destination column, param_1 has
     swept the entire source width, however narrow the destination
     got. param_2 keeps its original (correct) +1-per-call advance. */
  int squashAccum;
  int squashSrcCol;

  sVar6 = DAT_0023c144;
  iVar8 = (int)param_3;
  iVar11 = (int)DAT_0023c144;
  wVar2 = u_dgijjjigd_G__000871e0[iVar8 + 8];
  sVar3 = Ordinal_2005(100,iVar11 * wVar2);
  sVar1 = DAT_0023c140;
  iVar9 = (int)sVar3;
  iVar10 = (int)DAT_0023c140;
  DAT_0023c13c = sVar3;
  sVar4 = Ordinal_2005(100,u_dgijjjigd_G__000871e0[iVar8] * iVar10);
  sVar5 = Ordinal_2005((int)wVar2,100);
  if (sVar5 == 1) {
    sVar3 = (short)(sVar6 - iVar9);
    sVar6 = Ordinal_2005(((sVar6 - iVar9) * 0x10000 >> 0x10) + 1,iVar11);
    sVar6 = sVar6 + -1;
  }
  else {
    sVar6 = 1;
  }
  squashAccum = 0;
  squashSrcCol = 0;
  iVar11 = 0;
  if (iVar8 < 4) {
    iVar8 = (iVar10 - sVar4) * 0x10000 >> 0x10;
    iVar7 = iVar9 + ((iVar10 - sVar4) * 0x10000 >> 0x10);
    DAT_0023c110 = 0;
    iVar10 = iVar9 + iVar8 * 2;
    DAT_0023c138 = sVar4;
    if (0 < sVar3) {
      do {
        if (0 < sVar6) {
          iVar9 = 0;
          do {
            sVar1 = (short)iVar10;
            if (sVar1 < 1) {
              DAT_0023c110 = DAT_0023c110 + 1;
              DAT_0023c138 = DAT_0023c138 + -2;
              iVar10 = iVar7 * 2 + (int)sVar1;
            }
            else {
              iVar10 = (int)(short)(iVar8 << 1) + (int)sVar1;
            }
            /* Was `copy_hud_panel_flip_column();` -- dropped arguments. Real
               disassembly (0006f884-0006f8a4) shows param_1/param_2
               passed in as-is, then both incremented by 1 byte
               afterward -- confirmed identical at all 3 call sites
               in this function. */
            copy_hud_panel_flip_column(param_1,param_2);
            /* Not decompiled -- squash accumulator, see this
               function's own comment near its locals. */
            squashAccum = squashAccum + (int)DAT_0023c144;
            param_1 = param_1 + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
            squashSrcCol = squashAccum / (int)DAT_0023c13c;
            param_2 = param_2 + 1;
            iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
          } while (iVar9 < sVar6);
          iVar9 = (int)DAT_0023c13c;
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 * 0x10000 >> 0x10 < (int)sVar3);
    }
  }
  else {
    DAT_0023c138 = sVar1 * 2 - sVar4;
    iVar8 = (sVar4 - iVar10) * 0x10000;
    iVar7 = iVar8 >> 0x10;
    DAT_0023c110 = (short)((uint)iVar8 >> 0x10);
    iVar8 = ((sVar4 - iVar10) * 0x10000 >> 0x10) - iVar9;
    iVar10 = iVar7 * 2 - iVar9;
    if (0 < sVar3) {
      do {
        if (0 < sVar6) {
          iVar9 = 0;
          do {
            sVar1 = (short)iVar10;
            if (sVar1 < 0) {
              iVar10 = (int)(short)(iVar7 << 1) + (int)sVar1;
            }
            else {
              DAT_0023c110 = DAT_0023c110 + -1;
              DAT_0023c138 = DAT_0023c138 + 2;
              iVar10 = iVar8 * 2 + (int)sVar1;
            }
            /* Was `copy_hud_panel_flip_column();` -- same dropped-argument bug as
               the sibling branch above (real disassembly
               0006f96c-0006f988). */
            copy_hud_panel_flip_column(param_1,param_2);
            /* Not decompiled -- squash accumulator, see this
               function's own comment near its locals. */
            squashAccum = squashAccum + (int)DAT_0023c144;
            param_1 = param_1 + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
            squashSrcCol = squashAccum / (int)DAT_0023c13c;
            param_2 = param_2 + 1;
            iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
          } while (iVar9 < sVar6);
          iVar9 = (int)DAT_0023c13c;
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 * 0x10000 >> 0x10 < (int)sVar3);
    }
  }
  for (iVar9 = iVar9 - (int)sVar3 * (int)sVar6; iVar9 = iVar9 * 0x10000 >> 0x10, 0 < iVar9;
      iVar9 = iVar9 + -1) {
    /* Was `copy_hud_panel_flip_column();` -- same dropped-argument bug (real
       disassembly 0006f9ec-0006fa0c: leftover-rows loop). */
    copy_hud_panel_flip_column(param_1,param_2);
    /* Not decompiled -- squash accumulator, see this function's own
       comment near its locals. */
    squashAccum = squashAccum + (int)DAT_0023c144;
    param_1 = param_1 + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
    squashSrcCol = squashAccum / (int)DAT_0023c13c;
    param_2 = param_2 + 1;
  }
  DAT_0023c138 = sVar4;
  return;
}



// was FUN_0006fa28 -- copies one column of the HUD panel-flip's
// squashed panel content from a source column (param_1) into a
// destination column (param_2), stepping through rows via the current
// stage's DAT_0023c138/DAT_0023c140/DAT_0023c110/DAT_0023c13c/
// DAT_0023c144 state (set up by squash_hud_panel_flip_rows just
// before each call) to stretch, shrink, or pad the column as the
// panel's height changes across the flip animation.
void copy_hud_panel_flip_column(param_1,param_2)
undefined1 * param_1;
undefined1 * param_2;

{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short sVar7;

  sVar7 = DAT_0023c138 - DAT_0023c140;
  if (0 < DAT_0023c110) {
    iVar3 = 0;
    do {
      *param_2 = 0;
      param_2 = param_2 + DAT_0023c13c;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < DAT_0023c110);
  }
  sVar2 = DAT_0023c140;
  iVar3 = (int)sVar7;
  if (iVar3 == 0) {
    if (0 < DAT_0023c140) {
      iVar3 = 0;
      do {
        *param_2 = *param_1;
        param_2 = param_2 + DAT_0023c13c;
        param_1 = param_1 + DAT_0023c144;
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      } while (iVar3 < DAT_0023c140);
    }
    sVar2 = 0;
  }
  else if (iVar3 < 1) {
    sVar2 = Ordinal_2005(iVar3 + -1,(int)DAT_0023c140);
    iVar6 = 0;
    if (iVar3 < 0) {
      iVar4 = (sVar2 + 1) * 0x10000 >> 0x10;
      sVar1 = DAT_0023c144;
      do {
        if (iVar4 < 0) {
          iVar5 = 0;
          do {
            *param_2 = *param_1;
            iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
            param_2 = param_2 + DAT_0023c13c;
            param_1 = param_1 + DAT_0023c144;
            sVar1 = DAT_0023c144;
          } while (iVar4 < iVar5);
        }
        iVar6 = iVar6 + -1;
        param_1 = param_1 + sVar1;
      } while (iVar3 < iVar6 * 0x10000 >> 0x10);
    }
    sVar2 = (DAT_0023c138 - sVar7 * (short)(sVar2 + 1)) + -1;
  }
  else {
    /* Was `Ordinal_2005(iVar3 + 1)` -- missing its dividend argument.
       The sibling branch above (iVar3 < 1) makes the exact same call
       shape fully: `Ordinal_2005(iVar3 + -1,(int)DAT_0023c140)`
       (divisor=iVar3+/-1, dividend=DAT_0023c140), so by direct
       symmetry this one is missing `(int)DAT_0023c140` too. Unlike
       Ordinal_2005's own K&R "leftover register" idiom (safe on the
       original ARM ABI, where an unfilled argument register
       predictably still held the caller's last computed value), a
       dropped argument here is NOT safe on this x86-64 recompile --
       the reused register/stack slot holds architecture-mismatched
       garbage, not the original value. sVar1 becomes this loop's
       inner trip count, so garbage here produced an unbounded copy
       loop and a wild param_1/param_2 write -- the intermittent,
       ASLR-flaky crash/heap-corruption in this function. */
    sVar1 = Ordinal_2005(iVar3 + 1,(int)DAT_0023c140);
    iVar6 = 0;
    if (0 < iVar3) {
      do {
        if (0 < sVar1) {
          iVar4 = 0;
          do {
            *param_2 = *param_1;
            param_2 = param_2 + DAT_0023c13c;
            param_1 = param_1 + DAT_0023c144;
            iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
          } while (iVar4 < sVar1);
        }
        iVar6 = iVar6 + 1;
        *param_2 = *param_1;
        param_2 = param_2 + DAT_0023c13c;
        sVar2 = DAT_0023c140;
      } while (iVar6 * 0x10000 >> 0x10 < iVar3);
    }
    sVar2 = sVar2 - sVar7 * sVar1;
  }
  for (iVar3 = (int)sVar2; 0 < iVar3; iVar3 = (iVar3 + -1) * 0x10000 >> 0x10) {
    *param_2 = *param_1;
    param_2 = param_2 + DAT_0023c13c;
    param_1 = param_1 + DAT_0023c144;
  }
  if (0 < DAT_0023c110) {
    iVar3 = 0;
    do {
      *param_2 = 0;
      param_2 = param_2 + DAT_0023c13c;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < DAT_0023c110);
  }
  *param_2 = 0;
  return;
}
