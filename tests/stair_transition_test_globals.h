#include "src/headers/uw.h"
extern ushort player[16], resurrection_object[4];
extern byte level_map[64 * 64 * 4], character[256];
extern ushort *g_player_object;
extern undefined1 DAT_000878d0_backing[256], DAT_00202c90_backing[8192];
extern short DAT_00201b68, DAT_00201c7c, g_visibility_max_ring_passes;
extern undefined2 DAT_00201c90, DAT_00201c8c, g_cursor_holding_state;
extern char *g_selected_object;
extern byte DAT_00085730;
extern code *DAT_00201c9c;
extern byte DAT_001013a4;
extern uint DAT_002020e4;
extern byte DAT_002020e8;
extern char s_At__d__d_00087360[];
extern int loads, positions, deaths, first_x, first_y, probes, hud_hp;
extern int open_x, open_y;
extern uint clock_units;
extern int scan_calls;
#include <math.h>

#ifndef DAT_002034b5
#define DAT_002034b5 DAT_00202c90_backing[0x825] /* item 0xa0 value, loaded COMOBJ table */
#endif
#include <math.h>
