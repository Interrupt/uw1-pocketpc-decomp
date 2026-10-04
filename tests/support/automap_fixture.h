#ifndef UW_TEST_AUTOMAP_FIXTURE_H
#define UW_TEST_AUTOMAP_FIXTURE_H
#include "unity.h"
#include "src/headers/automap.h"
extern ushort automap_pixels[320 * 200];
extern byte automap_cells[64 * 64];
void automap_fixture_reset(void);
#endif
