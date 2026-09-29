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

