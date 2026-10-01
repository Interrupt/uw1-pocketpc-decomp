/* Item use: ready/unready weapon, picking up/dropping objects near the
 * player or a target, light sources, food, and combine/stow-into-
 * container logic. Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed.
 */
#include "headers/item_use.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0003ff10 -- enters combat stance: readies the weapon in the
// player's hand (called from handle_object_drop_target when the
// weapon-hand paperdoll slot is clicked, via toggle_weapon_ready), sets
// flags5f bit 2 (tick_weapon_swing_state's attack-swing "start new swing" gate)
// and requests advance_action_animation_frame raise the weapon
// (DAT_0023c120 = 4).
void ready_weapon()

{
  undefined2 uVar1;
  byte bVar2;

  if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 2) && ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0)) {
    if ((g_cursor_mode == 1) || ((g_cursor_mode == 3 || (g_cursor_mode == 4)))) {
      FUN_00057cac(3);
    }
    if (g_cursor_mode != 0) {
      /* Same dropped-argument bug as cursor_mode_button_click's sites. */
      mode_icon_highlight_off(g_cursor_mode);
    }
    /* Originally decompiled as `g_cursor_mode = 2`. An earlier session
       changed this to 5, reasoning that PTR_FUN_000858c8_table's
       (then-wrong) declared order put interact_attack at index 4 (mode
       5). That table order turned out to be wrong -- a fresh raw dump of
       the 5 pointers directly from UU.exe at 0x858c8 (see the table's
       own comment) shows interact_attack genuinely at index 1 (mode 2),
       matching this line's own original value. Restored to 2: mode 2 is
       the real numeric Attack mode (also matches
       cursor_mode_button_click's mode-2 special case, which sets this
       exact same weapon-ready HUD state independently). */
    g_cursor_mode = 2;
    uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
    *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar1 | 2;
    *(char *)(DAT_00086df8 + 0x60) = (char)((ushort)uVar1 >> 8);
    /* Was missing entirely -- g_weapon_overlay_enabled (see its own
       comment) defaults to 0 and, before this, was only ever set by
       three unrelated screen-wipe utility functions, so
       weapon_swing_draw_tick's top-level gate suppressed the overlay's
       blit for the entire time combat stance was active, even though
       the animation state machine below correctly cycled through
       "raise" (state 4) and, on leave, the multi-tick "lower" animation
       (state 5, see unready_weapon) before finally settling at the
       already-excluded idle state 6. Confirmed live via
       UW_DEBUG_COMBAT/UW_DEBUG_TOGGLE_READY tracing: the state machine
       itself was always correct end to end, only this flag was never
       set. unready_weapon does NOT need its own clear -- state 6's
       existing exclusion in weapon_swing_draw_tick already hides the
       overlay once the lower animation finishes, matching "disabled
       when you leave combat mode, but with an animation delay". */
    g_weapon_overlay_enabled = 1;
    set_hud_status_value(8,4);
    mode_icon_highlight_on((int)g_cursor_mode);
    bVar2 = get_current_music_track();
    if ((4 < bVar2) && (bVar2 = get_current_music_track(), bVar2 < 8)) {
      return;
    }
    set_pending_music_track(8);
  }
  return;
}



// was FUN_00040004 -- leaves combat stance: requests
// advance_action_animation_frame lower the weapon (DAT_0023c120 = 6,
// playing the raise animation in reverse over several ticks -- the
// "animation delay as you leave" -- before settling at idle state 6).
// Deliberately does NOT clear g_weapon_overlay_enabled itself: state
// 6's existing exclusion in weapon_swing_draw_tick already stops the
// overlay once that settle completes, so clearing bit 2 here is enough
// (matches ready_weapon not needing to touch cursor mode either, past
// resetting it to 0).
void unready_weapon()

{
  uint uVar1;

  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0) {
    set_hud_status_value(8,6);
    uVar1 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar1 >> 8);
    if (DAT_000868d8 == 0) {
      /* Un-highlight needs to name whichever mode ready_weapon actually
         highlighted -- 2 (Attack, see ready_weapon's own comment on why
         it's 2 and not 5). */
      mode_icon_highlight_off(2);
    }
    g_cursor_mode = 0;
    cancel_weapon_swing();
    pick_random_pending_music_track();
  }
  return;
}




void attach_picked_up_object_to_cursor(param_1)
ushort * param_1;

{
  int iVar1;
  short sVar2;
  short local_14;
  short local_12;
  short local_10 [2];
  
  g_selected_object = param_1;
  FUN_00057c5c(*param_1 & 0x1ff);
  FUN_000575c4(&local_14);
  if ((local_14 != 0) && (wait_for_click_release(1), g_selected_object != (ushort *)0x0)) {
    FUN_00057504(local_10,&local_12);
    sVar2 = hit_test_inventory_widget((int)local_10[0],(int)local_12);
    if (getenv("UW_DEBUG_INV"))
      fprintf(stderr, "[inv] attach_picked_up_object_to_cursor click test: gx=%d gy=%d -> widget_id=%d\n",
              (int)local_10[0], (int)local_12, (int)sVar2);
    iVar1 = (int)sVar2;
    if (0 < iVar1) {
      g_cursor_holding_state = 1;
      /* User QA report: "dragging and dropping into a paper doll slot
         does not show the item" -- confirmed live (also reproduces for
         an ordinary backpack-grid drop under the same drag pattern, so
         this isn't slot-specific) via UW_DEBUG_CURSORERASE/CURSORSHOW:
         update_mouse_state's own continuous per-tick cursor-icon cycle
         (still running here, since g_selected_object doesn't clear
         until the widget dispatch below actually succeeds) leaves a
         pending "erase this saved background" state (DAT_00204844) from
         the drag icon's last shown position. The widget dispatch below
         (handle_backpack_slot_click -> place_held_item_in_empty_slot,
         or handle_object_drop_target) draws the placed item fresh into
         its slot -- but then ITS OWN cleanup (FUN_00057cac(3) below)
         erases that still-pending stale save, which restores the
         PRE-drop background over top of the item that was just
         correctly drawn, since a drop's target slot position commonly
         overlaps where the drag icon was last shown (releasing ON the
         slot is the whole point of a drop). Flushing that pending erase
         HERE -- before any redraw happens -- makes it a genuine no-op
         (nothing to restore yet) instead of a same-tick race against
         the fresh redraw, matching update_mouse_state's own
         erase-before-anything-else protocol. FUN_00056fe8() only does
         the actual pixel restore, it does NOT clear DAT_00204844
         itself (every caller is responsible for that off its own
         return value, see its own comment); missing that clear left
         the flag set, so a LATER update_mouse_state cycle still saw
         "erase pending" and redundantly restored the same stale save a
         second time, clobbering the fresh redraw anyway. */
      if (FUN_00056fe8() != 0) {
        DAT_00204844 = 0;
      }
      if ((g_active_hud_panel == '\0') || (iVar1 == 0x17)) {
        /* Widget 20 (the real "leave container" indicator) falls
           through to handle_object_drop_target below same as
           everywhere else -- see that function's own `iVar2==0x14`
           case for the drop/click logic this used to duplicate here as
           a CONTAINER_ICON_WIDGET_ID special case (a drag that started
           in the 3D world, e.g. picking an item straight off the
           ground and releasing it on this icon while a container
           happens to be open, is exactly the kind of drop that case
           already handles). Same `< 0x15` -> `< 0x14` fix as
           handle_inventory_panel_click's own two copies. */
        if (iVar1 < 0x14) {
          handle_backpack_slot_click((int)(char)(&g_backpack_widget_to_slot)[iVar1]);
          if (g_selected_object == (ushort *)0x0) {
            g_cursor_holding_state = 0;
            FUN_00057cac(3);
          }
        }
        else {
          /* Dropped argument -- every sibling call to
             handle_object_drop_target elsewhere in this file forwards
             the resolved widget id (see handle_inventory_panel_click's
             own two copies); this bare call left it uninitialized,
             so widget 20/21/22 reached here with garbage instead of
             their real id. */
          handle_object_drop_target(iVar1);
        }
      }
    }
  }
  return;
}




undefined4 drop_held_object_near_player(param_1,param_2)
ushort * param_1;
int param_2;

