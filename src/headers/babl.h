#ifndef HEADERS_BABL_H
#define HEADERS_BABL_H

/* Declarations for babl.c: the conversation/dialogue scripting VM.
 * Pulls in uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern char s_FONTBIG_SYS_00085454[];
/* Globals defined in uw.c but also used by functions that now live in
   babl.c (the conversation/dialogue scripting VM) -- extern'd here so
   both translation units see the same storage. */
extern char DAT_00085240_backing[16];
#define DAT_00085240 DAT_00085240_backing[0]
extern char DAT_00085244_backing[16];
#define DAT_00085244 DAT_00085244_backing[0]
extern char DAT_00085248_backing[16];
#define DAT_00085248 DAT_00085248_backing[0]
extern undefined4 DAT_00085c54;
extern ushort * DAT_00100674;
extern undefined2 DAT_0024cfac;
extern undefined1 DAT_0023c698_backing[1024];
#define DAT_0023c698 DAT_0023c698_backing[0]
extern uintptr_t DAT_00101a70;
extern undefined2 DAT_00101960; // talking-portrait mouth-frame cycle count, reset by reset_dialogue_speech_state
/* Voice-sample page size cache used by load_voice_sample_page and read_voice_sample_page_chunk. */
extern ushort DAT_000853fc;


/* Keep the ARM byte fields at their original offsets. Subtitle pointers
   need separate native-width slots on a 64-bit host; expanding their old
   four-byte slots would overwrite the adjacent color/count/voice fields. */
struct babl_render_state {
    char bytes[70];
    char *lines[6];
};

undefined4 babl_builtin_default_handler();
char * converse_res_bump_alloc_entry();
undefined4 converse_res_slot_store_callback();
undefined4 FUN_000362e8();
undefined4 FUN_00036300();
undefined4 FUN_00036308();
undefined4 FUN_00036344();
undefined4 FUN_00036394();
undefined4 FUN_000363f0();
undefined4 FUN_00036404();
undefined4 FUN_00036418();
undefined4 FUN_000365bc();
undefined4 FUN_000365fc();
undefined4 FUN_0003663c();
undefined4 FUN_00036698();
void babl_builtin_set_attitude();
void babl_builtin_set_race_attitude();
undefined1 babl_builtin_x_skills();
undefined1 babl_builtin_x_traps();
undefined4 babl_builtin_place_object();
ushort babl_builtin_take_from_npc_inv();
void babl_builtin_add_to_npc_inv();
void babl_builtin_remove_talker();
void babl_builtin_set_quest();
undefined1 babl_builtin_get_quest();
undefined4 babl_builtin_gronk_door();
void babl_builtin_x_obj_stuff();
void babl_builtin_x_obj_pos();
uint *babl_alloc();
void babl_free();
intptr_t babl_resize();
undefined4 seed_conversation_globals_for_new_game();
void load_npc_conversation_variables();
undefined4 load_npc_conversation_record();
void init_conv_var_terminator_record();
int babl_builtin_random();
bool babl_builtin_compare();
undefined4 babl_builtin_plural();
undefined4 babl_builtin_contains();
void babl_builtin_append();
void babl_builtin_copy();
int babl_builtin_find();
int babl_builtin_val();
char *babl_expand_string_refs();
int parse_babl_string_ref_expr();
undefined4 build_babl_symbol_table();
void babl_vm_load_script(int param_1);
undefined4 run_babl_bytecode_interpreter();
void save_npc_conversation_variables();
void babl_op_add();
void babl_op_negate();
void babl_op_mul();
void babl_op_sub();
void babl_op_div();
void babl_op_mod();
void babl_op_or();
void babl_op_and();
void babl_op_gt();
void babl_op_ge();
void babl_op_lt();
void babl_op_le();
void babl_op_eq();
void babl_op_ne();
void babl_op_call();
bool babl_op_return();
void babl_op_push_var_raw();
void babl_op_combine_index();
void babl_op_set_var();
void babl_op_call_builtin();
void babl_op_string_eq();
void babl_op_say();
void babl_op_respond();
int babl_var_word_addr();
int babl_read_var_word();
void babl_write_var_word();
int babl_read_frame_word();
void babl_register_builtin();
void babl_set_variable();
void babl_get_variable();
void init_babl_variable_defaults();
void babl_builtin_setup_to_barter();
void init_barter_ui();
void end_barter_ui();
void handle_barter_player_panel_click();
int hit_test_barter_player_slot();
int hit_test_barter_npc_slot();
void handle_barter_player_slot_drop();
void handle_barter_npc_panel_click();
void handle_barter_slot_click();
undefined4 resolve_barter_slot_at_point();
void redraw_barter_slot_icon();
void pick_up_barter_slot_item();
void place_item_in_barter_slot();
undefined4 merge_or_swap_barter_slot_item();
undefined4 barter_offer_is_empty();
undefined4 babl_builtin_do_offer();
int babl_builtin_set_attitude_apply();
undefined2 babl_builtin_length();
undefined4 babl_builtin_sex();
void babl_builtin_do_decline();
undefined4 babl_builtin_take_from_npc();
undefined4 babl_builtin_take_id_from_npc();
undefined4 babl_builtin_do_inv_create();
void finalize_npc_barter_items();
void finalize_player_barter_items();
undefined4 babl_builtin_do_demand();
void babl_builtin_do_judgement();
int sum_barter_offer_value();
undefined4 compute_barter_item_value();
int randomize_value_pct();
int collect_included_player_barter_items();
void add_item_to_npc_inventory();
void give_barter_item_by_item_id();
undefined4 remove_item_from_npc_inventory_by_id();
undefined4 babl_builtin_set_likes_dislikes();
undefined4 check_npc_item_preference();
void enter_conversation_mode_screen();
void exit_talk_mode();
void start_npc_conversation();
void run_babl_menu_wait_loop();
int babl_fmenu();
void select_babl_menu_response();
void babl_builtin_say();
void babl_builtin_respond();
void echo_selected_conversation_choice();
void babl_builtin_print();
undefined4 babl_builtin_pause();
int babl_builtin_ask();
undefined4 babl_builtin_show_inv();
int babl_builtin_find_barter();
bool babl_builtin_find_barter_total();
undefined4 babl_builtin_give_to_npc();
undefined4 babl_builtin_give_ptr_npc();
void babl_builtin_do_inv_delete();
void babl_builtin_find_inv();
undefined4 babl_builtin_identify_inv();
ushort babl_builtin_count_inv();
byte babl_builtin_check_inv_quality();
undefined4 babl_builtin_set_inv_quality();
void sync_conv_vars_from_npc();
bool sync_conv_vars_to_npc();
void bubble_sort_indices_by_key_table();
undefined4 babl_render_op_wrap_message();
undefined4 babl_render_op_show_code();
undefined4 babl_render_op_say();
undefined4 babl_render_op_play_sound();
void babl_render_tick();
void render_babl_dialog_window();
void display_book_or_scroll_page();
void record_illustration_discovery_and_display();
void decompress_rle_stream();
uint pack_byte_into_word();
uint read_rle_op_code();
void rle_op_handle_short_run();
void rle_op_copy_pairs_even();
void rle_op_copy_pairs_odd();
void rle_op_fill_doubled_byte_even();
void rle_op_fill_doubled_byte_odd();
void rle_op_finalize_length();
void rle_op_mark_stream_done();
void read_object_text();
undefined4 debug_noop_checkpoint();
void draw_hotspot_crosshair_marker(); // was FUN_0001c420
int babl_menu(); // was LAB_0002912c, a no-op stub -- see its own comment next to babl_fmenu

#endif
