/* NPC melee combat AI: approach/engage/position/disengage tick states
 * and stance selection. Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed.
 */
#include "headers/combat.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

ushort DAT_00100610;
static undefined2 DAT_00100600;
static ushort DAT_00100604;
static short DAT_001005f4;
static short DAT_001005f8;
static char DAT_001005dc;
static undefined2 DAT_00100624;
static ushort DAT_00100620;
static byte DAT_00100628;
static undefined4 DAT_001005d8;
byte DAT_001005fc;
/* Original blood hit-zone heights at 0x84f18; the fifth entry is set at runtime. */
static char DAT_00084f18_backing[5] = {5, 3, 1, 7, 0};
#define DAT_00084f18 DAT_00084f18_backing[0]
#define DAT_00084f1c DAT_00084f18_backing[4]
/* Sizing-audit pass: was an independent 256-byte array, but both uses
   (`(&DAT_001007e0)[(uVar1&0x3f)*0x30]`, combat.c:1418/1433) index it
   by the same per-class monster-record base as ai.c's DAT_001007d0 --
   aliased into DAT_001007d0_backing in ai.h instead. */
static ushort DAT_00202d54;
undefined DAT_00202878;
/* Was a lone `undefined` scalar (1 byte), but tick_weapon_swing_state indexes it
   as `(&DAT_00084eff)[iVar5]` with iVar5 = the swing's own attack-type
   value (3-9, from interact_attack's screen-position-to-3x3-grid
   mapping -- this is the real "attack from top/left/right/bottom
   throws a different attack" mechanic the user reported as broken),
   and compute_player_weapon_attack_stats separately indexes it by the same attack-type value
   for a damage bonus lookup. A single byte can't hold 10 real,
   distinct per-direction values -- recovered the real content via
   Ghidra headless memory dump (0x84eff, 12 bytes -- Ghidra's own next
   symbol, DAT_00084f0b, starts exactly 12 bytes later, matching this
   project's usual "one lone scalar per real small table" pattern):
   00 02 02 02 00 00 00 01 01 01 00 00. Confirmed genuinely
   direction-sensitive data (not all-zero/all-same): indices 2-9 read
   00,02,02,02,00,00,00,01 -- real variation across the attack-type
   range, not the flat/garbage result a bare 1-byte read would produce
   once indexed past its own storage. */
unsigned char DAT_00084eff_backing[12] = {
  0x00,0x02,0x02,0x02,0x00,0x00,0x00,0x01,0x01,0x01,0x00,0x00
};
/* Was `undefined4` -- resolve_equipped_weapon_attack writes a real static-global address
   through this (via its own `int *param_1`, truncating with an
   explicit `(int)`/`(intptr_t)` cast at all 3 of its assignments), and
   tick_weapon_swing_state reads it back and dereferences it as a pointer
   (`*(byte*)(iVar5+3)` etc.) once the attack-swing state machine
   reaches its "resolve impact" phase (DAT_000870e4==3). Confirmed live:
   right-clicking to start an attack in Combat mode crashes a few ticks
   later, once the swing reaches that phase, dereferencing the
   truncated pointer. */
char *DAT_001005e4;
static char DAT_001005e0_backing[128];
char *DAT_001005e0 = DAT_001005e0_backing;
#define DAT_001007e1 DAT_001007d0_backing[0x11]
static char s__DATA_cmb_dat_00084f40[] = "\\DATA\\cmb.dat";
/* Sizing pass: units trap -- declared element type is undefined2 (2
   bytes), so [32768] was actually 65536 real bytes, not 32768. Its
   only use is `read_buffer_from_file(acStack_108,&DAT_00100630,0x3c)`
   -- exactly 0x3c (60) bytes read, so 32 elements (64 bytes) covers
   it with a little headroom. */
undefined2 DAT_00100630_backing[32];
ushort *DAT_0010190c;
undefined4 DAT_00101924;
/* Sizing-audit pass: pure scalar (combat-state flag) everywhere,
   including its one pointer-alias use in movement.c (still
   scalar-deref'd there) -- never indexed. Down from 256 elements. */
undefined4 DAT_00101734_backing[1];
#define DAT_00101734 DAT_00101734_backing[0]
char *DAT_00101404;
byte DAT_001013f8;
byte DAT_00101918;
int DAT_00101430;
byte DAT_0010140c;
short DAT_00101444; /* signed fine-coordinate delta; ARM reads 16 bits */
char DAT_00101408;
char DAT_00101410;
undefined1 DAT_00101420;
ushort DAT_00101900;
short DAT_00101448; /* signed fine-coordinate delta; ARM reads 16 bits */
char DAT_0010143c;
char DAT_0010173c;
char *DAT_00101400;
/* Was a bare scalar, but apply_equipment_degradation_message reads it
   through &DAT_00085a90 as a C string (the "was" half of the was/were
   pair right before it in memory, see s_were_00085a98 below) -- so the
   first byte being this port's always-zero default made it read as an
   empty string. Confirmed via a Ghidra memory dump of the real UU.exe:
   the actual bytes here are " was\0" (with the leading space the
   damaged/destroyed message depends on for spacing). */
static char DAT_00085a90[] = " was";
/* Was missing its leading space -- confirmed via the same memory dump
   that the real bytes are " were\0", not "were\0"; apply_equipment_
   degradation_message relies on that leading space the same way its
   sibling DAT_00085a90 above does. */
static char s_were_00085a98[] = " were";
/* Was a zero-initialized 32768-byte placeholder (oversized -- nothing
   else aliases into it and its only reader just copies it out as a
   plain null-terminated string, so it needs no more headroom than its
   own content). Confirmed via a Ghidra memory dump of the real UU.exe
   that the real bytes are "Your \0" -- this is the message's opening
   subject ("Your <item> was/were damaged/destroyed."), copied into a
   local buffer before the item's own display name is appended. */
static char DAT_00085aa0[] = "Your ";
/* Was missing its leading space and trailing newline -- confirmed via
   a Ghidra memory dump of the real UU.exe that the real bytes are
   " damaged.\n\0", matching the leading-space convention this whole
   was/were/damaged/destroyed cluster uses for inter-word spacing. */
static char s_damaged__00085aa8[] = " damaged.\n";
/* Same leading-space/trailing-newline fix as s_damaged__00085aa8 just
   above; real bytes confirmed " destroyed.\n\0". */
static char s_destroyed__00085ab4[] = " destroyed.\n";
static byte DAT_002046d8;
static byte DAT_002046dc;
static int DAT_002046e8;
static undefined1 DAT_002046e0;
static undefined1 DAT_002046e4;






// was FUN_0002f818 -- goal 3's main handler: distance-tiered response
// to a detected target (close: randomize stance; medium: walk toward
// the tracked target's own tile via npc_walk_toward_tile, i.e. chase;
// far: random-walk reposition + relink tilemap bucket)
void npc_combat_approach_tick()

{
  int uw_ord2005_rem_40 = 0;
  ushort uVar1;
  char cVar2;
  char cVar3;
  short sVar4;
  char *iVar5;
  byte *pbVar6;
  uint extraout_r1;
  uint uVar7;
  int iVar8;
  int iVar9;
  
  if (DAT_00101900 < 3) {
    if (DAT_00101734 != 0) {
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc1 | 1;
      iVar5 = DAT_0010190c;
      uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
      uw_ord2005_rem_40 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar7 = uVar1 & 0xfff;
      *(char *)(iVar5 + 0xb) = (char)uVar7;
      *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_40 & 0xf) << 0xc) >> 8)
      ;
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      uVar7 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar7 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
    }
  }
  else if (DAT_00101900 < 0x41) {
    if (DAT_00101734 != 0) {
      npc_walk_toward_tile(DAT_00101408,DAT_00101410,DAT_00101420);
    }
  }
  else {
    /* HACK: was a bare `integer_sqrt();` -- dropped argument, the same
       class of bug fixed repeatedly elsewhere in this file. No other
       distance value is computed in this branch to reuse, but
       DAT_00101444*DAT_00101444 + DAT_00101448*DAT_00101448 (dx*dx +
       dy*dy) is the canonical "distance squared" expression this
       exact file uses at every other integer_sqrt-shaped call site
       (see e.g. npc_combat_approach_tick's own sibling functions) --
       used here as the most defensible reconstruction, though not
       independently confirmed the way the tmap.c fix was. */
    sVar4 = integer_sqrt(DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448);
    cVar3 = DAT_00101918;
    iVar8 = (int)DAT_00101408;
    iVar5 = ordint_divmod((int)sVar4,
                         (((int)DAT_00101918 - (int)(short)DAT_00101408) * 0x10000 >> 0x10) << 2).quot;
    cVar2 = DAT_001013f8;
    iVar5 = ((int)iVar5 + (int)iVar8) * 0x1000000;
    iVar9 = (int)DAT_00101410;
    iVar8 = ordint_divmod((int)sVar4,
                         (((int)DAT_001013f8 - (int)(short)DAT_00101410) * 0x10000 >> 0x10) << 2).quot;
    iVar8 = (iVar8 + iVar9) * 0x1000000;
    {
      /* was folded into `int iVar9` (reused above as an unrelated int) --
         truncated tilemap_lookup's real `void *` return */
      char *_tile9 = (char *)tilemap_lookup(cVar3,cVar2);
      pbVar6 = (byte *)tilemap_lookup((int)(iVar5) >> 0x18,iVar8 >> 0x18);
      object_list_unlink(_tile9 + 2,DAT_0010190c);
      object_list_insert_head(pbVar6 + 2,DAT_0010190c);
    }
    uVar7 = *(ushort *)((char *)DAT_0010190c + 0x16) & 0x3ff;
    *(char *)((char *)DAT_0010190c + 0x16) = (char)uVar7;
    *(byte *)((char *)DAT_0010190c + 0x17) =
         (byte)(uVar7 >> 8) | (byte)((((int)(char)((uint)iVar5 >> 0x18) & 0x3fU) << 10) >> 8);
    uVar7 = *(ushort *)((char *)DAT_0010190c + 0x16) & 0xfc0f |
            ((int)(char)((uint)iVar8 >> 0x18) & 0x3fU) << 4;
    *(char *)((char *)DAT_0010190c + 0x16) = (char)uVar7;
    *(char *)((char *)DAT_0010190c + 0x17) = (char)(uVar7 >> 8);
    uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0x1fff;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
    *(byte *)((char *)DAT_0010190c + 3) = (byte)(uVar7 >> 8) | 0x80;
    uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xf3ff;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar7;
    *(byte *)((char *)DAT_0010190c + 3) = (byte)(uVar7 >> 8) | 0x10;
    uVar7 = *(ushort *)((char *)DAT_0010190c + 2) & 0xff80;
    *(byte *)((char *)DAT_0010190c + 2) = *pbVar6 >> 1 & 0x78 | (byte)uVar7;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
  }
  return;
}




// was FUN_0002ff94 -- goal 5: attacks (npc_combat_set_stance) if
// within dist^2<100 (~10 tiles) of the tracked target or already at
// its tile, else picks a sub-goal (try_npc_special_ability_alt/
// try_npc_special_ability_no_los/try_npc_special_ability_ranged)
void npc_combat_engage_close_tick()

{
  int uw_ord2005_rem_46 = 0;
  char cVar1;
  uint extraout_r1;
  char cVar2;
  byte bVar3;
  ushort uVar4;
  uint uVar5;
  char *iVar6;
  bool bVar7;
  undefined1 local_28;
  
  iVar6 = 0;
  local_28 = 4;
  if (DAT_00101734 == 0) {
    return;
  }
  if (DAT_00201b68 == 7) {
    uVar5 = (*(byte *)(DAT_00086df8 + 0x60) & 0x20) << 8;
    bVar7 = (*(byte *)(DAT_00086df8 + 0x60) & 0x20) == 0;
    if (bVar7) {
      uVar5 = (uint)*(byte *)(DAT_00101404 + 9);
    }
    if (bVar7 && uVar5 == 0x13) {
      local_28 = 1;
    }
  }
  uVar4 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
  cVar2 = DAT_0010143c - DAT_00101918;
  cVar1 = DAT_0010173c - DAT_001013f8;
  if ((*(ushort *)((char *)DAT_0010190c + 0xb) & 0xff0) == 0x10) {
    uVar5 = *(ushort *)((char *)DAT_0010190c + 0xd) & 0x3fff;
    *(char *)((char *)DAT_0010190c + 0xd) = (char)uVar5;
    *(char *)((char *)DAT_0010190c + 0xe) = (char)(uVar5 >> 8);
  }
  if (((uVar4 < 100) || ((DAT_00101918 == DAT_00101408 && (DAT_001013f8 == DAT_00101410)))) &&
     ((uVar5 = (int)DAT_0010140c - (int)DAT_00101420 >> 0x1f,
      (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar5) - uVar5) < 4 ||
      ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0)))) {
    /* ARM 0x301f4 passes the fine-coordinate squared distance in r0. */
    npc_combat_set_stance(uVar4);
  }
  else if ((*(byte *)(DAT_00101404 + 0x2d) & 0xfe) == 0) {
    if ((*(byte *)(DAT_00101404 + 0x20) >> 1 & 0xf0) != 0x10) goto LAB_000302bc;
    iVar6 = try_npc_special_ability_alt();
  }
  else {
    iVar6 = try_npc_special_ability_no_los();
    if ((iVar6 != 0) || ((*(byte *)(DAT_00101404 + 0x2d) & 1) == 0)) goto LAB_000302bc;
    iVar6 = try_npc_special_ability_ranged();
  }
  if (iVar6 != 0) {
    bVar3 = *(byte *)((char *)DAT_0010190c + 0x15) & 0x3f;
    if (bVar3 == 5) {
      return;
    }
    if (bVar3 == 0xd) {
      return;
    }
    if (bVar3 == 1) {
      return;
    }
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
    *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
    iVar6 = (char *)DAT_0010190c;
    uVar4 = *(ushort *)((char *)DAT_0010190c + 0xb);
    uw_ord2005_rem_46 = ((int)((uVar4 >> 0xc) + 1)) % (4);
    uVar5 = uVar4 & 0xfff;
    *(char *)(iVar6 + 0xb) = (char)uVar5;
    *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_46 & 0xf) << 0xc) >> 8);
    *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
    return;
  }
LAB_000302bc:
  if ((((uVar4 < 0x101) || ((*(byte *)((char *)DAT_0010190c + 0xd) & 0xf) != 4)) ||
      ((*(byte *)((char *)DAT_0010190c + 0x19) & 0x20) != 0)) ||
     (uVar4 = (ushort)(*(byte *)(DAT_00101404 + 0x1c) >> 4),
     (ushort)((short)cVar2 * (short)cVar2 + (short)cVar1 * (short)cVar1) <=
     (ushort)(uVar4 * uVar4 * 4))) {
    if ((*(byte *)(DAT_00101404 + 0x2d) & 1) == 0) {
      local_28 = 1;
    }
    npc_wander_reposition(DAT_00101408,DAT_00101410,local_28);
  }
  else {
    *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfe;
    *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xfd;
    npc_set_goal(4,0);
  }
  return;
}



// was FUN_00030364 -- the shared attack/stance action called by every
// combat-engage goal handler once in range: sets combat-ready frame
// bits (byte 0x13/9/0x15) based on param_1, squared fine-coordinate distance
undefined4 npc_combat_set_stance(param_1)
ushort param_1;

