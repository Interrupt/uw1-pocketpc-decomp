/* Input: key-binding registration/dispatch, movement command
 * handling (locomotion state, move vectors, directional step, analog
 * turn), mouse state, and click/event waiting. Split out of uw.c (the
 * original monolithic decompile) once these functions' real roles
 * were confirmed.
 */
#include "headers/input.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_0003c524 -- set the player's locomotion state from a collision-state
// mask (param_1): when it changes, pick the movement mode (walk / swim / fly /
// fall) via apply_movement_mode_profile. While the airborne bit (0x10) is set it also keeps the
// gravity fall armed each tick (g_fall_accel = -4) and clamps the fall velocity
// (g_vertical_velocity) to terminal when DAT_0020208c & 2. Called every tick from
// commit_player_move with the current state byte DAT_002048a8.
void set_locomotion_state(param_1,param_2)
ushort param_1;
int param_2;

{
  uint uVar1;
  undefined1 uVar2;
  int iVar3;
  
  uVar1 = (uint)(short)param_1;
  if (getenv("UW_DEBUG_LOCO"))
    fprintf(stderr, "[loco] param_1=0x%x param_2=%d DAT_00202084(old)=0x%x fallflag=%d vvel=%d\n",
            (unsigned)param_1, param_2, (unsigned)DAT_00202084,
            (int)g_fall_accel, (int)g_vertical_velocity);
  if ((DAT_00202084 != uVar1) || (param_2 != 0)) {
    iVar3 = 0;
    uVar2 = 0;
    DAT_00202084 = param_1;
    if ((uVar1 & 0x22) == 0) {
      if ((uVar1 & 4) == 0) {
        if ((uVar1 & 0x10) != 0) {
          if ((DAT_0020208c & 4) == 0) {
            if ((DAT_0020208c & 0x10) == 0) {
              if ((DAT_0020208c & 2) != 0) {
                uVar2 = 6;
              }
            }
            else {
              uVar2 = 5;
            }
          }
          else {
            uVar2 = 4;
          }
        }
      }
      else {
        uVar2 = 2;
      }
    }
    else if ((DAT_0020208c & 8) == 0) {
      /* Was `apply_swim_wade_pose()` with no argument -- apply_swim_wade_pose reads its
         `param_1 & 2` to decide between the two swim/wade sub-states
         (byte DAT_00086df8+0xb9 = 0x10 vs 0x60, the latter also firing
         unready_weapon -- almost certainly the wading/swim splash sound or
         pose). The dropped argument is the same collision-state mask
         `param_1` this whole function was just called with (the only
         value in scope that plausibly belongs here, matching the pattern
         of every other dropped-argument bug fixed this session), so
         "swim vs wade" was being decided from whatever garbage happened
         to be sitting in a register rather than the real mask -- likely
         why water/wading looked broken (undefined behavior, not
         necessarily changed by any particular commit). Pass it
         explicitly. */
      iVar3 = apply_swim_wade_pose(param_1);
      uVar2 = 1;
    }
    if (getenv("UW_DEBUG_LOCO"))
      fprintf(stderr, "[loco] -> uVar2(anim mode)=%d iVar3=%d DAT_0020208c=0x%x\n",
              (int)uVar2, iVar3, (unsigned)DAT_0020208c);
    apply_movement_mode_profile(uVar2);
    if (iVar3 == 0) {
      *(undefined1 *)(DAT_00086df8 + 0xb9) = 0;
    }
  }
  if ((uVar1 & 0x10) != 0) {
    if ((DAT_0020208c & 0x14) == 0) {
      if (g_fall_accel == 0) {
        g_fall_accel = -4;
      }
      if (((DAT_0020208c & 2) != 0) && (g_vertical_velocity < -0x5d)) {
        g_vertical_velocity = -0x5e;
        iVar3 = (int)g_jump_ascent_timer;
        if (iVar3 < 0x15) {
          g_jump_ascent_timer = 0;
        }
        else {
          if (iVar3 < 0) {
            iVar3 = iVar3 + 1;
          }
          g_jump_ascent_timer = (short)(iVar3 >> 1);
        }
      }
    }
    else {
      g_fall_accel = 0;
      uVar1 = (uint)g_vertical_velocity;
      if ((int)((uVar1 ^ (int)uVar1 >> 0x1f) - ((int)uVar1 >> 0x1f)) < 0xb) {
        g_vertical_velocity = 0;
      }
      else {
        g_vertical_velocity = Ordinal_2005(5,uVar1 << 2);
      }
    }
  }
  return;
}




// was FUN_0003d94c -- resolve a movement mode (param_1 = g_movement_mode) into
// a travel direction (DAT_00201c78) + step magnitude (*param_3):
//   0   stop            1     analog move/turn (DAT_0023bf48/4c rates)
//   6/7 jump            8     move + face 180
//   9   sidestep left   10    sidestep right  (heading -/+ 0x4000, face kept)
//   0xc/0xd  fly up / down (g_vertical_velocity vertical velocity)
void resolve_move_vector(param_1,param_2,param_3)
undefined2 param_1;
short param_2;
short * param_3;

{
  short sVar1;
  int iVar2;
  short sVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  sVar3 = DAT_00201c70;
  sVar1 = DAT_0020207a;
  switch(param_1) {
  case 0:
    *param_3 = 0;
    sVar3 = DAT_00201c78;
    break;
  case 1:
    iVar4 = (int)DAT_0023bf4c;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 3;
    }
    iVar4 = (iVar4 >> 2) * (int)DAT_00086e68 * (int)param_2;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 3;
    }
    sVar3 = DAT_00201c70 + (short)(iVar4 >> 2);
    iVar4 = ((int)DAT_0023bf48 >> 2) * (int)DAT_00202078;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 0x1f;
    }
    DAT_00201c70 = sVar3;
    *param_3 = (short)(iVar4 >> 5);
    DAT_00202088 = 0;
    break;
  case 2:
    sVar3 = DAT_00201c70;
    break;
  case 3:
    sVar3 = DAT_00201c70;
    break;
  case 4:
    sVar3 = DAT_00201c70;
    break;
  case 5:
    sVar3 = DAT_00201c70;
    break;
  case 6:
    if (g_vertical_velocity != 0) {
      DAT_00201c78 = DAT_00201c70;
      return;
    }
    if (g_fall_accel != 0) {
      DAT_00201c78 = DAT_00201c70;
      return;
    }
    if (g_jump_ascent_timer != 0) {
      DAT_00201c78 = DAT_00201c70;
      return;
    }
    DAT_00201c78 = DAT_00201c70;
    iVar4 = (int)DAT_00202078;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 1;
    }
    g_jump_ascent_timer = (short)(iVar4 >> 1);
    *param_3 = g_jump_ascent_timer;
    DAT_00202088 = 0;
    goto LAB_0003dafc;
  case 7:
