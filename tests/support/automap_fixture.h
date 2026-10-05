#ifndef UW_TEST_AUTOMAP_FIXTURE_H
#define UW_TEST_AUTOMAP_FIXTURE_H
#include "unity.h"
#include "src/headers/automap.h"
extern ushort automap_pixels[320 * 200];
extern byte automap_cells[64 * 64];
extern byte automap_indices[320 * 200];
extern long automap_random[128];
extern int automap_random_calls;
void automap_fixture_set_pixel(int x, int y, byte index);
void automap_fixture_reset(void);
#endif
