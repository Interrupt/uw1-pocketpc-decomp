/* The inventory panel: click handling/dispatch, widget hit-testing and
 * redraw, and the inventory link-chain (de)serialization used by
 * save/load. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/inventory.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






void handle_inventory_panel_normal_click()

{
  short sVar1;
  undefined4 uVar2;

  g_interact_target = 0;
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_inventory_panel_normal_click called: g_cursor_holding_state=%d g_selected_object=%p DAT_00085a6c[3]=%d panel_x=%d panel_y=%d\n",
            (int)g_cursor_holding_state, (void *)g_selected_object, (int)DAT_00085a6c[3],
            (int)(*DAT_00085a6c + 0xf0), (int)(0x76 - DAT_00085a6c[1]));
  if (g_cursor_holding_state == 0) {
    if ((g_selected_object == 0) && (sVar1 = DAT_00085a6c[3], sVar1 != 1)) {
      if (sVar1 == 2) {
        if ((g_cursor_mode != 1) || (DAT_00085a6c[4] == 4)) {
          uVar2 = 0xfffffffe;
          goto LAB_0003f91c;
        }
      }
      else if (sVar1 != 3) {
        g_interact_target = 0;
        return;
      }
    }
    uVar2 = 0;
  }
  else if (g_cursor_holding_state == 1) {
    uVar2 = 4;
  }
  else {
    if (g_cursor_holding_state != 2) {
      g_interact_target = 0;
      return;
    }
    sVar1 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
    if ((sVar1 != 0x15) && (sVar1 != 0x16)) {
      g_interact_target = FUN_00045678(2);
      if (g_interact_target != 0) {
        (*DAT_002020b8)(g_interact_target,1,1);
        wait_for_click_release(1);
        return;
      }
      FUN_00057cac(3);
      g_cursor_holding_state = 0;
      g_selected_object = 0;
      return;
    }
    uVar2 = 1;
  }
LAB_0003f91c:
  handle_inventory_panel_click(uVar2);
  return;
}



void inventory_panel_click_region()

{
  if (getenv("UW_DEBUG_INV")) fprintf(stderr, "[inv] inventory_panel_click_region ENTRY g_active_hud_panel=%d mouse=(%d,%d)\n",
      (int)g_active_hud_panel, (int)g_mouse_x, (int)g_mouse_y);
  if (g_active_hud_panel == '\0') {
    handle_inventory_panel_normal_click();
  }
  else if (g_active_hud_panel == '\x01') {
    handle_rune_bag_click();
  }
  else if (g_active_hud_panel == '\x02') {
    handle_stats_panel_skill_scroll_click();
  }
  return;
}




// was FUN_000440d0
void serialize_inventory_link_chain(param_1,param_2)
undefined1 * param_1;
byte * param_2;

{
  undefined1 *puVar1;
  undefined1 *puVar2;
  uint uVar3;

  puVar1 = (undefined1 *)resolve_object_link(param_1);
  while (puVar1 != (undefined1 *)0x0) {
    puVar2 = (undefined1 *)alloc_save_record_slot();
    *puVar2 = *puVar1;
    puVar2[1] = puVar1[1];
    puVar2[2] = puVar1[2];
    puVar2[3] = puVar1[3];
    puVar2[4] = puVar1[4];
    puVar2[5] = puVar1[5];
    puVar2[6] = puVar1[6];
    puVar2[7] = puVar1[7];
    uVar3 = (uint)g_save_record_count;
    *param_2 = *param_2 & 0x3f | (byte)((uVar3 & 0x3ff) << 6);
    param_2[1] = (byte)((uVar3 << 0x16) >> 0x18);
    encode_equipped_item_index(param_1,param_2);
    param_1 = puVar1 + 4;
    param_2 = puVar2 + 4;
    if (((puVar1[1] & 0x80) == 0) && ((*(ushort *)(puVar1 + 6) & 0xffc0) != 0)) {
      serialize_inventory_link_chain(puVar1 + 6,puVar2 + 6);
    }
    puVar1 = (undefined1 *)resolve_object_link(param_1);
  }
  return;
}




// was FUN_00044398
void deserialize_inventory_link_chain(param_1,param_2)
byte * param_1;
ushort * param_2;

{
  undefined1 *puVar1;
  uint uVar2;
  undefined1 *puVar3;
  
  while (puVar3 = (undefined1 *)save_record_slot_from_index(*param_2 >> 6), puVar3 != (undefined1 *)0x0) {
    puVar1 = (undefined1 *)alloc_object_slot(0);
    *puVar1 = *puVar3;
    puVar1[1] = puVar3[1];
    puVar1[2] = puVar3[2];
    puVar1[3] = puVar3[3];
    puVar1[4] = puVar3[4];
    puVar1[5] = puVar3[5];
    puVar1[6] = puVar3[6];
    puVar1[7] = puVar3[7];
    uVar2 = encode_object_slot_index();
    *param_1 = *param_1 & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
    param_1[1] = (byte)((uVar2 << 0x16) >> 0x18);
    decode_equipped_item_index(param_1,param_2);
    param_1 = puVar1 + 4;
    param_2 = (ushort *)(puVar3 + 4);
    if (((puVar3[1] & 0x80) == 0) && ((*(ushort *)(puVar3 + 6) & 0xffc0) != 0)) {
      /* Dropped 2nd argument -- deserialize_inventory_link_chain takes (param_1, param_2) and
         every other call site (both non-recursive ones, a few lines up
         this file) passes both; this self-recursive call for a nested
         container's own contents only passed the first. Same idiom as
         serialize_inventory_link_chain's matching recursive call just above in this file
         (`serialize_inventory_link_chain(puVar1 + 6,puVar2 + 6);`), which this function
         otherwise exactly mirrors for the Load direction. Not yet known
         to have crashed in practice (would only trigger loading a save
         with a nested container in inventory), found while auditing this
         function for the same pointer-truncation bug class as its Save-
         side counterpart. */
      deserialize_inventory_link_chain(puVar1 + 6,(ushort *)(puVar3 + 6));
    }
  }
  return;
}




