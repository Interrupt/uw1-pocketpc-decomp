/* Object interaction dispatch: the default click handler and the
 * per-cursor-mode handlers (talk, look, use, attack). Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/interact.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0003ee90
void interact_default()

{
  int iVar1;
  int iVar2;
  ushort *puVar3;

  puVar3 = (ushort *)0x0;
  if (getenv("UW_DEBUG_INV"))
    fprintf(stderr, "[inv] interact_default entry: g_interact_target=%p g_cursor_holding_state=%d DAT_002020ec=%d DAT_002020e0=%d\n",
            (void *)g_interact_target, (int)g_cursor_holding_state, (int)DAT_002020ec, (int)DAT_002020e0);
  iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
  iVar2 = target_line_of_sight((int)DAT_000858c4,g_interact_target);
  if (DAT_002020ec == 0) {
    if (DAT_002020e0 != 0) {
      iVar1 = object_ptr_in_arena(g_interact_target);
      if ((iVar1 != 0) && ((*g_interact_target & 0x1c0) == 0x40)) {
        interact_talk_npc();
        return;
      }
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[door] interact_default -> interact_use\n");
      interact_use();
      return;
    }
    if ((*g_interact_target & 0x1ff) == 0x1ca) {
      if ((iVar1 != 0) && (iVar2 == 0)) {
        use_object_on_target(g_player_object,g_interact_target,0);
      }
      goto LAB_0003f11c;
    }
    iVar1 = 0x60;
  }
  else {
    if ((iVar1 != 0) && (iVar2 == 0)) {
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[grab] target=%p type=0x%x bit8000=%d target3=0x%x target3_bit8000=%d target3_qty=0x%x in_arena=%d\n",
                (void *)g_interact_target, (unsigned)(*g_interact_target & 0x1ff),
                (int)((*g_interact_target & 0x8000) != 0), (unsigned)g_interact_target[3],
                (int)((g_interact_target[3] & 0x8000) != 0), (unsigned)(g_interact_target[3] & 0xffc0),
                (int)object_ptr_in_arena((char *)g_interact_target));
      if (((*g_interact_target & 0x8000) != 0) &&
         (((g_interact_target[3] & 0x8000) == 0 && ((g_interact_target[3] & 0xffc0) != 0x40)))) {
        if (getenv("UW_DEBUG_THROW") && (*g_interact_target & 0x1ff) == 0x80)
          fprintf(stderr, "[grab] taking STACK-SPLIT branch, calling FUN_000470fc\n");
        puVar3 = (ushort *)FUN_000470fc();
        if (puVar3 == (ushort *)0x0) {
          if (getenv("UW_DEBUG_THROW") && (*g_interact_target & 0x1ff) == 0x80)
            fprintf(stderr, "[grab] FUN_000470fc returned NULL, bailing\n");
          return;
        }
        if (getenv("UW_DEBUG_THROW") && (*g_interact_target & 0x1ff) == 0x80)
          fprintf(stderr, "[grab] FUN_000470fc returned puVar3=%p (target=%p)\n", (void *)puVar3, (void *)g_interact_target);
        if (puVar3 != g_interact_target) {
          object_list_insert_head(g_interact_target + 2,puVar3);
        }
      }
      iVar1 = check_object_carry_weight(g_interact_target);
      if (iVar1 == 0) {
        if ((puVar3 != (ushort *)0x0) && (puVar3 != g_interact_target)) {
          iVar1 = (g_interact_target[3] & 0xffc0) + (puVar3[3] & 0xffc0);
          *(byte *)(g_interact_target + 3) = (byte)iVar1 ^ (byte)g_interact_target[3] & 0x3f;
          *(char *)((char *)g_interact_target + 7) = (char)((uint)iVar1 >> 8);
          object_list_unlink(g_interact_target + 2,puVar3);
        }
        print_scroll_message_by_id(0x5f);
        return;
      }
      iVar1 = FUN_00053920(g_interact_target,0x126);
      if (iVar1 != 0) {
        *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf0;
      }
      emit_noise_alert(g_interact_target,0);
      finalize_object_pickup(g_interact_target);
      g_cursor_holding_state = 1;
      attach_picked_up_object_to_cursor(g_interact_target);
      return;
    }
    iVar1 = (short)iVar1 + 0x5d;
  }
  print_scroll_message_by_id(iVar1);
LAB_0003f11c:
  wait_for_click_release(1);
  return;
}



// was FUN_0003f128
void interact_talk_npc()

{
  wait_for_click_release(1);
  attempt_talk_interaction(g_interact_target);
  return;
}




// was FUN_0003f14c
void interact_look()

{
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  uint local_18;

  DEBUG(INFO, "Interact Look");
  
  iVar2 = target_in_range(0x48,g_interact_target,DAT_002020b0);
  if ((iVar2 == 0) || (uVar3 = 1, DAT_002020ec != 0)) {
    uVar3 = 0;
  }
  dispatch_object_action(g_interact_target,uVar3);
  if (g_cursor_mode == 3) {
    sVar1 = roll_container_lockpick_check(g_interact_target,*(undefined1 *)(DAT_00086df8 + 0x2c));
    if (0 < sVar1) {
      local_18 = 1;
      sVar1 = prompt_yes_no_scroll(0,0xf4,&local_18);
      if ((sVar1 != 0) && (sVar1 < 4)) {
        local_18 = (uint)(sVar1 == 2);
        /* HACK: was a bare `echo_yes_no_to_scroll();` -- dropped
           argument, the same class of bug fixed repeatedly elsewhere
           in this file. local_18, just set on the line above from the
           prompt's own answer, is obviously the intended argument
           here. */
        echo_yes_no_to_scroll(local_18);
      }
      message_scroll_print_wrapped(&s_scroll_newline_0008522c);
      if (local_18 != 0) {
        roll_container_trap_disarm_check(g_interact_target,*(undefined1 *)(DAT_00086df8 + 0x2b));
      }
    }
  }
  else {
    DAT_002020e0 = 1;
  }
  trigger_object_trap_or_use_action(g_player_object,g_interact_target,5,(int)DAT_002020a0,DAT_002020a4);
  if (g_cursor_mode == 3) {
    wait_for_click_release(1);
  }
  else {
    iVar2 = FUN_000576d0();
    if (iVar2 != 0) {
      interact_default();
    }
  }
  DAT_002020e0 = 0;
  return;
}



