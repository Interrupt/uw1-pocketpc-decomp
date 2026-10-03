/* Collision geometry: per-object height field build, placement
 * collision sweep, corner flags, and the height envelope query used
 * by movement/pathing. Split out of uw.c (the original monolithic
 * decompile) once these functions' real roles were confirmed.
 */
#include "headers/collision.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

 undefined DAT_00204920_backing[8192];
short DAT_00202c68;
short DAT_00202c30;
static undefined1 DAT_00202c70_backing[65536];
#define DAT_00202c70 DAT_00202c70_backing[0]
#define DAT_00202c78 (*(unsigned short *)(DAT_00202c70_backing + 8))
static ushort *_DAT_00202c34;
static char DAT_00202c20;
static char DAT_00202c28;
static char DAT_00202c24;
static char DAT_00202c2c;
static char DAT_00202c18;
static char DAT_00202c1c;






// was FUN_0002b7a0. Builds the collision_build_height_field scratch
// buffer (DAT_00202c6c, a local 24-byte struct) for param_1, then
// returns a combined height/step-limit field. Called with a dropped
// argument from npc_ai_tick (relies on register-reuse from the
// immediately preceding build_object_placement_snapshot call, whose
// first argument is the same object pointer this function expects).
int build_collision_height_field_for_object(param_1)
ushort * param_1;

{
  undefined2 uVar1;
  int iVar2;
  undefined1 local_24 [24];
  
  DAT_00202c6c = local_24;
  uVar1 = encode_object_slot_index(param_1);
  DAT_00202c6c[10] = (char)uVar1;
  DAT_00202c6c[0xb] = (char)((ushort)uVar1 >> 8);
  DAT_00202c6c[8] = (&DAT_00202c91)[(*param_1 & 0x1ff) * 0xd] & 7;
  DAT_00202c6c[9] = (&DAT_00202c90)[(*param_1 & 0x1ff) * 0xd];
  iVar2 = ((param_1[0xb] & 0xfc00) >> 7) + (uint)(*(byte *)((char *)param_1 + 3) >> 5);
  *DAT_00202c6c = (char)iVar2;
  DAT_00202c6c[1] = (char)((uint)iVar2 >> 8);
  iVar2 = ((*(byte *)((char *)param_1 + 3) & 0x1c) >> 2) + ((param_1[0xb] & 0x3f0) >> 1);
  DAT_00202c6c[2] = (char)iVar2;
  DAT_00202c6c[3] = (char)((uint)iVar2 >> 8);
  DAT_00202c6c[4] = (byte)param_1[1] & 0x7f;
  DAT_00202c6c[5] = 0;
  collision_build_height_field(8);
  return (int)(short)(*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc));
}




// was FUN_0002bd70. Writes a small field into the object-placement
// snapshot buffer (param_1, one of DAT_00204920/DAT_0010172c's chosen
// targets) then runs movement_collision_sweep.
/* Second argument was previously left undeclared, relying on it still
   sitting in the same ABI register (r1) at the tail call to
   movement_collision_sweep() -- a K&R "dropped-argument" idiom already
   seen (and fixed) elsewhere this session (tile_is_no_magic). It reliably
   works in the REAL ARM binary only because that compiler's generated
   code for this function body happens to never touch r1 between entry
   and the call; nothing about C guarantees that on a different compiler/
   platform, and on this port's build it isn't reliable -- confirmed
   live: an intermittent (~3/10 runs) SIGSEGV in sweep_apply_collision,
   indirect-calling through a garbage function pointer read from
   movement_collision_sweep's own param_2 (DAT_002048bc), newly exposed
   now that NPCs actually move far enough to hit real collisions (see
   this function's own byte-0x14 fix just above). Both real call sites
   already pass a real second argument explicitly
   (apply_placement_collision_sweep(&DAT_00204920,&DAT_002049a0) and
   (DAT_0010172c,DAT_00101438)) -- give it a real declared parameter and
   forward it explicitly instead of relying on register leftovers. */
undefined4 apply_placement_collision_sweep(param_1,param_2)
intptr_t param_1;
intptr_t param_2;

{
  /* param_1 was `int`, truncating the real 64-bit pointers callers pass
     (&DAT_00204920, and DAT_0010172c after its own fix above) -- same
     class of bug as DAT_0010172c's own fix. Confirmed live via lldb:
     read as 0xb6c724 instead of the real 0x100b6c724, crashing on this
     very first dereference the moment an NPC's per-tick AI got this
     far. */
  /* HACK: same ushort-vs-byte pointer-scaling bug as the rest of this
     NPC-AI cluster this session (see
     [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is
     `ushort *`, so the bare `DAT_0010190c + 0x14` here scaled to byte
     offset 0x28 (unrelated data) instead of the real byte 0x14
     (confirmed via disassembly of this exact function, 0x2bd7c:
     `ldrb r3,[r2,#0x14]` -- raw, unscaled). This byte's low 3 bits are
     the same field npc_idle_behavior_tick sets on every idle-toggle
     transition; the value computed here feeds movement_sweep_setup's
     sub-step-count formula (DAT_00086990 = offset0x12 * velocity),
     which multiplies by ZERO whenever this read comes out wrong/empty
     -- capping every physics sub-step loop to a single negligible
     iteration regardless of how large the (correctly-computed)
     per-tick velocity is. This is very likely the actual root cause of
     the "walk animation plays for a few seconds but the NPC never
     reaches an adjacent tile" symptom: real velocity was being
     computed (confirmed live), but the sub-step count that turns
     velocity into actual swept distance was silently starved at zero. */
  *(char *)(param_1 + 0x12) = (char)(((*(byte *)((char *)DAT_0010190c + 0x14) & 7) << 0x14) >> 0x10);
  *(undefined1 *)(param_1 + 0x13) = 0;
  movement_collision_sweep(param_1,param_2);
  return 1;
}




// was FUN_00050c18 -- per-corner slope/blocked flag word from the packed tile height DAT_00202c78
bool collision_corner_flags(param_1)
uint param_1;