void handle_inventory_panel_click(param_1)
short param_1;

{
  short sVar1;
  char cVar2;
  ushort uVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  char *iVar6;
  ushort *puVar7;
  ushort *puVar8;
  int iVar9;
  ushort *puVar10;
  bool bVar11;
  short local_30;
  short local_2e;
  
  puVar10 = (ushort *)0x0;
  bVar11 = g_selected_object != 0;
  uVar5 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_inventory_panel_click click test: panel_x=%d panel_y=%d -> widget_id=%d\n",
            (int)(*DAT_00085a6c + 0xf0), (int)(0x76 - DAT_00085a6c[1]), (int)(short)uVar5);
  iVar9 = (int)(short)uVar5;
  /* Permanent (not env-gated) debug line: which real widget got clicked
     and which g_backpack_widget_to_slot/g_equipped_items slot it resolves
     to -- DEBUG(INFO,...) prints by default under normal play (run.sh's
     own UW_DEBUG_LEVEL=INFO), same as this file's other permanent [inv]
     lines (e.g. "use item" above), and is quieted automatically by the
     regression suite's own UW_DEBUG_LEVEL=WARN default. */
  if ((0 < iVar9) && (iVar9 < 0x17)) {
    DEBUG(INFO, "[inv] widget %d clicked -> slot %d\n", iVar9,
          (int)(char)(&g_backpack_widget_to_slot)[iVar9]);
  }
  /* The old CONTAINER_ICON_WIDGET_ID synthetic dispatch that used to
     live here (a project-added hack, drawn/hit-tested at a guessed
     screen position) is gone -- widget 20's own real table entry
     covers the "leave container" click now, and its full drop/click
     logic (auto-place a held item into the parent vs. pop one level)
     lives in handle_object_drop_target's `iVar2==0x14` case, which
     this function's own fallthrough below already reaches. See that
     branch's own comment for the history. */
  /* Was `iVar9 < 0x15` -- treated widget 20 (the real "leave container"
     button, see DAT_00085c4c's own comment) as an ordinary placeable
     backpack slot, so a plain click on it tried to pick up/drop an
     item there instead of ever reaching handle_object_drop_target's
     own `iVar2==0x14 -> leave_nested_container_level()` dispatch a
     little further down this file. Widgets 21/22 (scroll arrows) were
     already correctly excluded (21 is not < 21); only 20 needed
     excluding too. */
  if ((0 < iVar9) && (iVar9 < 0x14)) {
    cVar2 = (&g_backpack_widget_to_slot)[iVar9];
    if (g_selected_object == 0) {
      iVar9 = (int)(short)cVar2;
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[weapon-ready] click-dispatch: slot=%d equipped_raw=0x%04x weaponhand_target=%d\n", iVar9, (unsigned)*(ushort *)(&g_equipped_items + iVar9 * 2), 8 - (*(byte *)(DAT_00086df8 + 100) & 1));
      if ((*(ushort *)(&g_equipped_items + iVar9 * 2) & 0xffc0) == 0) {
        if (iVar9 == 8 - (*(byte *)(DAT_00086df8 + 100) & 1)) {
          toggle_weapon_ready();
        }
        wait_for_click_release(1);
        return;
      }
      if (((iVar9 != -1) && (iVar9 != 0x13)) && (iVar6 = wait_for_key_or_mouse_move(1), iVar6 != 0)) {
        puVar7 = (ushort *)resolve_object_link(&g_equipped_items + iVar9 * 2);
        uVar3 = *puVar7;
        if (((uVar3 & 0x8000) == 0) || ((puVar7[3] & 0x8000) != 0)) {
          if (((uVar3 & 0x1c0) == 0x80) && ((uVar3 & 0x30) == 0)) {
            puVar4 = g_open_container_list;
            if ((DAT_00085a6c[4] == 4) && ((uVar3 & 0xf) != 0xf)) {
              print_scroll_message_by_id(0xba);
              return;
            }
            for (; puVar4 != (undefined4 *)0x0; puVar4 = (undefined4 *)*puVar4) {
              puVar8 = (ushort *)resolve_object_link(puVar4 + 2);
              if (puVar8 == puVar7) {
                return;
              }
            }
          }
        }
        else if ((puVar7[3] & 0xffc0) != 0x40) {
          puVar10 = (ushort *)FUN_000470fc(puVar7);
          if (puVar10 == (ushort *)0x0) {
            return;
          }
          if (puVar10 != puVar7) {
            object_list_insert_head(puVar7 + 2,puVar10);
          }
        }
        bVar11 = true;
        if ((puVar10 == (ushort *)0x0) || (uVar5 = 1, puVar10 == puVar7)) {
          uVar5 = 0;
        }
        swap_cursor_and_slot_item((int)cVar2,uVar5);
        iVar6 = g_current_container_record;
        if (iVar9 < 0x14) {
          redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar9]);
        }
        else {
          /* Was walking the "prev" chain (up through every ancestor
             container, to propagate the removed item's weight all the
             way to the root) via CONCAT13/12/11 of the record's own
             byte-4..7 field -- the same legacy 4-byte "prev" that's only
             ever a truncated half of a real 64-bit pointer (see
             open_backpack_container's own record-widening comment).
             Harmless with a single open container (loop runs once,
             lands on 0); wild-pointer crash the instant a real ancestor
             existed to walk to -- confirmed live: moving an item inside
             a NESTED container's own grid ("Trying to move an item in a
             nested container causes a crash"). Walk the real,
             untruncated prev pointer at +0x14 instead, same fix as
             leave_nested_container_level/free_open_container_chain. */
          for (; iVar6 != 0; iVar6 = *(char **)(iVar6 + 0x14)) {
            iVar9 = calculate_object_weight(puVar7);
            iVar9 = *(short *)(iVar6 + 10) - iVar9;
            *(char *)(iVar6 + 10) = (char)iVar9;
            *(char *)(iVar6 + 0xb) = (char)((uint)iVar9 >> 8);
          }
          repopulate_container_grid_slots();
          refresh_container_view();
        }
        if (g_selected_object == 0) {
          return;
        }
        if (puVar10 != (ushort *)0x0) {
          g_cursor_holding_state = 1;
          return;
        }
      }
    }
    wait_for_click_release(1);
    get_mouse_position(&local_2e,&local_30);
    uVar5 = hit_test_inventory_widget((int)local_2e,(int)local_30);
  }
  wait_for_click_release(1);
  sVar1 = (short)uVar5;
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] handle_inventory_panel_click decision: g_selected_object=%p g_cursor_holding_state=%d sVar1=%d param_1=%d\n",
            (void *)g_selected_object, (int)g_cursor_holding_state, (int)sVar1, (int)param_1);
  if ((g_selected_object == 0) || (g_cursor_holding_state == 2)) {
    if (0 < sVar1) {
      if (-1 < param_1) {
        handle_object_drop_target(uVar5);
        return;
      }
      if (param_1 == -2) {
        perform_object_search_check();
      }
    }
  }
  else {
    g_cursor_holding_state = 1;
    /* Same stale-cursor-icon-erase race as attach_picked_up_object_to_cursor's
       own copy of this fix (see its own comment) -- this function's
       "release while holding" branch has the identical shape (widget
       dispatch redraws the dropped item, then later cleanup erases a
       still-pending save from the drag icon's last position, which can
       clobber that fresh redraw if the two overlap -- routine for a
       drop, since releasing ON the target slot is the point). Flush it
       here too, before any dispatch below can redraw anything --
       FUN_00056fe8() only does the actual pixel restore, it does NOT
       clear DAT_00204844 itself (every caller is responsible for that
       off its own return value, see its own comment); missing that
       clear left the flag set, so a LATER update_mouse_state cycle
       still saw "erase pending" and redundantly restored the same
       stale save a second time, clobbering the fresh redraw anyway. */
    if (FUN_00056fe8() != 0) {
      DAT_00204844 = 0;
    }
    if ((g_active_hud_panel != '\0') && (sVar1 != 0x17)) {
      g_cursor_holding_state = 1;
      return;
    }
    iVar9 = (int)sVar1;
    if (0 < iVar9) {
      /* `sVar1`/`iVar9` here is the actual RELEASE position, freshly
         hit-tested a few lines up (this function's own preceding
         widget-range block only handles the very first click of a
         drag, when nothing was held yet). Widget 20 (the real "leave
         container" indicator) falls through the `< 0x14` check below
         into handle_object_drop_target same as everywhere else now --
         see that function's own `iVar2==0x14` case for the full
         drop/click logic this used to duplicate here as a
         CONTAINER_ICON_WIDGET_ID special case. */
      /* Same `< 0x15` -> `< 0x14` fix as the top-of-function copy above
         (widget 20 needs handle_object_drop_target's real dispatch,
         not ordinary slot placement). */
      if (iVar9 < 0x14) {
        handle_backpack_slot_click((int)(char)(&g_backpack_widget_to_slot)[iVar9]);
      }
      else {
        handle_object_drop_target(uVar5);
        bVar11 = false;
      }
    }
  }
  if ((bVar11) && (g_selected_object == 0)) {
    FUN_00057cac(3);
    g_cursor_holding_state = 0;
  }
  return;
}