// was FUN_0003f2c4, briefly named interact_converse by an earlier
// pass. Renamed: its body never actually starts a conversation --
// when the target is in range but line-of-sight is blocked (a door,
// a lever behind an obstruction, etc.) it calls use_object_on_target;
// otherwise it just prints message 0xb9 (unless the target is type
// 0x16e) and does nothing else. Real UW1's own mode ordering (user-
// confirmed: Talk/Get/Look/Attack/Use, top to bottom of the icon
// bar) has NO separate "converse" mode at all -- Talk is its own
// mode (interact_talk_npc, mode 5); this function is Use (mode 1,
// table index 0), matching "open doors, use pull chains, etc."
void interact_use()

{
  int iVar1;

  DEBUG(INFO, "Interact use");
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] interact_use() called: g_interact_target=%p obj0=0x%04x\n",
            (void *)g_interact_target, g_interact_target ? (unsigned)*g_interact_target : 0);

  wait_for_click_release(1);
  iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
  if ((iVar1 == 0) || (iVar1 = target_line_of_sight((int)DAT_000858c4,g_interact_target), iVar1 != 0)) {
    if ((*g_interact_target & 0x1fe) != 0x16e) {
      print_scroll_message_by_id(0xb9);
    }
  }
  else {
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] interact_use() -> use_object_on_target\n");
    use_object_on_target(g_player_object,g_interact_target,0);
  }
  return;
}



// was FUN_0003f368
void interact_attack()

{
  short *psVar1;
  short sVar2;
  short sVar3;
  int iVar4;

  DEBUG(INFO, "Interact attack");

  psVar1 = DAT_00085a6c;
  sVar2 = Ordinal_2005(DAT_0023be88 + 2,DAT_00085a6c[1] * 3);
  sVar3 = Ordinal_2005(DAT_0023bd80 + 2,*psVar1 * 3);
  iVar4 = sVar2 * 3 + (int)sVar3;
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[attack-dir] click=(%d,%d) view=(%d,%d) row=%d col=%d grid=%d -> attack_type=%d\n",
      (int)*psVar1, (int)DAT_00085a6c[1], (int)DAT_0023bd80, (int)DAT_0023be88, (int)sVar2, (int)sVar3, iVar4, iVar4+1);
  if (iVar4 * 0x10000 >> 0x10 < 2) {
    iVar4 = 2;
  }
  tick_weapon_swing_state(iVar4 + 1);
  return;
}