{
  int uw_ord2005_rem_47 = 0; int uw_ord2005_rem_48 = 0; int uw_ord2005_rem_49 = 0; int uw_ord2005_rem_50 = 0; int uw_ord2005_rem_51 = 0; int uw_ord2005_rem_52 = 0; int uw_ord2005_rem_53 = 0; int uw_ord2005_rem_54 = 0; int uw_ord2005_rem_55 = 0; int uw_ord2005_rem_56 = 0;
  undefined1 uVar1;
  ushort uVar2;
  byte bVar3;
  uint uVar4;
  undefined4 uVar5;
  char extraout_r1;
  short extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int extraout_r1_03;
  int extraout_r1_04;
  int extraout_r1_05;
  int extraout_r1_06;
  int extraout_r1_07;
  char *iVar6;
  uint extraout_r1_08;
  int iVar7;
  byte bVar8;
  uint uVar9;
  
  /* ARM ldrb/strb offsets are bytes, including the unaligned goal word.
     DAT_0010190c is ushort *, so cast before applying those offsets. */
  uVar4 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar9 = uVar4 & 0xff;
  uVar4 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar4 & 7) << 7;
  *(char *)((char *)DAT_0010190c + 2) = (char)uVar4;
  *(char *)((char *)DAT_0010190c + 3) = (char)(uVar4 >> 8);
  *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
  uVar1 = (undefined1)(uVar9 << 5);
  *(undefined1 *)((char *)DAT_0010190c + 9) = uVar1;
  *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xbf;
  if (param_1 < 0x31) {
    uVar5 = ce_rand();
    uw_ord2005_rem_47 = ((int)(uVar5)) % (4);
    if (uw_ord2005_rem_47 != 0) {
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 199 | 7;
      uw_ord2005_rem_48 = ((int)(uVar9 + 4)) % (8);
      *(char *)((char *)DAT_0010190c + 9) = (char)(uw_ord2005_rem_48 << 5);
LAB_00030534:
      bVar8 = *(byte *)((char *)DAT_0010190c + 0x13) & 0x82 | 2;
      goto LAB_000305e4;
    }
    uVar5 = ce_rand();
    *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
    uw_ord2005_rem_49 = ((int)(uVar5)) % (2);
    uw_ord2005_rem_50 = ((int)(uVar9 + uw_ord2005_rem_49 * 4 + 6)) % (8);
    *(char *)((char *)DAT_0010190c + 9) = (char)(uw_ord2005_rem_50 << 5);
    iVar6 = (char *)DAT_0010190c;
    bVar8 = *(byte *)((char *)DAT_0010190c + 0x13);
    bVar3 = ordint_divmod(3,(uint)*(byte *)(DAT_00101404 + 0xb) << 1).quot;
    *(byte *)(iVar6 + 0x13) = (bVar3 ^ bVar8) & 0x7f ^ bVar8;
  }
  else {
    if (0x51 < param_1) {
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xec | 0x2c;
      *(undefined1 *)((char *)DAT_0010190c + 9) = uVar1;
      goto LAB_00030534;
    }
    uVar5 = ce_rand();
    bVar8 = *(byte *)(DAT_00101404 + 6);
    uw_ord2005_rem_51 = ((int)(uVar5)) % (0x40);
    if (uw_ord2005_rem_51 < (int)(uint)bVar8) {
      uVar5 = ce_rand();
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
      uw_ord2005_rem_52 = ((int)(uVar5)) % (8);
      *(char *)((char *)DAT_0010190c + 9) = (char)(uw_ord2005_rem_52 << 5);
      bVar8 = *(byte *)((char *)DAT_0010190c + 0x13) & 0x81 | 1;
    }
    else {
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
      *(undefined1 *)((char *)DAT_0010190c + 9) = uVar1;
      bVar8 = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
    }
LAB_000305e4:
    *(byte *)((char *)DAT_0010190c + 0x13) = bVar8;
  }
  if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
    iVar6 = (int)((((*(byte *)(DAT_00101400 + 2) & 0x7f) - (*(byte *)((char *)DAT_0010190c + 2) & 0x7f)) +
                  0xe) * 0x1000000) >> 0x18;
    if (iVar6 < 2) {
      if (iVar6 < -1) {
        bVar8 = *(byte *)((char *)DAT_0010190c + 0x14) & 7 | 0x70;
      }
      else {
        uVar5 = ce_rand();
        uw_ord2005_rem_53 = ((int)(uVar5)) % (3);
        bVar8 = *(byte *)((char *)DAT_0010190c + 0x14) & 7 ^ (uw_ord2005_rem_53 + '\x0f') * '\b';
      }
    }
    else {
      bVar8 = *(byte *)((char *)DAT_0010190c + 0x14) & 7 | 0x90;
    }
    *(byte *)((char *)DAT_0010190c + 0x14) = bVar8;
  }
  if (param_1 < 0x65) {
    uVar5 = ce_rand();
    uw_ord2005_rem_54 = ((int)(uVar5)) % (4);
    if (uw_ord2005_rem_54 == 0) {
      uVar5 = ce_rand();
      uw_ord2005_rem_55 = ((int)(uVar5)) % (100);
      iVar6 = (int)uw_ord2005_rem_55;
      iVar7 = 0;
      if ((int)(uint)*(byte *)(DAT_00101404 + 0x15) <= iVar6) {
        do {
          if (1 < iVar7) break;
          iVar6 = iVar6 - (uint)*(byte *)(iVar7 * 3 + DAT_00101404 + 0x15);
          iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
        } while ((int)(uint)*(byte *)(iVar7 * 3 + DAT_00101404 + 0x15) <= (int)(iVar6) * 0x10000 >> 0x10);
      }
      *(byte *)((char *)DAT_0010190c + 0x15) =
           ((char)iVar7 + 1U ^ *(byte *)((char *)DAT_0010190c + 0x15)) & 0x3f ^
           *(byte *)((char *)DAT_0010190c + 0x15);
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
      uVar4 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar4;
      goto LAB_00030860;
    }
    uVar4 = (uint)*(ushort *)((char *)DAT_0010190c + 0xf);
    if ((uVar4 & 0xf000) < 0xf000) {
      *(char *)((char *)DAT_0010190c + 0xf) = (char)(uVar4 & 0xfff);
      *(byte *)((char *)DAT_0010190c + 0x10) =
           (byte)((uVar4 & 0xf000) + 0x1000 >> 8) ^ (byte)((uVar4 & 0xfff) >> 8);
    }
  }
  *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
  iVar6 = (char *)DAT_0010190c;
  uVar2 = *(ushort *)((char *)DAT_0010190c + 0xb);
  uw_ord2005_rem_56 = ((int)((uVar2 >> 0xc) + 1)) % (4);
  uVar9 = uVar2 & 0xfff;
  uVar4 = uVar9 | (uw_ord2005_rem_56 & 0xf) << 0xc;
  *(char *)(iVar6 + 0xb) = (char)uVar9;
LAB_00030860:
  *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar4 >> 8);
  return 1;
}




// was FUN_00030fe8 -- goal 9: same shape as npc_combat_engage_close_tick
// but a wider dist^2<0x90 (~12 tile) engage radius; otherwise positions
// via npc_combat_position_tick or picks a sub-goal
void npc_combat_engage_wide_tick()

{
  int uw_ord2005_rem_63 = 0;
  ushort uVar1;
  ushort distance_squared;
  char *iVar2;
  uint uVar3;
  uint extraout_r1;
  
  if (DAT_00101734 != 0) {
    distance_squared = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
    if ((distance_squared < 0x90) ||
       ((DAT_00101408 == DAT_00101918 && (DAT_001013f8 == DAT_00101410)))) {
      /* ARM 0x3120c retains the squared distance in r0 from 0x31034. */
      npc_combat_set_stance(distance_squared);
    }
    else if (DAT_00101900 < 5) {
      uVar3 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      *(char *)((char *)DAT_0010190c + 9) = (char)((uVar3 & 0xff) << 5);
      uVar3 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar3 & 7) << 7;
      *(char *)((char *)DAT_0010190c + 2) = (char)uVar3;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar3 >> 8);
      *(byte *)((char *)DAT_0010190c + 0x18) = *(byte *)((char *)DAT_0010190c + 0x18) & 0xe0;
      *(byte *)((char *)DAT_0010190c + 0x14) = *(byte *)((char *)DAT_0010190c + 0x14) & 0xfc | 4;
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc0;
      iVar2 = (char *)DAT_0010190c;
      uVar1 = *(ushort *)((char *)DAT_0010190c + 0xb);
      uw_ord2005_rem_63 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar3 = uVar1 & 0xfff;
      *(char *)(iVar2 + 0xb) = (char)uVar3;
      *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(uVar3 >> 8) | (byte)(((uw_ord2005_rem_63 & 0xf) << 0xc) >> 8)
      ;
    }
    else {
      iVar2 = try_npc_special_ability_no_los();
      if (iVar2 == 0) {
        if ((*(byte *)(DAT_00101404 + 0x2d) & 0xfe) == 0) {
          if ((*(byte *)(DAT_00101404 + 0x20) >> 1 & 0xf0) == 0x10) {
            try_npc_special_ability_alt();
          }
          else {
            npc_combat_position_tick();
          }
        }
        else {
          try_npc_special_ability_ranged();
        }
      }
    }
  }
  return;
}



// WARNING: Removing unreachable block (ram,0x000314a0)

// was FUN_00031214 -- goal 6, also called as a sub-step from the
// combat-engage handlers: fine facing/frame adjustment relative to
// the target's heading and distance (flanking/circling in melee range)
void npc_combat_position_tick()

{
  int uw_ord2005_rem_64 = 0; int uw_ord2005_rem_65 = 0; int uw_ord2005_rem_66 = 0; int uw_ord2005_rem_67 = 0; int uw_ord2005_rem_68 = 0; int uw_ord2005_rem_69 = 0; int uw_ord2005_rem_70 = 0; int uw_ord2005_rem_71 = 0; int uw_ord2005_rem_72 = 0; int uw_ord2005_rem_73 = 0; int uw_ord2005_rem_74 = 0; int uw_ord2005_rem_75 = 0; int uw_ord2005_rem_76 = 0;
  uint uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  uint extraout_r1;
  uint extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint extraout_r1_04;
  int extraout_r1_05;
  int extraout_r1_06;
  int extraout_r1_07;
  uint extraout_r1_08;
  int extraout_r1_09;
  uint extraout_r1_10;
  uint extraout_r1_11;
  byte bVar4;
  byte bVar5;
  ushort uVar6;
  char *iVar7;
  uint uVar8;
  
  if (DAT_00101734 == 0) {
    return;
  }
  uVar1 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar6 = *(ushort *)(DAT_0010190c + 2);
  bVar4 = *(byte *)(DAT_00101400 + 2);
  if ((*(byte *)(DAT_00101404 + 10) & 0x80) != 0) {
    if ((uVar6 & 0x7f) < 0x6f) {
      uVar2 = ce_rand();
      uw_ord2005_rem_64 = ((int)(uVar2)) % (5);
      iVar7 = (uw_ord2005_rem_64 & 0xff) + 0xf;
    }
    else {
      uVar2 = ce_rand();
      uw_ord2005_rem_65 = ((int)(uVar2)) % (5);
      iVar7 = (uw_ord2005_rem_65 & 0xff) + 0xd;
    }
    *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 7 ^ (byte)((int)(iVar7) << 3);
  }
  if ((DAT_00101900 < 4) &&
     (iVar7 = ((bVar4 & 0x7f) - (uVar6 & 0x7f)) * 0x1000000, uVar8 = (int)(iVar7) >> 0x1f,
     (int)(((int)(iVar7) >> 0x18 ^ uVar8) - uVar8) < 0x10)) {
    uVar2 = ce_rand();
    bVar4 = *(byte *)(DAT_00101404 + 0x1c);
    uw_ord2005_rem_66 = ((int)(uVar2)) % (0x100);
    if (((int)(bVar4 >> 3 & 1) <= uw_ord2005_rem_66) && ((DAT_00101924 == 0 || (DAT_00101430 != 0)))) {
      uw_ord2005_rem_67 = ((int)((uVar1 & 0xff) + 4)) % (8);
      *(char *)(DAT_0010190c + 9) = (char)(uw_ord2005_rem_67 << 5);
      uVar1 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 7) << 7;
      *(char *)(DAT_0010190c + 2) = (char)uVar1;
      *(char *)(DAT_0010190c + 3) = (char)(uVar1 >> 8);
      *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 199 | 7;
      iVar7 = DAT_0010190c;
      uVar6 = *(ushort *)(DAT_0010190c + 0xb);
      uw_ord2005_rem_68 = ((int)((uVar6 >> 0xc) + 1)) % (4);
      uVar1 = uVar6 & 0xfff;
      *(char *)(iVar7 + 0xb) = (char)uVar1;
      *(byte *)(DAT_0010190c + 0xc) =
           (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_68 & 0xf) << 0xc) >> 8);
      *(byte *)(DAT_0010190c + 0x13) =
           ((byte)((int)(*(byte *)(DAT_00101404 + 0xb) + 1) >> 1) ^ *(byte *)(DAT_0010190c + 0x13))
           & 0x7f ^ *(byte *)(DAT_0010190c + 0x13);
      return;
    }
LAB_000314d0:
    *(byte *)(DAT_0010190c + 0x19) = *(byte *)(DAT_0010190c + 0x19) | 0x10;
    npc_set_goal(9,*(ushort *)(DAT_0010190c + 0xb) >> 4 & 0xff);
  }
  else {
    if ((DAT_00101924 == 0) || (DAT_00101430 != 0)) {
      iVar7 = try_npc_special_ability_no_los();
      if (iVar7 != 0) {
        return;
      }
      uVar2 = ce_rand();
      bVar4 = *(byte *)(DAT_00101404 + 0x1f);
      uw_ord2005_rem_69 = ((int)(uVar2)) % (0x40);
      if ((uw_ord2005_rem_69 & 0xff) < (bVar4 & 0xf) + 8) {
        uVar2 = ce_rand();
        iVar7 = DAT_0010190c;
        bVar4 = *(byte *)(DAT_0010190c + 9);
        uw_ord2005_rem_70 = ((int)(uVar2)) % (0x40);
        uw_ord2005_rem_71 = ((int)(uw_ord2005_rem_70 + (uint)bVar4 + 0xe0)) % (0x100);
        uVar1 = uw_ord2005_rem_71 & 0xff;
      }
      else {
        uVar1 = (uint)*(byte *)(DAT_0010190c + 9);
        iVar7 = DAT_0010190c;
      }
      if (DAT_00101430 == 0) {
        uVar1 = adjust_heading_away_from_player(uVar1,0x18);
        iVar7 = DAT_0010190c;
      }
      *(byte *)(iVar7 + 9) = (byte)uVar1;
      uVar8 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 0xe0) << 2;
      *(char *)(DAT_0010190c + 2) = (char)uVar8;
      *(char *)(DAT_0010190c + 3) = (char)(uVar8 >> 8);
      bVar4 = *(byte *)(DAT_0010190c + 0x18);
      bVar5 = bVar4 ^ (byte)uVar1;
    }
    else {
      if (DAT_00101900 < 9) {
        if ((*(byte *)(DAT_0010190c + 0xb) & 0xf) == 9) {
          *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
          *(char *)(DAT_0010190c + 9) = (char)((uVar1 & 0xff) << 5);
          uVar1 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 7) << 7;
          *(char *)(DAT_0010190c + 2) = (char)uVar1;
          *(char *)(DAT_0010190c + 3) = (char)(uVar1 >> 8);
          *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
          *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
          *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xc0;
          iVar7 = DAT_0010190c;
          uVar6 = *(ushort *)(DAT_0010190c + 0xb);
          uw_ord2005_rem_72 = ((int)((uVar6 >> 0xc) + 1)) % (4);
          uVar1 = uVar6 & 0xfff;
          *(char *)(iVar7 + 0xb) = (char)uVar1;
          *(byte *)(DAT_0010190c + 0xc) =
               (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_72 & 0xf) << 0xc) >> 8);
          return;
        }
        goto LAB_000314d0;
      }
      uVar2 = ce_rand();
      uVar3 = ce_rand();
      iVar7 = DAT_0010190c;
      bVar4 = *(byte *)(DAT_0010190c + 9);
      uw_ord2005_rem_73 = ((int)(uVar2)) % (2);
      uw_ord2005_rem_74 = ((int)((uint)(bVar4 >> 5) + uw_ord2005_rem_73 * 4 + 6)) % (8);
      uw_ord2005_rem_75 = ((int)(uVar3)) % (0x20);
      uVar1 = uw_ord2005_rem_74 + uw_ord2005_rem_75 * 0x20;
      bVar5 = (byte)uVar1;
      *(byte *)(iVar7 + 9) = bVar5;
      uVar1 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar1 & 0xe0) << 2;
      *(char *)(DAT_0010190c + 2) = (char)uVar1;
      *(char *)(DAT_0010190c + 3) = (char)(uVar1 >> 8);
      bVar4 = *(byte *)(DAT_0010190c + 0x18);
      bVar5 = bVar5 ^ bVar4;
    }
    *(byte *)(DAT_0010190c + 0x18) = bVar5 & 0x1f ^ bVar4;
    uVar6 = DAT_00101900;
    if (DAT_00101900 < 0x40) {
      uVar6 = (ushort)*(byte *)(DAT_00101404 + 0xc);
    }
    bVar4 = (byte)uVar6;
    if (DAT_00101900 >= 0x40) {
      bVar4 = *(byte *)(DAT_00101404 + 0xb);
    }
    *(byte *)(DAT_0010190c + 0x13) =
         (*(byte *)(DAT_0010190c + 0x13) ^ bVar4) & 0x7f ^ *(byte *)(DAT_0010190c + 0x13);
    *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xec | 0x2c;
    iVar7 = DAT_0010190c;
    uVar6 = *(ushort *)(DAT_0010190c + 0xb);
    uw_ord2005_rem_76 = ((int)((uVar6 >> 0xc) + 1)) % (4);
    uVar1 = uVar6 & 0xfff;
    *(char *)(iVar7 + 0xb) = (char)uVar1;
    *(byte *)(DAT_0010190c + 0xc) =
         (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_76 & 0xf) << 0xc) >> 8);
    *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfc | 4;
  }
  return;
}




