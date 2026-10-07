#include "game_fixture.h"

int seek_file_handle(int handle, int offset, int method)
{ return uw_file_seek(handle, offset, method); }
int read_file_handle(int handle, void *destination, uint size)
{ return uw_file_read(handle, destination, size); }