// was FUN_0006fed4 -- triggers the "illustrated book/scroll" full-
// screen picture feature (via record_illustration_discovery_and_display -> display_book_or_scroll_page, see the
// "SPECIAL ILLUSTRATED BOOK/SCROLL" comment elsewhere in this file for
// how display_book_or_scroll_page's argument selects which picture) with illustration
// index 0x100 and the current level (DAT_00201b68) as payload. Its one
// caller fires this when reading a terrain description for a terrain
// type flagged 9 in DAT_0023add0 -- a special "you've found something"
// discovery moment, not an ordinary terrain read.
void trigger_terrain_discovery_illustration()

{
  record_illustration_discovery_and_display(0x100,(int)DAT_00201b68);
  return;
}






// was FUN_0006fee8 -- trigger_terrain_discovery_illustration's sibling,
// illustration index 0x101: fired after reading a sign/plaque or
// gravestone inscription whose text is non-empty (param_1 is the
// inscription's own first character, only used here as a "was there
// any text at all" guard).
void trigger_inscription_illustration(param_1)
undefined4 param_1;

{
  if ((short)param_1 != 0) {
    record_illustration_discovery_and_display(0x101,param_1);
  }
  return;
}






// was FUN_00072598 -- rolls a skill check (roll_skill_check(param_2,8))
// against the first contained item in container param_1, but only if
// that item's own quality/type field (after resolving through a link
// when a specific bit is set) is below 3 -- e.g. checking whether a
// container holds something pickable/breakable in a low-quality state.
// param_2 is the skill id to check, most plausibly the picklock skill
// given the container-contents-search shape (not otherwise confirmed).
undefined4 roll_container_lockpick_check(param_1,param_2)
char *param_1;
undefined4 param_2;

{
  byte *pbVar1;
  undefined4 uVar2;
  ushort *local_c;
  
  if ((((*(byte *)(param_1 + 1) & 0x80) == 0) &&
      (local_c = (ushort *)(param_1 + 6), (*local_c & 0xffc0) != 0)) &&
     (pbVar1 = (byte *)find_object_in_chain(&local_c,0,6,0xffffffff,0xffff), pbVar1 != (byte *)0x0)) {
    if (0x1f < (*pbVar1 & 0x30)) {
      pbVar1 = (byte *)resolve_object_link((ushort *)(pbVar1 + 6)); /* confirmed via ARM disassembly, 0x72628 */
    }
    if ((*pbVar1 & 0x3f) < 3) {
      uVar2 = roll_skill_check(param_2,8);
      return uVar2;
    }
  }
  return 0;
}






// was FUN_0007266c -- roll_container_lockpick_check's sibling for the
// "disarm trap" mechanic: same container-contents/quality-gated setup,
// but rolls a disarm skill check (roll_skill_check(param_2,8)) and
// handles all three outcomes -- critical failure (<0: trap triggers,
// via apply_trap_or_link_effect/refresh_object_link_chain or resolve_skill_gated_unlock_or_use depending on whether
// the trapped item resolved through a link) with "Your bumbling
// attempts have set o[ff the trap]", plain failure (==0: "Unable to
// defuse trap"), and success (>0: "X was successfully dearmed on the
// Y" followed by free_linked_object_recursive removing the trap).
// acStackY_84f50's 544536-byte size is this project's established
// phantom-oversized-local artifact (only ever holds a short string
// copy here), not a real requirement.
undefined4 roll_container_trap_disarm_check(param_1,param_2)
char *param_1;
undefined4 param_2;