// was FUN_00031a94 -- goal 10: checks line-of-sight/distance
// (detect_npc_wander_proximity, dist^2>399); if lost, reverts straight to idle state
// 0x20, otherwise continues closing on the target
void npc_combat_disengage_tick()

{
  int uw_ord2005_rem_77 = 0; int uw_ord2005_rem_78 = 0; int uw_ord2005_rem_79 = 0; int uw_ord2005_rem_80 = 0; int uw_ord2005_rem_81 = 0;
  ushort uVar1;
  char *iVar2;
  char cVar3;
  undefined4 uVar4;
  char extraout_r1;
  int extraout_r1_00;
  uint extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint uVar5;
  ushort uVar6;
  uint uVar7;
  undefined1 uStack_1c;
  undefined1 auStack_1b [3];
  
  if (DAT_00101734 != 0) {
    uVar7 = *(ushort *)(DAT_0010190c + 0xb) & 0xf01f;
    *(byte *)(DAT_0010190c + 0xb) = (byte)uVar7 | 0x10;
    *(char *)(DAT_0010190c + 0xc) = (char)(uVar7 >> 8);
    refresh_npc_target_delta();
    uVar6 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
    cVar3 = detect_npc_wander_proximity(auStack_1b,&uStack_1c);
    if ((cVar3 == '\x01') || (399 < uVar6)) {
      *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfe | 6;
      *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xe0 | 0x20;
      uVar4 = ce_rand();
      uw_ord2005_rem_77 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_77 != 0) {
        uVar6 = *(ushort *)(DAT_0010190c + 0xb);
        uw_ord2005_rem_78 = ((int)((uVar6 >> 0xc) + 1)) % (4);
        uVar7 = uVar6 & 0xfff;
        *(char *)(iVar2 + 0xb) = (char)uVar7;
        *(byte *)(DAT_0010190c + 0xc) =
             (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_78 & 0xf) << 0xc) >> 8);
      }
    }
    else {
      uVar7 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      *(byte *)(DAT_0010190c + 0x13) = *(byte *)(DAT_0010190c + 0x13) & 0x80;
      *(byte *)(DAT_0010190c + 0x15) = *(byte *)(DAT_0010190c + 0x15) & 0xe0 | 0x20;
      *(byte *)(DAT_0010190c + 0x14) = *(byte *)(DAT_0010190c + 0x14) & 0xfe | 6;
      uVar4 = ce_rand();
      uw_ord2005_rem_79 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_79 != 0) {
        uVar1 = *(ushort *)(DAT_0010190c + 0xb);
        uw_ord2005_rem_80 = ((int)((uVar1 >> 0xc) + 1)) % (4);
        uVar5 = uVar1 & 0xfff;
        *(char *)(iVar2 + 0xb) = (char)uVar5;
        *(byte *)(DAT_0010190c + 0xc) =
             (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_80 & 0xf) << 0xc) >> 8);
      }
      *(char *)(DAT_0010190c + 9) = (char)((uVar7 & 0xff) << 5);
      uVar5 = *(ushort *)(DAT_0010190c + 2) & 0xfc7f | (uVar7 & 7) << 7;
      *(char *)(DAT_0010190c + 2) = (char)uVar5;
      *(char *)(DAT_0010190c + 3) = (char)(uVar5 >> 8);
      *(byte *)(DAT_0010190c + 0x18) = *(byte *)(DAT_0010190c + 0x18) & 0xe0;
      if (uVar6 < 0x90) {
        uw_ord2005_rem_81 = ((int)((((uw_mobile_object_t *)g_player_object)->hdr.heading - (uVar7 & 0xff)) + 8)) % (8);
        if (('\x02' < uw_ord2005_rem_81) && (uw_ord2005_rem_81 < '\x06')) {
          DAT_0023bf0c = 0;
          reset_cursor_confine_rect();
          attempt_talk_interaction(DAT_0010190c);
        }
      }
    }
  }
  return;
}



// was FUN_00025a98 -- part of the combat hit-test flow (called from
// resolve_melee_swing_hit's own "[hit-test]" trace): given a
// target's hit-zone span [param_1,param_2] and an impact span
// [param_3,param_4], compares the impact midpoint against the target
// span (with a chance-based fallback the closer the two overlap) and
// returns a small 0-3 result selecting which hit zone/outcome was
// struck. The exact real-world meaning of each of the 4 return values
// isn't otherwise confirmed.
undefined4 resolve_combat_hit_zone(param_1,param_2,param_3,param_4)
short param_1;
short param_2;
short param_3;
short param_4;

{
  int uw_ord2005_rem_3 = 0; int uw_ord2005_rem_4 = 0; int uw_ord2005_rem_5 = 0;
  int iVar1;
  undefined4 uVar2;
  int extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  
  iVar1 = (int)(short)((int)param_3 + (int)param_4 >> 1);
  if (iVar1 < param_1 + 1) {
    return 2;
  }
  if (param_2 + -1 < iVar1) {
LAB_00025aec:
    uVar2 = 3;
  }
  else {
    if (iVar1 < (short)((int)param_2 + (int)param_1 >> 1)) {
      uVar2 = ce_rand();
      uw_ord2005_rem_3 = ((int)(uVar2)) % (2);
      if (uw_ord2005_rem_3 != 0) {
        return 2;
      }
    }
    else {
      uVar2 = ce_rand();
      uw_ord2005_rem_4 = ((int)(uVar2)) % (3);
      if (uw_ord2005_rem_4 == 0) goto LAB_00025aec;
    }
    uVar2 = ce_rand();
    uw_ord2005_rem_5 = ((int)(uVar2)) % (3);
    uVar2 = 0;
    if (uw_ord2005_rem_5 == 0) {
      uVar2 = 1;
    }
  }
  return uVar2;
}



// was FUN_00025b84 -- part of the combat hit-test flow: scans nearby
// object records (&DAT_00202c3a family) for the one closest, in
// projected screen space, to a target ray/point described by param_1,
// tracking the minimum squared screen-space distance and returning that
// candidate's index (or -1 if none matched). Also leaves the resolved
// screen coordinates in DAT_00100600/DAT_00100604 as a side effect,
// which resolve_combat_hit_zone's caller reads afterward.
int find_nearest_hit_target(param_1)
short * param_1;

{
  byte bVar1;
  char cVar2;
  ushort uVar3;
  ushort uVar4;
  int iVar5;
  char *pcAttacker;
  ushort *puVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  short local_34;
  short local_32;
  
  cVar2 = (char)param_1[0xb];
  iVar12 = -1;
  local_32 = -1;
  iVar11 = 100000;
  local_34 = (short)cVar2;
  iVar9 = (int)(((int)cVar2 + (uint)*(byte *)((char *)param_1 + 0x15)) * 0x10000) >> 0x10;
  iVar10 = (int)(short)cVar2;
  /* ARM 0x25bdc..0x25bf4 retains the attacker record as a pointer. */
  pcAttacker = (short)DAT_00100610 * 0x1b + DAT_002046b8;
  uVar3 = *(ushort *)(pcAttacker + 0x16);
  bVar1 = *(byte *)(pcAttacker + 3);
  if (iVar10 < iVar9) {
    do {
      uVar4 = *(ushort *)(&DAT_00202c3a + iVar10 * 6);
      /* BUG FIX (unit-testing-framework): was called bare -- dropped
         argument. ARM 0x25c84..0x25c8c passes the candidate link's slot
         index, confirmed by the identical `uVar4 >> 6` value used right
         below in this same loop. Same dropped-argument idiom fixed
         repeatedly elsewhere in this project. */
      puVar6 = (ushort *)get_object_record_by_slot_index(uVar4 >> 6);
      if ((((*puVar6 & 0x1c0) != 0x180) && (uVar4 >> 6 != DAT_00100610)) &&
         (((DAT_00100610 != 1 ||
           ((iVar5 = object_ptr_in_arena(puVar6), iVar5 == 0 ||
            ((*(byte *)((char *)puVar6 + 0x19) & 0x40) == 0)))) ||
          ((iVar10 == iVar9 + -1 && (iVar11 == 100000)))))) {
        uVar7 = (int)*(short *)(&DAT_00202c3c + iVar10 * 6) + (((int)*param_1 << 0x10) >> 0x13) &
                0x3f;
        DAT_00100600 = (undefined2)uVar7;
        iVar5 = (int)*(short *)(&DAT_00202c3c + iVar10 * 6) -
                ((int)((uVar7 - (((int)*param_1 << 0x10) >> 0x13)) * 0x10000) >> 0x10);
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0x3f;
        }
        uVar8 = (int)(short)(iVar5 >> 6) + (((int)param_1[1] << 0x10) >> 0x13) & 0x3f;
        DAT_00100604 = (ushort)uVar8;
        iVar5 = (int)(((uVar7 * -8 - (uint)(*(byte *)((char *)puVar6 + 3) >> 5)) +
                      (int)(short)((uVar3 >> 7 & 0x1f8) + (ushort)(bVar1 >> 5))) * 0x10000) >> 0x10;
        iVar12 = (int)(((uVar8 * -8 - ((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2)) +
                       (int)(short)((uVar3 >> 1 & 0x1f8) + (short)((bVar1 & 0x1c) >> 2))) * 0x10000)
                 >> 0x10;
        iVar5 = iVar5 * iVar5 + iVar12 * iVar12;
        if (iVar5 < iVar11) {
          local_32 = local_34;
          iVar11 = iVar5;
        }
      }
      iVar5 = (iVar10 + 1) * 0x10000;
      iVar10 = iVar5 >> 0x10;
      local_34 = (short)((uint)iVar5 >> 0x10);
    } while (iVar10 < iVar9);
    iVar12 = (int)local_32;
  }
  if (-1 < (short)iVar12) {
    uVar7 = (int)*(short *)(&DAT_00202c3c + (short)iVar12 * 6) + (((int)*param_1 << 0x10) >> 0x13) &
            0x3f;
    DAT_00100600 = (undefined2)uVar7;
    iVar9 = (int)*(short *)(&DAT_00202c3c + (short)iVar12 * 6) -
            ((int)((uVar7 - (((int)*param_1 << 0x10) >> 0x13)) * 0x10000) >> 0x10);
    if (iVar9 < 0) {
      iVar9 = iVar9 + 0x3f;
    }
    DAT_00100604 = (short)(iVar9 >> 6) + (param_1[1] >> 3) & 0x3f;
  }
  return iVar12;
}