LAB_0003dafc:
    g_vertical_velocity = 0x263;
    iVar2 = (int)DAT_00204884;
    bVar6 = SBORROW4(iVar2,0x280);
    iVar4 = iVar2 + -0x280;
    bVar5 = iVar2 == 0x280;
    if (0x280 < iVar2) {
      g_vertical_velocity = 0x1fd;
      bVar6 = SBORROW4(iVar2,0x2c0);
      iVar4 = iVar2 + -0x2c0;
      bVar5 = iVar2 == 0x2c0;
    }
    if (!bVar5 && iVar4 < 0 == bVar6) {
      g_vertical_velocity = 0x153;
    }
    sVar3 = DAT_00201c78;
    if ((DAT_0020208c & 1) == 0) {
      g_fall_accel = -4;
    }
    else {
      g_fall_accel = -2;
    }
    break;
  case 8:
    sVar3 = DAT_00201c70 + -0x8000;
    DAT_00202088 = 0xfffe;
    sVar1 = DAT_0020207c;
    goto LAB_0003da74;
  case 9:
    sVar3 = DAT_00201c70 + -0x4000;
    DAT_00202088 = 0xffff;
    goto LAB_0003da74;
  case 10:
    sVar3 = DAT_00201c70 + 0x4000;
    DAT_00202088 = 1;
LAB_0003da74:
    *param_3 = sVar1;
    break;
  case 0xb:
    sVar3 = DAT_00201c70;
    break;
  case 0xc:
    g_vertical_velocity = 0x8d;
    goto LAB_0003db80;
  case 0xd:
    g_vertical_velocity = -0x8d;
LAB_0003db80:
    DAT_00202088 = 0;
    g_fall_accel = 0;
    sVar3 = DAT_00201c70;
  }
  DAT_00201c78 = sVar3;
  return;
}




// was FUN_0004213c -- append a (keycode, arg, mode-mask, handler) record
// to the DAT_0020289c keybinding table.
int register_key_binding(param_1,param_2,param_3,param_4)
undefined4 param_1;
undefined4 param_2;
undefined4 param_3;
void *param_4;   /* was undefined4 -- the handler function pointer; 32-bit
                    truncated every real 64-bit callee address at the call
                    site (move_key_directional_step etc.), so the side-table entry was
                    an uncallable low-32-bits value. */

{
  short sVar1;
  int iVar2;
  char *iVar3;
  void *pvVar4;

  iVar2 = (int)DAT_0020288c;
  DAT_0020288c = (short)(iVar2 + 1);
  /* See register_click_region's identical fix -- Ordinal_1054 (realloc-shaped)
     returns a real pointer, iVar2 was truncating it. */
  pvVar4 = Ordinal_1054(DAT_0020289c,((iVar2 + 1) * 0x10000 >> 0x10) * 0xc);
  if (pvVar4 == 0) {
    report_fatal_error_and_exit(0x1006);
  }
  sVar1 = DAT_00085a70;
  iVar3 = (char *)((char *)pvVar4 + DAT_0020288c * 0xc);
  DAT_0020289c = pvVar4;
  /* real 64-bit handler, indexed by record position (iVar2 == old count) */
  if ((uint)iVar2 < 512) {
    g_keybind_handler[iVar2] = (void (*)(int))param_4;
    if (iVar2 + 1 > g_keybind_handler_n) g_keybind_handler_n = iVar2 + 1;
  }
  *(undefined1 *)(iVar3 + -0xc) = (char)DAT_00085a70;
  *(char *)(iVar3 + -0xb) = (char)((ushort)sVar1 >> 8);
  DAT_00085a70 = DAT_00085a70 + -1;
  *(char *)(iVar3 + -7) = (char)((uint)param_2 >> 8);
  *(char *)(iVar3 + -5) = (char)((uint)param_3 >> 8);
  *(char *)(iVar3 + -3) = (char)((uintptr_t)param_4 >> 8);
  *(char *)(iVar3 + -8) = (char)param_2;
  *(char *)(iVar3 + -2) = (char)((uintptr_t)param_4 >> 0x10);
  *(char *)(iVar3 + -6) = (char)param_3;
  *(char *)(iVar3 + -4) = (char)(uintptr_t)param_4;
  *(char *)(iVar3 + -1) = (char)((uintptr_t)param_4 >> 0x18);
  *(char *)(iVar3 + -9) = (char)((uint)param_1 >> 8);
  *(char *)(iVar3 + -10) = (char)param_1;
  return (int)CONCAT11(*(undefined1 *)(iVar3 + -0xb),*(undefined1 *)(iVar3 + -0xc));
}



// was FUN_0004221c -- remove a keybinding (and its mouse-region sibling)
// by record id, compacting the table.
void unregister_key_binding(param_1)
short param_1;

