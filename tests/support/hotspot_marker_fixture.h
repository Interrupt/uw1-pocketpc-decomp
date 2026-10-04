#ifndef UW_TEST_HOTSPOT_MARKER_FIXTURE_H
#define UW_TEST_HOTSPOT_MARKER_FIXTURE_H
/* Fixture state and controlled services for reusable hotspot_marker tests. */
#include "unity.h"
#include "src/headers/uw.h"
extern unsigned char PTR_DAT_000845c8_backing[16];
extern unsigned char DAT_000845e8_backing[16];
extern unsigned int DAT_000bbf98_backing[4];
extern unsigned int DAT_000bbff0_backing[4];
typedef struct { int x, y, color, calls; } plot_call;
extern plot_call plots[64];
extern int plot_count;
void set_slot(unsigned char *backing, int index, short x, short y);
void hotspot_marker_fixture_reset(void);
void hotspot_marker_fixture_dispose(void);
#endif
