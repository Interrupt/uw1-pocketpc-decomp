#include "src/headers/uw.h"
/* See movement_test_globals.h's comment: these became file-local
   statics in their real owning .c files during code-cleanup-pass-2,
   so the test's own fixture copies (in test_teleport.c) need an
   explicit extern here too for teleport_functions.c (the
   extracted-function translation unit) to see them. */
extern byte DAT_00085730;
extern uint DAT_0023bf5c;
extern char DAT_0023bf60;
extern int DAT_0023bf64;
