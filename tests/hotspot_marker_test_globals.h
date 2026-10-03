#include "src/headers/uw.h"

/* draw_hotspot_crosshair_marker's own file (babl.c) keeps these backing
 * arrays and their 1-element aliasing #defines file-static, so the
 * extracted function body (which references the bare macro names,
 * unexpanded, since extraction copies pre-preprocessor source text)
 * needs its own copies here -- sized to exactly 4 slots (16 bytes) so
 * ASan's redzone catches even a single slot's worth of regression back
 * to the wrong (8-byte) pointer-arithmetic stride this test guards
 * against, not just the 2+ slots it took to crash a live demo script. */
extern unsigned char PTR_DAT_000845c8_backing[16];
#define PTR_DAT_000845c8 PTR_DAT_000845c8_backing[0]
extern unsigned char DAT_000845e8_backing[16];
#define DAT_000845e8 DAT_000845e8_backing[0]
extern unsigned int DAT_000bbf98_backing[4];
#define DAT_000bbf98 DAT_000bbf98_backing[0]
extern unsigned int DAT_000bbff0_backing[4];
#define DAT_000bbff0 DAT_000bbff0_backing[0]
