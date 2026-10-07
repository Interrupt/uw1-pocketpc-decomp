#ifndef HEADERS_WINFILE_WRAPPERS_H
#define HEADERS_WINFILE_WRAPPERS_H

/* Declarations for winfile_wrappers.c: the decompiled CreateFile/
   ReadFile/WriteFile/SetFilePointer/CloseHandle-shaped coredll wrapper thunks, implemented directly
   against file_io.c's real file I/O. */
#include "uw.h"

undefined4 win_file_exists();
undefined4 open_existing_file_rw();
bool close_file_handle();
undefined4 open_file_for_read();
undefined4 open_existing_file_rw_alt();
undefined4 seek_file_handle();
undefined4 read_file_handle();
undefined4 write_file_handle();

#endif