{
  byte bVar1;
  ushort uVar2;
  bool bVar3;
  int iVar4;
  ushort *puVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  char cVar9;
  /* iVar4 is reused earlier in this function as a plain int (return
     codes from compute_drop_aim_from_cursor/FUN_00051fa0) -- real uses, left alone --
     but also held tilemap_lookup's real 64-bit pointer return,
     truncating it to 32 bits on this host. The NULL check added
     earlier (see below) only ever caught a truly-NULL result; a
     non-NULL-but-truncated pointer still reached
     object_list_append_tail(iVar4+2, ...) with a wild address.
     Confirmed live (UW_DEBUG_INV + demo_dropback_test.txt): dragging
     an item out of the backpack and dropping it in the 3D view
     crashed here even with that guard in place. New, properly-typed
     local for just this final pointer use. */
  char *pDropTile;
  ushort local_28;
  ushort local_26;
  
  DAT_00202a4c = (ushort)(*(byte *)((char *)g_player_object + 0x17) >> 2);
  DAT_00202a50 = (short)((g_player_object[0xb] & 0x3f0) >> 4);
  if (getenv("UW_DEBUG_THROW") && (*param_1 & 0x1ff) == 0x80)
    fprintf(stderr, "[throw-playertile] player tile=(%d,%d) fine_pos(DAT_00204880/2/4)=(%d,%d,%d) = world(%g,%g) tile-frac(%g,%g)\n",
            (int)DAT_00202a4c, (int)DAT_00202a50,
            (int)DAT_00204880, (int)DAT_00204882, (int)DAT_00204884,
            (double)DAT_00204880 / 256.0, (double)DAT_00204882 / 256.0,
            fmod((double)DAT_00204880 / 256.0, 1.0), fmod((double)DAT_00204882 / 256.0, 1.0));
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[branch-gate] game_mode=%d\n", (int)*(short *)(DAT_00085a6c + 8));
  if ((*(short *)(DAT_00085a6c + 8) == 1) && (iVar4 = compute_drop_aim_from_cursor(), iVar4 != 0)) {
    DAT_00202a54 = 1;
    DAT_00202a44 = g_player_object;
    DAT_00202a38 = *param_1 & 0x1ff;
    DAT_00202a48 = 0xf;
    puVar5 = (ushort *)spawn_object_near_player();
    if (puVar5 != (ushort *)0x0) {
      uVar6 = (*puVar5 ^ *param_1) & 0x7fff ^ (uint)*param_1;
      *(char *)puVar5 = (char)uVar6;
      *(char *)((char *)puVar5 + 1) = (char)(uVar6 >> 8);
      uVar2 = param_1[3];
      bVar1 = (byte)uVar2;
      *(byte *)(puVar5 + 3) = ((byte)puVar5[3] ^ bVar1) & 0x3f ^ bVar1;
      *(char *)((char *)puVar5 + 7) = (char)(uVar2 >> 8);
      bVar1 = *(byte *)((char *)param_1 + 1);
      *(char *)puVar5 = (char)*puVar5;
      *(byte *)((char *)puVar5 + 1) =
           (bVar1 ^ *(byte *)((char *)puVar5 + 1)) & 0x1e ^ *(byte *)((char *)puVar5 + 1);
      *(byte *)(puVar5 + 4) = (byte)param_1[2] & 0x3f;
      *(byte *)(puVar5 + 3) = ((byte)param_1[3] ^ (byte)puVar5[3]) & 0x3f ^ (byte)puVar5[3];
      *(undefined1 *)((char *)puVar5 + 7) = *(undefined1 *)((char *)puVar5 + 7);
      bVar1 = *(byte *)((char *)param_1 + 1);
      *(char *)puVar5 = (char)*puVar5;
      *(byte *)((char *)puVar5 + 1) =
           (bVar1 ^ *(byte *)((char *)puVar5 + 1)) & 0x20 ^ *(byte *)((char *)puVar5 + 1);
      if (((*param_1 & 0x1c0) != 0x140) && (((&DAT_00202c9a)[(*param_1 & 0x1ff) * 0xd] & 3) != 2)) {
        *(byte *)(puVar5 + 0xd) = (byte)(param_1[1] >> 7) & 7;
      }
      free_object_slot(param_1);
      param_1 = (ushort *)0x0;
    }
  }
  if (param_1 != (ushort *)0x0) {
    local_28 = (ushort)(*(byte *)((char *)g_player_object + 3) >> 5) + DAT_00202a4c * 8;
    local_26 = (short)((*(byte *)((char *)g_player_object + 3) & 0x1c) >> 2) + DAT_00202a50 * 8;
    *(byte *)(param_1 + 1) = ((byte)g_player_object[1] ^ (byte)param_1[1]) & 0x7f ^ (byte)param_1[1];
    *(byte *)((char *)param_1 + 3) = *(byte *)((char *)param_1 + 3);
    cVar9 = ((&DAT_00202c91)[(CONCAT11(*(byte *)((char *)param_1 + 1),(byte)*param_1) & 0x1ff) * 0xd] &
            7) + ((&DAT_00202c91)[(*g_player_object & 0x1ff) * 0xd] & 7) + '\x01';
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-heading] facing_byte(g_player_object+0x18)&0x1f=%d fine_aim((g_player_object[1]&0x380)>>2)=%d heading=%d dist(cVar9)=%d start=(%d,%d)\n",
              (int)((byte)g_player_object[0xc] & 0x1f), (int)((g_player_object[1] & 0x380) >> 2),
              (int)(((byte)g_player_object[0xc] & 0x1f) + ((g_player_object[1] & 0x380) >> 2)),
              (int)cVar9, (int)local_28, (int)local_26);
    project_position_by_heading(((byte)g_player_object[0xc] & 0x1f) + ((g_player_object[1] & 0x380) >> 2),cVar9,&local_28
                 ,&local_26);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-heading] after 1st project_position_by_heading: local_28(X)=%d local_26(Y)=%d\n",
              (int)local_28, (int)local_26);
    iVar4 = FUN_00051fa0(*param_1 & 0x1ff,0,(int)(short)local_28,(int)(short)local_26,
                         (byte)g_player_object[1] & 0x7f,1,cVar9);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-heading] 1st FUN_00051fa0 iVar4=%d\n", iVar4);
    if (iVar4 == 0) {
      bVar3 = true;
    }
    else {
      project_position_by_heading(((byte)g_player_object[0xc] & 0x1f) + ((g_player_object[1] & 0x380) >> 2),3,&local_28,
                   &local_26);
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[throw-heading] after 2nd(retry) project_position_by_heading: local_28(X)=%d local_26(Y)=%d\n",
                (int)local_28, (int)local_26);
      iVar4 = FUN_00051fa0(*param_1 & 0x1ff,0,(int)(short)local_28,(int)(short)local_26,
                           (byte)g_player_object[1] & 0x7f,1,cVar9);
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[throw-heading] 2nd FUN_00051fa0 iVar4=%d\n", iVar4);
      bVar3 = true;
      if (iVar4 != 0) {
        bVar3 = false;
      }
    }
    iVar7 = (int)(short)local_28;
    iVar8 = (int)(short)local_26;
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-fallback] dropping via trajectory path: tile=(%d,%d)\n", iVar7 >> 3, iVar8 >> 3);
    pDropTile = (char *)tilemap_lookup(iVar7 >> 3,iVar8 >> 3);
    /* tilemap_lookup returns NULL for any tile coordinate outside
       0-63 (see its own bounds check) -- confirmed live: dragging an
       item out of an open backpack slot and dropping it back into the
       3D view crashed in object_list_append_tail(pDropTile+2, ...),
       i.e. exactly a NULL+2 wild pointer. This is the same unguarded-
       tilemap_lookup-result class as this file's other "wild tilemap
       access" crash (see the map-edge Y-wraparound note in memory.md);
       here it wasn't a real map-edge case, just a computed nearby-drop
       tile (local_28/local_26, from project_position_by_heading just above) that
       apparently isn't always guaranteed to land in range. Treat it
       the same as the "no room to drop it" (bVar3) failure just below
       instead of dereferencing a wild pointer. */
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-fallback] bVar3(no-room)=%d pDropTile=%p\n", (int)bVar3, (void *)pDropTile);
    if ((bVar3) || (pDropTile == NULL)) {
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[throw-fallback] -> BAILED, item never inserted anywhere\n");
      if (param_2 != 0) {
        print_scroll_message_by_id(0xfd);
      }
      play_sound_effect_with_pan(0xf,0x40,0xf6);
      return 0;
    }
    uVar2 = param_1[1];
    *(byte *)(param_1 + 1) = (byte)(uVar2 & 0x3ff);
    *(byte *)((char *)param_1 + 3) =
         (byte)((uVar2 & 0x3ff) >> 8) |
         (byte)(((local_26 & 7 | (local_28 & 0x1fff) << 3) << 10) >> 8);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-fallback] inserting param_1=%p type=0x%x at pDropTile+2=%p heightfield(param_1[7]/8)=%d\n",
              (void *)param_1, (unsigned)(*param_1 & 0x1ff), (void *)(pDropTile + 2),
              (int)*(short *)((char *)param_1 + 0xe));
    DEBUG(INFO, "[drop] object id=0x%03x landed at tile=(%d,%d)\n",
          (unsigned)(*param_1 & 0x1ff), iVar7 >> 3, iVar8 >> 3);
    object_list_append_tail((byte *)(pDropTile + 2),(char *)param_1);
    uVar2 = *param_1;
    if ((((uVar2 & 0x1f0) == 0x90) && (3 < (uVar2 & 0xf))) && ((uVar2 & 0xf) < 7)) {
      bVar1 = (byte)uVar2;
      *(byte *)param_1 = (bVar1 - 4 ^ bVar1) & 0xf ^ bVar1;
      *(byte *)((char *)param_1 + 1) = (byte)(uVar2 >> 8);
      set_ambient_bias_without_light(0);
    }
    {
      ushort *pPostSettle = settle_dropped_object(param_1,iVar7 >> 3,iVar8 >> 3,1);
      /* HACK, not disassembly-derived at this call site (though the
         function it calls is real and unmodified): settle_dropped_
         object's own reallocate_object_to_arena path (disassembly-
         confirmed faithful) places a dropped/thrown object into the
         MOBILE object arena via alloc_object_slot(1) -- see
         https://wiki.ultimacodex.com/wiki/Ultima_Underworld_internal_formats,
         which documents separate mobile/immobile object lists. A real
         mobile object is expected to later transition into the
         IMMOBILE list (alloc_object_slot(0)) once it stops moving --
         settle_mobile_to_immobile does exactly that (decay/destroy roll, then
         alloc_object_slot(0) + field copy + relink), but its only
         known callers (settle_misplaced_mobile_object, itself only reached via
         advance_mobile_objects) fire solely on a dungeon-level transition, not
         during ordinary same-level play -- there is no per-tick,
         delta-time-driven object physics loop anywhere in this
         codebase that would otherwise call it. Since this port
         resolves a toss instantly (no real per-tick flight
         simulation), call settle_mobile_to_immobile here -- immediately after the
         object becomes mobile -- to synchronously complete the
         mobile->immobile transition a real flight would eventually
         trigger on its own. Confirmed live: without this, a thrown/
         dropped object renders fine but is permanently stuck in the
         mobile arena, which pick_object_under_cursor's Get-mode
         shortcut (interact_default's only path to attach_picked_up_
         object_to_cursor) requires NOT being in -- "You cannot pick
         that up" forever. With this call, the object correctly shows
         up as immobile and Get-mode pickup succeeds normally
         (bug-throw-item.txt). On by default; set
         UW_DISABLE_SETTLE_IMMOBILE to fall back to the old (mobile-
         forever, un-pickable) behavior. */
      if (pPostSettle != NULL && !getenv("UW_DISABLE_SETTLE_IMMOBILE")) {
        ushort *pImmobile;
        undefined2 uVarSavedTileX = DAT_0010144c;
        undefined2 uVarSavedTileY = DAT_00101454;
        DAT_0010144c = (ushort)(iVar7 >> 3);
        DAT_00101454 = (ushort)(iVar8 >> 3);
        pImmobile = settle_mobile_to_immobile(pPostSettle);
        DAT_0010144c = uVarSavedTileX;
        DAT_00101454 = uVarSavedTileY;
        if (getenv("UW_DEBUG_THROW"))
          fprintf(stderr, "[settle-immobile] settle_mobile_to_immobile(%p) -> %p in_arena=%d\n",
                  (void *)pPostSettle, (void *)pImmobile,
                  pImmobile ? (int)object_ptr_in_arena((char *)pImmobile) : -1);
      }
    }
  }
  return 1;
}




// was FUN_000523d0
/* Was `void`, discarding place_object_in_world's own tail-call return
   value (a real 0/1 "did it place" result -- see that function's own
   comment) -- real ARM calling convention leaves a leaf tail call's
   return value in r0 for THIS function's own caller, and
   babl_builtin_take_from_npc (recovered this round) needs that value
   to decide whether to fall back to the barter table when a dropped
   item can't be placed. Confirmed by inspecting place_object_in_world's
   own always-meaningful return (0 or 1), never garbage. */
undefined4 drop_object_near_target(param_1,param_2,param_3,param_4)
/* param_2 was `undefined4` -- a real object pointer forwarded straight
   into place_object_in_world's own (now char*) param_4, truncated to 32 bits on
   this host. Same class as place_object_in_world/spawn_new_object's other fixes;
   all of this function's callers already pass real object pointers
   (g_selected_object, or spawn_new_object's freshly-allocated object). */
char *param_1;
char *param_2;
undefined2 param_3;
undefined4 param_4;

{
  ushort uVar1;

  uVar1 = *(ushort *)(param_1 + 2);
  return place_object_in_world((*(ushort *)(param_1 + 0x16) >> 7 & 0x1f8) + (uVar1 >> 0xd),
               (*(ushort *)(param_1 + 0x16) >> 1 & 0x1f8) + ((uVar1 & 0x1c00) >> 10),uVar1 & 0x7f,
               param_2,param_3,param_4);
}




// was FUN_0007a990
void use_light_source(param_1,param_2)
ushort * param_1;
int param_2;

{
  byte bVar1;
  byte bVar2;
  int iVar3;
  ushort uVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *puVar7;
  int iVar8;
  int extraout_r3;
  int iVar9;
  ushort uVar10;
  
  if (((*param_1 & 0x8000) == 0) || ((param_1[3] & 0x8000) != 0)) {
    uVar10 = 1;
  }
  else {
    uVar10 = param_1[3] >> 6;
  }
  if (param_2 == 0) {
    uVar5 = 0x7b;
  }
  else {
    if ((param_1[2] & 0x3f) != 0) {
      iVar6 = find_or_assign_object_widget(param_1);
      iVar8 = 0;
      do {
        if (((int)(short)iVar6 == (int)(char)(&g_light_source_slots)[iVar8]) && (uVar10 == 1)) break;
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      } while (iVar8 < 4);
      if ((short)iVar8 == 4) {
        uVar4 = *param_1 & 0x1ff;
        if ((((uVar4 == 0x91) || (uVar4 == 0x92)) || (uVar4 == 0x90)) || (uVar4 == 0x93)) {
          iVar8 = 5;
          iVar6 = 0;
          do {
            puVar7 = (ushort *)get_equipped_item_at_slot(iVar8);
            iVar9 = extraout_r3;
            if (puVar7 == (ushort *)0x0) {
              iVar9 = iVar6 << 0x10;
            }
            iVar3 = iVar8;
          } while ((((puVar7 == (ushort *)0x0 && iVar9 >> 0x10 == 0) ||
                    (iVar3 = iVar6, puVar7 != param_1)) || (iVar6 = iVar8, uVar10 != 1)) &&
                  (iVar6 = iVar3, iVar8 = iVar8 + 1, iVar8 * 0x10000 >> 0x10 < 9));
          if ((short)iVar6 == 0) {
            uVar5 = 0xf6;
            goto LAB_0007ab1c;
          }
          decrement_object_count(param_1);
          place_object_in_backpack_slot(param_1,iVar6);
          FUN_00048110();
        }
      }
      uVar10 = *param_1;
      bVar1 = (byte)(uVar10 >> 8);
      bVar2 = (byte)uVar10;
      if ((uVar10 & 0xf) < 4) {
        *(byte *)param_1 = (bVar2 + 4 ^ bVar2) & 0xf ^ bVar2;
        *(byte *)((char *)param_1 + 1) = bVar1;
        set_ambient_bias_with_light(0);
      }
      else {
        *(byte *)param_1 = (bVar2 - 4 ^ bVar2) & 0xf ^ bVar2;
        *(byte *)((char *)param_1 + 1) = bVar1;
        set_ambient_bias_without_light(0);
      }
      refresh_player_equipment_effects();
      redraw_backpack_slot_widget(iVar6);
      return;
    }
    uVar5 = 0x7c;
  }
LAB_0007ab1c:
  print_scroll_message_by_id(uVar5);
  return;
}




// was FUN_0007acd4
undefined4 use_food_item(param_1,param_2,param_3)
char *param_1;
ushort * param_2;
int param_3;