{
  undefined2 uVar1;
  undefined1 uVar2;
  uint uVar3;
  ushort uVar4;
  int local_14;
  
  *(byte *)(DAT_00202c6c + 0xc) = (byte)(DAT_00202c78 >> 8) & 3;
  *(undefined1 *)(DAT_00202c6c + 0xd) = 0;
  uVar2 = collision_sample_floor_height(4,&local_14);
  *(undefined1 *)(DAT_00202c6c + 0x10) = uVar2;
  uVar3 = (uint)*(byte *)(DAT_00202c6c + 0x10);
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-corner-flags] DAT_00202c78=0x%x shape=%d uVar3(sampled)=%d off4=%d param_1(steplim)=%d\n",
            (unsigned)DAT_00202c78, (int)(DAT_00202c78 & 0xf), (int)uVar3,
            (int)*(short *)(DAT_00202c6c + 4), (int)param_1);
  if (uVar3 == 0x80) {
    uVar4 = *(ushort *)(DAT_00202c6c + 0xc) | 0x200;
  }
  else if ((int)((param_1 & 0xff) + (int)*(short *)(DAT_00202c6c + 4)) < (int)uVar3) {
    uVar4 = *(ushort *)(DAT_00202c6c + 0xc) | 0x100;
  }
  else {
    uVar4 = *(ushort *)(DAT_00202c6c + 0xc);
    if ((int)uVar3 < (int)((int)*(short *)(DAT_00202c6c + 4) - (param_1 & 0xff))) {
      uVar4 = uVar4 | 0x800;
    }
    else {
      *(byte *)(DAT_00202c6c + 0xc) = (byte)uVar4 | 4;
      *(char *)(DAT_00202c6c + 0xd) = (char)(uVar4 >> 8);
      uVar4 = *(ushort *)(DAT_00202c6c + 0xc) | (ushort)(8 << ((int)(short)DAT_00202c78 >> 8 & 3U));
    }
  }
  *(char *)(DAT_00202c6c + 0xc) = (char)uVar4;
  *(char *)(DAT_00202c6c + 0xd) = (char)(uVar4 >> 8);
  if (5 < (DAT_00202c78 & 0xf)) {
    uVar1 = *(undefined2 *)(DAT_00202c6c + 0xc);
    *(char *)(DAT_00202c6c + 0xc) = (char)uVar1;
    *(byte *)(DAT_00202c6c + 0xd) = (byte)((ushort)uVar1 >> 8) | 0x20;
  }
  return local_14 == 0;
}


// was FUN_00050d78 -- build the per-corner tile height field the sweep collides against
void collision_build_height_field(param_1)
uint param_1;

{
  byte *pbVar1;
  ushort *puVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  undefined1 *puVar10;
  byte bVar11;
  byte bVar12;
  byte bVar13;
  byte bVar14;
  short sVar15;
  bool bVar16;
  byte abStack_b4 [128];
  byte local_34 [8];
  
  ce_memset(&DAT_00202c70,0x11,0x12);
  puVar10 = &DAT_00202bf8;
  iVar7 = 5;
  do {
    puVar10[3] = 0;
    iVar7 = iVar7 + -1;
    puVar10[4] = 0;
    puVar10 = puVar10 + 5;
  } while (iVar7 != 0);
  _DAT_00202c34 =
       (ushort *)
       tilemap_lookup((int)*(short *)DAT_00202c6c >> 3,(int)*(short *)(DAT_00202c6c + 2) >> 3);
  /* off-map tile -- this function derefs _DAT_00202c34 below and assumes a
     valid record; the sweep collision-revert path can reach here out of
     bounds. */
  if (_DAT_00202c34 == (ushort *)0x0) {
    return;
  }
  bVar11 = 4;
  bVar12 = *DAT_00202c6c;
  bVar13 = DAT_00202c6c[2];
  DAT_00202c0c = 4;
  DAT_00202c0d = (undefined1)(bVar12 & 7);
  DAT_00202c0e = (undefined1)(bVar13 & 7);
  if (DAT_00202c78 == 0x1111) {
    uVar3 = *_DAT_00202c34;
    DAT_00202c78 = (uVar3 & 0xf) +
                   (((&DAT_0023ae40)[uVar3 >> 10 & 0xf] & 0xff) + (uVar3 >> 4 & 0xf)) * 0x10;
  }
  collision_corner_flags(param_1);
  pbVar1 = DAT_00202c6c + 0xc;
  DAT_00202c6c[0xe] = (byte)*(undefined2 *)pbVar1;
  DAT_00202c6c[0xf] = (byte)((ushort)*(undefined2 *)pbVar1 >> 8);
  DAT_00202c6c[0x11] = DAT_00202c6c[0x10];
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-inside-bhf] after-copy d8=%d d9=%d uVar3(DAT_00202c6c[8])=%d\n",
            (int)DAT_00202c6c[0x10], (int)DAT_00202c6c[0x11], (int)(uint)(ushort)DAT_00202c6c[8]);
  puVar2 = _DAT_00202c34;
  uVar3 = (ushort)DAT_00202c6c[8];
  if (uVar3 != 0) {
    for (sVar15 = (bVar13 & 7) - uVar3; sVar15 < 0; sVar15 = sVar15 + 8) {
      bVar11 = bVar11 - 3;
    }
    for (sVar4 = (bVar12 & 7) - uVar3; sVar4 < 0; sVar4 = sVar4 + 8) {
      bVar11 = bVar11 - 1;
    }
    DAT_00202bfa = (undefined1)sVar15;
    DAT_00202bf9 = (undefined1)sVar4;
    bVar12 = bVar11;
    for (sVar4 = sVar4 + (ushort)DAT_00202c6c[8] * 2; 7 < sVar4; sVar4 = sVar4 + -8) {
      bVar12 = bVar12 + 1;
    }
    DAT_00202bfe = (undefined1)sVar4;
    bVar13 = bVar12;
    for (sVar15 = sVar15 + (ushort)DAT_00202c6c[8] * 2; 7 < sVar15; sVar15 = sVar15 + -8) {
      bVar13 = bVar13 + 3;
    }
    DAT_00202c04 = (undefined1)sVar15;
    bVar14 = bVar13;
    for (sVar4 = sVar4 + (ushort)DAT_00202c6c[8] * -2; sVar4 < 0; sVar4 = sVar4 + 8) {
      bVar14 = bVar14 - 1;
    }
    DAT_00202c08 = (undefined1)sVar4;
    DAT_00202bf8 = bVar11;
    DAT_00202bfd = bVar12;
    DAT_00202bff = DAT_00202bfa;
    DAT_00202c02 = bVar13;
    DAT_00202c03 = DAT_00202bfe;
    DAT_00202c07 = bVar14;
    DAT_00202c09 = DAT_00202c04;
    if (*(short *)(&DAT_00202c70 + (uint)bVar11 * 2) == 0x1111) {
      uVar3 = collision_neighbor_shade_or_zero(_DAT_00202c34, bVar11);
      *(ushort *)(&DAT_00202c70 + (uint)bVar11 * 2) =
           (uVar3 & 0xf) + (((&DAT_0023ae40)[uVar3 >> 10 & 0xf] & 0xff) + (uVar3 >> 4 & 0xf)) * 0x10
      ;
    }
    if (*(short *)(&DAT_00202c70 + (uint)bVar12 * 2) == 0x1111) {
      uVar3 = collision_neighbor_shade_or_zero(puVar2, bVar12);
      *(ushort *)(&DAT_00202c70 + (uint)bVar12 * 2) =
           (uVar3 & 0xf) + (((&DAT_0023ae40)[uVar3 >> 10 & 0xf] & 0xff) + (uVar3 >> 4 & 0xf)) * 0x10
      ;
    }
    if (*(short *)(&DAT_00202c70 + (uint)bVar13 * 2) == 0x1111) {
      uVar3 = collision_neighbor_shade_or_zero(puVar2, bVar13);
      *(ushort *)(&DAT_00202c70 + (uint)bVar13 * 2) =
           (uVar3 & 0xf) + (((&DAT_0023ae40)[uVar3 >> 10 & 0xf] & 0xff) + (uVar3 >> 4 & 0xf)) * 0x10
      ;
    }
    if (*(short *)(&DAT_00202c70 + (uint)bVar14 * 2) == 0x1111) {
      uVar3 = collision_neighbor_shade_or_zero(puVar2, bVar14);
      *(ushort *)(&DAT_00202c70 + (uint)bVar14 * 2) =
           (uVar3 & 0xf) + (((&DAT_0023ae40)[uVar3 >> 10 & 0xf] & 0xff) + (uVar3 >> 4 & 0xf)) * 0x10
      ;
    }
    DAT_00202c14 = 1;
    iVar7 = 0;
    do {
      iVar5 = collision_classify_corner_wall(iVar7,param_1 & 0xff);
      if (iVar5 == 0) {
        iVar5 = iVar7 * 5;
        if (((&DAT_00202bfc)[iVar5] & 3) == 0) {
          local_34[1] = 0x10;
          local_34[2] = 2;
          local_34[3] = 8;
          local_34[0] = 4;
          iVar9 = 0;
          local_34[4] = 4;
          do {
            pbVar1 = DAT_00202c6c;
            uVar6 = (uint)(char)iVar9;
            uVar8 = (uint)(&DAT_00202bf8)[iVar5];
            bVar16 = (&DAT_00202bf8)[(iVar7 + uVar6 * -2 + 1 & 3) * 5] != uVar8;
            if (bVar16) {
              uVar6 = (uint)local_34[uVar6 + iVar7];
              uVar8 = (uint)(byte)(&DAT_000878d0)[(int)*(short *)(&DAT_00202c70 + uVar8 * 2) & 0xf];
            }
            if (bVar16 && (uVar6 & uVar8) != 0) {
              (&DAT_00202bfb)[iVar5] = 0;
              (&DAT_00202bfc)[iVar5] = 2;
              pbVar1[0x11] = 0x80;
              iVar9 = 2;
            }
            iVar9 = iVar9 + 1;
          } while (iVar9 * 0x1000000 >> 0x18 < 2);
          DAT_00202c14 = 0;
        }
      }
      uVar3 = *(ushort *)(DAT_00202c6c + 0xe) | DAT_00202c0a | _DAT_00202c05 | _DAT_00202c00 |
              _DAT_00202bfb;
      DAT_00202c6c[0xe] = (byte)uVar3;
      DAT_00202c6c[0xf] = (byte)(uVar3 >> 8);
      iVar7 = (iVar7 + 1) * 0x1000000 >> 0x18;
    } while (iVar7 < 4);
  }
  if (getenv("UW_DEBUG_RAMP"))
    fprintf(stderr, "[ramp-bhf-end] d8=%d d9=%d macro_d8=%d macro_d9=%d\n",
            (int)DAT_00202c6c[0x10], (int)DAT_00202c6c[0x11],
            (int)DAT_002049d8, (int)DAT_002049d9);
  return;
}




