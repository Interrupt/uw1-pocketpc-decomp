/* Save/load: the slot-list menu (draw, "journey onward" selection),
 * slot probing, the actual game save/load, and the low-level .ark
 * archive I/O primitives (open/close/read-entry/write-entry) those
 * and the level loader build on. Split out of uw.c (the original
 * monolithic decompile) once these functions' real roles were
 * confirmed.
 */
#include "headers/saveload.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>






// was FUN_000567ec
void draw_save_load_slot_list()

{
  int iVar1;
  undefined1 auStack_c4 [8];
  char *local_bc [4];
  undefined1 auStack_ac [160];
  
  FUN_00056640(2);
  DAT_002046f0 = 0xffff;
  FUN_000566dc(5,0x1e);
  if (DAT_000868dc == 1) {
    FUN_00056688(6,0x2e);
  }
  local_bc[0] = &s_I__00087074;
  local_bc[1] = &s_II__0008706c;
  local_bc[2] = s_III__00087064;
  local_bc[3] = &s_IV__0008705c;
  msg_scroll_panel_reset(1);
  probe_save_slots(auStack_ac,auStack_c4);
  /* g_text_use_palette_color gates whether draw_text_string honours
     *g_draw_color_index at all (see that global's own comment) --
     confirmed via disassembly that neither message_scroll_print_wrapped
     nor msg_scroll_draw_wrapped_span (the real functions behind this
     whole print) ever touch it, so message-scroll text always takes the
     flat g_text_flat_color path in the pristine binary. The "\6" control
     code this header uses (real palette index 0xd4 -- confirmed RGB
     (88,184,64), a real green, against PALS.DAT bank 0) needs this flag
     on to have any visible effect at all, matching a QA report that the
     original game rendered this list in green. Bracket it narrowly
     around just this function's own prints (mirrors draw_menu_item_list
     and FUN_0006a3d8/FUN_00037c14's own established "caller forces it
     for the scope of its own draw, then restores" pattern) rather than
     forcing it on inside message_scroll_print_wrapped itself -- an
     earlier attempt did that and leaked this panel's now-colored
     DAT_00250704+0x16 persistent-color field into every *unrelated*
     scroll message printed afterward for the rest of the session
     (reported: ordinary messages rendering white, since this list's own
     trailing "\0" sets that field to palette index 0x60 before this
     function returns). Scoping the flag to just this call can't leak
     that way, since it's always restored the moment this function
     returns, regardless of what the persistent color field is left at. */
  int _saved_text_palette_color = g_text_use_palette_color;
  g_text_use_palette_color = 1;
  message_scroll_print_wrapped(s__6_Save_Game_Descriptions_0008703c);
  iVar1 = 0;
  g_scroll_control_codes_enabled = 0;
  do {
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    message_scroll_print_wrapped(local_bc[iVar1]);
    message_scroll_print_wrapped(auStack_ac + iVar1 * 0x28);
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 4);
  g_scroll_control_codes_enabled = 1;
  message_scroll_print_wrapped(&s_scroll_color_reset_00087038);
  g_text_use_palette_color = _saved_text_palette_color;
  return;
}




// was FUN_0006b178. Title screen's "Journey Onward" entry point: shows
// the save-slot picker (via probe_save_slots + menu_button_list_navigate)
// and, on a real selection, copies that slot into \SAVE0 and enters
// gameplay -- see the tail's own comment for why it does a direct file
// copy rather than reusing the in-game Save/Load paths.
undefined4 journey_onward_load_slot_menu()