{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  short sVar6;
  short *psVar7;
  short *psVar8;
  short *psVar9;
  int iVar10;
  
  if (param_1 == 0) {
    return;
  }
  iVar10 = 1;
  sVar6 = 1;
  if (param_1 < 1) {
    psVar9 = &DAT_0020288c;
    iVar5 = (int)DAT_0020288c;
    psVar7 = DAT_0020289c;
    if (0 < iVar5) {
      do {
        sVar6 = (short)iVar10;
        if (*psVar7 == param_1) break;
        iVar3 = (int)sVar6;
        iVar2 = (iVar3 + 1) * 0x10000;
        psVar7 = psVar7 + 6;
        iVar10 = iVar2 >> 0x10;
        sVar6 = (short)((uint)iVar2 >> 0x10);
      } while (iVar3 < iVar5);
    }
    if ((int)sVar6 == iVar5 + 1) {
      return;
    }
    if (sVar6 < iVar5) {
      /* the byte copy below moves the LAST record over the removed one;
         mirror that move in the real-handler side table (found 0-based =
         sVar6-1, last 0-based = iVar5-1, before iVar5 is reused as the
         copy counter). */
      if ((uint)(sVar6 - 1) < 512 && (uint)(iVar5 - 1) < 512) {
        g_keybind_handler[sVar6 - 1] = g_keybind_handler[iVar5 - 1];
      }
      iVar10 = 0xc;
      psVar8 = DAT_0020289c + iVar5 * 6 + -6;
      do {
        iVar5 = iVar10 + -1;
        *(char *)psVar7 = (char)*psVar8;
        bVar1 = 0 < iVar10;
        iVar10 = iVar5;
        psVar8 = (short *)((char *)psVar8 + 1);
        psVar7 = (short *)((char *)psVar7 + 1);
      } while (iVar5 != 0 && bVar1);
    }
    if (g_keybind_handler_n > 0) g_keybind_handler_n--;
    sVar6 = DAT_0020288c;
    if (DAT_0020288c < 2) goto LAB_00042510;
    DAT_0020288c = (short)((uint)((DAT_0020288c + -1) * 0x10000) >> 0x10);
    DAT_0020289c = (short *)Ordinal_1054(DAT_0020289c,DAT_0020288c * 0xc);
    if (DAT_0020289c != (short *)0x0) {
      return;
    }
    uVar4 = 0x1006;
    DAT_0020289c = (short *)0x0;
  }
  else {
    psVar9 = &DAT_00202898;
    iVar5 = (int)DAT_00202898;
    psVar7 = DAT_00202890;
    if (0 < iVar5) {
      do {
        sVar6 = (short)iVar10;
        if (*psVar7 == param_1) break;
        iVar3 = (int)sVar6;
        iVar2 = (iVar3 + 1) * 0x10000;
        psVar7 = psVar7 + 9;
        iVar10 = iVar2 >> 0x10;
        sVar6 = (short)((uint)iVar2 >> 0x10);
      } while (iVar3 < iVar5);
    }
    if ((int)sVar6 == iVar5 + 1) {
      return;
    }
    if (sVar6 < iVar5) {
      /* record copy below moves the last click region over the removed
         one; mirror that in the real-handler side table (found 0-based =
         sVar6-1, last 0-based = iVar5-1). */
      if ((uint)(sVar6 - 1) < 128 && (uint)(iVar5 - 1) < 128) {
        g_click_region_handler[sVar6 - 1] = g_click_region_handler[iVar5 - 1];
      }
      sVar6 = DAT_00202890[iVar5 * 9 + -9];
      *(char *)psVar7 = (char)sVar6;
      *(char *)((char *)psVar7 + 1) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[3];
      *(char *)(psVar7 + 3) = (char)sVar6;
      *(char *)((char *)psVar7 + 7) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[4];
      *(char *)(psVar7 + 4) = (char)sVar6;
      *(char *)((char *)psVar7 + 9) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[1];
      *(char *)(psVar7 + 1) = (char)sVar6;
      *(char *)((char *)psVar7 + 3) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[2];
      *(char *)(psVar7 + 2) = (char)sVar6;
      *(char *)((char *)psVar7 + 5) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[5];
      *(char *)(psVar7 + 5) = (char)sVar6;
      *(char *)((char *)psVar7 + 0xb) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[6];
      *(char *)(psVar7 + 6) = (char)sVar6;
      *(char *)((char *)psVar7 + 0xd) = (char)((ushort)sVar6 >> 8);
      uVar4 = *(undefined4 *)(DAT_00202890 + 7);
      *(char *)(psVar7 + 7) = (char)uVar4;
      *(char *)((char *)psVar7 + 0xf) = (char)((uint)uVar4 >> 8);
      *(char *)(psVar7 + 8) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)psVar7 + 0x11) = (char)((uint)uVar4 >> 0x18);
    }
    if (g_click_region_handler_n > 0) g_click_region_handler_n--;
    sVar6 = DAT_00202898;
    if (DAT_00202898 < 2) {
LAB_00042510:
      *psVar9 = sVar6 + -1;
      return;
    }
    DAT_00202898 = (short)((uint)((DAT_00202898 + -1) * 0x10000) >> 0x10);
    DAT_00202890 = (short *)Ordinal_1054(DAT_00202890,DAT_00202898 * 0x12);
    if (DAT_00202890 != (short *)0x0) {
      return;
    }
    uVar4 = 0x1005;
    DAT_00202890 = (short *)0x0;
  }
  report_fatal_error_and_exit(uVar4);
  return;
}



// was FUN_0004251c -- per-frame input pump: read the pending input code,
// dispatch a mouse button to a click region or a key to a keybinding.
void poll_input_bindings(param_1)
undefined1 * param_1;

{
  undefined4 uVar1;
  /* Was `int`, truncating the real DAT_00202890 pointer arithmetic result
     below -- same pointer-truncation pattern already fixed in this
     function's own sibling dispatch_key_binding (see its comment): DAT_00202890
     is a genuine malloc'd 64-bit pointer (registered mouse-click-region
     records, register_click_region's array), and this variable held one record's
     address, not a plain offset. Confirmed crashing (EXC_BAD_ACCESS) the
     first time this function's match-loop ever actually ran on this
     recompile -- handle_game_view_click (the 3D-viewport's own click-and-hold-to-
     walk region, registered by register_game_view_interact_zones) is only reachable through
     here, and nothing in this whole project's testing had ever clicked
     inside the viewport before. */
  char *pcVar2;
  int iVar3;
  int iVar4;
  short local_28;
  short local_26;

  if (getenv("UW_DEBUG_AUTOMAP_CURSOR")) fprintf(stderr, "[automap-cursor] poll_input_bindings ENTRY DAT_00201b60=%d\n", (int)DAT_00201b60);
  uVar1 = peek_input_event();
  if (getenv("UW_DEBUG_AUTOMAP_CURSOR")) fprintf(stderr, "[automap-cursor] poll_input_bindings: peek_input_event=%d\n", (int)(short)uVar1);
  if (-1 < (short)uVar1) {
    if ((short)uVar1 < 4) {
      FUN_00057528(&local_28,&local_26);
      param_1[6] = (char)uVar1;
      param_1[7] = (char)((uint)uVar1 >> 8);
      /* The mouse-button-state field of the DAT_00085a6c struct is at
         BYTE offset 12: every reader (handle_game_view_click's click-and-hold walk,
         spawn_new_object, ...) does `*(ushort *)(DAT_00085a6c + 6)`, which is
         byte 12 because DAT_00085a6c is typed `short *`, and the reset
         (input_bindings_init) clears byte 12 too. param_1 here is a plain
         byte pointer, so param_1[6] above wrote byte 6 -- a dead field no
         one reads, which is why a click in the 3D viewport reached
         handle_game_view_click but never walked. Write byte 12 as well. */
      param_1[12] = (char)uVar1;
      param_1[13] = (char)((uint)uVar1 >> 8);
      FUN_00057528(&local_28,&local_26);
      param_1[4] = 1;
      param_1[5] = 0;
      iVar4 = DAT_00202898 + -1;
      iVar3 = iVar4 * 0x10000 >> 0x10;
      if (getenv("UW_DEBUG_CLICKREGION"))
        fprintf(stderr, "[clickregion] click at (%d,%d), scanning %d regions\n", (int)local_28, (int)local_26, (int)DAT_00202898);
      if (-1 < iVar3) {
        do {
          pcVar2 = DAT_00202890 + iVar3 * 0x12;
          if (getenv("UW_DEBUG_CLICKREGION"))
            fprintf(stderr, "[clickregion]   region %d: x1=%d y2=%d x2=%d y1=%d mask=0x%x active_mask=0x%x handler_flag=%d\n",
                    (int)iVar3, (int)*(short *)(pcVar2 + 6), (int)*(short *)(pcVar2 + 4),
                    (int)*(short *)(pcVar2 + 2), (int)*(short *)(pcVar2 + 8),
                    (unsigned)*(ushort *)(pcVar2 + 0xc), (unsigned)*(ushort *)(param_1 + 8),
                    (int)*(int *)(pcVar2 + 0xe));
          if ((((*(short *)(pcVar2 + 6) <= local_28) && (local_26 <= *(short *)(pcVar2 + 8))) &&
              (local_28 <= *(short *)(pcVar2 + 2))) &&
             (((*(short *)(pcVar2 + 4) <= local_26 &&
               ((*(ushort *)(pcVar2 + 0xc) & *(ushort *)(param_1 + 8)) != 0)) &&
              (*(int *)(pcVar2 + 0xe) != 0)))) {
            {
              int _cri = (int)(short)iVar4;   /* matched record index */
              iVar3 = (short)iVar4 * 0x12;
              iVar4 = (int)local_28 - (int)*(short *)(iVar3 + DAT_00202890 + 6);
              *param_1 = (char)iVar4;
              param_1[1] = (char)((uint)iVar4 >> 8);
              iVar4 = (int)*(short *)(iVar3 + DAT_00202890 + 8) - (int)local_26;
              param_1[2] = (char)iVar4;
              param_1[3] = (char)((uint)iVar4 >> 8);
              if (getenv("UW_DEBUG_CLICKREGION"))
                fprintf(stderr, "[clickregion]   MATCHED region %d -> handler=%p local_offset=(%d,%d)\n",
                        _cri, (void *)(_cri < 128 ? g_click_region_handler[_cri] : 0),
                        (int)(char)*param_1, (int)(char)param_1[2]);
              /* call the real 64-bit handler, not the truncated in-record
                 pointer (see g_click_region_handler). */
              if ((uint)_cri < 128 && g_click_region_handler[_cri] != 0) {
                g_click_region_handler[_cri]((int)*(short *)(iVar3 + DAT_00202890 + 10));
              }
            }
            return;
          }
          iVar4 = (iVar3 + -1) * 0x10000 >> 0x10;
          iVar3 = iVar4;
        } while (-1 < iVar4);
      }
    }
    else {
      param_1[4] = 0;
      param_1[5] = 0;
      dispatch_key_binding(param_1,uVar1);
    }
  }
  return;
}




