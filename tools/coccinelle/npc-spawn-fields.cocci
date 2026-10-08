@init_monster_spawn_defaults_scratch_bytes_word_0_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 0)
+ npc->hdr.type_flags
|
- *(ushort *)((char *)scratch_bytes + 0)
+ npc->hdr.type_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_0_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 0)
+ npc->hdr.type_flags
|
- *(undefined2 *)((char *)scratch_bytes + 0)
+ npc->hdr.type_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_0_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 0)
+ npc->hdr.type_flags_signed
|
- *(short *)((char *)scratch_bytes + 0)
+ npc->hdr.type_flags_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_2_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 2)
+ npc->hdr.position_word
|
- *(ushort *)((char *)scratch_bytes + 2)
+ npc->hdr.position_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_2_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 2)
+ npc->hdr.position_word
|
- *(undefined2 *)((char *)scratch_bytes + 2)
+ npc->hdr.position_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_2_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 2)
+ npc->hdr.position_word_signed
|
- *(short *)((char *)scratch_bytes + 2)
+ npc->hdr.position_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_4_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 4)
+ npc->hdr.chain_word
|
- *(ushort *)((char *)scratch_bytes + 4)
+ npc->hdr.chain_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_4_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 4)
+ npc->hdr.chain_word
|
- *(undefined2 *)((char *)scratch_bytes + 4)
+ npc->hdr.chain_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_4_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 4)
+ npc->hdr.chain_word_signed
|
- *(short *)((char *)scratch_bytes + 4)
+ npc->hdr.chain_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_6_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 6)
+ npc->hdr.link_word
|
- *(ushort *)((char *)scratch_bytes + 6)
+ npc->hdr.link_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_6_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 6)
+ npc->hdr.link_word
|
- *(undefined2 *)((char *)scratch_bytes + 6)
+ npc->hdr.link_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_6_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 6)
+ npc->hdr.link_word_signed
|
- *(short *)((char *)scratch_bytes + 6)
+ npc->hdr.link_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_11_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 11)
+ npc->goal_word
|
- *(ushort *)((char *)scratch_bytes + 11)
+ npc->goal_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_11_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 11)
+ npc->goal_word
|
- *(undefined2 *)((char *)scratch_bytes + 11)
+ npc->goal_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_11_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 11)
+ npc->goal_word_signed
|
- *(short *)((char *)scratch_bytes + 11)
+ npc->goal_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_13_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 13)
+ npc->status_word
|
- *(ushort *)((char *)scratch_bytes + 13)
+ npc->status_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_13_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 13)
+ npc->status_word
|
- *(undefined2 *)((char *)scratch_bytes + 13)
+ npc->status_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_13_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 13)
+ npc->status_word_signed
|
- *(short *)((char *)scratch_bytes + 13)
+ npc->status_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_15_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 15)
+ npc->target_word
|
- *(ushort *)((char *)scratch_bytes + 15)
+ npc->target_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_15_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 15)
+ npc->target_word
|
- *(undefined2 *)((char *)scratch_bytes + 15)
+ npc->target_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_15_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 15)
+ npc->target_word_signed
|
- *(short *)((char *)scratch_bytes + 15)
+ npc->target_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_22_ushort@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)(scratch_bytes + 22)
+ npc->tile_word
|
- *(ushort *)((char *)scratch_bytes + 22)
+ npc->tile_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_22_undefined2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)(scratch_bytes + 22)
+ npc->tile_word
|
- *(undefined2 *)((char *)scratch_bytes + 22)
+ npc->tile_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_word_22_short@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)(scratch_bytes + 22)
+ npc->tile_word_signed
|
- *(short *)((char *)scratch_bytes + 22)
+ npc->tile_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 0)
+ npc->hdr.type_flags_low
|
- *(byte *)((char *)scratch_bytes + 0)
+ npc->hdr.type_flags_low
|
- scratch_bytes[0]
+ npc->hdr.type_flags_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 0)
+ npc->hdr.type_flags_low
|
- *(undefined1 *)((char *)scratch_bytes + 0)
+ npc->hdr.type_flags_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 0)
+ (char *)&npc->hdr.type_flags_low
|
- &*(char *)((char *)scratch_bytes + 0)
+ (char *)&npc->hdr.type_flags_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 0) = E;
+ npc->hdr.type_flags_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 0) = E;
+ npc->hdr.type_flags_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 0)
+ (char)npc->hdr.type_flags_low
|
- *(char *)((char *)scratch_bytes + 0)
+ (char)npc->hdr.type_flags_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 1)
+ npc->hdr.type_flags_high
|
- *(byte *)((char *)scratch_bytes + 1)
+ npc->hdr.type_flags_high
|
- scratch_bytes[1]
+ npc->hdr.type_flags_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 1)
+ npc->hdr.type_flags_high
|
- *(undefined1 *)((char *)scratch_bytes + 1)
+ npc->hdr.type_flags_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 1)
+ (char *)&npc->hdr.type_flags_high
|
- &*(char *)((char *)scratch_bytes + 1)
+ (char *)&npc->hdr.type_flags_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 1) = E;
+ npc->hdr.type_flags_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 1) = E;
+ npc->hdr.type_flags_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_type_flags_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 1)
+ (char)npc->hdr.type_flags_high
|
- *(char *)((char *)scratch_bytes + 1)
+ (char)npc->hdr.type_flags_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 2)
+ npc->hdr.position_word_low
|
- *(byte *)((char *)scratch_bytes + 2)
+ npc->hdr.position_word_low
|
- scratch_bytes[2]
+ npc->hdr.position_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 2)
+ npc->hdr.position_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 2)
+ npc->hdr.position_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 2)
+ (char *)&npc->hdr.position_word_low
|
- &*(char *)((char *)scratch_bytes + 2)
+ (char *)&npc->hdr.position_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 2) = E;
+ npc->hdr.position_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 2) = E;
+ npc->hdr.position_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 2)
+ (char)npc->hdr.position_word_low
|
- *(char *)((char *)scratch_bytes + 2)
+ (char)npc->hdr.position_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 3)
+ npc->hdr.position_word_high
|
- *(byte *)((char *)scratch_bytes + 3)
+ npc->hdr.position_word_high
|
- scratch_bytes[3]
+ npc->hdr.position_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 3)
+ npc->hdr.position_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 3)
+ npc->hdr.position_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 3)
+ (char *)&npc->hdr.position_word_high
|
- &*(char *)((char *)scratch_bytes + 3)
+ (char *)&npc->hdr.position_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 3) = E;
+ npc->hdr.position_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 3) = E;
+ npc->hdr.position_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_position_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 3)
+ (char)npc->hdr.position_word_high
|
- *(char *)((char *)scratch_bytes + 3)
+ (char)npc->hdr.position_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 4)
+ npc->hdr.chain_word_low
|
- *(byte *)((char *)scratch_bytes + 4)
+ npc->hdr.chain_word_low
|
- scratch_bytes[4]
+ npc->hdr.chain_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 4)
+ npc->hdr.chain_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 4)
+ npc->hdr.chain_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 4)
+ (char *)&npc->hdr.chain_word_low
|
- &*(char *)((char *)scratch_bytes + 4)
+ (char *)&npc->hdr.chain_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 4) = E;
+ npc->hdr.chain_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 4) = E;
+ npc->hdr.chain_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 4)
+ (char)npc->hdr.chain_word_low
|
- *(char *)((char *)scratch_bytes + 4)
+ (char)npc->hdr.chain_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 5)
+ npc->hdr.chain_word_high
|
- *(byte *)((char *)scratch_bytes + 5)
+ npc->hdr.chain_word_high
|
- scratch_bytes[5]
+ npc->hdr.chain_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 5)
+ npc->hdr.chain_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 5)
+ npc->hdr.chain_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 5)
+ (char *)&npc->hdr.chain_word_high
|
- &*(char *)((char *)scratch_bytes + 5)
+ (char *)&npc->hdr.chain_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 5) = E;
+ npc->hdr.chain_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 5) = E;
+ npc->hdr.chain_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_chain_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 5)
+ (char)npc->hdr.chain_word_high
|
- *(char *)((char *)scratch_bytes + 5)
+ (char)npc->hdr.chain_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 6)
+ npc->hdr.link_word_low
|
- *(byte *)((char *)scratch_bytes + 6)
+ npc->hdr.link_word_low
|
- scratch_bytes[6]
+ npc->hdr.link_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 6)
+ npc->hdr.link_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 6)
+ npc->hdr.link_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 6)
+ (char *)&npc->hdr.link_word_low
|
- &*(char *)((char *)scratch_bytes + 6)
+ (char *)&npc->hdr.link_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 6) = E;
+ npc->hdr.link_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 6) = E;
+ npc->hdr.link_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 6)
+ (char)npc->hdr.link_word_low
|
- *(char *)((char *)scratch_bytes + 6)
+ (char)npc->hdr.link_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 7)
+ npc->hdr.link_word_high
|
- *(byte *)((char *)scratch_bytes + 7)
+ npc->hdr.link_word_high
|
- scratch_bytes[7]
+ npc->hdr.link_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 7)
+ npc->hdr.link_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 7)
+ npc->hdr.link_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 7)
+ (char *)&npc->hdr.link_word_high
|
- &*(char *)((char *)scratch_bytes + 7)
+ (char *)&npc->hdr.link_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 7) = E;
+ npc->hdr.link_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 7) = E;
+ npc->hdr.link_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_hdr_link_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 7)
+ (char)npc->hdr.link_word_high
|
- *(char *)((char *)scratch_bytes + 7)
+ (char)npc->hdr.link_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_hp_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 8)
+ npc->npc_hp
|
- *(byte *)((char *)scratch_bytes + 8)
+ npc->npc_hp
|
- scratch_bytes[8]
+ npc->npc_hp
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_hp_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 8)
+ npc->npc_hp
|
- *(undefined1 *)((char *)scratch_bytes + 8)
+ npc->npc_hp
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_hp_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 8)
+ (char *)&npc->npc_hp
|
- &*(char *)((char *)scratch_bytes + 8)
+ (char *)&npc->npc_hp
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_hp_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 8) = E;
+ npc->npc_hp = (byte)E;
|
- *(char *)((char *)scratch_bytes + 8) = E;
+ npc->npc_hp = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_hp_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 8)
+ (char)npc->npc_hp
|
- *(char *)((char *)scratch_bytes + 8)
+ (char)npc->npc_hp
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_full_heading_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 9)
+ npc->full_heading
|
- *(byte *)((char *)scratch_bytes + 9)
+ npc->full_heading
|
- scratch_bytes[9]
+ npc->full_heading
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_full_heading_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 9)
+ npc->full_heading
|
- *(undefined1 *)((char *)scratch_bytes + 9)
+ npc->full_heading
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_full_heading_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 9)
+ (char *)&npc->full_heading
|
- &*(char *)((char *)scratch_bytes + 9)
+ (char *)&npc->full_heading
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_full_heading_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 9) = E;
+ npc->full_heading = (byte)E;
|
- *(char *)((char *)scratch_bytes + 9) = E;
+ npc->full_heading = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_full_heading_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 9)
+ (char)npc->full_heading
|
- *(char *)((char *)scratch_bytes + 9)
+ (char)npc->full_heading
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_movement_flags_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 10)
+ npc->movement_flags
|
- *(byte *)((char *)scratch_bytes + 10)
+ npc->movement_flags
|
- scratch_bytes[10]
+ npc->movement_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_movement_flags_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 10)
+ npc->movement_flags
|
- *(undefined1 *)((char *)scratch_bytes + 10)
+ npc->movement_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_movement_flags_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 10)
+ (char *)&npc->movement_flags
|
- &*(char *)((char *)scratch_bytes + 10)
+ (char *)&npc->movement_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_movement_flags_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 10) = E;
+ npc->movement_flags = (byte)E;
|
- *(char *)((char *)scratch_bytes + 10) = E;
+ npc->movement_flags = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_movement_flags_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 10)
+ (char)npc->movement_flags
|
- *(char *)((char *)scratch_bytes + 10)
+ (char)npc->movement_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 11)
+ npc->goal_word_low
|
- *(byte *)((char *)scratch_bytes + 11)
+ npc->goal_word_low
|
- scratch_bytes[11]
+ npc->goal_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 11)
+ npc->goal_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 11)
+ npc->goal_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 11)
+ (char *)&npc->goal_word_low
|
- &*(char *)((char *)scratch_bytes + 11)
+ (char *)&npc->goal_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 11) = E;
+ npc->goal_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 11) = E;
+ npc->goal_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 11)
+ (char)npc->goal_word_low
|
- *(char *)((char *)scratch_bytes + 11)
+ (char)npc->goal_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 12)
+ npc->goal_word_high
|
- *(byte *)((char *)scratch_bytes + 12)
+ npc->goal_word_high
|
- scratch_bytes[12]
+ npc->goal_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 12)
+ npc->goal_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 12)
+ npc->goal_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 12)
+ (char *)&npc->goal_word_high
|
- &*(char *)((char *)scratch_bytes + 12)
+ (char *)&npc->goal_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 12) = E;
+ npc->goal_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 12) = E;
+ npc->goal_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_goal_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 12)
+ (char)npc->goal_word_high
|
- *(char *)((char *)scratch_bytes + 12)
+ (char)npc->goal_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 13)
+ npc->status_word_low
|
- *(byte *)((char *)scratch_bytes + 13)
+ npc->status_word_low
|
- scratch_bytes[13]
+ npc->status_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 13)
+ npc->status_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 13)
+ npc->status_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 13)
+ (char *)&npc->status_word_low
|
- &*(char *)((char *)scratch_bytes + 13)
+ (char *)&npc->status_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 13) = E;
+ npc->status_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 13) = E;
+ npc->status_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 13)
+ (char)npc->status_word_low
|
- *(char *)((char *)scratch_bytes + 13)
+ (char)npc->status_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 14)
+ npc->status_word_high
|
- *(byte *)((char *)scratch_bytes + 14)
+ npc->status_word_high
|
- scratch_bytes[14]
+ npc->status_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 14)
+ npc->status_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 14)
+ npc->status_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 14)
+ (char *)&npc->status_word_high
|
- &*(char *)((char *)scratch_bytes + 14)
+ (char *)&npc->status_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 14) = E;
+ npc->status_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 14) = E;
+ npc->status_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_status_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 14)
+ (char)npc->status_word_high
|
- *(char *)((char *)scratch_bytes + 14)
+ (char)npc->status_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 15)
+ npc->target_word_low
|
- *(byte *)((char *)scratch_bytes + 15)
+ npc->target_word_low
|
- scratch_bytes[15]
+ npc->target_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 15)
+ npc->target_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 15)
+ npc->target_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 15)
+ (char *)&npc->target_word_low
|
- &*(char *)((char *)scratch_bytes + 15)
+ (char *)&npc->target_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 15) = E;
+ npc->target_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 15) = E;
+ npc->target_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 15)
+ (char)npc->target_word_low
|
- *(char *)((char *)scratch_bytes + 15)
+ (char)npc->target_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 16)
+ npc->target_word_high
|
- *(byte *)((char *)scratch_bytes + 16)
+ npc->target_word_high
|
- scratch_bytes[16]
+ npc->target_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 16)
+ npc->target_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 16)
+ npc->target_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 16)
+ (char *)&npc->target_word_high
|
- &*(char *)((char *)scratch_bytes + 16)
+ (char *)&npc->target_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 16) = E;
+ npc->target_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 16) = E;
+ npc->target_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_target_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 16)
+ (char)npc->target_word_high
|
- *(char *)((char *)scratch_bytes + 16)
+ (char)npc->target_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_recent_damage_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 17)
+ npc->recent_damage
|
- *(byte *)((char *)scratch_bytes + 17)
+ npc->recent_damage
|
- scratch_bytes[17]
+ npc->recent_damage
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_recent_damage_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 17)
+ npc->recent_damage
|
- *(undefined1 *)((char *)scratch_bytes + 17)
+ npc->recent_damage
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_recent_damage_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 17)
+ (char *)&npc->recent_damage
|
- &*(char *)((char *)scratch_bytes + 17)
+ (char *)&npc->recent_damage
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_recent_damage_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 17) = E;
+ npc->recent_damage = (byte)E;
|
- *(char *)((char *)scratch_bytes + 17) = E;
+ npc->recent_damage = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_recent_damage_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 17)
+ (char)npc->recent_damage
|
- *(char *)((char *)scratch_bytes + 17)
+ (char)npc->recent_damage
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_damage_source_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 18)
+ npc->damage_source
|
- *(byte *)((char *)scratch_bytes + 18)
+ npc->damage_source
|
- scratch_bytes[18]
+ npc->damage_source
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_damage_source_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 18)
+ npc->damage_source
|
- *(undefined1 *)((char *)scratch_bytes + 18)
+ npc->damage_source
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_damage_source_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 18)
+ (char *)&npc->damage_source
|
- &*(char *)((char *)scratch_bytes + 18)
+ (char *)&npc->damage_source
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_damage_source_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 18) = E;
+ npc->damage_source = (byte)E;
|
- *(char *)((char *)scratch_bytes + 18) = E;
+ npc->damage_source = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_damage_source_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 18)
+ (char)npc->damage_source
|
- *(char *)((char *)scratch_bytes + 18)
+ (char)npc->damage_source
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_motion_flags_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 19)
+ npc->motion_flags
|
- *(byte *)((char *)scratch_bytes + 19)
+ npc->motion_flags
|
- scratch_bytes[19]
+ npc->motion_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_motion_flags_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 19)
+ npc->motion_flags
|
- *(undefined1 *)((char *)scratch_bytes + 19)
+ npc->motion_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_motion_flags_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 19)
+ (char *)&npc->motion_flags
|
- &*(char *)((char *)scratch_bytes + 19)
+ (char *)&npc->motion_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_motion_flags_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 19) = E;
+ npc->motion_flags = (byte)E;
|
- *(char *)((char *)scratch_bytes + 19) = E;
+ npc->motion_flags = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_motion_flags_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 19)
+ (char)npc->motion_flags
|
- *(char *)((char *)scratch_bytes + 19)
+ (char)npc->motion_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_attack_pitch_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 20)
+ npc->attack_pitch
|
- *(byte *)((char *)scratch_bytes + 20)
+ npc->attack_pitch
|
- scratch_bytes[20]
+ npc->attack_pitch
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_attack_pitch_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 20)
+ npc->attack_pitch
|
- *(undefined1 *)((char *)scratch_bytes + 20)
+ npc->attack_pitch
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_attack_pitch_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 20)
+ (char *)&npc->attack_pitch
|
- &*(char *)((char *)scratch_bytes + 20)
+ (char *)&npc->attack_pitch
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_attack_pitch_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 20) = E;
+ npc->attack_pitch = (byte)E;
|
- *(char *)((char *)scratch_bytes + 20) = E;
+ npc->attack_pitch = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_attack_pitch_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 20)
+ (char)npc->attack_pitch
|
- *(char *)((char *)scratch_bytes + 20)
+ (char)npc->attack_pitch
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_animation_flags_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 21)
+ npc->animation_flags
|
- *(byte *)((char *)scratch_bytes + 21)
+ npc->animation_flags
|
- scratch_bytes[21]
+ npc->animation_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_animation_flags_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 21)
+ npc->animation_flags
|
- *(undefined1 *)((char *)scratch_bytes + 21)
+ npc->animation_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_animation_flags_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 21)
+ (char *)&npc->animation_flags
|
- &*(char *)((char *)scratch_bytes + 21)
+ (char *)&npc->animation_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_animation_flags_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 21) = E;
+ npc->animation_flags = (byte)E;
|
- *(char *)((char *)scratch_bytes + 21) = E;
+ npc->animation_flags = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_animation_flags_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 21)
+ (char)npc->animation_flags
|
- *(char *)((char *)scratch_bytes + 21)
+ (char)npc->animation_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_low_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 22)
+ npc->tile_word_low
|
- *(byte *)((char *)scratch_bytes + 22)
+ npc->tile_word_low
|
- scratch_bytes[22]
+ npc->tile_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_low_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 22)
+ npc->tile_word_low
|
- *(undefined1 *)((char *)scratch_bytes + 22)
+ npc->tile_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_low_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 22)
+ (char *)&npc->tile_word_low
|
- &*(char *)((char *)scratch_bytes + 22)
+ (char *)&npc->tile_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_low_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 22) = E;
+ npc->tile_word_low = (byte)E;
|
- *(char *)((char *)scratch_bytes + 22) = E;
+ npc->tile_word_low = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_low_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 22)
+ (char)npc->tile_word_low
|
- *(char *)((char *)scratch_bytes + 22)
+ (char)npc->tile_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_high_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 23)
+ npc->tile_word_high
|
- *(byte *)((char *)scratch_bytes + 23)
+ npc->tile_word_high
|
- scratch_bytes[23]
+ npc->tile_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_high_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 23)
+ npc->tile_word_high
|
- *(undefined1 *)((char *)scratch_bytes + 23)
+ npc->tile_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_high_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 23)
+ (char *)&npc->tile_word_high
|
- &*(char *)((char *)scratch_bytes + 23)
+ (char *)&npc->tile_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_high_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 23) = E;
+ npc->tile_word_high = (byte)E;
|
- *(char *)((char *)scratch_bytes + 23) = E;
+ npc->tile_word_high = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_tile_word_high_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 23)
+ (char)npc->tile_word_high
|
- *(char *)((char *)scratch_bytes + 23)
+ (char)npc->tile_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_heading_flags_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 24)
+ npc->heading_flags
|
- *(byte *)((char *)scratch_bytes + 24)
+ npc->heading_flags
|
- scratch_bytes[24]
+ npc->heading_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_heading_flags_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 24)
+ npc->heading_flags
|
- *(undefined1 *)((char *)scratch_bytes + 24)
+ npc->heading_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_heading_flags_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 24)
+ (char *)&npc->heading_flags
|
- &*(char *)((char *)scratch_bytes + 24)
+ (char *)&npc->heading_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_heading_flags_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 24) = E;
+ npc->heading_flags = (byte)E;
|
- *(char *)((char *)scratch_bytes + 24) = E;
+ npc->heading_flags = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_heading_flags_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 24)
+ (char)npc->heading_flags
|
- *(char *)((char *)scratch_bytes + 24)
+ (char)npc->heading_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_ai_flags_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 25)
+ npc->npc_ai_flags
|
- *(byte *)((char *)scratch_bytes + 25)
+ npc->npc_ai_flags
|
- scratch_bytes[25]
+ npc->npc_ai_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_ai_flags_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 25)
+ npc->npc_ai_flags
|
- *(undefined1 *)((char *)scratch_bytes + 25)
+ npc->npc_ai_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_ai_flags_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 25)
+ (char *)&npc->npc_ai_flags
|
- &*(char *)((char *)scratch_bytes + 25)
+ (char *)&npc->npc_ai_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_ai_flags_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 25) = E;
+ npc->npc_ai_flags = (byte)E;
|
- *(char *)((char *)scratch_bytes + 25) = E;
+ npc->npc_ai_flags = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_ai_flags_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 25)
+ (char)npc->npc_ai_flags
|
- *(char *)((char *)scratch_bytes + 25)
+ (char)npc->npc_ai_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_whoami_byte@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(scratch_bytes + 26)
+ npc->npc_whoami
|
- *(byte *)((char *)scratch_bytes + 26)
+ npc->npc_whoami
|
- scratch_bytes[26]
+ npc->npc_whoami
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_whoami_undefined1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(scratch_bytes + 26)
+ npc->npc_whoami
|
- *(undefined1 *)((char *)scratch_bytes + 26)
+ npc->npc_whoami
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_whoami_address@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(scratch_bytes + 26)
+ (char *)&npc->npc_whoami
|
- &*(char *)((char *)scratch_bytes + 26)
+ (char *)&npc->npc_whoami
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_whoami_store@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 26) = E;
+ npc->npc_whoami = (byte)E;
|
- *(char *)((char *)scratch_bytes + 26) = E;
+ npc->npc_whoami = (byte)E;
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_npc_whoami_char@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(scratch_bytes + 26)
+ (char)npc->npc_whoami
|
- *(char *)((char *)scratch_bytes + 26)
+ (char)npc->npc_whoami
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_type_flags@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->type_flags
+ npc->hdr.type_flags
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_type_flags_low@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->type_flags_low
+ npc->hdr.type_flags_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_type_flags_high@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->type_flags_high
+ npc->hdr.type_flags_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_type_flags_signed@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->type_flags_signed
+ npc->hdr.type_flags_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_position_word@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->position_word
+ npc->hdr.position_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_position_word_low@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->position_word_low
+ npc->hdr.position_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_position_word_high@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->position_word_high
+ npc->hdr.position_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_position_word_signed@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->position_word_signed
+ npc->hdr.position_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_chain_word@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->chain_word
+ npc->hdr.chain_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_chain_word_low@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->chain_word_low
+ npc->hdr.chain_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_chain_word_high@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->chain_word_high
+ npc->hdr.chain_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_chain_word_signed@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->chain_word_signed
+ npc->hdr.chain_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_link_word@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->link_word
+ npc->hdr.link_word
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_link_word_low@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->link_word_low
+ npc->hdr.link_word_low
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_link_word_high@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->link_word_high
+ npc->hdr.link_word_high
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_link_word_signed@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->link_word_signed
+ npc->hdr.link_word_signed
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_item_id@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->item_id
+ npc->hdr.item_id
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_zpos@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->zpos
+ npc->hdr.zpos
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_heading@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->heading
+ npc->hdr.heading
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_xpos@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->xpos
+ npc->hdr.xpos
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_ypos@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->ypos
+ npc->hdr.ypos
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_quality@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->quality
+ npc->hdr.quality
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_next@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->next
+ npc->hdr.next
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_owner@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->owner
+ npc->hdr.owner
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_header_link@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)scratch_bytes)->link
+ npc->hdr.link
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_pointer@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- byte *scratch_bytes = (byte *)g_scratch_object_ptr;
+ uw_mobile_object_t *npc = (uw_mobile_object_t *)g_scratch_object_ptr;
)
...>
}