{
  char *wptr_53920;
  char *wptr_53945;
  char *wptr_53956;
  char cVar1;
  short sVar2;
  byte *pbVar3;
  byte *pbVar4;
  char *pcVar5;
  char *pcVar6;
  byte *pbVar7;
  undefined4 uVar8;
  char acStackY_84f50 [544536];
  ushort *local_34 [2];
  char acStack_2c [20];
  
  uVar8 = 0;
  if (((*(byte *)(param_1 + 1) & 0x80) == 0) &&
     (local_34[0] = (ushort *)(param_1 + 6), (*local_34[0] & 0xffc0) != 0)) {
    pbVar3 = (byte *)find_object_in_chain(local_34,0,6,0xffffffff,0xffff);
    if (pbVar3 != (byte *)0x0) {
      if ((*pbVar3 & 0x30) < 0x20) {
        pbVar7 = (byte *)0x0;
        pbVar4 = pbVar3;
      }
      else {
        pbVar4 = (byte *)resolve_object_link(pbVar3 + 6);
        pbVar7 = pbVar3;
      }
      if ((*pbVar4 & 0x3f) < 3) {
        uVar8 = roll_skill_check(param_2,8);
        if ((short)uVar8 < 1) {
          if ((short)uVar8 < 0) {
            message_scroll_print_wrapped(s_Your_bumbling_attempts_have_set_o_00087384);
            sVar2 = build_object_display_name(acStack_2c,pbVar4,0,0);
            if (sVar2 == 0) {
              pcVar6 = s_UNNAMED_00084f24;
    wptr_53920 = acStackY_84f50;
              do {
                cVar1 = *pcVar6;
                *wptr_53920 = cVar1; wptr_53920 = wptr_53920 + 1;
                pcVar6 = pcVar6 + 1;
              } while (cVar1 != '\0');
            }
            message_scroll_print_wrapped(acStack_2c);
            message_scroll_print_wrapped(&DAT_00084f20);
            if (pbVar7 == (byte *)0x0) {
              apply_trap_or_link_effect(g_player_object,param_1,pbVar4,(int)DAT_002020a0,DAT_002020a4);
              refresh_object_link_chain(local_34[0],pbVar4);
            }
            else {
              resolve_skill_gated_unlock_or_use(g_player_object,param_1,pbVar7,0xffffffff);
            }
          }
          else {
            message_scroll_print_wrapped(s_Unable_to_defuse_trap__0008736c);
          }
        }
        else {
          sVar2 = build_object_display_name(acStack_2c,pbVar4,0,0);
          pcVar6 = s_UNNAMED_00084f24;
    wptr_53956 = acStackY_84f50;
          if (sVar2 == 0) {
            pcVar5 = pcVar6;
    wptr_53945 = acStackY_84f50;
            do {
              cVar1 = *pcVar5;
              *wptr_53945 = cVar1; wptr_53945 = wptr_53945 + 1;
              pcVar5 = pcVar5 + 1;
            } while (cVar1 != '\0');
          }
          message_scroll_print_wrapped(&DAT_00085c88);
          message_scroll_print_wrapped(acStack_2c);
          message_scroll_print_wrapped(s_on_the_000873cc);
          sVar2 = build_object_display_name(acStack_2c,param_1,0,0);
          if (sVar2 == 0) {
            do {
              cVar1 = *pcVar6;
              *wptr_53956 = cVar1; wptr_53956 = wptr_53956 + 1;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
          }
          message_scroll_print_wrapped(acStack_2c);
          message_scroll_print_wrapped(s_was_successfully_dearmed__000873b0);
          free_linked_object_recursive(local_34[0]);
        }
      }
    }
  }
  else {
    uVar8 = 0;
  }
  return uVar8;
}


// was FUN_0007cdbc -- confirmed by its callers as the general
// skill-gated "use item on object" resolver behind
// force_unlock_target_object (action code 5 == unlock, gated on a
// pick-locks skill check via roll_skill_check against the lock's
// difficulty byte) and trigger_object_trap_or_use_action (higher-
// class linked-content matches). param_4 is the requested action
// code, checked against a per-lock-class table (DAT_0024cfe0) indexed
// by param_3's low nibble; param_1 is the acting object (player or
// tool), param_2 a secondary context object gating an extra class/
// quality-bit check. Returns 2 for "denied"; on success, delegates to
// apply_trap_or_link_effect (trap/effect application) and, when the lock record
// has bits set at +6 (0xffc0), also refreshes it via refresh_object_link_chain.
uint resolve_skill_gated_unlock_or_use(param_1,param_2,param_3,param_4)
ushort * param_1;
ushort * param_2;
ushort * param_3;
ushort param_4;

{
  ushort uVar1;
  short sVar2;
  char *iVar3;  /* was `int` -- truncated resolve_object_link's real `void *` return */
  uint uVar4;
  char *iVar5;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  byte bVar6;
  byte bVar7;
  
  bVar6 = (byte)*param_3;
  while( true ) {
    if ((bVar6 & 0x30) != 0x20) {
      return 2;
    }
    if ((short)param_4 < 0) break;
    if ((((param_2 == (ushort *)0x0) || ((*param_2 & 0x1f0) != 0x170)) || ((*param_2 & 0xf) < 8)) ||
       ((param_3[2] & 0xffc0) == 0)) {
      if ((byte)(&DAT_0024cfe0)[(short)(bVar6 & 0xf)] != param_4) {
        return 2;
      }
      if (param_1 != (ushort *)0x0) {
        if ((*param_1 & 0x1ff) == 0x7f) {
          if ((*param_3 & 0x800) == 0) {
            return 2;
          }
          if (((param_4 == 5) && (((byte)param_3[1] & 0x7f) != 0)) &&
             (sVar2 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x2c),(byte)param_3[1] & 0x7f),
             sVar2 < 1)) {
            return 2;
          }
        }
        else if ((*param_1 & 0x1c0) == 0x40) {
          if ((*param_3 & 0x1000) == 0) {
            return 2;
          }
          if ((*param_3 & 0x1c0) == 0x140) {
            return 2;
          }
        }
        else {
          uVar1 = *param_3;
          if ((((uVar1 & 0x1000) != 0) && ((uVar1 & 0x1c0) != 0x140)) && ((uVar1 & 0x800) == 0)) {
            return 2;
          }
        }
      }
      break;
    }
    param_3 = (ushort *)resolve_object_link(param_3 + 2);
    bVar6 = (byte)*param_3;
  }
  iVar3 = (char *)resolve_object_link(param_3 + 3);
  bVar6 = (byte)param_3[2] & 0x3f;
  bVar7 = (byte)param_3[3] & 0x3f;
  if (iVar3 == 0) {
    return 2;
  }
  uVar4 = apply_trap_or_link_effect(param_1,param_2,iVar3,bVar6,bVar7);
  if ((*param_3 & 0x400) == 0) {
    if ((param_3[3] & 0xffc0) != 0) {
      iVar5 = (char *)tilemap_lookup(bVar6,bVar7);
      refresh_object_link_chain(iVar5 + 2,iVar3);
      return uVar4 | 0x20;
    }
    return uVar4;
  }
  return uVar4;
}





