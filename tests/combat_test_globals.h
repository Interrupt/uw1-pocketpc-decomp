#include "src/headers/uw.h"
/* See movement_test_globals.h's comment: these became file-local
   statics (or macro aliases into a static backing array) in their
   real owning .c files during code-cleanup-pass-2, so the test's own
   fixture copies (in test_combat.c) need an explicit extern/alias
   here too for combat_functions.c (the extracted-function translation
   unit) to see them. */
extern char DAT_00084f18_backing[];
#define DAT_00084f18 DAT_00084f18_backing[0]
#define DAT_00084f1c DAT_00084f18_backing[4]
extern undefined1 DAT_0023c128_arr[];
#define DAT_0023c12f DAT_0023c128_arr[7]
extern undefined2 DAT_00100600, DAT_00100624;
extern ushort DAT_00100610, DAT_00100620, DAT_00100604;
extern byte DAT_00100628, DAT_001005fc;
extern char DAT_001005dc;
extern undefined4 DAT_001005d8;
extern ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;
extern undefined1 DAT_0023c11a, DAT_0023c11b;
extern byte DAT_0023c12a;
extern int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
extern undefined1 DAT_0023c11c_arr[];
#define DAT_0023c11c DAT_0023c11c_arr[0]
#define DAT_0023c11d DAT_0023c11c_arr[1]
extern undefined1 DAT_0023c12c_arr[];
#define DAT_0023c12c DAT_0023c12c_arr[0]
#define DAT_0023c12d DAT_0023c12c_arr[1]
extern undefined1 DAT_0023c1f0_backing[];
#define DAT_0023c1f0 DAT_0023c1f0_backing[0]
extern undefined1 DAT_0023c1f8_backing[];
#define DAT_0023c1f8 DAT_0023c1f8_backing[0]
extern byte DAT_0023c150, DAT_0023c25c;
extern undefined2 DAT_0023c220;
extern short DAT_0023c21c;
extern short DAT_001005f4, DAT_001005f8;

extern byte DAT_002046d8, DAT_002046dc;
extern int DAT_002046e8;
extern undefined1 DAT_002046e0, DAT_002046e4;

#define DAT_00086e87 DAT_00086e87_backing[0]
#define DAT_0008730c DAT_0008730c_backing[0]
#define DAT_0008730d DAT_0008730c_backing[1]
