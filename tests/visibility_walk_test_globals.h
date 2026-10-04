#include "src/headers/uw.h"

/* visibility.c keeps the ray-flood's record array, its real-pointer side
 * tables, and every one of their field-offset #define aliases file-
 * static -- the extracted function bodies below reference the bare
 * macro names, unexpanded, since extraction copies pre-preprocessor
 * source text. Replicated verbatim from visibility.c's own top-of-file
 * declarations (see visibility_ray_idx's comment there for why slot 16
 * is reserved, and VISIBILITY_RAY_REALPTR's comment for the NULL-entry
 * fallback). */
extern unsigned char g_visibility_ray_table_backing[1024];
#define g_visibility_ray_table g_visibility_ray_table_backing[0]
#define _DAT_0023aee1 (*(uint*)&DAT_0023aee1)
#define _DAT_0023aee3 (*(uint*)&DAT_0023aee3)
#define _DAT_0023af02 (*(uint*)&DAT_0023af02)
#define DAT_0023aee1 g_visibility_ray_table_backing[1]
#define DAT_0023aee3 g_visibility_ray_table_backing[3]
#define DAT_0023aee5 g_visibility_ray_table_backing[5]
#define DAT_0023aee6 g_visibility_ray_table_backing[6]
#define DAT_0023aee7 g_visibility_ray_table_backing[7]
#define DAT_0023aee8 g_visibility_ray_table_backing[8]
#define DAT_0023aee9 g_visibility_ray_table_backing[9]
#define DAT_0023aeea (*(undefined2 *)&g_visibility_ray_table_backing[0xa])
#define DAT_0023aeec g_visibility_ray_table_backing[0xc]
#define DAT_0023aeed g_visibility_ray_table_backing[0xd]
#define DAT_0023aeee (*(undefined2 *)&g_visibility_ray_table_backing[0xe])
#define DAT_0023aef0 g_visibility_ray_table_backing[0x10]
#define DAT_0023aef1 g_visibility_ray_table_backing[0x11]
#define DAT_0023aef5 g_visibility_ray_table_backing[0x15]
#define DAT_0023aef6 (*(undefined2 *)&g_visibility_ray_table_backing[0x16])
#define DAT_0023aef8 (*(undefined2 *)&g_visibility_ray_table_backing[0x18])
#define DAT_0023aefa g_visibility_ray_table_backing[0x1a]
#define DAT_0023aefb g_visibility_ray_table_backing[0x1b]
#define DAT_0023aefc g_visibility_ray_table_backing[0x1c]
#define DAT_0023aefd g_visibility_ray_table_backing[0x1d]
#define DAT_0023aefe (*(undefined2 *)&g_visibility_ray_table_backing[0x1e])
#define DAT_0023af00 (*(undefined2 *)&g_visibility_ray_table_backing[0x20])
#define DAT_0023af02 g_visibility_ray_table_backing[0x22]

extern unsigned char g_visibility_ring_done;

extern char *g_visibility_ray_realptr[24];
extern char *g_visibility_ray_realptr2[24];
extern char g_visibility_ray_fallback[64];
#define VISIBILITY_RAY_REALPTR(table, idx) \
    ((table)[(idx)] != 0 ? (table)[(idx)] : g_visibility_ray_fallback)
#define VISIBILITY_RAY_SCRATCH_IDX 16

/* {0x10, 0x00}: compute_visibility_ray_offset reads (&DAT_00086af0)[bool]. */
#define DAT_00086af0 (*(unsigned char *)DAT_00086af0_arr)
/* {2,4} wall-edge bitmask / {2,3} aligned shape id / {-1,1} neighbour
 * step sign, indexed [orient] -- see visibility.c's own comment. */
#define DAT_00086af8 (*(unsigned char *)(DAT_00086af8_region + 0))
#define DAT_00086afc (*(unsigned char *)(DAT_00086af8_region + 4))
#define DAT_00086b00 (*(unsigned char *)(DAT_00086af8_region + 8))

/* math.c's own file-static aliases for its sine/cosine tables. */
#define DAT_00085d48 (*(const unsigned char *)(const void *)DAT_00085d48_sine)
#define DAT_00085d4c (*(const unsigned char *)((const char *)(const void *)DAT_00085d48_sine + 2))
#define DAT_00085f50 (*(const unsigned char *)(const void *)DAT_00085f50_cosine)
#define DAT_00085f54 (*(const unsigned char *)((const char *)(const void *)DAT_00085f50_cosine + 2))

/* Hand-written helper (not decompiled), defined for real in
   tests/test_visibility_walk.c -- prototype needed here since the
   generated tests/visibility_walk_functions.c TU calls it too. */
int visibility_ray_idx(const void *p);