void wait_for_click_release(param_1)
int param_1;

{
  short sVar1;
  short sVar2;
  
  sVar2 = 1;
  DAT_0008696e = -1;
  if (DAT_00204850 != 1) {
    sVar2 = 2;
  }
  while( true ) {
    sVar1 = peek_input_event();
    if (((((int)sVar2 | 0xfffcU) & (int)sVar1) != (int)sVar2) || (DAT_0008696e != -1)) break;
    if (param_1 != 0) {
      dispatch_sticky_mode_handlers();
    }
    FUN_00057904(1);
    FUN_00058734();
    update_mouse_state();
  }
  if ((DAT_0008696e == -1) && (sVar2 = FUN_00058738(), sVar2 != 0)) {
    DAT_0008696a = g_mouse_x;
    DAT_0008696c = g_mouse_y;
    DAT_00086968 = sVar2;
  }
  return;
}




// was FUN_00057a70 -- poll_input_event(0): consume and return the next
// input event code (used by the menu / prompt input-wait loops).
undefined4 next_input_event()

{
  /* Was `poll_input_event(0); return 0;` -- computing the real event code and
     then discarding it in favor of a hardcoded 0. Every caller treats this
     return value as a signed event/key code (`sVar2 < 0` == no event yet,
     specific positive values == button/key IDs), so always returning 0
     made every caller believe "event 0" arrived on the very first poll,
     short-circuiting input-wait loops instantly instead of actually
     waiting for input. */
  return poll_input_event(0);
}




void update_mouse_state()

{
  short sVar1;
  short sVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  int iVar8;
  int iVar9;
  ushort uVar10;
  bool bVar11;
  short local_2c;
  ushort local_2a;
  short local_28;
  short sVar2;
  short sVar3;
  
  local_2a = 0;
  local_2c = 0;
  if (DAT_000bbef8 == 0) {
    if (*DAT_000876c4 != 0) {
      local_2a = *DAT_000876bc;
      local_2c = *DAT_000876c0;
    }
    if ((local_2a == 0) && (local_2c == 0)) {
      if (DAT_00086974 < 0) {
        return;
      }
      if (DAT_00204708 == 0) {
        iVar8 = read_realtime_clock_units();
        if ((uint)(iVar8 - DAT_00204864) < 10) {
          return;
        }
        iVar8 = (int)DAT_00204700;
        DAT_00204700 = (short)(iVar8 + 8);
        if (0x28 < (iVar8 + 8) * 0x10000 >> 0x10) {
          DAT_00204700 = 0x28;
        }
      }
      else if ((&DAT_00250658)[DAT_00204708] == '\0') {
        DAT_00204700 = DAT_00204700 >> 1;
        if (DAT_00204700 == 0) {
          DAT_00086974 = 0xffff;
          DAT_00204708 = 0;
          return;
        }
      }
      else {
        iVar8 = read_realtime_clock_units();
        if ((uint)(iVar8 - DAT_00204864) < 10) {
          return;
        }
      }
      DAT_00204864 = read_realtime_clock_units();
      uVar10 = 3;
      iVar8 = (int)DAT_00204700;
      local_28 = (short)((uint)((iVar8 + -1) * 0x10000) >> 0x10);
      while ((iVar8 != 0 && (uVar10 != 0))) {
        if ((DAT_00086974 + -5 < (int)(short)g_mouse_x + (int)(short)local_2a) &&
           (((int)(short)g_mouse_x + (int)(short)local_2a < DAT_00086974 + 5 &&
            ((uVar10 & 1) != 0)))) {
          uVar10 = uVar10 ^ 1;
          local_2a = DAT_00086974 - g_mouse_x;
        }
        else if ((uVar10 & 1) != 0) {
          local_2a = DAT_0020477c + local_2a;
        }
        iVar8 = (int)DAT_00204778;
        iVar9 = (int)g_mouse_y + (int)local_2c;
        if (((iVar8 + -5 < iVar9) && (iVar9 < iVar8 + 5)) && ((uVar10 & 2) != 0)) {
          uVar10 = uVar10 ^ 2;
          local_2c = (short)((uint)((iVar8 + g_mouse_y) * 0x10000) >> 0x10);
        }
        else if ((uVar10 & 2) != 0) {
          local_2c = local_2c - DAT_00204780;
        }
        iVar8 = (int)local_28;
        local_28 = (short)((uint)((iVar8 + -1) * 0x10000) >> 0x10);
      }
    }
    else {
      DAT_00086974 = -1;
    }
    sVar7 = DAT_000a85c8;
    sVar6 = DAT_000a85c4;
    sVar5 = DAT_000842a8;
    sVar4 = DAT_000842a4;
    sVar1 = local_28;
    sVar2 = local_28;
    sVar3 = local_28;
    if (DAT_0020485c != 0) {
      set_viewport_clip_rect(0,0,0x13f,199);
      local_28 = sVar6;
      sVar1 = sVar7;
      sVar2 = sVar4;
      sVar3 = sVar5;
    }
    iVar8 = FUN_00056fe8();
    if (iVar8 != 0) {
      DAT_00204844 = 0;
    }
    uVar10 = DAT_0020470c;
    if (((short)local_2a < (short)DAT_0020470c) ||
       (uVar10 = DAT_00204830, g_mouse_x = local_2a, (short)DAT_00204830 < (short)local_2a)) {
      g_mouse_x = uVar10;
    }
    sVar4 = DAT_00204710;
    if ((local_2c < DAT_00204710) ||
       (sVar4 = DAT_00204834, g_mouse_y = local_2c, DAT_00204834 < local_2c)) {
      g_mouse_y = sVar4;
    }
    iVar9 = (int)g_mouse_y;
    iVar8 = (uint)g_mouse_x << 0x10;
    bVar11 = (int)DAT_00086974 == iVar8 >> 0x10;
    if (bVar11) {
      iVar8 = (int)DAT_00204778;
      iVar9 = iVar9 << 0x10;
    }
    if (bVar11 && iVar8 == iVar9 >> 0x10) {
      DAT_00204708 = 0;
      DAT_00086974 = -1;
    }
    FUN_00057e54();
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested) -- see
       cursor_show_idle_tick's own matching comment just above: skips the
       `DAT_00204788 != 0x106c` exclusion so the desktop cursor stays
       visible over the plain 3D viewport too, not just registered UI
       hotspots, only when UW_ALWAYS_SHOW_CURSOR=1. */
    if ((0 < DAT_00204840) && ((DAT_00204788 != 0x106c) || uw_always_show_cursor())) {
      draw_idle_mouse_cursor();
    }
    if (DAT_0020485c != 0) {
      set_viewport_clip_rect((int)local_28,(int)sVar1,(int)sVar2,(int)sVar3);
    }
  }
  return;
}