// was FUN_000518c0 -- reduce the height field to floor/ceiling envelope + block flags
void collision_height_envelope(param_1,param_2)
int param_1;
int param_2;

{
  char cVar1;
  int iVar2;
  ushort uVar3;
  byte bVar4;
  intptr_t iVar5;  /* was int -- holds the void* tilemap_lookup returns (a
                      real 64-bit tile-array pointer); truncated to 32
                      bits it made `*(ushort *)(iVar5 + ...)` a wild
                      deref -- the crash the first time a keyboard
                      forward step actually dispatched. */
  ushort *puVar6;
  ushort *puVar7;
  short sVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  byte *pbVar13;
  int iVar14;
  int local_3c;
  
  local_3c = 0;
  int _px = (int)*(short *)DAT_00202c6c >> 3;
  int _py = (int)*(short *)(DAT_00202c6c + 2) >> 3;
  iVar5 = tilemap_lookup(_px, _py);
  /* off-map tile (DAT_00202c6c position outside 0..63): this function assumes
     a valid tile record and derefs iVar5 + offsets below. The sweep's
     collision revert path (sweep_step(-1)) can reach here with an out-of-
     bounds position. */
  if (iVar5 == 0) {
    return;
  }
  if (*(short *)(DAT_00202c6c + 10) != 0) {
    /* Ghidra dropped get_object_record_by_slot_index's argument -- it's the object-slot id
       this branch just tested non-zero (classic `if ((id=..)!=0) rec=f(id)`);
       without it f() ran on a leftover register and handed back a wild
       pointer that passed the != 0 guard and crashed on deref. */
    puVar6 = (ushort *)get_object_record_by_slot_index((int)*(short *)(DAT_00202c6c + 10));
    if (puVar6 != (ushort *)0x0 && (*puVar6 & 0x1c0) == 0x40) {
      local_3c = 1;
    }
    else {
      local_3c = 0;
    }
  }
  DAT_00202c6c[0x14] = 0;
  DAT_00202c18 = *DAT_00202c6c & 7;
  DAT_00202c1c = DAT_00202c6c[2] & 7;
  if ((param_1 == 0) || (DAT_00202c6c[9] != 0)) {
    bVar4 = DAT_00202c6c[8];
    if ((local_3c != 0) && (0 < (char)bVar4)) {
      bVar4 = (byte)((uint)(((char)bVar4 + -1) * 0x1000000) >> 0x18);
    }
  }
  else {
    bVar4 = 0;
  }
  DAT_00202c20 = (undefined1)((int)(char)DAT_00202c18 - (int)(char)bVar4);
  iVar11 = ((int)(char)bVar4 + (int)(char)DAT_00202c1c) * 0x1000000;
  iVar9 = ((int)(char)bVar4 + (int)(char)DAT_00202c18) * 0x1000000;
  iVar12 = iVar11 >> 0x18;
  iVar14 = iVar9 >> 0x18;
  DAT_00202c2c = (undefined1)((uint)iVar11 >> 0x18);
  DAT_00202c28 = (undefined1)((uint)iVar9 >> 0x18);
  DAT_00202c24 = (undefined1)((int)(char)DAT_00202c1c - (int)(char)bVar4);
  iVar11 = ((int)(char)DAT_00202c1c - (int)(char)bVar4) * 0x1000000 >> 0x18;
  iVar9 = iVar11 + -0xb;
  iVar10 = iVar14 + 4;
  if (iVar9 < 0) {
    iVar9 = iVar11 + -4;
  }
  iVar11 = iVar12 + 4;
  if (iVar10 < 0) {
    iVar10 = iVar14 + 0xb;
  }
  if (iVar11 < 0) {
    iVar11 = iVar12 + 0xb;
  }
  cVar1 = (char)(iVar9 >> 3);
  iVar9 = ((int)(char)DAT_00202c18 - (int)(char)bVar4) * 0x1000000 >> 0x18;
  iVar12 = iVar9 + -0xb;
  if (iVar12 < 0) {
    iVar12 = iVar9 + -4;
  }
  iVar9 = (int)(char)(iVar10 >> 3);
  iVar12 = (int)(char)(iVar12 >> 3);
  if (iVar12 <= iVar9) {
    iVar11 = (int)(char)(iVar11 >> 3);
    pbVar13 = DAT_00202c6c;
    do {
      iVar14 = (int)cVar1;
      if (cVar1 <= iVar11) {
        do {
          /* Was raw pointer arithmetic straight off iVar5 (the CURRENT
             tile's own record, from tilemap_lookup(_px,_py)):
             `iVar5 + (dx + dy*0x40)*4 + 2` -- algebraically the right way
             to reach a neighbouring tile's record in a flat 64x64 array
             (base + ((_px+dx)+(_py+dy)*64)*4), but with none of
             tilemap_lookup's own bounds check that a plain
             tilemap_lookup(_px+dx,_py+dy) call gets for free. This scan's
             dx/dy (iVar12/iVar14) range up to +-11 tiles, so anywhere
             within ~11 tiles of the map edge -- confirmed via lldb,
             walking toward a critter near tile (17,7) -- (_px+dx) or
             (_py+dy) goes negative or >=64, landing this "neighbour"
             pointer far outside the real DAT_002029cc array and crashing
             on the very next dereference. Route through tilemap_lookup
             so an out-of-map neighbour is treated as "no object here"
             instead. */
          void *_ntile = tilemap_lookup(_px + (char)iVar12, _py + (char)iVar14);
          iVar10 = 0;
          sVar8 = 0;
          if (_ntile == 0) {
            puVar6 = 0;
            uVar3 = 0;
          } else {
            puVar6 = (ushort *)((char *)_ntile + 2);
            uVar3 = *puVar6;
          }
          while ((uVar3 & 0xffc0) != 0) {
            sVar8 = (short)iVar10;
            if (0x3f < sVar8) break;
            if ((uint)(uVar3 >> 6) != (int)*(short *)(pbVar13 + 10)) {
              puVar7 = (ushort *)resolve_object_link(puVar6);
              /* resolve_object_link can now return NULL for an
                 out-of-range link (see its own comment) where this loop's
                 `while ((uVar3 & 0xffc0) != 0)` condition alone used to
                 guarantee success -- and since the chain-advance below
                 uses this same puVar6 through the same function, a NULL
                 here means the chain itself is unsafe to keep walking
                 (advancing anyway would resolve against address 4).
                 Give up on this tile's object chain instead of
                 dereferencing NULL or walking into near-NULL memory. */
              if (puVar7 == (ushort *)0x0) break;
              iVar10 = (*puVar7 & 0x1ff) * 0xd;
              if ((((local_3c == 0) || (((&DAT_00202c93)[iVar10] & 4) == 0)) &&
                  (((&DAT_00202c90)[iVar10] != '\0' || (puVar7 < DAT_002046c4)))) &&
                 ((((DAT_002046c4 <= puVar7 || ((*puVar7 & 0x1c0) == 0x40)) ||
                   ((*(byte *)((char *)puVar7 + 0x15) & 0x80) == 0)) &&
                  ((param_2 == 0 || (((&DAT_00202c97)[iVar10] & 1) != 0)))))) {
                collision_add_candidate_object(puVar7,*puVar6 >> 6,iVar12,iVar14,local_3c);
              }
            }
            /* was `iVar10 = resolve_object_link(...); puVar6 = (ushort
               *)(iVar10 + 4);` -- iVar10 is `int`, truncating the real
               64-bit object-record pointer resolve_object_link returns,
               so the very next `*puVar6` was a wild deref (the second
               crash a keyboard forward step hits). Keep the pointer in
               its own width; iVar10 is reset to the loop counter right
               after anyway. */
            { intptr_t _objp = (intptr_t)resolve_object_link(puVar6);
              /* Same missing-NULL-guard bug as the first resolve_object_link
                 call above, just on the chain-advance itself instead of the
                 per-object handling: resolve_object_link can return NULL
                 for an out-of-range link, and this unconditionally turned
                 that into puVar6 = (ushort*)4, dereferenced by `uVar3 =
                 *puVar6` a few lines down (or, if that near-NULL address
                 happened to be mapped, silently kept walking a chain from
                 garbage). Confirmed via lldb: EXC_BAD_ACCESS right here,
                 walking into an obstacle (e.g. standing next to a critter). */
              if (_objp == 0) break;
              puVar6 = (ushort *)(_objp + 4); }
            iVar2 = (sVar8 + 1) * 0x10000;
            iVar10 = iVar2 >> 0x10;
            sVar8 = (short)((uint)iVar2 >> 0x10);
            pbVar13 = DAT_00202c6c;
            uVar3 = *puVar6;
          }
          if (sVar8 == 0x40) {
            return;
          }
          iVar14 = iVar14 + 1;
        } while (iVar14 * 0x1000000 >> 0x18 <= iVar11);
      }
      iVar12 = (iVar12 + 1) * 0x1000000 >> 0x18;
    } while (iVar12 <= iVar9);
  }
  return;
}



