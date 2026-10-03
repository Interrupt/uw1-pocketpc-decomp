#ifndef HEADERS_INPUT_H
#define HEADERS_INPUT_H

/* Declarations for input.c: key bindings, movement commands, mouse
 * state, click/event waiting. Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

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
