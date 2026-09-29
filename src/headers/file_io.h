#ifndef FILE_IO_H
#define FILE_IO_H

/* Real file I/O backing the game's CreateFile/ReadFile/WriteFile/
 * SetFilePointer/CloseHandle-shaped coredll wrappers. Handles are small
 * integers (table indices), not real pointers, so they survive being
 * packed into narrow (32-bit-ish) fields the way the decompiled code
 * does. Game paths are Windows-style ("\DATA\cnv.ark") relative to a base
 * directory read from the UW_DATA_DIR environment variable. */

int uw_file_open_read(const char *win_path);
int uw_file_open_write(const char *win_path, int create_always);
int uw_file_read(int handle, void *buf, unsigned int size);
int uw_file_write(int handle, const void *buf, unsigned int size);
int uw_file_seek(int handle, int distance, int method);
int uw_file_close(int handle);

/* A handful of ordinals (see ordinal_stubs.c: 1113/1114) are the real C
 * runtime's fopen/fscanf exposed by coredll, used directly by the game's
 * own text script parser (conversation/cutscene scripts) instead of going
 * through CreateFile/ReadFile -- they need the same Windows-style path
 * resolution as uw_file_open_read, but returning a real FILE* since the
 * caller uses it with fscanf, not the integer-handle CreateFile family. */
void *uw_file_fopen(const char *win_path, const char *mode);

/* Byte-for-byte file copy between two Windows-style game paths (backs the
 * CopyFileW-shaped coredll ordinal). Returns 1 on success, 0 on failure. */
int uw_file_copy(const char *win_src, const char *win_dst);

/* Translate a Windows-style game path ("\SAVE1\desc") into a real path
 * under UW_DATA_DIR (see resolve_path()'s comment in file_io.c). Returns
 * 1 on success (out filled), 0 if UW_DATA_DIR isn't set. Exposed for the
 * CreateDirectory/FindFirstFile-shaped ordinals in ordinal_stubs.c, which
 * need the same path resolution as the CreateFile family. */
int uw_resolve_win_path(const char *win_path, char *out, unsigned int out_sz);

/* mkdir -p-ish: create the directory at this Windows-style game path if it
 * doesn't already exist. Returns 1 on success (created or already there),
 * 0 on a real failure. Backs the CreateDirectory-shaped coredll ordinal. */
int uw_ensure_directory(const char *win_path);

#endif
