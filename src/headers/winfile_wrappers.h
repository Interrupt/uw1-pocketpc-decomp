#ifndef HEADERS_WINFILE_WRAPPERS_H
#define HEADERS_WINFILE_WRAPPERS_H

/* Declarations for winfile_wrappers.c: the decompiled CreateFile/
   ReadFile/WriteFile/SetFilePointer/CloseHandle-shaped coredll wrapper thunks, implemented directly
   against file_io.c's real file I/O. */
#include "uw.h"

int win_file_exists(char *path, undefined4 reserved);
int open_existing_file_rw(char *path);
bool close_file_handle(char *filename);
int open_file_for_read(const char *path);
int open_existing_file_rw_alt(const char *path);
int seek_file_handle(int handle, int offset, int whence);
int read_file_handle(int handle, void *buffer, uint byte_count);
int write_file_handle(int handle, const void *buffer, uint byte_count);

#endif