// was FUN_000682f0 -- discrete movement-command handler: keyboard Z/C
// (strafe left/right), the 4 GAPI hardware buttons (0x8d/0x8f/0x91/0x93),
// and the mouse click-and-hold walk (param_1 < 0). Routes via
// decode_movement_command.
void move_command_dispatch(param_1)
short param_1;

{
  short sVar1;
  short *psVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  ushort local_28 [2];
  
  if (param_1 < 0) {
    DAT_0023bf50 = 0;
    FUN_000575c4(local_28);
    psVar2 = DAT_00085a6c;
    if ((local_28[0] != 1) &&
       (((local_28[0] & 1) == 0 || ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0)))) {
      if (local_28[0] != 3) {
        return;
      }
      if ((DAT_002048a8 & 0x10) != 0) {
        g_movement_mode = 1;
        return;
      }
      if (*(char *)(DAT_00086df8 + 0xb8) == '\x01') {
        g_movement_mode = 1;
        return;
      }
      g_movement_mode = 7;
      return;
    }
    DAT_0023bf4c = 0;
    DAT_0023bf48 = 0;
    sVar1 = DAT_00085a6c[1];
    iVar5 = (int)DAT_0023be88;
    iVar3 = Ordinal_2005(5,iVar5);
    if (sVar1 < iVar3) {
      iVar3 = Ordinal_2005((int)DAT_0023bd80,*psVar2 * 3);
      g_movement_mode = (ushort)(byte)(&DAT_00086e70)[iVar3];
      return;
    }
    iVar4 = (int)DAT_0023bd80;
    iVar3 = Ordinal_2005(3,iVar4);
    if (*psVar2 < iVar3) {
      DAT_0023bf4c = Ordinal_2005(iVar4,(*psVar2 - iVar3) * 0x180);
    }
    iVar3 = Ordinal_2005(3,iVar4 << 1);
    if (iVar3 < *psVar2) {
      DAT_0023bf4c = Ordinal_2005(iVar4,(*psVar2 - iVar3) * 0x180);
    }
    iVar3 = Ordinal_2005(5,iVar5 << 1);
    if (iVar3 < psVar2[1]) {
      DAT_0023bf48 = Ordinal_2005(iVar5,(psVar2[1] - iVar3) * 0xc0);
    }
  }
  else {
    DAT_0023bf50 = 1;
    decode_movement_command();
    if (param_1 == 0) {
      g_movement_mode = param_1;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (param_1 < 6) {
      return;
    }
    if (7 < param_1) {
      return;
    }
    if (((DAT_002048a8 & 0x10) == 0) && (*(char *)(DAT_00086df8 + 0xb8) != '\x01')) {
      g_movement_mode = param_1;
      return;
    }
  }
  g_movement_mode = 1;
  return;
}




/* Sets DAT_0023bf48 (forward rate, same 0x500000 scale
   decode_movement_command's own forward code 0x8d uses) and DAT_0023bf4c
   (turn rate, via uw_turn_rate_accel()) together in one call, then
   g_movement_mode = 1 -- resolve_move_vector's mode-1 case already
   applies both every tick (it always has; decode_movement_command's own
   single DAT_0023c448 code just never let both be nonzero at once).
   Called from gx_stub.c's poll_dungeon_movement_keys when a forward key
   (W/S) and a turn key (A/D) are held simultaneously, so keyboard
   free-look can move and turn at the same time -- neither DOS UW1 nor
   this port's own DAT_0023c448 latch could ever represent that
   (confirmed via the real decompiled handle_keyboard_message: it's a
   single code too), so this is a deliberate enhancement over strict
   original-input-model parity, not a decompiled fix. turn_dir: -1 left,
   +1 right, 0 none. Backward (X) diagonal isn't included -- it's
   g_movement_mode 8 ("move + face 180"), a different system entirely,
   not mode 1's forward/turn blend. */
void uw_set_analog_move_turn(int fwd_held, int turn_dir) {
  DAT_0023bf48 = fwd_held ? Ordinal_2005(100,(int)((long long)DAT_0024af6c * 0x500000 >> 0x10)) : 0;
  if (turn_dir < 0) {
    DAT_0023bf4c = Ordinal_2005(100,(int)((long long)uw_turn_rate_accel() * -0x5a0000 >> 0x10));
  } else if (turn_dir > 0) {
    DAT_0023bf4c = Ordinal_2005(100,(int)((long long)uw_turn_rate_accel() * 0x5a0000 >> 0x10));
  } else {
    DAT_0023bf4c = 0;
  }
  g_movement_mode = 1;
}



// was FUN_00068884 -- keyboard directional-move handler bound to W/S/X/A/D
// (run-forward / walk-forward / walk-back / turn-left / turn-right); calls
// begin_directional_move then movement_tick, then paces one held-key frame.
void move_key_directional_step(param_1)
undefined4 param_1;

