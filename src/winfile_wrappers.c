/* Decompiled CreateFile/ReadFile/WriteFile/SetFilePointer/CloseHandle- shaped coredll wrapper
   thunks (win_file_exists, open_existing_file_rw, close_file_handle, open_file_for_read,
   open_existing_file_rw_alt, seek_file_handle, read_file_handle, write_file_handle)... */
#include "headers/winfile_wrappers.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>



// was FUN_000226e8 -- CreateFile(GENERIC_READ, OPEN_EXISTING) immediately followed by CloseHandle:
// a "does this file exist" probe, not a real open.
undefined4 win_file_exists(path,param_2)
char *path;
undefined4 param_2;

{
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating load_string_resource's
     real pointer -- same class as that function's own fix... */
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



/* --- Real file I/O These 7 functions are CreateFile/ReadFile/WriteFile/SetFilePointer/
   CloseHandle-shaped wrappers around coredll ordinals... */

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



/* Was `uw_file_open_read(param_1)` (read-only, "rb") -- confirmed WRONG via Ghidra headless: the
   real ARM body (0x22810) calls `CreateFileW(fname, 0xc0000000, 1, 0, 3, 0x80, 0)` --
   GENERIC_READ|GENERIC_WRITE (0xc0000000), OPEN_EXISTING (disposition 3) -- a read-write handle... */
// was FUN_00022810
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
