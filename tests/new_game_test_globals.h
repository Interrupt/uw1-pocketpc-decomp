#include "src/headers/uw.h"
/* These used to be plain (non-static) globals visible everywhere via
   uw.h; the code-cleanup-pass-2 global-reorganization made them
   file-local statics in their real owning .c files (single real
   consumer each), so the test's own fixture copies (in
   test_new_game.c) now need an explicit extern + alias here too for
   new_game_functions.c (the extracted-function translation unit) to
   see them. */
extern undefined DAT_000b78b8_backing[];
#define DAT_000b78b8 DAT_000b78b8_backing[0]
extern char s__DATA_lev_ark_00085734[];
