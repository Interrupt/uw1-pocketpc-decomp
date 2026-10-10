@definition@
typedef ushort, uw_mobile_object_t;
@@
- ushort *DAT_0010190c;
+ uw_mobile_object_t *DAT_0010190c;

@global_declaration@
typedef ushort, uw_mobile_object_t;
@@
- extern ushort *DAT_0010190c;
+ extern uw_mobile_object_t *DAT_0010190c;

@byte_8@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 8)
+ DAT_0010190c->npc_hp
|
- *(undefined1 *)((char *)DAT_0010190c + 8)
+ DAT_0010190c->npc_hp
|
- *(byte *)(DAT_0010190c + 4)
+ DAT_0010190c->npc_hp
|
- *(undefined1 *)(DAT_0010190c + 4)
+ DAT_0010190c->npc_hp
|
- (byte)DAT_0010190c[4]
+ DAT_0010190c->npc_hp
)

@signed_byte_8@
@@
- *(char *)((char *)DAT_0010190c + 8)
+ *(char *)&DAT_0010190c->npc_hp

@byte_9@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 9)
+ DAT_0010190c->full_heading
|
- *(undefined1 *)((char *)DAT_0010190c + 9)
+ DAT_0010190c->full_heading
)

@signed_byte_9@
@@
- *(char *)((char *)DAT_0010190c + 9)
+ *(char *)&DAT_0010190c->full_heading

@byte_10@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 10)
+ DAT_0010190c->movement_flags
|
- *(undefined1 *)((char *)DAT_0010190c + 10)
+ DAT_0010190c->movement_flags
|
- *(byte *)(DAT_0010190c + 5)
+ DAT_0010190c->movement_flags
|
- *(undefined1 *)(DAT_0010190c + 5)
+ DAT_0010190c->movement_flags
|
- (byte)DAT_0010190c[5]
+ DAT_0010190c->movement_flags
)

@signed_byte_10@
@@
- *(char *)((char *)DAT_0010190c + 10)
+ *(char *)&DAT_0010190c->movement_flags

@byte_17@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 17)
+ DAT_0010190c->recent_damage
|
- *(undefined1 *)((char *)DAT_0010190c + 17)
+ DAT_0010190c->recent_damage
)

@signed_byte_17@
@@
- *(char *)((char *)DAT_0010190c + 17)
+ *(char *)&DAT_0010190c->recent_damage

@byte_18@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 18)
+ DAT_0010190c->damage_source
|
- *(undefined1 *)((char *)DAT_0010190c + 18)
+ DAT_0010190c->damage_source
|
- *(byte *)(DAT_0010190c + 9)
+ DAT_0010190c->damage_source
|
- *(undefined1 *)(DAT_0010190c + 9)
+ DAT_0010190c->damage_source
|
- (byte)DAT_0010190c[9]
+ DAT_0010190c->damage_source
)

@signed_byte_18@
@@
- *(char *)((char *)DAT_0010190c + 18)
+ *(char *)&DAT_0010190c->damage_source

@byte_19@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 19)
+ DAT_0010190c->motion_flags
|
- *(undefined1 *)((char *)DAT_0010190c + 19)
+ DAT_0010190c->motion_flags
)

@signed_byte_19@
@@
- *(char *)((char *)DAT_0010190c + 19)
+ *(char *)&DAT_0010190c->motion_flags

@byte_20@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 20)
+ DAT_0010190c->attack_pitch
|
- *(undefined1 *)((char *)DAT_0010190c + 20)
+ DAT_0010190c->attack_pitch
|
- *(byte *)(DAT_0010190c + 10)
+ DAT_0010190c->attack_pitch
|
- *(undefined1 *)(DAT_0010190c + 10)
+ DAT_0010190c->attack_pitch
|
- (byte)DAT_0010190c[10]
+ DAT_0010190c->attack_pitch
)

@signed_byte_20@
@@
- *(char *)((char *)DAT_0010190c + 20)
+ *(char *)&DAT_0010190c->attack_pitch

@byte_21@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 21)
+ DAT_0010190c->animation_flags
|
- *(undefined1 *)((char *)DAT_0010190c + 21)
+ DAT_0010190c->animation_flags
)

@signed_byte_21@
@@
- *(char *)((char *)DAT_0010190c + 21)
+ *(char *)&DAT_0010190c->animation_flags

