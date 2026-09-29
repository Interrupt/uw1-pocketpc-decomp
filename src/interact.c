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
      FUN_00035cb0(g_interact_target,0);
      FUN_0003ee10(g_interact_target);
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
  FUN_00028488(g_interact_target);
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
      sVar1 = FUN_00080828(0,0xf4,&local_18);
      if ((sVar1 != 0) && (sVar1 < 4)) {
        local_18 = (uint)(sVar1 == 2);
        FUN_0007fee8();
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
  FUN_00027708(iVar4 + 1);
  return;
}







// was FUN_0006fed4 -- triggers the "illustrated book/scroll" full-
// screen picture feature (via FUN_00037d6c -> FUN_00037c14, see the
// "SPECIAL ILLUSTRATED BOOK/SCROLL" comment elsewhere in this file for
// how FUN_00037c14's argument selects which picture) with illustration
// index 0x100 and the current level (DAT_00201b68) as payload. Its one
// caller fires this when reading a terrain description for a terrain
// type flagged 9 in DAT_0023add0 -- a special "you've found something"
// discovery moment, not an ordinary terrain read.
void trigger_terrain_discovery_illustration()

{
  FUN_00037d6c(0x100,(int)DAT_00201b68);
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
    FUN_00037d6c(0x101,param_1);
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
     (pbVar1 = (byte *)FUN_000537d0(&local_c,0,6,0xffffffff,0xffff), pbVar1 != (byte *)0x0)) {
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
// via apply_trap_or_link_effect/FUN_0007dfd8 or resolve_skill_gated_unlock_or_use depending on whether
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
    pbVar3 = (byte *)FUN_000537d0(local_34,0,6,0xffffffff,0xffff);
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
              FUN_0007dfd8(local_34[0],pbVar4);
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
// has bits set at +6 (0xffc0), also refreshes it via FUN_0007dfd8.
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
      FUN_0007dfd8(iVar5 + 2,iVar3);
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
   (0x4c029128) dereferenced one call further down, in FUN_0007d0b0 --
   param_3 is passed straight through as that function's own real
   `ushort *param_1`. */
// was FUN_0007d074 -- thin re-entrancy-guarded wrapper around the
// trap/link-effect type dispatcher FUN_0007d0b0 (not yet named, a
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
  FUN_0007d0b0(param_3,param_4,(int)param_5);
  DAT_0024cff4 = 0;
  return 0;
}