// was FUN_00025ed8 -- part of the combat hit-test flow (own
// "[blood-splat]" trace): walks outward from the impact point along
// param_1's heading until it finds a floor/ceiling boundary, then spawns
// a blood-splat decal object (id 0x1cb) there, schedules its later
// cleanup (scheduler_add_entry), and appends it into the target tile's
// object list.
void spawn_blood_splat_object(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
byte * param_3;

{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  char *iVar7;  /* was `int` -- truncated spawn_new_object's real object
                   pointer, latent while that function always returned 0 */
  undefined4 uVar8;
  char *iVar9;  /* was `int` -- truncated tilemap_lookup's real `void *`
                   return (same class as iVar7 above and this whole
                   file's dominant bug). Latent for a long time since
                   this whole "resolve impact" swing code path was
                   unreachable until a separate signedness bug on
                   DAT_0010062c was fixed -- confirmed crashing
                   (EXC_BAD_ACCESS in object_list_append_tail,
                   dereferencing the truncated `iVar9 + 2` as a wild
                   32-bit address) the first time a real attack swing
                   ever reached this far. */
  uint uVar10;
  short local_18;
  short local_16;

  param_2 = param_2 + 1;
  DAT_00202c6c = param_3;
  param_3[8] = 1;
  DAT_00202c6c[10] = 0;
  DAT_00202c6c[0xb] = 0;
  local_18 = (short)((uint)((int)*(short *)DAT_00202c6c << 0x14) >> 0x10);
  local_16 = (short)((uint)((int)*(short *)(DAT_00202c6c + 2) << 0x14) >> 0x10);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object ENTRY param_1=%d param_2=%d\n", (int)param_1, param_2);
  while (collision_build_height_field(0),
        ((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
    project_position_by_heading(param_1,0x10,&local_18,&local_16);
    param_2 = param_2 + -1;
    *DAT_00202c6c = (byte)((int)local_18 >> 4);
    DAT_00202c6c[1] = (byte)((uint)((int)local_18 >> 4) >> 8);
    DAT_00202c6c[2] = (byte)((int)local_16 >> 4);
    DAT_00202c6c[3] = (byte)((uint)((int)local_16 >> 4) >> 8);
    if (param_2 * 0x10000 >> 0x10 < 1) {
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: no floor/ceiling boundary found within range, bailing\n");
      return;
    }
  }
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: spawning object 0x1cb\n");
  iVar7 = (char *)spawn_new_object(0x1cb,0);
  if (iVar7 == (char *)0x0) {
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: spawn_new_object FAILED (returned NULL)\n");
    return;
  }
  uVar3 = *(ushort *)(iVar7 + 2);
  uVar10 = uVar3 & 0x1fff;
  bVar1 = (byte)(((*DAT_00202c6c & 7) << 0xd) >> 8);
  *(char *)(iVar7 + 2) = (char)uVar10;
  *(byte *)(iVar7 + 3) = (byte)(uVar10 >> 8) | bVar1;
  uVar10 = uVar3 & 0x3ff;
  bVar1 = (byte)(uVar10 >> 8) | bVar1 | (byte)(((DAT_00202c6c[2] & 7) << 10) >> 8);
  bVar2 = (byte)uVar10;
  *(byte *)(iVar7 + 2) = bVar2;
  *(byte *)(iVar7 + 3) = bVar1;
  sVar4 = *(short *)DAT_00202c6c;
  sVar5 = *(short *)(DAT_00202c6c + 2);
  *(byte *)(iVar7 + 2) = (DAT_00202c6c[4] + 8 ^ bVar2) & 0x7f ^ bVar2;
  *(byte *)(iVar7 + 3) = bVar1;
  if (DAT_00100610 == 1) {
    play_positional_sound_effect(7,*(undefined2 *)DAT_00202c6c,*(undefined2 *)(DAT_00202c6c + 2),0);
  }
  uVar8 = encode_object_slot_index(iVar7);
  sVar6 = scheduler_add_entry(uVar8,2,0,(int)sVar4 >> 3 & 0xff,(char)((int)sVar5 >> 3));
  if (sVar6 == -1) {
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: scheduler_add_entry queue full, freeing slot\n");
    free_object_slot(iVar7);
    return;
  }
  iVar9 = tilemap_lookup((int)sVar4 >> 3,(int)sVar5 >> 3);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: tilemap_lookup(%d,%d)=%p, appending\n", (int)sVar4>>3, (int)sVar5>>3, (void*)iVar9);
  object_list_append_tail(iVar9 + 2,iVar7);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: SUCCESS, splat placed\n");
  return;
}


// was FUN_00026194 -- resolves a melee weapon swing's hit test: computes
// the swing's attack direction/position, checks for a wall collision
// (spawning a blood-splat decal on the wall via spawn_blood_splat_object
// if so) versus a creature collision (via find_nearest_hit_target +
// resolve_combat_hit_zone if so), returning 1 if a creature was actually
// hit or 0 otherwise. Own "[hit-test]" debug trace throughout.
undefined4 resolve_melee_swing_hit()

{
  byte bVar1;
  char cVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  ushort *puVar6;
  uint uVar7;
  /* Same "6 independent locals treated as one contiguous record via
     DAT_00202c6c" bug already fixed in resolve_collision_candidate_interaction's own sibling
     collision-envelope caller (see its own comment, uw.c ~46514) --
     this function has the IDENTICAL local name set (local_3c/3a/38/
     34/33/32) and was never converted. Every DAT_00202c6c[N] read
     throughout collision_height_envelope/collision_build_height_field/
     sort_collision_candidates/spawn_blood_splat_object assumes one contiguous record, but as
     independent C locals this compiler is free to place them (and
     every OTHER local in this function, including iVar5) anywhere,
     with any padding. Confirmed live via UW_DEBUG_COMBAT tracing: a
     real attack swing's own `iVar5` (a small, masked heading value,
     mathematically bounded to 0-255) read back as 0x80808080
     (uninitialized-pattern garbage) at spawn_blood_splat_object's own call site --
     writes through DAT_00202c6c at offsets up to 0x15 (from this
     function's own body) were silently scribbling over whatever
     unrelated local the compiler happened to place there instead of
     real struct fields, this session's own instance of the "attacking
     seems to do nothing, and generating a blood-splat effect crashes"
     QA report (the crash instances presumably hit some OTHER
     overlapping local worse than iVar5 was hit here). Same fix:
     real backing array, zeroed before use, sized generously (0x20)
     past the highest offset (0x15) this function's own body touches. */
  undefined1 local_pos_record[0x20];
#define local_3c (*(short *)(local_pos_record + 0))
#define local_3a (*(short *)(local_pos_record + 2))
#define local_38 (*(short *)(local_pos_record + 4))
#define local_34 (local_pos_record[8])
#define local_33 (local_pos_record[9])
#define local_32 (*(short *)(local_pos_record + 0xa))

  ce_memset(local_pos_record, 0, sizeof(local_pos_record));
  DAT_00202c6c = &local_3c;
  uVar7 = (uint)DAT_001005f4;
  local_34 = (char)DAT_001005f4 + '\x01';
  local_32 = DAT_00100610;
  local_33 = (char)((uVar7 & 0xff) << 3) + '\x04';
  iVar5 = (int)DAT_00100610;
  puVar6 = (ushort *)(iVar5 * 0x1b + DAT_002046b8);
  bVar1 = (&DAT_00202c90)[(*puVar6 & 0x1ff) * 0xd];
  iVar4 = ordint_divmod(3,(int)DAT_001005f8).quot;
  sVar3 = ordint_divmod(3,(uint)bVar1 * iVar4).quot;
  sVar3 = ((byte)puVar6[1] & 0x7f) + sVar3;
  if (iVar5 == 1) {
    iVar5 = (int)DAT_0023beb4;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 0x1ff;
    }
    /* The original adds pitch. SDL look controls use negative pitch for up,
       so invert its contribution to the world-space strike height here. */
    sVar3 = sVar3 - (short)(iVar5 >> 9);
  }
  local_38 = sVar3;
  cVar2 = ordint_divmod(6,(&DAT_00202c90)[(*puVar6 & 0x1ff) * 0xd]).quot;
  DAT_001005dc = cVar2 + (char)sVar3;
  local_3c = (short)((puVar6[0xb] & 0xfc00) >> 7) + (ushort)(*(byte *)((char *)puVar6 + 3) >> 5);
  local_3a = (short)((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2) + ((puVar6[0xb] & 0x3f0) >> 1);
  iVar5 = ((byte)puVar6[0xc] & 0x1f) + ((puVar6[1] & 0x380) >> 2);
  project_position_by_heading(iVar5,uVar7 + 3,&local_3c,&local_3a);
  collision_height_envelope(0,1);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: blocked=%d\n", (int)*(char *)((char *)DAT_00202c6c + 0x14));
  if (*(char *)((char *)DAT_00202c6c + 0x14) == '\0') {
    collision_build_height_field(0);
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: no-block path, height field bits=0x%x\n", (unsigned)(*(ushort *)((char *)DAT_00202c6c + 0xe) | *(ushort *)((char *)DAT_00202c6c + 0xc)));
    if (((*(ushort *)((char *)DAT_00202c6c + 0xe) | *(ushort *)((char *)DAT_00202c6c + 0xc)) & 0x300) != 0
       ) {
      iVar4 = ((puVar6[0xb] & 0xfc00) >> 7) + (uint)(*(byte *)((char *)puVar6 + 3) >> 5);
      *(char *)DAT_00202c6c = (char)iVar4;
      *(char *)((char *)DAT_00202c6c + 1) = (char)((uint)iVar4 >> 8);
      iVar4 = ((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2) + ((puVar6[0xb] & 0x3f0) >> 1);
      *(char *)((char *)DAT_00202c6c + 2) = (char)iVar4;
      *(char *)((char *)DAT_00202c6c + 3) = (char)((uint)iVar4 >> 8);
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: calling spawn_blood_splat_object (wall splat) with iVar5=%d DAT_001005f4=%d\n", iVar5, (int)DAT_001005f4);
      spawn_blood_splat_object(iVar5,DAT_001005f4 + 3,DAT_00202c6c);
    }
  }
  else {
    sort_collision_candidates();
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: blocked path, creature_hit_flag=%d\n", (int)*(char *)((char *)DAT_00202c6c + 0x15));
    if (*(char *)((char *)DAT_00202c6c + 0x15) != '\0') {
      /* ARM 0x263c0..0x263d0 passes the current collision record in r0. */
      sVar3 = find_nearest_hit_target((short *)DAT_00202c6c);
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: find_nearest_hit_target returned %d\n", (int)sVar3);
      if (-1 < sVar3) {
        iVar5 = sVar3 * 6;
        DAT_00100624 = resolve_combat_hit_zone((&DAT_00202c39)[iVar5],(&DAT_00202c38)[iVar5],
                                    (int)*(short *)((char *)DAT_00202c6c + 4),
                                    (uint)*(byte *)((char *)DAT_00202c6c + 9) +
                                    (int)*(short *)((char *)DAT_00202c6c + 4));
        DAT_00100620 = *(ushort *)(&DAT_00202c3a + iVar5) >> 6;
        if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[hit-test] resolve_melee_swing_hit: HIT target slot=%d\n", (int)DAT_00100620);
        return 1;
      }
    }
  }
  return 0;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32


// was FUN_00026570 -- resolves whether a confirmed hit actually
// penetrates: rolls a skill check (weapon skill + facing modifier vs
// the target's armor-class-shaped table at &DAT_001007e2), and on a
// natural "2" result (fumble/special outcome) triggers an extra
// stagger/sound reaction via damage_equipped_item_in_slot instead. Returns 1-result as
// a hit/miss-shaped flag; called right after resolve_melee_swing_hit
// confirms a creature was struck.
int resolve_weapon_hit_skill_check(param_1,param_2)
short param_1;
undefined4 param_2;

{
  int uw_ord2005_rem_6 = 0;
  byte bVar1;
  ushort *puVar2;
  int iVar3;
  undefined4 uVar4;
  byte *pbVar5;
  int extraout_r1;
  uint uVar6;
  uint uVar7;
  ushort uVar8;
  
  puVar2 = (ushort *)get_object_record_by_slot_index(param_2);
  uVar6 = (uint)*puVar2;
  if ((uVar6 & 0x1c0) == 0x40) {
    uVar7 = uVar6 & 0x3f;
    if (DAT_00100620 == 1) {
      uVar6 = (int)DAT_00100608 - (int)(char)(&DAT_0010060c)[DAT_00100624];
    }
    if (DAT_00100620 == 1) {
      DAT_00100608 = (short)uVar6;
    }
    else {
      uVar6 = (uint)DAT_00100608;
    }
    iVar3 = roll_skill_check(DAT_00100628 + uVar6,(int)(char)(&DAT_001007e2)[uVar7 * 0x30]);
    DAT_001005d8 = 0;
    if ((short)iVar3 != 2) {
      if ((((short)iVar3 == -1) && (param_1 == 1)) &&
         (pbVar5 = (byte *)get_object_record_by_slot_index((int)DAT_00100620),
         ((&DAT_001007da)[(*pbVar5 & 0x3f) * 0x30] & 1) == 0)) {
        bVar1 = *(byte *)(DAT_00086df8 + 100);
        uVar4 = roll_dice_sum(2,3);
        damage_equipped_item_in_slot(8 - (bVar1 & 1),uVar4,4,0,1);
      }
      return 1 - iVar3;
    }
    DAT_001005d8 = 1;
    uVar6 = ce_rand();
    DAT_0010061c = (short)((int)((uVar6 & 0x1f) + 0x30) >> 5) * DAT_0010061c;
    if ((short)param_2 == 1) {
      weapon_overlay_flash_once(0xb8);
      uVar8 = DAT_00100624 + 1U & 3;
      if (uVar8 == 3) {
        uVar4 = ce_rand();
        uw_ord2005_rem_6 = ((int)(uVar4)) % (5);
        uVar8 = (uw_ord2005_rem_6 == 0) + 3;
      }
      else if ((uVar8 != 0) && (uVar8 < 3)) {
        uVar8 = (*(byte *)(DAT_00086df8 + 100) & 1) + 7;
      }
      uVar4 = roll_dice_sum(2,4);
      damage_equipped_item_in_slot(uVar8,uVar4,4,1,1);
    }
  }
  else if (((param_1 == 1) && ((uVar6 & 0x1f0) == 0x140)) &&
          (iVar3 = rand_below(0xc), iVar3 < (int)(((byte)*puVar2 & 7) * 2))) {
    bVar1 = *(byte *)(DAT_00086df8 + 100);
    uVar4 = roll_dice_sum(2,4);
    damage_equipped_item_in_slot(8 - (bVar1 & 1),uVar4,4,0,1);
  }
  return 0;
}



// was FUN_00026858 -- applies a landed melee hit's damage: rolls a
// damage dice pool, reduces it by the target's armor value (looked up
// from &DAT_001007d0), plays the impact sound, and calls apply_typed_damage_to_object
// (the same "apply damage/hit visual" primitive src/ai.c's monster
// attack code also calls, not yet named) to actually apply it. On
// nonzero final damage, either staggers the player (if the target is
// the player) or spawns the appropriate damage-number/blood-effect via
// spawn_scheduled_effect_object depending on target type and armor
// flags.
void apply_melee_damage(param_1)
undefined1 param_1;

{
  int uw_ord2005_rem_7 = 0; int uw_ord2005_rem_8 = 0;
  uint uVar1;
  short sVar2;
  short sVar3;
  ushort uVar4;
  ushort uVar5;
  ushort *puVar6;
  ushort *uVar7; /* ARM 0x26b58..0x26b80 forwards the attacker pointer in r1. */
  short extraout_r1;
  int extraout_r1_00;
  ushort uVar8;
  uint uVar9;
  char cVar10;
  int iVar11;
  undefined2 in_stack_ffffffbc;
  undefined1 uVar12;
  undefined2 in_stack_ffffffc0;
  undefined1 uVar13;
  short local_38;
  
  uVar13 = (undefined1)((ushort)in_stack_ffffffc0 >> 8);
  uVar12 = (undefined1)((ushort)in_stack_ffffffbc >> 8);
  puVar6 = (ushort *)get_object_record_by_slot_index((int)DAT_00100620);
  uVar5 = *puVar6;
  sVar3 = DAT_0010061c;
  if (DAT_0010061c < 2) {
    sVar3 = 2;
  }
  sVar2 = ordint_divmod(6,(int)sVar3).quot;
  uw_ord2005_rem_7 = ((int)((int)sVar3)) % (6);
  DAT_0010061c = 0;
  if (sVar2 != 0) {
    DAT_0010061c = roll_dice_sum((int)sVar2,6);
  }
  if (uw_ord2005_rem_7 != 0) {
    sVar3 = roll_dice_sum(1,(int)uw_ord2005_rem_7);
    DAT_0010061c = sVar3 + DAT_0010061c;
  }
  uVar9 = (uint)DAT_00100628 + (int)(short)((int)((uint)DAT_001005fc * (int)DAT_0010061c) >> 7);
  sVar3 = (short)uVar9;
  if (DAT_00100620 == 1) {
    play_sound_effect_with_pan(3,0x40,(uVar9 & 0xff) << 2);
  }
  else {
    play_positional_sound_effect(4,(uint)(*(byte *)((char *)puVar6 + 3) >> 5) + DAT_00100600 * 8,
                 (*(byte *)((char *)puVar6 + 3) >> 2 & 7) + DAT_00100604 * 8,(uVar9 & 0xff) << 2);
  }
  uVar8 = DAT_00100624;
  sVar2 = DAT_00100620;
  uVar1 = (uint)(short)(uVar5 & 0x1ff);
  uVar5 = uVar5 & 0x1c0;
  if (uVar5 == 0x40) {
    iVar11 = (uVar1 & 0x3f) * 0x30;
    uw_ord2005_rem_8 = ((int)((int)(short)DAT_00100624)) % (4);
    uVar4 = (ushort)(byte)(&DAT_001007d0)[iVar11 + uw_ord2005_rem_8];
    if (uVar4 == 0xff) {
      DAT_00100624 = uVar8 & 4;
      uVar4 = (ushort)(byte)(&DAT_001007d0)[iVar11];
    }
    if ((sVar2 != 1) && ((puVar6[7] & 4) != 0)) {
      uVar4 = ordint_divmod(3,(short)uVar4 * 5).quot;
    }
    if ((int)(uVar9 * 0x10000) >> 0x10 < (int)(short)uVar4) {
      sVar3 = 0;
    }
    else {
      sVar3 = (short)(uVar9 * 0x10000 >> 0x10) - uVar4;
    }
  }
  iVar11 = (int)sVar3;
  if (iVar11 < 0) {
    iVar11 = iVar11 + 3;
  }
  local_38 = (short)(iVar11 >> 2);
  if (3 < local_38) {
    local_38 = 3;
  }
  if ((sVar2 == 1) && (*(char *)(DAT_00086df8 + 0xb4) != '\0')) {
    sVar3 = sVar3 >> 1;
  }
  uVar7 = get_object_record_by_slot_index((int)DAT_00100610);
  iVar11 = apply_typed_damage_to_object(puVar6,uVar7,(int)DAT_00100600,(int)DAT_00100604,
                        CONCAT11(uVar12,(char)sVar3),CONCAT11(uVar13,param_1));
  sVar2 = DAT_00100610;
  cVar10 = DAT_001005dc;
  if ((sVar3 != 0) && (DAT_00100610 != -1)) {
    if (3 < (short)DAT_00100624) {
      DAT_00084f1c = -DAT_001005dc;
      DAT_00100624 = 4;
    }
    uVar8 = DAT_00100624;
    sVar3 = ordint_divmod(0x1b,DAT_0023b82c - DAT_002046b8).quot;
    if (DAT_00100620 == sVar3) {
      set_movement_animation_timer(0x20,(uint)(byte)local_38 * 5);
    }
    else {
      if (uVar5 == 0x40) {
        if (sVar2 == 1) {
          if ((&g_monster_max_stats_table)[(uVar1 & 0x3f) * 0x30] == '\0') {
            iVar11 = 0;
          }
          else {
            sVar3 = ordint_divmod((&g_monster_max_stats_table)[(uVar1 & 0x3f) * 0x30],(uint)(byte)puVar6[4] * 3).quot;
            iVar11 = (int)sVar3;
          }
          if (2 < (short)iVar11) {
            iVar11 = 2;
          }
          set_hud_status_value(7,3 - iVar11);
          uVar8 = DAT_00100624;
          cVar10 = DAT_001005dc;
        }
        if (((&DAT_001007d8)[(uVar1 & 0x3f) * 0x30] & 0x18) != 0) {
          spawn_scheduled_effect_object(puVar6,0,1,(int)local_38,(short)(&DAT_00084f18)[(short)uVar8],
                       DAT_00100600,DAT_00100604);
          if (DAT_001005d8 == 0) {
            return;
          }
          if (DAT_00100610 != 1) {
            return;
          }
          uVar5 = ce_rand();
          spawn_scheduled_effect_object(puVar6,0,1,(int)local_38,
                       (uVar5 & 1) * 5 + (short)(&DAT_00084f18)[(short)DAT_00100624] + -2,
                       DAT_00100600,DAT_00100604);
          return;
        }
        iVar11 = 0;
      }
      if (iVar11 != 0) {
        puVar6 = (ushort *)0x0;
      }
      if (((uVar1 & 0x1f0) == 0x140) || (uVar1 == 0x1cf)) {
        if ((int)cVar10 < (int)(puVar6[1] & 0x7f)) {
          cVar10 = ((byte)puVar6[1] & 0x7f) + 2;
          DAT_001005dc = cVar10;
        }
        spawn_scheduled_effect_object(puVar6,0xb,1,(int)local_38,-(short)cVar10,DAT_00100600,DAT_00100604);
      }
      else {
        spawn_scheduled_effect_object(puVar6,0xb,1,(int)local_38,-(short)cVar10,DAT_00100600,DAT_00100604);
      }
    }
  }
  return;
}



// was FUN_00026eb4 -- picks and plays a combat impact sound effect: id
// 10 for a whiffed/no-target swing (param_1==0), else id 7 or 8
// depending on whether the attacker's weapon type and the target's
// armor/shield type both indicate a "blocked" match (a metal-on-metal
// clang vs a duller impact).
undefined4 play_weapon_impact_sound(param_1)
short param_1;

{
  uint uVar1;
  byte bVar2;
  ushort uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  ushort *puVar6;
  byte bVar7;
  
  if (param_1 == 0) {
    uVar4 = get_object_record_by_slot_index((int)(short)DAT_00100610);
    uVar5 = 10;
    goto LAB_0002701c;
  }
  puVar6 = (ushort *)get_object_record_by_slot_index((int)(short)DAT_00100610);
  DAT_00100610 = *puVar6 & 0x1ff;
  uVar1 = (uint)(short)DAT_00100610;
  if ((uVar1 == 1) || (0xff < uVar1)) {
    bVar7 = 1;
  }
  else {
    bVar7 = (byte)(&DAT_001007e0)[(uVar1 & 0x3f) * 0x30] >> 6;
  }
  if (DAT_00100620 == 1) {
    puVar6 = (ushort *)get_equipped_item_at_slot((char)DAT_00100624 + 1U & 3);
    if (((((puVar6 == (ushort *)0x0) || (uVar3 = *puVar6 & 0x1ff, uVar3 == 0x20)) || (uVar3 == 0x23)
         ) || ((uVar3 == 0x26 || (uVar3 == 0x29)))) || (uVar3 == 0x2c)) {
LAB_00026fe8:
      bVar2 = 0;
    }
    else {
      bVar2 = 1;
    }
  }
  else {
    if (0xff < DAT_00100620) goto LAB_00026fe8;
    bVar2 = (byte)(&DAT_001007e0)[(uVar1 & 0x3f) * 0x30] >> 4 & 3;
  }
  if ((bVar7 != 1) || (uVar5 = 7, bVar2 != 1)) {
    uVar5 = 8;
  }
  uVar4 = get_object_record_by_slot_index((int)DAT_00100620);
LAB_0002701c:
  play_sound_effect_at_object(uVar5,uVar4,0);
  return 0;
}



// was FUN_0002702c -- computes the attacker's facing relative to the
// target (DAT_00100628, a mirrored 0-4 octant offset from the two
// objects' own heading fields), used by resolve_weapon_hit_skill_check
// as a to-hit modifier (rear/flank attacks presumably easier to land).
void compute_attack_relative_facing()

{
  int uw_ord2005_rem_9 = 0;
  /* ARM 0x27038..0x27068 reads both returned object pointers directly. */
  char *iVar1;
  char *iVar2;
  uint extraout_r1;
  
  iVar1 = get_object_record_by_slot_index((int)DAT_00100620);
  iVar2 = get_object_record_by_slot_index((int)DAT_00100610);
  uw_ord2005_rem_9 = ((int)(((*(ushort *)(iVar1 + 2) >> 7 & 7) - (*(ushort *)(iVar2 + 2) >> 7 & 7)) + 0xc)) % (8);
  DAT_00100628 = (char)uw_ord2005_rem_9;
  if (4 < (uw_ord2005_rem_9 & 0xff)) {
    DAT_00100628 = '\b' - DAT_00100628;
  }
  return;
}



// was FUN_000270d0 -- top-level melee swing resolution: calls
// resolve_melee_swing_hit to hit-test the swing, then (if a creature
// was struck and isn't already excluded by a same-faction/arena check)
// computes relative facing, resolves the weapon-vs-armor skill check,
// and either plays a whiff sound (skill check failed) or applies
// damage and a hit-flash effect. Returns the final outcome flag via
// play_weapon_impact_sound's own return value.
undefined4 process_melee_attack_swing()

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  /* ARM 0x27174..0x271a8 keeps attacker/target pointers for damage dispatch. */
  ushort *uVar4;
  ushort *uVar5;
  ushort *puTarget;
  ushort *puAttacker;
  
  iVar1 = resolve_melee_swing_hit();
  if (iVar1 == 0) {
    uVar2 = 0;
  }
  else {
    if ((DAT_00100610 != 1) && (iVar1 = (int)DAT_00100620, DAT_00100620 != 1)) {
      /* BUG FIX (unit-testing-framework): both calls were bare -- dropped
         arguments. ARM 0x27110..0x27114 forwards the resolved target
         pointer; same dropped-argument idiom fixed repeatedly elsewhere
         in this project. */
      puTarget = get_object_record_by_slot_index((int)DAT_00100620);
      iVar3 = object_ptr_in_arena(puTarget);
      iVar1 = 0;
      if (iVar3 != 0) {
        puTarget = get_object_record_by_slot_index((int)DAT_00100620);
        puAttacker = get_object_record_by_slot_index((int)DAT_00100610);
        if (((*(byte *)((char *)puTarget + 0x19) ^ *(byte *)((char *)puAttacker + 0x19)) & 0x40) == 0) {
          return 0;
        }
      }
    }
    compute_attack_relative_facing();
    uVar2 = resolve_weapon_hit_skill_check((int)DAT_00100610,(int)DAT_00100620);
    if ((short)uVar2 == 0) {
      apply_melee_damage(4);
      return 1;
    }
    uVar4 = get_object_record_by_slot_index((int)DAT_00100610);
    uVar5 = get_object_record_by_slot_index((int)DAT_00100620);
    apply_typed_damage_to_object(uVar5,uVar4,(int)DAT_00100600,(int)DAT_00100604,0,4);
  }
  uVar2 = play_weapon_impact_sound(uVar2);
  return uVar2;
}


// was FUN_000272c0 -- resolves the player's currently equipped weapon
// (the item in the off-hand slot, 8-handedness) into an attack-data
// record pointer (*param_1) and outputs the raw item pointer itself
// (*param_2): if it's a ranged weapon (category 0x10) with a valid ammo
// type, finds/consumes the matching ammo (returning -1/0xffffffff and
// canceling the swing via wait_for_click_release if none is found) and
// points param_1 at its ammo-type weapon-data record
// (&DAT_002027d0+offset); if it's melee (category 0), points param_1 at
// its own weapon-data record (&DAT_00202800+offset) instead; if nothing
// is equipped (or neither category matched), falls back to the
// unarmed/fist data record (&DAT_00202878). Returns 1 for the
// melee/unarmed paths, 0 for a successful ranged shot.
//
// param_1 was `int *` -- every store through it (`&DAT_002027d0 +
// iVar5`, `&DAT_00202800 + ...`, `&DAT_00202878`) is a real static-
// global address explicitly cast down to `(int)`/`(intptr_t)`,
// truncating it on this 64-bit host before the caller (tick_weapon_swing_state)
// reads it back and dereferences it as a pointer. param_2 had the
// same problem one level removed: it points at DAT_001005e0 (a real
// `char *`), but was declared `undefined4 *` (4 bytes), so `*param_2 =
// puVar4` only ever wrote the low 32 bits of get_equipped_item_at_slot's real
// pointer into the first half of that 8-byte slot.
undefined4 resolve_equipped_weapon_attack(param_1,param_2)
char * * param_1;
char * * param_2;

{
  uint uVar1;
  ushort uVar2;
  short sVar3;
  ushort *puVar4;
  int iVar5;

  *param_1 = 0;
  puVar4 = (ushort *)get_equipped_item_at_slot(8 - (*(byte *)(DAT_00086df8 + 100) & 1));
  *param_2 = (char *)puVar4;
  if (puVar4 != (ushort *)0x0) {
    uVar2 = *puVar4;
    uVar1 = (uint)(short)(uVar2 & 0x1ff);
    if ((uVar2 & 0x1f0) == 0x10) {
      iVar5 = (uVar1 & 0xf) * 3;
      if ((-1 < (char)(&DAT_002027d2)[iVar5]) && ((char)(&DAT_002027d2)[iVar5] < '\x10')) {
        sVar3 = find_and_consume_ammo(uVar2 & 0xf);
        if (sVar3 < 0) {
          wait_for_click_release(1);
          return 0xffffffff;
        }
        *param_1 = &DAT_002027d0 + iVar5;
        return 0;
      }
    }
    else if ((uVar2 & 0x1f0) == 0) {
      *param_1 = &DAT_00202800 + (uVar1 & 0xf) * 8;
      DAT_001005f4 = (byte)(&DAT_00202c91)[uVar1 * 0xd] & 7;
    }
  }
  if (*param_1 == 0) {
    *param_1 = &DAT_00202878;
    DAT_001005f4 = DAT_00202d54 & 7;
  }
  return 1;
}



// was FUN_000273f8 -- computes the player's own weapon-swing attack
// stats: to-hit base (DAT_00100608, from the player's own weapon skill
// plus a strength-derived bonus, +7 more if a "berserk"-shaped flag at
// DAT_00086df8+0xb4 is set) and damage dice pool (DAT_0010061c, from
// unarmed skill or a weapon-type-derived table lookup), sets
// DAT_00100610=1 to mark the player as attacker, and if the weapon item
// (param_2) resolves to a special enchanted-weapon link (category 0xc
// via resolve_object_variant_or_special_link), adds its bonus into
// whichever of the two stats its own flag bit selects. Feeds directly
// into resolve_weapon_hit_skill_check/apply_melee_damage's own reads of
// these same globals.
//
// param_1/param_2 were `int` -- both real object-record pointers
// (tick_weapon_swing_state passes the now-fixed DAT_001005e4-derived pointer and
// DAT_001005e0, both `char *`), truncated to 32 bits on this 64-bit
// host before being dereferenced here and forwarded to resolve_object_variant_or_special_link
// (which already declares its own params as real pointers).
void compute_player_weapon_attack_stats(param_1,param_2,param_3)
char * param_1;
char * param_2;
short param_3;

{
  byte bVar1;
  char *iVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short local_2c;
  ushort local_2a;
  int local_28;
  
  iVar2 = DAT_00086df8;
  bVar1 = *(byte *)(param_1 + 6);
  uVar3 = (ushort)bVar1;
  if ((5 < bVar1) || (bVar1 < 2)) {
    uVar3 = 2;
  }
  sVar5 = (ushort)*(byte *)((short)uVar3 + DAT_00086df8 + 0x21) +
          (ushort)(*(byte *)(DAT_00086df8 + 0x21) >> 1);
  DAT_00100608 = sVar5;
  sVar4 = ordint_divmod(7,*(undefined1 *)(DAT_00086df8 + 0x1f)).quot;
  DAT_00100608 = sVar5 + sVar4;
  if (*(char *)(iVar2 + 0xb4) != '\0') {
    DAT_00100608 = DAT_00100608 + 7;
  }
  if ((short)uVar3 == 2) {
    sVar4 = ordint_divmod(6).quot;
    sVar5 = ordint_divmod(5,(uint)*(byte *)(iVar2 + 0x23) << 1).quot;
    DAT_0010061c = sVar4 + sVar5 + 4;
  }
  else {
    sVar4 = ordint_divmod(9,(&DAT_001007d5)[(*g_player_object & 0x3f) * 0x30]).quot;
    DAT_0010061c = (ushort)*(byte *)(param_1 + (uint)(byte)(&DAT_00084eff)[param_3]) + sVar4;
  }
  DAT_00100610 = 1;
  DAT_001005f8 = param_3;
  if (((param_2 != 0) && (resolve_object_variant_or_special_link(param_2,&local_2c,&local_2a,&local_28), local_28 == 0)) &&
     (local_2c == 0xc)) {
    if ((local_2a & 8) == 0) {
      DAT_00100608 = (local_2a & 7) + DAT_00100608 + 1;
    }
    else {
      DAT_0010061c = (local_2a & 7) + DAT_0010061c + 1;
    }
  }
  return;
}


// was FUN_00027b3c -- a general-purpose "attacker object directly hits
// target object" damage-application entry point (parallel to, but
// independent of, the player's own tick_weapon_swing_state chain):
// fills in the same globals resolve_combat_hit_zone/apply_melee_damage
// read (attacker type param_1, target slot from param_3,
// resolve_combat_hit_zone's own hit-zone roll from both objects'
// hitbox-span data, damage dice param_6), plays an impact sound, then
// calls apply_melee_damage(param_7). Its one confirmed real caller
// (uw.c ~28596, a thrown/ranged-weapon-family impact handler) passes a
// negative param_7 and a skill-check-scaled damage roll, suggesting
// this is also the shared path for ranged/thrown projectile impacts,
// not just melee.
void apply_direct_object_hit(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
undefined2 param_1;
ushort * param_2;
ushort * param_3;
undefined2 param_4;
undefined2 param_5;
undefined2 param_6;
undefined1 param_7;

{
  short sVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  DAT_00100604 = param_5;
  DAT_001005d8 = 0;
  DAT_00100628 = 0;
  DAT_001005dc = ((byte)param_2[1] & 0x7f) + ((byte)(&DAT_00202c90)[(*param_2 & 0x1ff) * 0xd] >> 1);
  DAT_001005fc = 0x80;
  DAT_00100600 = param_4;
  DAT_00100610 = param_1;
  DAT_00100620 = encode_object_slot_index(param_3);
  uVar4 = (byte)param_2[1] & 0x7f;
  uVar2 = (byte)param_3[1] & 0x7f;
  sVar1 = resolve_combat_hit_zone(uVar2,(byte)(&DAT_00202c90)[(*param_3 & 0x1ff) * 0xd] + uVar2,uVar4,
                       (byte)(&DAT_00202c90)[(*param_2 & 0x1ff) * 0xd] + uVar4);
  DAT_00100624 = sVar1 + 4;
  DAT_0010061c = param_6;
  if (param_3 == g_player_object) {
    play_sound_effect_with_pan(3,0,0);
  }
  else {
    iVar3 = object_ptr_in_arena(param_3);
    if (iVar3 != 0) {
      play_sound_effect_at_object(4,param_3,0);
    }
  }
  apply_melee_damage(param_7);
  return;
}


// was FUN_00027ce0 -- resolves an NPC's melee attack: computes its
// to-hit base (DAT_00100608) and damage dice pool (DAT_0010061c) from
// its own monster-stat table (&DAT_001007d0/&DAT_001007d5/&DAT_001007e1),
// adding a random wander-offset spread when flag bit 2 of param_1[0xe]
// is set, marks it as attacker (DAT_00100610), then calls
// process_melee_attack_swing to actually resolve the hit. If the
// player was struck and their own facing/awareness threshold allows,
// updates a "being attacked from direction" flag on the player record.
// Own "[npc-wander]" debug trace (reused from a related channel).
int resolve_npc_melee_attack(param_1,param_2,param_3,param_4,param_5)
byte * param_1;
undefined2 param_2;
undefined1 param_3;
short param_4;
short param_5;

{
  byte bVar1;
  char cVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  short extraout_r1;
  short extraout_r1_00;
  int iVar6;
  uint uVar7;
  
  DAT_001005f4 = 2;
  DAT_00100610 = encode_object_slot_index(param_1);
  iVar6 = (*param_1 & 0x3f) * 0x30;
  iVar5 = param_4 * 3 + iVar6;
  bVar1 = (&DAT_001007d0)[iVar5 + 0x14];
  DAT_0010061c = (ushort)bVar1;
  DAT_001005f8 = param_2;
  DAT_001005fc = param_3;
  sVar3 = ordint_divmod(5,(&DAT_001007d5)[(*param_1 & 0x3f) * 0x30]).quot;
  DAT_0010061c = (ushort)bVar1 + sVar3;
  DAT_00100608 = (short)(char)(&DAT_001007d0)[iVar5 + 0x13] +
                 (short)((int)(char)(&DAT_001007e1)[iVar6] >> 1);
  if ((param_1[0xe] & 4) != 0) {
    /* Both ordint_divmod calls below were the same fabricated-remainder
       bug fixed elsewhere this session (this port's ordint_divmod never
       populates extraout_r1/extraout_r1_00); computed each remainder
       directly instead. This randomizes a wander/patrol target offset,
       so previously always added a fixed +7/+4 instead of a real
       0-5/0-11 random spread -- contributing to (not the sole cause of)
       the "NPC teleports far away on its first tick" bug this session's
       QA pass reported, traced to npc_ai_tick's own dropped 5th argument
       to this function (see its call site's comment). */
    uVar4 = ce_rand();
    DAT_00100608 = DAT_00100608 + (short)(uVar4 % 6) + 7;
    uVar4 = ce_rand();
    DAT_0010061c = DAT_0010061c + (short)(uVar4 % 0xc) + 4;
  }
  if (getenv("UW_DEBUG_NPC_WANDER")) {
    ushort _pos = *(ushort *)(param_1 + 0x16);
    fprintf(stderr, "[npc-wander] obj=%p param_2=%d param_3=%d param_4=%d param_5=%d"
            " base_iVar5=%d bVar1=%d DAT_00100608=%d DAT_0010061c=%d src_tile=(%u,%u)\n",
            (void *)param_1, (int)(short)param_2, (int)param_3, (int)param_4, (int)param_5,
            iVar5, (int)bVar1, (int)DAT_00100608, (int)DAT_0010061c,
            (unsigned)(_pos >> 10), (unsigned)((_pos & 0x3f0) >> 4));
  }
  iVar5 = process_melee_attack_swing();
  if (getenv("UW_DEBUG_NPC_WANDER")) {
    ushort _pos = *(ushort *)(param_1 + 0x16);
    fprintf(stderr, "[npc-wander] process_melee_attack_swing returned %d DAT_00100620=%d dst_tile=(%u,%u)\n",
            iVar5, (int)DAT_00100620,
            (unsigned)(_pos >> 10), (unsigned)((_pos & 0x3f0) >> 4));
  }
  if ((iVar5 != 0) && (DAT_00100620 == 1)) {
    if (((short)(*(byte *)(DAT_00086df8 + 0x5f) >> 2 & 0xf) < param_5) &&
       (cVar2 = resolve_damage_type_resistance(g_player_object,1,0x10), cVar2 != '\0')) {
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
      *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar7 | (byte)(((int)param_5 & 0xfU) << 2);
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    }
  }
  return iVar5;
}


// was FUN_00027f14 -- grants the player experience for killing param_1
// (a monster object, category 0x40): plays a HUD update and music
// sting, rolls XP from the monster's own stat table (&DAT_001007f8),
// with a random spread when a specific stat flag bit is set, then
// grants it via grant_experience_points. Called from the monster
// take-damage/death path (uw.c's own killed-by-player branch) once a
// kill is confirmed.
void award_monster_kill_experience(param_1)
ushort * param_1;

{
  int uw_ord2005_rem_10 = 0;
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  int extraout_r1;
  
  if ((*param_1 & 0x1c0) == 0x40) {
    set_hud_status_value(4,2);
    set_pending_music_track(9);
    sVar1 = *(short *)(&DAT_001007f8 + ((byte)*param_1 & 0x3f) * 0x30);
    iVar2 = roll_dice_sum(2,(int)sVar1);
    iVar2 = iVar2 + sVar1 * 4;
    if ((param_1[7] & 4) != 0) {
      uVar3 = ce_rand();
      uw_ord2005_rem_10 = ((int)(uVar3)) % (0x18);
      iVar2 = (uw_ord2005_rem_10 + 0x18) * (iVar2 * 0x10000 >> 0x10);
      if (iVar2 < 0) {
        iVar2 = iVar2 + 0xf;
      }
      iVar2 = (int)(short)(iVar2 >> 4);
    }
    grant_experience_points(iVar2);
  }
  return;
}



// was FUN_00028004 -- loads the combat data file (\DATA\cmb.dat,
// s__DATA_cmb_dat_00084f40) relative to the game data path
// (DAT_0023cca8) into the &DAT_00100630 buffer (0x3c bytes).
void load_combat_data_file()

{
  char stack0xffdc3250_buf [256];
  char *stack0xffdc3250_ptr;
  char cVar1;
  char *pcVar2;
  char acStack_108 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3250_ptr = acStack_108;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3250_ptr = cVar1; stack0xffdc3250_ptr = stack0xffdc3250_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_108,s__DATA_cmb_dat_00084f40);
  read_buffer_from_file(acStack_108,&DAT_00100630,0x3c);
  return;
}


// was FUN_0002a2c8 -- reads a fixed 0xc00-byte block from file handle
// param_1 into &DAT_001007d0 (the monster combat-stat table apply_melee_damage/
// resolve_npc_melee_attack read armor/attack values from). Registered as
// one of a small table of resource-loader callbacks (load_object_catalog_data,
// alongside load_armor_variant_tables) indexed by resource type.
void load_monster_combat_stats(param_1)
undefined4 param_1;

{
  read_file_handle(param_1,&DAT_001007d0,0xc00);
  return;
}


// was FUN_00030aac -- an NPC combat sub-goal attempt (one of 3
// confirmed sibling sub-goals npc_combat_engage_close_tick picks
// between when not yet close enough to attack, per its own comment).
// Requires the monster's stat template to have a special-ability id
// assigned (byte 0x2c != -1, no line-of-sight check needed -- likely a
// self-targeted ability), rolls a chance from byte 0x2d, and on
// success switches the NPC into state 0xd (byte 0x15) to begin it.
// The exact real-world ability this and its two siblings below
// represent isn't otherwise confirmed; named structurally.
undefined4 try_npc_special_ability_no_los()

{
  int uw_ord2005_rem_59 = 0;
  byte bVar1;
  undefined4 uVar2;
  int iVar3;
  int extraout_r1;
  uint uVar4;
  
  if (*(char *)(DAT_00101404 + 0x2c) != -1) {
    uVar2 = ce_rand();
    bVar1 = *(byte *)(DAT_00101404 + 0x2d);
    uw_ord2005_rem_59 = ((int)(uVar2)) % (0x100);
    if (((uw_ord2005_rem_59 < (int)(uint)(bVar1 >> 1)) &&
        (iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar3 == 0)) &&
       ((DAT_00201b68 != 7 ||
        (((*(byte *)(DAT_00086df8 + 0x60) & 0x20) != 0 || (*(char *)(DAT_00101404 + 9) != '\x13'))))
       )) {
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xcd | 0xd;
      *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) | 0xc;
      uVar4 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar4;
      *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar4 >> 8);
      return 1;
    }
  }
  return 0;
}



// was FUN_00030be0 -- an NPC combat sub-goal attempt (sibling of
// try_npc_special_ability_no_los): requires a clear line of sight
// (check_fine_line_of_sight) and a resource check (check_npc_target_alignment(1),
// likely "can afford this ability's cost"), rolls a chance from byte
// 0x2d, and on success switches to state 0xd plus picks between 2
// variants (byte 0x19 bits 2-3) via a further roll -- likely a ranged
// spell/breath attack with two possible effect variants.
undefined4 try_npc_special_ability_ranged()

{
  int uw_ord2005_rem_60 = 0; int uw_ord2005_rem_61 = 0;
  byte bVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  short extraout_r1;
  int extraout_r1_00;
  uint uVar5;
  
  iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8);
  if ((((iVar3 == 0) &&
       (((DAT_00201b68 != 7 || ((*(byte *)(DAT_00086df8 + 0x60) & 0x20) != 0)) ||
        (*(char *)(DAT_00101404 + 9) != '\x13')))) &&
      (((DAT_00101900 < 0x40 && (iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar3 == 0)) &&
       (iVar3 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,
                             (uint)(byte)(&DAT_00202c90)[(*DAT_0010190c & 0x1ff) * 0xd] +
                             ((byte)DAT_0010190c[1] & 0x7f),DAT_00101908,DAT_00101418,
                             (ushort)(byte)(&DAT_00202c90)[(*DAT_00101400 & 0x1ff) * 0xd] +
                             ((byte)DAT_00101400[1] & 0x7f)), iVar3 != 0)))) &&
     (iVar3 = check_npc_target_alignment(1), iVar3 != 0)) {
    uVar4 = ce_rand();
    bVar1 = *(byte *)(DAT_00101404 + 0x2d);
    uw_ord2005_rem_60 = ((int)(uVar4)) % (0x80);
    if (uw_ord2005_rem_60 < (short)(ushort)(bVar1 >> 1)) {
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xcd | 0xd;
      uVar4 = ce_rand();
      uw_ord2005_rem_61 = ((int)(uVar4)) % (0x10);
      cVar2 = '\x01';
      if (10 < uw_ord2005_rem_61) {
        cVar2 = '\x02';
      }
      *(byte *)((char *)DAT_0010190c + 0x19) = *(byte *)((char *)DAT_0010190c + 0x19) & 0xf3 | cVar2 << 2;
      uVar5 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar5;
      *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar5 >> 8);
    }
    return 1;
  }
  return 0;
}



