/* Product registration/copy-protection cluster: the code-wheel
 * registration-word checksum (validate_codewheel_word and its two table-
 * lookup helpers), the registry-based "already validated" sentinel
 * (check_registration_key_saved/save_registration_key_validated), the
 * registration-key entry dialog (bypassed outright in this stub build --
 * see check_registration_key_dialog's own comment), and the related
 * power-status-flag and disk-space startup checks. Split out of uw.c
 * (the original monolithic decompile) once these functions' real roles
 * were confirmed.
 */
#include "headers/registration.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>





// was FUN_0006b3dc -- codewheel character-table lookup: returns the
// short value at index param_1 (0..0x23/35) of the table DAT_00086f0c
// points at, or 0 if out of range. Part of the code-wheel registration
// word checksum (see validate_codewheel_word's own comment) -- unreachable
// in this build since that function has no callers (the registration
// gate is bypassed outright, see check_registration_key_dialog).
undefined2 codewheel_letter_at_index(param_1)
int param_1;

{
  undefined2 uVar1;

  if ((param_1 < 0) || (0x23 < param_1)) {
    uVar1 = 0;
  }
  else {
    uVar1 = *(undefined2 *)(DAT_00086f0c + param_1 * 2);
  }
  return uVar1;
}



// was FUN_0006b408 -- reverse lookup into the same codewheel character
// table as codewheel_letter_at_index: returns the index of the first
// entry equal to param_1, or -1 if not found. Same dead-code status.
int codewheel_index_of_letter(param_1)
short param_1;

{
  int iVar1;
  short *psVar2;

  iVar1 = 0;
  psVar2 = DAT_00086f0c;
  do {
    if (*psVar2 == param_1) {
      return iVar1;
    }
    iVar1 = iVar1 + 1;
    psVar2 = psVar2 + 1;
  } while (iVar1 < 0x24);
  return -1;
}



// was FUN_0006b448 -- the code-wheel registration-word checksum:
// param_2 is a 12-char answer word (uppercased in-place into local_48),
// param_1 a 4-entry ushort key. Splits the word into four 3-letter
// groups, looks each letter up via codewheel_index_of_letter, and cross-
// checks derived sum/product checksums against the word's own 3rd
// letter of each group (via codewheel_letter_at_index) -- the classic
// "read the word off the code wheel at the position matching your key"
// copy-protection scheme. No callers in this build (see
// codewheel_letter_at_index's own comment) -- the registration gate is
// bypassed outright by check_registration_key_dialog.
undefined4 validate_codewheel_word(param_1,param_2)
ushort * param_1;
int param_2;

{
  int uw_ord2005_rem_128 = 0; int uw_ord2005_rem_129 = 0; int uw_ord2005_rem_130 = 0; int uw_ord2005_rem_131 = 0; int uw_ord2005_rem_132 = 0; int uw_ord2005_rem_133 = 0;
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int extraout_r1_03;
  int extraout_r1_04;
  ushort uVar9;
  int iVar10;
  ushort local_48 [14];
  
  iVar10 = 0;
  do {
    uVar9 = *(ushort *)(iVar10 * 2 + param_2);
    if ((uVar9 < 0x7b) && (0x60 < uVar9)) {
      uVar9 = uVar9 - 0x20;
    }
    iVar2 = (iVar10 + 1) * 0x10000;
    local_48[iVar10] = uVar9;
    iVar10 = iVar2 >> 0x10;
  } while (iVar10 < 0xc);
  local_48[(short)((uint)iVar2 >> 0x10)] = 0;
  iVar10 = codewheel_index_of_letter(local_48[0]);
  iVar2 = codewheel_index_of_letter(local_48[3]);
  iVar3 = codewheel_index_of_letter(local_48[6]);
  iVar4 = codewheel_index_of_letter(local_48[9]);
  iVar5 = codewheel_index_of_letter(local_48[1]);
  iVar6 = codewheel_index_of_letter(local_48[4]);
  iVar7 = codewheel_index_of_letter(local_48[7]);
  iVar8 = codewheel_index_of_letter(local_48[10]);
  uw_ord2005_rem_128 = ((int)(iVar4 + iVar3 + iVar2 + iVar10)) % (0x24);
  uw_ord2005_rem_129 = ((int)(iVar8 + iVar7 + iVar6 + iVar5)) % (0x24);
  uw_ord2005_rem_130 = ((int)(iVar4 * iVar3 * iVar2 * iVar10)) % (0x24);
  uw_ord2005_rem_131 = ((int)(iVar8 * iVar7 * iVar6 * iVar5)) % (0x24);
  sVar1 = codewheel_letter_at_index(uw_ord2005_rem_128);
  if ((sVar1 == local_48[2]) && (sVar1 = codewheel_letter_at_index(uw_ord2005_rem_129), sVar1 == local_48[5])) {
    uw_ord2005_rem_132 = ((int)(((uint)*param_1 + (uint)param_1[1]) * uw_ord2005_rem_130)) % (0x24);
    uw_ord2005_rem_133 = ((int)(((uint)param_1[2] + (uint)param_1[3]) * uw_ord2005_rem_131)) % (0x24);
    sVar1 = codewheel_letter_at_index(uw_ord2005_rem_132);
    if (((sVar1 == local_48[8]) && (sVar1 = codewheel_letter_at_index(uw_ord2005_rem_133), sVar1 == local_48[0xb]))
       && (((((iVar10 != 0 || (iVar2 != 0)) || (iVar3 != 0)) ||
            ((((iVar4 != 0 || (iVar5 != 0)) || (iVar6 != 0)) || ((iVar7 != 0 || (iVar8 != 0)))))) ||
           ((uw_ord2005_rem_130 != 0 ||
            ((((uw_ord2005_rem_131 != 0 || (uw_ord2005_rem_128 != 0)) || (uw_ord2005_rem_129 != 0)) ||
             ((uw_ord2005_rem_132 != 0 || (uw_ord2005_rem_133 != 0)))))))))) {
      return 1;
    }
  }
  return 0;
}