{
  int iVar1;
  int iVar2;
  ushort uVar3;
  
  iVar1 = read_realtime_clock_units();
  iVar2 = begin_directional_move(param_1);
  if (iVar2 != 0) {
    DAT_0023bf54 = read_realtime_clock_units();
    DAT_0023bf58 = DAT_0023bf58 + 4;
    g_jump_ascent_timer = 0;
    if (DAT_000879ac != 0) {
      scheduler_tick(1);
    }
    iVar2 = *(int *)(DAT_00086df8 + 0xce) + 0x40;
    *(char *)(DAT_00086df8 + 0xce) = (char)iVar2;
    *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar2 >> 8);
    *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar2 >> 0x10);
    *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar2 >> 0x18);
    DAT_0023bf54 = read_realtime_clock_units();
    uVar3 = (ushort)DAT_0023bf58;
    if (DAT_002020d4 == 0) {
      DAT_0023bf58 = 0;
    }
    else {
      uVar3 = (ushort)DAT_0023bf58;
      DAT_0023bf58 = DAT_0023bf58 & 1;
      uVar3 = (short)uVar3 >> 1;
    }
    movement_tick(0x40,uVar3,1);
    /* movement_tick can come out of that one call with DAT_0023bea8=1 (a
       "climbing a step" eye-height bob in progress -- see
       update_current_view_from_subject's own comment on
       DAT_0023bea8/be98) if g_movement_mode happened to read as one of the
       climb-triggering values on this tick. For continuous analog
       movement (holding a movement letter) that's fine: movement_tick
       runs again every subsequent tick and naturally settles it back to
       0 as the climb finishes. A discrete SHIFT+<dir> step calls
       movement_tick exactly this one time then stops -- nothing ever
       ticks the bob back down again, so the camera keeps rendering
       DAT_00204884 + 0xa4 + that stale delta forever after, even though
       DAT_00204884 (the real height) is already correct. Confirmed live
       and via a direct before/after screenshot comparison: standing
       still (bea8=0) shows a normal floor-level view; after a few
       SHIFT+W steps (bea8 stuck at 1) the exact same spot renders as if
       the camera were pressed up near the ceiling -- matching the
       reported "shift+w puts you at the ceiling a lot, plain w
       doesn't". Clear it here so a discrete step never leaves a stale
       bob applied once it's done. */
    DAT_0023bea8 = 0;
    DAT_0023be98 = 0;
    set_pending_update_flags(10);
  }
  do {
    iVar2 = read_realtime_clock_units();
  } while ((uint)(iVar2 - iVar1) < 0x18);
  FUN_00057570();
  return;
}




// was FUN_0006764c -- divides the game viewport rect (param_1=x,
// param_2=y, param_3=width, param_4=height) into 8 click regions, all
// sharing the same handler (handle_game_view_click, the "3D-viewport's own
// click-and-hold-to-walk region" per input.c's own comment), plus a
// single key binding covering the whole rect. Records the rect and
// each region's handle for unregister_game_view_interact_zones' own
// teardown.
void register_game_view_interact_zones(param_1,param_2,param_3,param_4)
int param_1;
int param_2;
int param_3;
int param_4;

{
  int iVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  
  unregister_key_binding((int)DAT_0023be8c);
  iVar9 = (param_2 - param_4) + 1;
  sVar2 = (short)param_1;
  iVar10 = param_1 + param_3 + -1;
  sVar3 = (short)param_2;
  sVar4 = (short)param_3;
  sVar5 = (short)param_4;
  DAT_0023bd80 = sVar4;
  DAT_0023be5c = sVar2;
  DAT_0023be80 = sVar3;
  DAT_0023be88 = sVar5;
  DAT_0023be8c = register_click_region(param_1,param_2,iVar10,iVar9,0,0x1b,handle_game_view_click);
  iVar6 = Ordinal_2005(0xf,sVar5 * 3);
  iVar6 = (sVar3 - iVar6) * 0x10000 >> 0x10;
  iVar7 = Ordinal_2005(0xf,sVar4 * 5);
  iVar1 = (iVar7 + sVar2) * 0x10000 >> 0x10;
  DAT_0023be6c = FUN_00057af0(param_1,param_2,iVar1,iVar6,0x106f);
  iVar7 = ((sVar2 - iVar7) + (int)sVar4) * 0x10000 >> 0x10;
  DAT_0023be68 = FUN_00057af0(iVar7,param_2,iVar10,iVar6,0x1070);
  DAT_0023be70 = FUN_00057af0(iVar1,param_2,iVar7,iVar6,0x106e);
  iVar8 = Ordinal_2005(0xf,sVar5 * 6);
  iVar8 = (sVar3 - iVar8) * 0x10000 >> 0x10;
  DAT_0023be7c = FUN_00057af0(param_1,iVar6,iVar1,iVar8,0x1071);
  DAT_0023be84 = FUN_00057af0(iVar7,iVar6,iVar10,iVar8,0x1072);
  DAT_0023be78 = FUN_00057af0(iVar1,iVar8,iVar7,iVar9,0x106d);
  DAT_0023be60 = FUN_00057af0(param_1,iVar8,iVar1,iVar9,0x1073);
  DAT_0023bd7c = FUN_00057af0(iVar7,iVar8,iVar10,iVar9,0x1074);
  return;
}



// was FUN_000678e0 -- teardown counterpart to
// register_game_view_interact_zones: unregisters the whole-rect key
// binding and all 8 click regions.
void unregister_game_view_interact_zones()

{
  unregister_key_binding((int)DAT_0023be8c);
  DAT_0023be8c = 0;
  FUN_00057bb0((int)DAT_0023be6c);
  FUN_00057bb0((int)DAT_0023be68);
  FUN_00057bb0((int)DAT_0023be7c);
  FUN_00057bb0((int)DAT_0023be84);
  FUN_00057bb0((int)DAT_0023be70);
  FUN_00057bb0((int)DAT_0023be78);
  FUN_00057bb0((int)DAT_0023be60);
  FUN_00057bb0((int)DAT_0023bd7c);
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00077b2c
undefined4 handle_keyboard_message(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
uint param_3;

{
  ushort uVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  
  if (param_2 == 7) {
    GXResume();
    return 0;
  }
  if (param_2 == 8) {
    GXSuspend();
    return 0;
  }
  uVar1 = (ushort)param_3;
  if (getenv("UW_DEBUG_INPUTEVENT"))
    fprintf(stderr, "[keymsg] msg=0x%x wparam=0x%x DAT_0023c448_before=0x%x\n", (unsigned int)param_2, (unsigned int)param_3, (unsigned int)DAT_0023c448);
  if (param_2 != 0x100) {
    if (param_2 == 0x101) {
      DAT_000876c8 = 1;
      DAT_0024af6c = 0;
      return 0;
    }
    if (param_2 != 0x102) {
      return 0;
    }
    if (((DAT_0024af60 != 0) && (0x60 < param_3)) && (param_3 < 0x7b)) {
      DAT_0023c448 = uVar1 - 0x20 | DAT_0023c448;
      return 0;
    }
    DAT_0023c448 = DAT_0023c448 | uVar1;
    return 0;
  }
  DAT_0023c648 = read_realtime_clock_units();
  if (uVar1 == _DAT_0023ce10) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x91;
    return 0;
  }
  if (uVar1 == DAT_0023ce1c) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x8f;
    return 0;
  }
  if (uVar1 == DAT_0023ce28) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x8d;
    return 0;
  }
  if (uVar1 == DAT_0023ce34) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x93;
    return 0;
  }
  if (uVar1 == DAT_0023ce40) {
    DAT_0023c448 = 0xd;
LAB_00077d08:
    puVar2 = &DAT_000876c8;
  }
  else {
    if (uVar1 == DAT_0023ce4c) {
      DAT_0023c448 = 0x1b;
      goto LAB_00077d08;
    }
    if (uVar1 == DAT_0023ce58) {
LAB_00077d4c:
      DAT_0023c448 = 0x4a;
      goto LAB_00077d08;
    }
    if (uVar1 == DAT_0023ce64) {
      return 0;
    }
    if (uVar1 == 0xc2) goto LAB_00077d4c;
    if (uVar1 != 0x14) {
      if (((uVar1 != 0x20) && (uVar1 != 8)) && (uVar1 != 0xd)) {
        return 0;
      }
      DAT_0023c448 = uVar1;
      return 0;
    }
    puVar2 = &DAT_0024af60;
    if (DAT_0024af60 == 0) {
      uVar3 = 1;
      goto LAB_00077d70;
    }
  }
  uVar3 = 0;
