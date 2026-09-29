/* Door open/close/toggle handlers and the doors.GR frame-buffer allocator.
 *
 * close_door_object/open_door_object/toggle_door_object were originally
 * FUN_0007c580/FUN_0007c708/FUN_0007c814 -- see uw.h and the comment on
 * open_door_object for how the naming was confirmed (live repro tied
 * FUN_0007c708 to the "closed -> open" quality transition). */
#include "headers/doors.h"
#include <stdio.h>
#include <stdlib.h>

// was LAB_000415b4
void *alloc_door_frame_buffer(param_1)
unsigned int param_1;

{
  /* Ghidra couldn't resolve this address into a proper function (an
     indirect-jump/jumptable target it gave up on). Was stubbed as a
     bare `return 0;`, on the (wrong) assumption that it's "used purely
     as a callback pointer elsewhere" -- it's actually passed as
     load_door_frames's (doors.GR) allocator callback, the exact same role
     as LAB_000415b0/LAB_000416e8/LAB_000416f8 (see LAB_000415b0's own
     comment: a no-op allocator here makes load_gr_resource_entries treat every real
     resource load as a failure even though the file read itself
     succeeds) -- confirmed live via UW_DEBUG_DOOR: every one of doors.GR's
     6 entries opened and read its header fine, then failed right at the
     allocate-a-destination-buffer step. Real allocator like its
     siblings. */
  return Ordinal_1041(param_1);
}




// was FUN_0007c580
void close_door_object(param_1,param_2)
char *param_1;
ushort * param_2;

{
  ushort uVar1;
  byte bVar2;
  undefined4 uVar3;
  ushort uVar4;

  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] close_door_object (close) called: obj0=0x%04x dirbit=%d openbits=%d quality_low4=%d\n",
            (unsigned)*param_2, (int)((*param_2 & 0x1000) != 0), (int)((*param_2 >> 9) & 7), (int)(param_2[3] & 0xf));
  if ((*param_2 & 0x1ff) == 0x1cf) {
    uVar4 = param_2[3];
    if ((uVar4 & 0xf) < 8) {
      return;
    }
    *(byte *)(param_2 + 3) = ((char)(uVar4 & 0xf) - 8U ^ (byte)uVar4) & 0x3f ^ (byte)uVar4;
    *(byte *)((char *)param_2 + 7) = (byte)(uVar4 >> 8);
    FUN_0007c4a8(param_2);
  }
  else {
    uVar4 = *param_2 & 0xf;
    if (7 < uVar4) {
      return;
    }
    uVar1 = param_2[3];
    *(byte *)(param_2 + 3) = (byte)(uVar1 & 0xfffe);
    *(byte *)((char *)param_2 + 7) = (byte)((uVar1 & 0xfffe) >> 8);
    if (uVar4 != 6) {
      uVar4 = param_2[1];
      bVar2 = (byte)uVar4;
      *(byte *)(param_2 + 1) = (bVar2 + 0x18 ^ bVar2) & 0x7f ^ bVar2;
      *(byte *)((char *)param_2 + 3) = (byte)(uVar4 >> 8);
    }
    FUN_0007c2ec(param_1,param_2,7,(int)DAT_002020a0,DAT_002020a4);
    FUN_0007c3f4(param_2);
  }
  uVar3 = 0x14;
  if ((*param_2 & 7) != 6) {
    uVar3 = 0xb;
  }
  FUN_00072c74(uVar3,(uint)(*(byte *)((char *)param_2 + 3) >> 5) + DAT_002020a0 * 8,
               (*(byte *)((char *)param_2 + 3) >> 2 & 7) + DAT_002020a4 * 8,0);
  return;
}



// was FUN_0007c708 -- confirmed live as the real "open door" builtin (see
// the door-quality analysis a few thousand lines up, near DAT_0018957a):
// a single guarded (quality & 0xf) + 8 step, closed(0-7) -> open(8-15).
void open_door_object(param_1)
ushort * param_1;

{
  ushort uVar1;
  undefined4 uVar2;

  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] open_door_object called: obj0=0x%04x already_1cf=%d quality_low4=%d\n",
            (unsigned)*param_1, (int)((*param_1 & 0x1ff) == 0x1cf), (int)(param_1[3] & 0xf));
  if ((*param_1 & 0x1ff) == 0x1cf) {
    uVar1 = param_1[3];
    if (7 < (uVar1 & 0xf)) {
      return;
    }
    *(byte *)(param_1 + 3) = ((char)(uVar1 & 0xf) + 8U ^ (byte)uVar1) & 0x3f ^ (byte)uVar1;
    *(byte *)((char *)param_1 + 7) = (byte)(uVar1 >> 8);
    FUN_0007c4a8(param_1);
  }
  else {
    if ((*param_1 & 0xf) < 8) {
      return;
    }
    FUN_0007c3f4(param_1);
  }
  uVar2 = 0x14;
  if ((*param_1 & 7) != 6) {
    uVar2 = 0xb;
  }
  FUN_00072c74(uVar2,(uint)(*(byte *)((char *)param_1 + 3) >> 5) + DAT_002020a0 * 8,
               (*(byte *)((char *)param_1 + 3) >> 2 & 7) + DAT_002020a4 * 8,0);
  return;
}



