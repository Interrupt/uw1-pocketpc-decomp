#ifndef HEADERS_GRAPHICS_H
#define HEADERS_GRAPHICS_H

/* Declarations for graphics.c: low-level pixel-primitive functions
 * (color state, rect fill/save/restore, paletted-bitmap blitting into
 * the game's internal software framebuffer). Pulls in uw.h itself so
 * this header is self-contained for any caller. */
#include "../uw.h"

void set_draw_color();
void rect_fill_or_save_restore();
void bitmap_blit_to_framebuffer();

#endif