// was FUN_00050aa8 -- computes the floor height at a specific
// sub-tile X/Y position (param_1/param_2, each 0..255 within the
// tile), using the tile shape's wall-type nibble (DAT_00202c78) and
// diagonal interpolation for shapes 6/7/8/9. Confirmed by its sole
// call site (movement.c's Z re-snap-to-floor logic) wanting a precise
// height at the player's exact sub-tile position, finer-grained than
// collision_sample_floor_height's per-corner samples.
int compute_floor_height_at_position(param_1,param_2)
ushort param_1;
ushort param_2;

{
  ushort uVar1;
  ushort uVar2;
  int iVar3;

  iVar3 = 0;
  uVar2 = DAT_00202c78 & 0xf;
  uVar1 = param_2 & 0xff;
  if (uVar2 == 6) {
LAB_00050b14:
    iVar3 = (int)(short)uVar1;
  }
  else {
    if (uVar2 != 7) {
      uVar1 = param_1 & 0xff;
      if (uVar2 == 8) goto LAB_00050b14;
      if (uVar2 != 9) goto LAB_00050b18;
    }
    iVar3 = 0xff - (short)uVar1;
  }
LAB_00050b18:
  return ((int)(short)DAT_00202c78 & 0xf0U) * 4 + (int)(short)(iVar3 >> 2);
}



// was FUN_00050b30 -- classifies one corner (param_1) of the
// collision height-field during collision_build_height_field: samples
// its floor height, derives a wall-type/offset code (0x200=no floor,
// 0x100=step up needed, 0x800=step down, else a diagonal-wall texture
// index via compute_floor_height_at_position's shape logic) into the
// corner's 2-byte field at (&DAT_00202bfc)[corner], tracks the
// running max floor height, and returns whether the corner is a
// plain (non-diagonal) shape.
bool collision_classify_corner_wall(param_1,param_2)
uint param_1;
uint param_2;

