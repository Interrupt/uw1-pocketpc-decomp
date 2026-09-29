/* Player state: tile position/movement commit, save-record build/
 * write/restore, HUD stat sync, equipment-effect refresh, and HP
 * adjustment. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/player.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0003cff8
void set_player_tile_position(param_1,param_2)
uint param_1;
uint param_2;

{
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 local_3c [24];
  
  if (-1 < DAT_00202080) {
    object_list_unlink(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  }
  DAT_002048b8 = &check_and_reset_landing_state;
  DAT_002048b2 = 0x1100;
  DAT_002048b0 = 0;
  g_jump_ascent_timer = 0;
  g_fall_accel = 0;
  DAT_0020488e = 0;
  DAT_0020488c = 0;
  g_vertical_velocity = 0;
  DAT_00204888 = 0;
  DAT_00204886 = 0;
  DAT_00204880 = (short)((uint)((int)(short)param_1 << 0x18) >> 0x10) + 0x80;
  DAT_00204882 = (short)((uint)((int)(short)param_2 << 0x18) >> 0x10) + 0x80;
  DAT_002048a7 = 8;
  DAT_002048a3 = 1;
  DAT_002048a4 = 0;
  iVar2 = param_1 + param_2 * 0x40;
  DAT_00202080 = (short)iVar2;
  iVar2 = iVar2 * 0x10000 >> 0x10;
  DAT_00204884 = *(short *)(&DAT_00085d20 + (uint)(*(byte *)(DAT_002029cc + iVar2 * 4) >> 4) * 2);
  if (((&DAT_000878d0)[*(byte *)(DAT_002029cc + iVar2 * 4) & 0xf] & 0x20) != 0) {
    DAT_00204884 = DAT_00204884 + 0x20;
  }
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xff80;
  *(byte *)((char *)g_player_object + 2) =
       (byte)uVar3 | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
  *(char *)((char *)g_player_object + 3) = (char)(uVar3 >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0x3ff;
  *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
  *(byte *)((char *)g_player_object + 0x17) = (byte)(uVar3 >> 8) | (byte)(((param_1 & 0x3f) << 10) >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0xfc0f | (param_2 & 0x3f) << 4;
  *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
  *(char *)((char *)g_player_object + 0x17) = (char)(uVar3 >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0x1fff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) = (byte)(uVar3 >> 8) | 0x60;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xefff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) = (byte)(uVar3 >> 8) | 0xc;
  *(byte *)((char *)g_player_object + 0x15) = *(byte *)((char *)g_player_object + 0x15) & 0xec | 0x2c;
  uVar3 = *(ushort *)((char *)g_player_object + 4) & 0xffc0;
  *(char *)((char *)g_player_object + 4) = (char)uVar3;
  *(char *)((char *)g_player_object + 5) = (char)(uVar3 >> 8);
  *(byte *)((char *)g_player_object + 4) = *(byte *)((char *)g_player_object + 4) & 0x3f;
  *(undefined1 *)((char *)g_player_object + 5) = 0;
  DAT_00202c6c = local_3c;
  uVar1 = encode_object_slot_index(g_player_object);
  DAT_00202c6c[10] = (char)uVar1;
  DAT_00202c6c[0xb] = (char)((ushort)uVar1 >> 8);
  DAT_00202c6c[8] = (byte)DAT_00203304 & 7;
  iVar2 = (((int)(short)param_1 << 0x13) >> 0x10) + 3;
  DAT_00202c6c[9] = DAT_00203303;
  *DAT_00202c6c = (char)iVar2;
  DAT_00202c6c[1] = (char)((uint)iVar2 >> 8);
  iVar2 = (((int)(short)param_2 << 0x13) >> 0x10) + 3;
  DAT_00202c6c[2] = (char)iVar2;
  DAT_00202c6c[3] = (char)((uint)iVar2 >> 8);
  iVar2 = (int)DAT_00204884;
  DAT_00202c6c[4] = (char)(iVar2 >> 3);
  DAT_00202c6c[5] = (char)((uint)(iVar2 >> 3) >> 8);
  collision_build_height_field(DAT_002048a7);
  DAT_002048a8 = collision_flags_to_locomotion_code((int)(short)(*(ushort *)(DAT_00202c6c + 0xe) |
                                          *(ushort *)(DAT_00202c6c + 0xc)));
  set_locomotion_state(DAT_002048a8,0);
  DAT_0023be98 = 0;
  trigger_view_transition();
  DAT_000858a0 = 1;
  object_list_insert_head(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  return;
}



/* Debug-only helper (UW_DEBUG_THROW-gated): print both player-position
   representations side by side -- the fine, continuous DAT_00204880/2
   (used by the camera and by demo_set_player_pos) vs. the coarser
   tile-position bytes packed into g_player_object's own record (offset
   0x16/0x17, read elsewhere as DAT_00202a4c/DAT_00202a50 by
   drop_held_object_near_player). Added to bisect a desync between the
   two: right after chargen's set_player_tile_position(0x20,2,1) call
   they should agree (that function sets both atomically), so if they
   already disagree here, the bug is upstream of/inside that call; if
   they still agree here but disagree later (at throw time), something
   between chargen-complete and the throw resets g_player_object's own
   bytes without touching DAT_00204880/2. */
void debug_print_player_position(const char *label)
{
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[playerpos:%s] fine=(%d,%d)=world(%g,%g) obj_bytes tile=(%d,%d)\n",
            label, (int)DAT_00204880, (int)DAT_00204882,
            (double)DAT_00204880 / 256.0, (double)DAT_00204882 / 256.0,
            (int)((byte)*(byte *)((char *)g_player_object + 0x17) >> 2),
            (int)((g_player_object[0xb] & 0x3f0) >> 4));
}


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0003d438 (previously mis-guessed as "update_3d_sound_position"
// from its trailing sound call). Per-tick commit of the freshly-integrated
// player position/facing back into the world: recompute the tile index and
// relink the player object between tile object lists on a tile change,
// pack sub-tile position / height / facing into the player object record
// (g_player_object +2/+3/+0x16/+0x17/+0x18), auto-straighten the facing
// toward the travel direction, then handle a pending landing impact
// (fall damage FUN_00038374 + thud FUN_00072f30) and refresh the
// locomotion pose. Called every tick from apply_movement_tick.
void commit_player_move()

{
  short sVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  ushort uVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  
  iVar8 = ((int)(short)DAT_00204882 >> 8) * 0x40 + (((int)(short)DAT_00204880 << 0x10) >> 0x18);
  iVar2 = (int)DAT_00202080;
  iVar7 = iVar8 * 0x10000 >> 0x10;
  if (iVar7 != iVar2) {
    if (iVar2 != -1) {
      object_list_unlink(DAT_002029cc + iVar2 * 4 + 2,g_player_object);
    }
    DAT_00202080 = (short)iVar8;
    object_list_insert_head(DAT_002029cc + iVar7 * 4 + 2,g_player_object);
    uVar5 = DAT_00204880 & 0x3f00;
    uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0x3ff;
    *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
    *(byte *)((char *)g_player_object + 0x17) =
         (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar5 >> 8) << 10) >> 8);
    uVar3 = *(ushort *)((char *)g_player_object + 0x16) & 0xfc0f |
            ((int)(short)(DAT_00204882 & 0x3f00) >> 8) << 4;
    *(char *)((char *)g_player_object + 0x16) = (char)uVar3;
    *(char *)((char *)g_player_object + 0x17) = (char)(uVar3 >> 8);
  }
  uVar5 = DAT_00204880 & 0xe0;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0x1fff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) =
       (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar5 >> 5) << 0xd) >> 8);
  uVar5 = DAT_00204882 & 0xe0;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xe3ff;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(byte *)((char *)g_player_object + 3) =
       (byte)(uVar3 >> 8) | (byte)((uint)(((int)(short)uVar5 >> 5) << 10) >> 8);
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xff80;
  *(byte *)((char *)g_player_object + 2) =
       (byte)uVar3 | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
  *(char *)((char *)g_player_object + 3) = (char)(uVar3 >> 8);
  uVar3 = read_realtime_clock_units();
  uVar4 = *(ushort *)((char *)g_player_object + 0xb) & 0xfff;
  *(char *)((char *)g_player_object + 0xb) = (char)uVar4;
  *(byte *)((char *)g_player_object + 0xc) = (byte)(uVar4 >> 8) | (byte)(((uVar3 & 0xc0) << 6) >> 8);
  if ((_DAT_002048a9 != 0) && (_DAT_002048a1 == DAT_00201c78)) {
    g_jump_ascent_timer = 0;
  }
  uVar5 = DAT_00201c70;
  if (_DAT_002048a1 != DAT_00201c78) {
    DAT_00201c78 = _DAT_002048a1;
    uVar3 = (int)_DAT_002048a1 + DAT_00202088 * -0x4000;
    if ((((DAT_00204897 & 0x80) != 0) &&
        (uVar6 = (int)(short)DAT_00201c70 - ((int)(uVar3 * 0x10000) >> 0x10),
        uVar4 = (int)uVar6 >> 0x1f, uVar5 = (ushort)uVar3, 0x3ff < (int)((uVar6 ^ uVar4) - uVar4)))
       && (uVar5 = DAT_00201c70 - 0x400, 0x7ffe < ((uint)DAT_00201c70 - (uVar3 & 0xffff) & 0xffff)))
    {
      uVar5 = DAT_00201c70 + 0x400;
    }
  }
  DAT_00201c70 = uVar5;
  uVar3 = *(ushort *)((char *)g_player_object + 2) & 0xfc7f | ((int)(short)DAT_00201c70 >> 0xd & 7U) << 7;
  *(char *)((char *)g_player_object + 2) = (char)uVar3;
  *(char *)((char *)g_player_object + 3) = (char)(uVar3 >> 8);
  *(byte *)((char *)g_player_object + 0x18) =
       ((byte)(DAT_00201c70 >> 8) ^ *(byte *)((char *)g_player_object + 0x18)) & 0x1f ^
       *(byte *)((char *)g_player_object + 0x18);
  if (_DAT_002048a9 != 0) {
    if (DAT_00204896 != '\0') {
      uVar3 = (uint)(_DAT_002048a9 >> 8);
      iVar7 = 0;
      if (g_vertical_velocity != 0) {
        iVar7 = uVar3 << 0x10;
      }
      if (g_vertical_velocity != 0) {
        uVar3 = ((iVar7 >> 0x10) << 0x11) >> 0x10;
      }
      sVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x32),((int)(short)uVar3 << 0x11) >> 0x10)
      ;
      if (0 < sVar1) {
        sVar1 = Ordinal_2005(0x1e,(0x1e - (uint)*(byte *)(DAT_00086df8 + 0x32)) * (int)(short)uVar3)
        ;
        uVar3 = (uint)sVar1;
      }
      if (3 < (short)uVar3) {
        FUN_00038374(g_player_object,0,0,0,(char)uVar3,0);
      }
      if ((1 < (short)uVar3) || ((DAT_002048a8 & 0x10) != 0)) {
        FUN_00072f30(0xf,0x40,((uVar3 & 0xff) + 0x31) * 4);
      }
    }
    _DAT_002048a9 = 0;
  }
  set_locomotion_state(DAT_002048a8,0);
  DAT_000858a0 = 0;
  return;
}



// New (not decompiled from the binary): a debug/testing entry point for
// demomode.c's SETPLAYERPOS command. Directly sets the fine-grained player
// position (DAT_00204880/82, format (tile<<8)|fine, 256 units/tile -- see
// commit_player_move's own tile-index derivation), persistent yaw
// (DAT_00201c70, 65536 units/360 degrees -- confirmed via the 0x2000 =
// 45-degree turn-step increments in apply_heading_turn) and pitch
// (DAT_0023beb4, signed 1/256-degree units -- see
// update_current_view_from_subject's own >>8 use of it), then reuses
// set_player_tile_position (for the integer
// tile part: object-list relink, collision height field, locomotion state)
// and commit_player_move (to pack the final fine position/yaw back into the
// player object record g_player_object) so this goes through the same object-
// sync paths real movement does, instead of duplicating them. x/y are tile
// coordinates with a fractional part (e.g. 32.5); z is the same raw height
// unit sync_camera_from_player's [playerpos] print shows (DAT_00204884,
// e.g. z=768 at spawn) -- pass back a value read from that print to land on
// an exact remembered spot; yaw/pitch are degrees.
void demo_set_player_pos(double x, double y, double z, double yaw_deg, double pitch_deg)
{
  set_player_tile_position((int)floor(x), (int)floor(y));
  if (getenv("UW_DEBUG_FLOORZ")) {
    fprintf(stderr, "[floorz] tile=(%d,%d) natural z (from set_player_tile_position) = %d, overriding to %g\n",
            (int)floor(x), (int)floor(y), (int)DAT_00204884, z);
  }
  /* Clear any in-flight smooth-turn interpolation
     (update_current_view_from_subject's DAT_0023bea8-gated add-on to
     DAT_00086e6c+0x2c): if a turn animation was still mid-flight when this
     runs, update_current_view_from_subject would add its leftover per-tick
     delta (DAT_0023be9a) on top of the DAT_00201c70 we're about to set
     below, so sync_camera_from_player's very next [playerpos] print would
     show a transient, wrong yaw for one frame
     until the animation finished on its own. Confirmed via testing: two
     back-to-back SETPLAYERPOS calls, the first (right after spawn, an
     interpolation still pending) showed the old yaw, the second (nothing
     pending any more) matched exactly. */
  DAT_0023bea8 = 0;
  /* Force the camera to track the player object right now.
     update_current_view_from_subject (the function that actually copies
     DAT_00201c70/DAT_00204880 etc. into the camera-facing DAT_00086e6c
     record sync_camera_from_player reads)
     only does that when DAT_0023b82c -- "whichever object the camera is
     currently tracking" -- equals g_player_object, the player object; normally
     true, but right after spawn/chargen it can still be unset/stale for a
     frame, so the very first SETPLAYERPOS call of a run would appear to
     not take effect (confirmed live: first call's yaw didn't show up,
     second did). Setting it here makes this reliable regardless of when
     it's called. */
  DAT_0023b82c = g_player_object;
  DAT_00204880 = (short)lround(x * 256.0);
  DAT_00204882 = (short)lround(y * 256.0);
  /* set_player_tile_position just computed a default DAT_00204884 from the
     destination tile's own floor-height table lookup; override it with the
     caller's exact value (e.g. to stand at a specific mid-air/step height,
     not just "on the floor of this tile"). */
  DAT_00204884 = (short)lround(z);
  DAT_00201c70 = (short)lround(yaw_deg * (65536.0 / 360.0));
  DAT_0023beb4 = (short)lround(pitch_deg * 256.0);
  DAT_00201c78 = DAT_00201c70;
  _DAT_002048a1 = DAT_00201c70;
  commit_player_move();
}




