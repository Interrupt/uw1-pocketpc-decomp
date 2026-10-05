#ifndef HEADERS_PLAYER_H
#define HEADERS_PLAYER_H

/* Declarations for player.c: player tile position/movement, save-
 * record persistence, HUD stat sync, equipment effects, HP. Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern short DAT_00201c74;
extern char * DAT_0023be74;
extern undefined1 DAT_0023bf0c;
extern ushort * g_player_object;
/* Globals defined in uw.c but also used by functions that now live in
   player.c (reset_player_derived_state) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 DAT_0010060c_backing[256];

#define DAT_002048a5 DAT_00204880_backing[0x25]
#define DAT_002048a6 DAT_00204880_backing[0x26]
#define DAT_00204880 (*(short *)&DAT_00204880_backing[0])
#define DAT_00204882 (*(short *)&DAT_00204880_backing[2])
#define DAT_00204884 (*(short *)&DAT_00204880_backing[4])
#define DAT_00204886 (*(short *)&DAT_00204880_backing[6])
#define DAT_00204888 (*(short *)&DAT_00204880_backing[8])
#define DAT_0020488c (*(short *)&DAT_00204880_backing[0xc])
#define DAT_0020488e (*(short *)&DAT_00204880_backing[0xe])
#define DAT_00204896 DAT_00204880_backing[0x16]
#define DAT_00204897 DAT_00204880_backing[0x17]
#define DAT_002048a1 DAT_00204880_backing[0x21]
#define DAT_002048a3 DAT_00204880_backing[0x23]
#define DAT_002048a4 DAT_00204880_backing[0x24]
#define DAT_002048a7 DAT_00204880_backing[0x27]
#define DAT_002048a8 DAT_00204880_backing[0x28]
#define DAT_002048a9 DAT_00204880_backing[0x29]
#define DAT_00204892 (*(short *)&DAT_00204880_backing[0x12])
#define DAT_002048a2 DAT_00204880_backing[0x22]
#define DAT_002048aa DAT_00204880_backing[0x2a]
#define g_fall_accel (*(short *)&DAT_00204880_backing[0x10])
#define g_jump_ascent_timer (*(short *)&DAT_00204880_backing[0x14])
#define g_vertical_velocity (*(short *)&DAT_00204880_backing[0xa]) // was DAT_0020488a

#define DAT_0010060c DAT_0010060c_backing[0]
extern undefined4 DAT_002020d0;
extern undefined4 DAT_002020d8;
extern undefined4 DAT_002020d4;
extern int DAT_0023bc94;
extern undefined2 DAT_0023beb8;
extern short DAT_0023be90;
extern short DAT_0023be92;
extern short DAT_0023be94;
extern short DAT_0023bf00;
extern undefined2 DAT_0023bf02;
extern undefined2 DAT_0023bf04;
extern byte DAT_0023beb0;
extern byte DAT_0023beac;
extern undefined2 DAT_0023bea0;
extern short DAT_0023bea4;
extern short DAT_0023bf08;
extern undefined2 DAT_0023be9a;
extern undefined2 DAT_0023be9c;
extern undefined2 DAT_0023be9e;
extern char DAT_0023bf18;
extern undefined4 DAT_0024cfc8;
/* Globals defined in uw.c but also used by functions that now live in
   tmap.c (update_wall_partition_phase) -- extern'd here so both
   translation units see the same storage. */
extern char s_font5x6p_sys_0008430c[];
extern undefined s_scroll_newline_0008522c_backing[8192];
#define s_scroll_newline_0008522c s_scroll_newline_0008522c_backing[0]
extern short DAT_00201c94;
extern undefined4 DAT_002028d8;
/* Globals defined in uw.c but also used by functions that now live in
   player.c (player state/movement/save persistence) -- extern'd here
   so both translation units see the same storage. */
extern undefined4 DAT_000858a0;
extern undefined1 DAT_00085d20_backing[128];
#define DAT_00085d20 DAT_00085d20_backing[0]
extern short DAT_00201c70;
extern undefined2 DAT_00201c78;
extern short DAT_00202088;
extern undefined4 DAT_002020d8;
extern undefined1 DAT_00203303;
extern undefined2 DAT_00203304;
extern undefined2 DAT_002048b0_backing[8192];
#define DAT_002048b0 DAT_002048b0_backing[0]
extern undefined2 DAT_002048b2;
extern undefined1 * DAT_002048b8;
extern undefined1 DAT_0023bca8_backing[8192];
#define DAT_0023bca8 DAT_0023bca8_backing[0]
/* ARM 0x23bcf2/0x23bcf4 are fields of the serialized player status
   record, also written through DAT_00086df8 by character creation. */
#define g_player_carry_weight (*(short *)(DAT_0023bca8_backing + 0x4a))
#define g_player_max_carry_weight (*(ushort *)(DAT_0023bca8_backing + 0x4c))
extern undefined2 DAT_0023be98;
extern undefined4 DAT_0023bea8;
extern short DAT_0023beb4;
extern unsigned char DAT_00085ac8_backing[16];
#define g_light_source_slots DAT_00085ac8_backing[0]
extern undefined1 * g_save_equip_table_ptr;
extern undefined1 * g_save_record_base_ptr;
extern char s_player_dat_00085a74[];
extern undefined1 DAT_00204880_backing[128];
extern char DAT_000872a0;
extern char *DAT_0024fa2c;
extern char s__DATA_mono_dat_000872b8[];
extern char s_and_00087310[];
extern char DAT_0023c27c;
extern short DAT_00202078;
extern byte DAT_0020208c;
extern undefined4 DAT_002020d4;
extern undefined2 DAT_00201b60;
extern short DAT_00201b64;
extern code *DAT_00201c9c;


/* The travel-direction stash the movement sweep compares against
   DAT_00201c78: apply_heading_turn writes it as two bytes (DAT_002048a1
   low, DAT_002048a2 high) of that 16-bit angle, so read it back as a
   signed 16-bit -- not a 32-bit word that also pulls in DAT_002048a3/a4
   (junk here) and, with the sign mismatch vs the short DAT_00201c78, made
   the "!=" test fire every frame. That spurious mismatch ran the
   auto-straighten branch on sidestep release and nudged the facing by
   +/-0x400 (the "tiny rotation on strafe release"). */
#define _DAT_002048a1 (*(short*)&DAT_002048a1)
#define _DAT_002048a9 (*(uint*)&DAT_002048a9)

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
undefined4 recalculate_player_stats(int refill_mana);
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