{
  int iVar1;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  ushort *puVar7;
  uint uVar8;
  ushort uVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  bool bVar13;
  undefined2 uVar14;
  /* Was 76 bytes with a separate 555248-byte `acStackY_87970` "prefix"
     buffer that a copy loop wrote "That " into -- but the very next
     lines (Ordinal_1068/build_object_display_name) read and append to acStack_7c,
     which never got that prefix, so it started from stale/uninitialized
     stack content. Same split-buffer decompile artifact already fixed
     in build_creature_look_text's acStack_7c (see its comment): the
     giant acStackY_* array is a phantom Ghidra stack-frame-miscalc, and
     the real buffer is acStack_7c. Confirmed live: eating the bread
     inside an open container printed a message built from garbage
     stack bytes and, via Ordinal_1068 returning a wild "current length"
     into that garbage, build_object_display_name wrote the object's name out of
     bounds of the 76-byte buffer -- corrupting the stack badly enough
     to zero the player's HP field, immediately killing the character
     (a UW_DEBUG_INV hp-debug trace showed HP was still 34 right before
     this code ran and 0 immediately after). Fixed by seeding acStack_7c
     directly with the prefix instead, and widened generously like the
     other fix. */
  char acStack_7c [256];
  
  iVar11 = 0;
  iVar12 = 0xff;
  uVar8 = (uint)*param_2;
  if (((*param_2 & 0x8000) == 0) || ((param_2[3] & 0x8000) != 0)) {
    uVar9 = 1;
  }
  else {
    uVar9 = param_2[3] >> 6;
  }
  if (param_2 == g_selected_object) {
    if (1 < uVar9) {
      print_scroll_message_by_id(0x77);
      return 0xfffffffe;
    }
  }
  else if (param_3 == 0) {
    return 0xfffffffe;
  }
  uVar10 = uVar8 & 0x1f0;
  bVar13 = uVar10 == 0xb0;
  puVar7 = g_selected_object;
  if (bVar13) {
    puVar7 = (ushort *)&g_food_effect_table;
    uVar10 = uVar8 & 0xf;
  }
  uVar8 = uVar8 & 0x1ff;
  if (bVar13) {
    /* Was `(int)puVar7` -- round-tripping a real pointer (&g_food_effect_table,
       a static global whose real address can be anywhere in this
       64-bit process, not just the low 32 bits) through a 32-bit int
       truncates it before the offset is even added back, same class as
       many other fixes this session. Confirmed live: clicking a food
       item (id class 0xb0, e.g. the bread inside an open backpack
       container) crashed here reading an essentially random address.
       Do the offset arithmetic in the real pointer type instead.
       Also was `*(char *)` (signed) -- g_food_effect_table is declared
       `undefined1` (unsigned char), and the sentinel check just below
       (`(short)iVar12 == 0xff`) only makes sense if a stored byte of
       0xff reads back as +255, not -1. Reading it signed sign-extended
       any byte >= 0x80 into a negative iVar12, which the code below
       misreads as "this food is poisonous" and applies lethal damage
       for what should be an ordinary, harmless nutrition value -- the
       cause of a fresh character dying instantly from eating the bread
       once the crash above was fixed. */
    iVar12 = (int)*(byte *)((char *)puVar7 + uVar10);
  }
  if (uVar8 < 0xbf) {
    if (uVar8 == 0xbe) {
LAB_0007ae18:
      iVar11 = iVar11 + 1;
LAB_0007ae1c:
      iVar11 = iVar11 + 0xed;
    }
    else {
      if (uVar8 != 0x92) {
        if (uVar8 == 0xb8) {
          sVar4 = roll_skill_check(*(undefined1 *)(DAT_0023be74 + 7),0x14);
          if (sVar4 != 0) {
            iVar11 = rand_below(3);
            adjust_level7_hazard_value(g_player_object,iVar11 * -0x1000000 >> 0x18);
          }
          uVar9 = *(ushort *)(DAT_00086df8 + 0x61);
          if ((uVar9 & 0xc) < 0xc) {
            bVar3 = (byte)uVar9;
            *(byte *)(DAT_00086df8 + 0x61) = ((bVar3 & 0xfc) + 4 ^ bVar3) & 0xc ^ bVar3;
            *(char *)(DAT_00086df8 + 0x62) = (char)(uVar9 >> 8);
          }
          refresh_player_equipment_effects();
          iVar11 = 1;
        }
        else if (uVar8 != 0xb9) {
          if (uVar8 == 0xba) {
LAB_0007ae14:
            iVar11 = iVar11 + 1;
            goto LAB_0007ae18;
          }
          if (uVar8 < 0xbb) {
LAB_0007aefc:
            if ((short)iVar12 == 0xff) {
              return 0xffffffff;
            }
            goto LAB_0007af3c;
          }
          if (uVar8 < 0xbd) {
            iVar11 = 1;
            goto LAB_0007ae14;
          }
          if (uVar8 != 0xbd) goto LAB_0007aefc;
          goto LAB_0007ae1c;
        }
        iVar11 = iVar11 + 1;
      }
      iVar11 = iVar11 + 1;
LAB_0007aeb4:
      iVar11 = iVar11 + 0xe5;
    }
    goto LAB_0007af3c;
  }
  if (uVar8 == 0xbf) {
    uVar5 = 0x7f;
    goto LAB_0007b2e0;
  }
  if (uVar8 == 0xce) {
    iVar11 = 0xec;
LAB_0007af38:
    iVar12 = 4;
  }
  else if (uVar8 == 0xcf) {
    iVar11 = 0xe9;
    iVar12 = 0x17;
  }
  else {
    if (uVar8 == 0xd9) {
      iVar11 = 0xea;
      goto LAB_0007af38;
    }
    if (uVar8 != 0x11b) {
      if (uVar8 != 0x125) goto LAB_0007aefc;
      goto LAB_0007aeb4;
    }
    iVar11 = 0xeb;
    iVar12 = 0x40;
  }
LAB_0007af3c:
  iVar1 = (int)(short)iVar12;
  if (iVar1 < 1) {
    if (iVar1 < 0) {
      print_scroll_message_by_id(iVar11);
      if ((iVar1 < -1) && (-0x7f < iVar1)) {
        uVar9 = *(ushort *)(DAT_00086df8 + 0x61);
        if ((int)((uVar9 >> 4 & 0x3f) - iVar1) < 0x40) {
          uVar9 = ((uVar9 & 0xfff0) + (short)iVar12 * -0x10 ^ uVar9) & 0x3f0 ^ uVar9;
        }
        else {
          uVar9 = uVar9 | 0x3f0;
        }
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar9;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar9 >> 8);
        sVar4 = roll_skill_check(*(undefined1 *)(DAT_0023be74 + 5),
                             (*(ushort *)(DAT_00086df8 + 0x61) & 0x3f0) >> 4);
        if (sVar4 == -1) {
          print_scroll_message_by_id(0xf1);
          handle_rest_action(0xfffffffe);
          if (*(char *)((char *)g_player_object + 8) == '\0') goto LAB_0007b254;
          print_scroll_message_by_id(0xf3);
          uVar8 = Ordinal_2005(6,*(ushort *)(DAT_00086df8 + 0x61) >> 4 & 0x3f);
          uVar8 = (uVar8 & 0xff) + 10;
        }
        else {
          if (sVar4 != 0) {
            if (sVar4 == 2) {
              print_scroll_message_by_id(0xf2);
              adjust_player_hp(g_player_object,0xfffffffe);
            }
            goto LAB_0007b254;
          }
          uVar8 = Ordinal_2005(6,*(ushort *)(DAT_00086df8 + 0x61) >> 4 & 0x3f);
          uVar8 = uVar8 & 0xff;
        }
        set_movement_animation_timer(0x40,uVar8);
      }
    }
    else {
      print_scroll_message_by_id(iVar11);
    }
  }
  else {
    if ((iVar1 != 0xff) && (iVar12 = adjust_player_hunger(iVar12), iVar12 == 0)) {
      uVar5 = 0x7e;
LAB_0007b2e0:
      print_scroll_message_by_id(uVar5);
      return 0;
    }
    if ((short)iVar11 == 0) {
      acStack_7c[0] = '\0';
      Ordinal_1063(acStack_7c, s_That_000878f4);
      iVar11 = Ordinal_1068(acStack_7c);
      sVar4 = build_object_display_name(acStack_7c + iVar11,param_2,0,0);
      if (sVar4 == 0) {
        Ordinal_1063(acStack_7c,s_UNNAMED_00084f24);
      }
      iVar11 = rand_below(0x14);
      iVar11 = ((byte)param_2[2] & 0x3f) + iVar11;
      if (iVar11 < 0) {
        iVar11 = iVar11 + 0xf;
      }
      iVar11 = (int)(short)(iVar11 >> 4);
      if (4 < iVar11) {
        iVar11 = 4;
      }
      message_scroll_print_wrapped(acStack_7c);
      iVar11 = iVar11 + 0xac;
    }
    print_scroll_message_by_id(iVar11);
    if ((*param_2 & 0x1ff) == 0xb9) {
      uVar9 = *(ushort *)(DAT_00086df8 + 0x5f);
      if ((uVar9 & 0x3c) < 0x10) {
        uVar9 = uVar9 & 0xffd3 | 0x10;
      }
      else {
        if (0x33 < (uVar9 & 0x3c)) goto LAB_0007b254;
        uVar9 = ((uVar9 & 0xfc) + 8 ^ uVar9) & 0x3c ^ uVar9;
      }
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar9;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar9 >> 8);
    }
  }
LAB_0007b254:
  uVar14 = 0;
  trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,param_1,param_2,1);
  trigger_object_trap_or_use_action(param_1,param_2,4,(int)DAT_002020a0,CONCAT22(uVar14,DAT_002020a4));
  iVar11 = finish_object_use(param_2,param_3,1);
  if ((iVar11 != 0) && (g_cursor_holding_state == 1)) {
    g_selected_object = (ushort *)0x0;
  }
  return 1;
}




void try_combine_or_stow_object(param_1,param_2,param_3)
/* Was `int param_1; undefined4 param_2;` -- both real object pointers
   (matching check_object_combination's own param_1/param_2 types, forwarded to it
   unchanged just below), truncated to 32 bits on this 64-bit host.
   Same class as use_object_on_target/handle_object_drop_target's fixes just above it in
   this same never-before-exercised container-interact call chain. */
char *param_1;
ushort *param_2;
int param_3;

{
  char *wptr_60073;
  char cVar1;
  short sVar2;
  char *pcVar3;
  /* Was 544548 bytes -- same Ghidra stack-frame-size-miscalculation
     artifact already fixed twice this session (check_object_fits_in_slot,
     dispatch_object_action): a scratch copy of the short "UNNAMED"
     string that's never read back afterward. */
  char acStack_84f48 [64];
  char acStack_24 [20];
  
  sVar2 = check_object_combination(param_1,param_2,0);
  if (sVar2 == 0) {
    sVar2 = build_object_display_name(acStack_24,param_2,0,0);
    if (sVar2 == 0) {
      pcVar3 = s_UNNAMED_00084f24;
    wptr_60073 = acStack_84f48;
      do {
        cVar1 = *pcVar3;
        *wptr_60073 = cVar1; wptr_60073 = wptr_60073 + 1;
        pcVar3 = pcVar3 + 1;
      } while (cVar1 != '\0');
    }
    message_scroll_print_wrapped(&DAT_00085c88);
    message_scroll_print_wrapped(acStack_24);
    message_scroll_print_wrapped(s_is_locked__000878fc);
  }
  else if (param_3 == 0) {
    try_empty_container(param_2,param_1 == g_player_object);
  }
  else {
    /* Both calls here were bare (no arguments) -- see
       find_or_assign_object_widget's own fix comment and
       open_backpack_container's declared `short param_1`.
       find_or_assign_object_widget(param_2) finds (or allocates) the
       grid widget currently displaying this container; that widget
       index is exactly what open_backpack_container needs to know
       WHICH container to open. Confirmed crashing for real: opening a
       container nested inside an already-open container dereferenced
       whatever garbage register value reached open_backpack_container's
       param_1, since nothing here ever captured
       find_or_assign_object_widget's return value at all. */
    int _widget = find_or_assign_object_widget(param_2);
    if (getenv("UW_DEBUG_INV"))
      fprintf(stderr, "[inv] try_combine_or_stow_object open: param_2=%p find_or_assign_object_widget returned widget=%d\n",
              (void *)param_2, _widget);
    if (-1 < _widget) {
      open_backpack_container(_widget);
    }
  }
  return;
}






ushort *use_object_on_target(param_1,param_2,param_3)
/* Was `int param_1` -- every call site passes a real object pointer
   (g_player_object, the player object, at most sites), truncating it to
   32 bits on this 64-bit host. Same class as handle_object_drop_target's `iVar2`
   fix just above this function's own callers. */
ushort *param_1;
ushort * param_2;
int param_3;