// was FUN_0003e4cc -- reads the player object's current HP/MP/etc.
// and pushes them into the HUD via set_hud_status_value, one call per
// status slot (0=health, 1=mana, 2=hunger-ish, 4=poison flash, ...).
// Called once per HUD refresh from enter_dungeon_view_hud_init.
void sync_player_stats_to_hud()

{
  int iVar1;
  byte bVar2;
  uint uVar3;
  
  FUN_00027708(0);
  bVar2 = *(byte *)((char *)g_player_object + 8);
  set_hud_status_value(0,bVar2);
  if (((uint)DAT_001013a4 < (uint)*(byte *)((char *)g_player_object + 0x11) * 4) ||
     ((bVar2 < 0x10 && (*(byte *)((char *)g_player_object + 0x11) != 0)))) {
    set_hud_status_value(4,3);
  }
  *(undefined1 *)((char *)g_player_object + 0x11) = 0;
  set_hud_status_value(1,*(undefined1 *)(DAT_00086df8 + 0x37));
  if (DAT_00201b68 != 9) {
    set_hud_status_value(2,(ushort)(((int)(((*(byte *)((char *)g_player_object + 0x18) & 0x1f) +
                                   ((*(ushort *)((char *)g_player_object + 2) & 0x380) >> 2)) * 0x10000) >>
                            0x10) + 8 >> 4) & 0xf);
  }
  if (*(char *)((char *)g_player_object + 8) == '\0') {
    FUN_00072288();
  }
  uVar3 = read_realtime_clock_units();
  iVar1 = ((uVar3 >> 8) - DAT_002020e4) * 0x10000;
  if (iVar1 >> 0x10 != 0) {
    uVar3 = read_realtime_clock_units();
    DAT_002020e4 = uVar3 >> 8;
    DAT_002020e8 = (char)((uint)iVar1 >> 0x10) + DAT_002020e8;
    FUN_00073634();
    if (0x14 < DAT_002020e8) {
      DAT_002020e8 = 0;
      FUN_00053c74();
    }
  }
  if ((DAT_00201b68 == 9) && (uVar3 = Ordinal_1053(), (uVar3 & 0x1f) == 0)) {
    FUN_0003c6ac();
  }
  return;
}




// was FUN_00043e20
void build_player_save_record(param_1)
undefined1 * param_1;

{
  bool bVar1;
  ushort uVar2;
  short sVar3;
  undefined1 *puVar4;
  int iVar5;
  int iVar6;
  undefined1 *puVar7;
  ushort *puVar8;
  byte *pbVar9;
  ushort local_14 [2];
  
  close_backpack_container();
  puVar4 = g_player_object;
  iVar6 = 0x1b;
  puVar7 = param_1;
  do {
    iVar5 = iVar6 + -1;
    *puVar7 = *puVar4;
    bVar1 = 0 < iVar6;
    puVar4 = puVar4 + 1;
    iVar6 = iVar5;
    puVar7 = puVar7 + 1;
  } while (iVar5 != 0 && bVar1);
  param_1[4] = param_1[4] & 0x3f;
  param_1[5] = 0;
  g_save_equip_table_ptr = param_1 + 0x23;
  g_save_record_base_ptr = param_1 + 0x5b;
  g_save_record_count = 0;
  iVar6 = 0;
  do {
    puVar8 = (ushort *)(g_save_equip_table_ptr + iVar6 * 2);
    uVar2 = *puVar8;
    *(char *)puVar8 = (char)(uVar2 & 0xffc0);
    *(char *)((char *)puVar8 + 1) = (char)((uVar2 & 0xffc0) >> 8);
    pbVar9 = g_save_equip_table_ptr + iVar6 * 2;
    *pbVar9 = *pbVar9 & 0x3f;
    pbVar9[1] = 0;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x13);
  serialize_inventory_link_chain((char *)g_player_object + 6,param_1 + 6);
  puVar4 = g_selected_object;
  if (g_cursor_holding_state == 1) {
    param_1[0x1b] = *g_selected_object;
    param_1[0x1c] = puVar4[1];
    param_1[0x1d] = puVar4[2];
    param_1[0x1e] = puVar4[3];
    param_1[0x1f] = puVar4[4];
    param_1[0x20] = puVar4[5];
    param_1[0x21] = puVar4[6];
    param_1[0x22] = puVar4[7];
    if ((g_selected_object[1] & 0x80) == 0) {
      serialize_inventory_link_chain(g_selected_object + 6,param_1 + 0x21);
    }
    sVar3 = encode_object_slot_index(g_selected_object);
    local_14[0] = local_14[0] & 0x3f | sVar3 << 6;
    free_linked_object_recursive(local_14);
  }
  return;
}



// was FUN_00043fd8
bool write_player_save_record(param_1)
char * param_1;

{
  char cVar1;
  int iVar2;
  bool bVar3;
  char acStack_114 [260];
  
  bVar3 = true;
  g_save_record_buffer = Ordinal_1041(0x4000);
  if (g_save_record_buffer == 0) {
    bVar3 = false;
  }
  else {
    build_player_save_record(g_save_record_buffer);
    g_save_record_count = g_save_record_count + 1;
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested): the real
       binary's own write_player_save_record never serializes
       DAT_0023bca8 (the player's stats/skills/quest-flags struct,
       confirmed via Ghidra decompile of the real ARM functions at
       0x43e20/0x43fd8/0x44538 -- none reference it) -- so quest flags,
       skills, difficulty, and the live game clock never actually
       survived a real save/load, even in the shipped Pocket PC game.
       Confirmed via the real UW1 savegame format documentation
       (uw-formats.txt section 9.2.1) that this struct's layout matches
       player.dat's own documented fields byte-for-byte starting at
       offset 0x1e (Strength) -- and this project's own live code
       already reads/writes this exact struct via DAT_00086df8 at those
       same documented offsets (e.g. 0xce = game_time, 0x65 = quest
       flags 0-31), confirming it's genuinely the right data, just
       never persisted. Appended after the existing (dynamically sized)
       inventory section using THIS function's own post-increment
       g_save_record_count (matching the exact count the file-length
       calculation just below uses -- build_player_save_record's own
       internal offset math runs before this +1, so the copy can't live
       there without a mismatched offset) rather than interleaved into
       the middle of the existing fixed-offset layout, so no existing
       offset changes. 220 bytes matches the documented "first 220
       bytes" of a real player.dat (the XOR-encrypted header, ending
       just past the last documented field before the equipment-slot-
       index table, which this project's own g_save_equip_table_ptr
       logic already serializes separately -- not duplicated here). */
    Ordinal_1044(g_save_record_buffer + 0x5b + g_save_record_count * 8,&DAT_0023bca8,220);
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[quest-persist] SAVE appending quest_bits=0x%x at buffer offset %d\n", *(unsigned int *)(DAT_00086df8 + 0x65), (int)(0x5b + g_save_record_count * 8));
    if (param_1 != (char *)0x0) {
      iVar2 = -(int)param_1;
      do {
        cVar1 = *param_1;
        param_1[(int)(acStack_114 + iVar2)] = cVar1;
        param_1 = param_1 + 1;
      } while (cVar1 != '\0');
      Ordinal_1063(acStack_114,s_player_dat_00085a74);
      iVar2 = open_existing_file_rw(acStack_114);
      bVar3 = iVar2 != -1;
      if (bVar3) {
        /* BUG FIX: was `write_player_status_block()` with no arguments,
           relying on leftover register state -- iVar2 (the file
           handle, used the very next line) is the value that belongs
           here, matching write_player_status_block's own param_1 role
           (same dropped-argument bug class documented throughout this
           project). */
        write_player_status_block(iVar2);
        write_file_handle(iVar2,&g_save_record_count,2);
        write_file_handle(iVar2,g_save_record_buffer,g_save_record_count * 8 + 0x5b + 220);
        Ordinal_553(iVar2);
      }
      if (g_save_record_buffer != 0) {
        Ordinal_1018();
        g_save_record_buffer = 0;
      }
      FUN_00049924(0x200);
    }
  }
  return bVar3;
}




// was FUN_00044538
void restore_player_save_record(param_1)
undefined1 * param_1;

{
  bool bVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  int iVar4;
  int iVar5;
  
  g_save_equip_table_ptr = param_1 + 0x23;
  g_save_record_base_ptr = param_1 + 0x5b;
  puVar2 = g_player_object;
  puVar3 = param_1;
  iVar4 = 0x1b;
  do {
    iVar5 = iVar4 + -1;
    *puVar2 = *puVar3;
    bVar1 = 0 < iVar4;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
    iVar4 = iVar5;
  } while (iVar5 != 0 && bVar1);
  deserialize_inventory_link_chain((char *)g_player_object + 6,param_1 + 6);
  if (g_cursor_holding_state == 1) {
    puVar2 = (undefined1 *)alloc_object_slot(0);
    g_selected_object = puVar2;
    *puVar2 = param_1[0x1b];
    puVar2[1] = param_1[0x1c];
    puVar2[2] = param_1[0x1d];
    puVar2[3] = param_1[0x1e];
    puVar2[4] = param_1[0x1f];
    puVar2[5] = param_1[0x20];
    puVar2[6] = param_1[0x21];
    puVar2[7] = param_1[0x22];
    if ((param_1[0x1c] & 0x80) == 0) {
      deserialize_inventory_link_chain(g_selected_object + 6,param_1 + 0x21);
    }
  }
  /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested) -- see
     write_player_save_record's own matching comment: restores
     DAT_0023bca8 from the same trailing offset that function now
     appends it at. g_save_record_count is already set here (the
     caller reads it directly from the file's own 2-byte header
     before calling this function), matching the exact post-increment
     count the save side used, so this offset is consistent whether
     restore_player_save_record's own caller went through a real file
     read or is just re-applying the currently-held in-memory record
     (build_player_save_record is only ever called from
     write_player_save_record, which always fills this same trailing
     block first -- never garbage). */
  Ordinal_1044(&DAT_0023bca8,param_1 + 0x5b + g_save_record_count * 8,220);
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[quest-persist] LOAD restored quest_bits=0x%x from buffer offset %d\n", *(unsigned int *)(DAT_00086df8 + 0x65), (int)(0x5b + g_save_record_count * 8));
  return;
}




void refresh_player_equipment_effects()