{
  char stack0xffdc3198_buf [256];
  char *stack0xffdc3198_ptr;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  char *pcVar_str;  /* was folded into uVar5 (`undefined4`, this
                        function's own 0/1/-1 return-code variable),
                        truncating the real FUN_0007863c() string
                        pointer it also briefly held -- same "reused
                        scalar" bug already fixed elsewhere this session
                        (see dispatch_object_action's uVar11 comment) */
  short sVar6;
  uint uVar7;
  int iVar8;
  char *pcVar9;
  uint uVar10;
  undefined4 auStack_201d0 [32766];
  short local_1d8 [4];
  /* Was `undefined4 local_1d0 [4]`, storing real char* pointers into
     4-byte slots (see draw_menu_item_list's param_3!=0 branch, which reads this
     array as an 8-byte-stride char** table). Widened to match. */
  char *local_1d0 [4];
  char acStack_1c0 [264];
  /* Was `char acStack_b8 [38]` -- another Ghidra stack-frame-size
     miscalculation (same bug class fixed elsewhere this session).
     probe_save_slots unconditionally writes 4 fixed-width 0x28(40)-byte
     records into whatever buffer its param_1 points at (uVar5*0x28 +
     charindex, for uVar5 = 0..3), i.e. it needs 0xA0 (160) bytes -- and
     both its other call sites (draw_save_load_slot_list's auStack_ac, FUN_0006a1c4's
     auStack_a4) already correctly declare exactly that. Only this one
     was wrong, at less than a quarter the required size. Confirmed via
     AddressSanitizer: a real stack-buffer-overflow, reproducibly
     crashing (SIGABRT, corrupted heap free-list, surfacing later and
     unpredictably depending on stack layout) as soon as the in-game
     options/pause menu opens, since that's this function's own caller. */
  char acStack_b8 [160];
  char local_92 [122];
  
  FUN_00057118();
  Ordinal_1047(acStack_1c0,0,0x104);
  pcVar9 = &DAT_0023cca8;
    stack0xffdc3198_ptr = stack0xffdc3198_buf;
  pcVar3 = pcVar9;
    stack0xffdc3198_ptr = acStack_1c0;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc3198_ptr = cVar1; stack0xffdc3198_ptr = stack0xffdc3198_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_1c0,s__DATA_OPSCR_BYT_00086efc);
  FUN_0006c98c(0xffffffff,acStack_1c0,1);
  cursor_show_idle_tick();
  probe_save_slots(acStack_b8,local_1d8);
  iVar4 = 0;
  uVar10 = (uint)local_1d8[0];
  uVar7 = 0;
  do {
    if ((uVar10 & 1 << (uVar7 & 0xff)) != 0) {
      /* Was `local_92 + uVar7 * 0x28` -- local_92 is a separate,
         never-written 122-byte stack local (too small for this indexing
         past uVar7==2 anyway), while probe_save_slots actually wrote the 4
         real 0x28-byte slot-description records into acStack_b8 (see its
         own declaration comment). Also, this loop is meant to walk
         BACKWARD from the END of the 40-byte record over trailing
         padding spaces to find where the real text ends -- but Ghidra
         dropped the "+0x27" (last-byte) offset from the starting point,
         so `pcVar3` started at the record's FIRST byte instead. Since
         the loop condition requires strictly greater-than the record
         start to keep scanning backward, that made it a zero-iteration
         loop every time, and `pcVar3[1] = '\0'` right below always
         chopped the label down to its first character regardless of
         content (confirmed via UW_DEBUG_TITLEMENU: "Level 1" -> "L").
         Start from the record's real last byte instead. */
      for (pcVar3 = acStack_b8 + uVar7 * 0x28 + 0x27;
          (*pcVar3 == ' ' && (acStack_b8 + uVar7 * 0x28 < pcVar3)); pcVar3 = pcVar3 + -1) {
      }
      pcVar3[1] = '\0';
      local_1d0[(short)iVar4] = acStack_b8 + uVar7 * 0x28;
      iVar4 = ((short)iVar4 + 1) * 0x10000 >> 0x10;
    }
    uVar7 = (int)((uVar7 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar7 < 4);
  sVar2 = menu_button_list_navigate(iVar4,local_1d0,1,0);
  if (sVar2 < 0) {
    uVar5 = 0;
  }
  else {
    sVar6 = -1;
    iVar4 = -1;
    if (sVar2 != -1) {
      do {
        uVar7 = (int)(short)iVar4 + 1;
        if (((int)local_1d8[0] & 1 << (uVar7 & 0xff)) != 0) {
          sVar6 = sVar6 + 1;
        }
        iVar4 = (int)(uVar7 * 0x10000) >> 0x10;
      } while (sVar6 != sVar2);
    }
    FUN_00057118();
    Ordinal_1047(acStack_1c0,0,0x104);
    do {
      cVar1 = *pcVar9;
      *stack0xffdc3198_ptr = cVar1; stack0xffdc3198_ptr = stack0xffdc3198_ptr + 1;
      pcVar9 = pcVar9 + 1;
    } while (cVar1 != '\0');
    Ordinal_1063(acStack_1c0,s__DATA_OPSCR_BYT_00086efc);
    FUN_0006c98c(0xffffffff,acStack_1c0,1);
    /* Was `uVar5 = FUN_0007863c(0x301);` -- FUN_0007863c returns a real
       char*, but uVar5 is this function's own `undefined4` 0/1/-1
       return-code variable, so storing the string pointer into it
       truncated it on this 64-bit build (same "reused scalar" bug
       already fixed elsewhere this session -- see dispatch_object_action's
       uVar11 comment). Use a real pointer local instead. */
    pcVar_str = (char *)FUN_0007863c(0x301);
    select_active_font(s_fontbig_sys_0008432c);
    *g_draw_color_index = 0xa2;
    *DAT_00084298 = 0xa2;
    sVar2 = measure_text_width(pcVar_str);
    iVar8 = -(int)sVar2 + 0x140;
    if (iVar8 < 0) {
      iVar8 = -(int)sVar2 + 0x141;
    }
    draw_text_string(pcVar_str,(short)(iVar8 >> 1) + 10,0x5a);
    select_active_font(s_font5x6p_sys_0008430c);
    /* Was `load_game_from_slot(iVar4 + 1)` -- load_game_from_slot is "Save Game"
       (copies the live \SAVE0 session INTO the chosen slot), which makes
       no sense from the title screen where no game is running yet: this
       whole screen only ever appears when main_menu_loop found an
       existing save (see its uVar8=4 gate) and, on success, unconditionally
       enters gameplay (`bVar11 = sVar3==1;` breaks main_menu_loop's own
       loop straight into set_game_mode(1)) -- pure Save-Game semantics
       for a title screen with no active session, but exactly what
       "Continue/Load Game" should do. Reusing the real save_game_to_slot
       Load path here would also pull in its own text-entry prompt
       (scroll_text_entry_prompt), which is designed for the in-game pause-menu Load
       flow, not a fresh process with no dungeon loaded yet -- so do the
       same slot<->SAVE0 file copy save_game_to_slot does (just in the load
       direction, \SAVEn -> \SAVE0) directly, then the same post-copy
       refresh sequence load_game_from_slot already does on its own success. */
    {
      char loadsrc[300];
      snprintf(loadsrc, sizeof(loadsrc), "\\SAVE%d", iVar4 + 1);
      iVar4 = FUN_0006c670(&DAT_000857a0, loadsrc);
    }
    if (iVar4 == 0) {
      uVar5 = 0xffffffff;
    }
    else {
      FUN_00044624(&DAT_000857a0);
      /* DAT_00201b68 (current level) isn't meaningfully set yet at a
         fresh title screen with no dungeon loaded -- unlike
         load_game_from_slot's own use of it, which only ever runs mid-game.
         Every save this decompile can produce is level 1 (no UI to
         change levels exists yet), so load that directly rather than a
         possibly-stale/zero level number. */
      sVar2 = load_level(1);
      if (sVar2 != 0) {
        FUN_0006c834(1,3);
        /* Was a hardcoded set_player_tile_position(0x20,2,1) here --
           worked around load_level leaving the player at tile (0,0)
           (unplaced, black 3D view) because the save/load path never
           actually wrote the live player position into \SAVE0\lev.ark
           to begin with (see [[save-load-position-not-persisted]]: 6
           bugs in the archive-write chain plus save_game_to_slot/
           load_game_from_slot's own FUN_0006c670 calls having src/dest
           backwards, all fixed). The player's tile position is just
           another field of its own object record, at a fixed offset
           inside the same arena load_level's object-table read
           populates -- with a real save now actually persisting it,
           this hardcoded override would clobber the correct restored
           position with the fixed chargen spawn point instead. Removed;
           load_level's own read is what places the player now. */
      }
      FUN_0006e89c();
      uVar5 = 1;
    }
  }
  return uVar5;
}




// was FUN_0006bde0. Fills param_1 with 4 fixed-width 0x28-byte records
// (each slot's "desc" file text, space-padded, or a "not used yet"
// placeholder) and *param_2 with a bitmask of which slots are real.
void probe_save_slots(param_1,param_2)
char *param_1;
ushort * param_2;

{
  char stack0xffdc3230_buf [256];
  char *stack0xffdc3230_ptr;
  char cVar1;
  char *pcVar2;
  undefined1 *puVar3;
  int iVar4;
  uint uVar5;
  char acStack_128 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3230_ptr = acStack_128;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_128,&DAT_000857a0);
  puVar3 = (undefined1 *)Ordinal_1064(acStack_128,0x30);
  Ordinal_1063(acStack_128,&DAT_00087030);
  *param_2 = 0;
  uVar5 = 0;
  do {
    /* DAT_000857a0/DAT_00087030 are both unrecoverable string constants
       (no content Ghidra could recover) -- puVar3 (a '0' placeholder
       digit position within the built path, meant to be replaced with
       '1','2','3'... to probe a numbered series of optional resource
       files) is genuinely NULL here as a result, since strchr can't find
       a '0' that was never in the string to begin with. This whole loop
       already treats a not-found probe file as a normal, expected case
       (falls back to "not used yet" -- see s__not_used_yet__00087020
       below), so skip the digit substitution defensively rather than
       crash; every slot in this probe will just come up "not used yet"
       until the real DAT_00087030 template is recovered. */
    if (puVar3 != (undefined1 *)0x0) {
    *puVar3 = (char)((uVar5 + 0x31) * 0x1000000 >> 0x18);
    }
    iVar4 = win_file_exists(acStack_128,0);
    if ((iVar4 != -1) && (iVar4 = open_file_for_read(acStack_128), iVar4 != -1)) {
      /* Pad the record with spaces before reading the real "desc" file
         text over the front of it -- journey_onward_load_slot_menu's caller trims
         trailing spaces off this record to find where the real text
         ends, which only works if anything past the file's own (short)
         content is a space rather than whatever stack garbage happened
         to be here. Dropped from this decompile; without it a save
         slot's button label ran into garbage bytes following its real
         description. */
      Ordinal_1047(uVar5 * 0x28 + param_1,0x20,0x28);
      read_file_handle(iVar4,uVar5 * 0x28 + param_1,0x27);
      *param_2 = *param_2 | (ushort)(1 << (uVar5 & 0xff));
      Ordinal_553(iVar4);
    }
    if (((int)(short)*param_2 & 1 << (uVar5 & 0xff)) == 0) {
      pcVar2 = s__not_used_yet__00087020;
      do {
        cVar1 = *pcVar2;
        /* Was `pcVar2[uVar5*0x28 + -0x87020 + param_1]` -- `-0x87020`
           hardcoded s__not_used_yet__00087020's address in the ORIGINAL
           32-bit binary's fixed layout, used to turn pcVar2 back into a
           zero-based character index (pcVar2 - stringBase) before
           re-adding param_1. On this recompile the string lives at
           whatever address the linker picked, not 0x87020, so this
           always computed a wild pointer -- same bug class as the
           (int)&DAT_x truncation fixes elsewhere, just via a literal
           address constant instead of a cast. Fixed to compute the
           character index properly via real pointer subtraction. */
        param_1[uVar5 * 0x28 + (pcVar2 - s__not_used_yet__00087020)] = cVar1;
        pcVar2 = pcVar2 + 1;
      } while (cVar1 != '\0');
    }
    uVar5 = (int)((uVar5 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar5 < 4);
  return;
}




// was FUN_0006c0c0
undefined4 load_game_from_slot(param_1)
char param_1;

{
  char *wptr_50330;
  char stack0xffdc2d28_buf [256];
  char *stack0xffdc2d28_ptr;
  char stack0xffdc2e30_buf [256];
  char *stack0xffdc2e30_ptr;
  char cVar1;
  short sVar2;
  undefined4 uVar3;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  char acStack_85df0 [546720];
  char acStack_650 [32];
  char acStack_630 [264];
  char acStack_528 [264];
  undefined1 auStack_420 [520];
  undefined1 auStack_218 [520];
  
  pcVar6 = &DAT_000857a0;
    wptr_50330 = acStack_85df0;
  do {
    cVar1 = *pcVar6;
    *wptr_50330 = cVar1; wptr_50330 = wptr_50330 + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  /* Ghidra never emitted the copy of DAT_000857a0 into acStack_650 before
     searching it below -- acStack_650 was read while still uninitialized
     stack garbage, so the '0' substitution below found a random byte (or
     nothing) instead of the real "SAVE0" digit. Same idea as the copy
     just above into acStack_85df0 (which this function doesn't otherwise
     use for the digit search), mirrored here to match probe_save_slots's
     working copy-then-strchr pattern. */
  pcVar6 = &DAT_000857a0;
  wptr_50330 = acStack_650;
  do {
    cVar1 = *pcVar6;
    *wptr_50330 = cVar1; wptr_50330 = wptr_50330 + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  pcVar6 = (char *)Ordinal_1064(acStack_650,0x30);
  pcVar5 = &DAT_0023cca8;
    stack0xffdc2e30_ptr = stack0xffdc2e30_buf;
  /* Same DAT_000857a0-is-unrecoverable NULL risk as probe_save_slots above
     -- see its comment. Here the digit is a save-slot number (SAVE0,
     SAVE1, ...), so a NULL means this path build silently keeps
     whatever acStack_650 already had instead of crashing. */
  if (pcVar6 != (char *)0x0) {
  *pcVar6 = param_1 + '0';
  }
  pcVar6 = pcVar5;
    stack0xffdc2d28_ptr = acStack_630;
  do {
    cVar1 = *pcVar6;
    *stack0xffdc2d28_ptr = cVar1; stack0xffdc2d28_ptr = stack0xffdc2d28_ptr + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_630,&DAT_000857a0);
  uVar3 = FUN_0002295c(acStack_630);
  Ordinal_61(auStack_420,uVar3);
  /* Was `stack0xffdc2e30_ptr = stack0xffdc2e30_buf;` above -- a stack
     slot Ghidra split into two names (same bug class as the acStack_650
     fix above), so this copy of DAT_0023cca8 landed in a buffer
     (stack0xffdc2e30_buf) that acStack_528 below never reads, leaving
     acStack_528 uninitialized when the strcat below appended to it.
     Point the copy at acStack_528 directly, matching how the sibling
     acStack_630 copy a few lines up already does this correctly. That
     makes acStack_630/auStack_420 (unsubstituted "\SAVE0") the copy
     SOURCE and acStack_528/auStack_218 (digit-substituted "\SAVE<n>")
     the copy DESTINATION for FUN_0006c670 below -- i.e. "Save Game"
     snapshot-copies the live SAVE0 session into the chosen numbered
     slot. */
  stack0xffdc2e30_ptr = acStack_528;
  do {
    cVar1 = *pcVar5;
    *stack0xffdc2e30_ptr = cVar1; stack0xffdc2e30_ptr = stack0xffdc2e30_ptr + 1;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_528,acStack_650);
  uVar3 = FUN_0002295c(acStack_528);
  Ordinal_61(auStack_218,uVar3);
  FUN_00078c80(0xa6);
  iVar4 = FUN_0006c560(acStack_630);
  if (iVar4 != 0) {
    FUN_00078c80(0xaa);
    /* Was FUN_0006c670(acStack_528,acStack_630) -- i.e. (dest="\SAVEn",
       src="\SAVE0"), copying the ACTIVE SESSION onto the chosen slot --
       a save-direction copy. That's backwards for this function: live
       testing confirms load_game_from_slot's own status text is "Restoring
       Game " (this is the Load path, gated by FUN_00040130's
       unconditional-allow "can load" semantics; save_game_to_slot -- own
       status text "Saving Game " -- is the Save path, see its matching
       fix). An earlier session's comment here ("chosen slot,
       destination... live session, source... i.e. 'Save Game'
       snapshot-copies the live SAVE0 session into the chosen numbered
       slot") was the same directional mistake as save_game_to_slot's
       original call, just never caught because this Load path was never
       actually exercised end-to-end with a real position check.
       acStack_630 ("\SAVE0", the active session) is the destination;
       acStack_528 ("\SAVEn", the chosen slot) is the source -- loading
       the slot's saved state into the live session, matching what
       save_game_to_slot now does in the opposite direction. */
    iVar4 = FUN_0006c670(acStack_630,acStack_528);
    if (getenv("UW_DEBUG_SAVEDESC"))
      fprintf(stderr, "[savedesc] FUN_0006c670 returned %d, acStack_528=%s\n", iVar4, acStack_528);
    if (iVar4 != 0) {
      FUN_00078c80(0xaa);
      /* An earlier session added a snprintf("Level %d", ...) write-back
         to this slot's desc file here, reasoning the decompile never
         reconstructed a "type a save description" prompt for Save, so
         Load should at least leave something non-blank behind. That
         reasoning no longer applies -- save_game_to_slot (the Save path) now
         has a fully working name-entry flow and writes the player's
         actual chosen name into the desc file at save time (see its own
         FUN_0007edf4 call). This block ran on every LOAD too, though,
         unconditionally overwriting the first strlen("Level N") bytes of
         the slot's real desc file with "Level N" and leaving whatever
         longer content used to be there past that point untouched --
         confirmed as the cause of a QA report where loading a save named
         "HELLO WORLD" corrupted its own stored name to "LEVEL 1ORLD" (7
         bytes of "Level 1" overwriting the first 7 bytes of "HELLO
         WORLD", "ORLD" being the un-overwritten remainder). Load has no
         business rewriting the slot's description at all -- removed. */
      FUN_0003bee4();
      iVar4 = FUN_00044624(&DAT_000857a0);
      if (iVar4 != 0) {
        FUN_00078c80(0xaa);
        sVar2 = load_level((int)DAT_00201b68);
        if (sVar2 != 0) {
          FUN_0006c834((int)DAT_00201b68,3);
          FUN_00078c80(0xaa);
          FUN_000358e8();
          return 1;
        }
      }
    }
  }
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  return 0;
}



// was FUN_0006c264
undefined4 save_game_to_slot(param_1,param_2)
char param_1;
/* Was `undefined4` -- truncates the real 64-bit buffer pointer
   FUN_0006bfec passes in (a pointer into its own auStack_ac local,
   see that function's comment). On the original 32-bit ARM binary this
   was harmless, but on this 64-bit recompile the parameter-spill in
   this function's own prologue drops the pointer's upper 32 bits the
   moment it's read out of the argument register, leaving every later
   dereference (message_scroll_print_wrapped, the scroll_text_entry_prompt name-entry
   call, the strlen/Ordinal_1063 calls near the end) a wild pointer --
   confirmed crash: "Enter a save/load name" renders fine (that prompt
   is a static string, not this buffer), but touching the corrupted
   buffer once you start typing segfaults. Same bug class as
   FUN_00077f30's uVar3 fix earlier this session. */
char *param_2;

{
  char stack0xffdc2d20_buf [256];
  char *stack0xffdc2d20_ptr;
  char stack0xffdc2e28_buf [256];
  char *stack0xffdc2e28_ptr;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  char *pcVar6;
  uint uVar7;
  char *pcVar8;
  char local_638 [264];
  char local_530 [264];
  undefined1 auStack_428 [520];
  undefined1 auStack_220 [520];
  
  FUN_00035960();
  pcVar8 = &DAT_0023cca8;
    stack0xffdc2d20_ptr = stack0xffdc2d20_buf;
  pcVar3 = pcVar8;
    stack0xffdc2e28_ptr = local_530;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc2e28_ptr = cVar1; stack0xffdc2e28_ptr = stack0xffdc2e28_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(local_530,&DAT_000857a0);
  pcVar3 = (char *)Ordinal_1064(local_530,0x30);
  /* Same DAT_000857a0-is-unrecoverable NULL risk as probe_save_slots above. */
  if (pcVar3 != (char *)0x0) {
  *pcVar3 = param_1 + '0';
  pcVar3[1] = '\0';
  }
  msg_scroll_panel_reset(1);
  message_scroll_print_wrapped(s_Please_enter_a_Save_Game_file_an_00087094);
  /* Dropped 5th argument (max name length) -- confirmed via real ARM
     disassembly (0x6c2f8-0x6c30c: `mov r3,#0x1e; strh r3,[sp,#0]` pushes
     0x1e as the 5th/stack arg immediately before the call). Same
     dropped-argument idiom fixed elsewhere this session -- without it
     param_5 is whatever garbage was left on the stack, which
     scroll_text_entry_prompt clamps to at most 0x32 but never validates as sane
     otherwise. */
  sVar2 = scroll_text_entry_prompt(0,param_2,param_2,1,0x1e);
  if (((sVar2 != 0x1b) && (sVar2 != 1)) && (sVar2 != 2)) {
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    FUN_00078c80(0xa7);
    iVar4 = 0;
    do {
      pcVar6 = local_530 + iVar4;
      local_638[iVar4] = *pcVar6;
      iVar4 = iVar4 + 1;
    } while (*pcVar6 != '\0');
    uVar5 = Ordinal_1063(local_638,s__PLAYER_DAT_00087088);
    iVar4 = win_file_exists(uVar5,0);
    if (iVar4 == -1) {
      FUN_0002295c(local_530);
      Ordinal_161();
      uVar5 = FUN_0002295c(local_530);
      iVar4 = Ordinal_160(uVar5,0);
      if (iVar4 < 0) goto LAB_0006c540;
    }
    Ordinal_1063(local_530,&DAT_00087084);
    iVar4 = FUN_0006c560(local_530);
    if (iVar4 != 0) {
      Ordinal_1047(local_638,0,0x104);
      pcVar6 = pcVar8;
    stack0xffdc2d20_ptr = local_638;
      do {
        cVar1 = *pcVar6;
        *stack0xffdc2d20_ptr = cVar1; stack0xffdc2d20_ptr = stack0xffdc2d20_ptr + 1;
        pcVar6 = pcVar6 + 1;
      } while (cVar1 != '\0');
      Ordinal_1063(local_638,s__SAVE0_desc_00087078);
      uVar7 = Ordinal_1068(param_2);
      iVar4 = FUN_0007edf4(param_2,local_638,(uVar7 & 0xffff) + 1);
      if (iVar4 != 0) {
        pcVar3[2] = '\0';
        FUN_00078c80(0xaa);
        Ordinal_1047(local_638,0,0x104);
        do {
          cVar1 = *pcVar8;
          *stack0xffdc2d20_ptr = cVar1; stack0xffdc2d20_ptr = stack0xffdc2d20_ptr + 1;
          pcVar8 = pcVar8 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(local_638,&DAT_000857a0);
        iVar4 = write_player_save_record(local_638);
        if (iVar4 != 0) {
          FUN_00078c80(0xaa);
          iVar4 = commit_level_to_save_slot((int)DAT_00201b68);
          if (iVar4 != 0) {
            FUN_00078c80(0xaa);
            uVar5 = FUN_0002295c(local_530);
            Ordinal_61(auStack_428,uVar5);
            uVar5 = FUN_0002295c(local_638);
            Ordinal_61(auStack_220,uVar5);
            /* Was FUN_0006c670(local_638,local_530) -- i.e.
               (dest="\SAVE0", src="\SAVEn"), copying the CHOSEN SLOT
               back onto the active session. That's backwards for this
               function: save_game_to_slot is the SAVE path (confirmed live --
               its own status text is "Saving Game ", gated by
               FUN_000400dc's real save preconditions, and it just
               finished writing the current name/player.dat/lev.ark
               state into local_638="\SAVE0" a few lines up) -- copying
               SAVEn back onto SAVE0 immediately discards all of that
               and leaves the actual save slot (local_530) untouched.
               Confirmed via a live save/move/reload test: SAVE0 and the
               target slot stayed byte-identical to each other (and to
               their pre-save content) no matter what the player did,
               until swapping this call's argument order so the
               freshly-updated local_638 ("\SAVE0") is the SOURCE and
               local_530 ("\SAVEn") the DESTINATION -- i.e. actually
               writing the live session out to the chosen slot, matching
               what load_game_from_slot (the sibling Load path, own status text
               "Restoring Game ") does in the opposite direction. */
            iVar4 = FUN_0006c670(local_530,local_638);
            if (iVar4 != 0) {
              message_scroll_print_wrapped(&s_scroll_color_reset_00087038);
              uVar5 = 1;
              goto LAB_0006c544;
            }
          }
        }
      }
    }
  }
LAB_0006c540:
  uVar5 = 0;
LAB_0006c544:
  msg_scroll_panel_reset(1);
  return uVar5;
}



// was FUN_00015870
/* param_2 was dropped entirely -- declared with only 1 parameter but
   every caller passes 2 (the filename to open, e.g.
   s__SAVE0_lev_ark_000842fc). `Ordinal_1063(local_120);` (a strcat-
   shaped Ordinal used with an explicit 2-arg form everywhere else in
   this file) was being called with just 1 visible argument, relying on
   whatever the compiler happened to leave in the dropped argument's
   register -- and `local_120` itself was never initialized first
   either, so the "destination" that register leftover got appended
   onto was uninitialized stack garbage, not an empty string. Confirmed
   via lldb (this exact call site): this "worked" for the level-load
   caller purely because the stack garbage there happened to already
   read as an empty string, and broke for the automap-entry caller
   (FUN_00016434, exercised for the first time by the new OPENMAP
   demomode command) once different preceding activity left a stray
   0x01 byte on the stack instead, producing a corrupt filename
   ("\x01\SAVE0\lev.ark") and a failed file open. Fixed by copying
   param_2 into local_120 directly instead of relying on either the
   DAT_0023cca8 scratch-buffer copy or the dropped-argument concat --
   neither was ever the real filename source. */
bool open_level_archive(param_1,param_2)
undefined1 * param_1;
char * param_2;

{
  char cVar1;
  char *pcVar2;
  char *pcVar9;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  bool bVar8;
  /* Was reusing `iVar3` (an int, otherwise a loop counter / file handle
     elsewhere in this function) to also hold Ordinal_1407's (strrchr)
     return -- harmless while that ordinal was a dead `return 0;` stub
     (see its own comment: fixed for real this session), but now that it
     returns a genuine 64-bit pointer into local_228, storing it in an
     `int` truncates it, and `*(undefined1*)(iVar3+1)=0` writes through
     the truncated wild pointer. Confirmed via lldb crash in this exact
     line reached from the "Journey Onward" title-screen load, the first
     real exercise of this path since the stub got fixed. Dedicated
     pointer local instead of reusing iVar3. */
  char *pLastSlash;
  ushort local_230 [4];
  char local_228 [264];
  char local_120 [260];

  pcVar2 = param_2;
  pcVar9 = local_120;
  do {
    cVar1 = *pcVar2;
    *pcVar9 = cVar1; pcVar9 = pcVar9 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  iVar3 = 0;
  do {
    pcVar2 = local_120 + iVar3;
    local_228[iVar3] = *pcVar2;
    iVar3 = iVar3 + 1;
  } while (*pcVar2 != '\0');
  pLastSlash = (char *)Ordinal_1407(local_228,0x5c);
  if (pLastSlash == 0) {
    local_228[0] = '\0';
  }
  else {
    pLastSlash[1] = 0;
  }
  Ordinal_1063(local_228,s__arc_tmp_000842b4);
  /* Was `open_existing_file_rw_alt(local_120)` -- opens read-only (uw_file_open_read).
     This handle (*param_1 in every downstream caller) is later WRITTEN
     to directly by write_archive_entry (the archive-entry byte-write a level
     save/transition uses to flush the live in-memory object arena --
     including the player's own position, since the player is just a
     fixed-offset object inside that same arena -- back into this file)
     -- a write through a read-only handle silently writes 0 bytes,
     write_archive_entry returns false, and the whole save chain unwinds
     through its failure path ("Save Game Failed"), never actually
     persisting anything. Confirmed via tracing: SAVE0/lev.ark stayed
     byte-identical across saves no matter what the player did.
     open_existing_file_rw (uw_file_open_write with create_always=0) opens "rb+"
     on an existing file -- read AND write, no truncation -- exactly
     what every other caller of this handle already assumed. Falls back
     to "wb+" (create) only if the file doesn't already exist, which
     every real caller here doesn't hit (\SAVE0\lev.ark is always
     seeded before this runs). */
  iVar3 = open_existing_file_rw(local_120);
  if (iVar3 == -1) {
    bVar8 = false;
  }
  else {
    iVar4 = read_file_handle(iVar3,local_230,2);
    iVar5 = read_file_handle(iVar3,&DAT_000b78b8,(uint)local_230[0] << 2);
    uVar7 = (uint)local_230[0];
    iVar6 = open_existing_file_rw(local_228);
    *param_1 = (char)iVar3;
    param_1[1] = (char)((uint)iVar3 >> 8);
    param_1[4] = (char)iVar6;
    param_1[10] = 0xb8;
    param_1[2] = (char)((uint)iVar3 >> 0x10);
    param_1[0xe] = 0;
    bVar8 = (iVar4 == 2 && iVar5 == uVar7 * 4) && iVar6 != -1;
    if (getenv("UW_DEBUG_INPUTEVENT"))
      fprintf(stderr, "[archive] iVar4=%d iVar5=%d uVar7=%u iVar6=%d bVar8=%d\n", iVar4, iVar5, uVar7, iVar6, (int)bVar8);
    param_1[3] = (char)((uint)iVar3 >> 0x18);
    param_1[5] = (char)((uint)iVar6 >> 8);
    iVar3 = 0;
    param_1[6] = (char)((uint)iVar6 >> 0x10);
    param_1[7] = (char)((uint)iVar6 >> 0x18);
    param_1[8] = (char)local_230[0];
    param_1[9] = (char)(local_230[0] >> 8);
    param_1[0xb] = 0x78;
    param_1[0xc] = 0xb;
    param_1[0xd] = 0;
    do {
      cVar1 = local_120[iVar3];
      (&DAT_000b98b8)[iVar3] = cVar1;
      iVar3 = iVar3 + 1;
    } while (cVar1 != '\0');
    iVar3 = Ordinal_1068(local_120);
    pcVar2 = local_228;
    do {
      cVar1 = *pcVar2;
      pcVar2[(int)(&DAT_000b98b9 + (iVar3 - (int)local_228))] = cVar1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
  }
  return bVar8;
}



// was FUN_00015a58 -- finalizes and closes an open_level_archive handle:
// rewrites the entry-offset table header if the dirty flag (param_1+0xe)
// is set, closes both file handles, and commits the tmp-file rename back
// over the real archive name.
byte close_level_archive(param_1)
undefined4 * param_1;

{
  char cVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  bool bVar6;
  char acStack_118 [260];
  
  bVar6 = true;
  uVar2 = *(ushort *)(param_1 + 2);
  if (*(char *)((char *)param_1 + 0xe) != '\0') {
    iVar3 = seek_file_handle(*param_1,2,0);
    iVar4 = write_file_handle(*param_1,&DAT_000b78b8,(uVar2 & 0x3fff) << 2);
    bVar6 = iVar3 == 2 && iVar4 == (uVar2 & 0x3fff) * 4;
  }
  iVar4 = Ordinal_553(*param_1);
  Ordinal_553(CONCAT13(*(undefined1 *)((char *)param_1 + 7),*(undefined3 *)(param_1 + 1)));
  iVar3 = Ordinal_1068(&DAT_000b98b8);
  pcVar5 = &DAT_000b98b9 + iVar3;
  iVar3 = -(int)pcVar5;
  do {
    cVar1 = *pcVar5;
    pcVar5[(int)(acStack_118 + iVar3)] = cVar1;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  close_file_handle(acStack_118);
  return bVar6 & iVar4 != 0;
}



// was FUN_00015b94 -- write_archive_entry(handle, entry_index, src_buf,
// len): the write-side counterpart to read_archive_entry, resizing the
// archive's entry table when the new length doesn't fit the existing
// slot.
bool write_archive_entry(param_1,param_2,param_3,param_4)
undefined4 * param_1;
uint param_2;
/* Was `undefined4` -- truncated the real 64-bit `DAT_002029cc` (the live
   object arena) pointer FUN_00049b04 passes in as the source buffer for
   the archive-entry write. Harmless while every actual write attempt
   through it failed anyway for other reasons (Ordinal_1407 stub,
   read-only archive handle -- both fixed, see open_level_archive's and
   Ordinal_1407's own comments); with those fixed this is the last thing
   standing between a save and actually writing anything: fwrite() on
   the truncated (now only-32-bit, so on a 64-bit host a wild/unmapped)
   pointer fails with EFAULT, confirmed via a UW_DEBUG_INPUTEVENT trace
   in uw_file_write (errno 14, "Bad address"). */
void *param_3;
uint param_4;

{
  char *wptr_4897;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint *puVar7;
  int iVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  uint uVar12;
  uint uVar13;
  char *pcVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  char acStack_b9ae8 [759728];
  char local_338 [264];
  char acStack_230 [263];
  char acStack_129 [261];
  
  iVar8 = (param_2 & 0xffff) * 4;
  uVar16 = 0;
  /* param_1+0xa..0xd held the literal 0x000b78b8 (&DAT_000b78b8's address
     in the original 32-bit binary) as the .ark entry-offset table
     pointer -- see read_archive_entry's matching comment. The table is a fixed
     global; use its real address. */
  uVar15 = *(uint *)((char *)&DAT_000b78b8 + iVar8);
  if (getenv("UW_DEBUG_INPUTEVENT"))
    fprintf(stderr, "[15b94] param_2=%u entrycount=%u uVar15=%u param_4=%u handle1=%d handle2=%d\n",
            param_2, (uint)*(ushort *)(param_1 + 2), uVar15, param_4, (int)*param_1, (int)param_1[1]);
  if ((param_2 & 0xffff) <= (uint)*(ushort *)(param_1 + 2)) {
    if (uVar15 == 0) {
      uVar4 = seek_file_handle(*param_1,0,2);
      uVar15 = write_file_handle(*param_1,param_3,param_4 & 0xffff);
      if (getenv("UW_DEBUG_INPUTEVENT"))
        fprintf(stderr, "[15b94] fast-path seek=%d write_wrote=%u want=%u\n", (int)uVar4, uVar15, param_4 & 0xffff);
      *(undefined1 *)((char *)param_1 + 0xe) = 1;
      *(undefined4 *)((char *)&DAT_000b78b8 + iVar8) = uVar4;
      return uVar15 == (param_4 & 0xffff);
    }
    iVar5 = seek_file_handle(*param_1,0,2);
    uVar17 = iVar5 - *(int *)((char *)&DAT_000b78b8 + iVar8);
    if (*(ushort *)(param_1 + 2) != 0) {
      uVar12 = 0;
      do {
        uVar6 = *(uint *)((char *)&DAT_000b78b8 + uVar12 * 4);
        uVar13 = uVar6 - uVar15;
        if ((uVar15 < uVar6) && (uVar13 < uVar17)) {
          uVar17 = uVar13;
        }
        uVar12 = uVar12 + 1 & 0xffff;
      } while (uVar12 < *(ushort *)(param_1 + 2));
    }
    param_4 = param_4 & 0xffff;
    if (uVar17 != param_4) {
      *(undefined1 *)((char *)param_1 + 0xe) = 1;
      seek_file_handle(CONCAT13(*(undefined1 *)((char *)param_1 + 3),
                            CONCAT12(*(undefined1 *)((char *)param_1 + 2),
                                     CONCAT11(*(undefined1 *)((char *)param_1 + 1),
                                              *(undefined1 *)param_1))),0,0);
      seek_file_handle(param_1[1],0,0);
      if (uVar15 != 0) {
        do {
          uVar12 = uVar15 - uVar16;
          if (0x2000 < uVar12) {
            uVar12 = 0x2000;
          }
          uVar2 = read_file_handle(*param_1,&DAT_000b58b8,uVar12 & 0xffff);
          iVar5 = write_file_handle(param_1[1],&DAT_000b58b8,uVar2);
          uVar16 = uVar16 + iVar5;
        } while (uVar16 < uVar15);
      }
      seek_file_handle(*param_1,uVar17,1);
      while( true ) {
        sVar3 = read_file_handle(*param_1,&DAT_000b58b8,0x2000);
        if (sVar3 == 0) break;
        iVar5 = write_file_handle(param_1[1],&DAT_000b58b8);
        uVar16 = uVar16 + iVar5;
      }
      write_file_handle(param_1[1],param_3,param_4);
      if (*(short *)(param_1 + 2) != 0) {
        uVar12 = 0;
        do {
          puVar7 = (uint *)((char *)&DAT_000b78b8 + uVar12 * 4);
          uVar6 = *puVar7;
          if (uVar6 != 0 && uVar15 < uVar6) {
            *puVar7 = uVar6 - (uVar17 & 0xffff);
          }
          uVar12 = uVar12 + 1 & 0xffff;
        } while (uVar12 < *(ushort *)(param_1 + 2));
      }
      pcVar14 = &DAT_000b98b8;
    wptr_4897 = acStack_b9ae8;
      *(uint *)((char *)&DAT_000b78b8 + iVar8) = uVar16;
      do {
        cVar1 = *pcVar14;
        *wptr_4897 = cVar1; wptr_4897 = wptr_4897 + 1;
        pcVar14 = pcVar14 + 1;
      } while (cVar1 != '\0');
      iVar8 = Ordinal_1068(&DAT_000b98b8);
      pcVar14 = &DAT_000b98b9 + iVar8;
      iVar8 = -(int)pcVar14;
      do {
        cVar1 = *pcVar14;
        pcVar14[(int)(local_338 + iVar8)] = cVar1;
        pcVar14 = pcVar14 + 1;
      } while (cVar1 != '\0');
      iVar8 = 0;
      do {
        cVar1 = local_338[iVar8];
        acStack_129[iVar8 + 1] = cVar1;
        iVar8 = iVar8 + 1;
      } while (cVar1 != '\0');
      iVar8 = Ordinal_1068(local_338);
      acStack_129[iVar8] = '_';
      Ordinal_553(*param_1);
      Ordinal_553(param_1[1]);
      close_file_handle(acStack_230);
      uVar4 = open_file_for_read(local_338);
      uVar9 = open_existing_file_rw(acStack_230);
      uVar10 = Ordinal_172(uVar4,0);
      uVar11 = Ordinal_1041();
      read_file_handle(uVar4,uVar11,uVar10);
      write_file_handle(uVar9,uVar11,uVar10);
      Ordinal_1018(uVar11);
      Ordinal_553(uVar4);
      Ordinal_553(uVar9);
      close_file_handle(local_338);
      uVar4 = open_existing_file_rw_alt(acStack_230);
      *(char *)param_1 = (char)uVar4;
      *(char *)((char *)param_1 + 1) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)param_1 + 2) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)param_1 + 3) = (char)((uint)uVar4 >> 0x18);
      uVar4 = open_existing_file_rw(local_338);
      *(char *)(param_1 + 1) = (char)uVar4;
      *(char *)((char *)param_1 + 5) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)param_1 + 6) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)param_1 + 7) = (char)((uint)uVar4 >> 0x18);
      return true;
    }
    seek_file_handle(CONCAT13(*(undefined1 *)((char *)param_1 + 3),
                          CONCAT12(*(undefined1 *)((char *)param_1 + 2),
                                   CONCAT11(*(undefined1 *)((char *)param_1 + 1),*(undefined1 *)param_1
                                           ))),uVar15,0);
    uVar15 = write_file_handle(*param_1,param_3,param_4);
    if (getenv("UW_DEBUG_INPUTEVENT"))
      fprintf(stderr, "[15b94] exact-fit path: handle1=%d wrote=%u want=%u\n", (int)*param_1, uVar15, param_4);
    if (uVar15 == param_4) {
      return true;
    }
  }
  return false;
}



