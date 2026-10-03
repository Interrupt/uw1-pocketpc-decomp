#ifndef HEADERS_PLAYER_H
#define HEADERS_PLAYER_H

/* Declarations for player.c: player tile position/movement, save-
 * record persistence, HUD stat sync, equipment effects, HP. Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

undefined4 detect_unsafe_rest_object_callback();
undefined4 check_rest_area_unsafe();
void reset_player_for_resurrection();
void handle_player_death_and_menu_transition();
undefined4 dungeon_view_anim_tick();
void apply_level9_random_hazard_tick();
void set_player_tile_position();
void commit_player_move();
void demo_set_player_pos(double x, double y, double z, double yaw_deg, double pitch_deg);
void debug_print_player_position(const char *label);
void trigger_player_jump_if_grounded();
void force_locomotion_state_refresh();
void apply_vertical_launch_impulse();
void trigger_quest_stumble_animation();
void apply_quest_vertical_effect();
void sync_player_stats_to_hud();
void build_player_save_record();
bool write_player_save_record();
void restore_player_save_record();
undefined4 cycle_active_light_source();
void update_player_tick_effects();
undefined4 decay_equipped_light_sources();
void apply_drowning_hazard();
void write_player_status_block();
void read_player_status_block();
void reset_player_derived_state();
void update_screen_flicker_effect();
undefined4 apply_equipped_item_effect();
void compute_light_source_colors();
void update_level7_floor_hazard_state();
void apply_equipment_effect_penalties();
int compute_object_weight();
void refresh_player_equipment_effects();
void trigger_view_transition();
void set_movement_animation_timer();
void update_current_view_from_subject();
void sync_camera_from_player();
undefined4 roll_skill_check();
void grant_experience_points();
void refresh_experience_display();
void toggle_light_table_flicker();
undefined4 recompute_level7_hazard_from_character_level();
void advance_character_level();
undefined4 classify_skill_training_tier();
void advance_skill_training();
undefined4 roll_skill_use_improvement();
void print_single_skill_improvement_message();
void print_skill_improvement_list();
void handle_mantra_chant();
void render_endgame_character_stats();
void apply_rest_status_effects();
void handle_rest_action();
undefined4 adjust_player_hunger();
void handle_game_victory_sequence();
void handle_starvation_penalty();
void adjust_level7_hazard_value();
void adjust_player_hp();
void restore_stat_capped();
void apply_healing_item_effect();
void draw_stats_panel_header();
void draw_stats_panel_attribute_row();
void draw_hp_stat_display();
void draw_mana_stat_display();
void draw_experience_points_display();
void draw_stats_panel_skill_row();
void draw_stats_panel_content();
void handle_stats_panel_skill_scroll_click();
void refresh_stats_panel_if_active();
short read_xor_scrambled_block();
int write_xor_scrambled_block();

#endif