void redraw_inventory_widget(param_1)
undefined4 param_1;

{
  int iVar1;
  undefined4 uVar2;
  
  uVar2 = 0xffffffff;
  if (g_active_hud_panel == '\0') {
    iVar1 = (int)(short)param_1;
    if (iVar1 < 6) {
      redraw_armor_overlay_widgets();
    }
    else if (iVar1 < 0x15) {
      redraw_inventory_widget_range(param_1,param_1);
    }
    else {
      restore_captured_grtile_backdrop((&DAT_002028e8)[iVar1]);
      if (iVar1 == 0x15) {
        if (DAT_0020299c != 0) {
          uVar2 = 0x101b;
        }
      }
      else if (DAT_002029a0 != 0) {
        uVar2 = 0x101c;
      }
      if (-1 < (short)uVar2) {
        g_blit_transparent_mode = 1;
        draw_sprite_by_id(uVar2,(int)(short)(&g_inv_hotspot_draw_x)[iVar1 * 7],
                     (int)(short)(&g_inv_hotspot_draw_y)[iVar1 * 7],(&g_inv_hotspot_dirty_h)[iVar1 * 0xe],
                     (&g_inv_hotspot_dirty_w)[iVar1 * 0xe]);
        g_blit_transparent_mode = 0;
      }
    }
  }
  return;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

void redraw_inventory_widget_range(param_1,param_2)
int param_1;
short param_2;

{
  int iVar1;
  int iVar2;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  int iVar6;
  ushort *puVar7;
  undefined4 uVar8;
  undefined1 auStack_60 [12];
  /* Was `ushort auStack_54 [20]` (matching the real ARM binary's own
     stack layout exactly, confirmed via Ghidra decompile of the real
     FUN_00048198 at 0x48198) -- but redraw_container_icon_slot's real call site also
     matches ours exactly: `redraw_inventory_widget_range(6,0x16)`, a
     loop upper bound of 22, writing auStack_54[21] and auStack_54[22]
     (index 20 is separately special-cased via local_2c, never touches
     the array). The real binary's original stack layout happened to
     place harmless padding/an unrelated local there, so the same
     2-element overrun was silently benign in the shipped game; this
     recompile's different stack layout makes it a real, ASan-confirmed
     stack-buffer-overflow (WRITE of size 2, uw.c:40164) on literally the
     first HUD redraw of any fresh game. Widened to fit the real max
     index (22) actually used, rather than deviating from the real
     call's range -- a defensive size fix, not a logic change. */
  ushort auStack_54 [23];
  ushort local_2c;

  bVar5 = false;
  decrement_cursor_hide_depth();
  iVar1 = (int)(short)param_1;
  iVar2 = (int)param_2;
  g_blit_transparent_mode = 1;
  iVar3 = iVar1;
  do {
    iVar6 = iVar1;
    if (iVar2 < iVar3) {
joined_r0x00048308:
      while (iVar6 <= iVar2) {
        if (iVar6 != 0x14) {
          /* Was called here with g_blit_transparent_mode==1 (set just
             above this loop, for the item-sprite draw further down
             which genuinely needs it). restore_captured_grtile_backdrop restores a saved
             framebuffer tile pixel-for-pixel -- raw RGB565 screen
             data, not palette-indexed sprite art -- and it also
             respects g_blit_transparent_mode (skipping any source
             pixel whose raw 16-bit value is exactly 0 when it's set).
             0x0000 is a perfectly ordinary color (black) in a captured
             framebuffer tile, not a "this pixel is transparent" marker,
             so restoring one under transparent mode silently drops
             every genuinely-black pixel in it, leaving whatever stale
             content (often actual black) was already in the
             framebuffer showing through instead. Real bug regardless
             of the case below: found while chasing a user report of
             "closing a container draws black areas under some of the
             paper doll section", but live-testing with
             close_backpack_container also calling this function for
             the worn-item ring widgets (6-0xb) showed no visible
             change either way, so it wasn't -- by itself -- the
             visible cause there (see close_backpack_container's own
             comment for what that black area traced back to instead).
             Kept anyway since it's a genuine correctness fix for any
             captured tile that does contain real black pixels,
             independent of that specific symptom. Force opaque for
             the restore itself; the sprite draw right after still
             runs under the loop's own transparent mode, unaffected. */
          g_blit_transparent_mode = 0;
          restore_captured_grtile_backdrop((&DAT_002028e8)[iVar6]);
          g_blit_transparent_mode = 1;
          auStack_54[iVar6] = 1;
          if (getenv("UW_DEBUG_INV"))
            fprintf(stderr, "[inv] redraw_inventory_widget_range loop iVar6=%d slot_arr_idx=%d arr_val=0x%04x\n",
                    iVar6, (char)(&g_backpack_widget_to_slot)[iVar6],
                    (unsigned)*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2));
          if (iVar6 < 0x15) {
            if ((*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2) & 0xffc0) != 0) {
              if (getenv("UW_DEBUG_INV"))
                fprintf(stderr, "[inv] resolve addr=%p table=%p lo=%p hi=%p\n",
                        (void *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2),
                        (void *)g_backpack_slot_table, (void *)(DAT_002046b8 - 0x4000),
                        (void *)(DAT_002046c4 + 0x1800 + 0x38));
              puVar7 = (ushort *)resolve_object_link((ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2));
              if (puVar7 == 0) goto skip_slot_draw_iVar6;
              if (getenv("UW_DEBUG_INV"))
                fprintf(stderr, "[inv] slot widget_id=%d slot_arr_idx=%d objid=0x%03x draw_x=%d draw_y=%d w=%d h=%d\n",
                        iVar6, (char)(&g_backpack_widget_to_slot)[iVar6], *puVar7 & 0x1ff,
                        (int)(short)(&g_inv_hotspot_draw_x)[iVar6 * 7], (int)(short)(&g_inv_hotspot_draw_y)[iVar6 * 7],
                        (int)(&g_inv_hotspot_dirty_h)[iVar6 * 0xe], (int)(&g_inv_hotspot_dirty_w)[iVar6 * 0xe]);
              draw_sprite_by_id(*puVar7 & 0x1ff,(int)(short)(&g_inv_hotspot_draw_x)[iVar6 * 7],
                           (int)(short)(&g_inv_hotspot_draw_y)[iVar6 * 7],(&g_inv_hotspot_dirty_h)[iVar6 * 0xe],
                           (&g_inv_hotspot_dirty_w)[iVar6 * 0xe]);
              if ((((*puVar7 & 0x8000) != 0) && ((puVar7[3] & 0x8000) == 0)) &&
                 (uVar4 = puVar7[3] >> 6, 1 < uVar4)) {
                auStack_54[iVar6] = uVar4;
                bVar5 = true;
              }
              skip_slot_draw_iVar6:;
            }
          }
          else {
            redraw_inventory_widget(param_1);
          }
        }
        param_1 = (iVar6 + 1) * 0x10000 >> 0x10;
        iVar6 = param_1;
      }
      g_blit_transparent_mode = 0;
      if (bVar5) {
        select_active_font(s_font4x5p_sys_0008431c);
        *g_draw_color_index = 0x60;
        for (; iVar1 <= iVar2; iVar1 = (iVar1 + 1) * 0x10000 >> 0x10) {
          if (1 < (short)auStack_54[iVar1]) {
            uVar8 = Ordinal_1025((int)(short)auStack_54[iVar1],auStack_60,10);
            draw_text_string(uVar8,(short)(&g_inv_hotspot_draw_x)[iVar1 * 7] + 3,
                         (short)(&g_inv_hotspot_draw_y)[iVar1 * 7] + 1);
          }
        }
        select_active_font(s_font5x6p_sys_0008430c);
      }
      update_carry_weight_display(0);
      cursor_show_idle_tick();
      return;
    }
    if (iVar3 == 0x14) {
      restore_captured_grtile_backdrop(DAT_00202938);
      local_2c = 1;
      if (getenv("UW_DEBUG_W20"))
        fprintf(stderr, "[w20] slot=%d raw=0x%04x occupied=%d DAT_00202938=%p x=%d y=%d w=%d h=%d\n",
                (int)(unsigned char)DAT_00085c4c,
                (unsigned)*(ushort *)(&g_equipped_items + DAT_00085c4c * 2),
                (int)((*(ushort *)(&g_equipped_items + DAT_00085c4c * 2) & 0xffc0) != 0),
                (void *)DAT_00202938, (int)_DAT_00085bf0, (int)CONCAT11(DAT_00085bf3,DAT_00085bf2),
                (int)DAT_00085bf5, (int)DAT_00085bf4);
      if ((*(ushort *)(&g_equipped_items + DAT_00085c4c * 2) & 0xffc0) != 0) {
        puVar7 = (ushort *)resolve_object_link((ushort *)(&g_equipped_items + DAT_00085c4c * 2));
        if (getenv("UW_DEBUG_W20"))
          fprintf(stderr, "[w20] resolved=%p id=0x%03x\n", (void *)puVar7, puVar7 ? (unsigned)(*puVar7 & 0x1ff) : 0u);
        draw_sprite_by_id(*puVar7 & 0x1ff,(int)_DAT_00085bf0,(int)CONCAT11(DAT_00085bf3,DAT_00085bf2),
                     DAT_00085bf5,DAT_00085bf4);
        if ((((*puVar7 & 0x8000) != 0) && ((puVar7[3] & 0x8000) == 0)) &&
           (uVar4 = puVar7[3] >> 6, 1 < uVar4)) {
          bVar5 = true;
          local_2c = uVar4;
        }
      }
      goto joined_r0x00048308;
    }
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while( true );
}




