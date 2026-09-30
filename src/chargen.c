/* Character creation: the field-by-field state machine (choose sex,
 * handedness, class, skills, portrait, difficulty, name, confirm), its
 * resource-loading setup, and the critical-section entry wrapper. Split
 * out of uw.c (the original monolithic decompile) once these functions'
 * real roles were confirmed. */
#include "headers/chargen.h"
#include "headers/debug.h"



// The main character-generation state machine: steps through portrait/gender/skills/stats/name/confirm, one screen per state.
undefined4 character_generator_loop(param_1,param_2,param_3)
char *param_1;
char *param_2;
char *param_3;

{
  uint uVar1;
  byte bVar2;
  byte bVar3;
  int iVar4;
  /* iVar4 doubles as the character record's name-string pointer field
     (read from pcVar_rec+6, a relative offset from &DAT_000fb8f0 --
     see the write site in run_character_generator and FUN_00023de8's matching
     read-site comments) early in each state, and a plain screen-
     coordinate int in case 4 later -- mutually exclusive, but the
     pointer role can't just reuse `iVar4 + base` arithmetic since it's
     a *relative* offset needing reconstruction against &DAT_000fb8f0,
     not a raw pointer. Dedicated variable for the pointer role. */
  char *pcVar_name;
  char *pcVar5;
  /* iVar13 doubles as a "current character record" pointer (0x14-byte
     stride into param_3, computed fresh at the top of each state-machine
     iteration and consumed by FUN_00023de8/FUN_0002431c/FUN_00024840,
     all of which take a real `short *`) and, later in the SAME
     iteration inside case 4, a plain screen-coordinate int -- mutually
     exclusive in practice (the pointer role is only read before the
     switch), but both squeezed into one `int` `iVar13`, truncating the
     pointer role now that param_3 is a real 64-bit pointer. Given a
     dedicated variable for the pointer role only; iVar13 keeps its
     case-4 int role untouched. */
  char *pcVar_rec;
  ulonglong uVar6;
  undefined1 uVar7;
  short sVar8;
  uint uVar9;
  /* Was `undefined4`, truncating get_message_string's real char* return
     before measure_text_width/draw_text_string use it as a pointer. */
  char *uVar10;
  int iVar11;
  undefined4 extraout_r1;
  undefined4 extraout_r1_00;
  undefined4 extraout_r1_01;
  int iVar12;
  int iVar13;
  int iVar14;
  ulonglong uVar15;
  byte local_64 [4];
  undefined4 local_60;
  char *pcVar_p2off;
  /* local_5c and local_58 were separate Ghidra locals (`undefined4
     local_5c` + 6 more `undefined1 local_58/57/56/55/54/53` scalars),
     but their names encode adjacent stack offsets (-0x5c then -0x58,
     4 bytes apart) and the code writes across both as one flowing
     buffer -- `&local_5c + local_64[0] + 3` walks from local_5c's last
     byte straight into local_58's first bytes as local_64[0] grows.
     Classic "separate locals relied on being contiguous" artifact
     (see the README). Merged into one 10-byte array: local_5c's old 4
     bytes are index [0,4), local_58's old 6 bytes are index [4,10).
     local_5c's own VALUE was never read anywhere (only its address),
     so its old write is dropped; advance_skill_tree_node/FUN_00023c90 get
     `local_5c_buf + 4` where they used to get `local_58`. */
  undefined1 local_5c_buf [10];
  undefined1 auStack_4c [32];

  local_64[0] = 0;
  sVar8 = 0;
  uVar15 = grtile_alloc_registered(0x5f,0x6e);
  local_60 = (undefined4)uVar15;
  pcVar_p2off = param_2 + 0x20;
  memset(local_5c_buf + 4, 0x14, 6);
  /* Was 4 separate byte writes reconstructing a 32-bit address, then
     (in an earlier, incorrect fix attempt) a direct 8-byte pointer
     store -- see g_chargen_textfield_buf's comment above for why
     that's wrong. Keep this field a plain nonzero marker (its exact
     bits were never meaningful) and route the real pointer through the
     dedicated global instead. */
  *(int *)(param_3 + 0x7a) = 1;
  g_chargen_textfield_buf = auStack_4c;
  do {
    iVar12 = (int)sVar8;
    // Fires once per chargen screen (sex/handedness/class/skill/portrait/
    // difficulty/name/confirm are states 0-7, in that order) -- state is
    // whatever the previous iteration's switch-case just advanced sVar8
    // to (or reset it to 0 for, on a "back"/cancel).
    DEBUG(TRACE, "[chargen] screen advancing to state=%d", iVar12);
    pcVar_rec = param_3 + iVar12 * 0x14;
    iVar4 = *(int *)(pcVar_rec + 6);
    pcVar_name = (char *)&DAT_000fb8f0 + iVar4;
    screen_backup_save((int)uVar15,(int)(uVar15 >> 0x20));
    FUN_00035df8(1);
    DAT_000fb858 = DAT_001005c8;
    // Redraws the raw parchment background (both pages, 0,0 to 320,200) from scratch every loop iteration -- this is the mechanism that clears stale text from the *right* page between prompts (confirmed: disabling it leaves old prompt text visibly bleeding through under new prompt text). As a side effect it also wipes any stats text the previous iteration's switch-case drew on the left page. Confirmed present in the real ARM disassembly at this exact spot, in this exact order relative to the fill below -- not a decompilation bug.
    bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
    cursor_show_idle_tick();
    FUN_00035df8(0);
    DAT_000fb858 = DAT_001005c4;
    FUN_00057118();
    set_draw_color(0x1a);
    // Fills the left-page stats/portrait area (x:17-142,y:0-199) with a solid backing color, on top of the parchment the reblit above just redrew. Runs *after* that reblit (confirmed via disassembly), so despite looking like an eraser this can't be "protecting" the area from it -- more likely just the stats card's background color. The stats themselves only get redrawn when the switch below happens to hit case 2 or 3, so they're only visible for one frame after finishing class/skill picks. This contradicts a real-device reference screenshot showing stats persisting through later screens (e.g. name entry) -- root cause not yet found; see the STILL OPEN notes.
    rect_fill_or_save_restore(0x11,0,0x8e,199);
    screen_backup_restore();
    FUN_00023de8((short *)pcVar_rec);
    FUN_0002431c((short *)pcVar_rec,0,0xff);
    screen_backup_restore();
    uVar15 = FUN_00024840((short *)pcVar_rec);
    uVar6 = CONCAT44((int)(uVar15 >> 0x20),DAT_00086df8);
    uVar9 = (uint)uVar15;
    uVar1 = (uint)(short)uVar15;
    if ((int)uVar1 < 0) {
      if (iVar12 == 0) {
        return 0;
      }
      local_64[0] = 0;
      memset(local_5c_buf + 4, 0x14, 6);
      DAT_001005c0 = 0;
      FUN_00035df8(1);
      DAT_000fb858 = DAT_001005c8;
      bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
LAB_00025468:
      sVar8 = 0;
      cursor_show_idle_tick();
      FUN_00035df8(0);
      DAT_000fb858 = DAT_001005c4;
      uVar15 = screen_backup_save();
    }
    else {
      bVar2 = (byte)uVar15;
      switch(iVar12) {
      case 0:
        uVar10 = get_message_string(*(byte *)(pcVar_name + uVar1) | 0x400);
        uVar7 = 0xc;
        if (uVar1 == 0) {
          uVar7 = 7;
        }
        /* Was a write through CONCAT13(param_3+0x59, param_3+0x56) --
           reconstructing a pointer split across those 4 bytes the same
           way param_3+0x7a's pointer field was (see that fix above).
           But nothing anywhere in this file ever WRITES a real value
           into param_3+0x56/0x59 in the first place (confirmed by
           search), so the "pointer" being reconstructed here was
           always garbage/zero -- and nothing ever READS this field
           back either, so the write itself is dead regardless. Skipped
           rather than writing through reconstructed garbage. */
        *(byte *)(DAT_00086df8 + 100) =
             *(byte *)(DAT_00086df8 + 100) & 0xfd | (byte)((uVar9 & 1) << 1);
        FUN_00057118();
        draw_text_string(uVar10,0x11,0x16);
        uVar15 = cursor_show_idle_tick();
        sVar8 = 1;
        break;
      case 1:
        sVar8 = 2;
        bVar3 = *(byte *)(DAT_00086df8 + 100);
        uVar15 = (ulonglong)CONCAT14(bVar3,DAT_00086df8);
        *(byte *)(DAT_00086df8 + 100) = (bVar2 ^ bVar3) & 1 ^ bVar3;
        break;
      case 2:
        uVar10 = get_message_string(*(byte *)(pcVar_name + uVar1 * 2) | 0x400);
        *(byte *)(DAT_00086df8 + 100) =
             (byte)((uVar1 & 7) << 5) | *(byte *)(DAT_00086df8 + 100) & 0x1f;
        FUN_00023cdc();
        iVar12 = advance_skill_tree_node(local_64,local_5c_buf + 4,param_3 + 0x3c,pcVar_p2off);
        if (iVar12 == 0) {
          sVar8 = 3;
        }
        DAT_001005c0 = FUN_00023c90(0,local_5c_buf + 4);
        FUN_00057118();
        iVar12 = measure_text_width(uVar10);
        draw_text_string(uVar10,0x8f - iVar12,0x16);
        FUN_00023a00();
        capture_framebuffer_rect_to_grtile(local_60,0x1e,0x85,0x5f,0x37);
        FUN_00023b38();
        uVar15 = cursor_show_idle_tick();
        sVar8 = sVar8 + 1;
        break;
      case 3:
        /* (int)&local_5c truncated a real stack address; and
           *(int*)(param_3+0x42) is the same never-written, never-zeroed
           record field skipped in advance_skill_tree_node above -- always take the
           fallback instead of reading through arbitrary heap garbage. */
        local_5c_buf[local_64[0] + 3] = 0;
        DAT_001005c0 = FUN_00023c90((int)DAT_001005c0,local_5c_buf + 4);
        FUN_00057118();
        restore_captured_grtile_backdrop(local_60);
        FUN_00023b38();
        cursor_show_idle_tick();
        uVar15 = advance_skill_tree_node(local_64,local_5c_buf + 4,param_3 + 0x3c,pcVar_p2off);
        if ((int)uVar15 == 0) {
          sVar8 = 4;
        }
        break;
      case 4:
        g_blit_transparent_mode = 1;
        iVar14 = *(int *)(&DAT_000fb8c4 + ((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 5 + uVar1) * 4
                         );
        FUN_00035df8(0);
        DAT_000fb858 = DAT_001005c4;
        /* iVar14 is chrbtns.gr's cumulative offset for the chosen body
           figure (entry 17 + sexbit*5 + portraitIdx) -- now that
           DAT_000fb8c4 aliases the real LAB_000255d0 table (see uw.h),
           this is a genuine nonzero offset. Keep the <4 guard as a
           defensive floor against a still-empty table. */
        if (iVar14 < 4) {
          bVar2 = 0;
          bVar3 = 0;
        } else {
          bVar2 = *(byte *)(iVar14 + param_1 + -4);
          bVar3 = *(byte *)(iVar14 + param_1 + -3);
        }
        FUN_00057118();
        iVar12 = -(int)(short)(ushort)bVar3;
        iVar11 = iVar12 + 0x4c;
        iVar4 = -(int)(short)(ushort)bVar2;
        iVar13 = iVar4 + 0x38;
        if (iVar11 < 0) {
          iVar11 = iVar12 + 0x4d;
        }
        if (iVar13 < 0) {
          iVar13 = iVar4 + 0x39;
        }
        bitmap_blit_to_framebuffer((short)(iVar13 >> 1) + 0x10,(short)(iVar11 >> 1) + 0x2b,iVar14 + param_1,bVar3,
                     bVar2,0,0,1);
        cursor_show_idle_tick();
        uVar15 = CONCAT44(extraout_r1,DAT_00086df8);
        g_blit_transparent_mode = 0;
        sVar8 = 5;
        *(byte *)(DAT_00086df8 + 100) =
             *(byte *)(DAT_00086df8 + 100) & 0xe3 | (byte)((uVar9 & 7) << 2);
        break;
      case 5:
        sVar8 = 6;
        *(byte *)(DAT_00086df8 + 0xb4) = bVar2;
        uVar15 = uVar6;
        break;
      case 6:
        pcVar5 = g_chargen_textfield_buf;
        FUN_00057118();
        sVar8 = measure_text_width(pcVar5);
        iVar12 = -(int)sVar8 + 0x7e;
        if (iVar12 < 0) {
          iVar12 = -(int)sVar8 + 0x7f;
        }
        draw_text_string(pcVar5,(short)(iVar12 >> 1) + 0x11,0xb);
        cursor_show_idle_tick();
        uVar10 = extraout_r1_00;
        if (*pcVar5 != '\0') {
          Ordinal_1071(DAT_00086df8,pcVar5,0x1d);
          uVar10 = extraout_r1_01;
        }
        uVar15 = CONCAT44(uVar10,DAT_00086df8);
        sVar8 = 7;
        *(undefined1 *)(DAT_00086df8 + 0x1d) = 0;
        break;
      case 7:
        if (uVar1 != 0) {
          FUN_00057118();
          set_draw_color(0x1a);
          rect_fill_or_save_restore(0x11,0,0x8f,199);
          cursor_show_idle_tick();
          local_64[0] = 0;
          memset(local_5c_buf + 4, 0x14, 6);
          DAT_001005c0 = 0;
          FUN_00035df8(1);
          DAT_000fb858 = DAT_001005c8;
          bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
          goto LAB_00025468;
        }
        sVar8 = 8;
        uVar15 = recompute_level7_hazard_from_character_level(1);
      }
    }
    if (7 < sVar8) {
      uVar10 = get_message_string(0x300);
      FUN_00057118();
      FUN_00035df8(1);
      DAT_000fb858 = DAT_001005c8;
      screen_backup_restore();
      bitmap_blit_to_framebuffer(0,0,DAT_000fb858,200,0x140,0,0,1);
      sVar8 = measure_text_width(auStack_4c);
      iVar12 = -(int)sVar8 + 0xa0;
      if (iVar12 < 0) {
        iVar12 = -(int)sVar8 + 0xa1;
      }
      draw_text_string(auStack_4c,(short)(iVar12 >> 1) + 0xa0,
                   0x62 - CONCAT11(*(undefined1 *)(DAT_000879b0 + 7),
                                   *(undefined1 *)(DAT_000879b0 + 6)));
      sVar8 = measure_text_width(uVar10);
      iVar12 = -(int)sVar8 + 0xa0;
      if (iVar12 < 0) {
        iVar12 = -(int)sVar8 + 0xa1;
      }
      draw_text_string(uVar10,(short)(iVar12 >> 1) + 0xa0,0x62);
      screen_backup_restore();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xa0,199,0x13f,0);
      invalidate_grtile_by_key(local_60);
      return 1;
    }
  } while( true );
}



