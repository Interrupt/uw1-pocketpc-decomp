#ifndef HEADERS_WEAPON_SWING_H
#define HEADERS_WEAPON_SWING_H

/* Declarations for weapon_swing.c: weapon swing animation (frame
 * loading, request/draw tick, overlay redraw). Pulls in uw.h itself
 * so this header is self-contained for any caller. */
#include "uw.h"

#define UW_WEAPON_SWING_FRAME_COUNT 28

extern undefined1 DAT_000870e0;
extern short DAT_000870e4;


void debug_noop_frame_hook(undefined4 frame);
undefined4 weapon_swing_frame_loaded(void *buf, unsigned size, int idx);
void *weapon_swing_frame_alloc(unsigned int byte_count);
int find_and_consume_ammo(short weapon_type);
void reset_weapon_swing_state(void);
void update_weapon_ready_hud_icon(void);
void cancel_weapon_swing(void);
void tick_weapon_swing_state(short attack_direction);
void draw_hud_icon_sprite(int sprite_id, int x, int y);
void weapon_overlay_flash_hold(undefined4 unused_code);
void weapon_overlay_flash_restore(undefined4 unused_code);
void weapon_overlay_flash_once(undefined4 unused_code);
void fire_ranged_weapon(short weapon_type);
void request_weapon_swing_graphic(char category);
byte load_weapon_swing_sprites(void);
void randomize_weapon_jump_shake(short intensity);
void advance_action_animation_frame(void);
bool load_weapon_combat_maneuver_data(void);
void weapon_swing_draw_tick(void);
void weapon_overlay_and_full_redraw(void);

#endif