LAB_00077d70:
  *puVar2 = uVar3;
  return 0;
}








/* Recovered from a message-dispatch table baked into the original binary's
   .rdata (0x830e4-0x83144) that routes WM_MOUSEMOVE/WM_LBUTTONDOWN/
   WM_LBUTTONUP/WM_RBUTTONDOWN/WM_RBUTTONUP (msg 0x200/0x201/0x202/0x204/
   0x205) to this handler -- entirely separate from handle_keyboard_message's table
   entries (msg 0x100-0x107, keyboard only). Ghidra never resolved this
   address into a named function since it's only ever reached through that
   table, never a direct call -- same "orphaned callback" pattern as
   LAB_000255b4/d0 and LAB_00028688/a4 above. Recovered by hand from the
   real ARM disassembly of UU.exe (function body 0x77dd0-0x77f18).

   param_2 = message code; param_4 = lParam, the tap/cursor position packed
   as (y<<16)|x in the portrait "hardware" framebuffer's own 240x320
   coordinate space (see gx_stub.c's HW_W/HW_H comment) -- x is untouched,
   y is stored flipped (320-y) to match whatever coordinate origin the
   rest of the game's mouse-position consumers expect (already visible in
   the existing *DAT_000876bc/*DAT_000876c0 reset-to-0 pattern elsewhere
   in this file). Every message type updates the tracked cursor position;
   WM_LBUTTONDOWN additionally hit-tests taps landing in the x:200-240
   strip (the chargen name-entry on-screen keyboard, see DAT_00087650's
   comment) via FUN_00057a80 and re-dispatches the resulting button ID as
   a synthetic WM_CHAR (letters/digits) or WM_KEYDOWN (backspace/enter/
   space/0x14) through Ordinal_868 (PostMessage) -> handle_keyboard_message, the same
   path real keyboard input already uses. Taps outside that strip instead
   set DAT_00204844, a general click-pending flag consumed elsewhere
   (main game world / inventory click handling, not chargen). */
undefined4 handle_mouse_message(param_1,param_2,param_3,param_4)
undefined4 param_1;
uint param_2;
undefined4 param_3;
int param_4;

{
  short x;
  short y;
  int id;

  y = (short)(param_4 >> 16);
  *DAT_000876bc = (ushort)(0x140 - y);
  x = (short)param_4;
  *DAT_000876c0 = x;

  // HACK (extended): DAT_000876c4 has zero writers anywhere in the real
  // binary (confirmed via Ghidra xrefs), so update_mouse_state() would
  // never trust *DAT_000876bc/*DAT_000876c0 and g_mouse_x/g_mouse_y
  // would never update from real mouse input at all -- this whole
  // plumbing is genuinely dead in the shipped binary, which drove its
  // own cursor entirely via the D-pad/joystick spring-back emulation
  // (DAT_00086974) instead. Set only on WM_LBUTTONDOWN by default (a
  // deliberate per-click deviation from an earlier session, kept
  // below); per user request ("we should always display the cursor" on
  // desktop, tracking real mouse movement, not just clicks -- see
  // draw_idle_mouse_cursor's own matching deviation comment) extended to fire on
  // every message this handler sees (WM_MOUSEMOVE included) so plain
  // hover/movement -- not just a click -- makes the game trust and
  // track the real cursor position from the very first frame, but only
  // under UW_ALWAYS_SHOW_CURSOR=1: drawing the cursor every idle frame
  // forces a display flush every frame too, which measurably slowed
  // the game down when this was unconditional, so it's opt-in (see
  // uw_always_show_cursor's own comment).
  if (uw_always_show_cursor()) {
    *DAT_000876c4 = 1;
  }
  if (param_2 == 0x201) {
    if (!uw_always_show_cursor()) {
      *DAT_000876c4 = 1;
    }
    if ((200 < x) && (x < 0xf0)) {
      id = FUN_00057a80(*DAT_000876bc,x);
      fprintf(stderr, "[mousehit] on-screen-keyboard tap: x=%d storedY=%d -> id=%d ('%c')\n", x, *DAT_000876bc, id, (id >= 0x20 && id < 0x7f) ? id : '?');
      if ((id == 8) || (id == 0xd) || (id == 0x20) || (id == 0x14)) {
        Ordinal_868(DAT_0023c548,0x100,id,0);
      }
      else {
        Ordinal_868(DAT_0023c548,0x102,id,0);
      }
    }
    else {
      if (getenv("UW_DEBUG_CURSORCLICK")) {
        fprintf(stderr, "[cursorclick] WM_LBUTTONDOWN before DAT_00204844=%d selected=%p holdstate=%d\n",
                (int)DAT_00204844, (void *)g_selected_object, (int)g_cursor_holding_state);
      }
      DAT_00204844 = 1;
      if ((g_cursor_mode != 0) || (g_cursor_holding_state != 0)) {
        DAT_00204844 = 2;
      }
      // HACK: same dead-plumbing story as DAT_000876c4 above -- FUN_00058738
      // (the source of chargen's touch-select event codes 1-3) only ever
      // returns nonzero via DAT_0023c63c or DAT_002506aa/ab, and all three
      // are confirmed via Ghidra xrefs to have zero writers anywhere in the
      // real binary, so character_generator_touch_select is unreachable
      // there regardless of cursor tracking. Setting it here (outside the
      // on-screen-keyboard strip, so it doesn't interfere with WM_CHAR
      // dispatch during name entry) is what actually lets a click on a
      // chargen list button register; not original behavior.
      DAT_0023c63c = 1;
    }
  }
  if (param_2 == 0x202) {
    /* An EARLIER attempt at this exact fix (erase before clearing
       DAT_00204844) was reverted as "no measurable effect" -- that test
       apparently didn't hit the actual failure window. Confirmed live via
       UW_DEBUG_CURSORCLICK + UW_DEBUG_CURSORERASE on a real right-drag
       pickup followed by a LEFT click while still holding (this
       project's drag convention is normally right-button, but nothing
       stops a real player from also left-clicking mid-hold, and
       bug-inventory-stamp-demo.txt is a recorded repro of exactly that):
       DAT_00204844 was 1 (an icon genuinely shown, not yet erased) at
       the moment WM_LBUTTONUP fired; the unconditional `DAT_00204844 = 0`
       below then made the NEXT erase attempt see DAT_00204844 == 0 and
       skip entirely (`will_erase=0`) -- so the icon painted at that
       position is never restored, a permanent stamp. update_mouse_state's
       own protocol is always erase-THEN-clear; this handler cleared
       without erasing. Calling the real erase function first (a no-op
       if there was nothing to erase) matches that protocol and fixes the
       stamp without touching the continuous per-frame hide/show path
       that the earlier g_force_flush attempt regressed (see
       FUN_00056fe8's own comment) -- this only runs once per actual
       left-button release, not every frame. */
    FUN_00056fe8();
    if (getenv("UW_DEBUG_CURSORCLICK")) {
      fprintf(stderr, "[cursorclick] WM_LBUTTONUP before DAT_00204844=%d selected=%p mouse=(%d,%d)\n",
              (int)DAT_00204844, (void *)g_selected_object, (int)g_mouse_x, (int)g_mouse_y);
    }
    DAT_00204844 = 0;
    if ((g_selected_object == 0) && ((DAT_00201b60 & 2) == 0)) {
      DAT_00204844 = 0;
    }
    *DAT_000876bc = 0;
    *DAT_000876c0 = 0;
    DAT_0023c63c = 0;
  }
  /* Right button (WM_RBUTTONDOWN/UP). The real binary's dispatch table
     routes these here too, but the hand-recovered body only did the left
     button. FUN_00058738 reports the right button as bit 1 (value 2) of
     the mouse state via DAT_002506ab -- which nothing else ever writes --
     and poll_input_bindings then feeds code 2 to the viewport click
     region, whose handler handle_game_view_click runs its interact branch on
     `state & 2`. Cursor position was already stored at the top. */
  if (param_2 == 0x204) {
    *DAT_000876c4 = 1;
    DAT_002506ab = 1;
  }
  if (param_2 == 0x205) {
    DAT_002506ab = 0;
    *DAT_000876bc = 0;
    *DAT_000876c0 = 0;
  }
  return 0;
}