{
  byte bVar1;
  ushort uVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  ushort *puVar6;
  byte *iVar7; /* Was `int` -- truncated the 64-bit pointer get_scanned_object_class_effect_ptr
                  returns (see its own comment); made a real crash once
                  that return value stopped being a hardcoded 0. */
  uint uVar8;
  byte bVar9;
  ushort uVar11;
  bool bVar12;
  bool bVar13;
  undefined2 local_30;
  undefined1 local_2e [2];
  undefined1 local_2c [4];
  int local_28;
  byte bVar10;
  
  local_30 = 0;
  iVar4 = 0;
  do {
    DAT_0023be74[iVar4] = '\0';
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 4);
  iVar4 = 0;
  do {
    iVar5 = get_equipped_item_at_slot(iVar4);
    if (iVar5 != 0) {
      cVar3 = compute_object_weight();
      DAT_0023be74[(char)(&DAT_00086da8)[iVar4]] =
           cVar3 + DAT_0023be74[(char)(&DAT_00086da8)[iVar4]];
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 5);
  puVar6 = (ushort *)get_equipped_item_at_slot((*(byte *)(DAT_00086df8 + 100) & 1) + 7);
  if ((((puVar6 != (ushort *)0x0) && (uVar11 = *puVar6, (uVar11 & 0x1c0) == 0)) &&
      ((uVar11 & 0x30) == 0x30)) && ((10 < (uVar11 & 0xf) && ((uVar11 & 0xf) < 0x10)))) {
    cVar3 = compute_object_weight();
    *DAT_0023be74 = cVar3 + *DAT_0023be74;
    DAT_0023be74[1] = DAT_0023be74[1] + cVar3;
  }
  DAT_0023be74[0x12] = *(char *)(DAT_00086df8 + 0x22);
  g_scratch_object_ptr = (ushort *)get_equipped_item_at_slot(8 - (*(byte *)(DAT_00086df8 + 100) & 1));
  uVar11 = 2;
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-gfx] refresh_player_equipment_effects: weapon_hand_item=%p id=0x%x\n", (void *)g_scratch_object_ptr, g_scratch_object_ptr ? (unsigned)*g_scratch_object_ptr : 0xffff);
  if (g_scratch_object_ptr != (ushort *)0x0) {
    uVar2 = *g_scratch_object_ptr;
    if (((uVar2 & 0x1c0) == 0) && ((uVar2 & 0x30) < 0x20)) {
      uVar8 = uVar2 & 0xf;
      if ((uVar2 & 0x30) == 0) {
        if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-gfx] family0 nibble=%u table_byte(offset+6)=%d\n", uVar8, (int)(&DAT_00202806)[uVar8 * 8]);
        uVar11 = (ushort)(byte)(&DAT_00202806)[uVar8 * 8];
        uVar8 = (uint)(short)(ushort)(byte)(&DAT_00202806)[uVar8 * 8];
        bVar13 = SBORROW4(uVar8,3);
        iVar4 = uVar8 - 3;
        bVar12 = uVar8 == 3;
        if (uVar8 < 3) {
          uVar11 = 3;
        }
        else {
          bVar13 = SBORROW4(uVar8,5);
          iVar4 = uVar8 - 5;
          bVar12 = uVar8 == 5;
        }
        if (!bVar12 && iVar4 < 0 == bVar13) {
          uVar11 = 5;
        }
        iVar4 = (char)uVar11 + -3;
        goto LAB_000669a8;
      }
      iVar4 = -1;
      if (7 < uVar8) goto LAB_000669a8;
    }
  }
  iVar4 = 3;