// was FUN_00030e50 -- an NPC combat sub-goal attempt (third sibling of
// try_npc_special_ability_no_los/_ranged): also requires line of sight
// and the same resource check, but uses a distinct probability byte
// (stat template byte 6) and switches to a different state (0x5
// rather than 0xd) on success -- likely a distinct ranged/missile
// attack type from the other two.
undefined4 try_npc_special_ability_alt()

{
  int uw_ord2005_rem_62 = 0;
  byte bVar1;
  int iVar2;
  undefined4 uVar3;
  int extraout_r1;
  uint uVar4;
  
  if (((DAT_00101900 < 0x10) &&
      (iVar2 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,
                            (uint)(byte)(&DAT_00202c90)[(*DAT_0010190c & 0x1ff) * 0xd] +
                            ((byte)DAT_0010190c[1] & 0x7f),DAT_00101908,DAT_00101418,
                            (ushort)(byte)(&DAT_00202c90)[(*DAT_00101400 & 0x1ff) * 0xd] +
                            ((byte)DAT_00101400[1] & 0x7f)), iVar2 != 0)) &&
     (iVar2 = check_npc_target_alignment(1), iVar2 != 0)) {
    uVar3 = ce_rand();
    bVar1 = *(byte *)(DAT_00101404 + 6);
    uw_ord2005_rem_62 = ((int)(uVar3)) % (0xc0);
    if (uw_ord2005_rem_62 <= (int)(uint)bVar1) {
      *(byte *)((char *)DAT_0010190c + 0x13) = *(byte *)((char *)DAT_0010190c + 0x13) & 0x80;
      *(byte *)((char *)DAT_0010190c + 0x15) = *(byte *)((char *)DAT_0010190c + 0x15) & 0xc5 | 5;
      uVar4 = *(ushort *)((char *)DAT_0010190c + 0xb) & 0xfff;
      *(char *)((char *)DAT_0010190c + 0xb) = (char)uVar4;
      *(char *)((char *)DAT_0010190c + 0xc) = (char)(uVar4 >> 8);
    }
    return 1;
  }
  return 0;
}