/* HACK: param_2 and param_3 were both `undefined4` -- truncated real
   64-bit pointers (both are `ushort *` at every call site, e.g.
   resolve_skill_gated_unlock_or_use's own `param_2` and `iVar3`/
   resolve_object_link's result, in src/interact.c now), the same bug
   class as DAT_0024cff0's own identical fix just above. Confirmed live
   (bug-pull-chain-crash.txt): pulling a chain crashed with
   EXC_BAD_ACCESS on a wild, obviously-truncated address
   (0x4c029128) dereferenced one call further down, in dispatch_trap_type_effect --
   param_3 is passed straight through as that function's own real
   `ushort *param_1`. */
// was FUN_0007d074 -- thin re-entrancy-guarded wrapper around the
// trap/link-effect type dispatcher dispatch_trap_type_effect (not yet named, a
// large switch on the trap/link record's type code). Stashes param_1/
// param_2 (the acting object and a secondary context object) into
// DAT_0024cff4/DAT_0024cff0 only on the OUTERMOST call (DAT_0024cff4
// was 0), so a trap effect that itself triggers another trap keeps
// referring back to the original triggering context; resets
// DAT_0024cff4 to 0 unconditionally afterward. Confirmed by callers'
// own comments as the general "trap/effect application" step invoked
// alongside resolve_skill_gated_unlock_or_use.
undefined4 apply_trap_or_link_effect(param_1,param_2,param_3,param_4,param_5)
char *param_1;
ushort *param_2;
ushort *param_3;
undefined4 param_4;
short param_5;

{
  if (DAT_0024cff4 == 0) {
    DAT_0024cff0 = param_2;
    DAT_0024cff4 = param_1;
  }
  dispatch_trap_type_effect(param_3,param_4,(int)param_5);
  DAT_0024cff4 = 0;
  return 0;
}





