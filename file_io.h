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

#endif
