#ifndef HEADERS_HELPERS_H
#define HEADERS_HELPERS_H

/* Named constants recovered from the original decomposition that are
 * used by several otherwise-unrelated .c files, so no single one of
 * them is the "owner" the way src/headers/<name>.h normally implies.
 * Kept here instead of uw.h so uw.h stays limited to shared types and
 * struct layouts. No matching helpers.c: every symbol below is a
 * preprocessor constant, not a variable or function, so there is no
 * storage or code to split out. */
#include "uw.h"

#define UW_MAX_VIS_TILES 2048

#define DAT_0008763c 0x4000u
#define DAT_00087640 0x2000u
#define DAT_00087648 0x0800u

#define DAT_00086e68 15
#define DAT_0008589c 0x3ac

#endif
