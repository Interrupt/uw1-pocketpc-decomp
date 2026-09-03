/* Character creation: the field-by-field state machine (choose sex,
 * handedness, class, skills, portrait, difficulty, name, confirm), its
 * resource-loading setup, and the critical-section entry wrapper. Split
 * out of uw.c (the original monolithic decompile) once these functions'
 * real roles were confirmed. */
#include "headers/chargen.h"



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
  /* Was `undefined4`, truncating FUN_0007863c's real char* return
     before FUN_000112a0/FUN_00011060 use it as a pointer. */
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
     so its old write is dropped; FUN_000238b4/FUN_00023c90 get
     `local_5c_buf + 4` where they used to get `local_58`. */
  undefined1 local_5c_buf [10];
  undefined1 auStack_4c [32];

  local_64[0] = 0;
  sVar8 = 0;
  uVar15 = FUN_00076a2c(0x5f,0x6e);
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
    pcVar_rec = param_3 + iVar12 * 0x14;
    iVar4 = *(int *)(pcVar_rec + 6);
    pcVar_name = (char *)&DAT_000fb8f0 + iVar4;
    FUN_00011478((int)uVar15,(int)(uVar15 >> 0x20));
    FUN_00035df8(1);
    DAT_000fb858 = DAT_001005c8;
    // Redraws the raw parchment background (both pages, 0,0 to 320,200) from scratch every loop iteration -- this is the mechanism that clears stale text from the *right* page between prompts (confirmed: disabling it leaves old prompt text visibly bleeding through under new prompt text). As a side effect it also wipes any stats text the previous iteration's switch-case drew on the left page. Confirmed present in the real ARM disassembly at this exact spot, in this exact order relative to the fill below -- not a decompilation bug.
    bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
    FUN_000570b4();
    FUN_00035df8(0);
    DAT_000fb858 = DAT_001005c4;
    FUN_00057118();
    set_draw_color(0x1a);
    // Fills the left-page stats/portrait area (x:17-142,y:0-199) with a solid backing color, on top of the parchment the reblit above just redrew. Runs *after* that reblit (confirmed via disassembly), so despite looking like an eraser this can't be "protecting" the area from it -- more likely just the stats card's background color. The stats themselves only get redrawn when the switch below happens to hit case 2 or 3, so they're only visible for one frame after finishing class/skill picks. This contradicts a real-device reference screenshot showing stats persisting through later screens (e.g. name entry) -- root cause not yet found; see the STILL OPEN notes.
    rect_fill_or_save_restore(0x11,0,0x8e,199);
    FUN_000114e4();
    FUN_00023de8((short *)pcVar_rec);
    FUN_0002431c((short *)pcVar_rec,0,0xff);
    FUN_000114e4();
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
      FUN_000570b4();
      FUN_00035df8(0);
      DAT_000fb858 = DAT_001005c4;
      uVar15 = FUN_00011478();
    }
    else {
      bVar2 = (byte)uVar15;
      switch(iVar12) {
      case 0:
        uVar10 = FUN_0007863c(*(byte *)(pcVar_name + uVar1) | 0x400);
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
        FUN_00011060(uVar10,0x11,0x16);
        uVar15 = FUN_000570b4();
        sVar8 = 1;
        break;
      case 1:
        sVar8 = 2;
        bVar3 = *(byte *)(DAT_00086df8 + 100);
        uVar15 = (ulonglong)CONCAT14(bVar3,DAT_00086df8);
        *(byte *)(DAT_00086df8 + 100) = (bVar2 ^ bVar3) & 1 ^ bVar3;
        break;
      case 2:
        uVar10 = FUN_0007863c(*(byte *)(pcVar_name + uVar1 * 2) | 0x400);
        *(byte *)(DAT_00086df8 + 100) =
             (byte)((uVar1 & 7) << 5) | *(byte *)(DAT_00086df8 + 100) & 0x1f;
        FUN_00023cdc();
        iVar12 = FUN_000238b4(local_64,local_5c_buf + 4,param_3 + 0x3c,pcVar_p2off);
        if (iVar12 == 0) {
          sVar8 = 3;
        }
        DAT_001005c0 = FUN_00023c90(0,local_5c_buf + 4);
        FUN_00057118();
        iVar12 = FUN_000112a0(uVar10);
        FUN_00011060(uVar10,0x8f - iVar12,0x16);
        FUN_00023a00();
        FUN_00076b8c(local_60,0x1e,0x85,0x5f,0x37);
        FUN_00023b38();
        uVar15 = FUN_000570b4();
        sVar8 = sVar8 + 1;
        break;
      case 3:
        /* (int)&local_5c truncated a real stack address; and
           *(int*)(param_3+0x42) is the same never-written, never-zeroed
           record field skipped in FUN_000238b4 above -- always take the
           fallback instead of reading through arbitrary heap garbage. */
        local_5c_buf[local_64[0] + 3] = 0;
        DAT_001005c0 = FUN_00023c90((int)DAT_001005c0,local_5c_buf + 4);
        FUN_00057118();
        FUN_00076e98(local_60);
        FUN_00023b38();
        FUN_000570b4();
        uVar15 = FUN_000238b4(local_64,local_5c_buf + 4,param_3 + 0x3c,pcVar_p2off);
        if ((int)uVar15 == 0) {
          sVar8 = 4;
        }
        break;
      case 4:
        DAT_00088960 = 1;
        iVar14 = *(int *)(&DAT_000fb8c4 + ((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 5 + uVar1) * 4
                         );
        FUN_00035df8(0);
        DAT_000fb858 = DAT_001005c4;
        /* DAT_000fb8c4 is never populated (see its comment), so iVar14
           is always 0 here and `iVar14 + param_1 + -4/-3` underruns
           param_1's buffer. Same fallback-to-0 guard as the
           DAT_000fb880 cases above. */
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
        FUN_000570b4();
        uVar15 = CONCAT44(extraout_r1,DAT_00086df8);
        DAT_00088960 = 0;
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
        sVar8 = FUN_000112a0(pcVar5);
        iVar12 = -(int)sVar8 + 0x7e;
        if (iVar12 < 0) {
          iVar12 = -(int)sVar8 + 0x7f;
        }
        FUN_00011060(pcVar5,(short)(iVar12 >> 1) + 0x11,0xb);
        FUN_000570b4();
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
          FUN_000570b4();
          local_64[0] = 0;
          memset(local_5c_buf + 4, 0x14, 6);
          DAT_001005c0 = 0;
          FUN_00035df8(1);
          DAT_000fb858 = DAT_001005c8;
          bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
          goto LAB_00025468;
        }
        sVar8 = 8;
        uVar15 = FUN_000703a0(1);
      }
    }
    if (7 < sVar8) {
      uVar10 = FUN_0007863c(0x300);
      FUN_00057118();
      FUN_00035df8(1);
      DAT_000fb858 = DAT_001005c8;
      FUN_000114e4();
      bitmap_blit_to_framebuffer(0,0,DAT_000fb858,200,0x140,0,0,1);
      sVar8 = FUN_000112a0(auStack_4c);
      iVar12 = -(int)sVar8 + 0xa0;
      if (iVar12 < 0) {
        iVar12 = -(int)sVar8 + 0xa1;
      }
      FUN_00011060(auStack_4c,(short)(iVar12 >> 1) + 0xa0,
                   0x62 - CONCAT11(*(undefined1 *)(DAT_000879b0 + 7),
                                   *(undefined1 *)(DAT_000879b0 + 6)));
      sVar8 = FUN_000112a0(uVar10);
      iVar12 = -(int)sVar8 + 0xa0;
      if (iVar12 < 0) {
        iVar12 = -(int)sVar8 + 0xa1;
      }
      FUN_00011060(uVar10,(short)(iVar12 >> 1) + 0xa0,0x62);
      FUN_000114e4();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xa0,199,0x13f,0);
      FUN_00076b24(local_60);
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
  iVar2 = FUN_000417b4(s_chrbtns_00084ef8,0,0xffffffff,&LAB_000255b4,&LAB_000255d0);
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
    iVar4 = FUN_000227d4(acStack_128);
    if (iVar4 != -1) {
      uVar5 = FUN_0002285c(iVar4,&DAT_000fb8f0,0x348);
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
        iVar4 = FUN_000227d4(acStack_128);
        if (iVar4 != -1) {
          puVar8 = &DAT_000fb8f0 + uVar5;
          FUN_0002285c(iVar4,puVar8,10000);
          Ordinal_553(iVar4);
          /* Was `(char *)(uVar5 + 0xfb990)` -- a literal original-binary
             address (0xfb990 = &DAT_000fb990's address there) added to
             an int, instead of real pointer arithmetic against the
             actual (relocated) buffer. 0xfb990 - 0xfb8f0 = 0xa0, so this
             is really `puVar8 + 0xa0` (a fixed offset past the point
             puVar8 already starts at, within the same DAT_000fb8f0
             buffer). Same "hardcoded original-binary address" bug class
             as FUN_0006bde0's `-0x87020` fix earlier this session. */
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
          FUN_00040d00(s_FONTCHAR_SYS_00084ec0);
          *DAT_0008429c = 0x49;
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
          uVar5 = FUN_0007ee4c(acStack_128,iVar4,64000);
          uVar7 = FUN_00040e24(3,pcVar_palbuf);
          if ((uVar5 & uVar7) != 0) {
            FUN_00057118();
            bitmap_blit_to_framebuffer(0,0,iVar4,200,CONCAT22(uVar10,0x140),0,0,0);
            iVar4 = character_generator_loop(DAT_000fb858,&DAT_000fb8f0,puVar8);
            FUN_00040d00(s_FONT5X6P_SYS_00084e9c);
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
  FUN_000232ec(0);
  FUN_00040df0();
  FUN_0003c3c8(5);
  return 1;
}



// Thin wrapper that enters/exits a critical section around run_character_generator.
undefined4 character_generator_start()

{
  undefined4 uVar1;
  
  FUN_000232ec(1);
  uVar1 = run_character_generator();
  FUN_0006e89c();
  return uVar1;
}