@byte_24@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 24)
+ DAT_0010190c->heading_flags
|
- *(undefined1 *)((char *)DAT_0010190c + 24)
+ DAT_0010190c->heading_flags
|
- *(byte *)(DAT_0010190c + 12)
+ DAT_0010190c->heading_flags
|
- *(undefined1 *)(DAT_0010190c + 12)
+ DAT_0010190c->heading_flags
|
- (byte)DAT_0010190c[12]
+ DAT_0010190c->heading_flags
)

@signed_byte_24@
@@
- *(char *)((char *)DAT_0010190c + 24)
+ *(char *)&DAT_0010190c->heading_flags

@byte_25@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 25)
+ DAT_0010190c->npc_ai_flags
|
- *(undefined1 *)((char *)DAT_0010190c + 25)
+ DAT_0010190c->npc_ai_flags
)

@signed_byte_25@
@@
- *(char *)((char *)DAT_0010190c + 25)
+ *(char *)&DAT_0010190c->npc_ai_flags

@byte_26@
typedef byte, undefined1;
@@
(
- *(byte *)((char *)DAT_0010190c + 26)
+ DAT_0010190c->npc_whoami
|
- *(undefined1 *)((char *)DAT_0010190c + 26)
+ DAT_0010190c->npc_whoami
|
- *(byte *)(DAT_0010190c + 13)
+ DAT_0010190c->npc_whoami
|
- *(undefined1 *)(DAT_0010190c + 13)
+ DAT_0010190c->npc_whoami
|
- (byte)DAT_0010190c[13]
+ DAT_0010190c->npc_whoami
)

@signed_byte_26@
@@
- *(char *)((char *)DAT_0010190c + 26)
+ *(char *)&DAT_0010190c->npc_whoami

@header_word_0@
typedef ushort;
@@
(
- DAT_0010190c[0]
+ DAT_0010190c->hdr.type_flags
|
- *(ushort *)((char *)DAT_0010190c + 0)
+ DAT_0010190c->hdr.type_flags
|
- *DAT_0010190c
+ DAT_0010190c->hdr.type_flags
)

@header_word_1@
typedef ushort;
@@
(
- DAT_0010190c[1]
+ DAT_0010190c->hdr.position_word
|
- *(ushort *)((char *)DAT_0010190c + 2)
+ DAT_0010190c->hdr.position_word
)

@header_word_2@
typedef ushort;
@@
(
- DAT_0010190c[2]
+ DAT_0010190c->hdr.chain_word
|
- *(ushort *)((char *)DAT_0010190c + 4)
+ DAT_0010190c->hdr.chain_word
)

@header_word_3@
typedef ushort;
@@
(
- DAT_0010190c[3]
+ DAT_0010190c->hdr.link_word
|
- *(ushort *)((char *)DAT_0010190c + 6)
+ DAT_0010190c->hdr.link_word
)

@npc_word_11@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef ushort, undefined2;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 11)
+ DAT_0010190c->goal_word
|
- *(undefined2 *)((char *)DAT_0010190c + 11)
+ DAT_0010190c->goal_word
)
...>
}

@npc_word_13@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef ushort, undefined2;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 13)
+ DAT_0010190c->status_word
|
- *(undefined2 *)((char *)DAT_0010190c + 13)
+ DAT_0010190c->status_word
)
...>
}

@npc_word_15@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef ushort, undefined2;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 15)
+ DAT_0010190c->target_word
|
- *(undefined2 *)((char *)DAT_0010190c + 15)
+ DAT_0010190c->target_word
)
...>
}

@npc_word_22@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$";
typedef ushort, undefined2;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 22)
+ DAT_0010190c->tile_word
|
- *(undefined2 *)((char *)DAT_0010190c + 22)
+ DAT_0010190c->tile_word
|
- DAT_0010190c[11]
+ DAT_0010190c->tile_word
)
...>
}

@remaining_index@
expression I;
typedef ushort;
@@
- DAT_0010190c[I]
+ ((ushort *)DAT_0010190c)[I]

@remaining_offset@
expression I;
typedef ushort;
@@
- DAT_0010190c + I
+ (ushort *)DAT_0010190c + I

@assigned_word_cast@
expression E;
typedef ushort, uw_mobile_object_t;
@@
- DAT_0010190c = (ushort *)E
+ DAT_0010190c = (uw_mobile_object_t *)E
