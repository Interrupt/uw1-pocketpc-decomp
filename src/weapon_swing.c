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
  FUN_00040bc0(0x107f,0x3e,3);
  FUN_00040bc0(0x1080,0,0xd);
  FUN_00040bc0(0x1081,0xab,0xd);
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
