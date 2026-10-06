#ifndef HEADERS_WINFILE_WRAPPERS_H
#define HEADERS_WINFILE_WRAPPERS_H

/* Declarations for winfile_wrappers.c: the decompiled CreateFile/
   ReadFile/WriteFile/SetFilePointer/CloseHandle-shaped coredll wrapper thunks, implemented directly
   against file_io.c's real file I/O. */
#include "uw.h"

undefined4 win_file_exists(char *path, undefined4 reserved);
undefined4 open_existing_file_rw(char *path);
bool close_file_handle(char *filename);
undefined4 open_file_for_read(const char *path);
undefined4 open_existing_file_rw_alt(const char *path);
undefined4 seek_file_handle(int handle, int offset, int whence);
undefined4 read_file_handle(int handle, void *buffer, uint byte_count);
undefined4 write_file_handle(int handle, const void *buffer, uint byte_count);

#endif
