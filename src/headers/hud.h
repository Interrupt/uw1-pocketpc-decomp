#ifndef HEADERS_HUD_H
#define HEADERS_HUD_H

/* Declarations for hud.c: the HUD (dirty-rect flush, mode icons, cursor-mode clicks, per-frame tick
   dispatch) and the message scroll panel. Pulls in uw.h itself so this header is self-contained for
   any caller. */
#include "uw.h"

#define DAT_00087644 0x1000u
#define DAT_0023c418 ((ushort)~0x4000u)
#define DAT_0023c408 ((ushort)~0x2000u)
#define DAT_0023c3f0 ((ushort)~0x1000u)

extern int DAT_00250718;
extern undefined1 g_active_hud_panel;
extern undefined2 g_cursor_mode;
extern int g_text_input_active;
extern char DAT_0023c3e0;
/* Globals defined in uw.c but also used by functions that now live in
   hud.c (the HUD and message scroll panel) -- extern'd here so both
   translation units see the same storage. */
extern code * DAT_00086b38_fnptrs[6];
extern undefined1 DAT_0023c118_arr[9];
extern undefined1 DAT_0023cdb0_backing[32];

#define DAT_0023c118 DAT_0023c118_arr[0]
#define DAT_00086b38 (DAT_00086b38_fnptrs[0])
#define DAT_00086b3c (DAT_00086b38_fnptrs[1])
#define DAT_00086b40 (DAT_00086b38_fnptrs[2])
#define DAT_00086b44 (DAT_00086b38_fnptrs[3])
#define DAT_00086b48 (DAT_00086b38_fnptrs[4])
#define DAT_0023c11f DAT_0023c118_arr[7]
#define DAT_0023c120 DAT_0023c118_arr[8]
#define DAT_0023cdb8 (*(int *)(DAT_0023cdb0_backing + 8))
#define DAT_0023cdbc (*(int *)(DAT_0023cdb0_backing + 0xc))
#define DAT_0023cdc0 (*(int *)(DAT_0023cdb0_backing + 0x10))
#define g_hud_panel_handlers (g_hud_panel_handlers_table[0])
#define g_hud_panel_ticker_handlers (g_hud_panel_handlers_table[4])
#define g_target_hud_panel DAT_0023c118_arr[6]

#define DAT_0023cdb0 DAT_0023cdb0_backing[0]
extern void (*const g_hud_panel_handlers_table[13])();

extern short DAT_00084f10;
extern char DAT_000870d8;
extern char DAT_000870dc;
extern undefined DAT_00087530_backing[212];
#define DAT_00087530 DAT_00087530_backing[0]
#define DAT_00087533 DAT_00087530_backing[3]
extern undefined1 DAT_0023c130;
extern ushort DAT_0023c1dc;
extern byte g_flip_grtile_cache_ready;
extern undefined * DAT_00250704;
extern undefined4 g_scroll_control_codes_enabled;
extern char s_bodies_00085c58[];
extern undefined2 DAT_00085c50;
extern undefined1 DAT_00202988_backing[6];
#define DAT_00202988 DAT_00202988_backing[0]