LAB_000669a8:
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-gfx] refresh_player_equipment_effects: resolved category=%d\n", iVar4);
  request_weapon_swing_graphic(iVar4);
  DAT_0023be74[0x12] = DAT_0023be74[0x12] + (*(byte *)(DAT_00086df8 + (short)uVar11 + 0x21) >> 1);
  reset_player_derived_state();
  iVar5 = 0;
  bVar10 = 0;
  bVar9 = 0;
  iVar4 = 0;
  bVar12 = false;
  do {
    puVar6 = g_selected_object;
    if (!bVar12) {
      /* Was get_equipped_item_at_slot(iVar4) -- scanning raw equip slots 0-3, which
         never hold a light source. Disassembly of the real binary
         (0x669e8-0x669f4) shows an indirect table lookup was dropped:
         r8 is loaded from the literal pool with g_light_source_slots, then
         `ldrsbne r0,[r5,r8]` reads g_light_source_slots[iVar4] (the real
         light-source-eligible slots {5,6,7,8}) before calling
         get_equipped_item_at_slot. The sibling light-fuel-burn loop in FUN_0005404c
         (uw.c ~45174) already uses this exact
         `get_equipped_item_at_slot((char)(&g_light_source_slots)[iVar9])` pattern for the
         identical 0x90-class/radius-nibble check, confirming this is
         the real call shape here too -- this was the actual cause of
         [[torch-ambient-light-scan-range-mismatch]]: a lit torch
         auto-equips to slot 5 (widget 6), which this loop never read. */
      puVar6 = (ushort *)get_equipped_item_at_slot((int)(char)(&g_light_source_slots)[iVar4]);
    }
    g_scratch_object_ptr = puVar6;
    if (getenv("UW_DEBUG_AMBIENT"))
      fprintf(stderr, "[ambient] light-scan slot=%d puVar6=%p id=0x%03x nibble=0x%x\n",
              (int)iVar4, (void *)puVar6, puVar6 ? (unsigned)(*puVar6 & 0x1ff) : 0u,
              puVar6 ? (unsigned)(*puVar6 & 0xf) : 0u);
    if ((((puVar6 != (ushort *)0x0) && ((*puVar6 & 0x1f0) == 0x90)) &&
        (uVar11 = *puVar6 & 0xf, 3 < uVar11)) && (uVar11 < 8)) {
      iVar7 = get_scanned_object_class_effect_ptr();
      bVar1 = iVar7[1];
      if (bVar10 < bVar1) {
        /* Also a bare call (no argument) -- but whatever DAT_000842b0
           value this leaves is unconditionally overwritten a few lines
           below by this same function's own definitive
           set_ambient_bias_with_light(0)/set_ambient_bias_without_light(0) decision (made
           from the aggregated bVar9/bVar10 this loop is computing), so
           it's provably inert either way, not fixed alongside the real
           bug in that later call. */
        set_ambient_bias_with_light();
        iVar5 = iVar4;
        bVar9 = bVar1;
        bVar10 = bVar1;
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    bVar12 = iVar4 == 4;
  } while (iVar4 < 5);
  *(byte *)(DAT_00086df8 + 99) = bVar9 * '\x10' + (char)iVar5;
  if (getenv("UW_DEBUG_AMBIENT")) {
    int _s;
    fprintf(stderr, "[ambient] light-scan result: bVar9=%d iVar5=%d -> DAT_00086df8+99=0x%02x; full slot dump:\n",
            (int)bVar9, (int)iVar5, (unsigned)*(byte *)(DAT_00086df8 + 99));
    for (_s = 0; _s < 11; _s++) {
      ushort *_o = (ushort *)get_equipped_item_at_slot(_s);
      fprintf(stderr, "  slot=%d ptr=%p id=0x%03x nibble=0x%x\n", _s, (void *)_o,
              _o ? (unsigned)(*_o & 0x1ff) : 0u, _o ? (unsigned)(*_o & 0xf) : 0u);
    }
  }
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    iVar4 = 0;
    do {
      bVar9 = *(byte *)(DAT_00086df8 + iVar4 * 2 + 0x3e);
      apply_equipped_item_effect(bVar9 & 0xf,bVar9 >> 4,&local_30,0xffffffff);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
  }
  iVar4 = 0;
  do {
    g_scratch_object_ptr = (ushort *)get_equipped_item_at_slot(iVar4);
    if ((g_scratch_object_ptr != (ushort *)0x0) &&
       (iVar5 = FUN_00045f9c(*g_scratch_object_ptr & 0x1ff,iVar4), iVar5 != 0)) {
      iVar5 = FUN_0007ca50(g_scratch_object_ptr,local_2c,local_2e,&local_28);
      if ((iVar5 == 0) || (local_28 != 0)) {
        if ((*g_scratch_object_ptr & 0x1ff) == 0x2f) {
          DAT_0023bc98 = 1;
        }
      }
      else {
        iVar5 = apply_equipped_item_effect(local_2c[0],local_2e[0],&local_30,iVar4);
        if (iVar5 != 0) {
          FUN_0007cc30(g_scratch_object_ptr);
        }
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 0xb);
  apply_equipment_effect_penalties(local_30);
  if (DAT_002020d8 == 0) {
    /* *(char*)(DAT_00086df8+99) is the player's current light radius
       (upper nibble; 0 = no equipped light source at all, maintained by
       this same function's own scan of equip slots above + a separate
       updater at uw.c ~55510). ==0 (no light) -> set_ambient_bias_without_light(0), the
       mild "8 - param_1" dimming bias; else (a light source IS lit) ->
       set_ambient_bias_with_light below, the much stronger "-0x20 -
       param_1" brightening bias (more negative = brighter -- see that
       function's own comment for the full sign-convention explanation). */
    if (*(char *)(DAT_00086df8 + 99) == '\0') {
      set_ambient_bias_without_light(0);
    }
    else {
      /* Was a bare call -- ran on leftover register garbage instead of
         a real argument. The sibling call just above explicitly passes
         0 to set_ambient_bias_without_light; mirror that here too. */
      set_ambient_bias_with_light(0);
    }
  }
  else {
    load_shading_level_config(6);
  }
  update_screen_flicker_effect((*(byte *)(DAT_00086df8 + 0x61) & 0xc) != 0);
  FUN_0003dbd8();
  FUN_0003dca4(0xffffffff);
  return;
}




// was FUN_00073ec0
void adjust_player_hp(param_1,param_2)
char *param_1;
char param_2;

{
  ushort uVar1;
  short sVar2;
  
  if (param_1 == g_player_object) {
    if (param_2 < '\x01') {
      sVar2 = (ushort)*(byte *)((char *)g_player_object + 8) - (short)param_2;
    }
    else {
      uVar1 = Ordinal_1053();
      sVar2 = (ushort)*(byte *)((char *)g_player_object + 8) +
              ((short)(((uVar1 & 3) + (short)param_2) * (ushort)*(byte *)(DAT_0023be74 + 4)) >> 4) +
              1;
    }
    if ((short)(ushort)*(byte *)(DAT_0023be74 + 4) < sVar2) {
      *(byte *)((char *)g_player_object + 8) = *(byte *)(DAT_0023be74 + 4);
    }
    else {
      *(char *)((char *)g_player_object + 8) = (char)sVar2;
    }
    refresh_experience_display();
  }
  return;
}




// was FUN_00065b90 -- packs live game state (recent equip/attack
// bytes, world x/y/z/facing, locomotion state) into the 0xd2-byte
// DAT_00086df8 player-status block, then writes it to file handle
// param_1 through a length-prefixed, presumably checksummed/XOR'd
// wrapper (FUN_0007ef78). Called from write_player_save_record as the
// player.dat header write step.
void write_player_status_block(param_1)
undefined4 param_1;

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  byte local_14 [4];
  
  local_14[0] = *DAT_00086df8 ^ 0xaa;
  DAT_00086df8[0x1e] = *(byte *)(DAT_0023be74 + 5);
  DAT_00086df8[0x1f] = *(byte *)(DAT_0023be74 + 6);
  DAT_00086df8[0x20] = *(byte *)(DAT_0023be74 + 7);
  DAT_00086df8[0x35] = *(byte *)((char *)g_player_object + 8);
  DAT_00086df8[0x36] = *(byte *)(DAT_0023be74 + 4);
  uVar1 = DAT_00204880;
  DAT_00086df8[0x54] = (byte)DAT_00204880;
  DAT_00086df8[0x55] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00204882;
  DAT_00086df8[0x56] = (byte)DAT_00204882;
  DAT_00086df8[0x57] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00204884;
  DAT_00086df8[0x58] = (byte)DAT_00204884;
  DAT_00086df8[0x59] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00201c70;
  DAT_00086df8[0x5a] = (byte)DAT_00201c70;
  DAT_00086df8[0x5b] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00201b68;
  DAT_00086df8[0x5c] = (byte)DAT_00201b68;
  DAT_00086df8[0x5d] = (byte)((ushort)uVar1 >> 8);
  bVar2 = FUN_00072b58();
  DAT_00086df8[0xb5] = (bVar2 ^ DAT_00086df8[0xb5]) & 3 ^ DAT_00086df8[0xb5];
  bVar2 = FUN_00072b3c();
  DAT_00086df8[0xb5] = DAT_00086df8[0xb5] & 0xf3 | (bVar2 & 3) << 2;
  uVar3 = *(ushort *)(DAT_00086df8 + 0xb6) & 0xf807 | (uint)DAT_002048a8 << 3;
  DAT_00086df8[0xb6] = (byte)uVar3;
  DAT_00086df8[0xb7] = (byte)(uVar3 >> 8);
  write_file_handle(param_1,local_14,1);
  FUN_0007ef78(param_1,local_14[0],DAT_00086df8,0xd2);
  return;
}



// was FUN_00065d4c -- read-side counterpart to
// write_player_status_block: reads the 0xd2-byte DAT_00086df8 player-
// status block from file handle param_1 and unpacks it back into the
// live game-state globals it was packed from.
void read_player_status_block(param_1)
undefined4 param_1;

{
  undefined1 local_10 [4];
  
  read_file_handle(param_1,local_10,1);
  FUN_0007ee9c(param_1,local_10[0],DAT_00086df8,0xd2);
  *(undefined1 *)(DAT_0023be74 + 5) = *(undefined1 *)(DAT_00086df8 + 0x1e);
  *(undefined1 *)(DAT_0023be74 + 6) = *(undefined1 *)(DAT_00086df8 + 0x1f);
  *(undefined1 *)(DAT_0023be74 + 7) = *(undefined1 *)(DAT_00086df8 + 0x20);
  *(undefined1 *)((char *)g_player_object + 8) = *(undefined1 *)(DAT_00086df8 + 0x35);
  *(undefined1 *)(DAT_0023be74 + 4) = *(undefined1 *)(DAT_00086df8 + 0x36);
  DAT_00204880 = *(undefined2 *)(DAT_00086df8 + 0x54);
  DAT_00204882 = *(undefined2 *)(DAT_00086df8 + 0x56);
  DAT_00204884 = *(undefined2 *)(DAT_00086df8 + 0x58);
  DAT_00201c70 = *(undefined2 *)(DAT_00086df8 + 0x5a);
  DAT_00201b68 = *(undefined2 *)(DAT_00086df8 + 0x5c);
  DAT_002048a8 = (undefined1)(*(ushort *)(DAT_00086df8 + 0xb6) >> 3);
  FUN_00072c10(*(byte *)(DAT_00086df8 + 0xb5) & 3);
  FUN_00072b74(*(byte *)(DAT_00086df8 + 0xb5) >> 2 & 3);
  FUN_0005d2b0();
  FUN_0003dca4(*(ushort *)(DAT_00086df8 + 0xb6) & 7);
  return;
}




// was FUN_00065eb4 -- recomputes the player's derived stealth/hide
// thresholds (DAT_00086db0/DAT_00086db1, die-roll-jittered from a
// player-stat byte at DAT_00086df8+0x2e) and resets a batch of
// movement/combat scratch flags and counters (including the step-
// counter default DAT_000858c4, doubled on hard difficulty). Called
// from refresh_player_equipment_effects after an equipment change.
void reset_player_derived_state()

{
  char *iVar1;
  char cVar2;

  iVar1 = DAT_00086df8;
  DAT_0020330c = 0;
  cVar2 = Ordinal_2005(3,*(undefined1 *)(DAT_00086df8 + 0x2e));
  DAT_00086db0 = '\r' - cVar2;
  cVar2 = Ordinal_2005(5,*(undefined1 *)(iVar1 + 0x2e));
  DAT_00086db1 = '\x0f' - cVar2;
  DAT_0020208c = 0;
  DAT_0010060c = 0;
  DAT_0010060d = 0;
  DAT_0010060e = 0;
  DAT_0010060f = 0;
  DAT_0023bc9c = 0;
  DAT_0023bc98 = 0;
  DAT_002020d0 = 0;
  DAT_002020dc = 0;
  DAT_002020d8 = 0;
  DAT_002020d4 = 0;
  DAT_000858c4 = 0x90;
  if (DAT_0023bc94 != 0) {
    DAT_000858c4 = 400;
  }
  DAT_002046cc = 0;
  return;
}




// was FUN_000660d4 -- toggles a randomized screen flicker effect
// tracked in DAT_00086db4 (-1=off, 0/1/2 = which of 3 sub-effects):
// param_1==0 cancels any active effect (restoring palette bank 0, or
// stopping toggle_light_table_flicker's effect); param_1!=0 with no effect currently
// active picks a random one (or forces sub-effect 0 if DAT_00086db8
// is set) and starts it -- sub-effect 1 randomly cycles the palette
// bank, sub-effect 2 drives toggle_light_table_flicker. Called from
// refresh_player_equipment_effects gated on bits 2-3 of the player's
// status byte (DAT_00086df8+0x61) -- likely a worn item's
// cursed/poisoned status flags, not confirmed.
void update_screen_flicker_effect(param_1)
int param_1;

{
  int uw_ord2005_rem_125 = 0;
  ushort uVar1;
  undefined4 uVar2;
  char extraout_r1;
  
  if (param_1 == 0) {
    if (-1 < DAT_00086db4) {
      if (DAT_00086db4 == '\x01') {
        set_palette_bank(0);
      }
      else if (DAT_00086db4 == '\x02') {
        toggle_light_table_flicker(0);
      }
      DAT_00086db4 = -1;
    }
  }
  else if (DAT_00086db4 < '\0') {
    if (DAT_00086db8 == 0) {
      uVar2 = Ordinal_1053();
      uw_ord2005_rem_125 = ((int)(uVar2)) % (3);
      DAT_00086db4 = uw_ord2005_rem_125;
    }
    else {
      DAT_00086db4 = '\0';
      DAT_00086db8 = 0;
    }
    if (DAT_00086db4 == '\x01') {
      uVar1 = Ordinal_1053();
      set_palette_bank(uVar1 & 7);
    }
    else if (DAT_00086db4 == '\x02') {
      toggle_light_table_flicker(1);
    }
  }
  return;
}




// was FUN_000661b0 -- applies one "intrinsic equipment effect" opcode
// (param_1, 0-0xd) with magnitude/argument param_2, against scratch
// state param_3 and an equipment-slot/object index param_4. Called
// from refresh_player_equipment_effects for both the fixed light-
// radius contributions packed at DAT_00086df8+0x3e and per-equipped-
// item property effects it resolves via FUN_00045f9c/FUN_0007ca50.
// Individual opcode semantics aren't all confirmed (several, e.g. 4-8
// and 10, are no-ops in this decompile); named for the dispatcher's
// overall role, not a verified meaning of every case.
undefined4 apply_equipped_item_effect(param_1,param_2,param_3,param_4)
undefined1 param_1;
byte param_2;
ushort * param_3;
int param_4;

{
  uint uVar1;
  byte *pbVar2;
  undefined4 *puVar3;
  char *pcVar4;
  byte bVar5;
  int iVar6;
  char cVar7;
  ushort uVar8;
  short local_1c [2];
  
  switch(param_1) {
  case 0:
    if (*(byte *)(DAT_00086df8 + 99) >> 4 < param_2) {
      *(byte *)(DAT_00086df8 + 99) = param_2 << 4;
    }
    break;
  case 1:
    pbVar2 = &DAT_0020208c;
    bVar5 = (byte)(1 << (uint)(byte)(param_2 - 1)) | DAT_0020208c;
LAB_0006636c:
    *pbVar2 = bVar5;
    break;
  case 2:
    if ((ushort)param_2 <= *param_3 >> 4) {
      return 0;
    }
    uVar8 = (*param_3 & 0xf) + (ushort)param_2 * 0x10;
    goto LAB_00066290;
  case 3:
    uVar1 = (uint)param_2;
    if (uVar1 == 1) {
      DAT_0010060c = DAT_0010060c + '\x03';
      DAT_0010060d = DAT_0010060d + '\x03';
      DAT_0010060e = DAT_0010060e + '\x03';
      DAT_0010060f = DAT_0010060f + '\x03';
      return 0;
    }
    if (4 < uVar1) {
      if (9 < uVar1) {
        return 0;
      }
      DAT_0020330c = DAT_0020330c | *(byte *)((intptr_t)&DAT_00086db8 + uVar1 + 3);
      return 0;
    }
    uVar8 = *param_3 | (ushort)(1 << (uVar1 - 1 & 0xff));
LAB_00066290:
    *param_3 = uVar8;
    break;
  case 4:
    break;
  case 5:
    break;
  case 6:
    break;
  case 7:
    break;
  case 8:
    break;
  case 9:
    FUN_00074028(g_player_object);
    break;
  case 10:
    break;
  case 0xb:
    if (param_2 == 0) {
      puVar3 = &DAT_002020d0;
    }
    else if (param_2 == 1) {
      puVar3 = &DAT_002020d8;
    }
    else {
      if (param_2 != 2) {
        if (param_2 == 3) {
          DAT_000858c4 = 0;
          return 0;
        }
        if (param_2 == 0xe) {
          pbVar2 = &DAT_002046cc;
          bVar5 = DAT_002046cc | 1;
        }
        else {
          if (param_2 != 0xf) {
            return 0;
          }
          pbVar2 = &DAT_002046cc;
          bVar5 = DAT_002046cc | 2;
        }
        goto LAB_0006636c;
      }
      puVar3 = &DAT_002020d4;
    }
    goto LAB_00066398;
  case 0xc:
    param_4 = param_4 << 0x10;
    iVar6 = param_4 >> 0x10;
    if (-1 < iVar6) {
      if (iVar6 < 5) {
        local_1c[0] = (short)(char)(&DAT_00086da8)[iVar6];
      }
      else {
        local_1c[0] = 0;
        param_4 = 1;
      }
      local_1c[1] = 0xffff;
      if (4 < iVar6) {
        local_1c[1] = (short)param_4;
      }
      if (local_1c[0] != -1) {
        iVar6 = 0;
        do {
          if (1 < iVar6) {
            return 0;
          }
          cVar7 = '\0';
          if ((param_2 & 8) == 0) {
            (&DAT_0010060c)[local_1c[iVar6]] =
                 (param_2 & 7) + (&DAT_0010060c)[local_1c[iVar6]] + '\x01';
          }
          else {
            cVar7 = (param_2 & 7) + 1;
          }
          pcVar4 = (char *)(local_1c[0] + DAT_0023be74);
          *pcVar4 = cVar7 + *pcVar4;
          iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        } while (local_1c[iVar6] != -1);
      }
    }
    break;
  case 0xd:
    if (param_2 != 4) {
      return 0;
    }
    puVar3 = &DAT_0023bc9c;
LAB_00066398:
    *puVar3 = 1;
  }
  return 0;
}




// was FUN_000664bc -- fills param_1[0..2] (default color index 0x15
// each) with per-light-source color indices derived from the ambient-
// light contributions packed at DAT_00086df8+0x3e (same bitfield
// layout apply_equipped_item_effect's light scan uses), via the
// DAT_00086dc8 type->base-color lookup table plus the light-level
// nibble. Consumed both to render a HUD light-color indicator
// (update_light_source_color_icons) and to pick a "you see a <color> light" message
// string fragment.
void compute_light_source_colors(param_1)
undefined1 * param_1;

{
  char cVar1;
  uint uVar2;

  *param_1 = 0x15;
  param_1[1] = 0x15;
  param_1[2] = 0x15;
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    uVar2 = 0;
    do {
      cVar1 = (&DAT_00086dc8)[*(byte *)(DAT_00086df8 + uVar2 * 2 + 0x3e) & 0xf];
      param_1[uVar2] = cVar1;
      param_1[uVar2] = (*(byte *)(DAT_00086df8 + uVar2 * 2 + 0x3e) >> 4) + cVar1;
      uVar2 = uVar2 + 1 & 0xff;
    } while (uVar2 < (*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
  }
  return;
}




// was FUN_00066594 -- on level 7 only (DAT_00201b68==7), swaps the
// special floor texture between ids 0xc and 0xe via
// load_floor_texture_arenas as param_1 toggles on/off, then sets or
// clears bit 12 of the player status word at DAT_00086df8+0x61/0x62
// to record the current state. Called with a quest-flag byte
// (DAT_0023bc9c, set by apply_equipped_item_effect's opcode 0xd) and
// with a bit read back out of that same status word elsewhere -- exact
// narrative trigger (lava cooling/heating? a specific quest item?) not
// confirmed.
void update_level7_floor_hazard_state(param_1)
uint param_1;

{
  char cVar1;
  uint uVar2;
  
  if (DAT_00201b68 == 7) {
    cVar1 = -1;
    if (param_1 == 0) {
      if (DAT_0023adc0 == 0xc) {
        cVar1 = '\x0e';
      }
    }
    else if (DAT_0023adc0 != 0xc) {
      cVar1 = '\f';
    }
    if (-1 < cVar1) {
      /* BUG FIX: was `load_floor_texture_arenas()` with no arguments,
         relying on leftover register state -- cVar1 (just computed
         above, the new special-floor texture id 0xc/0xe) is the value
         that belongs here, matching load_floor_texture_arenas' own
         param_1 role (same dropped-argument bug class documented
         throughout this project). */
      load_floor_texture_arenas(cVar1);
    }
  }
  uVar2 = *(ushort *)(DAT_00086df8 + 0x61) & 0xefff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar2;
  *(byte *)(DAT_00086df8 + 0x62) = (byte)(uVar2 >> 8) | (byte)(((param_1 & 1) << 0xc) >> 8);
  return;
}




// was FUN_00066634 -- final step of refresh_player_equipment_effects:
// param_1 is the effect-flag bitmask accumulated by
// apply_equipped_item_effect's scan over equipped items (bit 0 unused,
// bits 1-3 each an independent penalty). For each set bit, reduces
// the player's stealth (DAT_00086db0, capped at 0x10/tick) or hide
// (DAT_00086db1, capped at 5 or 0x10/tick depending on which bit)
// threshold. Also adds a fixed per-slot offset into the DAT_0023be74
// scratch array (0-3, purpose not confirmed), then refreshes the
// level-7 floor hazard state and the HUD light-color indicator.
void apply_equipment_effect_penalties(param_1)
uint param_1;

{
  uint uVar1;
  uint uVar2;
  byte bVar3;
  byte bVar4;
  byte bVar5;
  undefined1 auStack_c [4];
  
  bVar4 = 0;
  bVar5 = DAT_00086db0;
  do {
    if ((param_1 & 1) != 0) {
      if (bVar4 == 1) {
        bVar3 = bVar5;
        if (0x10 < bVar5) {
          bVar3 = 0x10;
        }
        bVar5 = bVar5 - bVar3;
        DAT_00086db0 = bVar5;
      }
      else if (bVar4 == 2) {
        bVar3 = DAT_00086db1;
        if (5 < DAT_00086db1) {
          bVar3 = 5;
        }
        DAT_00086db1 = DAT_00086db1 - bVar3;
      }
      else if (bVar4 == 3) {
        bVar3 = DAT_00086db1;
        if (0x10 < DAT_00086db1) {
          bVar3 = 0x10;
        }
        DAT_00086db1 = DAT_00086db1 - bVar3;
      }
    }
    bVar4 = bVar4 + 1;
    uVar1 = param_1 & 0xffff;
    param_1 = uVar1 >> 1;
  } while (bVar4 < 4);
  uVar2 = 0;
  do {
    *(byte *)(uVar2 + DAT_0023be74) = ((byte)(uVar1 >> 5) & 0xf) + *(char *)(uVar2 + DAT_0023be74);
    uVar2 = uVar2 + 1 & 0xff;
  } while (uVar2 < 4);
  update_level7_floor_hazard_state(DAT_0023bc9c);
  compute_light_source_colors(auStack_c);
  update_light_source_color_icons(auStack_c);
  return;
}




// WARNING: Removing unreachable block (ram,0x000667b0)

int compute_object_weight(param_1)
ushort * param_1;

{
  ushort uVar1;
  int iVar2;
  
  uVar1 = *param_1;
  if (((uVar1 & 0x1c0) == 0) && ((uVar1 & 0x30) < 0x20)) {
    iVar2 = 0;
  }
  else {
    iVar2 = (((int)((uint)(byte)(&g_object_weight_table)[(uVar1 & 0x1ff) * 4] * ((byte)param_1[2] & 0x3f)) >>
             6) + 1) * 0x10000 >> 0x10;
  }
  return iVar2;
}




// was FUN_0006907c -- starts a smooth camera transition: sets the
// "turn animation in flight" flag (DAT_0023bea8, gates
// update_current_view_from_subject's own per-tick facing interpolation),
// resets the camera-shake accumulators, forces a resync, and computes
// an eye-height bob offset from the player's landing/jump state.
// Called after teleporting the player (set_player_tile_position) or
// other position changes that should ease the view in rather than
// snap it.
void trigger_view_transition()

{
  int uw_ord2005_rem_126 = 0;
  uint uVar1;
  char cVar2;
  char cVar3;
  ushort uVar4;
  undefined4 uVar5;
  int extraout_r1;
  uint uVar6;
  char *iVar7;
  byte bVar8;
  short sVar9;
  bool bVar10;
  
  cVar3 = '\x01';
  DAT_0023bea8 = 1;
  bVar8 = 1;
  FUN_00049924(2);
  DAT_0023be9e = 0;
  DAT_0023be9c = 0;
  DAT_0023be9a = 0;
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 0x11) != 0) &&
     (sVar9 = -(ushort)*(byte *)(DAT_00086df8 + 0xb9), DAT_0023be98 = sVar9,
     0x50 < *(byte *)(DAT_00086df8 + 0xb9))) {
    iVar7 = (int)g_jump_ascent_timer;
    cVar2 = Ordinal_2005((int)DAT_00202078 >> 1,(int)(iVar7) << 2);
    cVar3 = (char)(cVar2 + -3);
    if ((cVar2 + -3) * 0x1000000 >> 0x18 < 1) {
      cVar3 = '\x01';
    }
    bVar8 = DAT_0023bf18 >> 4;
    if (iVar7 == 0) {
      uVar4 = Ordinal_1053();
      DAT_0023be9e = (uVar4 & 0x1ff) - 0x100;
      sVar9 = DAT_0023be98;
    }
    else {
      DAT_0023be9e = (short)(char)(&DAT_00086e58)[(char)bVar8] * (short)cVar3 * 0x40;
    }
    DAT_0023be98 = sVar9 + (short)(char)(&DAT_00086e58)[(int)(char)bVar8 + 2U & 0xf] * (short)cVar3
                           * 2;
    uVar4 = Ordinal_1053();
    DAT_0023be9a = ((uVar4 & 0x7f) - 0x40) * (short)cVar3;
    uVar4 = Ordinal_1053();
    DAT_0023be9c = ((uVar4 & 0x7f) - 0x40) * (short)cVar3;
  }
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 2) != 0) && (DAT_0023bc98 == 0)) {
    uVar5 = Ordinal_1053();
    uw_ord2005_rem_126 = ((int)(uVar5)) % (5);
    if (uw_ord2005_rem_126 == 0) {
      FUN_00038374(g_player_object,0,0,0,1,8);
    }
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 8) != 0) {
    uVar6 = 0x10 - (DAT_0023bf18 >> 3);
    uVar1 = (int)uVar6 >> 0x1f;
    DAT_0023be98 = (short)(((uVar6 ^ uVar1) - uVar1) * 0x10000 >> 0x10) * 3;
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 0x60) != 0) {
    iVar7 = DAT_00086df8;
    if ((*(byte *)(DAT_00086df8 + 0xb8) & 0x40) != 0) {
      bVar10 = DAT_0023bf14 == '\0';
      DAT_0023bf14 = DAT_0023bf14 + -1;
      if (bVar10) {
        *(byte *)(DAT_00086df8 + 0xb8) = *(byte *)(DAT_00086df8 + 0xb8) ^ 0x40;
        FUN_00049924(2);
      }
      iVar7 = DAT_00086df8;
      cVar3 = Ordinal_2005(10,DAT_0023bf14);
      if ('\b' < cVar3) {
        cVar3 = '\b';
      }
    }
    if ((*(byte *)(iVar7 + 0xb8) & 0x20) != 0) {
      bVar10 = DAT_0023bf10 == 0;
      DAT_0023bf10 = DAT_0023bf10 - 1;
      if (bVar10) {
        *(byte *)(iVar7 + 0xb8) = *(byte *)(iVar7 + 0xb8) ^ 0x20;
        FUN_00049924(2);
      }
      bVar8 = DAT_0023bf10 >> 3;
      if (3 < bVar8) {
        bVar8 = 3;
      }
    }
    cVar3 = bVar8 + cVar3;
    uVar4 = Ordinal_1053();
    DAT_0023be9a = ((uVar4 & 0xff) - 0x80) * (short)cVar3 + DAT_0023be9a;
    uVar4 = Ordinal_1053();
    DAT_0023be9c = ((uVar4 & 0x7f) - 0x40) * (short)cVar3 + DAT_0023be9c;
    uVar4 = Ordinal_1053();
    DAT_0023be9e = ((uVar4 & 0x1ff) - 0x100) * (short)cVar3 + DAT_0023be9e;
  }
  return;
}



