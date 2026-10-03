#ifndef HEADERS_GAME_H
#define HEADERS_GAME_H

/* Declarations for game.c: top-level program flow (WinMain's real body
 * and the title/main menu loop). Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

undefined4 app_main_loop();
void main_menu_loop();
bool prepare_new_game(void);
void begin_gameplay(void);

/* Forward declaration needed because main_menu_loop (now in game.c) takes
   this LAB_ callback's address to pass to load_gr_resource_entries; its own
   definition stays in uw.c (see gr_resource_bump_alloc_entry/hud_icon_gr_bump_alloc_entry's matching
   comment for what this callback family does). */
void *opbtn_gr_bump_alloc_entry();
void debug_adjust_view_heading();
void debug_force_rest_action();
undefined4 print_debug_stat_message();
void show_error_dialog_stub_thunk();
void compute_dimension_volume();
void run_game_startup_sequence();
void run_game_shutdown_sequence();
void wait_and_show_intro_page();
void init_main_loop_state();
void request_game_exit();
void set_game_mode();
void change_game_mode();
void show_error_dialog_stub();
void log_categorized_error_message();
void report_categorized_fatal_error();
void report_fatal_error_and_exit();
void report_fatal_error_message_and_exit();
void handle_game_view_click();
undefined4 select_default_hud_font();
void play_view_restore_transition();
undefined4 load_startup_gr_resources();
void set_pending_update_flags();
void close_panels_before_level_change();
void reset_player_object_record();
void init_gameplay_session();
void print_player_position_debug();
void print_help_message();
void set_custom_view_target();
void move_custom_view_target();
void set_view_subject_by_command();
void enter_free_camera_mode();
void restore_view_from_object_record();
void spin_view_full_rotation();
void handle_game_view_click_hold();
bool populate_menu_button_bitmap_entry();
void animate_title_palette_cycle();
void update_journey_onward_availability();
void draw_menu_item_list();
int poll_menu_pointer_selection();
int menu_button_list_navigate();
void spawn_message_dispatch_thread();
undefined4 create_main_window_and_init_display();
undefined4 window_message_noop_handler();
void store_window_extra_data_ptr();
void dispatch_window_message();
undefined4 shutdown_game_resources();
void debug_print_init();
void debug_print(char *param_1, ...);

#endif
