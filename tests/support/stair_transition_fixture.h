#ifndef UW_TEST_STAIR_TRANSITION_FIXTURE_H
#define UW_TEST_STAIR_TRANSITION_FIXTURE_H
#include "unity.h"
#include "../stair_transition_test_globals.h"
void cancel_weapon_swing(void);
void pop_cursor_icon(int state);
void save_or_restore_level_special_state(short level, short save);
undefined4 commit_level_to_save_slot(int level);
int load_level(int level);
void set_player_tile_position(uint x, uint y);
void set_pending_update_flags(int flags);
void report_fatal_error_and_exit(void);
void full_dungeon_redraw(void);
void weapon_overlay_flash_hold(int passes);
void weapon_overlay_flash_restore(int passes);
void *ce_memset(void *buffer, int value, unsigned size);
void *tilemap_lookup(int x, int y);
int encode_object_slot_index(void *object);
undefined4 check_object_placement_clearance(short type, short slot, undefined2 x, undefined2 y, short z, int flag, byte radius);
void *resolve_object_link(ushort *link);
undefined4 object_ptr_in_arena(void *object);
ushort *discard_misplaced_object(void *head, void *object, int flag);
void tick_weapon_swing_state(int flag);
void set_hud_status_value(int slot, int value);
void handle_starvation_penalty(void);
uint read_realtime_clock_units(void);
void update_ingame_music_track(void);
void update_player_tick_effects(void);
long ce_rand(void);
void apply_level9_random_hazard_tick(void);
void debug_print(char *format, ...);
ushort *find_object_in_chain(ushort **link, int recursive, int group, int subclass, int type);
void stair_transition_fixture_reset(void);
void stair_transition_fixture_dispose(void);
#endif