@spawn_update_0 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->tile_word;
- npc->tile_word_low = (byte)(V & 0x3ff) ;
- npc->tile_word_high = (byte)((V & 0x3ff) >> 8) | 0x80;
+ V = npc->tile_word;
+ npc->npc_xhome = 32;
...>
}

@spawn_update_1 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->tile_word;
- npc->tile_word_low = (byte)(V & 0xfe0f) ;
- npc->tile_word_high = (byte)((V & 0xfe0f) >> 8) | 2;
+ V = npc->tile_word;
+ npc->npc_yhome = 32;
...>
}

@spawn_update_2 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->tile_word;
- npc->tile_word_low = (byte)(V & 0xfff0) ;
- npc->tile_word_high = (byte)((V & 0xfff0) >> 8) ;
+ V = npc->tile_word;
+ npc->npc_path_slot = 0;
...>
}

@spawn_update_3 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->hdr.chain_word;
- npc->hdr.chain_word_low = (byte)(V & 0xffc0) ^ 0x20;
- npc->hdr.chain_word_high = (byte)((V & 0xffc0) >> 8) ;
+ V = npc->hdr.chain_word;
+ npc->hdr.quality = 32;
...>
}

@spawn_update_4 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->hdr.link_word;
- npc->hdr.link_word_low = (byte)(V & 0xffc0) ^ 0x20;
- npc->hdr.link_word_high = (byte)((V & 0xffc0) >> 8) ;
+ V = npc->hdr.link_word;
+ npc->hdr.owner = 32;
...>
}