// was FUN_000318d8 -- adjusts an NPC's current heading (param_1) to
// swerve away from the player when the player is within param_2 tiles
// (distance squared): if closer than threshold, computes the heading
// toward the player and, based on the angular difference from the
// NPC's own current heading, snaps param_1 to one of 4 discrete
// swerve-left/swerve-right offsets around it. Already had its 5
// fabricated-remainder ordint_divmod/extraout_r1 calls fixed by an
// earlier pass this session (see that fix's own comment just below).
uint adjust_heading_away_from_player(param_1,param_2)
uint param_1;
uint param_2;

{
  /* Was `int`, truncating the real 64-bit pointer get_object_record_by_slot_index(1)
     returns -- same class of bug fixed repeatedly elsewhere this
     session. Confirmed live crashing on the very first dereference (the
     first time this newly-reachable NPC AI path called it). Reused for
     small-int arithmetic afterward; intptr_t is safe for that too. */
  intptr_t iVar1;
  uint uVar2;
  uint extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint extraout_r1_02;
  uint extraout_r1_03;
  uint extraout_r1_04;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  
  iVar1 = get_object_record_by_slot_index(1);
  uVar3 = ((*(ushort *)(iVar1 + 0x16) >> 7 & 0x1f8) + (uint)(*(byte *)(iVar1 + 3) >> 5)) -
          (uint)DAT_00101910;
  uVar5 = ((*(ushort *)(iVar1 + 0x16) >> 1 & 0x1f8) + ((*(byte *)(iVar1 + 3) & 0x1c) >> 2)) -
          (uint)DAT_0010141c;
  uVar2 = uVar5 & 0xffff;
  uVar4 = uVar3 & 0xffff;
  if ((int)(uVar4 * uVar4 + uVar2 * uVar2 & 0xffff) < (int)((param_2 & 0xffff) * (param_2 & 0xffff))
     ) {
    uVar2 = compute_movement_heading((int)(uVar3 * 0x1000000) >> 0x18,(int)(uVar5 * 0x1000000) >> 0x18);
    /* All 5 ordint_divmod calls below were the same fabricated-remainder
       bug fixed elsewhere this session (this port's ordint_divmod never
       populates extraout_r1/extraout_r1_NN) -- computed each remainder
       directly instead. Divisors are constants (8, 0x100), so `% 8`/
       `% 0x100` is exact (the latter equals `& 0xff`, matching the
       explicit mask this code already applies to the overall result). */
    iVar1 = (((uVar2 & 0xff) + 4) % 8) * 0x20;
    uVar4 = param_1 & 0xff;
    uVar2 = ((iVar1 - uVar4) + 0x100) & 0xff;
    if ((0x3f < uVar2) && (uVar2 < 0xc1)) {
      if (uVar2 < 0x60) {
        param_1 = (iVar1 + 0xe0) & 0xff;
      }
      else if (uVar2 < 0x80) {
        param_1 = (uVar4 + 0x20) & 0xff;
      }
      else if (uVar2 < 0xa1) {
        param_1 = (uVar4 + 0xe0) & 0xff;
      }
      else {
        param_1 = (iVar1 + 0x20) & 0xff;
      }
      param_1 = param_1 & 0xff;
    }
  }
  return param_1;
}


// was FUN_00032410 -- checks/adjusts an NPC's 8-way facing toward a
// target position (DAT_00101908/0x1c minus DAT_00101910/0x1c, the same
// aim-point delta check_fine_line_of_sight's own callers compute):
// param_1==0 checks the coarse 8-way heading via
// compute_movement_heading, returning 1 if already facing that way or
// nudging the facing one step closer and returning 0 otherwise;
// param_1!=0 delegates entirely to check_npc_fine_facing_alignment
// (a finer-grained sibling check) instead. Called from the special-
// ability sub-goal functions with param_1=1 to gate on precise aim.
undefined4 check_npc_target_alignment(param_1)
int param_1;

