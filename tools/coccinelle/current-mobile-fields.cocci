@field_0@

typedef byte;
@@

(
- DAT_0010190c->hdr.type_flags & 0x1ff
+ DAT_0010190c->hdr.object_id
)

@field_1@

typedef byte;
@@

(
- (DAT_0010190c->hdr.type_flags >> 15) & 0x1
+ DAT_0010190c->hdr.is_quant
|
- (DAT_0010190c->hdr.type_flags & 0x8000) >> 15
+ DAT_0010190c->hdr.is_quant
|
- DAT_0010190c->hdr.type_flags >> 15
+ DAT_0010190c->hdr.is_quant
|
- (*(byte *)((char *)DAT_0010190c + 1) >> 7) & 0x1
+ DAT_0010190c->hdr.is_quant
|
- *(byte *)((char *)DAT_0010190c + 1) >> 7
+ DAT_0010190c->hdr.is_quant
)

@field_2@

typedef byte;
@@

(
- DAT_0010190c->hdr.position_word & 0x7f
+ DAT_0010190c->hdr.zpos
|
- *(byte *)((char *)DAT_0010190c + 2) & 0x7f
+ DAT_0010190c->hdr.zpos
|
- (byte)DAT_0010190c->hdr.position_word & 0x7f
+ DAT_0010190c->hdr.zpos
)

@field_3@

typedef byte;
@@

(
- (DAT_0010190c->hdr.position_word >> 7) & 0x7
+ DAT_0010190c->hdr.heading
|
- (DAT_0010190c->hdr.position_word & 0x380) >> 7
+ DAT_0010190c->hdr.heading
)

@field_4@

typedef byte;
@@

(
- (DAT_0010190c->hdr.position_word >> 10) & 0x7
+ DAT_0010190c->hdr.ypos
|
- (DAT_0010190c->hdr.position_word & 0x1c00) >> 10
+ DAT_0010190c->hdr.ypos
|
- (*(byte *)((char *)DAT_0010190c + 3) >> 2) & 0x7
+ DAT_0010190c->hdr.ypos
)

@field_5@

typedef byte;
@@

(
- (DAT_0010190c->hdr.position_word >> 13) & 0x7
+ DAT_0010190c->hdr.xpos
|
- (DAT_0010190c->hdr.position_word & 0xe000) >> 13
+ DAT_0010190c->hdr.xpos
|
- DAT_0010190c->hdr.position_word >> 13
+ DAT_0010190c->hdr.xpos
|
- (*(byte *)((char *)DAT_0010190c + 3) >> 5) & 0x7
+ DAT_0010190c->hdr.xpos
|
- *(byte *)((char *)DAT_0010190c + 3) >> 5
+ DAT_0010190c->hdr.xpos
)

@field_6@

typedef byte;
@@

(
- DAT_0010190c->hdr.chain_word & 0x3f
+ DAT_0010190c->hdr.quality
|
- *(byte *)((char *)DAT_0010190c + 4) & 0x3f
+ DAT_0010190c->hdr.quality
|
- (byte)DAT_0010190c->hdr.chain_word & 0x3f
+ DAT_0010190c->hdr.quality
)

@field_7@

typedef byte;
@@

(
- (DAT_0010190c->hdr.chain_word >> 6) & 0x3ff
+ DAT_0010190c->hdr.next
|
- (DAT_0010190c->hdr.chain_word & 0xffc0) >> 6
+ DAT_0010190c->hdr.next
|
- DAT_0010190c->hdr.chain_word >> 6
+ DAT_0010190c->hdr.next
)

@field_8@

typedef byte;
@@

(
- DAT_0010190c->hdr.link_word & 0x3f
+ DAT_0010190c->hdr.owner
|
- *(byte *)((char *)DAT_0010190c + 6) & 0x3f
+ DAT_0010190c->hdr.owner
|
- (byte)DAT_0010190c->hdr.link_word & 0x3f
+ DAT_0010190c->hdr.owner
)

@field_9@

typedef byte;
@@

(
- (DAT_0010190c->hdr.link_word >> 6) & 0x3ff
+ DAT_0010190c->hdr.link
|
- (DAT_0010190c->hdr.link_word & 0xffc0) >> 6
+ DAT_0010190c->hdr.link
|
- DAT_0010190c->hdr.link_word >> 6
+ DAT_0010190c->hdr.link
)