// was FUN_00069424 -- sets a movement-animation sub-timer
// (DAT_0023bf10 for param_1==0x20 "landing", DAT_0023bf14 for
// param_1==0x40 "jump") to param_2 and ORs the corresponding bit into
// the player's landing-state status byte (DAT_00086df8+0xb8).
void set_movement_animation_timer(param_1,param_2)
byte param_1;
undefined1 param_2;

{
  undefined1 *puVar1;
  
  if (param_1 == 0x20) {
    puVar1 = &DAT_0023bf10;
  }
  else {
    if (param_1 != 0x40) {
      return;
    }
    puVar1 = &DAT_0023bf14;
  }
  *puVar1 = param_2;
  *(byte *)(DAT_00086df8 + 0xb8) = *(byte *)(DAT_00086df8 + 0xb8) | param_1;
  return;
}



// Writes g_current_view (world x/y/elevation/facing + camera-shake
// offsets) from whichever object DAT_0023b82c currently designates as
// the view subject -- the player object (the common case), a specific
// NPC/mobile object being looked at, or none (falls back to saved
// DAT_0023be90-family scratch values). NOT the same function as
// sync_camera_from_player below (was FUN_00069938), which goes the
// other direction: g_current_view -> the DAT_000db438-family 3D camera
// globals. Distinct names matter here since this file already had two
// functions colliding on this name before this rename.
void update_current_view_from_subject()

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_c;
  short local_a;

  if (DAT_0023b82c == g_player_object) {
    g_current_view->view_x = DAT_00204880;
    g_current_view->view_y = DAT_00204882;
    g_current_view->view_elevation = DAT_00204884 + 0xa4;
    g_current_view->view_facing = DAT_00201c70;
    g_current_view->view_shake_x = DAT_0023beb4;
    g_current_view->view_shake_y = DAT_0023beb8;
    if (DAT_0023bea8 == 0) {
      return;
    }
    if (getenv("UW_DEBUG_EYEHEIGHT"))
      fprintf(stderr, "[eyeheight] bea8=%d be98=%d base=%d -> %d\n",
              (int)DAT_0023bea8, (int)DAT_0023be98, (int)g_current_view->view_elevation,
              (int)(g_current_view->view_elevation + DAT_0023be98));
    g_current_view->view_elevation = g_current_view->view_elevation + DAT_0023be98;
    if (1000 < g_current_view->view_elevation) {
      g_current_view->view_elevation = 1000;
    }
    g_current_view->view_facing = g_current_view->view_facing + DAT_0023be9a;
    g_current_view->view_shake_x = g_current_view->view_shake_x + DAT_0023be9c;
    sVar4 = g_current_view->view_shake_y + DAT_0023be9e;
LAB_00069910:
    g_current_view->view_shake_y = sVar4;
  }
  else {
    if (DAT_0023b82c == 0) {
      g_current_view->view_x = DAT_0023be90;
      g_current_view->view_elevation = DAT_0023be94;
      g_current_view->view_y = DAT_0023be92;
      g_current_view->view_facing = DAT_0023bf00;
      g_current_view->view_shake_x = DAT_0023bf02;
      uVar2 = DAT_0023bf04;
    }
    else {
      if (DAT_002046b8 < DAT_0023b82c) {
        g_current_view->view_x =
             (short)((*(ushort *)(DAT_0023b82c + 0x16) & 0xfc00) >> 2) +
             (ushort)(*(byte *)(DAT_0023b82c + 3) & 0xe0);
        g_current_view->view_y =
             (*(byte *)(DAT_0023b82c + 3) & 0x1c) * 8 +
             (*(ushort *)(DAT_0023b82c + 0x16) & 0x3f0) * 0x10;
        g_current_view->view_elevation = ((*(byte *)(DAT_0023b82c + 2) & 0x7f) + 0x16) * 8;
        g_current_view->view_facing =
             ((*(ushort *)(DAT_0023b82c + 2) & 0xff80) +
             (short)(((*(byte *)(DAT_0023b82c + 0x18) & 0x1f) << 0x12) >> 0x10)) * 0x40;
        return;
      }
      if (DAT_0023b82c != DAT_002046b8 - 0x1b) {
        if (DAT_0023b82c != DAT_002046b8 - 0x36) {
          return;
        }
        angle_to_screen_delta(DAT_0023bea4,&local_a,&local_c);
        iVar1 = (int)((0x40 - (uint)DAT_0023bf08) * 0x10000) >> 0x10;
        iVar5 = (int)local_a;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0xff;
        }
        iVar5 = (short)((uint)iVar5 >> 8) * iVar1;
        iVar3 = (int)local_c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0x3f;
        }
        if (iVar3 < 0) {
          iVar3 = iVar3 + 0xff;
        }
        iVar1 = (short)((uint)iVar3 >> 8) * iVar1;
        if (iVar1 < 0) {
          iVar1 = iVar1 + 0x3f;
        }
        iVar5 = (int)DAT_0023bea0 * (int)(short)(iVar5 >> 6);
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        g_current_view->view_x =
             (short)(iVar5 >> 1) + (short)(((uint)DAT_0023beac << 0x18) >> 0x10) + 0x80;
        iVar1 = (int)DAT_0023bea0 * (int)(short)(iVar1 >> 6);
        if (iVar1 < 0) {
          iVar1 = iVar1 + 1;
        }
        g_current_view->view_y =
             (short)(iVar1 >> 1) + (short)(((uint)DAT_0023beb0 << 0x18) >> 0x10) + 0x80;
        g_current_view->view_elevation = DAT_00204884 + (0x52 - DAT_0023bf08) * 2;
        g_current_view->view_facing = DAT_0023bea4 + 0x7fff;
        g_current_view->view_shake_x = 0;
        sVar4 = DAT_0023bf08 << 0xb;
        goto LAB_00069910;
      }
      angle_to_screen_delta((int)DAT_00201c70,&local_c,&local_a);
      g_current_view->view_x = DAT_00204880 - (local_c >> 7);
      g_current_view->view_y = DAT_00204882 - (local_a >> 7);
      g_current_view->view_elevation = DAT_00204884 + 0x148;
      g_current_view->view_facing = DAT_00201c70;
      g_current_view->view_shake_x = DAT_0023beb4;
      uVar2 = DAT_0023beb8;
    }
    g_current_view->view_shake_y = uVar2;
  }
  return;
}



// was FUN_00069938 -- sync the 3D camera globals (DAT_000db438.. position,
// DAT_000db448 pitch / DAT_000db44c yaw) from the player object DAT_00086e6c
// (pos at +10/+0x12, view angle at +0x2c), applying the DAT_0023b4a0 screen
// -rotation quadrant. Called from build_frame_draw_list each redraw.
void sync_camera_from_player()

