/* Private game state supplied by support/movement_fixture.c to the
   compiled movement test library. */
#include "src/headers/uw.h"
extern byte DAT_002046d8, DAT_002046dc, DAT_002046e0, DAT_002046e4;
extern int DAT_002046e8;
/* These used to be plain (non-static) globals visible everywhere via
   uw.h; the code-cleanup-pass-2 global-reorganization made them
   file-local statics in their real owning .c files (single real
   consumer each), so the test's fixture copies (in support/movement_fixture.c)
   now need an explicit extern here too for the
   extracted-function translation unit to see them. */
extern short DAT_00086980, DAT_00086982, DAT_00086996;
extern ushort DAT_0008698c;
extern undefined1 DAT_00086986_backing[];
#define DAT_00086986 DAT_00086986_backing[0]
extern unsigned char DAT_000869a8_backing[];
#define DAT_000869a8 DAT_000869a8_backing[0]
extern char DAT_00202c18, DAT_00202c1c, DAT_00202c20, DAT_00202c24, DAT_00202c28, DAT_00202c2c;
extern undefined DAT_00202c32;
extern int DAT_00204870;
extern undefined4 DAT_00204878;
extern short *g_sweep_velocity;
extern short DAT_00086984, DAT_0008698a, DAT_0008698e, DAT_00086994;
extern ushort DAT_00086992;
#define DAT_00086987 DAT_00086986_backing[1]
extern undefined1 DAT_00202c70_backing[];
#define DAT_00202c78 (*(unsigned short *)(DAT_00202c70_backing + 8))
extern int (*DAT_00204988)(ushort *), (*DAT_00204998)(ushort *), (*DAT_002049a8)(ushort *), (*DAT_002049b8)(ushort *);
extern undefined1 DAT_002049c0;
extern char DAT_002049bc;
extern short *g_sweep_foot_pos;