void dirty_rect_union();
void dirty_rect_set();
void uw_debug_blit_pick_buffer();
void uw_debug_draw_inv_hotspot_positions();
void uw_debug_dump_critter_sheet_once();
void uw_debug_dump_sprite_frames_once();
void uw_debug_force_item_id_once();
int uw_always_show_cursor();
void uw_composite_desktop_cursor(void *present_buffer);
void flush_dirty_rect_to_display();
void flush_dirty_rect_to_display_240();
void toggle_stats_panel();
void print_character_description_scroll();
void show_flask_value_tooltip();
void register_stats_panel_click_regions();
void unregister_stats_panel_click_regions();
void enter_dungeon_view_hud_init();
void refresh_equipment_display_if_visible();
void mode_icon_highlight_on();
void mode_icon_highlight_off();
void cursor_mode_button_click();
void cursor_mode_button_click_restricted();
void decrement_cursor_hide_depth_thunk();
void clear_rune_bag_contents();
void draw_rune_icon();
void redraw_rune_bag_display();
void reset_ready_rune_slots();
void handle_rune_bag_click();
void print_not_a_spell_message();
void handle_light_source_click();
void handle_cast_spell_click();
undefined4 report_spell_cast_failure();
undefined4 cast_spell_from_rune_combo();
void reload_paperdoll_body_sprite();
void init_inventory_panel_hotspots();
void redraw_container_icon_slot();
bool update_carry_weight_display();
void main_loop_hud_flush();
void release_grtile_handle();
void run_pause_menu_modal_loop();
void redraw_pause_menu_icon();
void redraw_pause_submenu_icon();
void update_pause_submenu_highlight();
void close_ui_panel_return_to_game();
void draw_pause_menu_main_list();
void draw_quit_confirm_panel();
void draw_music_or_sound_toggle_panel();
void draw_detail_level_panel();
void handle_music_toggle_click();
void handle_sound_toggle_click();
void handle_detail_level_click();
void handle_pause_menu_main_list_click();
void handle_save_load_slot_click();
void handle_quit_confirm_click();
void enter_pause_menu_state();
void dispatch_pause_menu_click();
void handle_pause_menu_region_click();
void handle_pause_menu_dpad_navigation();
void open_pause_menu_via_hotkey();
undefined4 init_cursor_subsystem();
int erase_cursor_icon();
undefined4 cursor_show_idle_tick();
void decrement_cursor_hide_depth();
void set_tracked_hotspot_rect();
undefined4 is_mouse_within_tracked_hotspot();
void track_hotspot_hover_state();
void redraw_hotspot_border_cursor();
void get_mouse_position();
void get_click_position();
void reset_keyboard_char_input();
void noop_post_input_reset_hook();
void warp_mouse_cursor();
int poll_keyboard_char_input();
int wait_for_key_or_mouse_move();
void set_cursor_confine_rect();
void reset_cursor_confine_rect();
int lookup_onscreen_keyboard_key_hit();
int register_cursor_hotspot();
void unregister_cursor_hotspot();
void push_cursor_icon();
void pop_cursor_icon();
undefined4 is_position_within_rect();
void set_cursor_sprite_id();
void update_hotspot_cursor_icon();
void handle_mouse_button_message();
void save_cursor_background();
void draw_idle_mouse_cursor();
void noop_key_handler();
uint poll_mouse_button_flags();
void emit_hud_draw_commands();
void hud_vitals_threshold_shake();
void snap_compass_to_heading();
void reset_hud_panel_animation_state();
void redraw_hud_panels();
void release_panel_wipe_grtiles();
void set_hud_status_value();
void hud_panel_redraw_dispatch();
void hud_vitals_bar_tick();
void hud_dragon_reaction_tick();
void hud_compass_needle_tick();
void update_hud_status_icon_frame();
void tick_hud_panel_transition();
void hud_panel_wipe_transition_tick();
void update_ready_rune_slot_icons();
void update_light_source_color_icons();
void begin_hud_panel_flip();
void redraw_active_hud_panel();
void release_hud_panel_flip_grtiles();
bool advance_hud_panel_flip();
void squash_hud_panel_flip_rows();
void copy_hud_panel_flip_column();
undefined4 init_sprite_list_buffers();
undefined4 clear_sprite_list_slot_flag();
void flush_sprite_list_compositor();
void capture_framebuffer_rect_to_grtile_paletted();
void init_msg_scroll_panel();
void check_mouse_over_msg_scroll_panel();
void select_msg_scroll_mode_normal();
void select_msg_scroll_mode_conversation();
void select_msg_scroll_mode_2();
void wait_for_click_to_continue();
undefined4 msg_scroll_draw_edges();
undefined4 draw_conversation_window_decoration();
void msg_scroll_scroll_up_line();
void msg_scroll_more_prompt();
int message_scroll_print_wrapped();
void msg_scroll_split_escape_segments();
void msg_scroll_split_newline_segments();
void msg_scroll_draw_wrapped_span();
void msg_scroll_wrap_split_line();
void msg_scroll_panel_init();
void msg_scroll_panel_reset();
void echo_number_to_scroll();
void echo_yes_no_to_scroll();
undefined4 scroll_text_entry_prompt();
undefined4 prompt_yes_no_scroll();

#endif