{
  char *iVar1;
  byte bVar2;
  uint uVar3;
  undefined2 uVar4;
  int iVar5;
  int local_20;

  bVar2 = collision_sample_floor_height(param_1,&local_20);
  iVar1 = DAT_00202c6c;
  uVar3 = (uint)bVar2;
  if (uVar3 == 0x80) {
    uVar4 = 0x200;
  }
  else if ((int)((param_2 & 0xff) + (int)*(short *)(DAT_00202c6c + 4)) < (int)uVar3) {
    uVar4 = 0x100;
  }
  else if ((int)uVar3 < (int)((int)*(short *)(DAT_00202c6c + 4) - (param_2 & 0xff))) {
    uVar4 = 0x800;
  }
  else {
    uVar4 = (undefined2)
            (8 << ((int)*(short *)(&DAT_00202c70 +
                                  (uint)(byte)(&DAT_00202bf8)[(param_1 & 0xff) * 5] * 2) >> 8 & 3U))
    ;
  }
  iVar5 = (param_1 & 0xff) * 5;
  (&DAT_00202bfb)[iVar5] = (char)uVar4;
  (&DAT_00202bfc)[iVar5] = (char)((ushort)uVar4 >> 8);
  if (*(byte *)(iVar1 + 0x11) < uVar3) {
    *(byte *)(iVar1 + 0x11) = bVar2;
  }
  return local_20 == 0;
}


// was FUN_00051658 -- appends object param_1 to the small (max 9)
// collision candidate list at DAT_00202c38 if its bounding box (sized
// from its per-object-type properties at DAT_00202c90[type*0xd],
// positioned via tile-local params param_3/param_4) overlaps the
// current search bounds (DAT_00202c20/24/28/2c). Confirmed by its
// sole call site: collision_build_height_field's per-tile object-
// chain walk, which filters tile objects before calling this to
// gather ones that might affect collision/stepping. Each candidate
// entry is 6 bytes (id, height, two flag bytes, tile x/y word) at
// DAT_00202c38/39/3a/3b/3c+count*6, with the live count at
// DAT_00202c6c+0x14.
void collision_add_candidate_object(param_1,param_2,param_3,param_4,param_5)
ushort * param_1;
ushort param_2;
char param_3;
char param_4;
int param_5;

{
  undefined1 uVar1;
  ushort uVar2;
  uint uVar3;
  byte bVar4;
  char cVar5;
  undefined *puVar6;
  int iVar7;
  byte bVar8;
  char cVar9;
  char cVar10;
  char cVar11;
  char cVar12;
  int iVar13;
  char *pcVar14;
  bool bVar15;
  char local_40 [16];
  uint local_8;
  
  local_8 = (uint)param_2;
  bVar4 = *(byte *)(DAT_00202c6c + 0x14);
  if (bVar4 < 9) {
    uVar2 = *param_1;
    puVar6 = &DAT_00202c90 + (uVar2 & 0x1ff) * 0xd;
    iVar7 = 0xd;
    pcVar14 = local_40;
    do {
      iVar13 = iVar7 + -1;
      *pcVar14 = *puVar6;
      bVar15 = 0 < iVar7;
      puVar6 = puVar6 + 1;
      iVar7 = iVar13;
      pcVar14 = pcVar14 + 1;
    } while (iVar13 != 0 && bVar15);
    if ((local_40[1] & 7U) == 4) {
      cVar10 = param_3 * '\b';
      cVar9 = param_4 * '\b';
      cVar11 = cVar10 + '\a';
      cVar12 = cVar9 + '\a';
    }
    else {
      cVar10 = (*(byte *)((char *)param_1 + 3) >> 5) + param_3 * '\b';
      cVar9 = (*(byte *)((char *)param_1 + 3) >> 2 & 7) + param_4 * '\b';
      bVar8 = local_40[1] & 7;
      if ((((uVar2 & 0x1c0) == 0x40) && (bVar8 != 0)) && (param_5 != 0)) {
        bVar8 = bVar8 - 1;
      }
      cVar11 = cVar10 + bVar8;
      cVar10 = cVar10 - bVar8;
      cVar12 = cVar9 + bVar8;
      cVar9 = cVar9 - bVar8;
    }
    if (((DAT_00202c20 <= cVar11) && (cVar10 <= DAT_00202c28)) &&
       ((DAT_00202c24 <= cVar12 && (cVar9 <= DAT_00202c2c)))) {
      iVar7 = (uint)bVar4 * 6;
      *(byte *)(DAT_00202c6c + 0x14) = bVar4 + 1;
      bVar4 = (byte)param_1[1] & 0x7f;
      (&DAT_00202c39)[iVar7] = bVar4;
      bVar15 = local_40[0] == '\0';
      cVar5 = bVar4 + local_40[0];
      if (bVar15) {
        local_40[0] = cVar5 + '\x01';
      }
      (&DAT_00202c38)[iVar7] = cVar5;
      if (bVar15) {
        (&DAT_00202c38)[iVar7] = local_40[0];
      }
      uVar3 = local_8 << 6 & 0xffff;
      (&DAT_00202c3a)[iVar7] = (byte)(local_8 << 6) | 9;
      uVar1 = (undefined1)(uVar3 >> 8);
      (&DAT_00202c3b)[iVar7] = uVar1;
      if (((cVar10 <= DAT_00202c18) && (DAT_00202c18 <= cVar11)) &&
         ((cVar9 <= DAT_00202c1c && (DAT_00202c1c <= cVar12)))) {
        (&DAT_00202c3a)[iVar7] = (byte)uVar3 | 0x19;
        (&DAT_00202c3b)[iVar7] = uVar1;
      }
      iVar13 = param_4 * 0x40 + (int)param_3;
      (&DAT_00202c3c)[iVar7] = (char)iVar13;
      (&DAT_00202c3d)[iVar7] = (char)((uint)iVar13 >> 8);
    }
  }
  return;
}


// was FUN_00051cf8 -- swaps the 6-byte collision-candidate records at
// index param_1 and param_1+1 across all six parallel arrays
// (DAT_00202c38..3d). The swap step sort_collision_candidates' two
// insertion-sort passes call.
void swap_collision_candidates(param_1)
uint param_1;

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  int iVar7;
  int iVar8;
  
  iVar7 = (param_1 & 0xff) * 6;
  uVar1 = (&DAT_00202c38)[iVar7];
  iVar8 = ((param_1 & 0xff) + 1) * 6;
  uVar2 = (&DAT_00202c39)[iVar7];
  uVar3 = (&DAT_00202c3a)[iVar7];
  uVar4 = (&DAT_00202c3b)[iVar7];
  uVar5 = (&DAT_00202c3c)[iVar7];
  uVar6 = (&DAT_00202c3d)[iVar7];
  (&DAT_00202c38)[iVar7] = (&DAT_00202c38)[iVar8];
  (&DAT_00202c39)[iVar7] = (&DAT_00202c39)[iVar8];
  (&DAT_00202c3a)[iVar7] = (&DAT_00202c3a)[iVar8];
  (&DAT_00202c3b)[iVar7] = (&DAT_00202c3b)[iVar8];
  (&DAT_00202c3c)[iVar7] = (&DAT_00202c3c)[iVar8];
  (&DAT_00202c3d)[iVar7] = (&DAT_00202c3d)[iVar8];
  (&DAT_00202c38)[iVar8] = uVar1;
  (&DAT_00202c39)[iVar8] = uVar2;
  (&DAT_00202c3a)[iVar8] = uVar3;
  (&DAT_00202c3b)[iVar8] = uVar4;
  (&DAT_00202c3c)[iVar8] = uVar5;
  (&DAT_00202c3d)[iVar8] = uVar6;
  return;
}