// was FUN_0006b718 -- checks the registry (HKLM\Software\ZIO_Interactive_
// Ultima_U\BuildNo) for the sentinel value 0xc0f this port's registration
// flow writes via save_registration_key_validated once the product's been
// validated; on a first run (key missing) it instead creates the key with
// a placeholder value derived from the current tick count, ready for
// save_registration_key_validated to overwrite for real.
undefined4 check_registration_key_saved()

{
  int iVar1;
  undefined4 uVar2;
  int extraout_r1;
  undefined4 uVar3;
  int local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined1 auStack_c [4];
  
  local_10 = 4;
  local_14 = 4;
  uVar3 = 0;
  Ordinal_456(0x80000001,u_Software_ZIO_Interactive_Ultima_U_00086f6c,0,0,0,0,0,&local_18,auStack_c)
  ;
  iVar1 = Ordinal_463(local_18,u_BuildNo_00086f5c,0,&local_10,&local_1c,&local_14);
  if (iVar1 == 0) {
    Ordinal_463(local_18,u_BuildNo_00086f5c,0,&local_10,&local_1c,&local_14);
    if (local_1c == 0xc0f) {
      uVar3 = 1;
    }
  }
  else {
    uVar2 = Ordinal_80();
    Ordinal_2008(10000,uVar2);
    local_1c = extraout_r1 + 1;
    Ordinal_464(local_18,u_BuildNo_00086f5c,0,local_10,&local_1c,local_14);
  }
  Ordinal_455(local_18);
  return uVar3;
}



// was FUN_0006b838 -- writes the registry sentinel (0xc0f) check_registration_key_saved
// looks for, marking the product as validated/registered.
void save_registration_key_validated()

{
  undefined4 local_10;
  undefined4 local_c;
  undefined1 auStack_8 [4];
  
  Ordinal_456(0x80000001,u_Software_ZIO_Interactive_Ultima_U_00086f6c,0,0,0,0,0,&local_10,auStack_8)
  ;
  local_c = 0xc0f;
  Ordinal_464(local_10,u_BuildNo_00086f5c,0,4,&local_c,4);
  Ordinal_455(local_10);
  return;
}



// was FUN_0006b8c0
void set_power_status_flag_bit()

{
  /* Looks like a GetSystemPowerStatus/GetVersionEx-shaped call: a struct
     starting with a 4-byte "cbSize" field is zeroed, sized, and passed to
     Ordinal_4 (unidentified coredll query, currently a no-op stub that
     always reports "unsupported"/0), so the flag-setting branch below is
     presently dead. Widened from a bare 4-byte local to the full 0x30-byte
     struct Ghidra's memset call actually touches -- the original
     undersized declaration let a real memset() smash the stack. */
  int iVar1;
  undefined1 local_34 [0x30];
  
  Ordinal_1047(local_34,0,0x30);
  *(undefined4 *)local_34 = 0x30;
  iVar1 = Ordinal_4(0xe1,0,local_34,0);
  if (iVar1 != 0) {
    *(uint *)(local_34 + 4) = *(uint *)(local_34 + 4) | 1;
    Ordinal_4(0xe0,0,local_34,0);
  }
  return;
}



// was FUN_0006b920
void clear_power_status_flag_bit()

{
  /* Counterpart of set_power_status_flag_bit (see comment there): same struct shape,
     clears instead of sets the flag bit. Also dead under the current
     Ordinal_4 stub. */
  int iVar1;
  undefined1 local_34 [0x30];
  
  Ordinal_1047(local_34,0,0x30);
  *(undefined4 *)local_34 = 0x30;
  iVar1 = Ordinal_4(0xe1,0,local_34,0);
  if (iVar1 != 0) {
    *(uint *)(local_34 + 4) = *(uint *)(local_34 + 4) & 0xfffffffe;
    Ordinal_4(0xe0,0,local_34,0);
  }
  return;
}



// was FUN_0006b980
undefined4 check_registration_key_dialog(param_1,param_2)
undefined4 param_1;
undefined4 param_2;