undefined2 read_archive_entry(param_1,param_2,param_3)
undefined4 * param_1;
uint param_2;
/* Was `undefined4`, truncating the real destination buffer pointer the
   callers pass (load_level_object_table: the malloc'd DAT_002029cc workspace;
   FUN_000164e4: &DAT_000b99d0). Forwarded straight to read_file_handle
   (uw_file_read), which needs a valid pointer -- the truncated value
   segfaulted the level loader on the first real read. */
void *param_3;

{
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  
  /* param_1+10 (bytes 0xa..0xd) held the literal address 0x000b78b8 --
     &DAT_000b78b8's location in the ORIGINAL 32-bit binary -- baked in by
     open_level_archive as the .ark entry-offset table pointer. That table is a
     single fixed global (open_level_archive/close_level_archive read the archive
     straight into &DAT_000b78b8), so on this recompile just use its real
     address instead of the truncated literal (which dereferenced as
     ~0xb78b8 and crashed the level loader). Same "hardcoded original-
     binary address" bug class as probe_save_slots's -0x87020. */
  if (((uint)*(ushort *)(param_1 + 2) < (param_2 & 0xffff)) ||
     (uVar6 = *(uint *)((char *)&DAT_000b78b8 + (param_2 & 0xffff) * 4), uVar6 == 0)) {
    uVar1 = 0;
  }
  else {
    iVar2 = seek_file_handle(*param_1,0,2);
    uVar7 = iVar2 - uVar6;
    if (*(ushort *)(param_1 + 2) != 0) {
      uVar5 = 0;
      do {
        uVar3 = *(uint *)((char *)&DAT_000b78b8 + uVar5 * 4);
        uVar4 = uVar3 - uVar6;
        if (uVar3 <= uVar6) {
          uVar4 = 0;
        }
        if ((uVar4 != 0) && (uVar4 < uVar7)) {
          uVar7 = uVar4;
        }
        uVar5 = uVar5 + 1 & 0xffff;
      } while (uVar5 < *(ushort *)(param_1 + 2));
    }
    seek_file_handle(*param_1,uVar6,0);
    uVar1 = read_file_handle(*param_1,param_3,uVar7 & 0xffff);
  }
  return uVar1;
}