{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  intptr_t iVar4; // holds DAT_00086e6c (a real pointer); was `int`, truncating it
  ushort uVar5;
  int iVar6;
  ushort uVar7;
  short sVar8;
  ushort local_20;

  cVar1 = DAT_0023b4a0;
  iVar4 = DAT_00086e6c;
  sVar8 = 0;
  uVar2 = g_current_view->view_x & 0xff;
  uVar5 = g_current_view->view_y & 0xff;
  uVar3 = uVar2;
  uVar7 = uVar5;
  if (DAT_0023b4a0 != '\0') {
    if (DAT_0023b4a0 == '\x01') {
      uVar3 = 0xff - uVar5;
      uVar7 = uVar2;
    }
    else if (DAT_0023b4a0 == '\x02') {
      uVar3 = 0xff - uVar2;
      uVar7 = 0xff - uVar5;
    }
    else {
      uVar3 = local_20;
      uVar7 = local_20;
      if (DAT_0023b4a0 == '\x03') {
        uVar3 = uVar5;
        uVar7 = 0xff - uVar2;
      }
    }
  }
  DAT_000db438 = Ordinal_2032((int)DAT_0023bf30 + (int)(short)uVar3 + 0x1000);
  DAT_000db43c = Ordinal_2032((int)*(short *)(iVar4 + 0xe) + (int)DAT_0023bf34);
  DAT_000db440 = Ordinal_2032((int)DAT_0023bf38 + (int)(short)uVar7);
  iVar6 = (int)DAT_0023beb4;
  if (iVar6 == 0) {
    DAT_000db448 = 0;
  }
  else if (iVar6 < 1) {
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0xff;
    }
    DAT_000db448 = (iVar6 >> 8) + (int)DAT_0023bf3c + 0x168;
  }
  else {
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0xff;
    }
    DAT_000db448 = (iVar6 >> 8) + (int)DAT_0023bf3c;
  }
  /* Hack - Testing: UW_HACK_PITCH overrides the camera pitch angle
     (index into the sin/cos tables, 0..360). DAT_0023beb4 / DAT_0023bf3c
     come out 0 with nothing driving the look-up/down, so the 3D view
     looks dead level and the floor you are standing on projects entirely
     below the viewport. A downward pitch (~300-340) brings it into view
     for testing -- the real look pitch source is still unrecovered. */
  { const char *_p = getenv("UW_HACK_PITCH"); if (_p) DAT_000db448 = atoi(_p); }
  if (cVar1 == '\0') {
    sVar8 = *(short *)(iVar4 + 0x2c);
  }
  else if (cVar1 == '\x01') {
    sVar8 = *(short *)(iVar4 + 0x2c) + -0x4000;
  }
  else if (cVar1 == '\x02') {
    sVar8 = *(short *)(iVar4 + 0x2c) + -0x8000;
  }
  else if (cVar1 == '\x03') {
    sVar8 = *(short *)(iVar4 + 0x2c) + 0x4000;
  }
  if (sVar8 < 1) {
    /* Ghidra dropped the dividend: this is the 16-bit view angle sVar8
       converted to degrees, angle / 180 (0xb4). Without sVar8 passed
       the divide ran on a leftover register -> yaw came out 0/360 ->
       identity view rotation -> every tile projected behind the near
       plane. */
    iVar4 = Ordinal_2005(0xb4, (int)sVar8);
    DAT_000db44c = iVar4 + DAT_0023bf40 + 0x168;
  }
  else {
    iVar4 = Ordinal_2005(0xb4, (int)sVar8);
    DAT_000db44c = iVar4 + DAT_0023bf40;
  }
  /* Always-on (no env var) position/heading debug print, for correlating
     a live playtester's exact standing spot/facing with what the
     decompile is doing -- e.g. pinning down the wall-decal depth/
     parallax issue. First cut read the coarse per-tile position cached in
     g_player_object (the player object, +0x16, only updated on tile-boundary
     crossings) the same way demomode.c's own "player tile" TELEPORT/REVEAL
     print does -- not fine-grained enough (whole tiles only). Switched to
     DAT_00204880/82 (X/Y) and DAT_00204884 (Z), the true continuously-
     updated fine-grained player position, format (tile<<8)|fine, 256
     units/tile -- confirmed via commit_player_move's own tile-index
     derivation from these exact fields. Pitch is degrees, 0-360, an index
     into the DAT_000d9ed8/DAT_000d9930 sin/cos tables (same convention
     emit_tile_objects's decal-angle override uses).
     Yaw is NOT read from DAT_000db44c (this function's own "camera yaw"
     local a few lines up) -- confirmed live (both by a full real-turning
     sweep and by direct screenshot diffing at yaw 0/90/180/270, which
     render as 4 genuinely different views despite DAT_000db44c reporting
     near-identical values for all of them) that DAT_000db44c is only the
     small residual *within* whichever 90-degree quadrant DAT_0023b4a0
     already rotated the camera's world-space axes into a few lines above
     (cVar1's branches) -- not the true compass heading. DAT_0023bf40, the
     field that would need to add the quadrant's own 90*n back in to
     reconstruct the full angle, has no writer anywhere in this decompile
     (permanently 0), so DAT_000db44c alone folds every quarter-turn back
     on top of the others. The renderer itself works around this by also
     pre-rotating world-space positions via that same DAT_0023b4a0 (see
     this function's own uVar3/uVar7 swaps above) rather than relying on
     DAT_000db44c for the coarse direction, which is why the actual 3D
     view rotates correctly even though DAT_000db44c doesn't reflect it --
     but anything that reads DAT_000db44c directly as if it *were* the
     full yaw (this print, previously) reports nonsense above/below one
     quadrant. DAT_00201c70 (the player's own persistent yaw, 65536
     units/360 degrees -- the same field SETPLAYERPOS writes and ordinary
     turning increments by 0x2000/45 degrees) is the real, un-folded full
     compass heading; convert it directly instead. Throttled to print
     only on change. Set UW_QUIET_POSDEBUG=1 to silence it. */
  if (!getenv("UW_QUIET_POSDEBUG")) {
    static int _last_x = -1, _last_y = -1, _last_z = -1, _last_yaw = -1, _last_pitch = -1;
    int _x = (unsigned short)DAT_00204880;
    int _y = (unsigned short)DAT_00204882;
    int _z = (short)DAT_00204884;
    int _yaw = (int)lround(fmod((double)(unsigned short)DAT_00201c70 * (360.0 / 65536.0), 360.0));
    if (_x != _last_x || _y != _last_y || _z != _last_z ||
        _yaw != _last_yaw || DAT_000db448 != _last_pitch) {
      _last_x = _x; _last_y = _y; _last_z = _z;
      _last_yaw = _yaw; _last_pitch = DAT_000db448;
      fprintf(stderr, "[playerpos] tile=(%.2f,%.2f) z=%d yaw=%d pitch=%d\n",
              _x / 256.0, _y / 256.0, _z, _yaw, (int)DAT_000db448);
    }
  }
  return;
}




// was FUN_00069b68 -- the game's general skill-check roll: rolls a
// random value mod 31, offsets it by (param_1 - param_2) (typically a
// skill/stat value minus a difficulty threshold), and buckets the
// result into -1 (critical failure, <3), 0 (failure, 3-15), 1
// (success, 16-28), or 2 (critical success, >=29). Used throughout
// combat, item use, object interaction, and babl conversation scripts
// for stealth/lockpicking/attack/persuasion-style checks against a
// player skill byte.
undefined4 roll_skill_check(param_1,param_2)
int param_1;
int param_2;

{
  int uw_ord2005_rem_127 = 0;
  int iVar1;
  undefined4 uVar2;
  short extraout_r1;
  
  uVar2 = Ordinal_1053();
  uw_ord2005_rem_127 = ((int)(uVar2)) % (0x1f);
  iVar1 = ((uw_ord2005_rem_127 - param_2) + param_1) * 0x10000 >> 0x10;
  if (iVar1 < 0x1d) {
    if (iVar1 < 0x10) {
      uVar2 = 0;
      if (iVar1 < 3) {
        uVar2 = 0xffffffff;
      }
    }
    else {
      uVar2 = 1;
    }
  }
  else {
    uVar2 = 2;
  }
  return uVar2;
}




// was FUN_00069bd0 -- add param_1 experience points to the character
// (DAT_00086df8 + 0x4e), capped per call, and run advance_character_level
// when the Ordinal_2008(500) threshold is crossed.
void grant_experience_points(param_1)
short param_1;

{
  byte bVar1;
  uint uVar2;
  uint uVar3;
  short sVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  char *iVar8;
  
  iVar8 = DAT_00086df8;
  iVar7 = (int)param_1;
  if (iVar7 < 0) {
    uVar2 = *(uint *)(DAT_00086df8 + 0x4e);
    if ((uint)-iVar7 < uVar2 || -uVar2 == iVar7) {
      iVar7 = uVar2 + iVar7;
    }
    else {
      iVar7 = 0;
    }
    *(char *)(DAT_00086df8 + 0x4e) = (char)iVar7;
    *(char *)(DAT_00086df8 + 0x4f) = (char)((uint)iVar7 >> 8);
    *(char *)(DAT_00086df8 + 0x50) = (char)((uint)iVar7 >> 0x10);
    *(char *)(DAT_00086df8 + 0x51) = (char)((uint)iVar7 >> 0x18);
  }
  else if (*(uint *)(DAT_00086df8 + 0x4e) < 0x17701) {
    if ((DAT_00201b68 + 1) * 2 < (int)(uint)*(byte *)(DAT_00086df8 + 0x3d)) {
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      param_1 = (short)(iVar7 >> 1) + 1;
    }
    sVar4 = Ordinal_2008(3000,*(uint *)(DAT_00086df8 + 0x4e) + (int)param_1);
    if ((short)(ushort)*(byte *)(iVar8 + 0x53) < sVar4) {
      *(byte *)(iVar8 + 0x52) = ((char)sVar4 - *(byte *)(iVar8 + 0x53)) + *(char *)(iVar8 + 0x52);
      *(char *)(DAT_00086df8 + 0x53) = (char)sVar4;
      iVar8 = DAT_00086df8;
    }
    uVar2 = *(uint *)(iVar8 + 0x4e);
    iVar7 = uVar2 + (int)param_1;
    *(char *)(iVar8 + 0x4e) = (char)iVar7;
    *(char *)(DAT_00086df8 + 0x4f) = (char)((uint)iVar7 >> 8);
    *(char *)(DAT_00086df8 + 0x50) = (char)((uint)iVar7 >> 0x10);
    *(char *)(DAT_00086df8 + 0x51) = (char)((uint)iVar7 >> 0x18);
    iVar8 = DAT_00086df8;
    iVar7 = 0;
    uVar3 = *(uint *)(DAT_00086df8 + 0x4e);
    sVar4 = Ordinal_2008(500);
    uVar5 = (uint)*(byte *)(iVar8 + 0x3d);
    bVar1 = (&DAT_00086e87)[uVar5];
    uVar6 = uVar5;
    while (((short)(ushort)bVar1 <= sVar4 && ((int)uVar6 < 0x10))) {
      iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      uVar6 = iVar7 + uVar5;
      bVar1 = (&DAT_00086e87)[uVar6];
    }
    if ((short)iVar7 != 0) {
      advance_character_level(iVar7);
    }
    if ((uint)(int)(short)(uVar2 >> 4) < uVar3 >> 4) {
      refresh_experience_display();
    }
  }
  return;
}



// was FUN_00069e30 -- redraws the stats panel's experience/level
// progress indicator, but only when that panel (g_active_hud_panel==2)
// is currently the active HUD view. Called from grant_experience_points
// and other stat-changing paths whenever a display-relevant XP/level
// boundary is crossed.
void refresh_experience_display()

{
  if (g_active_hud_panel == '\x02') {
    *g_draw_color_index = 0xf1;
    *DAT_00084298 = 0xf1;
    FUN_00057118();
    select_active_font(s_font5x6i_sys_00086e98);
    if (DAT_0024af8c != 0) {
      FUN_00076e98();
    }
    FUN_00078088();
    FUN_00078118();
    FUN_000781a0();
    select_active_font(s_font5x6p_sys_0008430c);
    cursor_show_idle_tick();
  }
  return;
}







// was FUN_00070224 -- update_screen_flicker_effect's "sub-effect 2"
// driver: param_1==0 restores the light remap table by reloading
// LIGHT.DAT/MONO.DAT (mirroring load_light_tables' own load), param_1!=0
// zeroes its first 16 entries instead, producing the visual light
// distortion the flicker effect uses.
void toggle_light_table_flicker(param_1)
int param_1;

