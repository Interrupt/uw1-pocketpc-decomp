/* Weapon swing animation: frame loading/allocation, the request/draw
 * tick, and the weapon overlay redraw. Split out of uw.c (the
 * original monolithic decompile) once these functions' real roles
 * were confirmed.
 */
#include "headers/weapon_swing.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>



// was LAB_0006e324 -- load_weapon_swing_sprites's (weapons.GR loader)
// registrar callback (param_5), called once per loaded weapon-swing
// sprite frame with its raw (still-compressed) entry buffer, byte
// size, and 0-27 frame index. Ghidra couldn't resolve this address
// into a proper function (an indirect-jump/jumptable target it gave
// up on) and it was stubbed as a bare `return 0;` -- same wrong
// assumption already corrected once for alloc_door_frame_buffer (see
// its own comment). A no-op here made load_gr_resource_entries's
// overall result always fail even after the allocator below was
// fixed, AND meant nothing ever stored the loaded frames anywhere:
// weapon_swing_draw_tick (was FUN_0006fcb0) needs exactly this raw
// buffer per frame to decode and blit during a swing (see
// g_weapon_swing_raw_frames), matching doors' equivalent
// g_grtile_registry[] table one-for-one. Register it there instead of
// discarding it.
undefined4 weapon_swing_frame_loaded(void *buf, unsigned size, int idx)

{
  (void)size;
  if ((unsigned)idx < UW_WEAPON_SWING_FRAME_COUNT) {
    g_weapon_swing_raw_frames[idx] = buf;
  }
  return 1;
}

// was LAB_0006e2f4 -- load_weapon_swing_sprites's (weapons.GR loader,
// called when the player's weapon-hand contents change -- including
// empty-handed, which resolves to category 3/"fist") allocator
// callback (param_4). Ghidra couldn't resolve this address into a
// proper function (an indirect-jump/jumptable target it gave up on),
// the exact same wrong assumption already found and fixed once in
// this file for alloc_door_frame_buffer (see its own comment).
// Confirmed live via UW_DEBUG_COMBAT: weapons.GR's header and every
// requested frame's directory entry read fine (real, valid, non-zero
// sizes for all 28 frames of every category including the unarmed
// one), but load_gr_resource_entries failed immediately at the
// allocate-a-destination-buffer step on the very first frame, because
// this stub always returned NULL. Real allocator like its sibling.
void *weapon_swing_frame_alloc(param_1)
unsigned int param_1;

{
  return Ordinal_1041(param_1);
}




// was FUN_0006e360 -- sets the weapon-swing animation "category" to
// load (0-3, from the weapon-hand item's melee-weapon-stats byte 6, or
// 3 for empty-handed/fist -- see request_weapon_swing_graphic's own
// caller in refresh_player_equipment_effects) and marks the redraw-dirty bit that
// hud_panel_redraw_dispatch/advance_action_animation_frame eventually
// act on to actually load the sprite set (load_weapon_swing_sprites).
void request_weapon_swing_graphic(param_1)
char param_1;

{
  if (getenv("UW_DEBUG_COMBAT")) {
    fprintf(stderr, "[weapon-gfx] request_weapon_swing_graphic(param_1=%d) DAT_000870dc(loaded)=%d\n", (int)param_1, (int)DAT_000870dc);
  }
  DAT_000870d8 = param_1;
  if (((-1 < param_1) && (param_1 < '\x04')) || (DAT_000870dc != param_1)) {
    DAT_0023c1dc = DAT_0023c1dc | 0x100;
  }
  return;
}



// was FUN_0006e3ac -- loads WEAPONS.GR's 28-frame swing-animation
// sprite set for the requested weapon-swing category (DAT_000870d8,
// set by request_weapon_swing_graphic) plus its matching 28-byte
// timing/hit-data rows from WEAPONS.DAT, short-circuiting to success
// if that category is already loaded. Called from
// advance_action_animation_frame whenever the requested category
// changes.
byte load_weapon_swing_sprites()

