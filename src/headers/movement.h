#ifndef HEADERS_MOVEMENT_H
#define HEADERS_MOVEMENT_H

/* Declarations for movement.c: the movement collision sweep (substep
 * integrator, wall-slide/deflect/knockback/land resolution). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

undefined4 collision_response_mobile_object();
unsigned int uw_frame_clock_ms();
undefined4 check_and_reset_landing_state();
int uw_turn_rate_accel(void);
void init_collision_response_profiles();
undefined4 collision_response_default();
undefined4 collision_response_alt_locomotion();
undefined4 collision_response_other_locomotion();
undefined4 can_step_between_tiles();
void apply_heading_turn();
void resolve_wall_slide_corner();
void movement_collision_sweep();
void sweep_init_position();
void reticle_object_pick();
undefined4 movement_sweep_setup();
void sweep_restart_remaining();
void sweep_kill_velocity();
void sweep_writeback_position();
int sweep_integrate_substep();
undefined4 sweep_deflect_heading();
void sweep_slide_along_wall();
void sweep_apply_knockback();
void sweep_land_on_surface();
undefined4 sweep_step_vertical();
undefined4 sweep_step();
uint collision_flags_to_locomotion_code();
uint sweep_collision_flags();
void sweep_apply_collision();
void *find_nearby_door_in_candidates();
void *get_first_nearby_candidate_object();
void decode_movement_command();
void movement_pacing_handler();
void movement_tick();
void settle_movement_to_rest();
void apply_movement_tick();

#endif