// Loads CHRGEN.DAT/CHARGEN.BYT/fonts/palette, builds the per-field record array, and drives character_generator_loop's state machine.
int run_character_generator()

{
  char stack0xffdc3230_buf [256];
  char *stack0xffdc3230_ptr;
  char cVar1;
  int iVar2;
  /* iVar2 doubles as a plain int return-code check early in this
     function and a real pointer (`DAT_001005c8 + 64000`, a palette
     load destination) later on -- mutually exclusive, but iVar2 stayed
     `int` either way, truncating the pointer. Given its own dedicated
     variable for the pointer-holding span only. */
  char *pcVar_palbuf;
  char *pcVar3;
  char *iVar4;
  uint uVar5;
  char *pcVar6;
  uint uVar7;
  undefined *puVar8;
  char *pcVar9;
  undefined2 uVar10;
  char acStack_128 [260];
  
  FUN_00035dd8();
  DAT_001005c4 = Ordinal_1041(0x10000);
  DAT_001005c8 = Ordinal_1041(0x10000);
  iVar4 = DAT_001005c4;
  uVar10 = 2;
  DAT_000fb858 = DAT_001005c4;
  iVar2 = load_gr_resource_entries(s_chrbtns_00084ef8,0,0xffffffff,&LAB_000255b4,&LAB_000255d0);
  if (iVar2 != 0) {
    DAT_000fb858 = iVar4;
    Ordinal_1047(acStack_128,0,0x104);
    pcVar9 = &DAT_0023cca8;
    stack0xffdc3230_ptr = stack0xffdc3230_buf;
    pcVar3 = pcVar9;
    stack0xffdc3230_ptr = acStack_128;
    do {
      cVar1 = *pcVar3;
      *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    Ordinal_1063(acStack_128,s__DATA_skills_dat_00084ee4);
    iVar4 = open_file_for_read(acStack_128);
    if (iVar4 != -1) {
      uVar5 = read_file_handle(iVar4,&DAT_000fb8f0,0x348);
      Ordinal_1044(&DAT_000fb860,&DAT_000fb8f0,0x20);
      Ordinal_553(iVar4);
      if ((0x27 < uVar5) && (uVar5 != 0)) {
        Ordinal_1047(acStack_128,0,0x104);
        pcVar3 = pcVar9;
    stack0xffdc3230_ptr = acStack_128;
        do {
          cVar1 = *pcVar3;
          *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
          pcVar3 = pcVar3 + 1;
        } while (cVar1 != '\0');
        Ordinal_1063(acStack_128,s__DATA_chrgen_dat_00084ed0);
        iVar4 = open_file_for_read(acStack_128);
        if (iVar4 != -1) {
          puVar8 = &DAT_000fb8f0 + uVar5;
          read_file_handle(iVar4,puVar8,10000);
          Ordinal_553(iVar4);
          /* Was `(char *)(uVar5 + 0xfb990)` -- a literal original-binary
             address (0xfb990 = &DAT_000fb990's address there) added to
             an int, instead of real pointer arithmetic against the
             actual (relocated) buffer. 0xfb990 - 0xfb8f0 = 0xa0, so this
             is really `puVar8 + 0xa0` (a fixed offset past the point
             puVar8 already starts at, within the same DAT_000fb8f0
             buffer). Same "hardcoded original-binary address" bug class
             as probe_save_slots's `-0x87020` fix earlier this session. */
          pcVar3 = (char *)puVar8 + 0xa0;
          iVar4 = 0;
          do {
            /* Was a 4-byte split of the absolute pointer `pcVar3`
               ((char)pcVar3, >>8, >>0x10, >>0x18) -- correct for a
               32-bit binary, but only ever captured pcVar3's low 32
               bits here, and the read sites (FUN_00023de8 etc.) treat
               those 4 bytes as the whole pointer. Since pcVar3 always
               points within DAT_000fb8f0's small fixed-address buffer,
               store a relative offset from &DAT_000fb8f0 instead -- it
               fits safely in the existing 4-byte field, and the read
               sites reconstruct the real pointer via &DAT_000fb8f0 +
               offset instead of using the stored value directly. */
            *(int *)(puVar8 + (int)(iVar4) * 0x14 + 6) = (int)(pcVar3 - (char *)&DAT_000fb8f0);
            do {
              pcVar6 = pcVar3;
              pcVar3 = pcVar6 + 2;
            } while (*pcVar3 != '\0');
            iVar4 = ((int)iVar4 + 1) * 0x10000 >> 0x10;
            pcVar3 = pcVar6 + 4;
          } while (iVar4 < 8);
          select_active_font(s_FONTCHAR_SYS_00084ec0);
          *g_draw_color_index = 0x49;
          *DAT_00084298 = 0x49;
          FUN_00035df8(1);
          iVar4 = DAT_001005c8;
          pcVar_palbuf = DAT_001005c8 + 64000;
          Ordinal_1047(acStack_128,0,0x104);
          do {
            cVar1 = *pcVar9;
            *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
            pcVar9 = pcVar9 + 1;
          } while (cVar1 != '\0');
          Ordinal_1063(acStack_128,s__DATA_CHARGEN_BYT_00084eac);
          uVar5 = read_buffer_from_file(acStack_128,iVar4,64000);
          uVar7 = load_pals_bank(3,pcVar_palbuf);
          if ((uVar5 & uVar7) != 0) {
            FUN_00057118();
            bitmap_blit_to_framebuffer(0,0,iVar4,200,CONCAT22(uVar10,0x140),0,0,0);
            iVar4 = character_generator_loop(DAT_000fb858,&DAT_000fb8f0,puVar8);
            select_active_font(s_FONT5X6P_SYS_00084e9c);
            if (DAT_00201c98 != 0) {
              FUN_0005b36c();
            }
            if (iVar4 == 0) {
              FUN_00035df8(1);
            }
            thunk_FUN_0007ec1c();
            if (DAT_001005c4 != 0) {
              Ordinal_1018();
              DAT_001005c4 = 0;
            }
            if (DAT_001005c8 == 0) {
              return iVar4;
            }
            Ordinal_1018();
            DAT_001005c8 = 0;
            return iVar4;
          }
        }
      }
    }
  }
  thunk_FUN_0007ec1c();
  if (DAT_001005c4 != 0) {
    Ordinal_1018();
    DAT_001005c4 = 0;
  }
  if (DAT_001005c8 != 0) {
    Ordinal_1018();
    DAT_001005c8 = 0;
  }
  if (DAT_00201c98 != 0) {
    FUN_0005b36c();
  }
  init_new_character_record(0);
  FUN_00040df0();
  FUN_0003c3c8(5);
  return 1;
}



// Thin wrapper that enters/exits a critical section around run_character_generator.
undefined4 character_generator_start()

{
  undefined4 uVar1;

  DEBUG(TRACE, "[chargen] character generation starting");
  init_new_character_record(1);
  uVar1 = run_character_generator();
  load_weapon_combat_maneuver_data();
  DEBUG(TRACE, "[chargen] character generation returning, result=%u", uVar1);
  return uVar1;
}


// was FUN_000232ec -- resets the player record (DAT_00086df8, base
// &DAT_0023bca8 set by reset_player_object_record) to new-character
// defaults: zeroes/reinitializes combat flags, equipment slots, and
// misc stat fields, then rolls the starting attribute/skill-point
// arrays. param_1 selects which of the two real call sites this is:
// character_generator_start passes 1 (reset-only, all rolled fields
// zeroed, called before the interactive chargen UI runs so the player
// starts from a blank sheet), while run_character_generator's own tail
// (chargen.c) and the uw.c ~18695 call site pass 0 (actually roll
// random starting stats via roll_dice_sum, called once chargen/a new
// game is finalizing).
void init_new_character_record(param_1)
int param_1;

{
  int uw_ord2005_rem_0 = 0; int uw_ord2005_rem_1 = 0;
  byte bVar1;
  undefined1 uVar2;
  char cVar3;
  undefined4 uVar4;
  char extraout_r1;
  uint extraout_r1_00;
  uint uVar5;
  int iVar6;
  
  *(byte *)(DAT_00086df8 + 100) = *(byte *)(DAT_00086df8 + 100) | 1;
  *(undefined1 *)(DAT_00086df8 + 0x4e) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x4f) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x50) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x51) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x52) = 1;
  *(undefined1 *)(DAT_00086df8 + 0x53) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x3d) = 1;
  *(undefined1 *)(DAT_00086df8 + 0xce) = 0;
  *(undefined1 *)(DAT_00086df8 + 0xcf) = 0x30;
  *(undefined1 *)(DAT_00086df8 + 0xd0) = 0xb;
  *(undefined1 *)(DAT_00086df8 + 0xd1) = 1;
  *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf2 | 2;
  *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfc3f;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xf3ff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xefff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xdfff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0x7fff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xbfff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfbff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xf7ff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xefff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfffc;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfc0f;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfff3;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  *(byte *)(DAT_00086df8 + 0xb5) = *(byte *)(DAT_00086df8 + 0xb5) & 0xf | 0x30;
  FUN_0005d2b0();
  *(undefined1 *)(DAT_00086df8 + 0x6d) = 8;
  *(undefined1 *)(DAT_00086df8 + 0x65) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x66) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x67) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x68) = 0;
  if (getenv("UW_DEBUG_FORCE_QUEST_TEST")) {
    *(unsigned int *)(DAT_00086df8 + 0x65) = 0x12345678;
    fprintf(stderr, "[quest-persist] forced test quest_bits=0x%x at new-game init\n", *(unsigned int *)(DAT_00086df8 + 0x65));
  }
  *(undefined1 *)(DAT_00086df8 + 0x6e) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6f) = 0;
  uVar5 = *(ushort *)(DAT_00086df8 + 0xb6) & 0xfff8;
  *(char *)(DAT_00086df8 + 0xb6) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0xb7) = (char)(uVar5 >> 8);
  *(undefined1 *)(DAT_00086df8 + 0xb8) = 0;
  *(undefined1 *)(DAT_00086df8 + 0xb9) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x3a) = 0x40;
  *(undefined1 *)(DAT_00086df8 + 0x3b) = 0x40;
  *(undefined1 *)(DAT_00086df8 + 0x3c) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x69) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6a) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6b) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6c) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x47) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x48) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x49) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x44) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x45) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x46) = 0;
  Ordinal_1047(DAT_00086df8 + 0x70,0,0x40);
  Ordinal_1047(DAT_00086df8 + 0xc2,0,8);
  *(undefined1 *)(DAT_00086df8 + 0x8a) = 0x35;
  *(undefined1 *)(DAT_00086df8 + 0x39) = 0xc0;
  uVar4 = Ordinal_1053();
  uw_ord2005_rem_0 = ((int)(uVar4)) % (5);
  *(byte *)(DAT_00086df8 + 100) =
       (byte)((uw_ord2005_rem_0 & 7) << 2) | *(byte *)(DAT_00086df8 + 100) & 0xe3;
  bVar1 = Ordinal_1053();
  iVar6 = 0;
  *(byte *)(DAT_00086df8 + 100) = *(byte *)(DAT_00086df8 + 100) & 0xfd | (bVar1 & 1) << 1;
  do {
    if (param_1 == 0) {
      uVar2 = roll_dice_sum(3,4);
    }
    else {
      uVar2 = 0;
    }
    *(undefined1 *)(iVar6 + DAT_00086df8 + 0x21) = uVar2;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x14);
  iVar6 = 0;
  do {
    if (param_1 == 0) {
      cVar3 = roll_dice_sum(2,10);
      cVar3 = cVar3 + '\n';
    }
    else {
      cVar3 = '\0';
    }
    *(char *)(iVar6 + DAT_0023be74 + 5) = cVar3;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 3);
  recompute_level7_hazard_from_character_level(1);
  *(undefined1 *)(DAT_00086df8 + 0x4a) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x4b) = 0;
  uVar4 = Ordinal_1053();
  uw_ord2005_rem_1 = ((int)(uVar4)) % (6);
  *(char *)((char *)g_player_object + 8) = (-6 - uw_ord2005_rem_1) + *(char *)(DAT_0023be74 + 4);
  DAT_00201b68 = 1;
  refresh_player_equipment_effects();
  return;
}