{
  char stack0xffdc3240_buf [256];
  char *stack0xffdc3240_ptr;
  char cVar1;
  byte bVar2;
  byte bVar3;
  int iSeekResult;
  byte bVar4;
  char *pcVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  char acStack_118 [260];
  
  if (getenv("UW_DEBUG_COMBAT")) {
    fprintf(stderr, "[weapon-gfx] load_weapon_swing_sprites ENTRY: DAT_000870dc(loaded)=%d DAT_000870d8(requested)=%d\n",
            (int)DAT_000870dc, (int)DAT_000870d8);
  }
  if (DAT_000870dc == DAT_000870d8) {
    bVar2 = 1;
  }
  else {
    DAT_000870dc = DAT_000870d8;
    if ((DAT_000870d8 < '\x04') && (-1 < DAT_000870d8)) {
      g_weapon_swing_current_frame = 0;
      bVar2 = load_gr_resource_entries(s_weapons_0008727c,
                           ((int)DAT_000870d8 + (*(byte *)(DAT_00086df8 + 100) & 1) * -4 + 4) * 0x1c
                           ,0x1c,&weapon_swing_frame_alloc,&weapon_swing_frame_loaded);
      iVar8 = (int)DAT_000870d8;
      bVar3 = *(byte *)(DAT_00086df8 + 100);
      pcVar5 = &DAT_0023cca8;
    stack0xffdc3240_ptr = acStack_118;
      do {
        cVar1 = *pcVar5;
        *stack0xffdc3240_ptr = cVar1; stack0xffdc3240_ptr = stack0xffdc3240_ptr + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      Ordinal_1063(acStack_118,s__DATA_weapons_dat_00087268);
      iVar6 = open_file_for_read(acStack_118);
      bVar2 = bVar2 & iVar6 != -1;
      if (iVar6 != -1) {
        /* Was `bVar3 = seek_file_handle(...)` truncated straight to a byte
           and then bitwise-&'d into bVar2's overall success flag below --
           seek_file_handle (SetFilePointer-shaped, see uw_file_seek) returns
           the real new file offset on success (fits fine in a byte here,
           but is not itself a 0/1 boolean) or -1 on failure, so `& 1`
           against an arbitrary offset like 136 (0x88, bit 0 clear) zeroed
           the whole AND chain even on a successful seek. Normalize to a
           real boolean first, matching every other success flag in this
           expression. */
        iSeekResult = seek_file_handle(iVar6,(int)((iVar8 + (bVar3 & 1) * -4 + 4) * 0x380000) >> 0x10,0);
        bVar3 = iSeekResult != -1;
        iVar8 = read_file_handle(iVar6,&g_weapon_swing_frame_x_offset,0x1c);
        iVar7 = read_file_handle(iVar6,&g_weapon_swing_frame_y_offset,0x1c);
        bVar4 = Ordinal_553(iVar6);
        bVar2 = iVar7 == 0x1c & bVar4 & bVar2 & bVar3 & iVar8 == 0x1c;
      }
    }
    else {
      bVar2 = 0;
    }
  }
  if (getenv("UW_DEBUG_COMBAT")) {
    fprintf(stderr, "[weapon-gfx] load_weapon_swing_sprites RESULT: bVar2=%d\n", (int)bVar2);
  }
  return bVar2;
}




// was FUN_0006fcb0 -- draws the weapon-swing sprite over the 3D
// viewport for the current frame of advance_action_animation_frame's
// state machine, gated on g_dungeon_view_active/g_weapon_overlay_enabled.
// Called from render_dungeon_frame_timed, right after
// render_dungeon_view() itself; render_dungeon_frame_timed is now
// wired into the normal per-tick render path too (see
// main_loop_hud_flush's forced-redraw hack).
void weapon_swing_draw_tick()

{
  short sVar1;
  /* Was `undefined4` -- decode_gr_entry_bitmap returns a real 64-bit
     bitmap pointer, truncated on this 64-bit host before being passed
     on to bitmap_blit_to_framebuffer. Same pointer-truncation class as
     nearly every other bug in this project; confirmed live (crashed
     inside bitmap_blit_to_framebuffer on the truncated address the
     moment the two bugs upstream -- the missing frame storage and the
     dropped decode argument -- were both fixed and a real decode
     finally succeeded). */
  char *uVar2;

  g_blit_transparent_mode = 1;
  if ((((DAT_0023c130 != 6) && (DAT_000870e4 < 0x1c)) && (-1 < DAT_000870dc)) &&
     (g_weapon_overlay_enabled != 0)) {
    if (g_jump_ascent_timer == 0) {
      sVar1 = 0;
    }
    else {
      sVar1 = Ordinal_2005(799,(int)g_jump_ascent_timer << 1);
      sVar1 = sVar1 + 1;
    }
    randomize_weapon_jump_shake((int)sVar1);
    if ((DAT_0023c130 == 3) || (DAT_0023c130 == 5)) {
      sVar1 = DAT_000870e4 + 0x12;
    }
    else if ((DAT_000870e4 < 0) || (DAT_0023c130 == 4)) {
      sVar1 = 0x1c - DAT_000870e8;
    }
    else {
      DAT_0023c1ec = 0;
      sVar1 = (ushort)DAT_0023c130 * 9 + DAT_000870e4;
    }
    /* Was `DAT_0023c214 + (short)(&DAT_0023c158)[sVar1]` -- see
       g_weapon_swing_current_frame's own comment. */
    g_weapon_swing_current_frame = ((unsigned)(ushort)sVar1 < UW_WEAPON_SWING_FRAME_COUNT) ?
                   g_weapon_swing_raw_frames[sVar1] : 0;
    /* Was `FUN_000409f8()` -- dropped argument (same "ARM register-
       leftover doesn't survive a literal recompile" idiom as every
       other dropped-argument bug in this file). decode_gr_entry_bitmap
       needs the raw entry buffer just resolved above; without it, it
       dereferenced whatever register happened to be lying around. */
    uVar2 = (g_weapon_swing_current_frame == 0) ? 0 : decode_gr_entry_bitmap(g_weapon_swing_current_frame);
    if (getenv("UW_DEBUG_COMBAT")) {
      fprintf(stderr, "[wswing] DAT_0023c130=%d DAT_000870e4=%d sVar1=%d frame=%p drawn=%d\n",
              (int)DAT_0023c130, (int)DAT_000870e4, (int)sVar1, (void *)g_weapon_swing_current_frame,
              uVar2 != 0);
    }
    if (uVar2 != 0) {
      bitmap_blit_to_framebuffer((uint)(byte)(&g_weapon_swing_frame_x_offset)[sVar1] + (int)DAT_0023c1ec + 0x34,
                   0x83 - (uint)(byte)(&g_weapon_swing_frame_y_offset)[sVar1],uVar2,*(undefined1 *)(g_weapon_swing_current_frame + 2),
                   *(undefined1 *)(g_weapon_swing_current_frame + 1),0,0,1);
    }
  } else if (getenv("UW_DEBUG_COMBAT")) {
    fprintf(stderr, "[wswing] SKIPPED: DAT_0023c130=%d DAT_000870e4=%d DAT_000870dc=%d g_weapon_overlay_enabled=%d\n",
            (int)DAT_0023c130, (int)DAT_000870e4, (int)DAT_000870dc, (int)g_weapon_overlay_enabled);
  }
  draw_hud_icon_sprite(0x107f,0x3e,3);
  draw_hud_icon_sprite(0x1080,0,0xd);
  draw_hud_icon_sprite(0x1081,0xab,0xd);
  g_blit_transparent_mode = 0;
  return;
}



// was FUN_0006fea4 -- full-screen "hard refresh" utility: draws the
// weapon-swing overlay (if the dungeon view is active) then marks the
// entire screen dirty. Called after level loads/respawns/full
// redraws, not from the normal per-frame render path (that's
// render_dungeon_frame_timed calling weapon_swing_draw_tick directly).
void weapon_overlay_and_full_redraw()

{
  if (g_dungeon_view_active != 0) {
    weapon_swing_draw_tick();
  }
  dirty_rect_union(0,200,0,0x140);
  return;
}







// was FUN_0006e554 -- sets DAT_0023c1ec (the weapon-swing sprite's
// horizontal jitter offset, applied in src/weapon_swing.c's blit) from
// param_1's shake intensity: 0 clears it, 1 picks a small random value
// (-4..4, via Ordinal_1053 mod 5), 2 a larger one (-9..9, mod 10).
// Its one caller derives param_1 from g_jump_ascent_timer, so this is
// the weapon-bob jitter while the player is airborne from a jump.
void randomize_weapon_jump_shake(param_1)
short param_1;

{
  int uw_ord2005_rem_134 = 0; int uw_ord2005_rem_135 = 0; int uw_ord2005_rem_136 = 0; int uw_ord2005_rem_137 = 0;
  undefined4 uVar1;
  int iVar2;
  undefined2 extraout_r1;
  undefined2 extraout_r1_00;
  undefined2 extraout_r1_01;
  undefined2 extraout_r1_02;
  
  if (param_1 == 0) {
    DAT_0023c1ec = 0;
  }
  else if (param_1 == 1) {
    if (DAT_0023c1ec < 1) {
      iVar2 = Ordinal_1053();
      uw_ord2005_rem_134 = ((int)(-iVar2)) % (5);
      DAT_0023c1ec = uw_ord2005_rem_134;
    }
    else {
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_135 = ((int)(uVar1)) % (5);
      DAT_0023c1ec = uw_ord2005_rem_135;
    }
  }
  else {
    if (param_1 != 2) {
      return;
    }
    if (DAT_0023c1ec < 1) {
      iVar2 = Ordinal_1053();
      uw_ord2005_rem_136 = ((int)(-iVar2)) % (10);
      DAT_0023c1ec = uw_ord2005_rem_136;
    }
    else {
      uVar1 = Ordinal_1053();
      uw_ord2005_rem_137 = ((int)(uVar1)) % (10);
      DAT_0023c1ec = uw_ord2005_rem_137;
    }
    Ordinal_1053();
  }
  DAT_000870e8 = 1;
  return;
}






// was FUN_0006e648 -- shared player-action animation state machine
// (weapon raise/ready, among others): reads the requested action type
// (DAT_0023c120, set via set_hud_status_value(8,N)), drives the current-action
// state (DAT_0023c130) and its own sub-frame counter (DAT_000870e4),
// and calls load_weapon_swing_sprites once a weapon-category change
// needs new sprites. Only reachable via hud_panel_redraw_dispatch's
// dirty-bit-gated dispatch table (g_hud_panel_handlers_table[12]), which
// IS wired into the real per-frame dispatch (DAT_00085668, mode 0) --
// confirmed live via UW_DEBUG_COMBAT that this runs continuously during
// normal play, not dead code. DAT_000870e4 is also read (separately,
// for different meaning) by the attack-swing state machine
// (tick_weapon_swing_state) once armed -- the exact interaction between the two
// during a live swing is still not fully understood (see memory.md).
void advance_action_animation_frame()

{
  byte bVar1;
  int iVar2;
  set_pending_update_flags(2);
  if (6 < DAT_0023c120) {
    DAT_0023c120 = 6;
  }
  bVar1 = DAT_0023c130;
  if (DAT_0023c120 == 6) {
    if ((DAT_0023c130 == 6) || (DAT_0023c130 == 5)) {
LAB_0006e770:
      DAT_0023c130 = bVar1;
      iVar2 = (int)DAT_000870e4;
    }
    else {
      DAT_0023c130 = 5;
LAB_0006e700:
      iVar2 = -1;
LAB_0006e704:
      DAT_000870e4 = (short)iVar2;
    }
  }
  else {
    bVar1 = DAT_0023c120;
    if (DAT_0023c120 != 4) goto LAB_0006e770;
    if ((DAT_0023c130 == 6) || (DAT_0023c130 == 5)) {
      DAT_0023c130 = 3;
      iVar2 = 3;
      goto LAB_0006e704;
    }
    if (DAT_0023c260 != 0) {
      DAT_0023c130 = 4;
      goto LAB_0006e700;
    }
    if (2 < DAT_0023c130) {
      bVar1 = DAT_0023c130;
      if ((DAT_0023c130 == 4) && (DAT_000870d8 == DAT_000870dc)) goto LAB_0006e7d0;
      goto LAB_0006e770;
    }
    iVar2 = DAT_000870e4 + -2;
    DAT_000870e4 = (short)iVar2;
    if (iVar2 * 0x10000 >> 0x10 < -1) {
      DAT_0023c130 = 4;
    }
  }
  if (DAT_0023c130 == 3) {
    DAT_000870e4 = (short)(iVar2 + -1);
    if (-1 < (iVar2 + -1) * 0x10000 >> 0x10) {
      return;
    }
    DAT_0023c130 = 4;
    return;
  }
  if (DAT_0023c130 == 4) {
    if (DAT_000870d8 != DAT_000870dc) {
      DAT_000870e0 = 4;
      DAT_0023c120 = 6;
      return;
    }
  }
  else {
    if (DAT_0023c130 == 5) {
      DAT_000870e4 = (short)(iVar2 + 1);
      if ((iVar2 + 1) * 0x10000 >> 0x10 < 3) {
        return;
      }
      DAT_0023c130 = 6;
      return;
    }
    if (DAT_0023c130 == 6) {
      if (DAT_000870d8 != DAT_000870dc) {
        load_weapon_swing_sprites();
        DAT_0023c120 = DAT_000870e0;
        DAT_000870e0 = 6;
        return;
      }
    }
    else {
      DAT_000870e4 = (short)(iVar2 + 1);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      if (iVar2 == 0) {
        DAT_0023c260 = 0;
        return;
      }
      if (iVar2 == 3) {
        DAT_0023c1dc = DAT_0023c1dc & 0xfeff;
        DAT_0023c260 = 1;
        return;
      }
      if (iVar2 != 9) {
        return;
      }
      DAT_0023c130 = 4;
      DAT_0023c120 = 4;
    }
  }
  DAT_000870e4 = -1;
LAB_0006e7d0:
  DAT_0023c1dc = DAT_0023c1dc & 0xfeff;
  return;
}






// was FUN_0006e89c -- loads a 16-byte weapon combat-maneuver record
// from \DATA\weapons.cm into DAT_00202700, seeking to offset 0x10 or 0
// depending on a flag at DAT_00086df8+100 (bits 0x1c == 4, an
// unidentified player/class condition). Called after character
// generation and after a successful game load to (re)load the current
// weapon's swing-animation data.
bool load_weapon_combat_maneuver_data()

{
  char stack0xffdc3248_buf [256];
  char *stack0xffdc3248_ptr;
  char cVar1;
  undefined2 uVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  char acStack_110 [260];
  
  pcVar3 = &DAT_0023cca8;
    stack0xffdc3248_ptr = acStack_110;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc3248_ptr = cVar1; stack0xffdc3248_ptr = stack0xffdc3248_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_110,s__DATA_weapons_cm_00087284);
  iVar4 = open_file_for_read(acStack_110);
  if (iVar4 == 0) {
    bVar7 = false;
  }
  else {
    uVar2 = 0x10;
    if ((*(byte *)(DAT_00086df8 + 100) & 0x1c) != 4) {
      uVar2 = 0;
    }
    iVar5 = seek_file_handle(iVar4,uVar2,0);
    iVar6 = read_file_handle(iVar4,&DAT_00202700,0x10);
    bVar7 = iVar5 == 0 && iVar6 == 0x10;
    Ordinal_553(iVar4);
  }
  return bVar7;
}