// was FUN_0007deec -- recursive helper for refresh_object_link_chain:
// walks param_1's object link chain (resolve_object_link), and for
// each entry whose class matches 0x1a0 (bits 0x1f0) and whose quality/
// tag field (bits >>6) equals the shared "current tag" global
// (DAT_0024cfd0, set by refresh_object_link_chain before calling in),
// unlinks and frees it and decrements the shared remaining-count
// global (DAT_0024cfd8). Also recurses into any entry's own nested
// link chain (bits 0xffc0 at +6) when that entry isn't itself flagged
// 0x8000. Reads as "purge stale tagged marker objects from this
// chain", consistent with refresh_object_link_chain's own role
// refreshing a lock/link record's linked-object state.
void purge_tagged_objects_from_chain(param_1)
ushort *param_1;  /* was `undefined4` -- truncated the real object-record
                     pointer (passed to resolve_object_link and to itself
                     recursively as `puVar1+3`), latent until those calls
                     started actually using their arguments */

{
  ushort *puVar1;
  
  for (puVar1 = (ushort *)resolve_object_link(param_1); puVar1 != (ushort *)0x0; /* confirmed via ARM disassembly, 0x7deec */
      puVar1 = (ushort *)resolve_object_link(puVar1 + 2)) {
    if (((*puVar1 & 0x1f0) == 0x1a0) && ((int)DAT_0024cfd0 == (uint)(puVar1[3] >> 6))) {
      object_list_unlink(param_1,puVar1);
      free_object_slot(puVar1);
      *(byte *)(puVar1 + 3) = (byte)puVar1[3] & 0x3f;
      *(undefined1 *)((char *)puVar1 + 7) = 0;
      DAT_0024cfd8 = DAT_0024cfd8 + -1;
    }
    if (((*puVar1 & 0x8000) == 0) && ((puVar1[3] & 0xffc0) != 0)) {
      purge_tagged_objects_from_chain(puVar1 + 3); /* was called with no argument; confirmed via ARM disassembly, 0x7dfbc */
    }
  }
  return;
}



// was FUN_0007dfd8 -- confirmed by callers' own comments
// (resolve_skill_gated_unlock_or_use, trigger_object_trap_or_use_action)
// as the "refresh" step run after a lock/link record's own use/pull
// action. Reads param_2's own quality field (bits 0x1e at +1) as a
// "remaining tag count"; if nonzero, stashes param_2's own slot index
// as the shared "current tag" (DAT_0024cfd0) and scans every world
// object slot (DAT_002029cc, up to 0x1000 entries) with a link chain,
// calling purge_tagged_objects_from_chain on each to remove any
// stale 0x1a0-class markers tagged with this record. Afterward, looks
// up param_1 via find_object_by_encoded_slot_in_chain (not yet named) and, if found, unlinks
// and frees DAT_002046b4 (a global whose own role isn't pinned down
// here).
void refresh_object_link_chain(param_1,param_2)
undefined4 param_1;
int param_2;

{
  undefined4 uVar1;
  char *iVar2;
  short sVar3;
  ushort uVar4;
  
  DAT_0024cfd8 = (short)((*(byte *)(param_2 + 1) & 0x1e) >> 1);
  if (DAT_0024cfd8 != 0) {
    DAT_0024cfd0 = encode_object_slot_index(param_2);
    iVar2 = DAT_002029cc;
    sVar3 = DAT_0024cfd8;
    for (uVar4 = 0; (0 < sVar3 && (uVar4 < 0x1000)); uVar4 = uVar4 + 1) {
      if ((*(ushort *)(iVar2 + 2) & 0xffc0) != 0) {
        purge_tagged_objects_from_chain(iVar2 + 2); /* was called with no argument, same bug class as resolve_object_link's */
        sVar3 = DAT_0024cfd8;
      }
      iVar2 = iVar2 + 4;
    }
  }
  uVar1 = encode_object_slot_index(param_2);
  iVar2 = find_object_by_encoded_slot_in_chain(param_1,1,uVar1);
  if (iVar2 != 0) {
    unlink_and_free_object(DAT_002046b4);
  }
  return;
}





// was FUN_00028488 -- the actual talk-interaction worker: handles the
// mantra-chant and special-lever/statue item ids, then for creatures
// checks whether a real CNV.ARK conversation record exists
// (probe_archive_entry_exists) and switches to Talk game mode if so,
// else prints a "no conversation here"-style fallback scroll message.
// Own "[babl]" debug trace. NOT the same function as the
// zero-argument interact_talk_npc() just above (that's the
// interaction dispatch-table's own thin wrapper, itself calling this
// one with g_interact_target) -- named separately to avoid colliding
// with that already-established name.
void attempt_talk_interaction(param_1)
ushort * param_1;