@spawn_update_5 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->goal_word;
- npc->goal_word_low = (byte)(V & 0xfff8) | 8;
- npc->goal_word_high = (byte)((V & 0xfff8) >> 8) ;
+ V = npc->goal_word;
+ npc->npc_goal = 8;
...>
}

@spawn_update_6 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->goal_word;
- npc->goal_word_low = (byte)(V & 0xf00f) ;
- npc->goal_word_high = (byte)((V & 0xf00f) >> 8) ;
+ V = npc->goal_word;
+ npc->npc_gtarg = 0;
...>
}

@spawn_update_7 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->goal_word;
- npc->goal_word_low = (byte)(V & 0xfff) ;
- npc->goal_word_high = (byte)((V & 0xfff) >> 8) ;
+ V = npc->goal_word;
+ npc->npc_animation_frame = 0;
...>
}

@spawn_update_8 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xfff0) ;
- npc->status_word_high = (byte)((V & 0xfff0) >> 8) ;
+ V = npc->status_word;
+ npc->npc_level = 0;
...>
}

@spawn_update_9 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xdfff) ;
- npc->status_word_high = (byte)((V & 0xdfff) >> 8) ;
+ V = npc->status_word;
+ npc->npc_talkedto = 0;
...>
}

@spawn_update_10 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0x3fff) ;
- npc->status_word_high = (byte)((V & 0x3fff) >> 8) | 0x80;
+ V = npc->status_word;
+ npc->npc_attitude = 2;
...>
}