{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  undefined2 *puVar5;
  ushort *puVar6;
  uint uVar7;
  undefined4 in_stack_ffffffe4;
  undefined2 uVar8;
  
  uVar8 = (undefined2)((uint)in_stack_ffffffe4 >> 0x10);
  uVar2 = *param_2;
  uVar7 = (uint)uVar2;
  if (*(short *)(DAT_00085a6c + 8) == 4) {
    if ((uVar7 & 0x1c0) != 0x80) {
      return param_2;
    }
    if ((uVar2 & 0x30) != 0) {
      return param_2;
    }
  }
  uVar3 = uVar2 >> 6 & 7;
  uVar1 = (ushort)((uVar7 & 0x30) >> 4);
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] use_object_on_target: obj0=0x%04x class(uVar3)=%d family(uVar1)=%d ptr=%p\n",
            (unsigned)uVar2, (int)uVar3, (int)uVar1, (void *)param_2);
  if ((uVar2 >> 6 & 7) == 0) {
    if (((uVar1 == 1) && (param_3 == 0)) && (param_1 != 0)) {
      FUN_000545ac(param_2,param_1);
    }
  }
  else if (uVar3 == 2) {
    if (uVar1 == 0) {
      try_combine_or_stow_object(param_1,param_2,param_3);
    }
    else if (uVar1 == 1) {
      if (7 < (uVar7 & 0xf)) {
        refuel_light_source_item(param_2,param_3);
        return param_2;
      }
      /* Dropped arguments: use_light_source (light/extinguish a light
         source) declares two params it dereferences immediately, but
         was called bare here -- leftover ARM register garbage stood in
         for the real torch object and mode. Confirmed live: clicking
         the Torch inside an open backpack container read garbage for
         `param_1[2] & 0x3f` (the torch's real fuel/charges field) and
         almost always happened to read 0, printing "That light is
         already used up" regardless of the torch's actual fuel. */
      use_light_source(param_2,param_3);
    }
    else if (uVar1 == 3) {
      use_food_item(param_1,param_2,param_3);
      return param_2;
    }
  }
  else if (uVar3 == 3) {
    if (uVar1 < 2) {
      arm_use_item_on_target_prompt(param_2,param_3);
    }
    else if (((uVar1 == 2) && ((uVar7 & 0x1ff) == 0xe7)) && (param_3 != 0)) {
      prompt_use_item_on_target(param_2,complete_use_item_on_flagged_tile);
    }
  }
  else {
    if (uVar3 == 4) {
      if (uVar1 == 0) {
        arm_use_item_on_player_prompt(param_2,param_3);
        goto LAB_00079cb8;
      }
      if (uVar1 == 1) {
        dispatch_use_held_item_by_type(param_1,param_2,param_3);
        goto LAB_00079cb8;
      }
      puVar6 = param_2;
      if (uVar1 != 2) {
        if (uVar1 == 3) {
          use_readable_item(param_2,param_3);
          return param_2;
        }
        goto LAB_00079cb8;
      }
    }
    else {
      if (uVar3 == 5) {
        dispatch_world_object_interaction_by_family(param_1,param_2);
        goto LAB_00079cb8;
      }
      if (uVar3 != 7) goto LAB_00079cb8;
      uVar7 = uVar7 & 0xf;
      if (uVar7 != 9) {
        if (uVar7 == 10) {
          iVar4 = finish_object_use(param_2,param_3,1);
          if (iVar4 != 0) {
            print_scroll_message_by_id(9);
            puVar5 = (undefined2 *)begin_holding_object_on_cursor(0,0x122);
            *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
            uVar8 = *puVar5;
            *(char *)puVar5 = (char)uVar8;
            *(byte *)((char *)puVar5 + 1) = (byte)((ushort)uVar8 >> 8) | 0x20;
            return (ushort *)0x0;
          }
        }
        else if (uVar7 == 0xf) {
          if (((byte)param_2[3] & 0xf) < 8) {
            open_door_object(param_2);
          }
          else {
            close_door_object(param_1,param_2);
          }
        }
        goto LAB_00079cb8;
      }
      if (((param_2[2] & 0xffc0) == 0) ||
         (puVar6 = (ushort *)resolve_object_link(param_2 + 2), (*puVar6 & 0x1ff) != 0x12e)) goto LAB_00079cb8;
    }
    dispatch_use_special_item_by_type(param_1,puVar6,param_3);
  }
LAB_00079cb8:
  trigger_object_trap_or_use_action(param_1,param_2,4,(int)DAT_002020a0,CONCAT22(uVar8,DAT_002020a4));
  trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,param_1,param_2,param_3);
  return param_2;
}



// was FUN_00079d08
bool finish_object_use(param_1,param_2,param_3)
/* Was `undefined4 param_1` -- a real object-record pointer (forwarded
   to decrement_object_count/discard_misplaced_object, which both dereference it), truncated
   to 32 bits on this host -- same class as many other fixes this
   session. */
ushort *param_1;
int param_2;
undefined4 param_3;

{
  short sVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's/discard_misplaced_object's
                   real `void *`/`ushort *` returns; only ever compared to
                   0 (FUN_00053644's plain int return also lands here, but
                   is likewise only ever compared to 0, so char* is safe) */
  undefined4 uVar3;
  ushort local_14 [2];

  if (param_2 == 0) {
    iVar2 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
    uVar3 = encode_object_slot_index(param_1);
    iVar2 = (char *)(intptr_t)FUN_00053644(iVar2 + 2,1,uVar3);
    if (iVar2 == 0) {
      sVar1 = encode_object_slot_index(param_1);
      local_14[0] = local_14[0] & 0x3f | sVar1 << 6;
      free_linked_object_recursive(local_14);
      iVar2 = 0;
    }
    else {
      iVar2 = (char *)discard_misplaced_object(DAT_002046b4,param_1,param_3);
      FUN_00049924(2);
    }
  }
  else {
    /* Dropped argument: decrement_object_count declares one param (the object)
       and forwards it on -- called bare here, same idiom as its own
       fix. */
    decrement_object_count(param_1);
    iVar2 = (char *)discard_misplaced_object(0,param_1,param_3);
  }
  return iVar2 == 0;
}





// was FUN_00079dec -- begins holding an object on the cursor for a
// deferred "use on target" interaction, but only if nothing is
// already selected (g_selected_object == 0; otherwise a no-op
// returning NULL). param_1 is an existing object to hold, or NULL to
// spawn a fresh one of type param_2 first. Sets g_cursor_holding_
// state to 1 and prompts via FUN_00057c5c (not yet named). Confirmed
// real callers in src/audio.c, src/item_use.c, and src/player.c.
short *begin_holding_object_on_cursor(param_1,param_2)
short * param_1;
uint param_2;

{
  if (g_selected_object == (short *)0x0) {
    if (param_1 == (short *)0x0) {
      param_1 = (short *)spawn_new_object(param_2,0);
    }
    else {
      param_2 = (int)*param_1 & 0x1ff;
    }
    g_cursor_holding_state = 1;
    g_selected_object = param_1;
    FUN_00057c5c(param_2);
  }
  else {
    param_1 = (short *)0x0;
  }
  return param_1;
}





// was FUN_00079e64 -- deferred-target-click completion callback for
// item type 0x101 specifically (armed by arm_use_item_on_player_
// prompt below): clears the pending-target UI state, then checks
// whether the held item (param_1) combines with the player, using
// the player's own offset+0x31 byte (a mixture/poison-type index) as
// the combination's extra parameter, and reports the result via one
// of several scroll messages -- playing a sound effect on one
// specific outcome (sVar1's default case).
void complete_use_reagent_on_player(param_1,param_2)
undefined4 param_1;
int param_2;