{
  int uw_ord2005_rem_87 = 0; int uw_ord2005_rem_88 = 0; int uw_ord2005_rem_89 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  char *iVar4;
  char cVar5;
  undefined4 uVar6;
  char extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint uVar7;
  
  iVar1 = (int)(((uint)DAT_00101908 - (uint)DAT_00101910) * 0x1000000) >> 0x18;
  iVar2 = (int)(((uint)DAT_00101418 - (uint)DAT_0010141c) * 0x1000000) >> 0x18;
  cVar5 = compute_movement_heading(iVar1,iVar2);
  iVar4 = DAT_0010190c;
  uVar3 = *(ushort *)((char *)DAT_0010190c + 2);
  uw_ord2005_rem_87 = ((int)(((int)cVar5 - ((int)(char)(uVar3 >> 7) & 7U)) + 8)) % (8);
  if (param_1 == 0) {
    if (uw_ord2005_rem_87 == '\0') {
      uVar6 = 1;
    }
    else {
      uVar7 = uVar3 >> 7 & 7;
      if (uw_ord2005_rem_87 < '\x05') {
        uw_ord2005_rem_88 = ((int)(uVar7 + 1)) % (8);
        uVar7 = uw_ord2005_rem_88;
      }
      else {
        uw_ord2005_rem_89 = ((int)(uVar7 - 1)) % (8);
        uVar7 = uw_ord2005_rem_89;
      }
      uVar7 = uVar3 & 0xfc7f | (uVar7 & 7) << 7;
      *(char *)(iVar4 + 2) = (char)uVar7;
      *(char *)((char *)DAT_0010190c + 3) = (char)(uVar7 >> 8);
      uVar6 = 0;
    }
  }
  else {
    uVar6 = check_npc_fine_facing_alignment(iVar1,iVar2);
  }
  return uVar6;
}



// was FUN_0003276c -- checks/adjusts an NPC's fine-grained facing
// toward a target delta (param_1,param_2): computes the precise angle
// via slope ratios fed through compute_angle_from_slope (an atan2-shaped helper,
// not yet named), and if the NPC's current fine facing (byte 2's own
// angle XORed with a jitter field at byte 0x18) is already within a
// band of the target angle, returns 1 (aligned); otherwise nudges the
// facing by a fixed step toward it and returns 0.
undefined4 check_npc_fine_facing_alignment(param_1,param_2)
char param_1;
char param_2;

{
  int uw_ord2005_rem_90 = 0; int uw_ord2005_rem_91 = 0; int uw_ord2005_rem_92 = 0;
  uint uVar1;
  short sVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;
  
  uVar8 = 0;
  uVar4 = *(ushort *)((char *)DAT_0010190c + 2) >> 2 & 0xff;
  uVar4 = (uVar4 ^ *(byte *)((char *)DAT_0010190c + 0x18)) & 0x1f ^ uVar4;
  uVar3 = integer_sqrt((int)DAT_00101444 * (int)DAT_00101444 + (int)DAT_00101448 * (int)DAT_00101448
                      );
  uVar6 = (uint)param_1;
  uVar1 = (uint)param_2;
  uVar3 = uVar3 & 0xffff;
  if (uVar3 == 0) {
    uVar8 = 1;
  }
  else {
    if (uVar1 == uVar3) {
      iVar7 = 0x7fff;
    }
    else {
      iVar7 = -0x8000;
      if (-uVar3 != uVar1) {
        sVar2 = ordint_divmod(uVar3,uVar1 << 0xf).quot;
        iVar7 = (int)sVar2;
      }
    }
    iVar5 = 0x7fff;
    if ((uVar6 != uVar3) && (iVar5 = -0x8000, -uVar3 != uVar6)) {
      sVar2 = ordint_divmod(uVar3,uVar6 << 0xf).quot;
      iVar5 = (int)sVar2;
    }
    uVar3 = compute_angle_from_slope(iVar7,iVar5);
    uw_ord2005_rem_90 = ((int)(0x140 - ((uVar3 & 0xffff) >> 8))) % (0x100);
    uVar3 = uw_ord2005_rem_90 & 0xff;
    uVar6 = uVar3 - uVar4 & 0xff;
    if ((uVar6 < 0x20) || (0xe0 < uVar6)) {
      uVar8 = 1;
    }
    else {
      if (uVar6 < 0x80) {
        uw_ord2005_rem_91 = ((int)(uVar4 + 0x20)) % (0x100);
        uVar3 = uw_ord2005_rem_91;
      }
      else {
        uw_ord2005_rem_92 = ((int)(uVar4 + 0xe0)) % (0x100);
        uVar3 = uw_ord2005_rem_92;
      }
      uVar3 = uVar3 & 0xff;
    }
    uVar6 = *(ushort *)((char *)DAT_0010190c + 2) & 0xfc7f | (uVar3 & 0xffe0) << 2;
    *(char *)((char *)DAT_0010190c + 2) = (char)uVar6;
    *(char *)((char *)DAT_0010190c + 3) = (char)(uVar6 >> 8);
    *(byte *)((char *)DAT_0010190c + 0x18) =
         (*(byte *)((char *)DAT_0010190c + 0x18) ^ (byte)uVar3) & 0x1f ^ *(byte *)((char *)DAT_0010190c + 0x18);
  }
  return uVar8;
}


// was FUN_000346a0 -- applies param_2 points of damage to object
// param_1 from damaging object param_3 (NULL if none, e.g. environmental
// damage). Updates the "last damaged by" quality/slot field (byte 9),
// decrements HP, and on HP exhaustion routes through
// handle_monster_death/award_monster_kill_experience. Also drives combat
// music track selection (set_pending_music_track) based on the target's
// remaining HP fraction via ordint_divmod.
undefined4 apply_damage_to_object(param_1,param_2,param_3)
ushort * param_1;
byte param_2;
ushort * param_3;

{
  short sVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  bool bVar6;

  bVar6 = param_3 == (ushort *)0x0;
  iVar5 = (((int)(short)*param_1 & 0xfU) + (short)((*param_1 & 0x30) >> 4) * 0x10) * 0x30;
  if (bVar6) {
    param_3 = (ushort *)0x0;
  }
  *(byte *)((char *)param_1 + 0x11) = *(char *)((char *)param_1 + 0x11) + param_2;
  if (!bVar6) {
    if ((*param_3 & 0x1c0) == 0x40) {
      sVar1 = encode_object_slot_index(param_3);
      uVar2 = (uint)sVar1;
      if (0xff < (int)uVar2) {
        uVar2 = 0;
      }
      param_3 = (ushort *)(uVar2 & 0xff);
    }
    else {
      param_3 = (ushort *)(uint)(byte)param_3[9];
    }
  }
  uVar2 = (uint)param_3 & 0xff;
  if (uVar2 != 0) {
    *(char *)(param_1 + 9) = (char)param_3;
  }
  if ((uVar2 == 1) && ((param_1[5] & 0x80) == 0)) {
    DAT_000853d0 = (&DAT_001007d9)[iVar5];
    DAT_0010194c = encode_object_slot_index(param_1);
    DAT_0010192c = *(byte *)((char *)param_1 + 0x17) >> 2;
    DAT_00101930 = (byte)(param_1[0xb] >> 4) & 0x3f;
    DAT_00101934 = (byte)param_1[1] >> 3 & 0xf;
    DAT_00101940 = *(undefined4 *)(DAT_00086df8 + 0xce);
  }
  if (param_2 < (byte)param_1[4]) {
    *(byte *)(param_1 + 4) = (byte)param_1[4] - param_2;
    if (param_1 == g_player_object) {
      refresh_experience_display();
    }
  }
  else {
    *(undefined1 *)(param_1 + 4) = 0;
    iVar3 = handle_monster_death(param_1);
    if (iVar3 != 0) {
      if (uVar2 == 1) {
        award_monster_kill_experience(param_1);
      }
      return 1;
    }
  }
  if (uVar2 == 1) {
    sVar1 = ordint_divmod((byte)(&g_monster_max_stats_table)[iVar5] + 1,(uint)(byte)param_1[4] << 6).quot;
    uVar4 = 5;
  }
  else {
    if (param_1 != g_player_object) {
      return 0;
    }
    if (uVar2 == 0) {
      return 0;
    }
    sVar1 = ordint_divmod(*(byte *)(DAT_0023be74 + 4) + 1,(uint)(byte)g_player_object[4] << 6).quot;
    uVar4 = 7;
  }
  if (0xf < sVar1) {
    uVar4 = 6;
  }
  set_pending_music_track(uVar4);
  DAT_00101944 = read_realtime_clock_units();
  return 0;
}


// was FUN_000382cc -- resolves elemental/damage-type resistance for
// object param_1 against a damage-type bitmask (param_3), returning
// the effective damage to apply: 0 if fully resisted, otherwise
// param_2 (the original damage amount) unchanged. Looks up the
// object type's resistance byte (DAT_00202c99, 13-byte stride per
// type) and ANDs it with param_3; if the low 2 bits (a specific
// damage sub-category) match, rolls a 1/3 chance to still let it
// through before checking the remaining bits. Only known caller:
// apply_typed_damage_to_object's non-NPC damage-application path.
undefined4 resolve_damage_type_resistance(param_1,param_2,param_3)
ushort * param_1;
undefined4 param_2;
uint param_3;

{
  int uw_ord2005_rem_102 = 0;
  undefined4 uVar1;
  int extraout_r1;
  uint uVar2;

  uVar2 = (uint)(byte)(&DAT_00202c99)[(*param_1 & 0x1ff) * 0xd];
  if ((uVar2 & param_3 & 0xff) != 0) {
    if ((param_3 & 3) != 0) {
      uVar1 = ce_rand();
      uw_ord2005_rem_102 = ((int)(uVar1)) % (3);
      if (uw_ord2005_rem_102 < (int)(uVar2 & 3)) {
        return 0;
      }
      param_3 = param_3 & 0xfc;
    }
    if ((uVar2 & param_3 & 0xff) != 0) {
      return 0;
    }
  }
  return param_2;
}


// was FUN_00038374 -- the general-purpose "apply damage/effect to
// any object" entry point (param_1: target; param_2: the damaging
// object/weapon, or 0; param_3/param_4: tile x/y, when relevant;
// param_5: raw damage amount; param_6: damage-type bitmask). Resolves
// elemental resistance first (resolve_damage_type_resistance), then
// for an NPC target (class 0x40) applies HP damage directly
// (apply_damage_to_object); for anything else, checks eligibility via
// apply_object_durability_damage (not yet named) before routing to
// apply_object_destruction_effect for the object-specific
// destroy/transform handling.
undefined4 apply_typed_damage_to_object(param_1,param_2,param_3,param_4,param_5,param_6)
ushort * param_1;
ushort *param_2; /* damaging object, forwarded to apply_damage_to_object */
undefined4 param_3;
undefined2 param_4;
undefined1 param_5;
undefined1 param_6;

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;

  uVar1 = resolve_damage_type_resistance(param_1,param_5,param_6);
  if ((*param_1 & 0x1c0) == 0x40) {
    uVar2 = apply_damage_to_object(param_1,uVar1,param_2);
  }
  else {
    iVar3 = apply_object_durability_damage(param_1,param_2,uVar1 & 0xff,param_3,param_4);
    if (iVar3 == 0) {
      uVar2 = 0;
    }
    else {
      uVar2 = apply_object_destruction_effect(param_1,param_2,param_6,param_3,param_4);
    }
  }
  return uVar2;
}


// was FUN_00038418 -- applies durability damage (param_3, already
// shifted right by the object type's hardness/resistance divisor from
// DAT_00202c97) to a non-NPC object param_1, returning whether it
// broke (durability reached 0). Bails out early (false, no damage)
// for a protected object (flag bit 0x2000) or an indestructible class
// (hardness divisor of 3) or non-positive adjusted damage. Uses
// different durability fields depending on whether the object is a
// live world object (object_ptr_in_arena) vs a portcullis/door-range
// type (0x140-0x147) vs an ordinary item. On breaking (and not
// in-arena, with a valid tile), also fires
// trigger_object_trap_or_use_action(action 4).
bool apply_object_durability_damage(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
ushort *param_2; /* damaging actor, forwarded to the destruction trigger */
short param_3;
undefined4 param_4;
undefined2 param_5;

{
  int iVar1;
  ushort uVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  
  if ((((*param_1 & 0x2000) == 0) &&
      (uVar6 = ((byte)(&DAT_00202c97)[(*param_1 & 0x1ff) * 0xd] & 0xc) >> 2, (short)uVar6 != 3)) &&
     (iVar5 = (int)param_3 >> uVar6, 0 < (short)iVar5)) {
    iVar4 = object_ptr_in_arena(param_1);
    if (iVar4 == 0) {
      if ((0x13f < (*param_1 & 0x1ff)) && ((*param_1 & 0x1ff) < 0x148)) {
        uVar2 = param_1[3];
        if (((uVar2 & 1) != 0) && ((uVar2 & 0x3e) != 0)) {
          uVar6 = (uVar2 >> 1 & 0x1f) - iVar5;
          if ((int)(uVar6 * 0x10000) >> 0x10 < 1) {
            uVar6 = 0;
          }
          *(byte *)(param_1 + 3) = (byte)(uVar2 & 0xffc1) | (byte)((uVar6 & 0x1f) << 1);
          *(char *)((char *)param_1 + 7) = (char)((uVar2 & 0xffc1) >> 8);
          return false;
        }
      }
      uVar2 = param_1[2];
      iVar5 = ((int)(short)uVar2 & 0x3fU) - iVar5;
      iVar1 = iVar5 * 0x10000 >> 0x10;
      if (iVar1 < 1) {
        iVar5 = 0;
      }
      *(byte *)(param_1 + 2) = ((byte)uVar2 ^ (byte)iVar5) & 0x3f ^ (byte)uVar2;
      *(char *)((char *)param_1 + 5) = (char)(uVar2 >> 8);
    }
    else {
      iVar5 = (uint)(byte)param_1[4] - iVar5;
      iVar1 = iVar5 * 0x10000 >> 0x10;
      if (iVar1 < 1) {
        iVar5 = 0;
      }
      *(char *)(param_1 + 4) = (char)iVar5;
    }
    bVar3 = iVar1 < 1;
    if (((bVar3) && (iVar4 == 0)) && (-1 < (short)param_4)) {
      trigger_object_trap_or_use_action(param_2,param_1,4,param_4,param_5);
    }
  }
  else {
    bVar3 = false;
  }
  return bVar3;
}


// was FUN_00045f9c -- validates whether an object's class/subtype
// (param_1, masked to 0x1ff) is a valid match for equipment slot
// param_2: slot 9/10 or the handedness-derived "weapon hand" slot
// (DAT_00086df8+100 bit 0, +7) always pass through to a subtype range
// check (class 0x20-0x2f, subtype 0xb-0xf with no extra flag bits
// set); any other slot index rejects outright. Used both by combat's
// equipped-item-damage path and by item-property-effect resolution
// (src/player.c's own comment on resolve_object_variant_or_special_link).
undefined4 is_valid_equipment_slot_item(param_1,param_2)
ushort param_1;
short param_2;

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = (int)param_2;
  if (((((iVar1 < 0) || (4 < iVar1)) && (iVar1 != 10)) && (iVar1 != 9)) &&
     (((iVar1 != (*(byte *)(DAT_00086df8 + 100) & 1) + 7 || ((param_1 & 0xffc0) != 0)) ||
      (((param_1 & 0x30) < 0x20 || (((param_1 & 0xf) < 0xb || (0xf < (param_1 & 0xf))))))))) {
    uVar2 = 0;
  }
  else {
    uVar2 = 1;
  }
  return uVar2;
}



// was FUN_00046030 -- attempts to damage the player's own equipped
// item in slot param_1 (combat's "extra stagger/sound reaction"
// trigger, src/combat.c), e.g. a shield or piece of armor absorbing a
// hit: validates the slot/item combination (via
// is_valid_equipment_slot_item for param_4==1) or requires an empty
// flag set (param_4==0), applies typed damage (param_2/param_3), and
// on destruction frees the item (optionally dropping a replacement
// gem when param_5 is set) and reports "damaged"/"destroyed" via a
// scroll message.
undefined4 damage_equipped_item_in_slot(param_1,param_2,param_3,param_4,param_5)
undefined4 param_1;
undefined1 param_2;
undefined1 param_3;
short param_4;
int param_5;