// was FUN_00012948 -- always returns immediately and does nothing
// else; confirmed used two ways at its real call sites (uw.c): once
// inside a 13-iteration animation loop (weapon_overlay_flash_hold) alongside
// weapon_overlay_and_full_redraw, and once passed BY ADDRESS as a
// callback argument to decrement_cursor_hide_depth (the same helper
// wait_for_click_to_continue calls). Matches the same "dead/stripped
// debug hook" pattern already confirmed for debug_print_init,
// debug_print, and debug_noop_checkpoint elsewhere in this file.
void debug_noop_frame_hook()

{
  return;
}


// was FUN_000271dc -- finds/consumes the ammunition item required for
// weapon type param_1 (looked up from &DAT_002027d2), returning its
// inventory slot; on failure (none found), prints a "Sorry, you have
// no <item>" message to the scroll (with a fallback "UNNAMED" name if
// the display-name build fails) and returns -1.
int find_and_consume_ammo(param_1)
short param_1;

{
  char *wptr_14062;
  char cVar1;
  short sVar2;
  int iVar3;
  char *pcVar4;
  char acStackY_84f60 [544528];
  short local_4c [4];
  ushort local_44 [4];
  char acStack_3c [52];
  
  cVar1 = (&DAT_002027d2)[param_1 * 3];
  iVar3 = FUN_000452dc(0,1,(int)cVar1,4,local_4c);
  if (iVar3 == 0) {
    local_44[0] = ((short)cVar1 + 0x10U ^ local_44[0]) & 0x1ff ^ local_44[0];
    message_scroll_print_wrapped(s_Sorry__you_have_no_00084f2c);
    sVar2 = build_object_display_name(acStack_3c,local_44,0,1);
    if (sVar2 == 0) {
      pcVar4 = s_UNNAMED_00084f24;
    wptr_14062 = acStackY_84f60;
      do {
        cVar1 = *pcVar4;
        *wptr_14062 = cVar1; wptr_14062 = wptr_14062 + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
    }
    message_scroll_print_wrapped(acStack_3c);
    message_scroll_print_wrapped(&DAT_00084f20);
    iVar3 = -1;
  }
  else {
    iVar3 = (int)local_4c[0];
  }
  return iVar3;
}


// was FUN_000275e0 -- resets the weapon-swing state machine after a
// completed swing: sets DAT_0010062c to a cooldown value, clears the
// "swing charging" cursor-holding flags, and resets the HUD status
// icons. Called from tick_weapon_swing_state's own swing-completion
// path.
void reset_weapon_swing_state()

{
  DAT_0010062c = 0xfff6;
  DAT_00084f10 = 0xffff;
  set_hud_status_value(3,0);
  g_cursor_holding_state = g_cursor_holding_state + -4;
  FUN_00057cac(3);
  set_hud_status_value(8,4);
  DAT_001005ec = 0;
  return;
}



// was FUN_0002764c -- sets the HUD's weapon-ready status icon (a
// different icon depending on a flag bit at DAT_00086df8+0x5f) and
// clears the swing-charge status icon.
void update_weapon_ready_hud_icon()

{
  undefined4 uVar1;
  
  uVar1 = 4;
  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) {
    uVar1 = 6;
  }
  set_hud_status_value(8,uVar1);
  set_hud_status_value(3,0);
  return;
}



