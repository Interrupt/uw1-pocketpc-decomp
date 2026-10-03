#include "src/headers/uw.h"
/* These used to be plain (non-static) globals visible everywhere via
   uw.h; the code-cleanup-pass-2 global-reorganization made them
   file-local statics in chargen.c (its only real consumer), so the
   test's own fixture copies (in test_chargen.c) now need an explicit
   extern + alias here too for chargen_functions.c (the
   extracted-function translation unit) to see them. */
extern undefined1 DAT_000fb860_backing[];
#define DAT_000fb860 DAT_000fb860_backing[0]
#define DAT_000fb863 DAT_000fb860_backing[3]
extern undefined1 DAT_000fb8f0_backing[];
#define DAT_000fb8f0 DAT_000fb8f0_backing[0]