// was FUN_0003dca4 -- called from set_locomotion_state (src/input.c:83)
// with an "anim mode" code (0=walk,1=swim,2=fly-ish,4/5/6=fall variants;
// see that function's own comment) whenever the locomotion state
// changes, and with the -1 sentinel (re-derive the current mode from
// the player record) from force_locomotion_state_refresh and on
// save-load. For a real mode code: writes the new mode into the
// player record's anim-mode/facing fields (+0xb6..+0xb8) via the
// local_24 per-mode bit table, then uses the local_1c per-mode
// magnitude table (indexed by mode) to scale the per-facing-direction
// speed constants DAT_0008589c/85898/85894/86e68 into
// DAT_00202078/7a/7c/74 -- the forward/turn/strafe speed and jump
// duration-ish constants resolve_move_vector and the jump-arc code in
// src/movement.c and src/player.c read back. Reads as "apply the
// current locomotion mode's movement-speed profile".
void apply_movement_mode_profile(param_1)
byte param_1;

{
  int iVar1;
  byte *pbVar2;
  undefined2 uVar3;
  short sVar4;
  uint uVar5;
  int *piVar6;
  char local_24 [8];
  byte local_1c [8];
  
  local_1c[1] = 3;
  local_1c[2] = 5;
  local_1c[0] = 10;
  local_1c[3] = 10;
  local_1c[4] = 1;
  builtin_strncpy(local_24 + 1,"\x01\x02\x04\b\b",5);
  local_1c[6] = 2;
  iVar1 = (int)(char)param_1;
  local_1c[5] = 7;
  /* Was `piVar6 = (int *)&DAT_00086df8;` (address of the global itself)
     with every subsequent `*piVar6` in this branch meant to read
     DAT_00086df8's real value back out -- but piVar6 was typed `int *`,
     so each of those dereferences only read the first 4 of
     DAT_00086df8's 8 bytes, truncating it (this is what fed a garbage
     record pointer into the rest of the function, further down, and
     eventually segfaulted). Both branches want the same thing (the
     record pointer's real value); use DAT_00086df8 directly instead of
     this indirection, which sidesteps the truncation instead of trying
     to preserve the double-indirect shape with a wider type. */
  piVar6 = (int *)DAT_00086df8;
  local_24[0] = '\0';
  local_24[6] = 0;
  if (iVar1 == -1) {
    param_1 = *(byte *)((char *)piVar6 + 0xb6) & 7;
  }
  else {
    *(byte *)((char *)DAT_00086df8 + 0xb8) = local_24[iVar1] + (*(byte *)((char *)DAT_00086df8 + 0xb8) & 0xe0);
    pbVar2 = (byte *)((char *)DAT_00086df8 + 0xb6);
    uVar3 = *(undefined2 *)pbVar2;
    *(byte *)((char *)DAT_00086df8 + 0xb6) = (*pbVar2 ^ param_1) & 7 ^ (byte)uVar3;
    *(char *)((char *)DAT_00086df8 + 0xb7) = (char)((ushort)uVar3 >> 8);
  }
  uVar5 = (uint)local_1c[(char)param_1];
  DAT_00202078 = Ordinal_2005(10,(int)DAT_0008589c * uVar5);
  DAT_0020207a = Ordinal_2005(10,(int)DAT_00085898 * uVar5);
  DAT_0020207c = Ordinal_2005(10,(int)DAT_00085894 * uVar5);
  if ((char)param_1 < 4) {
    DAT_00202074 = Ordinal_2005(10,(int)DAT_00086e68 * uVar5);
  }
  else {
    DAT_00202074 = DAT_00086e68;
  }
  uVar5 = (uint)*(ushort *)(piVar6 + 0x13);
  if ((uVar5 == 0) || ((uint)*(ushort *)((char *)piVar6 + 0x4a) * 2 <= uVar5)) {
    DAT_00085890 = 0x60;
  }
  else {
    sVar4 = Ordinal_2005(uVar5 << 1,(uint)*(ushort *)((char *)piVar6 + 0x4a) * 0x60);
    DAT_00085890 = 0x60 - sVar4;
  }
  return;
}