// was FUN_00027694 -- fully cancels an in-progress weapon swing
// (charging or mid-animation): releases any held swing-charge cursor
// state, updates the HUD icons, and resets the swing phase counter
// (DAT_0010062c), pending-swing marker (DAT_00084f10), and attacker
// marker (DAT_00100610) to their idle values. Called whenever gameplay
// interrupts a swing in progress (opening inventory, changing level,
// using an item).
void cancel_weapon_swing()

{
  if ((DAT_001005ec != 0) && (DAT_00100618 == 0)) {
    g_cursor_holding_state = g_cursor_holding_state + -4;
    FUN_00057cac(3);
  }
  update_weapon_ready_hud_icon();
  DAT_0010062c = 0;
  DAT_00084f10 = 0xffff;
  DAT_00100610 = 0xffff;
  return;
}



// was FUN_00027708 -- per-frame weapon-swing state machine: param_1 is
// the requested attack direction/type (0=none, from interact_attack's
// screen-position-to-3x3-grid mapping), and DAT_0010062c is the swing
// phase counter (negative while charging/swinging). If no swing is in
// progress and a direction is requested, resolves the equipped weapon
// (resolve_equipped_weapon_attack) and starts charging; while charging,
// tracks elapsed real time (read_realtime_clock_units) into a charge
// percentage (DAT_00100614) shown on the HUD; once the charge/swing
// countdown completes, calls compute_player_weapon_attack_stats and
// process_melee_attack_swing to actually resolve the attack, then
// resets state via reset_weapon_swing_state. Own "[swing]" debug trace.
void tick_weapon_swing_state(param_1)
short param_1;