int hit_test_inventory_widget(param_1,param_2)
short param_1;
short param_2;

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = (int)param_1;
  if (*(short *)(DAT_00085a6c + 8) == 4) {
    if ((((0x8b < iVar1) && (iVar1 < 0xc1)) && (param_2 < 0x30)) && (10 < param_2)) {
      return 0x18;
    }
  }
  else if ((DAT_0023be5c < iVar1) && (iVar1 < (int)DAT_0023be5c + (int)DAT_0023bd80)) {
    if (((int)param_2 < (int)DAT_0023be80) && ((int)DAT_0023be80 - (int)DAT_0023be88 < (int)param_2)
       ) {
      return 0x17;
    }
  }
  /* The "open container"/leave-container click used to be special-
     cased here at a guessed screen position (this project's own
     CONTAINER_ICON_WIDGET_ID hack, before widget 20's real hotspot
     data was recovered) -- removed now that the real table entry for
     widget 20 (scanned below, same as every other widget) covers it
     correctly, and drawing a real icon there too instead of the
     hack's slightly-offset guess. See DAT_00085c4c's own comment and
     handle_object_drop_target's `iVar2==0x14` case for the current
     mechanism. */
  iVar3 = 0;
  while (((iVar2 = iVar3 * 0xe, iVar1 < *(short *)(&g_inv_hotspot_click_x1 + iVar2) ||
          (*(short *)(&g_inv_hotspot_click_x2 + iVar2) < iVar1)) ||
         ((*(short *)(&g_inv_hotspot_click_y2 + iVar2) < param_2 ||
          (param_2 < *(short *)(&g_inv_hotspot_click_y1 + iVar2)))))) {
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    if (0x16 < iVar3) {
      return -1;
    }
  }
  return iVar3;
}



