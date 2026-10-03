#ifndef HEADERS_WINFILE_WRAPPERS_H
#define HEADERS_WINFILE_WRAPPERS_H

/* Declarations for winfile_wrappers.c: the decompiled CreateFile/
 * ReadFile/WriteFile/SetFilePointer/CloseHandle-shaped coredll wrapper
 * thunks, implemented directly against file_io.c's real file I/O.
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

#endif
