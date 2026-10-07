#ifndef UW_TEST_CRITTER_PALETTE_FIXTURE_H
#define UW_TEST_CRITTER_PALETTE_FIXTURE_H
#include "unity.h"
#include "src/headers/debug.h"
#include "../critter_palette_test_globals.h"
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...);
void uw_debug_dump_critter_sprite(int type, int tier, int direction, int frame,
                                const unsigned char *buffer, int width, int height);
void *ce_malloc(int size);
void *ce_memset(void *buffer, int value, unsigned int size);
void *ce_memmove(void *dest, const void *src, int size);
byte *uw_load_critter_page_cached(int page, int tier);
void read_data(const char *name, long offset, void *buffer, size_t count);
void critter_palette_fixture_reset(void);
void critter_palette_fixture_dispose(void);
void assert_skin_colors(int type, int forehead, int cheek, int leg);
#endif