{
  byte bVar1;
  bool bVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  undefined2 local_20 [2];
  /* Was folded into `iVar5` (int) -- the pointer DAT_001005e4 now
     carries (see its own fix) needs to stay a real 64-bit pointer
     across this function's two dereference sites below (~17130 and
     ~17180). iVar5 itself keeps its OTHER, disjoint int uses further
     down (is_mouse_within_tracked_hotspot's result, and the whole "start a new swing"
     else-if branch) -- those never run in the same call as these
     dereferences, so they're left as plain int. */
  char *pRecord;

  if (((short)DAT_00084f10 < 1) || ((&DAT_00250658)[(short)DAT_00084f10] == '\0')) {
    uVar3 = FUN_000575c4(local_20);
    bVar2 = false;
    if ((uVar3 & 2) == 0) goto LAB_00027754;
  }
  bVar2 = true;
LAB_00027754:
  pRecord = DAT_001005e4;
  if (getenv("UW_DEBUG_COMBAT") && (param_1 != 0 || DAT_000870e4 != -1 || DAT_0010062c != 0)) {
    fprintf(stderr, "[swing] param_1=%d flags5f=0x%x DAT_000870e4=%d DAT_0010062c=%d bVar2=%d pRecord=%p DAT_00100618=%d DAT_001005ec=%u DAT_001005e8=%d\n",
            (int)param_1, (unsigned)*(byte *)(DAT_00086df8 + 0x5f), (int)DAT_000870e4,
            (int)DAT_0010062c, (int)bVar2, (void *)pRecord, (int)DAT_00100618, DAT_001005ec, (int)DAT_001005e8);
  }
  if (DAT_0010062c < 1) {
    if (DAT_0010062c < 0) {
      if ((-1 < DAT_000870e4) || (-10 < DAT_0010062c)) {
        if (6 < DAT_000870e4) {
          return;
        }
        if (2 < DAT_000870e4) {
          if (DAT_000870e4 != 3) {
            if (DAT_000870e4 != 6) {
              return;
            }
            if (DAT_0010062c < -9) {
              return;
            }
            set_hud_status_value(3,0);
            local_20[0] = Ordinal_2005(100,((int)(((uint)*(byte *)(pRecord + 5) -
                                                  (uint)*(byte *)(pRecord + 3)) * 0x10000) >> 0x10) *
                                           (uint)DAT_00100614);
            DAT_00100614 = *(char *)(pRecord + 3) + (char)local_20[0];
            *(byte *)(DAT_0023be74 + 0x1d) = *(byte *)(DAT_0023be74 + 0x1d) | 0xf;
            DAT_001005fc = DAT_00100614;
            compute_player_weapon_attack_stats(pRecord,DAT_001005e0,(int)DAT_00100618);
            process_melee_attack_swing();
            DAT_0010062c = 0xfff6;
            return;
          }
          if (DAT_001005ec != 0) {
            if ((!bVar2) && (-1 < DAT_00100618)) {
              iVar5 = is_mouse_within_tracked_hotspot();
              if (iVar5 != 0) {
                fire_ranged_weapon(*DAT_001005e0 & 0xf);
              }
              reset_weapon_swing_state();
              return;
            }
            if (-1 < DAT_00100618) {
              return;
            }
            set_hud_status_value(3,9);
            DAT_00100618 = 0;
            g_cursor_holding_state = g_cursor_holding_state + 4;
            FUN_00057c5c(0x1075);
            return;
          }
          if (!bVar2) {
            if (DAT_0010062c < -4) {
              return;
            }
            set_hud_status_value(8,-1 - DAT_0010062c);
            DAT_0010062c = 0xfffb;
            return;
          }
          *(byte *)(DAT_0023be74 + 0x1d) = *(byte *)(DAT_0023be74 + 0x1d) & 0xfa | 10;
          if (DAT_001005e8 < 0) {
            DAT_001005f0 = read_realtime_clock_units();
            DAT_001005e8 = 0;
            return;
          }
          sVar4 = read_realtime_clock_units();
          DAT_001005e8 = (sVar4 - (short)DAT_001005f0) + DAT_001005e8;
          DAT_001005f0 = read_realtime_clock_units();
          if (DAT_001005e8 < 0x11) {
            return;
          }
          do {
            DAT_00100614 = DAT_00100614 + *(char *)(pRecord + 4);
            if (100 < DAT_00100614) {
              DAT_00100614 = 100;
            }
            sVar4 = Ordinal_2005(0xc,DAT_00100614);
            set_hud_status_value(3,sVar4 + 1);
            iVar6 = (int)DAT_001005e8;
            DAT_001005e8 = (short)(iVar6 + -0x10);
          } while (0x10 < (iVar6 + -0x10) * 0x10000 >> 0x10);
          return;
        }
        if (bVar2) {
          return;
        }
      }
      update_weapon_ready_hud_icon();
      DAT_0010062c = 0;
      DAT_00084f10 = 0xffff;
    }
    else if (((((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0) && (iVar5 = (int)param_1, iVar5 != 0)) &&
             (DAT_000870e4 == -1)) &&
            (DAT_00100618 = param_1, sVar4 = resolve_equipped_weapon_attack(&DAT_001005e4,&DAT_001005e0), -1 < sVar4))
    {
      if (sVar4 == 0) {
        DAT_00100618 = -1;
      }
      DAT_001005ec = (uint)(sVar4 == 0);
      bVar1 = (&DAT_00084eff)[iVar5];
      DAT_0010062c = (short)(-1 - (uint)bVar1);
      iVar5 = Ordinal_2005(3,iVar5);
      DAT_00084f10 = (ushort)(byte)(&DAT_00084f0b)[iVar5];
      set_hud_status_value(8,-1 - (-1 - (uint)bVar1));
      set_hud_status_value(3,1);
      DAT_001005e8 = -1;
      DAT_00100614 = 0;
    }
  }
  return;
}


// was FUN_00040bc0 -- resolves a sprite id to its .GR frame, decodes
// it, and blits it at (param_2,param_3). Only known caller is
// src/weapon_swing.c's weapon-swing HUD icon draw (ids
// 0x107f/0x1080/0x1081, drawn back-to-back every frame), but the body
// is a generic "draw this icon sprite" helper, not swing-specific.
void draw_hud_icon_sprite(param_1,param_2,param_3)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;

{
  char cVar1;
  char cVar2;
  char *pcVar3;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  uint resolved;

  /* Dropped arguments (2 calls) -- same idiom as the identical
     `resolved = resolve_sprite_id_to_frame(param_1); lookup_grtile_by_id(resolved);` pair
     used correctly elsewhere in this file (see e.g. the call site
     right above this function). Both calls here ran bare, so the
     resolved icon graphic came from whatever register happened to be
     left over from the PREVIOUS call instead of this call's own
     param_1 -- three icon draws happen back-to-back every single
     frame from weapon_swing_draw_tick (ids 0x107f/0x1080/0x1081), so
     with this bug each one actually drew whatever the icon 2 calls
     earlier resolved to, and the leftover register value alternated
     between two stale states frame to frame. Confirmed live: this
     produced a real 2-frame-period flicker in exactly that HUD icon
     area during a held wind-up. */
  resolved = resolve_sprite_id_to_frame(param_1);
  pcVar3 = (char *)lookup_grtile_by_id(resolved);
  cVar1 = pcVar3[1];
  cVar2 = pcVar3[2];
  if (*pcVar3 == '\x04') {
    pcVar3 = pcVar3 + 5;
  }
  else {
    /* HACK: dropped 3rd argument (the .GR entry's own compression-mode
       byte, *pcVar3) -- the same bug already found and fixed twice
       elsewhere in this file for this identical decompress_gr_bitmap
       call shape (decode_gr_entry_bitmap and the call site ~130 lines
       above this one; see object-rendering-findings.txt's "MILESTONE:
       objects render" entry). Without it, decompress_gr_bitmap took
       its param_3==0 path and returned NULL for this icon's real
       .GR entries. */
    pcVar3 = (char *)decompress_gr_bitmap(pcVar3 + 4,&DAT_00202520 + (uint)(byte)pcVar3[3] * 0x10,*pcVar3);
  }
  bitmap_blit_to_framebuffer(param_2,param_3,pcVar3,cVar2,cVar1,0,0,1,unaff_r4,unaff_r5);
  return;
}


// was FUN_000411b8 -- generic "flash and hold" weapon-overlay
// transition: hides the cursor, disables the weapon overlay, redraws
// ~13 blank frames with it hidden (the no-op thunk_FUN_0003c310 call
// is dead weight -- same empty-body stub as show_error_dialog_stub),
// redraws once more, then re-enables the overlay and shows the idle
// cursor. Called with various (ignored, the function takes no
// parameters) codes across combat/player/object-action damage and
// hazard events, and paired with weapon_overlay_flash_restore in
// play_view_restore_transition below.
void weapon_overlay_flash_hold()

{
  int iVar1;

  decrement_cursor_hide_depth();
  g_weapon_overlay_enabled = 0;
  iVar1 = 0;
  do {
    debug_noop_frame_hook(iVar1);
    weapon_overlay_and_full_redraw();
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 0xd);
  thunk_FUN_0003c310(0xf1);
  weapon_overlay_and_full_redraw();
  g_weapon_overlay_enabled = 1;
  cursor_show_idle_tick();
  return;
}



// was FUN_000411cc -- sibling to weapon_overlay_flash_hold: instead of
// blank redraws, snapshots the live screen region (DAT_00248410) and
// repeatedly restores it over the overlay-disabled redraw loop,
// holding a frozen frame while the overlay stays hidden.
void weapon_overlay_flash_restore()

{
  undefined4 uVar1;
  int iVar2;

  decrement_cursor_hide_depth(0xc,debug_noop_frame_hook,0xf1);
  uVar1 = Ordinal_1041(0x4bec);
  Ordinal_1044(uVar1,DAT_00248410,0x4bec);
  g_weapon_overlay_enabled = 0;
  weapon_overlay_and_full_redraw();
  for (iVar2 = 0xc; 0 < iVar2; iVar2 = (iVar2 + -1) * 0x10000 >> 0x10) {
    weapon_overlay_and_full_redraw();
    Ordinal_1044(DAT_00248410,uVar1,0x4bec);
  }
  weapon_overlay_and_full_redraw();
  g_weapon_overlay_enabled = 1;
  cursor_show_idle_tick();
  return;
}



// was FUN_000411e0 -- the simplest of the three: a single
// disable-redraw-reenable cycle, used as a quick screen flash cue for
// damage/hazard events (src/combat.c, src/player.c, src/object_actions.c
// call it with various scroll-message-like codes, all ignored since it
// takes no parameters).
void weapon_overlay_flash_once()

{
  thunk_FUN_0003c310();
  decrement_cursor_hide_depth();
  g_weapon_overlay_enabled = 0;
  weapon_overlay_and_full_redraw();
  g_weapon_overlay_enabled = 1;
  cursor_show_idle_tick();
  return;
}


// was FUN_0004a210 -- fires a ranged weapon (param_1, a weapon type):
// finds and consumes a matching ammo item (find_and_consume_ammo),
// sets up the throw/aim state and spawns a projectile object near the
// player, copies damage-type/quality/charge fields from the consumed
// ammo's own template (FUN_00045a7c) onto the new projectile, frees
// the consumed ammo's object slot, and plays the bow/sling release
// sound for weapon types 9/10.
void fire_ranged_weapon(param_1)
short param_1;

{
  int iVar1;
  byte bVar2;
  char cVar3;
  ushort uVar4;
  undefined4 uVar5;
  ushort *puVar6;
  ushort *puVar7;
  uint uVar8;
  
  /* Was a dropped argument -- find_and_consume_ammo's own param_1 (weapon
     type). The very next line re-derives the identical
     `(&DAT_002027d2)[param_1*3]` table lookup find_and_consume_ammo's own
     body performs internally, confirming this caller's param_1 is the
     value that belongs here. */
  uVar5 = find_and_consume_ammo(param_1);
  if (-1 < (short)uVar5) {
    iVar1 = (int)param_1;
    cVar3 = (&DAT_002027d2)[iVar1 * 3];
    DAT_00202a48 = (ushort)(byte)(&DAT_002027d1)[(short)cVar3 * 3];
    DAT_00202a38 = cVar3 + 0x10;
    DAT_00202a4c = (ushort)(*(byte *)((char *)g_player_object + 0x17) >> 2);
    DAT_00202a44 = g_player_object;
    DAT_00202a50 = (undefined2)((*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4);
    DAT_00202a54 = 1;
    compute_drop_aim_from_cursor();
    puVar6 = (ushort *)spawn_object_near_player();
    if (puVar6 == (ushort *)0x0) {
      print_scroll_message_by_id(0xfe);
    }
    else {
      puVar7 = (ushort *)FUN_00045a7c(0,1,(int)cVar3,uVar5);
      uVar8 = (*puVar7 ^ *puVar6) & 0x7fff ^ (uint)*puVar7;
      *(char *)puVar6 = (char)uVar8;
      *(char *)((char *)puVar6 + 1) = (char)(uVar8 >> 8);
      uVar4 = puVar7[3];
      bVar2 = (byte)uVar4;
      *(byte *)(puVar6 + 3) = ((byte)puVar6[3] ^ bVar2) & 0x3f ^ bVar2;
      *(char *)((char *)puVar6 + 7) = (char)(uVar4 >> 8);
      bVar2 = *(byte *)((char *)puVar7 + 1);
      *(char *)puVar6 = (char)*puVar6;
      *(byte *)((char *)puVar6 + 1) =
           (bVar2 ^ *(byte *)((char *)puVar6 + 1)) & 0x1e ^ *(byte *)((char *)puVar6 + 1);
      *(byte *)(puVar6 + 4) = (byte)puVar7[2] & 0x3f;
      *(byte *)(puVar6 + 3) = ((byte)puVar7[3] ^ (byte)puVar6[3]) & 0x3f ^ (byte)puVar6[3];
      *(undefined1 *)((char *)puVar6 + 7) = *(undefined1 *)((char *)puVar6 + 7);
      bVar2 = *(byte *)((char *)puVar7 + 1);
      *(char *)puVar6 = (char)*puVar6;
      *(byte *)((char *)puVar6 + 1) =
           (bVar2 ^ *(byte *)((char *)puVar6 + 1)) & 0x20 ^ *(byte *)((char *)puVar6 + 1);
      if ((*puVar7 & 0x1c0) != 0x140) {
        if (((&DAT_00202c9a)[(*puVar7 & 0x1ff) * 0xd] & 3) != 2) {
          *(byte *)(puVar6 + 0xd) = (byte)(puVar7[1] >> 7) & 7;
        }
      }
      free_object_slot();
    }
    if ((iVar1 == 9) || (iVar1 == 10)) {
      play_sound_effect_with_pan(9,0x40,0);
    }
  }
  return;
}