@field_10@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- DAT_0010190c->goal_word & 0xf
+ DAT_0010190c->npc_goal
|
- *(byte *)((char *)DAT_0010190c + 11) & 0xf
+ DAT_0010190c->npc_goal
|
- (byte)DAT_0010190c->goal_word & 0xf
+ DAT_0010190c->npc_goal
)
...>
}

@field_11@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->goal_word >> 4) & 0xff
+ DAT_0010190c->npc_gtarg
|
- (DAT_0010190c->goal_word & 0xff0) >> 4
+ DAT_0010190c->npc_gtarg
)
...>
}

@field_12@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->goal_word >> 12) & 0xf
+ DAT_0010190c->npc_animation_frame
|
- (DAT_0010190c->goal_word & 0xf000) >> 12
+ DAT_0010190c->npc_animation_frame
|
- DAT_0010190c->goal_word >> 12
+ DAT_0010190c->npc_animation_frame
|
- (*(byte *)((char *)DAT_0010190c + 12) >> 4) & 0xf
+ DAT_0010190c->npc_animation_frame
|
- *(byte *)((char *)DAT_0010190c + 12) >> 4
+ DAT_0010190c->npc_animation_frame
)
...>
}

@field_13@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- DAT_0010190c->status_word & 0xf
+ DAT_0010190c->npc_level
|
- *(byte *)((char *)DAT_0010190c + 13) & 0xf
+ DAT_0010190c->npc_level
|
- (byte)DAT_0010190c->status_word & 0xf
+ DAT_0010190c->npc_level
)
...>
}

@field_14@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->status_word >> 13) & 0x1
+ DAT_0010190c->npc_talkedto
|
- (DAT_0010190c->status_word & 0x2000) >> 13
+ DAT_0010190c->npc_talkedto
|
- (*(byte *)((char *)DAT_0010190c + 14) >> 5) & 0x1
+ DAT_0010190c->npc_talkedto
)
...>
}

@field_15@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->status_word >> 14) & 0x3
+ DAT_0010190c->npc_attitude
|
- (DAT_0010190c->status_word & 0xc000) >> 14
+ DAT_0010190c->npc_attitude
|
- DAT_0010190c->status_word >> 14
+ DAT_0010190c->npc_attitude
|
- (*(byte *)((char *)DAT_0010190c + 14) >> 6) & 0x3
+ DAT_0010190c->npc_attitude
|
- *(byte *)((char *)DAT_0010190c + 14) >> 6
+ DAT_0010190c->npc_attitude
)
...>
}

@field_16@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- DAT_0010190c->target_word & 0x3f
+ DAT_0010190c->npc_target_tile_x
|
- *(byte *)((char *)DAT_0010190c + 15) & 0x3f
+ DAT_0010190c->npc_target_tile_x
|
- (byte)DAT_0010190c->target_word & 0x3f
+ DAT_0010190c->npc_target_tile_x
)
...>
}

@field_17@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->target_word >> 6) & 0x3f
+ DAT_0010190c->npc_target_tile_y
|
- (DAT_0010190c->target_word & 0xfc0) >> 6
+ DAT_0010190c->npc_target_tile_y
)
...>
}

@field_18@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->target_word >> 12) & 0xf
+ DAT_0010190c->npc_swing_charge
|
- (DAT_0010190c->target_word & 0xf000) >> 12
+ DAT_0010190c->npc_swing_charge
|
- DAT_0010190c->target_word >> 12
+ DAT_0010190c->npc_swing_charge
|
- (*(byte *)((char *)DAT_0010190c + 16) >> 4) & 0xf
+ DAT_0010190c->npc_swing_charge
|
- *(byte *)((char *)DAT_0010190c + 16) >> 4
+ DAT_0010190c->npc_swing_charge
)
...>
}

@field_19@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->tile_word >> 4) & 0x3f
+ DAT_0010190c->npc_yhome
|
- (DAT_0010190c->tile_word & 0x3f0) >> 4
+ DAT_0010190c->npc_yhome
)
...>
}

@field_20@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef byte;
@@
R F(...) {
<...
(
- (DAT_0010190c->tile_word >> 10) & 0x3f
+ DAT_0010190c->npc_xhome
|
- (DAT_0010190c->tile_word & 0xfc00) >> 10
+ DAT_0010190c->npc_xhome
|
- DAT_0010190c->tile_word >> 10
+ DAT_0010190c->npc_xhome
|
- (*(byte *)((char *)DAT_0010190c + 23) >> 2) & 0x3f
+ DAT_0010190c->npc_xhome
|
- *(byte *)((char *)DAT_0010190c + 23) >> 2
+ DAT_0010190c->npc_xhome
)
...>
}
