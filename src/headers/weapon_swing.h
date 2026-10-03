#ifndef HEADERS_WEAPON_SWING_H
#define HEADERS_WEAPON_SWING_H

/* Declarations for weapon_swing.c: weapon swing animation (frame
 * loading, request/draw tick, overlay redraw). Pulls in uw.h itself
 * so this header is self-contained for any caller. */
#include "uw.h"

extern undefined1 DAT_000870e0;
extern short DAT_000870e4;


void debug_noop_frame_hook();
undefined4 weapon_swing_frame_loaded(void *buf, unsigned size, int idx);
void *weapon_swing_frame_alloc();
int find_and_consume_ammo();
void reset_weapon_swing_state();
void update_weapon_ready_hud_icon();
void cancel_weapon_swing();
void tick_weapon_swing_state();
void draw_hud_icon_sprite();
void weapon_overlay_flash_hold();
void weapon_overlay_flash_restore();
void weapon_overlay_flash_once();
void fire_ranged_weapon();
void request_weapon_swing_graphic();
byte load_weapon_swing_sprites();
void randomize_weapon_jump_shake();
void advance_action_animation_frame();
bool load_weapon_combat_maneuver_data();
void weapon_swing_draw_tick();
void weapon_overlay_and_full_redraw();

#endif
