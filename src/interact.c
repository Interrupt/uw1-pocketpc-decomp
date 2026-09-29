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
        FUN_00078c80(0x5f);
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
  FUN_00078c80(iVar1);
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
    sVar1 = FUN_00072598(g_interact_target,*(undefined1 *)(DAT_00086df8 + 0x2c));
    if (0 < sVar1) {
      local_18 = 1;
      sVar1 = FUN_00080828(0,0xf4,&local_18);
      if ((sVar1 != 0) && (sVar1 < 4)) {
        local_18 = (uint)(sVar1 == 2);
        FUN_0007fee8();
      }
      message_scroll_print_wrapped(&s_scroll_newline_0008522c);
      if (local_18 != 0) {
        FUN_0007266c(g_interact_target,*(undefined1 *)(DAT_00086df8 + 0x2b));
      }
    }
  }
  else {
    DAT_002020e0 = 1;
  }
  FUN_0007c2ec(g_player_object,g_interact_target,5,(int)DAT_002020a0,DAT_002020a4);
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

  wait_for_click_release(1);
  iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
  if ((iVar1 == 0) || (iVar1 = target_line_of_sight((int)DAT_000858c4,g_interact_target), iVar1 != 0)) {
    if ((*g_interact_target & 0x1fe) != 0x16e) {
      FUN_00078c80(0xb9);
    }
  }
  else {
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