// was FUN_000238b4 -- walks the character-generator skill tree (param_4,
// a compact [count][id0][id1]...-encoded tree) starting from the cursor
// index *param_1: for each leaf skill entry, records its id into the
// output array param_2 (up to 5 entries) and advances the cursor,
// returning 0 once done (or the array is full) so character_generator_loop
// moves to its next state; on hitting a branch/submenu node instead,
// populates the skill record param_3 with that submenu's choice count
// and string-id list and returns 1, so the caller re-enters this same
// state to show the sub-menu. See its own long-standing internal
// comments for the specific field-layout evidence.
undefined4 advance_skill_tree_node(param_1,param_2,param_3,param_4)
byte * param_1;
char *param_2;
char *param_3;
char *param_4;

{
  byte bVar1;
  short sVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  
  sVar2 = 0;
  iVar3 = (uint)(*(byte *)(DAT_00086df8 + 100) >> 5) * 5 + (uint)*param_1;
  if (iVar3 != 0) {
    iVar5 = 0;
    do {
      sVar2 = (ushort)*(byte *)(param_4 + sVar2) + sVar2 + 1;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < iVar3);
  }
  if (*param_1 < 5) {
    do {
      pbVar4 = (byte *)(param_4 + sVar2);
      if (*pbVar4 == 0) {
        *(undefined1 *)(param_2 + (uint)*param_1) = 0x14;
      }
      else {
        if (*pbVar4 != 1) {
          iVar3 = (int)sVar2;
          /* Branch node in the skill tree: [count][id0][id1]...  Set the
             skill record's on-screen item count to this sub-menu's choice
             count and populate its string-id list with the choice names
             (skill id + 0x1f = its string number in block 4), then return
             1 so character_generator_loop keeps state 3 and shows the
             sub-menu drawn from that list. */
          *(undefined1 *)(param_3 + 10) = *(undefined1 *)(iVar3 + param_4);
          *(undefined1 *)(param_3 + 0xb) = 0;
          /* param_3+6 is the skill record's string-list field. Ghidra had
             this as a bare absolute pointer (correct for the 32-bit
             binary) and an earlier pass disabled the whole loop believing
             the field was never populated -- but run_character_generator
             (chargen.c) DOES write it, as a relative offset from
             &DAT_000fb8f0 (same convention FUN_00023de8's read site uses).
             Reconstruct the real pointer that way instead of skipping. */
          {
            char *list = (char *)&DAT_000fb8f0 + *(int *)(param_3 + 6);
            iVar5 = 0;
            do {
              list[iVar5 * 2] = *(char *)(iVar5 + iVar3 + param_4 + 1) + '\x1f';
              iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
            } while (iVar5 < (int)(uint)*(byte *)(iVar3 + param_4));
          }
          *param_1 = *param_1 + 1;
          return 1;
        }
        *(byte *)(param_2 + (uint)*param_1) = pbVar4[1];
        sVar2 = (ushort)*pbVar4 + sVar2 + 1;
      }
      bVar1 = *param_1;
      *param_1 = bVar1 + 1;
    } while ((byte)(bVar1 + 1) < 5);
  }
  return 0;
}