@spawn_update_11 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->target_word;
- npc->target_word_low = (byte)(V & 0xffc0) ;
- npc->target_word_high = (byte)((V & 0xffc0) >> 8) ;
+ V = npc->target_word;
+ npc->npc_target_tile_x = 0;
...>
}

@spawn_update_12 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->target_word;
- npc->target_word_low = (byte)(V & 0xf03f) ;
- npc->target_word_high = (byte)((V & 0xf03f) >> 8) ;
+ V = npc->target_word;
+ npc->npc_target_tile_y = 0;
...>
}

@spawn_update_13 disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->target_word;
- npc->target_word_low = (byte)(V & 0xfff) ;
- npc->target_word_high = (byte)((V & 0xfff) >> 8) ;
+ V = npc->target_word;
+ npc->npc_swing_charge = 0;
...>
}

@spawn_update_reserved_ff0f disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xff0f) ;
- npc->status_word_high = (byte)((V & 0xff0f) >> 8) ;
+ V = npc->status_word;
+ npc->status_word = V & 0xff0f;
...>
}

@spawn_update_reserved_fdff disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xfdff) ;
- npc->status_word_high = (byte)((V & 0xfdff) >> 8) ;
+ V = npc->status_word;
+ npc->status_word = V & 0xfdff;
...>
}