// was FUN_00051dd0 -- insertion-sorts collision_add_candidate_object's
// candidate list (up to the count at DAT_00202c6c+0x14) by X position
// then Y position, each pass swapping out-of-order pairs via
// swap_collision_candidates, then scans forward from the sorted
// position to find the first candidate whose Y extent still overlaps
// the current search bounds, recording that index at
// DAT_00202c6c+0x15 (consumed by callers as a found/not-found flag)
// and the X-pass's split point at +0x16.
void sort_collision_candidates()

{
  char cVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  char *iVar5;
  int iVar6;
  int iVar7;
  
  iVar7 = 0;
  cVar1 = *(char *)(DAT_00202c6c + 9);
  uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x14);
  iVar5 = DAT_00202c6c;
  if (uVar2 != 0) {
    do {
      for (iVar3 = uVar2 - 2; iVar3 = iVar3 * 0x1000000 >> 0x18, iVar7 <= iVar3; iVar3 = iVar3 + -1)
      {
        if ((byte)(&DAT_00202c3e)[iVar3 * 6] < (byte)(&DAT_00202c38)[iVar3 * 6]) {
          /* Ghidra dropped the swap index argument: this is an insertion-
             sort pass over up to 255 collision candidates, swapping the
             pair at iVar3/iVar3+1 when out of order. Called with no
             argument, swap_collision_candidates's param_1 read whatever garbage was
             left in the argument register, swapping (and reading/
             writing) an arbitrary 6-byte record pair instead of the
             intended one -- the real data at iVar3 never actually got
             sorted, so the loop's own termination condition kept
             re-triggering: confirmed via `sample` showing 100% of a
             hung process's time stuck in this exact function, walking
             into an obstacle (e.g. standing next to a critter) near
             tile (17,7). Also a wild write whenever the garbage index
             landed outside the real ~255-entry table. */
          swap_collision_candidates(iVar3);
          iVar5 = DAT_00202c6c;
        }
      }
      if (*(short *)(iVar5 + 4) < (short)(ushort)(byte)(&DAT_00202c38)[iVar7 * 6]) break;
      uVar2 = (uint)*(byte *)(iVar5 + 0x14);
      iVar7 = (iVar7 + 1) * 0x1000000 >> 0x18;
    } while (iVar7 < (int)uVar2);
  }
  uVar2 = (uint)*(byte *)(iVar5 + 0x14);
  iVar3 = (int)(char)iVar7;
  iVar6 = iVar3;
  if (iVar3 < (int)uVar2) {
    do {
      for (iVar4 = uVar2 - 2; iVar4 = iVar4 * 0x1000000 >> 0x18, iVar6 <= iVar4; iVar4 = iVar4 + -1)
      {
        if ((byte)(&DAT_00202c3f)[iVar4 * 6] < (byte)(&DAT_00202c39)[iVar4 * 6]) {
          /* Same dropped-argument fix as the X-axis sort pass above --
             this is the Y-axis pass, swap index is iVar4. */
          swap_collision_candidates(iVar4);
          iVar5 = DAT_00202c6c;
        }
      }
      uVar2 = (uint)*(byte *)(iVar5 + 0x14);
      iVar6 = (iVar6 + 1) * 0x1000000 >> 0x18;
    } while (iVar6 < (int)uVar2);
  }
  *(char *)(iVar5 + 0x16) = (char)iVar7;
  *(undefined1 *)(DAT_00202c6c + 0x15) = 0;
  uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x15);
  iVar7 = uVar2 + iVar3;
  if (iVar7 < (int)(uint)*(byte *)(DAT_00202c6c + 0x14)) {
    do {
      if ((int)((uint)*(byte *)(DAT_00202c6c + 9) + (int)*(short *)(DAT_00202c6c + 4) +
               (int)(cVar1 == '\0')) <= (int)(uint)(byte)(&DAT_00202c39)[iVar7 * 6]) {
        return;
      }
      *(char *)(DAT_00202c6c + 0x15) = (char)uVar2 + '\x01';
      uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x15);
      iVar7 = uVar2 + iVar3;
    } while (iVar7 < (int)(uint)*(byte *)(DAT_00202c6c + 0x14));
  }
  return;
}


