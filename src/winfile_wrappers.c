/* Decompiled CreateFile/ReadFile/WriteFile/SetFilePointer/CloseHandle-
 * shaped coredll wrapper thunks (win_file_exists, open_existing_file_rw,
 * close_file_handle, open_file_for_read, open_existing_file_rw_alt,
 * seek_file_handle, read_file_handle, write_file_handle), implemented
 * directly against file_io.c's real file I/O. Split out of uw.c (the
 * original monolithic decompile) once these functions' real roles were
 * confirmed. Kept separate from file_io.c itself: that file is a clean,
 * uw.h-independent host-side implementation, and pulling in uw.h's
 * Ghidra-style typedefs (undefined4, bool, ...) here would break that
 * separation.
 */
#include "headers/winfile_wrappers.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>



// was FUN_000226e8 -- CreateFile(GENERIC_READ, OPEN_EXISTING) immediately
// followed by CloseHandle: a "does this file exist" probe, not a real
// open. MERGE NOTE (unit-testing-framework): this function itself had the
// dropped argument -- confirmed by both of its real call sites
// (src/saveload.c) always passing a path, despite this declaration taking
// none. Fixed by adding the `path` parameter and forwarding it to
// load_string_resource (was FUN_0002295c, see its own comment), which
// needs an argument too (previously called bare here -- the two dropped-
// argument bugs were masking each other). The unit-testing-framework
// branch's independent fix called this same ordinal "prepares the
// supplied path for the ordinal file API" rather than a LoadString-style
// resource loader -- load_string_resource's real behavior may need
// re-examining in light of this (its other ~15 call sites also pass
// path-shaped stack buffers, not integer resource ids -- see todo.md).
undefined4 win_file_exists(path)
char *path;

{
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating
     load_string_resource's real pointer -- same class as that
     function's own fix (currently harmless here since CreateFileW is
     an unimplemented no-op stub that ignores this argument, but fixed
     for correctness/consistency). */
  char *uVar1;
  int iVar2;

  uVar1 = load_string_resource(path);
  iVar2 = CreateFileW(uVar1,0x80000000,1,0,3,0x80,0);
  if (iVar2 == -1) {
    uVar1 = 0xffffffff;
  }
  else {
    CloseHandle(iVar2);
    uVar1 = 0;
  }
  return uVar1;
}



/* --- Real file I/O -------------------------------------------------
 * These 7 functions are CreateFile/ReadFile/WriteFile/SetFilePointer/
 * CloseHandle-shaped wrappers around coredll ordinals (CreateFileW =
 * CreateFile, ReadFile = ReadFile, WriteFile = WriteFile,
 * SetFilePointer = SetFilePointer, create_directory_path = CloseHandle -- identified
 * from their argument shapes, e.g. CreateFileW(path, 0xC0000000,
 * 1, 0, disposition, 0x80, 0) matches CreateFile's
 * (name, access, share, secattrs, disposition, flags, template)).
 * Several of these wrappers also had their own arguments dropped by
 * Ghidra (declared with zero visible parameters despite being called
 * with 1-3 args elsewhere), so on top of the ordinals being stubs, the
 * wrappers themselves couldn't have forwarded real arguments even with a
 * working CreateFile/ReadFile stub behind them. Given both layers needed
 * reconstructing, they're implemented directly against real file I/O
 * (file_io.h) rather than routing back through fake Win32 ordinals. */

// was FUN_0002273c
undefined4 open_existing_file_rw(param_1)
char *param_1;

{
  return (undefined4)uw_file_open_write(param_1, 0);
}



// was FUN_000227b8
/* All original callers pass a filename: this is the DeleteFile-shaped
   wrapper used to replace an archive and remove its temporary file. */
bool close_file_handle(param_1)
char *param_1;

{
  char path[4096];
  return uw_resolve_win_path(param_1,path,sizeof path) && remove(path) == 0;
}



// was FUN_000227d4
undefined4 open_file_for_read(param_1)
char *param_1;

{
  return (undefined4)uw_file_open_read(param_1);
}



/* Was `uw_file_open_read(param_1)` (read-only, "rb") -- confirmed WRONG
   via Ghidra headless: the real ARM body (0x22810) calls
   `CreateFileW(fname, 0xc0000000, 1, 0, 3, 0x80, 0)` --
   GENERIC_READ|GENERIC_WRITE (0xc0000000), OPEN_EXISTING (disposition
   3) -- a read-write handle, not read-only. Every one of this port's 3
   real callers already relies on that: save_npc_conversation_variables (this file's
   per-NPC conversation-variable save to \SAVE0\bglobals.dat, called at
   the end of every babl-VM interpreter yield) opens through this
   function then immediately writes through the same handle -- silently
   a no-op with the old read-only mapping, which is why NO conversation
   state (attitude progress, quest-style script variables, and
   critically npc_talkedto) ever actually persisted to disk: every
   subsequent conversation reloaded whatever bglobals.dat already held
   (its first, likely-all-zero content) instead of what the script had
   just set, making every NPC's dialogue look like the player's first
   meeting every single time. The other 2 callers (uw.c ~9516 and
   ~28019) write through this same handle too, confirming the fix
   applies uniformly. A sibling call site (uw.c ~9270, the level-save
   archive path) had already independently hit this identical bug and
   was fixed there by switching that ONE call site to open_existing_file_rw
   instead of touching this function's body -- fixing the real root
   cause here supersedes that workaround without conflicting with it
   (open_existing_file_rw is also read-write, just with different
   create-vs-open-existing disposition logic). */
undefined4 open_existing_file_rw_alt(param_1)
char *param_1;

{
  return (undefined4)uw_file_open_write(param_1, 0);
}




// was FUN_00022850
undefined4 seek_file_handle(param_1,param_2,param_3)
int param_1;
int param_2;
int param_3;

{
  return (undefined4)uw_file_seek(param_1, param_2, param_3);
}



// was FUN_0002285c
undefined4 read_file_handle(param_1,param_2,param_3)
int param_1;
void *param_2;
unsigned int param_3;

{
  return (undefined4)uw_file_read(param_1, param_2, param_3);
}



// was FUN_00022884
undefined4 write_file_handle(param_1,param_2,param_3)
int param_1;
void *param_2;
unsigned int param_3;

{
  return (undefined4)uw_file_write(param_1, param_2, param_3);
}
