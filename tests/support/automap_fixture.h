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
void automap_storage_fixture_reset(void);
void automap_storage_fixture_dispose(void);
void automap_storage_fixture_finish(void);
void automap_fixture_add_note(const char *text, short x, short y);
void automap_fixture_type_note(const char *text, short x, short y);
extern int automap_text_draws;
extern char automap_drawn_text[100][52];
extern short automap_drawn_x[100], automap_drawn_y[100];
extern char automap_test_directory[256];
void automap_fixture_reset(void);
#endif
