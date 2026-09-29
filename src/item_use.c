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
// flags5f bit 2 (FUN_00027708's attack-swing "start new swing" gate)
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
    bVar2 = FUN_00072b2c();
    if ((4 < bVar2) && (bVar2 = FUN_00072b2c(), bVar2 < 8)) {
      return;
    }
    FUN_000735b0(8);
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
    FUN_00027694();
    FUN_000735c0();
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
        FUN_00078c80(0xfd);
      }
      FUN_00072f30(0xf,0x40,0xf6);
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
         known callers (FUN_00034fa4, itself only reached via
         FUN_0003513c) fire solely on a dungeon-level transition, not
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
      FUN_0004503c(iVar6);
      return;
    }
    uVar5 = 0x7c;
  }
LAB_0007ab1c:
  FUN_00078c80(uVar5);
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
     lines (Ordinal_1068/FUN_00078b18) read and append to acStack_7c,
     which never got that prefix, so it started from stale/uninitialized
     stack content. Same split-buffer decompile artifact already fixed
     in build_creature_look_text's acStack_7c (see its comment): the
     giant acStackY_* array is a phantom Ghidra stack-frame-miscalc, and
     the real buffer is acStack_7c. Confirmed live: eating the bread
     inside an open container printed a message built from garbage
     stack bytes and, via Ordinal_1068 returning a wild "current length"
     into that garbage, FUN_00078b18 wrote the object's name out of
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
      FUN_00078c80(0x77);
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
            FUN_00073e14(g_player_object,iVar11 * -0x1000000 >> 0x18);
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
      FUN_00078c80(iVar11);
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
          FUN_00078c80(0xf1);
          handle_rest_action(0xfffffffe);
          if (*(char *)((char *)g_player_object + 8) == '\0') goto LAB_0007b254;
          FUN_00078c80(0xf3);
          uVar8 = Ordinal_2005(6,*(ushort *)(DAT_00086df8 + 0x61) >> 4 & 0x3f);
          uVar8 = (uVar8 & 0xff) + 10;
        }
        else {
          if (sVar4 != 0) {
            if (sVar4 == 2) {
              FUN_00078c80(0xf2);
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
      FUN_00078c80(iVar11);
    }
  }
  else {
    if ((iVar1 != 0xff) && (iVar12 = FUN_00071b08(iVar12), iVar12 == 0)) {
      uVar5 = 0x7e;
LAB_0007b2e0:
      FUN_00078c80(uVar5);
      return 0;
    }
    if ((short)iVar11 == 0) {
      acStack_7c[0] = '\0';
      Ordinal_1063(acStack_7c, s_That_000878f4);
      iVar11 = Ordinal_1068(acStack_7c);
      sVar4 = FUN_00078b18(acStack_7c + iVar11,param_2,0,0);
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
    FUN_00078c80(iVar11);
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
  FUN_0007c1bc((int)DAT_002020a0,(int)DAT_002020a4,param_1,param_2,1);
  FUN_0007c2ec(param_1,param_2,4,(int)DAT_002020a0,CONCAT22(uVar14,DAT_002020a4));
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
    sVar2 = FUN_00078b18(acStack_24,param_2,0,0);
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