{
  char *wptr_30396;
  byte bVar1;
  char cVar2;
  undefined2 uVar3;
  short sVar4;
  undefined2 *puVar5;
  int iVar6;
  undefined4 uVar7;
  char *pcVar8;
  char *pcVar9;
  char *pDropObj;  /* was `uVar7` (undefined4) for this use -- truncated
                       spawn_new_object's real object pointer; uVar7 itself
                       is only reused as a 0/1 message-select flag right
                       after, so this needed a separate typed local */
  char acStackY_85aec [547480];
  char acStack_4d [53];
  
  puVar5 = (undefined2 *)get_equipped_item_at_slot(param_1);
  if (puVar5 == (undefined2 *)0x0) {
    return 0xfffffffe;
  }
  if (param_4 != 2) {
    if (param_4 == 0) {
      if ((CONCAT11(*(undefined1 *)((char *)puVar5 + 1),*(undefined1 *)puVar5) & 0x1f0) != 0) {
        return 0xfffffffe;
      }
    }
    else {
      iVar6 = is_valid_equipment_slot_item(CONCAT11(*(undefined1 *)((char *)puVar5 + 1),*(undefined1 *)puVar5) & 0x1ff,
                           param_1);
      if (iVar6 == 0) {
        return 0xfffffffe;
      }
    }
  }
  bVar1 = *(byte *)(puVar5 + 2);
  iVar6 = apply_typed_damage_to_object(puVar5,0,0xffffffff,0xffffffff,param_2,param_3);
  if (iVar6 == 0) {
    if ((*(byte *)(puVar5 + 2) & 0x3f) == (bVar1 & 0x3f)) {
      return 0xffffffff;
    }
    pcVar9 = s_damaged__00085aa8;
    uVar7 = 0;
  }
  else {
    if (param_5 != 0) {
      sVar4 = rand_below(2);
      pDropObj = (char *)spawn_new_object(sVar4 + 0xd5,0);
      drop_object_near_target(g_player_object,pDropObj,6,0);
    }
    decrement_object_count(puVar5);
    discard_misplaced_object(0,puVar5,1);
    refresh_player_equipment_effects();
    pcVar9 = s_destroyed__00085ab4;
    uVar7 = 1;
  }
  pcVar8 = DAT_00085aa0;
    wptr_30396 = acStackY_85aec;
  do {
    cVar2 = *pcVar8;
    *wptr_30396 = cVar2; wptr_30396 = wptr_30396 + 1;
    pcVar8 = pcVar8 + 1;
  } while (cVar2 != '\0');
  if (puVar5 == g_player_object) {
    uVar3 = *puVar5;
    *(undefined1 *)puVar5 = 0xf;
    *(byte *)((char *)puVar5 + 1) = (byte)((ushort)uVar3 >> 8) & 0xfe;
  }
  iVar6 = ce_strlen(acStack_4d + 1);
  build_object_display_name(acStack_4d + iVar6 + 1,puVar5,0,0);
  iVar6 = ce_strlen(acStack_4d + 1);
  if (acStack_4d[iVar6] == 's') {
    pcVar8 = s_were_00085a98;
  }
  else {
    pcVar8 = DAT_00085a90;
  }
  ce_strcat(acStack_4d + 1,pcVar8);
  ce_strcat(acStack_4d + 1,pcVar9);
  message_scroll_print_wrapped(acStack_4d + 1);
  redraw_backpack_slot_widget(param_1);
  return uVar7;
}


// was FUN_000542f8 -- grants the player a new active light source:
// fails (returns 0) if the active-light count (DAT_00086df8+0x5f
// bits 6-9) is already at its cap; otherwise stages a new slot with
// type param_1 and radius param_2, rolls its starting fuel from
// quality tier param_3 (0=torch 2d3, 1=fixed 1, '@'=lantern 2d8+6,
// -0x80=brightest 3d20+24), increments the active count, and
// refreshes equipment effects. Confirmed by dispatch_special_action's
// SPECIAL action types 0-3, reached only for the player object --
// a tile trigger that lights the player a torch/lantern.
undefined4 add_active_light_source(param_1,param_2,param_3)
uint param_1;
uint param_2;
char param_3;

{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  uint uVar5;
  byte local_14;
  
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) == 0xc0) {
    uVar1 = 0;
  }
  else {
    uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf;
    iVar2 = (uint)*(byte *)(DAT_00086df8 + uVar5 * 2 + 0x3f) * 0x100 + (param_2 & 0xff) * 0x10 +
            (param_1 & 0xff);
    puVar4 = (undefined1 *)(DAT_00086df8 + (uVar5 + 0x1f) * 2);
    *puVar4 = (char)iVar2;
    puVar4[1] = (char)((uint)iVar2 >> 8);
    if (param_3 == '\0') {
      uVar5 = roll_dice_sum(2,3);
      uVar5 = uVar5 & 0xff;
    }
    else if (param_3 == '\x01') {
      uVar5 = 1;
    }
    else if (param_3 == '@') {
      uVar5 = roll_dice_sum(2,8);
      uVar5 = (uVar5 & 0xff) + 6;
    }
    else if (param_3 == -0x80) {
      uVar5 = roll_dice_sum(3,0x14);
      uVar5 = (uVar5 & 0xff) + 0x18;
    }
    else {
      uVar5 = (uint)local_14;
    }
    uVar3 = *(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf;
    iVar2 = (uint)*(byte *)(DAT_00086df8 + uVar3 * 2 + 0x3e) + (uVar5 & 0xff) * 0x100;
    puVar4 = (undefined1 *)(DAT_00086df8 + (uVar3 + 0x1f) * 2);
    *puVar4 = (char)iVar2;
    puVar4[1] = (char)((uint)iVar2 >> 8);
    uVar5 = (uint)*(ushort *)(DAT_00086df8 + 0x5f);
    uVar5 = ((uVar5 & 0xffc0) + 0x40 ^ uVar5) & 0x3c0 ^ uVar5;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
    refresh_player_equipment_effects();
    uVar1 = 1;
  }
  return uVar1;
}



// was FUN_0005448c -- default collision outcome for object param_2
// when nothing else handles it (param_1, the object that struck it,
// is unused): takes a position snapshot, and if the snapshot's
// velocity-like field is nonzero, computes a randomized bounce/
// scatter offset (ordint_divmod roll scaled by the object's own speed
// field) and commits the new position via sync_object_tile_position.
// Always returns 4. Confirmed as the fallback tail of
// resolve_collision_candidate_interaction's door/usable-object checks.
// BUG FIX (unit-testing-framework merge): this function's own stack
// snapshot buffer had been split into separate named scalars
// (local_3e/local_34/local_27/local_26) sitting "after" a shrunk
// auStack_48[10] -- but build_object_placement_snapshot/
// sync_object_tile_position both treat it as ONE opaque, contiguous
// 0x2c-byte struct (per their own comments), and C makes no guarantee
// locals are laid out contiguously or in declaration order. This was a
// real stack buffer overflow (build_object_placement_snapshot writing
// up to offset 0x2c into a 10-byte array) AND local_30 was read
// (`if (local_30 != 0)`) without ever being assigned -- the assignment
// from the snapshot (`local_30 = *(short *)(auStack_48 + 0x18)`) had
// been dropped entirely in the split. Restored the single real-sized
// buffer and the dropped read, indexing by the real ARM-confirmed
// offsets instead.
undefined4 apply_object_collision_scatter(param_1,param_2)
ushort *param_1;
ushort *param_2;

{
  undefined2 uVar1;
  short sVar2;
  char *iVar3;
  int iVar4;
  /* The original ARM stack frame holds one contiguous 0x2c-byte snapshot. */
  undefined1 auStack_48 [0x2c];
  short local_30;

  if (param_2 != 0) {
    DAT_0010144c = (ushort)DAT_002046d8;
    DAT_00101454 = (ushort)DAT_002046dc;
    build_object_placement_snapshot(param_2,auStack_48);
    local_30 = *(short *)(auStack_48 + 0x18);
    iVar3 = DAT_00204874;
    if (local_30 != 0) {
      sVar2 = ordint_divmod((int)local_30,(int)*(short *)(DAT_00204874 + 0x18) << 6).quot;
      uVar1 = *(undefined2 *)(iVar3 + 0x21);
      if (0x80 < sVar2) {
        sVar2 = 0x80;
      }
      auStack_48[0x21] = (undefined1)uVar1;
      auStack_48[0x22] = (undefined1)((ushort)uVar1 >> 8);
      *(undefined2 *)(auStack_48 + 0x14) = 0xeb;
      DAT_0010144c = (ushort)DAT_002046d8;
      iVar4 = (int)*(short *)(iVar3 + 10) * (int)sVar2;
      DAT_00101454 = (ushort)DAT_002046dc;
      if (iVar4 < 0) {
        iVar4 = iVar4 + 0x3f;
      }
      *(undefined2 *)(auStack_48 + 10) = (undefined2)(iVar4 >> 6);
      sync_object_tile_position(param_2,auStack_48);
    }
  }
  return 4;
}



// WARNING: Removing unreachable block (ram,0x00054668)

// was FUN_000545ac -- looks up a base damage/flag pair for object
// param_1's subtype (DAT_002027d0/DAT_002027d2, 3 bytes/entry), and
// when a specific condition holds (param_1[0x12]==1 and that
// subtype's flag byte == -0x40) adjusts the damage via a skill check
// (+0x27) before applying it to param_1 through apply_direct_object_hit.
// Confirmed called from use_object_on_target for class-0/family-1
// targets -- a "use this object on a trap/trigger" damage effect.
/* ARM 0x545c0 preserves the target in r8 and 0x54698 passes that address
   in r2 to apply_direct_object_hit. undefined4 truncated it on 64-bit hosts. */
void apply_trap_type_damage_effect(param_1,param_2)
byte * param_1;
ushort * param_2;

{
  byte bVar1;
  undefined1 uVar2;
  short sVar4;
  int iVar5;
  uint uVar6;
  ushort uVar7;
  undefined1 uVar3;
  
  iVar5 = (*param_1 & 0xf) * 3;
  bVar1 = (&DAT_002027d0)[iVar5];
  uVar7 = (ushort)bVar1;
  if ((param_1[0x12] == 1) && ((&DAT_002027d2)[iVar5] == -0x40)) {
    uVar6 = (*(byte *)(DAT_00086df8 + 0x27) + 0x18) * 8;
    sVar4 = roll_skill_check((uint)*(byte *)(DAT_00086df8 + 0x27),10);
    if (sVar4 == -1) {
      uVar6 = uVar6 - 0x80;
    }
    else if (sVar4 == 2) {
      uVar6 = uVar6 + 0xc0;
    }
    uVar7 = (ushort)((uVar6 & 0xffff) * (uint)bVar1 >> 8);
  }
  uVar2 = DAT_002046d8;
  uVar3 = DAT_002046dc;
  if (DAT_002046e8 == 0) {
    uVar2 = DAT_002046e0;
    uVar3 = DAT_002046e4;
  }
  apply_direct_object_hit(param_1[0x12],param_1,param_2,uVar2,uVar3,uVar7,-(&DAT_002027d2)[iVar5]);
  return;
}



// was FUN_000546c4 -- resolves a collision between moving object
// param_2 (a slot index) and collision-candidate param_1 (an index
// into DAT_00202c38, or -1 for "the player directly"): marks the
// candidate as processed, resolves both the candidate and param_2's
// own records, and dispatches to resolve_skill_gated_unlock_or_use
// for doors or use_object_on_target for usable objects on either
// side, falling back to apply_object_collision_scatter when neither
// applies. Confirmed called from both movement.c's player-movement
// collision path and (twice) a weapon/trap collision path in uw.c.
undefined4 resolve_collision_candidate_interaction(param_1,param_2)
short param_1;
undefined4 param_2;

{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  ushort *puVar4;
  ushort *puVar5;
  undefined4 uVar7;
  ushort uVar8;
  byte bVar9;
  int iVar10;
  ushort *puVar11;
  uint uVar6;
  
  puVar11 = (ushort *)&DAT_00202c38;
  iVar1 = (int)param_1;
  if (iVar1 != -1) {
    iVar10 = iVar1 * 6;
    uVar2 = *(ushort *)(&DAT_00202c3a + iVar10);
    if ((uVar2 & 0x20) != 0) {
      return 2;
    }
    (&DAT_00202c3a)[iVar10] = (byte)uVar2 | 0x20;
    (&DAT_00202c3b)[iVar10] = (char)(uVar2 >> 8);
  }
  DAT_002046e0 = (byte)(DAT_002049c8 >> 3);
  DAT_002046e4 = (byte)(DAT_002049ca >> 3);
  puVar4 = (ushort *)get_object_record_by_slot_index(param_2);
  /* HACK: get_object_record_by_slot_index legitimately returns NULL for an out-of-range/
     empty slot (its own established contract, guarded at many other
     call sites this session) and this immediately dereferenced it
     unconditionally. Newly reachable via npc_ai_tick's placement-sweep
     -> movement_collision_sweep -> sweep_collision_flags chain now that
     this session's NPC-AI-cluster byte-scaling fixes let more objects
     take that path for the first time; confirmed live crashing
     (EXC_BAD_ACCESS at `uVar2 = *puVar4`) in several regression demos.
     Match this function's own "nothing to do" early-out (return 2). */
  if (puVar4 == (ushort *)0x0) {
    return 2;
  }
  uVar2 = *puVar4;
  if (iVar1 == -1) {
    puVar11 = (ushort *)0x0;
  }
  if (iVar1 == -1) {
    uVar8 = 0xffff;
    bVar9 = 1;
    puVar5 = puVar11;
  }
  else {
    puVar5 = (ushort *)get_object_record_by_slot_index(puVar11[iVar1 * 3 + 1] >> 6);
    /* HACK: same unguarded get_object_record_by_slot_index NULL-return case as the
       puVar4 fix just above -- puVar5 is dereferenced (`*puVar5`)
       a few lines down with no check. Same early-out. */
    if (puVar5 == (ushort *)0x0) {
      return 2;
    }
    uVar6 = (uint)DAT_002046e0 + (int)(short)puVar11[iVar1 * 3 + 2] & 0x3f;
    uVar3 = (ushort)uVar6;
    DAT_002046d8 = (byte)uVar6;
    iVar10 = (int)(short)puVar11[iVar1 * 3 + 2] -
             ((int)((uVar6 - (int)(short)(ushort)DAT_002046e0) * 0x10000) >> 0x10);
    if (iVar10 < 0) {
      iVar10 = iVar10 + 0x3f;
    }
    DAT_002046dc = (char)(iVar10 >> 6) + DAT_002046e4 & 0x3f;
    uVar8 = *puVar5 & 0x1ff;
    bVar9 = (&DAT_00202c97)[(short)uVar8 * 0xd] & 1;
    if ((0xff < (short)param_2) || (0x3fff < (puVar11[iVar1 * 3 + 1] & 0xffc0))) goto LAB_000548b8;
    if (((uVar2 & 0x1c0) != 0x40) && ((*(byte *)((char *)puVar4 + 0x15) & 0x80) != 0)) {
      return 2;
    }
    *(byte *)((char *)puVar4 + 0x15) = *(byte *)((char *)puVar4 + 0x15) | 0x80;
  }
  uVar3 = (ushort)DAT_002046d8;
LAB_000548b8:
  if ((short)uVar8 != -1) {
    if (((&DAT_00202c97)[(short)uVar8 * 0xd] & 2) == 0) {
      if ((uVar8 & 0xffc0) == 0x180) {
        uVar7 = resolve_skill_gated_unlock_or_use(puVar4,0,puVar5,0);
        return uVar7;
      }
    }
    else {
      DAT_002020a4 = (ushort)DAT_002046dc;
      DAT_002046e8 = 0;
      DAT_002020a0 = uVar3;
      use_object_on_target(puVar4,puVar5,0);
    }
  }
  if (bVar9 == 0) {
    return 2;
  }
  if (((&DAT_00202c97)[(short)(uVar2 & 0x1ff) * 0xd] & 2) != 0) {
    DAT_002020a0 = (ushort)DAT_002046e0;
    DAT_002020a4 = (ushort)DAT_002046e4;
    DAT_002046e8 = 1;
    use_object_on_target(puVar5,puVar4,0);
    if ((short)DAT_002020a0 < 0) {
      return 0x10;
    }
  }
  uVar7 = apply_object_collision_scatter(puVar4,puVar5);
  return uVar7;
}