@spawn_update_reserved_fbff disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xfbff) ;
- npc->status_word_high = (byte)((V & 0xfbff) >> 8) ;
+ V = npc->status_word;
+ npc->status_word = V & 0xfbff;
...>
}

@spawn_update_reserved_f7ff disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xf7ff) ;
- npc->status_word_high = (byte)((V & 0xf7ff) >> 8) ;
+ V = npc->status_word;
+ npc->status_word = V & 0xf7ff;
...>
}

@spawn_update_reserved_feff disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xfeff) ;
- npc->status_word_high = (byte)((V & 0xfeff) >> 8) ;
+ V = npc->status_word;
+ npc->status_word = V & 0xfeff;
...>
}

@spawn_update_reserved_efff disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {
<...
- V = npc->status_word;
- npc->status_word_low = (byte)(V & 0xefff) ;
- npc->status_word_high = (byte)((V & 0xefff) >> 8) ;
+ V = npc->status_word;
+ npc->status_word = V & 0xefff;
...>
}

@init_monster_spawn_defaults_scratch_bytes_full_heading@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (byte)(npc->hdr.position_word >> 2) & 0xe0
+ npc->hdr.heading << 5
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_monster_row@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- DAT_001007c8 = &DAT_001007d0 + (npc->hdr.item_id & 0x3f) * 0x30;
+ DAT_001007c8 = &g_monster_type_props[npc->hdr.item_id & 0x3f];
)
...>
}

@init_monster_spawn_defaults_scratch_bytes_max_hp@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
typedef byte, undefined1, undefined2, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- DAT_001007c8[4]
+ DAT_001007c8->max_hp
)
...>
}

@monster_row_type@
typedef undefined, uw_monster_type_props_t;
@@
- static undefined *DAT_001007c8;
+ static uw_monster_type_props_t *DAT_001007c8;
