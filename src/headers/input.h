#ifndef HEADERS_INPUT_H
#define HEADERS_INPUT_H

/* Declarations for input.c: key bindings, movement commands, mouse
 * state, click/event waiting. Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

extern short g_mouse_x;
extern short g_mouse_y;
extern undefined2 DAT_0023be8c;
extern undefined1 DAT_0023ce10_backing[65536];
#define DAT_0023ce10 DAT_0023ce10_backing[0]
#define DAT_0023ce1c (*(ushort *)(DAT_0023ce10_backing + 0xc))
#define DAT_0023ce28 (*(ushort *)(DAT_0023ce10_backing + 0x18))
#define DAT_0023ce34 (*(ushort *)(DAT_0023ce10_backing + 0x24))
#define DAT_0023ce40 (*(ushort *)(DAT_0023ce10_backing + 0x30))
#define DAT_0023ce4c (*(ushort *)(DAT_0023ce10_backing + 0x3c))
#define DAT_0023ce58 (*(ushort *)(DAT_0023ce10_backing + 0x48))
#define DAT_0023ce64 (*(ushort *)(DAT_0023ce10_backing + 0x54))
extern HWND__ *DAT_0023c548;
extern undefined1 DAT_00087650_backing[40];
#define DAT_00087650 DAT_00087650_backing[0]
extern char DAT_002506aa;
extern char DAT_002506ab;
extern int DAT_0020484c;
extern short DAT_00085890;
extern short DAT_00086968;
extern undefined2 DAT_0008696a;
extern undefined2 DAT_0008696c;
extern short DAT_0008696e;
extern short * DAT_000876c4;
extern undefined4 DAT_000bbef8;
extern undefined2 DAT_0020470c;
extern undefined2 DAT_00204710;
extern short DAT_00204788;
extern undefined2 DAT_00204830;
extern undefined2 DAT_00204834;
extern short DAT_00204840;
extern short DAT_00204850;
extern int DAT_0020484c;
extern char DAT_002506aa;
extern int DAT_0020485c;
extern undefined DAT_00250658_backing[256];
#define DAT_00250658 DAT_00250658_backing[0]
extern short DAT_00201c84;
extern short DAT_0023c63c;
extern int g_force_flush;


#define _DAT_0023ce10 (*(uint*)&DAT_0023ce10)

bool apply_swim_wade_pose();
void set_locomotion_state();
undefined4 begin_directional_move();
void resolve_move_vector();
void apply_movement_mode_profile();
void input_bindings_init();
void input_bindings_free();
int register_click_region();
int register_key_binding();
void unregister_key_binding();
void poll_input_bindings();
void dispatch_key_binding();
void dispatch_sticky_mode_handlers();
void wait_for_click_release();
int poll_mouse_event();
undefined4 get_alternate_keyboard_scan_code();
uint process_pending_keyboard_scan_code();
uint poll_input_event();
undefined4 next_input_event();
undefined4 peek_input_event();
void update_mouse_state();
void register_game_view_interact_zones();
void unregister_game_view_interact_zones();
void move_command_dispatch();
void uw_set_analog_move_turn(int fwd_held, int turn_dir);
void move_key_directional_step();
undefined4 handle_keyboard_message();
undefined4 handle_mouse_message();

#endif
