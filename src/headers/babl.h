#ifndef HEADERS_BABL_H
#define HEADERS_BABL_H

/* Declarations for babl.c: the conversation/dialogue scripting VM.
 * Pulls in uw.h itself so this header is self-contained for any caller. */
#include "../../uw.h"

/* Keep the ARM byte fields at their original offsets. Subtitle pointers
   need separate native-width slots on a 64-bit host; expanding their old
   four-byte slots would overwrite the adjacent color/count/voice fields. */
struct babl_render_state {
    char bytes[70];
    char *lines[6];
};

#endif