{
  char stack0xffdc324c_buf [256];
  char *stack0xffdc324c_ptr;
  char cVar1;
  int iVar2;
  char *pcVar3;
  char acStack_10c [260];
  
  if (param_1 == 0) {
    pcVar3 = &DAT_0023cca8;
    stack0xffdc324c_ptr = stack0xffdc324c_buf;
    do {
      cVar1 = *pcVar3;
      *stack0xffdc324c_ptr = cVar1; stack0xffdc324c_ptr = stack0xffdc324c_ptr + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    if (DAT_000872a0 == '\x05') {
      pcVar3 = s__DATA_mono_dat_000872b8;
    }
    else {
      pcVar3 = s__DATA_light_dat_000872c8;
    }
    Ordinal_1063(acStack_10c,pcVar3);
    iVar2 = open_file_for_read(acStack_10c);
    if (iVar2 != -1) {
      read_file_handle(iVar2,DAT_0024fa2c,0x1000);
      Ordinal_553(iVar2);
    }
  }
  else {
    iVar2 = 0;
    do {
      *(undefined1 *)(DAT_0024fa2c + iVar2 * 0x100) = 0;
      *(undefined1 *)(DAT_0024fa2c + iVar2 * 0x100 + 1) = 0;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x10);
  }
  return;
}






// was FUN_000703a0 -- recomputes the level-7-specific hazard/regen
// fields derived from the player's current character level
// (DAT_00086df8+0x3d) and their class's base stat row (DAT_0023be74,
// see its own declaration comment): writes a scaled value to
// DAT_00086df8+0xb0 (if the current level is 7) or +0x38 otherwise --
// the same pair save_or_restore_level_special_state saves/restores for
// level 7's floor hazard -- and a 2-byte regen-rate field at +0x4c/
// +0x4d. param_1!=0 also copies the new +0x38 value into +0x37 (the
// active hazard byte). Called by advance_character_level after a
// level-up (param_1=0) and by chargen (context not traced here).
undefined4 recompute_level7_hazard_from_character_level(param_1)
int param_1;

{
  undefined1 uVar1;
  char cVar2;
  char *iVar3;
  
  iVar3 = DAT_0023be74;
  cVar2 = Ordinal_2005(5,(uint)*(byte *)(DAT_00086df8 + 0x3d) * (uint)*(byte *)(DAT_0023be74 + 5));
  *(char *)(iVar3 + 4) = cVar2 + '\x1e';
  uVar1 = (undefined1)
          ((int)((*(byte *)(DAT_00086df8 + 0x28) + 1) * (uint)*(byte *)(DAT_0023be74 + 7)) >> 3);
  if (DAT_00201b68 == 7) {
    *(undefined1 *)(DAT_00086df8 + 0xb0) = uVar1;
  }
  else {
    *(undefined1 *)(DAT_00086df8 + 0x38) = uVar1;
  }
  iVar3 = (uint)*(byte *)(DAT_0023be74 + 5) * 0x14;
  *(char *)(DAT_00086df8 + 0x4c) = (char)iVar3;
  *(char *)(DAT_00086df8 + 0x4d) = (char)((uint)iVar3 >> 8);
  if (param_1 != 0) {
    *(undefined1 *)(DAT_00086df8 + 0x37) = *(undefined1 *)(DAT_00086df8 + 0x38);
  }
  return 0;
}



// was FUN_00070464 -- raise the character level byte (DAT_00086df8 + 0x3d)
// by param_1, show the "attained experience level N" scroll message, and
// bump the dependent stat at +0x52.
void advance_character_level(param_1)
char param_1;

{
  int uw_ord2005_rem_138 = 0;
  char *iVar1;
  char cVar2;
  int extraout_r1;
  
  *(char *)(DAT_00086df8 + 0x3d) = *(char *)(DAT_00086df8 + 0x3d) + param_1;
  iVar1 = DAT_00086df8;
  if (*(byte *)(DAT_00086df8 + 0x3d) < 10) {
    DAT_0008730c = ' ';
  }
  else {
    cVar2 = Ordinal_2005(10);
    DAT_0008730c = cVar2 + '0';
  }
  uw_ord2005_rem_138 = ((int)(*(undefined1 *)(iVar1 + 0x3d))) % (10);
  DAT_0008730d = (undefined1)((uint)((uw_ord2005_rem_138 + 0x30) * 0x1000000) >> 0x18);
  FUN_00078c80(0x93);
  message_scroll_print_wrapped(&DAT_0008730c);
  *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + param_1;
  recompute_level7_hazard_from_character_level(0);
  refresh_stats_panel_if_active();
  return;
}



// was FUN_00070524 -- 3-way tier classifier: param_1<7 -> tier 0,
// param_1>9 -> tier 1, otherwise (7..9) -> tier 2. Its result indexes
// DAT_0023be74 (the player's class base-stat row) to pick a tier's
// base training value -- called by both advance_skill_training and
// roll_skill_use_improvement with their own skill-index parameter
// (advance_skill_training's call site was missing this argument, a
// dropped-argument bug fixed there once roll_skill_use_improvement's
// sibling call confirmed the correct value to pass).
undefined4 classify_skill_training_tier(param_1)
short param_1;

{
  undefined4 uVar1;
  
  if (param_1 < 7) {
    uVar1 = 0;
  }
  else {
    uVar1 = 2;
    if (9 < param_1) {
      uVar1 = 1;
    }
  }
  return uVar1;
}



// was FUN_00070548 -- advances the skill/combat-category progress byte
// at DAT_00086df8[param_1+0x21] (one of the per-skill bytes babl.c's
// own "play_arms" variable sums, see its comment) toward its 30 (0x1e)
// cap: a flat increment (larger the first time the byte is still 0),
// a class-scaled random bonus (via classify_skill_training_tier and the
// player's class stat row DAT_0023be74), and 2-3 roll_skill_check rolls.
void advance_skill_training(param_1)
short param_1;

{
  int iVar1;
  undefined1 uVar2;
  char cVar3;
  short sVar4;
  /* iVar5 doubles as a real pointer (DAT_00086df8 + iVar1) early on
     and a plain int loop counter (from sVar7) later -- mutually
     exclusive, but both squeezed into `int`, truncating the pointer. */
  char *pcVar_df8;
  int iVar5;
  undefined2 uVar6;
  short sVar7;

  iVar1 = (int)param_1;
  if (*(char *)(iVar1 + DAT_00086df8 + 0x21) == '\0') {
    cVar3 = '\x03';
    uVar6 = 9;
    sVar7 = 3;
  }
  else {
    cVar3 = '\x01';
    uVar6 = 0xd;
    sVar7 = 2;
  }
  /* BUG FIX: was `classify_skill_training_tier()` with no argument --
     dropped by Ghidra (same "ARM register-leftover doesn't survive a
     literal recompile" idiom as every other dropped-argument bug in
     this file). Confirmed via the sibling call in
     roll_skill_use_improvement (was FUN_0007067c), which performs the
     exact same DAT_0023be74[tier+5]/DAT_00086df8[param_1+0x21] dance
     and explicitly passes its own skill-index parameter:
     `classify_skill_training_tier((int)param_1)`. Without this, the
     tier classification read whatever value was left over in the
     argument register, potentially indexing DAT_0023be74 with a wrong
     tier and applying the wrong class's training rate for this skill. */
  sVar4 = classify_skill_training_tier(param_1);
  uVar2 = *(undefined1 *)(DAT_0023be74 + sVar4 + 5);
  *(char *)(iVar1 + DAT_00086df8 + 0x21) = *(char *)(iVar1 + DAT_00086df8 + 0x21) + cVar3;
  pcVar_df8 = DAT_00086df8 + iVar1;
  cVar3 = Ordinal_2005(uVar6,uVar2);
  *(char *)(pcVar_df8 + 0x21) = cVar3 + *(char *)(pcVar_df8 + 0x21);
  iVar5 = (int)sVar7;
  cVar3 = rand_below(iVar5);
  *(char *)(iVar1 + DAT_00086df8 + 0x21) = *(char *)(iVar1 + DAT_00086df8 + 0x21) + cVar3;
  if (iVar5 != 0) {
    do {
      cVar3 = roll_skill_check(uVar2,0x14);
      *(char *)(iVar1 + 0x21 + DAT_00086df8) = *(char *)(iVar1 + 0x21 + DAT_00086df8) + cVar3;
      iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
    } while (0 < iVar5);
  }
  if (0x1e < *(byte *)(iVar1 + DAT_00086df8 + 0x21)) {
    *(undefined1 *)(iVar1 + DAT_00086df8 + 0x21) = 0x1e;
  }
  return;
}






// WARNING: Removing unreachable block (ram,0x00070700)

// was FUN_0007067c -- the "skill improves through use" roll: on a
// successful use of skill param_1, fails outright (returns false, no
// change) if the skill's current progress (DAT_00086df8[param_1+0x21])
// already exceeds double its class/tier's base value
// (classify_skill_training_tier + DAT_0023be74[tier+5]) or has hit 0x1d
// (29); otherwise increments the progress byte by 1 (plus a second +1
// for tier!=0 skills still under half that base value, plus a further
// Ordinal_2005-randomized chance +1), capping the final result at 30
// (0x1e), and returns true. param_1==8 (a specific skill index) also
// refreshes a per-level cached value at DAT_00086df8+0xc2 for the
// current level.
undefined4 roll_skill_use_improvement(param_1)
char param_1;

{
  int iVar1;
  undefined1 uVar2;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  int extraout_r1;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;
  
  uVar8 = 1;
  sVar4 = classify_skill_training_tier((int)param_1);
  iVar7 = (int)sVar4;
  uVar2 = (&DAT_00087308)[iVar7];
  iVar1 = (int)param_1;
  uVar6 = (uint)*(byte *)(iVar7 + DAT_0023be74 + 5);
  bVar3 = *(byte *)(iVar1 + DAT_00086df8 + 0x21);
  if ((uVar6 * 2 < (uint)bVar3) || (0x1d < bVar3)) {
    uVar8 = 0;
  }
  else {
    *(byte *)(iVar1 + DAT_00086df8 + 0x21) = bVar3 + 1;
    if (iVar7 != 0) {
      bVar3 = *(byte *)(iVar1 + DAT_00086df8 + 0x21);
      if ((uint)bVar3 < (uint)((int)uVar6 >> 1)) {
        *(byte *)(iVar1 + DAT_00086df8 + 0x21) = bVar3 + 1;
      }
    }
    if (*(byte *)(iVar1 + DAT_00086df8 + 0x21) < uVar6) {
      uVar5 = Ordinal_1053();
      iVar7 = iVar1 + DAT_00086df8;
      bVar3 = *(byte *)(iVar7 + 0x21);
      Ordinal_2005(uVar2,uVar5);
      if (extraout_r1 < (int)(uVar6 - bVar3)) {
        *(byte *)(iVar7 + 0x21) = bVar3 + 1;
      }
    }
    if (0x1e < *(byte *)(iVar1 + DAT_00086df8 + 0x21)) {
      *(undefined1 *)(iVar1 + DAT_00086df8 + 0x21) = 0x1e;
    }
  }
  if (iVar1 == 8) {
    FUN_0003aea8();
    if (DAT_00201b68 < 9) {
      *(undefined1 *)(DAT_00201b68 + DAT_00086df8 + 0xc2) = *(undefined1 *)(DAT_00086df8 + 0x29);
    }
  }
  return uVar8;
}






// was FUN_000707c8 -- prints a single skill-improvement message:
// param_2==0 shows message 0x1b ("no improvement"), otherwise message
// 0x1c followed by param_1's skill name (resolved via
// FUN_0007863c(param_1+0x1f|0x400), the skill-name string-id range).
void print_single_skill_improvement_message(param_1,param_2)
int param_1;
int param_2;

{
  if (param_2 == 0) {
    FUN_00078c80(0x1b);
  }
  else {
    FUN_00078c80(0x1c);
    FUN_0007863c(param_1 + 0x1fU | 0x400);
    message_scroll_print_wrapped();
    message_scroll_print_wrapped(&DAT_00084f20);
  }
  return;
}



// was FUN_0007080c -- prints a comma/and-joined list of improved skill
// names from param_1 (a byte array of skill ids, -1-terminated, up to
// 4 entries): message 0x1e if the list is empty (*param_1==-1), else
// message 0x1d followed by each skill name, separated by DAT_00087318
// between middle entries and s_and_00087310 ("and") before the last.
// DAT_00087318's real content wasn't recovered (a likely ", " list
// separator, currently prints as empty -- see its own declaration
// comment) -- not guessed.
void print_skill_improvement_list(param_1)
char * param_1;

{
  char *pcVar1;
  int iVar2;
  
  if (*param_1 == -1) {
    FUN_00078c80(0x1e);
  }
  else {
    FUN_00078c80(0x1d);
    if (*param_1 != -1) {
      iVar2 = 0;
      do {
        if (3 < iVar2) break;
        if (iVar2 == 3) {
LAB_00070870:
          pcVar1 = s_and_00087310;
LAB_00070874:
          message_scroll_print_wrapped(pcVar1);
        }
        else if (iVar2 != 0) {
          if (param_1[iVar2 + 1] == -1) goto LAB_00070870;
          pcVar1 = &DAT_00087318;
          goto LAB_00070874;
        }
        FUN_0007863c((byte)param_1[iVar2] + 0x1f | 0x400);
        message_scroll_print_wrapped();
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (param_1[iVar2] != -1);
    }
    message_scroll_print_wrapped(&DAT_00084f20);
  }
  return;
}






// was FUN_000708bc -- the "Chant the mantra" feature: prompts for a
// typed mantra word (scroll_text_entry_prompt), matches it against the
// known-mantra string table (string ids 0x33..0x4c via FUN_0007863c,
// compared with Ordinal_1065) and dispatches on which one matched:
// - ids 0x33..0x46 (iVar6<0x14): single-skill mantras, spending one
//   "mantra use" (DAT_00086df8+0x52) for two roll_skill_use_improvement
//   attempts on the mantra's associated skill.
// - id 0x47 (0x14): "nothing happens" NPC-reaction-shift flavor text.
// - id 0x48 (0x15): sets a one-time flag (DAT_00086df8+0x60 bit 6).
// - id 0x49 (0x16): another flavor-text-only outcome.
// - ids 0x4a-0x4c (0x17-0x19): "class" mantras rolling multiple
//   roll_skill_use_improvement attempts across a themed range of
//   skills (base/count/spread per id), printed via
//   print_skill_improvement_list.
// - no match ('M'/0x4d): "you don't know that mantra" (message 0x19).
void handle_mantra_chant()

{
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  char cVar11;
  uint uVar12;
  short sVar13;
  undefined1 local_60 [8];
  undefined1 local_58 [52];
  
  local_58[0] = 0;
  scroll_text_entry_prompt(s_Chant_the_mantra__0008731c,0,local_58,1,10);
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  iVar10 = 0x33;
  do {
    uVar4 = Ordinal_1416(local_58);
    uVar5 = FUN_0007863c((int)(char)iVar10 | 0x400);
    iVar6 = Ordinal_1065(uVar5,uVar4);
    if (iVar6 == 0) break;
    iVar10 = iVar10 + 1;
  } while (iVar10 * 0x1000000 >> 0x18 < 0x4d);
  if ((char)iVar10 == 'M') {
    FUN_00078c80(0x19);
    goto LAB_00070b58;
  }
  iVar10 = iVar10 + -0x33;
  iVar6 = iVar10 * 0x1000000 >> 0x18;
  if (iVar6 < 0x14) {
    if (*(char *)(DAT_00086df8 + 0x52) == '\0') {
LAB_00070980:
      FUN_00078c80(0x18);
    }
    else {
      iVar6 = roll_skill_use_improvement(iVar10);
      iVar7 = roll_skill_use_improvement(iVar10);
      if ((iVar6 == 0) && (iVar7 == 0)) {
LAB_000709e0:
        uVar4 = 0;
      }
      else {
        FUN_00078c80(0x1a);
        *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + -1;
        if ((iVar6 == 0) && (iVar7 == 0)) goto LAB_000709e0;
        uVar4 = 1;
      }
      print_single_skill_improvement_message(iVar10 * 0x1000000 >> 0x18,uVar4);
    }
  }
  else {
    if (iVar6 == 0x14) {
      if ((*(byte *)(DAT_00086df8 + 0x60) & 0x80) == 0) {
        uVar4 = FUN_0007863c(0x223);
        FUN_0007ed20(uVar4,*(ushort *)((char *)g_player_object + 0x16) >> 10,
                     (*(ushort *)((char *)g_player_object + 0x16) & 0x3f0) >> 4,(int)DAT_00201b68,0x18,0x2d,3,4
                    );
      }
LAB_00070c78:
      busy_wait_ms(0x20);
      return;
    }
    if (iVar6 == 0x15) {
      if (((*(byte *)(DAT_00086df8 + 0x60) & 0x40) == 0) &&
         (iVar10 = FUN_00079dec(0,0xe1), iVar10 != 0)) {
        FUN_00078c80(0x1e);
        uVar2 = *(undefined2 *)(DAT_00086df8 + 0x5f);
        *(char *)(DAT_00086df8 + 0x5f) = (char)uVar2;
        *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar2 >> 8) | 0x40;
      }
      goto LAB_00070c78;
    }
    if (iVar6 == 0x16) {
      FUN_00078c80(0x1f);
      goto LAB_00070c78;
    }
    if (iVar6 == 0x17) {
      sVar13 = 0;
      cVar11 = '\a';
      sVar3 = 3;
    }
    else if (iVar6 == 0x18) {
      sVar13 = 7;
      cVar11 = '\x03';
      sVar3 = 2;
    }
    else {
      if (iVar6 != 0x19) goto LAB_00070c78;
      sVar13 = 10;
      cVar11 = '\n';
      sVar3 = 4;
    }
    if (*(char *)(DAT_00086df8 + 0x52) == '\0') goto LAB_00070980;
    local_60[0] = 0xff;
    uVar12 = 0;
    local_60[1] = 0xff;
    local_60[2] = 0xff;
    local_60[3] = 0xff;
    iVar10 = (int)cVar11;
    iVar6 = (int)sVar3;
    while ((iVar6 != 0 &&
           (cVar1 = (char)iVar10, iVar10 = (cVar1 + -1) * 0x1000000 >> 0x18, cVar1 != 0))) {
      if ((sVar13 == 7) &&
         ((*(byte *)(DAT_00086df8 + 0x28) < 8 && (uVar8 = Ordinal_1053(), (uVar8 & 2) != 0)))) {
        iVar7 = 7;
      }
      else {
        iVar7 = rand_below(cVar11);
        iVar7 = (sVar13 + iVar7) * 0x1000000 >> 0x18;
      }
      iVar9 = roll_skill_use_improvement(iVar7);
      if (iVar9 != 0) {
        local_60[uVar12] = (char)iVar7;
        uVar12 = uVar12 + 1 & 0xff;
      }
      iVar6 = (iVar6 + -1) * 0x10000 >> 0x10;
    }
    print_skill_improvement_list(local_60);
    *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + -1;
  }
  recompute_level7_hazard_from_character_level(0);
  refresh_stats_panel_if_active();
LAB_00070b58:
  refresh_player_equipment_effects();
  busy_wait_ms(0x20);
  FUN_00057570();
  FUN_0005758c();
  return;
}






// was FUN_00070c90 -- draws the full character-sheet text overlay
// (name, class, level, experience, the 6 core attributes in a 3-column
// grid, and all 20 skill values in a 3x7 grid) on top of whatever
// background the caller already blit. Its one call site is the game-
// completion/victory sequence (after blitting win1.byt/win2.byt), so
// this is effectively the final character stats screen, though the
// drawing logic itself isn't victory-specific.
void render_endgame_character_stats()

{
  int uw_ord2005_rem_139 = 0; int uw_ord2005_rem_140 = 0; int uw_ord2005_rem_141 = 0; int uw_ord2005_rem_142 = 0;
  byte bVar1;
  short sVar2;
  char cVar3;
  undefined1 uVar4;
  byte bVar5;
  short sVar6;
  /* Was `undefined4`, truncating FUN_0007863c's real char* return on
     this 64-bit host -- same bug class as the other FUN_0007863c
     truncation fixes this session (e.g. character_generator_loop's uVar10). Used
     consistently as a string pointer everywhere else in this function
     (draw_text_string's first arg, Ordinal_1063's second arg), so retyping
     is a straightforward drop-in fix. */
  char *uVar7;
  char *pcVar8;
  int iVar9;
  undefined4 uVar10;
  char extraout_r1;
  char extraout_r1_00;
  short extraout_r1_01;
  char *pcVar11;
  int extraout_r1_02;
  char *iVar12;
  int iVar13;
  char *iVar14;
  short local_70;
  undefined1 auStack_68 [16];
  char local_58 [52];

  select_active_font(s_fontchar_sys_00087330);
  *DAT_00084298 = 0x5c;
  *g_draw_color_index = 0x5c;
  uVar7 = FUN_0007863c((int)DAT_00201c74);
  /* Was `measure_text_width()` with no argument -- see draw_text_string/
     measure_text_width's own comments above for the root "dropped argument"
     bug this matches; uVar7 (the string FUN_0007863c just returned) is
     right here, so pass it explicitly instead of hoping it's still
     sitting in the right register. */
  sVar6 = measure_text_width(uVar7);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(uVar7,0xa0 - (short)((int)(iVar12) >> 1),0x14);
  pcVar8 = (char *)FUN_0007863c(699);
  pcVar11 = local_58;
  do {
    cVar3 = *pcVar8;
    pcVar8 = pcVar8 + 1;
    *pcVar11 = cVar3;
    pcVar11 = pcVar11 + 1;
  } while (cVar3 != '\0');
  sVar6 = Ordinal_1068(local_58);
  iVar12 = DAT_00086df8;
  if (9 < *(byte *)(DAT_00086df8 + 0x3d)) {
    cVar3 = Ordinal_2005(10);
    local_58[sVar6] = cVar3 + '0';
    sVar6 = (short)((uint)((sVar6 + 1) * 0x10000) >> 0x10);
  }
  uw_ord2005_rem_139 = ((int)(*(undefined1 *)(iVar12 + 0x3d))) % (10);
  local_58[sVar6] = uw_ord2005_rem_139 + '0';
  iVar13 = (sVar6 + 1) * 0x10000 >> 0x10;
  local_58[iVar13] = ' ';
  local_58[(iVar13 + 1) * 0x10000 >> 0x10] = '\0';
  uVar7 = FUN_0007863c((*(byte *)(iVar12 + 100) >> 5) + 0x17 | 0x400);
  Ordinal_1063(local_58,uVar7);
  iVar13 = *(short *)(DAT_000879b0 + 6) + 0x14;
  sVar6 = measure_text_width(local_58);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(local_58,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  uVar7 = FUN_0007863c(700);
  iVar13 = *(short *)(DAT_000879b0 + 6) + iVar13;
  sVar6 = measure_text_width(uVar7);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(uVar7,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  sVar6 = Ordinal_2008(&DAT_001c2000,*(undefined4 *)(DAT_00086df8 + 0xce));
  sVar6 = Ordinal_2005(0xc,(int)sVar6);
  pcVar8 = (char *)FUN_0007863c(0x2bd);
  pcVar11 = local_58;
  do {
    cVar3 = *pcVar8;
    pcVar8 = pcVar8 + 1;
    *pcVar11 = cVar3;
    pcVar11 = pcVar11 + 1;
  } while (cVar3 != '\0');
  uVar7 = Ordinal_1025((int)sVar6,auStack_68,10);
  Ordinal_1063(local_58,uVar7);
  uVar7 = FUN_0007863c(0x2be);
  Ordinal_1063(local_58,uVar7);
  sVar6 = measure_text_width(local_58);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  iVar13 = CONCAT11(*(undefined1 *)(DAT_000879b0 + 7),*(undefined1 *)(DAT_000879b0 + 6)) + iVar13;
  draw_text_string(local_58,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  iVar12 = 0;
  iVar13 = *(short *)(DAT_000879b0 + 6) + iVar13;
  do {
    iVar14 = DAT_000879b0;
    iVar9 = Ordinal_2005(3,iVar12);
    sVar6 = 0xbe;
    if (iVar9 == 0) {
      sVar6 = 0x50;
    }
    uw_ord2005_rem_140 = ((int)(iVar12)) % (3);
    sVar2 = *(short *)(iVar14 + 6);
    uVar7 = FUN_0007863c((int)iVar12 + 0x11U | 0x400);
    if (-1 < iVar12) {
      if (iVar12 < 3) {
        uVar4 = *(undefined1 *)((int)iVar12 + DAT_0023be74 + 5);
      }
      else if (iVar12 == 3) {
        uVar4 = *(undefined1 *)(DAT_0023be74 + 4);
      }
      else {
        if (iVar12 != 4) {
          if (iVar12 == 5) {
            uVar10 = Ordinal_2008(10,*(undefined4 *)(DAT_00086df8 + 0x4e));
            Ordinal_1039(uVar10,local_58,10);
          }
          goto LAB_00071110;
        }
        uVar4 = *(undefined1 *)(DAT_00086df8 + 0x38);
      }
      FUN_000229e0(uVar4,local_58,10);
    }
LAB_00071110:
    local_70 = (short)((uint)(iVar13 * 0x10000) >> 0x10);
    iVar14 = (int)uw_ord2005_rem_140 * (int)sVar2 + (int)local_70;
    draw_text_string(uVar7,(int)sVar6,iVar14);
    draw_text_string(local_58,sVar6 + 0x2d,iVar14);
    iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
    if (5 < iVar12) {
      iVar12 = 0;
      iVar13 = iVar13 + *(short *)(DAT_000879b0 + 6) * 2;
      do {
        bVar1 = *(byte *)((int)iVar12 + DAT_00086df8 + 0x21);
        uVar7 = FUN_0007863c((int)iVar12 + 0x1fU | 0x400);
        bVar5 = bVar1;
        if (9 < bVar1) {
          bVar5 = Ordinal_2005(10,bVar1);
        }
        local_58[0] = bVar5 + 0x30;
        if (bVar1 < 10) {
          local_58[1] = '\0';
        }
        else {
          uw_ord2005_rem_141 = ((int)(bVar1)) % (10);
          local_58[1] = uw_ord2005_rem_141 + '0';
        }
        local_58[2] = 0;
        uw_ord2005_rem_142 = ((int)(iVar12)) % (3);
        iVar14 = uw_ord2005_rem_142;
        if (uw_ord2005_rem_142 == 0) {
          iVar14 = DAT_000879b0;
        }
        if (uw_ord2005_rem_142 == 0) {
          iVar13 = *(short *)(iVar14 + 6) + iVar13;
        }
        iVar14 = (short)uw_ord2005_rem_142 * 0x4a + 0x32;
        draw_text_string(uVar7,iVar14,iVar13);
        iVar9 = measure_text_width(local_58);
        draw_text_string(local_58,(iVar14 - iVar9) + 0x46,iVar13);
        iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
      } while (iVar12 < 0x14);
      flush_dirty_rect_to_display(1);
      return;
    }
  } while( true );
}
