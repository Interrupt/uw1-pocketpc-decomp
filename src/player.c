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
  FUN_0006907c();
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
      sVar1 = FUN_00069b68(*(undefined1 *)(DAT_00086df8 + 0x32),((int)(short)uVar3 << 0x11) >> 0x10)
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
      FUN_000661b0(bVar9 & 0xf,bVar9 >> 4,&local_30,0xffffffff);
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
        iVar5 = FUN_000661b0(local_2c[0],local_2e[0],&local_30,iVar4);
        if (iVar5 != 0) {
          FUN_0007cc30(g_scratch_object_ptr);
        }
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 0xb);
  FUN_00066634(local_30);
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
    FUN_0006ff08(6);
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
    FUN_00069e30();
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
// stopping FUN_00070224's effect); param_1!=0 with no effect currently
// active picks a random one (or forces sub-effect 0 if DAT_00086db8
// is set) and starts it -- sub-effect 1 randomly cycles the palette
// bank, sub-effect 2 drives FUN_00070224. Called from
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
        FUN_00070224(0);
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
      FUN_00070224(1);
    }
  }
  return;
}

