#include "src/headers/uw.h"
extern ushort arena[0x4000];
extern byte original_goblin[27], page_header[2];
extern ushort *goblin;
extern char *DAT_002046b8, *DAT_002046c4, *g_despawn_creature_record;
extern undefined1 DAT_001007d0_backing[3072], DAT_00202c90_backing[8192];
extern undefined1 DAT_0023ce70_backing[128];
extern undefined1 DAT_002027d0_backing[48];
extern short DAT_00201b68, DAT_0010144c, DAT_00101454;
extern undefined2 DAT_002020a0, DAT_002020a4;
extern ushort *g_player_object;
extern ushort *DAT_00202a44;
extern char *DAT_00086df8;
extern short DAT_00202a38, DAT_00202a3c, DAT_00202a40;
extern ushort DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54;
extern char DAT_00101928;
extern ushort *projectile;
extern unsigned rng_state, spawned, placed, palette_used;
extern ushort *drops[16];
extern int types[16];
extern unsigned rolls[32], roll_count, roll_index;
#include <math.h>

#ifndef DAT_002034b5
#define DAT_002034b5 DAT_00202c90_backing[0x825] /* item 0xa0 value, loaded COMOBJ table */
#endif

#ifndef DAT_001007e1
#define DAT_001007e1 DAT_001007d0_backing[0x11]
#endif
#include <math.h>