// was FUN_00051fa0 -- checks whether an object of catalog type
// param_1 could occupy tile position (param_3,param_4) at candidate
// height param_5 without being blocked by the current collision-
// candidate list (built via collision_build_height_field/
// collision_height_envelope/sort_collision_candidates). param_2 is a
// caller-specific context value (an encoded arena slot index for the
// door-swing caller, per the UW_DEBUG_DOOR comment below; 0/1/etc for
// others); param_6 appears to force success when nonzero; param_7 is
// forwarded to collision_build_height_field as its search-radius-like
// argument. Confirmed used throughout the codebase for object
// placement (place_object_in_world/spawn helpers), throw-aim
// validation (item_use.c), door swing step clearance (scheduler.c),
// and NPC movement (ai.c) -- a general "can this object type fit
// here at this height" collision query. Exact return-value polarity
// may read differently per call site (see e.g. scheduler.c's own
// "0=settle proceeds, nonzero=skip" comment at its call) -- left
// unclaimed here rather than asserted without call-site-by-call-site
// verification.
undefined4 check_object_placement_clearance(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
short param_1;
short param_2;
undefined2 param_3;
undefined2 param_4;
short param_5;
int param_6;
byte param_7;

{
  byte bVar1;
  char *uVar2;
  undefined4 uVar3;
  ushort *puVar4;
  uint uVar5;
  int iVar6;
  short sVar7;
  uint uVar8;
  /* Was 6 independent locals (local_3c/3a/38/34/33/32) with
     DAT_00202c6c = &local_3c, and every DAT_00202c6c[N] access
     throughout this file (collision_build_height_field,
     collision_corner_flags, collision_height_envelope, etc.) assuming
     they're one contiguous record at their Ghidra-stack-offset-implied
     byte positions (0/2/4/8/9/0xa -- 0x3c-0x3a=2, 0x3a-0x38=2,
     0x38-0x34=4, 0x34-0x33=1, 0x33-0x32=1). That layout only held in
     the original 32-bit ARM binary's own stack frame; as independent
     C locals here, this compiler is free to place them in any order
     with any padding, so nearly every DAT_00202c6c[N] read was
     whatever adjacent stack byte happened to land there instead of the
     intended field -- confirmed via a direct struct dump: param_4 (Y,
     expected at offset 2-3) printed 24, but DAT_00202c6c[2] read back
     8, not 24. This is what fed collision_height_envelope's floor-
     height selection (DAT_00202c30) garbage, causing a discrete
     SHIFT+<dir> step to occasionally place the player's height at a
     wildly wrong value (reported as "ends up at the ceiling"). Same
     "split-symbol cluster" bug class fixed elsewhere this session for
     globals (e.g. DAT_00204880_backing); here as a real backing array
     since these are genuinely local to one call. Sized generously
     (0x20) past the highest offset (0x13) any reader/writer touches. */
  undefined1 local_pos_record[0x20];
#define local_3c (*(undefined2 *)(local_pos_record + 0))
#define local_3a (*(undefined2 *)(local_pos_record + 2))
#define local_38 (*(short *)(local_pos_record + 4))
#define local_34 (local_pos_record[8])
#define local_33 (local_pos_record[9])
#define local_32 (*(short *)(local_pos_record + 0xa))
  int iVar9;

  uVar2 = DAT_00202c6c;
  ce_memset(local_pos_record, 0, sizeof(local_pos_record));
  DAT_00202c6c = local_pos_record;
  local_33 = (&DAT_00202c90)[param_1 * 0xd];
  local_34 = (&DAT_00202c91)[param_1 * 0xd] & 7;
  local_38 = param_5;
  if ((local_33 == 0x80) || ((int)((uint)local_33 + (int)param_5) < 0x80)) {
    uVar8 = (uint)param_7;
    local_3c = param_3;
    local_3a = param_4;
    local_32 = param_2;
    if (getenv("UW_DEBUG_STEPHEIGHT"))
      fprintf(stderr, "[fa0-params] p1=%d p2=%d p3=%d p4=%d p5=%u p6=%d p7=%u local33=%d local34=%d\n",
              (int)param_1, (int)param_2, (int)(short)param_3, (int)(short)param_4,
              (unsigned)param_5, (int)param_6, (unsigned)param_7, (int)local_33, (int)local_34);
    collision_build_height_field(uVar8);
    if (getenv("UW_DEBUG_STEPHEIGHT")) {
      int _i;
      fprintf(stderr, "[fa0-struct]");
      for (_i = 0; _i < 0x14; _i++) fprintf(stderr, " [%x]=%d", _i, (int)(unsigned char)DAT_00202c6c[_i]);
      fprintf(stderr, "\n");
    }
    /* HACK: every offset below this point (0xc, 0xe, 0x10, 0x14, 0x15, 0x16)
       was wrong -- DAT_00202c6c is a real `byte *` (confirmed by its own
       declaration and by collision_build_height_field's/collision_classify_corner_wall's own,
       independently-verified-correct byte-offset arithmetic on the exact
       same pointer, e.g. `DAT_00202c6c + 0xc`/`+ 0xe` for the flags word,
       `+ 0x11` for the max-height sentinel). This block instead used a mix
       of `DAT_00202c6c[N]` bare indices and decimal-vs-hex-confused offsets
       (`+ 10` meaning decimal 10 = 0xa, not the intended 0x14) that don't
       correspond to anything collision_build_height_field actually writes --
       most read either stale zero bytes or, worse, `local_32` (offset 0xa,
       holding this call's own `param_2` -- the door/object's own encoded
       arena slot index, e.g. 1013) reinterpreted as a "how many collision
       candidates" count. Confirmed live (UW_DEBUG_DOOR, chasing "a door
       used a second time re-opens instead of closing"): with the bug, this
       function walked sort_collision_candidates's candidate-sort loop believing there
       were up to 255 real candidates (really just the slot index's own low
       byte), reading far out of bounds through DAT_00202c38/DAT_00202c39
       and returning an essentially arbitrary 0 or 1 that differed per
       door/slot -- which scheduler_advance_effect (the only caller reachable
       from a door's own close swing) uses to decide whether to prematurely
       clear the swing's direction bit. Retyped every access in this block to
       match the real disassembly's own literal byte offsets exactly (fresh
       Ghidra decompile of check_object_placement_clearance @ 0x51fa0), so the real, always-empty
       candidate count at offset 0x14 is what's actually checked -- doors now
       correctly finish their close swing instead of re-opening. */
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[fa0-check] off0xc_0xe=0x%x off0x14=%d param_2(slot)=%d\n",
              (unsigned)(*(ushort *)(DAT_00202c6c + 0xc) | *(ushort *)(DAT_00202c6c + 0xe)),
              (int)(unsigned char)DAT_00202c6c[0x14], (int)param_2);
    if (((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
      bVar1 = *(byte *)(DAT_00202c6c + 0x11);
      if ((int)(uVar8 + (int)*(short *)(DAT_00202c6c + 4)) < (int)(uint)bVar1) {
        bVar1 = *(byte *)(DAT_00202c6c + 0x10);
      }
      if (getenv("UW_DEBUG_STEPHEIGHT"))
        fprintf(stderr, "[stepheight] uVar8=%u c6c4=%d c6c10=%d c6c11=%d c6c0xc=%d -> DAT_00202c30=%d cur_z=%d\n",
                uVar8, (int)*(short *)(DAT_00202c6c + 4), (int)*(byte *)(DAT_00202c6c + 0x10),
                (int)*(byte *)(DAT_00202c6c + 0x11), (int)*(short *)(DAT_00202c6c + 0xc),
                (int)bVar1, (int)DAT_00204884);
      DAT_00202c30 = (ushort)bVar1;
      uVar5 = (uint)*(byte *)(DAT_00202c6c + 8);
      if ((uint)(int)(short)(ushort)*(byte *)(DAT_00202c6c + 8) < uVar8) {
        uVar5 = uVar8;
      }
      if ((int)((uint)*(byte *)(DAT_00202c6c + 0x10) + (int)(short)uVar5) < (int)*(short *)(DAT_00202c6c + 4)
         ) {
        DAT_00202c68 = 0x10;
      }
      else {
        DAT_00202c68 = (short)(1 << ((int)*(short *)(DAT_00202c6c + 0xc) & 3U));
      }
      if ((DAT_00202c68 == 0x10) || (uVar3 = 1, param_2 < 0x100)) {
        uVar3 = 0;
      }
      collision_height_envelope(uVar3,1);
      if (getenv("UW_DEBUG_DOOR"))
        fprintf(stderr, "[fa0-check2] after collision_height_envelope: off0x14=%d off0x15=%d off0x16=%d uVar3(envelope_arg)=%d\n",
                (int)(unsigned char)DAT_00202c6c[0x14], (int)(unsigned char)DAT_00202c6c[0x15],
                (int)(unsigned char)DAT_00202c6c[0x16], (int)uVar3);
      if (*(char *)(DAT_00202c6c + 0x14) != '\0') {
        iVar9 = -1;
        sVar7 = -1;
        sort_collision_candidates();
        if (*(char *)(DAT_00202c6c + 0x15) != '\0') {
          DAT_00202c6c = uVar2;
          return 0;
        }
        if ((*(char *)(DAT_00202c6c + 0x14) != '\0') &&
           (iVar6 = 0, '\0' < *(char *)(DAT_00202c6c + 0x16))) {
          do {
            sVar7 = (short)iVar9;
            if ((short)DAT_00202c30 < (short)(ushort)(byte)(&DAT_00202c38)[iVar6 * 6]) {
              sVar7 = (short)iVar6;
              iVar9 = iVar6;
              DAT_00202c30 = (ushort)(byte)(&DAT_00202c38)[iVar6 * 6];
            }
            iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
          } while (iVar6 < *(char *)(DAT_00202c6c + 0x16));
        }
        if (-1 < sVar7) {
          puVar4 = (ushort *)resolve_object_link(&DAT_00202c3a + sVar7 * 6);
          /* Was an unguarded `*puVar4` -- resolve_object_link legitimately
             returns NULL when the candidate slot (&DAT_00202c3a +
             sVar7*6) has no object linked there at all, same class as
             scheduler_add_entry's own already-fixed missing NULL guard
             (swinging at empty air/a wall). Confirmed live: this
             crashed 100% of the time emptying the starting-room sack's
             contents via Use mode -- empty_container_into_world's
             randomized scatter (find_object_placement) lands an item
             on a tile whose best-height candidate slot (sVar7, chosen
             just above) has no object registered, and this was the
             first path to ever dereference that NULL. No object linked
             here means there's nothing to check the "blocks passage"
             flag on, so treat it as NOT blocking (skip the `return 0`)
             rather than crash. */
          if ((puVar4 != (ushort *)0x0) &&
             (((&DAT_00202c93)[(*puVar4 & 0x1ff) * 0xd] & 2) == 0)) {
            DAT_00202c6c = uVar2;
            return 0;
          }
          DAT_00202c68 = 1;
        }
      }
      if ((param_6 != 0) ||
         (((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x800) == 0) ||
         ((int)((int)*(short *)(DAT_00202c6c + 4) - uVar8) <= (int)(short)DAT_00202c30)) {
        DAT_00202c6c = uVar2;
        return 1;
      }
      DAT_00202c6c = uVar2;
      return 0;
    }
  }
  DAT_00202c6c = uVar2;
  return 0;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* Recovered from UU.exe .data at 0x86878 (28 real bytes, then the
   "\DATA\comobj.dat" string literal). collision_build_height_field's four
   `*(char *)(bVarNN + 0x86878)` derefs are a bare hardcoded original-
   32-bit address -- unmapped on this port, so a keyboard forward step
   (the first thing that ever reached this animated-shade recompute for
   a moving wall) faulted here. The index bytes bVar11..bVar14 stay
   small in practice; pad to 256 with 0 so a wrapped byte reads a
   defined 0 instead of the string bytes the original would have hit. */
static const signed char DAT_00086878_arr[256] = {
  -0x41,-0x40,-0x3f,-1, 0,1,0x3f,0x40, 0x41,0,0,0, 1,-1,-1,1,
  5,4,3,6, 9,2,7,0, 1,0,0,0,
};
#define DAT_00086878_IDX(b) DAT_00086878_arr[(unsigned char)(b)]

/* collision_build_height_field looks at a NEIGHBOR tile's shade value by
   offsetting its own current tile pointer (into the tilemap, the first
   0x4000 bytes of the level arena -- see uw-formats.txt) by a signed
   per-direction step from DAT_00086878_arr. Near the map edge, that
   neighbor can legitimately fall outside the tilemap entirely -- this
   function already guards the analogous case for the CURRENT tile
   (`if (_DAT_00202c34 == NULL) return;`, a few lines up) via
   tilemap_lookup's own bounds check, but had no equivalent guard for
   these neighbor derefs. Confirmed live via ASan: a heap-buffer-overflow
   read 260 bytes before the arena's own start (ushort index -130, i.e.
   DAT_00086878_arr[0]'s -0x41 real, recovered offset) on ordinary
   forward movement near a map edge -- not a data-recovery gap in the
   table (that index's value IS real, recovered data), just a genuinely
   off-map neighbor with nothing stopping the read. Same "no object"-
   style defensive treatment as resolve_object_link's own out-of-range
   guard: skip the neighbor (leave its shade unresolved) instead of
   reading unmapped/unrelated memory. */
ushort collision_neighbor_shade_or_zero(ushort *base, byte idx) {
  ptrdiff_t off = (ptrdiff_t)DAT_00086878_IDX(idx) * 2;
  ushort *p = base + off;
  if ((char *)p < DAT_002029cc || (char *)(p + 1) > DAT_002029cc + 0x4000) {
    return 0;
  }
  return *p;
}


// was FUN_00050984 -- sample the floor height at one tile corner (type 0 solid -> 0x80)
// PHYSICS: floor height source -- returns the standable height at corner param_1
// of the current tile: 0x80 (= tile top, "no floor / solid") for a rock tile,
// height*8 for flat floor, and interpolated values for slopes/diagonals.
uint collision_sample_floor_height(param_1,param_2)
uint param_1;
undefined4 * param_2;

{
  byte bVar1;
  short sVar2;
  uint uVar3;
  int iVar4;

  iVar4 = (param_1 & 0xff) * 5;
  sVar2 = *(short *)(&DAT_00202c70 + (uint)(byte)(&DAT_00202bf8)[iVar4] * 2);
  *param_2 = 0;
  // PHYSICS: floor height -- (corner height nibble) * 8; refined per shape below
  uVar3 = (int)sVar2 >> 1 & 0x78;
  switch(*(ushort *)(&DAT_00202c70 + (uint)(byte)(&DAT_00202bf8)[iVar4] * 2) & 0xf) {
  case 0:
    uVar3 = 0x80;
    break;
  case 1:
    break;
  case 2:
    if ((byte)(&DAT_00202bf9)[iVar4] <= (byte)(&DAT_00202bfa)[iVar4]) {
LAB_00050a64:
      uVar3 = 0x80;
    }
    goto LAB_00050a68;
  case 3:
    if (6 < (uint)(byte)(&DAT_00202bf9)[iVar4] + (uint)(byte)(&DAT_00202bfa)[iVar4])
    goto LAB_00050a64;
    goto LAB_00050a68;
  case 4:
    if ((uint)(byte)(&DAT_00202bf9)[iVar4] + (uint)(byte)(&DAT_00202bfa)[iVar4] < 8)
    goto LAB_00050a64;
    goto LAB_00050a68;
  case 5:
    if ((byte)(&DAT_00202bfa)[iVar4] <= (byte)(&DAT_00202bf9)[iVar4]) goto LAB_00050a64;
LAB_00050a68:
    *param_2 = 1;
    break;
  case 6:
    bVar1 = (&DAT_00202bfa)[iVar4];
    goto LAB_00050a88;
  case 7:
    bVar1 = (&DAT_00202bfa)[iVar4];
    goto LAB_00050a98;
  case 8:
    bVar1 = (&DAT_00202bf9)[iVar4];
LAB_00050a88:
    uVar3 = (bVar1 & 7) + uVar3;
    break;
  case 9:
    bVar1 = (&DAT_00202bf9)[iVar4];
LAB_00050a98:
    uVar3 = (uVar3 - (bVar1 & 7)) + 7;
  }
  return uVar3;
}