// was FUN_0003f648 -- called from handle_inventory_panel_click's
// param_1==-2 sentinel case (src/inventory.c:324, a distinct
// interaction gesture on an inventory/container slot). Runs the
// trap/use check (action code 5) on the target, then -- unless it's
// one of two exempt classes (0x140/0x180) or flagged non-searchable in
// the per-class table &DAT_00202c9a -- rolls a skill check (the skill
// id byte at DAT_00086df8+0x29, also reused for other skill checks
// elsewhere) and records the result into a 3-bit "search level" field
// in the object's quality bits (0x380), without re-rolling once that
// field already holds a value. Finishes by dispatching the object
// action and refreshing the inventory panel. Reads as a "search this
// object" (e.g. a corpse or container) interaction.
void perform_object_search_check()

{
  int iVar1;
  uint uVar2;
  uint uVar3;

  trigger_object_trap_or_use_action(g_player_object,g_interact_target,5,(int)DAT_002020a0,DAT_002020a4);
  if (g_interact_target == (ushort *)0x0) {
    g_interact_target = (ushort *)FUN_00045678(2);
    if (g_interact_target != (ushort *)0x0) goto LAB_0003f69c;
  }
  else {
LAB_0003f69c:
    uVar3 = *g_interact_target & 0x1c0;
    if (((uVar3 != 0x140) && (uVar3 != 0x180)) &&
       (((&DAT_00202c9a)[(*g_interact_target & 0x1ff) * 0xd] & 3) != 2)) {
      uVar3 = (g_interact_target[1] & 0x380) >> 7;
      if ((uVar3 & 4) == 0) {
        iVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x29),10);
        uVar2 = iVar1 + 1;
        if ((int)(uVar2 * 0x10000) >> 0x10 == 0) {
          uVar2 = 1;
        }
        if ((short)uVar2 < (short)((ushort)uVar3 & 3)) {
          uVar2 = uVar3 & 3;
        }
        uVar3 = CONCAT11(*(undefined1 *)((char *)g_interact_target + 3),(char)g_interact_target[1]) & 0xfe7f |
                (uVar2 & 3 | 4) << 7;
        *(char *)(g_interact_target + 1) = (char)uVar3;
        *(char *)((char *)g_interact_target + 3) = (char)(uVar3 >> 8);
      }
      else {
        uVar2 = uVar3 & 3;
      }
      goto LAB_0003f7cc;
    }
  }
  uVar2 = 1;
LAB_0003f7cc:
  dispatch_object_action(g_interact_target,uVar2);
  handle_inventory_panel_click(0xffffffff);
  return;
}