// was FUN_0007c814
//
// NOTE: for the item_id==0x1cf special-object branch inside
// close_door_object/open_door_object, this dispatch is provably always a
// no-op: closed(<8) routes to close_door_object, whose 0x1cf branch only
// proceeds when quality is ALREADY >=8, and open(>=8) routes to
// open_door_object, whose 0x1cf branch only proceeds when quality is
// ALREADY <8 -- i.e. whichever function gets called, its own guard is
// guaranteed to fail for that item type. Left as originally decompiled
// (only the dropped-argument call below is a clear, unambiguous bug) since
// ordinary (non-0x1cf) doors take the other branch inside each function,
// where the guards DO agree with this dispatch and toggling works.
void toggle_door_object(param_1,param_2)
char *param_1;
byte * param_2;

{
  if ((*param_2 & 0xf) < 8) {
    close_door_object(param_1,param_2);
  }
  else {
    open_door_object(param_2);
  }
  return;
}







// was FUN_00071e20 -- disabled outright on level 9. Projects a target
// tile 11 units ahead of the player's facing (DAT_00201c70) and, if
// that tile is a door (tile_type==1) whose wall texture id falls into
// one of four specific ranges (5-11/18-22/27-31/35-40), checks
// FUN_00051fa0 for whether catalog object 0x1ca can be placed there,
// then spawns one, encodes the door's texture-derived flags/facing
// into it, schedules it with an unbounded duration
// (scheduler_add_entry(...,0xffffffff,...)), and links it into the
// tile's object list. Exact gameplay meaning (which door-texture
// feature this represents) not identified -- no supporting strings or
// comments found nearby.
undefined4 spawn_scheduled_door_texture_object()

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  undefined4 uVar4;
  ushort *puVar5;
  int iVar6;
  undefined1 *puVar7;
  uint uVar8;
  undefined2 uVar9;
  undefined1 uVar10;
  ushort local_18;
  ushort local_16;
  
  if (DAT_00201b68 == 9) {
    uVar4 = 0xffffffff;
  }
  else {
    local_16 = DAT_00204880 >> 5;
    local_18 = DAT_00204882 >> 5;
    project_position_by_heading((int)DAT_00201c70 >> 8,0xb,&local_16,&local_18);
    puVar5 = (ushort *)tilemap_lookup((int)(short)local_16 >> 3,(int)(short)local_18 >> 3);
    uVar1 = *puVar5;
    if (((uVar1 & 0xf) == 1) &&
       (((((sVar3 = (&DAT_0023adb8)[uVar1 >> 10 & 0xf], 4 < sVar3 && (sVar3 < 0xc)) ||
          ((0x11 < sVar3 && (sVar3 < 0x17)))) || ((0x1a < sVar3 && (sVar3 < 0x20)))) ||
        ((0x22 < sVar3 && (sVar3 < 0x29)))))) {
      uVar8 = (uVar1 >> 4 & 0xf) << 3;
      uVar9 = (undefined2)uVar8;
      iVar6 = FUN_00051fa0(0x1ca,0,(int)(short)local_16,(int)(short)local_18,uVar9,0,0);
      uVar10 = (undefined1)((ushort)uVar9 >> 8);
      if (iVar6 != 0) {
        puVar7 = (undefined1 *)spawn_new_object(0x1ca,0);
        uVar1 = *(ushort *)(puVar7 + 2);
        uVar8 = (uVar1 ^ uVar8) & 0x7f ^ (uint)uVar1;
        puVar7[2] = (char)uVar8;
        puVar7[3] = (char)(uVar1 >> 8);
        bVar2 = (byte)(((local_16 & 7) << 0xd) >> 8);
        puVar7[2] = (char)(uVar8 & 0x1fff);
        puVar7[3] = (byte)((uVar8 & 0x1fff) >> 8) | bVar2;
        puVar7[2] = (char)(uVar8 & 0x3ff);
        puVar7[3] = (byte)((uVar8 & 0x3ff) >> 8) | bVar2 | (byte)(((local_18 & 7) << 10) >> 8);
        *puVar7 = *puVar7;
        puVar7[1] = puVar7[1] | 0x20;
        uVar4 = encode_object_slot_index(puVar7);
        sVar3 = scheduler_add_entry(uVar4,0xffffffff,0,(short)local_16 >> 3 & 0xff,
                             CONCAT11(uVar10,(char)((short)local_18 >> 3)));
        if (sVar3 != 0) {
          *(byte *)(DAT_00086df8 + 0x5e) =
               (byte)(((int)DAT_00201b68 & 0xfU) << 4) | *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
          object_list_insert_head(puVar5 + 1,puVar7);
          return 1;
        }
        free_object_slot(puVar7);
      }
    }
    uVar4 = 0;
  }
  return uVar4;
}