{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  short sVar2;
  undefined4 uVar3;
  char *pcVar4;
  ushort uVar5;
  ushort uVar6;
  char acStack_114 [260];
  
  uVar6 = *param_1 & 0x1ff;
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] attempt_talk_interaction entry: param_1=%p uVar6(itemid)=0x%x raw=0x%x classcheck=0x%x\n", (void *)param_1, (unsigned)uVar6, (unsigned)*param_1, (unsigned)(*param_1 & 0x1c0));
  if (uVar6 == 0x157) {
    handle_mantra_chant(0);
    return;
  }
  if (uVar6 == 0x16e) {
    if (((&DAT_0023add0)[(byte)param_1[3] & 0x3f] & 0xff) != 8) {
      return;
    }
    print_scroll_message_by_id(0x110);
    return;
  }
  if ((*param_1 & 0x1c0) != 0x40) {
    if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] attempt_talk_interaction: not-a-creature branch (uVar3=0xe00)\n");
    uVar3 = 0xe00;
    goto LAB_0002865c;
  }
  uVar6 = (ushort)(byte)param_1[0xd];
  DAT_00100674 = param_1;
  if (getenv("UW_DEBUG_BABL")) fprintf(stderr, "[babl] attempt_talk_interaction: conv-id byte(uVar6)=0x%x uVar5=0x%x flagbits(param_1+7)=0x%x flagbyte(param_1+0x19)=0x%x\n", (unsigned)uVar6, (unsigned)(*(ushort *)((char *)param_1 + 0xb) & 0xf), (unsigned)(param_1[7] & 0xc0), (unsigned)(*(byte *)((char *)param_1 + 0x19) & 0x40));
  if (((uVar6 == 0x16) || (uVar6 == 0x8e)) || (uVar6 == 0xe7)) {
LAB_000285e4:
    if (uVar6 == 0) {
      uVar6 = ((byte)*param_1 & 0x3f) + 0x100;
    }
    DAT_001007c4 = uVar6;
    Ordinal_1047(acStack_114,0,0x104);
    pcVar4 = &DAT_0023cca8;
    stack0xffdc3244_ptr = acStack_114;
    do {
      cVar1 = *pcVar4;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    Ordinal_1063(acStack_114,s__DATA_cnv_ark_00084fc8);
    sVar2 = probe_archive_entry_exists(acStack_114,uVar6);
    if (0 < sVar2) {
      change_game_mode(4);
      return;
    }
  }
  else {
    uVar5 = *(ushort *)((char *)param_1 + 0xb) & 0xf;
    if ((((((((uVar5 != 5) && (uVar5 != 6)) && (uVar5 != 9)) ||
           ((*(ushort *)((char *)param_1 + 0xb) & 0xff0) != 0x10)) && ((param_1[7] & 0xc0) != 0)) ||
         ((*(byte *)((char *)param_1 + 0x19) & 0x40) != 0)) && (uVar6 != 0xff)) || (uVar5 == 10))
    goto LAB_000285e4;
  }
  uVar3 = 0xe01;
LAB_0002865c:
  /* Was two separate calls with message_scroll_print_wrapped()'s arg
     dropped -- same register-forwarding hazard already fixed at
     load_npc_conversation_record's own sVar1<0 branch (uw.c ~10987, see its comment)
     and, unfixed, exactly what crashed replaying bug-critter-talk.txt
     one step further than this file's other Talk-crash fixes: Bragit
     has no CNV.ARK conversation record, so start_npc_conversation hits this
     same pattern too (uw.c ~19211) printing "You get no response"
     before the crash. */
  message_scroll_print_wrapped(get_message_string(uVar3));
  return;
}


// was FUN_0003ee10 -- called from interact_default (src/interact.c:90)
// right before a grabbed object is attached to the cursor. Only acts
// while DAT_002020ec (the "grab mode" flag interact_default itself
// gates on) is still set: triggers the object's pickup trap/use action,
// unlinks it from its tile's object list (it's leaving the tile for the
// cursor/inventory), ticks the scheduler, and clears the grab-mode flag.
void finalize_object_pickup(param_1)
char *param_1;

{
  if (DAT_002020ec != 0) {
    trigger_object_trap_or_use_action(g_player_object,param_1,2,(int)DAT_002020a0,DAT_002020a4);
    object_list_unlink(DAT_002020a8,param_1);
    set_pending_update_flags(2);
    DAT_002020ec = 0;
  }
  return;
}