{
  short sVar1;
  undefined4 uVar2;

  if (param_2 != 0) {
    FUN_00057cac(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
    sVar1 = check_object_combination(g_player_object,param_1,
                         (int)((uint)*(byte *)(DAT_00086df8 + 0x31) * -0x10000) >> 0x10);
    if (sVar1 == 0) {
      uVar2 = 0x78;
    }
    else if (sVar1 == 1) {
      uVar2 = 3;
    }
    else if (sVar1 == 4) {
      uVar2 = 0x7a;
    }
    else {
      play_sound_effect_with_pan(0x13,0x40,0);
      uVar2 = 0x79;
    }
    print_scroll_message_by_id(uVar2);
  }
  return;
}



// was FUN_00079f1c -- deferred-target-click completion callback for
// item types 0x102-0x10e (armed by arm_use_item_on_player_prompt
// below): the general case, combining the held item with the player
// using the held item's own quality field (DAT_00202098+6, masked to
// 0x3f) as the combination parameter, reporting the result via
// message id (result+2).
void complete_use_item_on_player(param_1,param_2)
undefined4 param_1;
int param_2;

{
  int iVar1;

  if (param_2 != 0) {
    FUN_00057cac(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
    iVar1 = check_object_combination(g_player_object,param_1,*(ushort *)(DAT_00202098 + 6) & 0x3f);
    print_scroll_message_by_id(iVar1 + 2);
  }
  return;
}



// was FUN_00079f90 -- arms the "use item on target" prompt for a
// held item whose type falls in 0x101-0x10e: picks
// complete_use_reagent_on_player for the specific type 0x101, or
// complete_use_item_on_player for 0x102-0x10e, then hands that
// callback to prompt_use_item_on_target below. A no-op for any type
// outside that range.
void arm_use_item_on_player_prompt(param_1,param_2)
ushort * param_1;
int param_2;

{
  code *pcVar1;

  if (param_2 != 0) {
    if ((*param_1 & 0x1ff) == 0x101) {
      pcVar1 = complete_use_reagent_on_player;
    }
    else {
      if (0x10e < (*param_1 & 0x1ff)) {
        return;
      }
      pcVar1 = complete_use_item_on_player;
    }
    prompt_use_item_on_target(param_1,pcVar1);
  }
  return;
}



// was FUN_00079ff0 -- the general "use item on target" prompt setup:
// builds and prints "<item's display name> -- use it on what?" via
// build_object_display_name, then prompts the player to click a
// target (FUN_00057c5c) and arms the deferred-target-click state
// (g_selected_object, g_cursor_holding_state=2, DAT_00202098=the
// item being used, DAT_002020b8=the completion callback param_2 --
// the same pending-click callback slot dispatch_player_command's own
// cluster uses). param_2 is later invoked by whatever click-handling
// code resolves the target (see complete_use_reagent_on_player and
// complete_use_item_on_player above for two such callbacks).
void prompt_use_item_on_target(param_1,param_2)
ushort * param_1;
undefined4 param_2;

{
  char *wptr_58645;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  char acStack_87920 [555244];
  char acStack_34 [40];
  
  pcVar3 = &DAT_000878ec;
    wptr_58645 = acStack_87920;
  do {
    cVar1 = *pcVar3;
    *wptr_58645 = cVar1; wptr_58645 = wptr_58645 + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar4 = Ordinal_1068(acStack_34);
  sVar2 = build_object_display_name(acStack_34 + iVar4,param_1,0,0);
  if (sVar2 == 0) {
    Ordinal_1063(acStack_34,s_UNNAMED_00084f24);
  }
  Ordinal_1063(acStack_34,s_on_what__000878e0);
  message_scroll_print_wrapped(acStack_34);
  FUN_00057c5c(*param_1 & 0x1ff);
  g_selected_object = param_1;
  g_cursor_holding_state = 2;
  DAT_00202098 = param_1;
  DAT_002020b8 = param_2;
  return;
}





// was FUN_0007a0cc -- deferred-target-click completion callback for
// a use-item interaction restricted to target types 0x140-0x147:
// prints a "no effect" message (id 0x80) if the clicked target isn't
// in that range; otherwise prints a success message (id 0x81), sets
// bits on the target's quality field, and consumes the held item via
// finish_object_use. Armed by arm_use_item_on_special_target_prompt
// below. No callers found by grep in the remaining decompile.
void complete_use_item_on_special_target(param_1)
ushort * param_1;

{
  ushort uVar1;
  
  if (((*param_1 & 0x1ff) < 0x140) || (0x147 < (*param_1 & 0x1ff))) {
    print_scroll_message_by_id(0x80);
  }
  else {
    print_scroll_message_by_id(0x81);
    uVar1 = param_1[3];
    *(byte *)(param_1 + 3) = (byte)uVar1 | 0x3f;
    *(char *)((char *)param_1 + 7) = (char)(uVar1 >> 8);
    finish_object_use(DAT_00202098,1,1);
  }
  FUN_00057cac(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  return;
}



// was FUN_0007a180 -- arms the "use item on target" prompt with
// complete_use_item_on_special_target as the completion callback. No
// callers found by grep in the remaining decompile.
void arm_use_item_on_special_target_prompt(param_1,param_2)
undefined4 param_1;
int param_2;

{
  if (param_2 != 0) {
    prompt_use_item_on_target(param_1,complete_use_item_on_special_target);
  }
  return;
}





// was FUN_0007a198 -- deferred-target-click completion callback for
// a single specific quest interaction: requires the clicked target
// to be object type 0x165 and the held item's quality to be exactly
// 0x3e, plus a specific flag/field pattern on both objects (offset
// +0x8000/+0x7fc0==0x840); on success, sets two player quest-flag
// bits (DAT_00086df8+0x61/0x62), marks the target's quality "used",
// triggers an effect via attempt_talk_interaction, and syncs an
// object at a fixed tile (0x36,0x34) to the player via resolve_skill_gated_unlock_or_use.
// Prints one of several failure/progress messages otherwise. No
// callers found by grep in the remaining decompile -- likely a
// one-off scripted quest puzzle, not a general mechanic.
void complete_use_item_on_quest_target(param_1,param_2)
ushort * param_1;
undefined4 param_2;

{
  undefined2 uVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's/resolve_object_link's
                   real `void *` returns */
  undefined4 uVar3;
  undefined2 local_2c [5];
  ushort local_21;
  byte local_1e;
  undefined1 local_12;
  
  FUN_00057cac(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((*param_1 & 0x1ff) == 0x165) {
    if ((*(byte *)(DAT_00202098 + 6) & 0x3f) == 0x3e) {
      if ((((*param_1 & 0x8000) == 0) || ((param_1[3] & 0x8000) == 0)) ||
         ((param_1[3] & 0x7fc0) != 0x840)) {
        uVar3 = 0x103;
        goto LAB_0007a38c;
      }
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar1;
      *(byte *)(DAT_00086df8 + 0x62) = (byte)((ushort)uVar1 >> 8) | 4;
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar1;
      *(byte *)(DAT_00086df8 + 0x62) = (byte)((ushort)uVar1 >> 8) | 8;
      *(byte *)(param_1 + 3) = (byte)param_1[3] & 0x3f | 0x80;
      *(undefined1 *)((char *)param_1 + 7) = 0x88;
      local_2c[0] = 0x7e;
      local_21 = local_21 & 0xfff7 | 7;
      local_1e = local_1e | 0xc0;
      local_12 = 0x1b;
      attempt_talk_interaction(local_2c);
      iVar2 = (char *)tilemap_lookup(0x36,0x34);
      iVar2 = (char *)resolve_object_link(iVar2 + 2);
      if (iVar2 != 0) {
        resolve_skill_gated_unlock_or_use(g_player_object,0,iVar2,0);
      }
    }
    else {
      print_scroll_message_by_id(0x86);
    }
    finish_object_use(DAT_00202098,param_2,1);
  }
  else {
    uVar3 = 0x84;
LAB_0007a38c:
    print_scroll_message_by_id(uVar3);
  }
  return;
}





// was FUN_0007a3a8 -- deferred-target-click completion callback:
// resets DAT_0023bc94 and refreshes equipment effects, then if the
// clicked target is a container-class object (type class 0x1f0==
// 0x170), prints a progress message (id 0x9d) and re-dispatches
// through use_object_on_target (letting that function's own
// container-combination path finish the interaction); otherwise
// prints a "can't do that" message (id 0x9e). No callers found by
// grep in the remaining decompile.
void complete_use_item_on_container(param_1)
ushort * param_1;

{
  DAT_0023bc94 = 0;
  refresh_player_equipment_effects();
  if ((*param_1 & 0x1f0) == 0x170) {
    print_scroll_message_by_id(0x9d);
    use_object_on_target(g_player_object,param_1,0);
  }
  else {
    print_scroll_message_by_id(0x9e);
  }
  return;
}





// was FUN_0007a418 -- deferred-target-click completion callback,
// gated on both param_2 and param_3 being nonzero: resets the
// click-target UI state, then runs use_lockpick_on_object (a
// skill-difficulty-check interaction that builds the target's
// display name and compares its own difficulty rating against the
// player's skill byte at offset +0x2f) against the target. No
// callers found by grep in the remaining decompile.
void complete_use_item_skill_check(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
int param_3;

{
  if ((param_2 != 0) && (param_3 != 0)) {
    FUN_00057cac(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
    use_lockpick_on_object(param_1,*(undefined1 *)(DAT_00086df8 + 0x2f),1);
  }
  return;
}





// was FUN_0007a478 -- item-type dispatcher for use_object_on_target's
// class-3 branch: types 0xc2-0xc6 arm complete_use_item_on_quest_target
// (the one-off scripted puzzle); 0xd7 arms complete_use_item_skill_check;
// 0xd8 sets DAT_0023bc94 and arms complete_use_item_on_container;
// 0xd9/0xce/0xcf use a food item directly (use_food_item, no target
// prompt); anything else is a no-op. Confirmed real caller:
// use_object_on_target (src/item_use.c).
void arm_use_item_on_target_prompt(param_1,param_2)
ushort * param_1;
int param_2;

{
  ushort uVar1;
  code *pcVar2;
  
  uVar1 = *param_1 & 0x1ff;
  if ((uVar1 < 0xc2) || (0xc6 < uVar1)) {
    if (uVar1 == 0xd7) {
      pcVar2 = complete_use_item_skill_check;
    }
    else {
      if (uVar1 != 0xd8) {
        if (param_2 == 0) {
          return;
        }
        if (((uVar1 != 0xd9) && (uVar1 != 0xce)) && (uVar1 != 0xcf)) {
          return;
        }
        use_food_item(g_player_object,param_1,param_2);
        return;
      }
      DAT_0023bc94 = 1;
      refresh_player_equipment_effects();
      pcVar2 = complete_use_item_on_container;
    }
  }
  else {
    if (param_2 == 0) {
      return;
    }
    pcVar2 = complete_use_item_on_quest_target;
  }
  prompt_use_item_on_target(param_1,pcVar2);
  return;
}





// was FUN_0007a53c -- for_each_object_of_type callback (see that
// function's own callback contract): rolls a random value 0..param_2
// against the matched object's own byte at offset +8, adds 1 to that
// byte, and sets a flag bit at offset +0xe (bit 1). Always returns 0
// (never removes the object from for_each_object_of_type's scan).
// Confirmed real caller: complete_use_item_special_quest_event below.
undefined4 apply_random_roll_to_matched_object(param_1,param_2)
int param_1;
short param_2;

{
  char cVar1;
  
  cVar1 = Ordinal_2005((int)param_2,*(undefined1 *)(param_1 + 8));
  *(char *)(param_1 + 8) = cVar1 + '\x01';
  *(undefined1 *)(param_1 + 0xd) = *(undefined1 *)(param_1 + 0xd);
  *(byte *)(param_1 + 0xe) = *(byte *)(param_1 + 0xe) | 2;
  return 0;
}



// was FUN_0007a598 -- deferred-target-click completion callback for
// a single, major scripted quest event: only fires for target item
// type 0x117. On success: prints a message (id 0x85), consumes the
// held item, alters the target tile's texture, discards the object
// from the tile, resets DAT_002020a0 to -1 (a sentinel), sets two
// player status-flag bits (DAT_00086df8+0x5f/0x60 bit 0x20), sets
// BOTH the player's current and max mana (offsets +0x37/+0x38 --
// see draw_mana_stat_display's own confirmed "play_mana" field) from
// a max-mana source byte (+0xb0), and applies a random roll (via
// apply_random_roll_to_matched_object above) to every object of type
// 0xe7 in the level. Prints a different message (id 0x84) for any
// other clicked target. Given the scale of the state changes (mana
// restored to full, a whole object class affected), this looks like
// a major one-time quest/ritual completion rather than an everyday
// item interaction; the exact quest isn't identified here. No
// callers found by grep in the remaining decompile.
void complete_use_item_special_quest_event(param_1,param_2)
ushort * param_1;
int param_2;

{
  undefined2 uVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  if ((*param_1 & 0x1ff) == 0x117) {
    print_scroll_message_by_id(0x85);
    if (param_2 != 0) {
      finish_object_use(DAT_00202098,param_2,1);
    }
    spawn_scheduled_effect_object(param_1,4,5,0,0,DAT_002020a0,DAT_002020a4);
    iVar2 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
    discard_misplaced_object(iVar2 + 2,param_1,1);
    DAT_002020a0 = -1;
    uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
    *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar1 >> 8) | 0x20;
    *(undefined1 *)(DAT_00086df8 + 0x38) = *(undefined1 *)(DAT_00086df8 + 0xb0);
    *(undefined1 *)(DAT_00086df8 + 0x37) = *(undefined1 *)(DAT_00086df8 + 0xb0);
    for_each_object_of_type(0xe7,0,2,apply_random_roll_to_matched_object);
  }
  else if (param_2 != 0) {
    print_scroll_message_by_id(0x84);
  }
  if (g_selected_object != 0) {
    FUN_00057cac(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
  }
  return;
}





// was FUN_0007a704 -- deferred-target-click completion callback:
// only fires for target type 0x16e whose quality-indexed tile-flag
// lookup (DAT_0023add0) equals 0xb; on that match, consumes the held
// item and triggers an effect (trigger_object_trap_or_use_action, not yet named) at the
// player's own tile. Prints a "no effect" message (id 0x84)
// otherwise. Confirmed real caller: use_object_on_target
// (src/item_use.c).
void complete_use_item_on_flagged_tile(param_1,param_2)
ushort * param_1;
undefined4 param_2;

{
  FUN_00057cac(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if (((*param_1 & 0x1ff) == 0x16e) && (((&DAT_0023add0)[(byte)param_1[3] & 0x3f] & 0xff) == 0xb)) {
    finish_object_use(DAT_00202098,param_2,1);
    trigger_object_trap_or_use_action(g_player_object,param_1,7,(int)DAT_002020a0,DAT_002020a4);
    return;
  }
  print_scroll_message_by_id(0x84);
  return;
}



// was FUN_0007a7fc -- dispatches by the HELD item's own type (not
// the target's): type 0x112 either directly triggers
// complete_use_item_special_quest_event (if param_3==0, using
// param_2 as the item and skipping the target-click prompt) or arms
// it as a deferred-target-click completion (otherwise); 0x114 calls
// trigger_exploding_book_trap when param_3!=0; 0x115 advances a
// 3-state player counter (DAT_00086df8+0x61, wrapping) and triggers
// an effect via display_book_or_scroll_page, then rewrites the
// item's own low byte to 0xd5 and clears one bit of its high byte
// before flushing a redraw (FUN_00049924 or FUN_00048110 depending
// on param_3); 0x11b uses a food item directly. Confirmed real
// caller: use_object_on_target's class-1/family-1 branch
// (src/item_use.c).
void dispatch_use_held_item_by_type(param_1,param_2,param_3)
undefined4 param_1;
ushort * param_2;
int param_3;

{
  int uw_ord2005_rem_167 = 0;
  byte bVar1;
  undefined4 uVar2;
  ushort uVar3;
  short extraout_r1;
  int iVar4;
  
  uVar3 = *param_2 & 0x1ff;
  if (uVar3 == 0x112) {
    if (param_3 == 0) {
      DAT_00202098 = param_2;
      complete_use_item_special_quest_event(param_1,0,0);
    }
    else {
      prompt_use_item_on_target(param_2,complete_use_item_special_quest_event);
    }
  }
  else if (uVar3 == 0x114) {
    if (param_3 != 0) {
      trigger_exploding_book_trap();
    }
  }
  else if (uVar3 == 0x115) {
    uVar2 = Ordinal_1053();
    uw_ord2005_rem_167 = ((int)(uVar2)) % (3);
    iVar4 = (int)uw_ord2005_rem_167;
    uVar3 = *(ushort *)(DAT_00086df8 + 0x61);
    if ((uVar3 & 3) < 3) {
      bVar1 = (byte)uVar3;
      *(byte *)(DAT_00086df8 + 0x61) = (bVar1 + 1 ^ bVar1) & 3 ^ bVar1;
      *(char *)(DAT_00086df8 + 0x62) = (char)(uVar3 >> 8);
      iVar4 = 3 - (*(byte *)(DAT_00086df8 + 0x61) & 3);
    }
    display_book_or_scroll_page(iVar4 + 0xb);
    uVar3 = *param_2;
    *(undefined1 *)param_2 = 0xd5;
    *(byte *)((char *)param_2 + 1) = (byte)(uVar3 >> 8) & 0xfe;
    if (param_3 == 0) {
      FUN_00049924(2);
    }
    else {
      FUN_00048110();
    }
  }
  else if (uVar3 == 0x11b) {
    use_food_item(param_1,param_2,param_3);
  }
  return;
}





// was FUN_0007abbc -- refuels a light source item (torch/lamp):
// gated on the item's low nibble being outside 0xc-0xf (a "not
// already refueled" state check) and its "already used" flag (offset
// +1 bit 0x80) being clear. Looks for a matching fuel source in the
// item's own contents (FUN_000537d0), and on success advances the
// item's state nibble by 4, prints a "refueled" message (id 0x7d),
// and refreshes its inventory widget. Confirmed real caller:
// use_object_on_target's class-2 branch.
void refuel_light_source_item(param_1,param_2)
byte * param_1;
uint param_2;

{
  undefined2 uVar1;
  byte bVar2;
  int iVar3;
  byte *local_1c;
  
  if ((param_2 != 0) && (((*param_1 & 0xf) < 0xc || (0xf < (*param_1 & 0xf))))) {
    trigger_object_trap_or_use_action(g_player_object,param_1,4,(int)DAT_002020a0,DAT_002020a4);
    trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,g_player_object,param_1,param_2);
    if ((param_1[1] & 0x80) == 0) {
      local_1c = param_1 + 6;
      iVar3 = FUN_000537d0(&local_1c,0,4,2,param_2 & 0xffff0000);
      if (iVar3 == 0) {
        uVar1 = *(undefined2 *)param_1;
        bVar2 = (byte)uVar1;
        *param_1 = (bVar2 + 4 ^ bVar2) & 0xf ^ bVar2;
        param_1[1] = (byte)((ushort)uVar1 >> 8);
        print_scroll_message_by_id(0x7d);
        find_or_assign_object_widget(param_1);
        redraw_backpack_slot_widget();
      }
    }
  }
  return;
}





// was FUN_0007b2f0 -- deferred-target-click completion callback,
// gated on param_2 != 0 && param_3 == 0 and the used item not
// already being held by the player: for target types 0x153-0x156,
// clones the item 1-2 times (each clone's type id nudged by a random
// die roll toward 0x156), scattering the clones onto nearby tiles
// (place_object_in_world) -- one specific type-id outcome (0x10)
// also rolls a random enchantment bonus on the clone -- then discards
// the original from its tile. Prints a "no effect" message (id 0x84)
// for any other target type. No callers found by grep in the
// remaining decompile.
void complete_use_item_scatter_spawn(param_1,param_2,param_3)
short * param_1;
int param_2;
int param_3;

{
  int uw_ord2005_rem_168 = 0;
  undefined1 uVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  undefined4 uVar5;
  int iVar6;
  char *iVar7;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  ushort *puVar8;
  uint uVar9;
  uint uVar10;
  uint extraout_r1;
  uint uVar11;

  FUN_00057cac(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((param_2 != 0) && (param_3 == 0)) {
    uVar5 = encode_object_slot_index(param_1);
    iVar6 = FUN_00053644((char *)g_player_object + 6,1,uVar5);
    if (iVar6 == 0) {
      uVar11 = (int)*param_1 & 0x1ff;
      if (((ushort)uVar11 < 0x153) || (0x156 < (ushort)uVar11)) {
        print_scroll_message_by_id(0x84);
      }
      else {
        print_scroll_message_by_id(0x87);
        iVar7 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
        sVar4 = rand_below(2);
        iVar6 = ((int)sVar4 - uVar11) + 0x156;
        while( true ) {
          iVar6 = iVar6 * 0x10000 >> 0x10;
          if ((iVar6 < 1) || (puVar8 = (ushort *)spawn_new_object(1,0), puVar8 == (ushort *)0x0)) break;
          *(char *)puVar8 = (char)*param_1;
          *(undefined1 *)((char *)puVar8 + 1) = *(undefined1 *)((char *)param_1 + 1);
          *(char *)(puVar8 + 1) = (char)param_1[1];
          *(undefined1 *)((char *)puVar8 + 3) = *(undefined1 *)((char *)param_1 + 3);
          *(char *)(puVar8 + 2) = (char)param_1[2];
          *(undefined1 *)((char *)puVar8 + 5) = *(undefined1 *)((char *)param_1 + 5);
          *(char *)(puVar8 + 3) = (char)param_1[3];
          *(undefined1 *)((char *)puVar8 + 7) = *(undefined1 *)((char *)param_1 + 7);
          sVar4 = rand_below(2);
          uVar9 = uVar11 + (int)sVar4 + 1;
          if (0x156 < (int)(uVar9 * 0x10000) >> 0x10) {
            uVar9 = 0x10;
          }
          uVar10 = (*puVar8 ^ uVar9) & 0x1ff ^ (uint)*puVar8;
          uVar1 = (undefined1)uVar10;
          *(undefined1 *)puVar8 = uVar1;
          bVar2 = (byte)(uVar10 >> 8);
          *(byte *)((char *)puVar8 + 1) = bVar2;
          if ((short)uVar9 == 0x10) {
            *(undefined1 *)puVar8 = uVar1;
            *(byte *)((char *)puVar8 + 1) = bVar2 | 0x80;
            uVar5 = Ordinal_1053();
            uw_ord2005_rem_168 = ((int)(uVar5)) % (6);
            uVar9 = (uw_ord2005_rem_168 & 0xffff) + 3;
            *(byte *)(puVar8 + 3) = (byte)puVar8[3] & 0x3f ^ (char)uVar9 * '@';
            *(char *)((char *)puVar8 + 7) = (char)(uVar9 >> 2);
          }
          uVar3 = param_1[1];
          place_object_in_world((uint)(uVar3 >> 0xd) + DAT_002020a0 * 8,
                       ((uVar3 & 0x1c00) >> 10) + DAT_002020a4 * 8,uVar3 & 0x7f,puVar8,6,0);
          iVar6 = iVar6 + -1;
        }
        discard_misplaced_object(iVar7 + 2,param_1,1);
        FUN_00049924(2);
      }
    }
  }
  return;
}





// was FUN_0007b5a4 -- deferred-target-click completion callback,
// gated on both param_2 and param_3 nonzero: for target types
// 0xcc/0xcd (a fillable source, e.g. a fountain/well), consumes the
// held item and rewrites its type to 0x91 (matches this function's
// own 0x90/0x91 branch, so likely "empty flask" -> "filled flask"),
// then refreshes its inventory widget. For a held item already of
// type 0x90/0x91, tops off its quality/fill-level field (offset +2,
// low 6 bits) unless already full, printing a fill-progress message;
// types 0x94/0x95 print a sibling message pair without modifying
// anything. Any other combination just reports "no effect". No
// callers found by grep in the remaining decompile.
void complete_use_item_fill_flask(param_1,param_2,param_3)
ushort * param_1;
int param_2;
int param_3;

{
  int iVar1;
  ushort uVar2;
  short sVar3;
  int iVar4;
  
  uVar2 = *param_1 & 0x1ff;
  if ((uVar2 == 0x90) || (sVar3 = 4, uVar2 == 0x94)) {
    sVar3 = 0;
  }
  iVar1 = (int)sVar3;
  FUN_00057cac(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((param_2 != 0) && (param_3 != 0)) {
    if ((uVar2 < 0xcc) || (0xcd < uVar2)) {
      if ((uVar2 == 0x90) || (uVar2 == 0x91)) {
        uVar2 = param_1[2];
        if ((uVar2 & 0x3f) != 0x3f) {
          if ((uVar2 & 0x3f) < 0x20) {
            uVar2 = (uVar2 - 0x20 ^ uVar2) & 0x3f ^ uVar2;
          }
          else {
            uVar2 = uVar2 | 0x3f;
          }
          *(char *)(param_1 + 2) = (char)uVar2;
          *(char *)((char *)param_1 + 5) = (char)(uVar2 >> 8);
          print_scroll_message_by_id(iVar1 + 0xb3);
          finish_object_use(DAT_00202098,param_2,1);
          return;
        }
        iVar4 = iVar1 + 0xb4;
      }
      else if ((uVar2 == 0x94) || (iVar4 = 0xb1, uVar2 == 0x95)) {
        iVar4 = iVar1 + 0xb2;
      }
      print_scroll_message_by_id(iVar4);
    }
    else {
      print_scroll_message_by_id(0xb5);
      finish_object_use(DAT_00202098,param_2,1);
      uVar2 = *param_1;
      *(undefined1 *)param_1 = 0x91;
      *(byte *)((char *)param_1 + 1) = (byte)(uVar2 >> 8) & 0xfe;
      find_or_assign_object_widget(param_1);
      redraw_backpack_slot_widget();
    }
  }
  return;
}





// was FUN_0007b72c -- the central "use this special/unique item
// directly" dispatcher for item types 0x121-0x12f and 299/300,
// covering: resting in a bed (0x121, gated on the current UI state);
// door-texture scheduling (0x122); playing one of 2 musical
// instruments (0x123/0x124); a food-quality-reducing item (0x125);
// arming the special-target prompt (0x127, arm_use_item_on_special_
// target_prompt) or the scatter-spawn (0x128) and fill-flask (0x12d)
// completions via prompt_use_item_on_target; a specific quest item
// (0x129) that searches nearby containers for a matching combinable
// item and merges their quantities -- already fixed here (an earlier
// comment documents a real "already holding the matching quest item"
// check that was silently always false due to a sign-extension bug,
// same class as swap_cursor_and_slot_item's own fix); and 2 more
// object-type-specific branches (0x12e/0x12f) outside the switch,
// handled when param_3==0 (a "not yet holding a target" pre-check).
// Confirmed real caller: use_object_on_target's class-4 branch.
void dispatch_use_special_item_by_type(param_1,param_2,param_3)
int param_1;
ushort * param_2;
int param_3;

{
  ushort uVar1;
  int iVar2;
  int iVar3;
  ushort *puVar4;
  code *pcVar5;
  uint uVar6;
  undefined4 in_stack_ffffffd4;
  undefined2 uVar7;
  short local_24;
  short local_22;
  short local_20 [2];
  undefined1 auStack_1c [4];
  
  uVar7 = (undefined2)((uint)in_stack_ffffffd4 >> 0x10);
  if (param_3 == 0) {
    uVar1 = *param_2 & 0x1ff;
    if (uVar1 == 0x129) {
      if (param_1 != g_player_object) {
        return;
      }
      /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
         own identical fix comment. 0x129 has its own bit 8 set, so this
         comparison could never even succeed while reading a
         sign-extended single byte (0x29's own top bit is clear, so
         char-sign-extension never contributes that bit) -- this
         "already holding the matching quest item" check was silently
         always false. */
      if ((g_selected_object == (ushort *)0x0) || ((*(ushort *)g_selected_object & 0x1ff) != 0x129)) {
        puVar4 = (ushort *)FUN_000452dc(4,2,9,2,&local_22);
        if (puVar4 == (ushort *)0x0) {
          puVar4 = (ushort *)FUN_000452dc(4,2,9,4,&local_22);
          if (puVar4 == (ushort *)0x0) {
            puVar4 = (ushort *)0x0;
          }
          else {
            local_20[0] = 2;
          }
        }
        else {
          local_20[0] = 1;
        }
      }
      else {
        local_20[0] = 0;
        puVar4 = g_selected_object;
      }
      if (puVar4 == (ushort *)0x0) {
        return;
      }
      iVar3 = (puVar4[3] & 0xffc0) + (param_2[3] & 0xffc0);
      *(byte *)(puVar4 + 3) = (byte)iVar3 ^ (byte)puVar4[3] & 0x3f;
      *(char *)((char *)puVar4 + 7) = (char)((uint)iVar3 >> 8);
      if (local_20[0] == 1) {
        redraw_backpack_slot_widget((int)local_22);
      }
      else if (local_20[0] == 2) {
        refresh_container_view();
      }
      finish_object_use(param_2,0,1);
      return;
    }
    if (uVar1 == 0x12e) {
      iVar3 = resolve_object_variant_or_special_link(param_2,&local_24,local_20,auStack_1c);
      if (iVar3 != 0) {
        dispatch_trap_special_or_tile_action((int)DAT_002020a0,(int)DAT_002020a4,param_2,param_1,CONCAT22(uVar7,local_24),
                     local_20[0]);
        iVar3 = 0xf9;
        if (local_24 == 4) goto LAB_0007b9b8;
      }
      iVar3 = 0xed;
    }
    else {
      if (uVar1 != 0x12f) {
        return;
      }
      iVar3 = 0x112;
    }
    goto LAB_0007b9b8;
  }
  switch(*param_2 & 0x1ff) {
  case 0x121:
    if (*(short *)(DAT_00085a6c + 8) == 1) {
      handle_rest_action(1);
    }
    break;
  case 0x122:
    iVar3 = 9;
    iVar2 = spawn_scheduled_door_texture_object();
    if (iVar2 == -1) {
LAB_0007b894:
      iVar3 = iVar3 + 1;
      finish_object_use(param_2,param_3,1);
    }
    else if (iVar2 != 0) {
      if (iVar2 != 1) goto LAB_0007b9b8;
      iVar3 = 10;
      goto LAB_0007b894;
    }
    iVar3 = iVar3 + 1;
LAB_0007b9b8:
    print_scroll_message_by_id(iVar3);
    return;
  case 0x123:
    goto LAB_0007b7e4;
  case 0x124:
LAB_0007b7e4:
    play_musical_instrument((*param_2 & 0x1ff) - 0x123);
    break;
  case 0x125:
    uVar6 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar6;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar6 >> 8);
    reduce_item_quality_on_use(g_player_object,2);
    finish_object_use(param_2,param_3,1);
    iVar3 = 0xe0;
    goto LAB_0007b9b8;
  case 0x126:
    break;
  case 0x127:
    arm_use_item_on_special_target_prompt(param_2,param_3);
    break;
  case 0x128:
    pcVar5 = complete_use_item_scatter_spawn;
    goto LAB_0007b8b8;
  case 0x129:
    break;
  case 0x12a:
    break;
  case 299:
    iVar3 = try_climb_wall();
    if (iVar3 != 0) {
      iVar3 = begin_holding_object_on_cursor(0,0xb6);
      uVar7 = *(undefined2 *)(iVar3 + 4);
      *(byte *)(iVar3 + 4) = (byte)uVar7 | 0x3f;
      *(char *)(iVar3 + 5) = (char)((ushort)uVar7 >> 8);
    }
    wait_for_click_release(1);
    break;
  case 300:
    break;
  case 0x12d:
    pcVar5 = complete_use_item_fill_flask;
LAB_0007b8b8:
    prompt_use_item_on_target(param_2,pcVar5);
  }
  return;
}





// was FUN_0007baf0 -- "read" a book/sign/scroll-like item: type
// 0x13b (likely a dedicated multi-page book) switches to a reading
// UI mode (change_game_mode) when the current UI state permits.
// Other readable items (not the "inscribed" class 0x1000/0x140 combo)
// either print "You read the <name>: <text>" via message_scroll_
// print_wrapped -- fixing a dropped-argument bug already documented
// here -- when they have a real text id, or (for the "already
// triggered" bit 0x400 case) fire a babl/effect trigger via
// display_book_or_scroll_page instead. Anything else falls through to a generic
// tile-effect trigger + finish_object_use. Confirmed real caller:
// use_object_on_target's family-3 branch (src/item_use.c).
void use_readable_item(param_1,param_2)
ushort * param_1;
int param_2;

{
  ushort uVar2;
  short sVar3;
  int iVar5;
  /* Same split-buffer decompile artifact fixed in use_food_item (see its
     comment) and in build_creature_look_text: the "You read the "
     prefix was copied into a phantom, oversized acStackY_85d64 buffer
     that nothing else ever reads, leaving the real acStack_7c (read by
     Ordinal_1068 just below) uninitialized. Fixed the same way: seed
     acStack_7c directly, widened for safety. */
  char acStack_7c [256];
  
  if (param_2 != 0) {
    uVar2 = *param_1;
    if ((uVar2 & 0x1ff) == 0x13b) {
      if (*(short *)(DAT_00085a6c + 8) == 1) {
        change_game_mode(2);
      }
    }
    else if (((uVar2 & 0x1000) == 0) || ((uVar2 & 0x1c0) == 0x140)) {
      if ((uVar2 & 0x400) == 0) {
        if ((param_1[3] & 0x7fc0) < 0x4000) {
          acStack_7c[0] = '\0';
          Ordinal_1063(acStack_7c, s_You_read_the_00085ce8);
          iVar5 = Ordinal_1068(acStack_7c);
          sVar3 = build_object_display_name(acStack_7c + iVar5,param_1,0,0);
          if (sVar3 == 0) {
            Ordinal_1063(acStack_7c,s_UNNAMED_00084f24);
          }
          Ordinal_1063(acStack_7c,&DAT_00085ce0);
          message_scroll_print_wrapped(acStack_7c);
          /* Was `get_message_string(id); message_scroll_print_wrapped();`
             -- the SAME dropped-argument idiom fixed throughout this
             session (a register-carryover call with no explicit args).
             Thread the looked-up book/sign text through explicitly
             instead of relying on leftover register state. */
          message_scroll_print_wrapped(get_message_string(param_1[3] >> 6 | 0x600));
          message_scroll_print_wrapped(&s_scroll_newline_0008522c);
        }
        else {
          check_offering_container_puzzle();
        }
      }
      else {
        display_book_or_scroll_page((param_1[3] >> 6 & 0x1ff) + 0x100);
      }
    }
    else {
      trigger_object_trap_or_use_action(g_player_object,param_1,4,(int)DAT_002020a0,DAT_002020a4);
      trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,g_player_object,param_1,param_2);
      finish_object_use(param_1,param_2,0);
    }
  }
  return;
}





// was FUN_0007bcdc -- dispatches an interaction with a world object
// by its own type-id "family" bits (bits 4-5): family 0 handles
// doors (open/close, or a "locked"/"already open" scroll message for
// the player); family 1 handles mantra-chant statues (low nibble 7,
// handle_mantra_chant) and combinable levers/switches (nibble 0xb/
// 0xd, try_combine_or_stow_object); families 2 and 3 cycle a small
// state value (e.g. a multi-position switch or a lever with a
// positional sound effect) and flush a redraw. Already had a
// UW_DEBUG_DOOR diagnostic despite covering more than just doors.
// Confirmed real caller: use_object_on_target's class-5 branch.
void dispatch_world_object_interaction_by_family(param_1,param_2)
ushort * param_1;
ushort * param_2;

{
  char *wptr_59681;
  char cVar1;
  short sVar2;
  char *pcVar3;
  ushort uVar4;
  ushort uVar5;
  char acStack_84f44 [544548];
  char acStack_20 [20];
  
  uVar5 = *param_2;
  uVar4 = uVar5 >> 4 & 3;
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] dispatch_world_object_interaction_by_family: obj0=0x%04x family=%d low_nibble=%d\n",
            (unsigned)uVar5, (int)uVar4, (int)(uVar5 & 0xf));
  if ((uVar5 >> 4 & 3) == 0) {
    if ((uVar5 & 0xf) < 8) {
      sVar2 = check_object_combination(param_1,param_2,0);
      if (sVar2 == 0) {
        if ((*param_1 & 0x1ff) == 0x7f) {
          sVar2 = build_object_display_name(acStack_20,param_2,0,0);
          if (sVar2 == 0) {
            pcVar3 = s_UNNAMED_00084f24;
    wptr_59681 = acStack_84f44;
            do {
              cVar1 = *pcVar3;
              *wptr_59681 = cVar1; wptr_59681 = wptr_59681 + 1;
              pcVar3 = pcVar3 + 1;
            } while (cVar1 != '\0');
          }
          message_scroll_print_wrapped(&DAT_00085c88);
          message_scroll_print_wrapped(acStack_20);
          message_scroll_print_wrapped(s_is_locked__000878fc);
        }
      }
      else if ((param_1 == g_player_object) || ((param_2[3] & 1) == 0)) {
        close_door_object(param_1,param_2);
      }
    }
    else {
      open_door_object(param_2);
    }
  }
  else if (uVar4 == 1) {
    uVar4 = uVar5 & 0xf;
    if (uVar4 == 7) {
      handle_mantra_chant(0);
    }
    else if (((uVar4 == 0xb) || (uVar4 == 0xd)) && ((uVar5 & 0x8000) == 0)) {
      try_combine_or_stow_object(param_1,param_2,0);
    }
  }
  else {
    if (uVar4 == 2) {
      if (((uVar5 & 0xf) != 1) && ((uVar5 & 0xf) != 2)) {
        FUN_00049008(param_2,0xffffffff);
        return;
      }
      uVar5 = ((uVar5 >> 9) + 1) * 0x200 & 0xe00 | uVar5 & 0xe1ff;
    }
    else {
      if (uVar4 != 3) {
        return;
      }
      play_positional_sound_effect(0x13,DAT_002020a0 * 8 + 3,DAT_002020a4 * 8 + 3,0);
      uVar5 = ((uVar5 & 0xf) - 8 ^ *param_2) & 0xf ^ *param_2;
    }
    *(char *)param_2 = (char)uVar5;
    *(char *)((char *)param_2 + 1) = (char)(uVar5 >> 8);
    FUN_00049924(2);
  }
  return;
}





// was FUN_0007c1bc -- a shared "finalize object use" step called at
// the end of virtually every use-object interaction path
// (use_object_on_target, use_readable_item, dispatch_world_object_
// interaction_by_family): checks resolve_object_variant_or_special_link
// for a real link/description on the target (param_4), then either
// triggers a babl conversation script (dispatch_trap_special_or_tile_action) for the
// player-only case, or -- gated on a per-player cooldown counter
// (DAT_0024cfc8 vs a player field at offset +0xce) -- does the same
// for the interacting object (param_3) and finalizes via
// consume_linked_special_object_charge; plays a "denied" sound effect
// if the cooldown hasn't elapsed yet. Returns whether the script
// actually fired.
undefined4 trigger_object_use_babl_script(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined4 param_2;
ushort * param_3;
ushort * param_4;
int param_5;

{
  int iVar1;
  ushort *puVar2;
  undefined2 local_1c;
  undefined2 local_1a;
  int local_18;
  
  iVar1 = resolve_object_variant_or_special_link(param_4,&local_1a,&local_1c,&local_18);
  if ((iVar1 != 0) && (local_18 != 0)) {
    if (param_5 == 0) {
      puVar2 = param_4;
      if (((param_3 != g_player_object) || ((*param_4 & 0x1ff) < 0x98)) || (0x9b < (*param_4 & 0x1ff)))
      goto LAB_0007c2b8;
    }
    else {
      if (DAT_0024cfc8 <= *(uint *)(DAT_00086df8 + 0xce)) {
        DAT_0024cfc8 = *(uint *)(DAT_00086df8 + 0xce) + 0x2fd;
        puVar2 = param_3;
LAB_0007c2b8:
        dispatch_trap_special_or_tile_action(param_1,param_2,puVar2,param_3,local_1a,local_1c);
        consume_linked_special_object_charge(param_4);
        return 1;
      }
      play_sound_effect_with_pan(0x15,0x40,0);
    }
  }
  return 0;
}



// was FUN_0007c2ec -- another shared "finalize object use/trap check"
// step, called alongside trigger_object_use_babl_script throughout
// the use-object interaction paths: if the interacting object
// (param_2) isn't already flagged and has trapped/linked contents
// (offset +6 quality bits), searches its container chain
// (FUN_000537d0) for a matching entry -- a low-class match with an
// empty extra-flags field and param_3==4 triggers a trap effect
// (apply_trap_or_link_effect/refresh_object_link_chain, not yet named); a higher-class match
// instead runs the general "use item on object" resolver
// (resolve_skill_gated_unlock_or_use -- confirmed in an earlier pass as the skill-gated
// unlock/use resolver behind force_unlock_target_object).
void trigger_object_trap_or_use_action(param_1,param_2,param_3,param_4,param_5)
char *param_1;
char *param_2;   /* was int -- the picked object (g_interact_target etc.), deref'd at param_2+1 / param_2+6 */
undefined4 param_3;
undefined4 param_4;
undefined2 param_5;

{
  ushort *puVar1;
  ushort *local_1c;
  
  if (((param_2 != 0) && ((*(byte *)(param_2 + 1) & 0x80) == 0)) &&
     (local_1c = (ushort *)(param_2 + 6), (*local_1c & 0xffc0) != 0)) {
    puVar1 = (ushort *)FUN_000537d0(&local_1c,0,6,0xffffffff,0xffff);
    if (puVar1 != (ushort *)0x0) {
      if ((*puVar1 & 0x30) < 0x20) {
        if (((*puVar1 & 0x1e00) == 0) && ((short)param_3 == 4)) {
          apply_trap_or_link_effect(param_1,param_2,puVar1,param_4,param_5);
          refresh_object_link_chain(local_1c,puVar1);
        }
      }
      else {
        resolve_skill_gated_unlock_or_use(param_1,param_2,puVar1,param_3);
      }
    }
  }
  return;
}


// was FUN_0002805c -- checks if two objects are combinable: searches
// the combat/combination data table (&DAT_00100630, loaded by
// load_combat_data_file, 10 entries) for an unordered match of the two
// object ids, returning the combination index or -1 if none matches.
// Own debug trace confirms this role verbatim ("checking if %d and %d
// are combinable" / "objsbecombinable returns %d").
int objects_are_combinable(param_1,param_2)
ushort * param_1;
ushort * param_2;

{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  ushort uVar4;
  int iVar5;
  short sVar6;
  ushort *puVar7;
  int iVar8;
  
  uVar2 = *param_1;
  if ((((uVar2 & 0x8000) == 0) || ((param_1[3] & 0xffc0) < 0x41)) &&
     (((uVar2 & 0x8000) != 0 || ((param_1[3] & 0xffc0) == 0)))) {
    uVar1 = *param_2;
    if ((((uVar1 & 0x8000) == 0) || ((param_2[3] & 0xffc0) < 0x41)) &&
       (((uVar1 & 0x8000) != 0 || ((param_2[3] & 0xffc0) == 0)))) {
      uVar1 = uVar1 & 0x1ff;
      uVar2 = uVar2 & 0x1ff;
      debug_print(s_checking_if__d_and__d_are_combin_00084f90,uVar2,uVar1);
      puVar7 = &DAT_00100630;
      iVar8 = 0;
      do {
        uVar3 = *puVar7 & 0x1ff;
        uVar4 = puVar7[1] & 0x1ff;
        debug_print(s_combination__d_is__d_and__d__00084f70,iVar8,uVar3,uVar4);
        if (((*puVar7 | puVar7[1]) & 0x8000) != 0) {
          if (((uVar3 == uVar2) && (uVar4 == uVar1)) || ((uVar3 == uVar1 && (uVar4 == uVar2))))
          break;
          puVar7 = puVar7 + 3;
        }
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      } while (iVar8 < 10);
      sVar6 = (short)iVar8;
      iVar8 = (int)sVar6;
      iVar5 = -1;
      if (iVar8 != 10) {
        iVar5 = iVar8;
      }
      debug_print(s_objsbecombinable_returns__d_00084f50,iVar5);
      if (iVar8 == 10) {
        sVar6 = -1;
      }
      return (int)sVar6;
    }
  }
  return -1;
}



// was FUN_0002822c -- spawns the resulting object for combination
// index param_1 (the id looked up from &DAT_00100634, the same
// combination-table stride objects_are_combinable searches).
undefined4 spawn_combined_object(param_1)
short param_1;

{
  spawn_new_object((int)*(short *)(&DAT_00100634 + param_1 * 6),0);
  return 0;
}



// was FUN_00028254 -- checks whether object param_1 is the "consumed"
// ingredient half of combination index param_2: picks whichever of the
// combination table's two id slots matches param_1's own id, and
// returns that slot's own high bit (its "consumed" flag).
bool is_object_consumed_in_combination(param_1,param_2)
ushort * param_1;
short param_2;

{
  ushort *puVar1;

  puVar1 = &DAT_00100630 + param_2 * 3;
  if (((*puVar1 ^ *param_1) & 0x1ff) != 0) {
    puVar1 = &DAT_00100632 + param_2 * 3;
  }
  return (*puVar1 & 0x8000) != 0;
}


// was FUN_000282ac -- a specific puzzle/quest handler triggered by
// "reading" a special item (its own caller only reaches here for a
// message-id field in a reserved high range, not a normal book/sign
// text): searches a nearby container for exactly one each of 3
// hardcoded object ids (0xd9/0xb8/0xbe), and on a full match, marks the
// container "opened" (leaving any nested-container UI showing it first),
// frees its now-consumed contents, and prints a success scroll message
// (id 0x95); prints a "missing item"/"container not found" message
// (0x94/0x96) otherwise. The specific real-world puzzle/location this
// corresponds to isn't otherwise confirmed from the code alone.
undefined4 check_offering_container_puzzle()

{
  short *psVar1;
  ushort uVar2;
  bool bVar3;
  short sVar4;
  ushort *puVar5;
  undefined4 uVar6;
  ushort *puVar7;
  int iVar8;
  uint uVar9;
  undefined1 auStack_30 [4];
  short local_2c [4];
  short local_24 [4];
  
  local_24[0] = 0xd9;
  local_24[1] = 0xb8;
  local_24[2] = 0xbe;
  local_2c[0] = 0;
  local_2c[1] = 0;
  local_2c[2] = 0;
  puVar5 = (ushort *)FUN_000452dc(2,0,0xe,4,auStack_30);
  if (puVar5 == (ushort *)0x0) {
    uVar6 = 0x96;
  }
  else {
    puVar7 = puVar5 + 3;
    while (puVar7 = (ushort *)resolve_object_link(puVar7), puVar7 != (ushort *)0x0) {
      bVar3 = false;
      uVar2 = *puVar7;
      iVar8 = 0;
      do {
        psVar1 = local_24 + iVar8;
        local_2c[iVar8] = local_2c[iVar8] + (ushort)((uVar2 & 0x1ff) == (int)*psVar1);
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
        bVar3 = (bool)(bVar3 | (uVar2 & 0x1ff) == (int)*psVar1);
      } while (iVar8 < 3);
      if (!bVar3) goto LAB_000283ec;
      puVar7 = puVar7 + 2;
    }
    bVar3 = true;
    iVar8 = 0;
    do {
      bVar3 = (bool)(bVar3 & local_2c[iVar8] != 0);
      iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
    } while (iVar8 < 3);
    if (bVar3) {
      sVar4 = encode_object_slot_index(puVar5);
      if ((uint)(*(ushort *)(g_current_container_record + 8) >> 6) == (int)sVar4) {
        leave_nested_container_level();
      }
      free_linked_object_recursive(puVar5 + 3);
      uVar9 = *puVar5 & 0xff1b | 0x11b;
      *(char *)puVar5 = (char)uVar9;
      *(char *)((char *)puVar5 + 1) = (char)(uVar9 >> 8);
      FUN_00048110();
      print_scroll_message_by_id(0x95);
      return 1;
    }
LAB_000283ec:
    uVar6 = 0x94;
  }
  print_scroll_message_by_id(uVar6);
  return 0;
}


// was FUN_00039d78 -- the "climb" command handler: projects a point
// 11 units ahead of the player along their current heading, checks
// the tile there is a climbable wall/door of a height the player's
// own stat allows (else message 0x65, "can't climb here"), then rolls
// a 1-in-5 success chance. On success, checks encumbrance (comparing
// carried weight against a capacity derived from _DAT_002035cf and
// the player record) -- if too heavy, prints message 99 and returns 1
// (abort without spending the attempt); otherwise prints the success
// message 0x66. On the 4-in-5 failure roll, prints message 100.
// Returns 0 whenever a climb attempt (successful or not) actually
// happened.
// WARNING: Globals starting with '_' overlap smaller symbols at the same address

undefined4 try_climb_wall()

{
  int uw_ord2005_rem_103 = 0;
  ushort uVar1;
  ushort *puVar2;
  undefined4 uVar3;
  int extraout_r1;
  short local_8;
  short local_6;
  
  local_6 = DAT_00204880 >> 5;
  local_8 = DAT_00204882 >> 5;
  project_position_by_heading((int)DAT_00201c70 >> 8,0xb,&local_6,&local_8);
  puVar2 = (ushort *)tilemap_lookup((int)local_6 >> 3,(int)local_8 >> 3);
  uVar1 = *puVar2;
  if ((((uVar1 & 0xf) == 0) || (((&DAT_0023ae40)[uVar1 >> 10 & 0xf] & 0xfff0) != 0x10)) ||
     ((int)(*(byte *)((char *)g_player_object + 2) >> 3 & 0xf) <= (int)((uVar1 >> 4 & 0xf) - 1))) {
    uVar3 = 0x65;
  }
  else {
    uVar3 = Ordinal_1053();
    uw_ord2005_rem_103 = ((int)(uVar3)) % (5);
    if (uw_ord2005_rem_103 == 0) {
      if ((uint)(_DAT_002035cf >> 4) + (uint)*(ushort *)(DAT_00086df8 + 0x4a) <
          (uint)*(ushort *)(DAT_00086df8 + 0x4c)) {
        print_scroll_message_by_id(99);
        return 1;
      }
      uVar3 = 0x66;
    }
    else {
      uVar3 = 100;
    }
  }
  print_scroll_message_by_id(uVar3);
  return 0;
}


// was FUN_0003ab90 -- the "use lockpick on this lock" item-use
// handler: when param_3 is set, first prompts the player with a
// difficulty-flavored confirmation message (via prompt_yes_no_scroll)
// before proceeding; otherwise/always then shows the lockpicking UI
// page (0x104) and calls attempt_pick_lock. On success/failure,
// advances game time by a cost scaled to the lock's difficulty, rolls
// a chance to destroy the lockpick on a bad outcome
// (roll_object_destroy_chance), and prints the matching result
// message.
void use_lockpick_on_object(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
int param_3;

{
  short sVar1;
  int iVar2;
  int iVar3;
  short local_6c [2];
  uint local_68;
  undefined1 auStack_64 [80];
  
  local_68 = 1;
  build_object_display_name(auStack_64,param_1,0,0);
  if (param_3 != 0) {
    iVar2 = resolve_lock_difficulty_rating(param_1);
    if ((short)iVar2 < 0) {
      print_scroll_message_by_id(0x8e);
      return;
    }
    iVar2 = ((iVar2 - param_2) + 0xf) * 0x10000 >> 0x10;
    if (iVar2 < 0) {
      iVar2 = 0;
    }
    else if (iVar2 < 0x1f) {
      sVar1 = Ordinal_2005(10);
      iVar2 = sVar1 + 1;
    }
    else {
      iVar2 = 4;
    }
    print_scroll_message_by_id(0xd8);
    print_scroll_message_by_id(iVar2 + 0xdb);
    print_scroll_message_by_id(0xd9);
    message_scroll_print_wrapped(auStack_64);
    sVar1 = prompt_yes_no_scroll(0,0xda,&local_68);
    if ((sVar1 != 0) && (sVar1 < 4)) {
      local_68 = (uint)(sVar1 == 2);
      /* HACK: was a bare `echo_yes_no_to_scroll();` -- dropped
         argument, the same class of bug fixed repeatedly elsewhere in
         this file. local_68, just set on the line above from the
         prompt's own answer, is obviously the intended argument
         here. */
      echo_yes_no_to_scroll(local_68);
    }
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    if (local_68 == 0) {
      return;
    }
  }
  display_book_or_scroll_page(0x104);
  iVar2 = attempt_pick_lock(param_1,param_2,local_6c);
  if (param_3 == 0) {
    if ((short)iVar2 == -2) {
      /* was folded into `int iVar2` (reused elsewhere in this function for
         unrelated int values) -- truncated tilemap_lookup's real
         `void *` return */
      char *_tile2 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
      discard_misplaced_object(_tile2 + 2,param_1,0);
    }
  }
  else {
    *(byte *)(DAT_0023be74 + 0x1d) = *(byte *)(DAT_0023be74 + 0x1d) | 0xf;
    iVar3 = local_6c[0] * 0x3c00 + *(int *)(DAT_00086df8 + 0xce);
    *(char *)(DAT_00086df8 + 0xce) = (char)iVar3;
    *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar3 >> 8);
    *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar3 >> 0x10);
    *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar3 >> 0x18);
    if ((short)iVar2 == -2) {
      iVar3 = roll_object_destroy_chance(10,param_1);
      if (iVar3 == 0) {
        iVar2 = 0;
      }
      else {
        decrement_object_count(param_1);
        discard_misplaced_object(0,param_1,1);
      }
    }
    print_scroll_message_by_id(iVar2 + 0x8e);
    if ((short)iVar2 != 0) {
      message_scroll_print_wrapped(auStack_64);
      print_scroll_message_by_id(0x53);
    }
    refresh_player_equipment_effects();
    FUN_00049924(0x200);
  }
  return;
}


// was FUN_00043b78 -- place_object_in_backpack_slot's sibling for
// equipment slots (g_equipped_items, indexed by param_2): walks the
// container's contents list looking for the item currently in that
// slot, swaps it to the cursor if the new object doesn't fit, links
// the new object in, updates the slot's object-index encoding,
// propagates the weight delta up the container ancestry chain, then
// refreshes equipment effects and the inventory/backpack widgets.
bool place_object_in_equipment_slot(param_1,param_2)
ushort * param_1;
undefined4 param_2;

{
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  ushort *puVar5;
  ushort *puVar6;
  uint uVar7;
  int iVar8;
  byte *pbVar9;
  ushort *puVar10;
  char *pAncestor;

  /* Was `resolve_object_link(g_current_container_record + 8)` -- a
     tracking record lives outside the level's object arena
     resolve_object_link bounds-checks against, so this always returned
     NULL on this host (same class as the several already-fixed
     `resolve_object_link(g_current_container_record + 8)` call sites
     elsewhere in this file -- search "g_current_container_link holds
     the same identity"). Route through that same established
     global-copy workaround instead of resolving through the record's
     own memory directly. Also was truncating the resolved 64-bit
     contents-head pointer through `int iVar4` before adding +6 --
     fixed by giving it its own pointer-typed local rather than reusing
     `iVar4`, which has two unrelated plain-int roles later in this
     function. */
  g_current_container_link = *(undefined2 *)(g_current_container_record + 8);
  puVar10 = (ushort *)((char *)resolve_object_link(&g_current_container_link) + 6);
  iVar4 = (short)param_2 * 2;
  pbVar9 = &g_equipped_items + iVar4;
  puVar5 = (ushort *)resolve_object_link(pbVar9);
  while( true ) {
    puVar6 = (ushort *)resolve_object_link(puVar10);
    if (puVar5 == puVar6) {
      swap_cursor_and_slot_item(param_2,0);
      sVar1 = check_object_fits_in_slot(param_1,param_2);
      if (sVar1 == 0) {
        g_selected_object = param_1;
        FUN_00057cac(3);
        /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
           own identical fix comment. */
        FUN_00057c5c(*(ushort *)g_selected_object & 0x1ff);
        param_1 = puVar5;
      }
      object_list_insert_head(puVar10,param_1);
      uVar7 = encode_object_slot_index(param_1);
      *pbVar9 = *pbVar9 & 0x3f | (byte)((uVar7 & 0x3ff) << 6);
      (&DAT_00202951)[iVar4] = (char)((uVar7 << 0x16) >> 0x18);
      sVar2 = FUN_00046260(param_1);
      sVar3 = FUN_00046260(puVar5);
      /* Legacy truncated "prev" walk -- same fix as
         place_object_in_backpack_slot's sibling copy (search "still
         broken for genuine container nesting"); given its own dedicated
         local (pAncestor) since `iVar4` has unrelated plain-int roles
         elsewhere in this function. */
      for (pAncestor = g_current_container_record; pAncestor != 0;
          pAncestor = *(char **)(pAncestor + 0x14)) {
        iVar8 = (int)*(short *)(pAncestor + 10) + (((int)sVar2 - (int)sVar3) * 0x10000 >> 0x10);
        *(char *)(pAncestor + 10) = (char)iVar8;
        *(char *)(pAncestor + 0xb) = (char)((uint)iVar8 >> 8);
      }
      sVar2 = FUN_00046260(param_1);
      g_player_carry_weight = g_player_carry_weight + sVar2;
      refresh_player_equipment_effects();
      repopulate_container_grid_slots();
      redraw_inventory_widget_range((int)(char)(&g_backpack_slot_to_widget)[(short)param_2],
                   (int)(char)(&g_backpack_slot_to_widget)[(short)param_2]);
      return sVar1 != 0;
    }
    if (puVar6 == (ushort *)0x0) break;
    puVar10 = puVar6 + 2;
  }
  return false;
}


// was FUN_0004503c -- redraws the inventory widget for backpack slot
// param_1, via the slot-to-widget-index lookup table.
void redraw_backpack_slot_widget(param_1)
short param_1;

{
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[param_1]);
  return;
}