{
  /* This is the "enter your registration key" modal dialog gate (see the
     "Invalid Registration Key Code!!" string and the registration_key_dialog_proc
     dialog proc it registers via Ordinal_690, a CreateDialogParam-shaped call).
     Ordinal_690 is a generic no-op stub -- it never actually shows a
     dialog or drives the dialog proc -- so DAT_0023c108 (the dialog's
     "still open" flag) would never get set and this would always report
     failure. Bypassed outright: this is exactly the kind of OS/GUI-level
     platform interaction the stub build isn't trying to reproduce, and a
     stub build shouldn't gate startup on a product key nobody has. */
  (void)param_1; (void)param_2;
  fprintf(stderr, "[stub] check_registration_key_dialog: bypassing registration-key dialog, "
                  "treating as already registered\n");
  return 1;
}



// was FUN_0006ba54 -- window proc for the (never actually shown, see
// check_registration_key_dialog) "enter your registration key" dialog:
// WM_INITDIALOG-shaped (0x110)... but that message id is never checked
// here (only WM_COMMAND, 0x111, is handled -- the 0x110 branch just
// falls through to `return 1`), so param_2==0x111 is really the only
// live path: IDCANCEL-or-similar (param_3==1 or 2) closes the dialog
// and clears DAT_0023c108, while param_3==0x3ea (a custom "validate"
// command) reads the entered key text, closes with DAT_0023c108 set.
undefined4 registration_key_dialog_proc(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
short param_3;

{
  if (param_2 != 0x110) {
    if (param_2 != 0x111) {
      return 0;
    }
    if ((param_3 == 1) || (param_3 == 2)) {
      Ordinal_691(param_1);
      DAT_0023c108 = 0;
    }
    else {
      if (param_3 != 0x3ea) {
        return 0;
      }
      Ordinal_687(param_1,0x3e9,&DAT_0023bf78,0xb4);
      Ordinal_691(param_1,0x3ea);
      DAT_0023c108 = 1;
    }
  }
  return 1;
}



// was FUN_0006baf8 -- top-level registration check: true if the
// registry sentinel is already set (check_registration_key_saved) or the
// (bypassed, always-succeeding) registration dialog gate
// (check_registration_key_dialog) reports success.
undefined4 is_product_registered(param_1,param_2)
char *param_1;
undefined4 param_2;

{
  int iVar1;
  undefined1 auStack_1c [10];
  ushort local_12;
  ushort local_10;
  ushort local_e;

  Ordinal_25(auStack_1c);
  Ordinal_1061((local_e + 1) * (local_10 + 1) * (local_12 + 1));
  iVar1 = check_registration_key_saved();
  if ((iVar1 == 0) && (iVar1 = check_registration_key_dialog(param_1,param_2), iVar1 == 0)) {
    return 0;
  }
  return 1;
}



// was FUN_0006bb64 -- startup disk-space check (its only caller checks
// it right after init_gameplay_session and shows "Not enough disk space
// for save game" on failure): builds a path from DAT_0023cca8 plus
// FUN_0006c560's suffix and queries free space via the GetDiskFreeSpace-
// shaped Ordinal_184, requiring at least 0x9b0a0 (~635KB) free.
// Ordinal_184 is stubbed to always report a large local_118 (see
// ordinal_stubs.c), so this always reports success in this build.
undefined4 check_save_disk_space()

{
  char stack0xffdc3250_buf [256];
  char *stack0xffdc3250_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  uint local_118;
  int local_114;
  undefined1 auStack_110 [7];
  char acStack_109 [261];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3250_ptr = stack0xffdc3250_buf;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3250_ptr = cVar1; stack0xffdc3250_ptr = stack0xffdc3250_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  Ordinal_1063(acStack_109 + 1,&DAT_000857a0);
  iVar3 = Ordinal_1068(acStack_109 + 1);
  acStack_109[iVar3] = '\0';
  uVar4 = FUN_0002295c(acStack_109 + 1);
  Ordinal_160(uVar4,0);
  FUN_0006c560(acStack_109 + 1);
  uVar4 = FUN_0002295c(acStack_109 + 1);
  /* local_114 is never actually passed to Ordinal_184 (only auStack_110
     and &local_118 are) -- in the original 32-bit binary this local
     apparently sat immediately after auStack_110 on the stack and got
     written incidentally by a GetDiskFreeSpace-shaped call writing a
     wider struct than Ghidra's 7-byte auStack_110 array captured. That
     stack-adjacency trick doesn't carry over to this recompile, so
     local_114 would otherwise be read uninitialized. Ordinal_184 is
     implemented to always report success with a large local_118 value
     (see ordinal_stubs.c) -- initialize local_114 to match so the
     always-enough-disk-space intent holds regardless of real stack
     layout. */
  local_114 = 0;
  iVar3 = Ordinal_184(uVar4,0,auStack_110,&local_118);
  if ((iVar3 == 0) || ((local_114 == 0 && (local_118 < 0x9b0a0)))) {
    uVar4 = 0;
  }
  else {
    uVar4 = 1;
  }
  return uVar4;
}

