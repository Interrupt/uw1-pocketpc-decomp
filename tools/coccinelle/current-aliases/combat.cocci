@npc_combat_approach_tick_iVar5_rec_word_0_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags
|
- *(ushort *)(iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags
|
- *(ushort *)iVar5_rec
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_0_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags
|
- *(undefined2 *)(iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags
|
- *(undefined2 *)iVar5_rec
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_0_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_signed
|
- *(short *)(iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_signed
|
- *(short *)iVar5_rec
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_2_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word
|
- *(ushort *)(iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_2_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word
|
- *(undefined2 *)(iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_2_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_signed
|
- *(short *)(iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_4_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word
|
- *(ushort *)(iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_4_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word
|
- *(undefined2 *)(iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_4_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_signed
|
- *(short *)(iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_6_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word
|
- *(ushort *)(iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_6_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word
|
- *(undefined2 *)(iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_6_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_signed
|
- *(short *)(iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_11_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word
|
- *(ushort *)(iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_11_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word
|
- *(undefined2 *)(iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_11_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_signed
|
- *(short *)(iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_13_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word
|
- *(ushort *)(iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_13_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word
|
- *(undefined2 *)(iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_13_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_signed
|
- *(short *)(iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_15_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word
|
- *(ushort *)(iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_15_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word
|
- *(undefined2 *)(iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_15_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_signed
|
- *(short *)(iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_22_ushort@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word
|
- *(ushort *)(iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_22_undefined2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word
|
- *(undefined2 *)(iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word
)
...>
}

@npc_combat_approach_tick_iVar5_rec_word_22_short@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_signed
|
- *(short *)(iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_signed
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_0_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- *(byte *)(iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- *(byte *)iVar5_rec
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- *(undefined1 *)(iVar5_rec + 0)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- *(undefined1 *)iVar5_rec
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_0_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- &*(char *)(iVar5_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- &*(char *)iVar5_rec
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- &iVar5_rec[0]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_0_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar5_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar5_rec = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low = (byte)E;
|
- iVar5_rec[0] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_0_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 0)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- *(char *)(iVar5_rec + 0)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- *(char *)iVar5_rec
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
|
- iVar5_rec[0]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_1_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 1)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
|
- *(byte *)(iVar5_rec + 1)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 1)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
|
- *(undefined1 *)(iVar5_rec + 1)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_1_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
|
- &*(char *)(iVar5_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
|
- &iVar5_rec[1]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_1_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar5_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high = (byte)E;
|
- iVar5_rec[1] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_1_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 1)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
|
- *(char *)(iVar5_rec + 1)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
|
- iVar5_rec[1]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_2_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
|
- *(byte *)(iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
|
- *(undefined1 *)(iVar5_rec + 2)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_2_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
|
- &*(char *)(iVar5_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
|
- &iVar5_rec[2]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_2_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low = (byte)E;
|
- iVar5_rec[2] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_2_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 2)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
|
- *(char *)(iVar5_rec + 2)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
|
- iVar5_rec[2]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_3_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 3)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
|
- *(byte *)(iVar5_rec + 3)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 3)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
|
- *(undefined1 *)(iVar5_rec + 3)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_3_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
|
- &*(char *)(iVar5_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
|
- &iVar5_rec[3]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_3_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high = (byte)E;
|
- iVar5_rec[3] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_3_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 3)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
|
- *(char *)(iVar5_rec + 3)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
|
- iVar5_rec[3]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.position_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_4_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
|
- *(byte *)(iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
|
- *(undefined1 *)(iVar5_rec + 4)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_4_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
|
- &*(char *)(iVar5_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
|
- &iVar5_rec[4]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_4_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low = (byte)E;
|
- iVar5_rec[4] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_4_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 4)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
|
- *(char *)(iVar5_rec + 4)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
|
- iVar5_rec[4]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_5_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 5)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
|
- *(byte *)(iVar5_rec + 5)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 5)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
|
- *(undefined1 *)(iVar5_rec + 5)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_5_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
|
- &*(char *)(iVar5_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
|
- &iVar5_rec[5]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_5_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high = (byte)E;
|
- iVar5_rec[5] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_5_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 5)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
|
- *(char *)(iVar5_rec + 5)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
|
- iVar5_rec[5]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_6_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
|
- *(byte *)(iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
|
- *(undefined1 *)(iVar5_rec + 6)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_6_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
|
- &*(char *)(iVar5_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
|
- &iVar5_rec[6]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_6_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low = (byte)E;
|
- iVar5_rec[6] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_6_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 6)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
|
- *(char *)(iVar5_rec + 6)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
|
- iVar5_rec[6]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_7_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 7)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
|
- *(byte *)(iVar5_rec + 7)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 7)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
|
- *(undefined1 *)(iVar5_rec + 7)
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_7_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
|
- &*(char *)(iVar5_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
|
- &iVar5_rec[7]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_7_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high = (byte)E;
|
- iVar5_rec[7] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_7_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 7)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
|
- *(char *)(iVar5_rec + 7)
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
|
- iVar5_rec[7]
+ (char)((uw_mobile_object_t *)iVar5_rec)->hdr.link_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_8_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 8)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp
|
- *(byte *)(iVar5_rec + 8)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 8)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp
|
- *(undefined1 *)(iVar5_rec + 8)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_8_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_hp
|
- &*(char *)(iVar5_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_hp
|
- &iVar5_rec[8]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_hp
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_8_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp = (byte)E;
|
- *(char *)(iVar5_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp = (byte)E;
|
- iVar5_rec[8] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_hp = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_8_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 8)
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_hp
|
- *(char *)(iVar5_rec + 8)
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_hp
|
- iVar5_rec[8]
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_hp
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_9_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 9)
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading
|
- *(byte *)(iVar5_rec + 9)
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 9)
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading
|
- *(undefined1 *)(iVar5_rec + 9)
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_9_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->full_heading
|
- &*(char *)(iVar5_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->full_heading
|
- &iVar5_rec[9]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->full_heading
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_9_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading = (byte)E;
|
- *(char *)(iVar5_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading = (byte)E;
|
- iVar5_rec[9] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->full_heading = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_9_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 9)
+ (char)((uw_mobile_object_t *)iVar5_rec)->full_heading
|
- *(char *)(iVar5_rec + 9)
+ (char)((uw_mobile_object_t *)iVar5_rec)->full_heading
|
- iVar5_rec[9]
+ (char)((uw_mobile_object_t *)iVar5_rec)->full_heading
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_10_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 10)
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags
|
- *(byte *)(iVar5_rec + 10)
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 10)
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags
|
- *(undefined1 *)(iVar5_rec + 10)
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_10_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->movement_flags
|
- &*(char *)(iVar5_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->movement_flags
|
- &iVar5_rec[10]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->movement_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_10_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags = (byte)E;
|
- *(char *)(iVar5_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags = (byte)E;
|
- iVar5_rec[10] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->movement_flags = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_10_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 10)
+ (char)((uw_mobile_object_t *)iVar5_rec)->movement_flags
|
- *(char *)(iVar5_rec + 10)
+ (char)((uw_mobile_object_t *)iVar5_rec)->movement_flags
|
- iVar5_rec[10]
+ (char)((uw_mobile_object_t *)iVar5_rec)->movement_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_11_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low
|
- *(byte *)(iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low
|
- *(undefined1 *)(iVar5_rec + 11)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_11_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->goal_word_low
|
- &*(char *)(iVar5_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->goal_word_low
|
- &iVar5_rec[11]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->goal_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_11_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low = (byte)E;
|
- iVar5_rec[11] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_11_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 11)
+ (char)((uw_mobile_object_t *)iVar5_rec)->goal_word_low
|
- *(char *)(iVar5_rec + 11)
+ (char)((uw_mobile_object_t *)iVar5_rec)->goal_word_low
|
- iVar5_rec[11]
+ (char)((uw_mobile_object_t *)iVar5_rec)->goal_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_12_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 12)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high
|
- *(byte *)(iVar5_rec + 12)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 12)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high
|
- *(undefined1 *)(iVar5_rec + 12)
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_12_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->goal_word_high
|
- &*(char *)(iVar5_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->goal_word_high
|
- &iVar5_rec[12]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->goal_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_12_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high = (byte)E;
|
- iVar5_rec[12] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->goal_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_12_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 12)
+ (char)((uw_mobile_object_t *)iVar5_rec)->goal_word_high
|
- *(char *)(iVar5_rec + 12)
+ (char)((uw_mobile_object_t *)iVar5_rec)->goal_word_high
|
- iVar5_rec[12]
+ (char)((uw_mobile_object_t *)iVar5_rec)->goal_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_13_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low
|
- *(byte *)(iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low
|
- *(undefined1 *)(iVar5_rec + 13)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_13_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->status_word_low
|
- &*(char *)(iVar5_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->status_word_low
|
- &iVar5_rec[13]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->status_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_13_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low = (byte)E;
|
- iVar5_rec[13] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_13_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 13)
+ (char)((uw_mobile_object_t *)iVar5_rec)->status_word_low
|
- *(char *)(iVar5_rec + 13)
+ (char)((uw_mobile_object_t *)iVar5_rec)->status_word_low
|
- iVar5_rec[13]
+ (char)((uw_mobile_object_t *)iVar5_rec)->status_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_14_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 14)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high
|
- *(byte *)(iVar5_rec + 14)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 14)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high
|
- *(undefined1 *)(iVar5_rec + 14)
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_14_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->status_word_high
|
- &*(char *)(iVar5_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->status_word_high
|
- &iVar5_rec[14]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->status_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_14_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high = (byte)E;
|
- iVar5_rec[14] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->status_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_14_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 14)
+ (char)((uw_mobile_object_t *)iVar5_rec)->status_word_high
|
- *(char *)(iVar5_rec + 14)
+ (char)((uw_mobile_object_t *)iVar5_rec)->status_word_high
|
- iVar5_rec[14]
+ (char)((uw_mobile_object_t *)iVar5_rec)->status_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_15_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low
|
- *(byte *)(iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low
|
- *(undefined1 *)(iVar5_rec + 15)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_15_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->target_word_low
|
- &*(char *)(iVar5_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->target_word_low
|
- &iVar5_rec[15]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->target_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_15_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low = (byte)E;
|
- iVar5_rec[15] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_15_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 15)
+ (char)((uw_mobile_object_t *)iVar5_rec)->target_word_low
|
- *(char *)(iVar5_rec + 15)
+ (char)((uw_mobile_object_t *)iVar5_rec)->target_word_low
|
- iVar5_rec[15]
+ (char)((uw_mobile_object_t *)iVar5_rec)->target_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_16_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 16)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high
|
- *(byte *)(iVar5_rec + 16)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 16)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high
|
- *(undefined1 *)(iVar5_rec + 16)
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_16_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->target_word_high
|
- &*(char *)(iVar5_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->target_word_high
|
- &iVar5_rec[16]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->target_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_16_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high = (byte)E;
|
- iVar5_rec[16] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->target_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_16_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 16)
+ (char)((uw_mobile_object_t *)iVar5_rec)->target_word_high
|
- *(char *)(iVar5_rec + 16)
+ (char)((uw_mobile_object_t *)iVar5_rec)->target_word_high
|
- iVar5_rec[16]
+ (char)((uw_mobile_object_t *)iVar5_rec)->target_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_17_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 17)
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage
|
- *(byte *)(iVar5_rec + 17)
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 17)
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage
|
- *(undefined1 *)(iVar5_rec + 17)
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_17_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->recent_damage
|
- &*(char *)(iVar5_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->recent_damage
|
- &iVar5_rec[17]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->recent_damage
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_17_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage = (byte)E;
|
- *(char *)(iVar5_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage = (byte)E;
|
- iVar5_rec[17] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->recent_damage = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_17_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 17)
+ (char)((uw_mobile_object_t *)iVar5_rec)->recent_damage
|
- *(char *)(iVar5_rec + 17)
+ (char)((uw_mobile_object_t *)iVar5_rec)->recent_damage
|
- iVar5_rec[17]
+ (char)((uw_mobile_object_t *)iVar5_rec)->recent_damage
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_18_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 18)
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source
|
- *(byte *)(iVar5_rec + 18)
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 18)
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source
|
- *(undefined1 *)(iVar5_rec + 18)
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_18_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->damage_source
|
- &*(char *)(iVar5_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->damage_source
|
- &iVar5_rec[18]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->damage_source
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_18_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source = (byte)E;
|
- *(char *)(iVar5_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source = (byte)E;
|
- iVar5_rec[18] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->damage_source = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_18_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 18)
+ (char)((uw_mobile_object_t *)iVar5_rec)->damage_source
|
- *(char *)(iVar5_rec + 18)
+ (char)((uw_mobile_object_t *)iVar5_rec)->damage_source
|
- iVar5_rec[18]
+ (char)((uw_mobile_object_t *)iVar5_rec)->damage_source
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_19_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 19)
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags
|
- *(byte *)(iVar5_rec + 19)
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 19)
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags
|
- *(undefined1 *)(iVar5_rec + 19)
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_19_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->motion_flags
|
- &*(char *)(iVar5_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->motion_flags
|
- &iVar5_rec[19]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->motion_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_19_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags = (byte)E;
|
- *(char *)(iVar5_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags = (byte)E;
|
- iVar5_rec[19] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->motion_flags = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_19_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 19)
+ (char)((uw_mobile_object_t *)iVar5_rec)->motion_flags
|
- *(char *)(iVar5_rec + 19)
+ (char)((uw_mobile_object_t *)iVar5_rec)->motion_flags
|
- iVar5_rec[19]
+ (char)((uw_mobile_object_t *)iVar5_rec)->motion_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_20_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 20)
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch
|
- *(byte *)(iVar5_rec + 20)
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 20)
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch
|
- *(undefined1 *)(iVar5_rec + 20)
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_20_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->attack_pitch
|
- &*(char *)(iVar5_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->attack_pitch
|
- &iVar5_rec[20]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->attack_pitch
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_20_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch = (byte)E;
|
- *(char *)(iVar5_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch = (byte)E;
|
- iVar5_rec[20] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->attack_pitch = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_20_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 20)
+ (char)((uw_mobile_object_t *)iVar5_rec)->attack_pitch
|
- *(char *)(iVar5_rec + 20)
+ (char)((uw_mobile_object_t *)iVar5_rec)->attack_pitch
|
- iVar5_rec[20]
+ (char)((uw_mobile_object_t *)iVar5_rec)->attack_pitch
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_21_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 21)
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags
|
- *(byte *)(iVar5_rec + 21)
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 21)
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags
|
- *(undefined1 *)(iVar5_rec + 21)
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_21_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->animation_flags
|
- &*(char *)(iVar5_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->animation_flags
|
- &iVar5_rec[21]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->animation_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_21_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags = (byte)E;
|
- *(char *)(iVar5_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags = (byte)E;
|
- iVar5_rec[21] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->animation_flags = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_21_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 21)
+ (char)((uw_mobile_object_t *)iVar5_rec)->animation_flags
|
- *(char *)(iVar5_rec + 21)
+ (char)((uw_mobile_object_t *)iVar5_rec)->animation_flags
|
- iVar5_rec[21]
+ (char)((uw_mobile_object_t *)iVar5_rec)->animation_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_22_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low
|
- *(byte *)(iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low
|
- *(undefined1 *)(iVar5_rec + 22)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_22_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->tile_word_low
|
- &*(char *)(iVar5_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->tile_word_low
|
- &iVar5_rec[22]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->tile_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_22_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low = (byte)E;
|
- *(char *)(iVar5_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low = (byte)E;
|
- iVar5_rec[22] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_low = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_22_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 22)
+ (char)((uw_mobile_object_t *)iVar5_rec)->tile_word_low
|
- *(char *)(iVar5_rec + 22)
+ (char)((uw_mobile_object_t *)iVar5_rec)->tile_word_low
|
- iVar5_rec[22]
+ (char)((uw_mobile_object_t *)iVar5_rec)->tile_word_low
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_23_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 23)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high
|
- *(byte *)(iVar5_rec + 23)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 23)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high
|
- *(undefined1 *)(iVar5_rec + 23)
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_23_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->tile_word_high
|
- &*(char *)(iVar5_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->tile_word_high
|
- &iVar5_rec[23]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->tile_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_23_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high = (byte)E;
|
- *(char *)(iVar5_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high = (byte)E;
|
- iVar5_rec[23] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->tile_word_high = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_23_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 23)
+ (char)((uw_mobile_object_t *)iVar5_rec)->tile_word_high
|
- *(char *)(iVar5_rec + 23)
+ (char)((uw_mobile_object_t *)iVar5_rec)->tile_word_high
|
- iVar5_rec[23]
+ (char)((uw_mobile_object_t *)iVar5_rec)->tile_word_high
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_24_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 24)
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags
|
- *(byte *)(iVar5_rec + 24)
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 24)
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags
|
- *(undefined1 *)(iVar5_rec + 24)
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_24_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->heading_flags
|
- &*(char *)(iVar5_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->heading_flags
|
- &iVar5_rec[24]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->heading_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_24_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags = (byte)E;
|
- *(char *)(iVar5_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags = (byte)E;
|
- iVar5_rec[24] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->heading_flags = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_24_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 24)
+ (char)((uw_mobile_object_t *)iVar5_rec)->heading_flags
|
- *(char *)(iVar5_rec + 24)
+ (char)((uw_mobile_object_t *)iVar5_rec)->heading_flags
|
- iVar5_rec[24]
+ (char)((uw_mobile_object_t *)iVar5_rec)->heading_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_25_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 25)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
|
- *(byte *)(iVar5_rec + 25)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 25)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
|
- *(undefined1 *)(iVar5_rec + 25)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_25_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
|
- &*(char *)(iVar5_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
|
- &iVar5_rec[25]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_25_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar5_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags = (byte)E;
|
- iVar5_rec[25] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_25_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 25)
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
|
- *(char *)(iVar5_rec + 25)
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
|
- iVar5_rec[25]
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_ai_flags
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_26_byte@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5_rec + 26)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami
|
- *(byte *)(iVar5_rec + 26)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5_rec + 26)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami
|
- *(undefined1 *)(iVar5_rec + 26)
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_26_char_address@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_whoami
|
- &*(char *)(iVar5_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_whoami
|
- &iVar5_rec[26]
+ (char *)&((uw_mobile_object_t *)iVar5_rec)->npc_whoami
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_26_char_store@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami = (byte)E;
|
- *(char *)(iVar5_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami = (byte)E;
|
- iVar5_rec[26] = E;
+ ((uw_mobile_object_t *)iVar5_rec)->npc_whoami = (byte)E;
)
...>
}

@npc_combat_approach_tick_iVar5_rec_byte_26_char@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar5_rec + 26)
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_whoami
|
- *(char *)(iVar5_rec + 26)
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_whoami
|
- iVar5_rec[26]
+ (char)((uw_mobile_object_t *)iVar5_rec)->npc_whoami
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_0_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(ushort *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(ushort *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_0_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(undefined2 *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(undefined2 *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_0_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_signed
|
- *(short *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_signed
|
- *(short *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_2_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
|
- *(ushort *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_2_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
|
- *(undefined2 *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_2_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_signed
|
- *(short *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_4_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
|
- *(ushort *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_4_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
|
- *(undefined2 *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_4_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_signed
|
- *(short *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_6_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
|
- *(ushort *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_6_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
|
- *(undefined2 *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_6_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_signed
|
- *(short *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_11_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
|
- *(ushort *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_11_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
|
- *(undefined2 *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_11_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_signed
|
- *(short *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_13_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
|
- *(ushort *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_13_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
|
- *(undefined2 *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_13_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_signed
|
- *(short *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_15_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
|
- *(ushort *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_15_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
|
- *(undefined2 *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_15_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_signed
|
- *(short *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_22_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
|
- *(ushort *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_22_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
|
- *(undefined2 *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_word_22_short@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_signed
|
- *(short *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_signed
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_0_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(byte *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(byte *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(undefined1 *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(undefined1 *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_0_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- &*(char *)(iVar6_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- &*(char *)iVar6_rec
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- &iVar6_rec[0]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_0_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar6_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar6_rec = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
|
- iVar6_rec[0] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_0_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 0)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(char *)(iVar6_rec + 0)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(char *)iVar6_rec
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- iVar6_rec[0]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_1_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- *(byte *)(iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- *(undefined1 *)(iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_1_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- &*(char *)(iVar6_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- &iVar6_rec[1]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_1_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar6_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high = (byte)E;
|
- iVar6_rec[1] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_1_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 1)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- *(char *)(iVar6_rec + 1)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- iVar6_rec[1]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_2_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- *(byte *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- *(undefined1 *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_2_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- &*(char *)(iVar6_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- &iVar6_rec[2]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_2_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low = (byte)E;
|
- iVar6_rec[2] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_2_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 2)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- *(char *)(iVar6_rec + 2)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- iVar6_rec[2]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_3_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- *(byte *)(iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- *(undefined1 *)(iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_3_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- &*(char *)(iVar6_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- &iVar6_rec[3]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_3_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high = (byte)E;
|
- iVar6_rec[3] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_3_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 3)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- *(char *)(iVar6_rec + 3)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- iVar6_rec[3]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_4_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- *(byte *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- *(undefined1 *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_4_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- &*(char *)(iVar6_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- &iVar6_rec[4]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_4_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low = (byte)E;
|
- iVar6_rec[4] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_4_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 4)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- *(char *)(iVar6_rec + 4)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- iVar6_rec[4]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_5_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- *(byte *)(iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- *(undefined1 *)(iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_5_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- &*(char *)(iVar6_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- &iVar6_rec[5]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_5_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high = (byte)E;
|
- iVar6_rec[5] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_5_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 5)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- *(char *)(iVar6_rec + 5)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- iVar6_rec[5]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_6_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- *(byte *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- *(undefined1 *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_6_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- &*(char *)(iVar6_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- &iVar6_rec[6]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_6_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low = (byte)E;
|
- iVar6_rec[6] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_6_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 6)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- *(char *)(iVar6_rec + 6)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- iVar6_rec[6]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_7_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- *(byte *)(iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- *(undefined1 *)(iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_7_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- &*(char *)(iVar6_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- &iVar6_rec[7]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_7_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high = (byte)E;
|
- iVar6_rec[7] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_7_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 7)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- *(char *)(iVar6_rec + 7)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- iVar6_rec[7]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_8_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- *(byte *)(iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- *(undefined1 *)(iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_8_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- &*(char *)(iVar6_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- &iVar6_rec[8]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_8_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp = (byte)E;
|
- *(char *)(iVar6_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp = (byte)E;
|
- iVar6_rec[8] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_8_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 8)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- *(char *)(iVar6_rec + 8)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- iVar6_rec[8]
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_9_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- *(byte *)(iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- *(undefined1 *)(iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_9_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- &*(char *)(iVar6_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- &iVar6_rec[9]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_9_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading = (byte)E;
|
- *(char *)(iVar6_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading = (byte)E;
|
- iVar6_rec[9] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_9_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 9)
+ (char)((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- *(char *)(iVar6_rec + 9)
+ (char)((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- iVar6_rec[9]
+ (char)((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_10_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- *(byte *)(iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- *(undefined1 *)(iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_10_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- &*(char *)(iVar6_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- &iVar6_rec[10]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_10_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags = (byte)E;
|
- *(char *)(iVar6_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags = (byte)E;
|
- iVar6_rec[10] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_10_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 10)
+ (char)((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- *(char *)(iVar6_rec + 10)
+ (char)((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- iVar6_rec[10]
+ (char)((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_11_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- *(byte *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- *(undefined1 *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_11_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- &*(char *)(iVar6_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- &iVar6_rec[11]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_11_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)E;
|
- iVar6_rec[11] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_11_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 11)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- *(char *)(iVar6_rec + 11)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- iVar6_rec[11]
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_12_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- *(byte *)(iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- *(undefined1 *)(iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_12_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- &*(char *)(iVar6_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- &iVar6_rec[12]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_12_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high = (byte)E;
|
- iVar6_rec[12] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_12_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 12)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- *(char *)(iVar6_rec + 12)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- iVar6_rec[12]
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_13_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- *(byte *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- *(undefined1 *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_13_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- &*(char *)(iVar6_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- &iVar6_rec[13]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_13_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low = (byte)E;
|
- iVar6_rec[13] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_13_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 13)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- *(char *)(iVar6_rec + 13)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- iVar6_rec[13]
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_14_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- *(byte *)(iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- *(undefined1 *)(iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_14_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- &*(char *)(iVar6_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- &iVar6_rec[14]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_14_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high = (byte)E;
|
- iVar6_rec[14] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_14_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 14)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- *(char *)(iVar6_rec + 14)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- iVar6_rec[14]
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_15_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- *(byte *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- *(undefined1 *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_15_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- &*(char *)(iVar6_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- &iVar6_rec[15]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_15_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low = (byte)E;
|
- iVar6_rec[15] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_15_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 15)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- *(char *)(iVar6_rec + 15)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- iVar6_rec[15]
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_16_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- *(byte *)(iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- *(undefined1 *)(iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_16_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- &*(char *)(iVar6_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- &iVar6_rec[16]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_16_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high = (byte)E;
|
- iVar6_rec[16] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_16_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 16)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- *(char *)(iVar6_rec + 16)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- iVar6_rec[16]
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_17_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- *(byte *)(iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- *(undefined1 *)(iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_17_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- &*(char *)(iVar6_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- &iVar6_rec[17]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_17_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage = (byte)E;
|
- *(char *)(iVar6_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage = (byte)E;
|
- iVar6_rec[17] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_17_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 17)
+ (char)((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- *(char *)(iVar6_rec + 17)
+ (char)((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- iVar6_rec[17]
+ (char)((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_18_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- *(byte *)(iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- *(undefined1 *)(iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_18_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- &*(char *)(iVar6_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- &iVar6_rec[18]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_18_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source = (byte)E;
|
- *(char *)(iVar6_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source = (byte)E;
|
- iVar6_rec[18] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_18_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 18)
+ (char)((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- *(char *)(iVar6_rec + 18)
+ (char)((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- iVar6_rec[18]
+ (char)((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_19_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- *(byte *)(iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- *(undefined1 *)(iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_19_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- &*(char *)(iVar6_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- &iVar6_rec[19]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_19_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (byte)E;
|
- *(char *)(iVar6_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (byte)E;
|
- iVar6_rec[19] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_19_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 19)
+ (char)((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- *(char *)(iVar6_rec + 19)
+ (char)((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- iVar6_rec[19]
+ (char)((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_20_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- *(byte *)(iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- *(undefined1 *)(iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_20_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- &*(char *)(iVar6_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- &iVar6_rec[20]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_20_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch = (byte)E;
|
- *(char *)(iVar6_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch = (byte)E;
|
- iVar6_rec[20] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_20_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 20)
+ (char)((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- *(char *)(iVar6_rec + 20)
+ (char)((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- iVar6_rec[20]
+ (char)((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_21_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- *(byte *)(iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- *(undefined1 *)(iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_21_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- &*(char *)(iVar6_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- &iVar6_rec[21]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_21_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags = (byte)E;
|
- *(char *)(iVar6_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags = (byte)E;
|
- iVar6_rec[21] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_21_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 21)
+ (char)((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- *(char *)(iVar6_rec + 21)
+ (char)((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- iVar6_rec[21]
+ (char)((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_22_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- *(byte *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- *(undefined1 *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_22_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- &*(char *)(iVar6_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- &iVar6_rec[22]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_22_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low = (byte)E;
|
- iVar6_rec[22] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_22_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 22)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- *(char *)(iVar6_rec + 22)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- iVar6_rec[22]
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_23_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- *(byte *)(iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- *(undefined1 *)(iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_23_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- &*(char *)(iVar6_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- &iVar6_rec[23]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_23_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high = (byte)E;
|
- iVar6_rec[23] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_23_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 23)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- *(char *)(iVar6_rec + 23)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- iVar6_rec[23]
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_24_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- *(byte *)(iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- *(undefined1 *)(iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_24_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- &*(char *)(iVar6_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- &iVar6_rec[24]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_24_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags = (byte)E;
|
- *(char *)(iVar6_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags = (byte)E;
|
- iVar6_rec[24] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_24_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 24)
+ (char)((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- *(char *)(iVar6_rec + 24)
+ (char)((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- iVar6_rec[24]
+ (char)((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_25_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- *(byte *)(iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- *(undefined1 *)(iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_25_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- &*(char *)(iVar6_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- &iVar6_rec[25]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_25_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar6_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags = (byte)E;
|
- iVar6_rec[25] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_25_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 25)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- *(char *)(iVar6_rec + 25)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- iVar6_rec[25]
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_26_byte@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- *(byte *)(iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- *(undefined1 *)(iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_26_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- &*(char *)(iVar6_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- &iVar6_rec[26]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_26_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami = (byte)E;
|
- *(char *)(iVar6_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami = (byte)E;
|
- iVar6_rec[26] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami = (byte)E;
)
...>
}

@npc_combat_engage_close_tick_iVar6_rec_byte_26_char@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 26)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- *(char *)(iVar6_rec + 26)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- iVar6_rec[26]
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_0_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(ushort *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(ushort *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_0_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(undefined2 *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
|
- *(undefined2 *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_0_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_signed
|
- *(short *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_signed
|
- *(short *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_2_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
|
- *(ushort *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_2_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
|
- *(undefined2 *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_2_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_signed
|
- *(short *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_4_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
|
- *(ushort *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_4_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
|
- *(undefined2 *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_4_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_signed
|
- *(short *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_6_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
|
- *(ushort *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_6_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
|
- *(undefined2 *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_6_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_signed
|
- *(short *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_11_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
|
- *(ushort *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_11_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
|
- *(undefined2 *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_11_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_signed
|
- *(short *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_13_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
|
- *(ushort *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_13_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
|
- *(undefined2 *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_13_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_signed
|
- *(short *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_15_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
|
- *(ushort *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_15_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
|
- *(undefined2 *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_15_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_signed
|
- *(short *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_22_ushort@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
|
- *(ushort *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_22_undefined2@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
|
- *(undefined2 *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word
)
...>
}

@npc_combat_set_stance_iVar6_rec_word_22_short@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_signed
|
- *(short *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_signed
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_0_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(byte *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(byte *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(undefined1 *)(iVar6_rec + 0)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(undefined1 *)iVar6_rec
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_0_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- &*(char *)(iVar6_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- &*(char *)iVar6_rec
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- &iVar6_rec[0]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_0_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar6_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar6_rec = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
|
- iVar6_rec[0] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_0_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 0)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(char *)(iVar6_rec + 0)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- *(char *)iVar6_rec
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
|
- iVar6_rec[0]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_1_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- *(byte *)(iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- *(undefined1 *)(iVar6_rec + 1)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_1_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- &*(char *)(iVar6_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- &iVar6_rec[1]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_1_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar6_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high = (byte)E;
|
- iVar6_rec[1] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_1_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 1)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- *(char *)(iVar6_rec + 1)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
|
- iVar6_rec[1]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_2_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- *(byte *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- *(undefined1 *)(iVar6_rec + 2)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_2_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- &*(char *)(iVar6_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- &iVar6_rec[2]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_2_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low = (byte)E;
|
- iVar6_rec[2] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_2_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 2)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- *(char *)(iVar6_rec + 2)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
|
- iVar6_rec[2]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_3_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- *(byte *)(iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- *(undefined1 *)(iVar6_rec + 3)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_3_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- &*(char *)(iVar6_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- &iVar6_rec[3]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_3_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high = (byte)E;
|
- iVar6_rec[3] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_3_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 3)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- *(char *)(iVar6_rec + 3)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
|
- iVar6_rec[3]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.position_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_4_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- *(byte *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- *(undefined1 *)(iVar6_rec + 4)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_4_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- &*(char *)(iVar6_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- &iVar6_rec[4]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_4_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low = (byte)E;
|
- iVar6_rec[4] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_4_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 4)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- *(char *)(iVar6_rec + 4)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
|
- iVar6_rec[4]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_5_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- *(byte *)(iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- *(undefined1 *)(iVar6_rec + 5)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_5_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- &*(char *)(iVar6_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- &iVar6_rec[5]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_5_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high = (byte)E;
|
- iVar6_rec[5] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_5_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 5)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- *(char *)(iVar6_rec + 5)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
|
- iVar6_rec[5]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_6_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- *(byte *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- *(undefined1 *)(iVar6_rec + 6)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_6_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- &*(char *)(iVar6_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- &iVar6_rec[6]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_6_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low = (byte)E;
|
- iVar6_rec[6] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_6_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 6)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- *(char *)(iVar6_rec + 6)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
|
- iVar6_rec[6]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_7_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- *(byte *)(iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- *(undefined1 *)(iVar6_rec + 7)
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_7_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- &*(char *)(iVar6_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- &iVar6_rec[7]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_7_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high = (byte)E;
|
- iVar6_rec[7] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_7_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 7)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- *(char *)(iVar6_rec + 7)
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
|
- iVar6_rec[7]
+ (char)((uw_mobile_object_t *)iVar6_rec)->hdr.link_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_8_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- *(byte *)(iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- *(undefined1 *)(iVar6_rec + 8)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_8_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- &*(char *)(iVar6_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- &iVar6_rec[8]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_8_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp = (byte)E;
|
- *(char *)(iVar6_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp = (byte)E;
|
- iVar6_rec[8] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_hp = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_8_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 8)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- *(char *)(iVar6_rec + 8)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_hp
|
- iVar6_rec[8]
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_hp
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_9_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- *(byte *)(iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- *(undefined1 *)(iVar6_rec + 9)
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_9_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- &*(char *)(iVar6_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- &iVar6_rec[9]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_9_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading = (byte)E;
|
- *(char *)(iVar6_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading = (byte)E;
|
- iVar6_rec[9] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->full_heading = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_9_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 9)
+ (char)((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- *(char *)(iVar6_rec + 9)
+ (char)((uw_mobile_object_t *)iVar6_rec)->full_heading
|
- iVar6_rec[9]
+ (char)((uw_mobile_object_t *)iVar6_rec)->full_heading
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_10_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- *(byte *)(iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- *(undefined1 *)(iVar6_rec + 10)
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_10_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- &*(char *)(iVar6_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- &iVar6_rec[10]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_10_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags = (byte)E;
|
- *(char *)(iVar6_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags = (byte)E;
|
- iVar6_rec[10] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->movement_flags = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_10_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 10)
+ (char)((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- *(char *)(iVar6_rec + 10)
+ (char)((uw_mobile_object_t *)iVar6_rec)->movement_flags
|
- iVar6_rec[10]
+ (char)((uw_mobile_object_t *)iVar6_rec)->movement_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_11_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- *(byte *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- *(undefined1 *)(iVar6_rec + 11)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_11_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- &*(char *)(iVar6_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- &iVar6_rec[11]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_11_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)E;
|
- iVar6_rec[11] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_11_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 11)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- *(char *)(iVar6_rec + 11)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_low
|
- iVar6_rec[11]
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_12_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- *(byte *)(iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- *(undefined1 *)(iVar6_rec + 12)
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_12_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- &*(char *)(iVar6_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- &iVar6_rec[12]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_12_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high = (byte)E;
|
- iVar6_rec[12] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->goal_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_12_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 12)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- *(char *)(iVar6_rec + 12)
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_high
|
- iVar6_rec[12]
+ (char)((uw_mobile_object_t *)iVar6_rec)->goal_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_13_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- *(byte *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- *(undefined1 *)(iVar6_rec + 13)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_13_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- &*(char *)(iVar6_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- &iVar6_rec[13]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_13_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low = (byte)E;
|
- iVar6_rec[13] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_13_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 13)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- *(char *)(iVar6_rec + 13)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_low
|
- iVar6_rec[13]
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_14_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- *(byte *)(iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- *(undefined1 *)(iVar6_rec + 14)
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_14_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- &*(char *)(iVar6_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- &iVar6_rec[14]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_14_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high = (byte)E;
|
- iVar6_rec[14] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->status_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_14_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 14)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- *(char *)(iVar6_rec + 14)
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_high
|
- iVar6_rec[14]
+ (char)((uw_mobile_object_t *)iVar6_rec)->status_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_15_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- *(byte *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- *(undefined1 *)(iVar6_rec + 15)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_15_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- &*(char *)(iVar6_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- &iVar6_rec[15]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_15_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low = (byte)E;
|
- iVar6_rec[15] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_15_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 15)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- *(char *)(iVar6_rec + 15)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_low
|
- iVar6_rec[15]
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_16_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- *(byte *)(iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- *(undefined1 *)(iVar6_rec + 16)
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_16_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- &*(char *)(iVar6_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- &iVar6_rec[16]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_16_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high = (byte)E;
|
- iVar6_rec[16] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->target_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_16_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 16)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- *(char *)(iVar6_rec + 16)
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_high
|
- iVar6_rec[16]
+ (char)((uw_mobile_object_t *)iVar6_rec)->target_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_17_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- *(byte *)(iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- *(undefined1 *)(iVar6_rec + 17)
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_17_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- &*(char *)(iVar6_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- &iVar6_rec[17]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_17_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage = (byte)E;
|
- *(char *)(iVar6_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage = (byte)E;
|
- iVar6_rec[17] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->recent_damage = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_17_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 17)
+ (char)((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- *(char *)(iVar6_rec + 17)
+ (char)((uw_mobile_object_t *)iVar6_rec)->recent_damage
|
- iVar6_rec[17]
+ (char)((uw_mobile_object_t *)iVar6_rec)->recent_damage
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_18_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- *(byte *)(iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- *(undefined1 *)(iVar6_rec + 18)
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_18_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- &*(char *)(iVar6_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- &iVar6_rec[18]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_18_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source = (byte)E;
|
- *(char *)(iVar6_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source = (byte)E;
|
- iVar6_rec[18] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->damage_source = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_18_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 18)
+ (char)((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- *(char *)(iVar6_rec + 18)
+ (char)((uw_mobile_object_t *)iVar6_rec)->damage_source
|
- iVar6_rec[18]
+ (char)((uw_mobile_object_t *)iVar6_rec)->damage_source
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_19_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- *(byte *)(iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- *(undefined1 *)(iVar6_rec + 19)
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_19_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- &*(char *)(iVar6_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- &iVar6_rec[19]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_19_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (byte)E;
|
- *(char *)(iVar6_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (byte)E;
|
- iVar6_rec[19] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_19_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 19)
+ (char)((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- *(char *)(iVar6_rec + 19)
+ (char)((uw_mobile_object_t *)iVar6_rec)->motion_flags
|
- iVar6_rec[19]
+ (char)((uw_mobile_object_t *)iVar6_rec)->motion_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_20_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- *(byte *)(iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- *(undefined1 *)(iVar6_rec + 20)
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_20_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- &*(char *)(iVar6_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- &iVar6_rec[20]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_20_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch = (byte)E;
|
- *(char *)(iVar6_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch = (byte)E;
|
- iVar6_rec[20] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->attack_pitch = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_20_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 20)
+ (char)((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- *(char *)(iVar6_rec + 20)
+ (char)((uw_mobile_object_t *)iVar6_rec)->attack_pitch
|
- iVar6_rec[20]
+ (char)((uw_mobile_object_t *)iVar6_rec)->attack_pitch
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_21_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- *(byte *)(iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- *(undefined1 *)(iVar6_rec + 21)
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_21_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- &*(char *)(iVar6_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- &iVar6_rec[21]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_21_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags = (byte)E;
|
- *(char *)(iVar6_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags = (byte)E;
|
- iVar6_rec[21] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->animation_flags = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_21_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 21)
+ (char)((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- *(char *)(iVar6_rec + 21)
+ (char)((uw_mobile_object_t *)iVar6_rec)->animation_flags
|
- iVar6_rec[21]
+ (char)((uw_mobile_object_t *)iVar6_rec)->animation_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_22_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- *(byte *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- *(undefined1 *)(iVar6_rec + 22)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_22_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- &*(char *)(iVar6_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- &iVar6_rec[22]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_22_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low = (byte)E;
|
- *(char *)(iVar6_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low = (byte)E;
|
- iVar6_rec[22] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_low = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_22_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 22)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- *(char *)(iVar6_rec + 22)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_low
|
- iVar6_rec[22]
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_low
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_23_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- *(byte *)(iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- *(undefined1 *)(iVar6_rec + 23)
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_23_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- &*(char *)(iVar6_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- &iVar6_rec[23]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_23_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high = (byte)E;
|
- *(char *)(iVar6_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high = (byte)E;
|
- iVar6_rec[23] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->tile_word_high = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_23_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 23)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- *(char *)(iVar6_rec + 23)
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_high
|
- iVar6_rec[23]
+ (char)((uw_mobile_object_t *)iVar6_rec)->tile_word_high
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_24_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- *(byte *)(iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- *(undefined1 *)(iVar6_rec + 24)
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_24_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- &*(char *)(iVar6_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- &iVar6_rec[24]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_24_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags = (byte)E;
|
- *(char *)(iVar6_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags = (byte)E;
|
- iVar6_rec[24] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->heading_flags = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_24_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 24)
+ (char)((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- *(char *)(iVar6_rec + 24)
+ (char)((uw_mobile_object_t *)iVar6_rec)->heading_flags
|
- iVar6_rec[24]
+ (char)((uw_mobile_object_t *)iVar6_rec)->heading_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_25_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- *(byte *)(iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- *(undefined1 *)(iVar6_rec + 25)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_25_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- &*(char *)(iVar6_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- &iVar6_rec[25]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_25_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar6_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags = (byte)E;
|
- iVar6_rec[25] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_25_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 25)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- *(char *)(iVar6_rec + 25)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
|
- iVar6_rec[25]
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_ai_flags
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_26_byte@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- *(byte *)(iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- *(undefined1 *)(iVar6_rec + 26)
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_26_char_address@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar6_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- &*(char *)(iVar6_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- &iVar6_rec[26]
+ (char *)&((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_26_char_store@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami = (byte)E;
|
- *(char *)(iVar6_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami = (byte)E;
|
- iVar6_rec[26] = E;
+ ((uw_mobile_object_t *)iVar6_rec)->npc_whoami = (byte)E;
)
...>
}

@npc_combat_set_stance_iVar6_rec_byte_26_char@
type R;
identifier F =~ "^\(npc_combat_set_stance\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar6_rec + 26)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- *(char *)(iVar6_rec + 26)
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_whoami
|
- iVar6_rec[26]
+ (char)((uw_mobile_object_t *)iVar6_rec)->npc_whoami
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_0_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags
|
- *(ushort *)(iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags
|
- *(ushort *)iVar2_rec
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_0_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags
|
- *(undefined2 *)(iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags
|
- *(undefined2 *)iVar2_rec
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_0_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_signed
|
- *(short *)(iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_signed
|
- *(short *)iVar2_rec
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_2_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word
|
- *(ushort *)(iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_2_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word
|
- *(undefined2 *)(iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_2_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_signed
|
- *(short *)(iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_4_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word
|
- *(ushort *)(iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_4_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word
|
- *(undefined2 *)(iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_4_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_signed
|
- *(short *)(iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_6_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word
|
- *(ushort *)(iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_6_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word
|
- *(undefined2 *)(iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_6_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_signed
|
- *(short *)(iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_11_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word
|
- *(ushort *)(iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_11_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word
|
- *(undefined2 *)(iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_11_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_signed
|
- *(short *)(iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_13_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word
|
- *(ushort *)(iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_13_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word
|
- *(undefined2 *)(iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_13_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_signed
|
- *(short *)(iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_15_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word
|
- *(ushort *)(iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_15_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word
|
- *(undefined2 *)(iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_15_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_signed
|
- *(short *)(iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_22_ushort@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word
|
- *(ushort *)(iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_22_undefined2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word
|
- *(undefined2 *)(iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_word_22_short@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_signed
|
- *(short *)(iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_signed
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_0_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- *(byte *)(iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- *(byte *)iVar2_rec
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- *(undefined1 *)(iVar2_rec + 0)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- *(undefined1 *)iVar2_rec
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_0_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- &*(char *)(iVar2_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- &*(char *)iVar2_rec
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- &iVar2_rec[0]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_0_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar2_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar2_rec = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low = (byte)E;
|
- iVar2_rec[0] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_0_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 0)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- *(char *)(iVar2_rec + 0)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- *(char *)iVar2_rec
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
|
- iVar2_rec[0]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_1_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 1)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
|
- *(byte *)(iVar2_rec + 1)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 1)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
|
- *(undefined1 *)(iVar2_rec + 1)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_1_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
|
- &*(char *)(iVar2_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
|
- &iVar2_rec[1]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_1_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar2_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high = (byte)E;
|
- iVar2_rec[1] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_1_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 1)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
|
- *(char *)(iVar2_rec + 1)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
|
- iVar2_rec[1]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_2_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
|
- *(byte *)(iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
|
- *(undefined1 *)(iVar2_rec + 2)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_2_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
|
- &*(char *)(iVar2_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
|
- &iVar2_rec[2]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_2_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low = (byte)E;
|
- iVar2_rec[2] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_2_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 2)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
|
- *(char *)(iVar2_rec + 2)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
|
- iVar2_rec[2]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_3_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 3)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
|
- *(byte *)(iVar2_rec + 3)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 3)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
|
- *(undefined1 *)(iVar2_rec + 3)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_3_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
|
- &*(char *)(iVar2_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
|
- &iVar2_rec[3]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_3_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high = (byte)E;
|
- iVar2_rec[3] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_3_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 3)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
|
- *(char *)(iVar2_rec + 3)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
|
- iVar2_rec[3]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.position_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_4_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
|
- *(byte *)(iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
|
- *(undefined1 *)(iVar2_rec + 4)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_4_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
|
- &*(char *)(iVar2_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
|
- &iVar2_rec[4]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_4_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low = (byte)E;
|
- iVar2_rec[4] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_4_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 4)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
|
- *(char *)(iVar2_rec + 4)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
|
- iVar2_rec[4]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_5_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 5)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
|
- *(byte *)(iVar2_rec + 5)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 5)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
|
- *(undefined1 *)(iVar2_rec + 5)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_5_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
|
- &*(char *)(iVar2_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
|
- &iVar2_rec[5]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_5_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high = (byte)E;
|
- iVar2_rec[5] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_5_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 5)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
|
- *(char *)(iVar2_rec + 5)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
|
- iVar2_rec[5]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_6_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
|
- *(byte *)(iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
|
- *(undefined1 *)(iVar2_rec + 6)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_6_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
|
- &*(char *)(iVar2_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
|
- &iVar2_rec[6]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_6_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low = (byte)E;
|
- iVar2_rec[6] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_6_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 6)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
|
- *(char *)(iVar2_rec + 6)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
|
- iVar2_rec[6]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_7_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 7)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
|
- *(byte *)(iVar2_rec + 7)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 7)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
|
- *(undefined1 *)(iVar2_rec + 7)
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_7_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
|
- &*(char *)(iVar2_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
|
- &iVar2_rec[7]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_7_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high = (byte)E;
|
- iVar2_rec[7] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_7_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 7)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
|
- *(char *)(iVar2_rec + 7)
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
|
- iVar2_rec[7]
+ (char)((uw_mobile_object_t *)iVar2_rec)->hdr.link_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_8_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 8)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp
|
- *(byte *)(iVar2_rec + 8)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 8)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp
|
- *(undefined1 *)(iVar2_rec + 8)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_8_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_hp
|
- &*(char *)(iVar2_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_hp
|
- &iVar2_rec[8]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_hp
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_8_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp = (byte)E;
|
- *(char *)(iVar2_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp = (byte)E;
|
- iVar2_rec[8] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_hp = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_8_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 8)
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_hp
|
- *(char *)(iVar2_rec + 8)
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_hp
|
- iVar2_rec[8]
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_hp
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_9_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 9)
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading
|
- *(byte *)(iVar2_rec + 9)
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 9)
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading
|
- *(undefined1 *)(iVar2_rec + 9)
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_9_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->full_heading
|
- &*(char *)(iVar2_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->full_heading
|
- &iVar2_rec[9]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->full_heading
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_9_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading = (byte)E;
|
- *(char *)(iVar2_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading = (byte)E;
|
- iVar2_rec[9] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->full_heading = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_9_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 9)
+ (char)((uw_mobile_object_t *)iVar2_rec)->full_heading
|
- *(char *)(iVar2_rec + 9)
+ (char)((uw_mobile_object_t *)iVar2_rec)->full_heading
|
- iVar2_rec[9]
+ (char)((uw_mobile_object_t *)iVar2_rec)->full_heading
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_10_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 10)
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags
|
- *(byte *)(iVar2_rec + 10)
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 10)
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags
|
- *(undefined1 *)(iVar2_rec + 10)
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_10_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->movement_flags
|
- &*(char *)(iVar2_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->movement_flags
|
- &iVar2_rec[10]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->movement_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_10_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags = (byte)E;
|
- *(char *)(iVar2_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags = (byte)E;
|
- iVar2_rec[10] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->movement_flags = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_10_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 10)
+ (char)((uw_mobile_object_t *)iVar2_rec)->movement_flags
|
- *(char *)(iVar2_rec + 10)
+ (char)((uw_mobile_object_t *)iVar2_rec)->movement_flags
|
- iVar2_rec[10]
+ (char)((uw_mobile_object_t *)iVar2_rec)->movement_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_11_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low
|
- *(byte *)(iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low
|
- *(undefined1 *)(iVar2_rec + 11)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_11_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->goal_word_low
|
- &*(char *)(iVar2_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->goal_word_low
|
- &iVar2_rec[11]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->goal_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_11_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low = (byte)E;
|
- iVar2_rec[11] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_11_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 11)
+ (char)((uw_mobile_object_t *)iVar2_rec)->goal_word_low
|
- *(char *)(iVar2_rec + 11)
+ (char)((uw_mobile_object_t *)iVar2_rec)->goal_word_low
|
- iVar2_rec[11]
+ (char)((uw_mobile_object_t *)iVar2_rec)->goal_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_12_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 12)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high
|
- *(byte *)(iVar2_rec + 12)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 12)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high
|
- *(undefined1 *)(iVar2_rec + 12)
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_12_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->goal_word_high
|
- &*(char *)(iVar2_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->goal_word_high
|
- &iVar2_rec[12]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->goal_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_12_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high = (byte)E;
|
- iVar2_rec[12] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->goal_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_12_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 12)
+ (char)((uw_mobile_object_t *)iVar2_rec)->goal_word_high
|
- *(char *)(iVar2_rec + 12)
+ (char)((uw_mobile_object_t *)iVar2_rec)->goal_word_high
|
- iVar2_rec[12]
+ (char)((uw_mobile_object_t *)iVar2_rec)->goal_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_13_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low
|
- *(byte *)(iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low
|
- *(undefined1 *)(iVar2_rec + 13)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_13_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->status_word_low
|
- &*(char *)(iVar2_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->status_word_low
|
- &iVar2_rec[13]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->status_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_13_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low = (byte)E;
|
- iVar2_rec[13] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_13_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 13)
+ (char)((uw_mobile_object_t *)iVar2_rec)->status_word_low
|
- *(char *)(iVar2_rec + 13)
+ (char)((uw_mobile_object_t *)iVar2_rec)->status_word_low
|
- iVar2_rec[13]
+ (char)((uw_mobile_object_t *)iVar2_rec)->status_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_14_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 14)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high
|
- *(byte *)(iVar2_rec + 14)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 14)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high
|
- *(undefined1 *)(iVar2_rec + 14)
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_14_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->status_word_high
|
- &*(char *)(iVar2_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->status_word_high
|
- &iVar2_rec[14]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->status_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_14_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high = (byte)E;
|
- iVar2_rec[14] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->status_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_14_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 14)
+ (char)((uw_mobile_object_t *)iVar2_rec)->status_word_high
|
- *(char *)(iVar2_rec + 14)
+ (char)((uw_mobile_object_t *)iVar2_rec)->status_word_high
|
- iVar2_rec[14]
+ (char)((uw_mobile_object_t *)iVar2_rec)->status_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_15_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low
|
- *(byte *)(iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low
|
- *(undefined1 *)(iVar2_rec + 15)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_15_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->target_word_low
|
- &*(char *)(iVar2_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->target_word_low
|
- &iVar2_rec[15]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->target_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_15_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low = (byte)E;
|
- iVar2_rec[15] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_15_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 15)
+ (char)((uw_mobile_object_t *)iVar2_rec)->target_word_low
|
- *(char *)(iVar2_rec + 15)
+ (char)((uw_mobile_object_t *)iVar2_rec)->target_word_low
|
- iVar2_rec[15]
+ (char)((uw_mobile_object_t *)iVar2_rec)->target_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_16_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 16)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high
|
- *(byte *)(iVar2_rec + 16)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 16)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high
|
- *(undefined1 *)(iVar2_rec + 16)
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_16_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->target_word_high
|
- &*(char *)(iVar2_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->target_word_high
|
- &iVar2_rec[16]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->target_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_16_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high = (byte)E;
|
- iVar2_rec[16] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->target_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_16_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 16)
+ (char)((uw_mobile_object_t *)iVar2_rec)->target_word_high
|
- *(char *)(iVar2_rec + 16)
+ (char)((uw_mobile_object_t *)iVar2_rec)->target_word_high
|
- iVar2_rec[16]
+ (char)((uw_mobile_object_t *)iVar2_rec)->target_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_17_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 17)
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage
|
- *(byte *)(iVar2_rec + 17)
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 17)
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage
|
- *(undefined1 *)(iVar2_rec + 17)
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_17_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->recent_damage
|
- &*(char *)(iVar2_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->recent_damage
|
- &iVar2_rec[17]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->recent_damage
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_17_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage = (byte)E;
|
- *(char *)(iVar2_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage = (byte)E;
|
- iVar2_rec[17] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->recent_damage = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_17_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 17)
+ (char)((uw_mobile_object_t *)iVar2_rec)->recent_damage
|
- *(char *)(iVar2_rec + 17)
+ (char)((uw_mobile_object_t *)iVar2_rec)->recent_damage
|
- iVar2_rec[17]
+ (char)((uw_mobile_object_t *)iVar2_rec)->recent_damage
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_18_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 18)
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source
|
- *(byte *)(iVar2_rec + 18)
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 18)
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source
|
- *(undefined1 *)(iVar2_rec + 18)
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_18_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->damage_source
|
- &*(char *)(iVar2_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->damage_source
|
- &iVar2_rec[18]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->damage_source
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_18_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source = (byte)E;
|
- *(char *)(iVar2_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source = (byte)E;
|
- iVar2_rec[18] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->damage_source = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_18_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 18)
+ (char)((uw_mobile_object_t *)iVar2_rec)->damage_source
|
- *(char *)(iVar2_rec + 18)
+ (char)((uw_mobile_object_t *)iVar2_rec)->damage_source
|
- iVar2_rec[18]
+ (char)((uw_mobile_object_t *)iVar2_rec)->damage_source
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_19_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 19)
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags
|
- *(byte *)(iVar2_rec + 19)
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 19)
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags
|
- *(undefined1 *)(iVar2_rec + 19)
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_19_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->motion_flags
|
- &*(char *)(iVar2_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->motion_flags
|
- &iVar2_rec[19]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->motion_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_19_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags = (byte)E;
|
- *(char *)(iVar2_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags = (byte)E;
|
- iVar2_rec[19] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->motion_flags = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_19_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 19)
+ (char)((uw_mobile_object_t *)iVar2_rec)->motion_flags
|
- *(char *)(iVar2_rec + 19)
+ (char)((uw_mobile_object_t *)iVar2_rec)->motion_flags
|
- iVar2_rec[19]
+ (char)((uw_mobile_object_t *)iVar2_rec)->motion_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_20_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 20)
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch
|
- *(byte *)(iVar2_rec + 20)
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 20)
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch
|
- *(undefined1 *)(iVar2_rec + 20)
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_20_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->attack_pitch
|
- &*(char *)(iVar2_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->attack_pitch
|
- &iVar2_rec[20]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->attack_pitch
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_20_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch = (byte)E;
|
- *(char *)(iVar2_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch = (byte)E;
|
- iVar2_rec[20] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->attack_pitch = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_20_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 20)
+ (char)((uw_mobile_object_t *)iVar2_rec)->attack_pitch
|
- *(char *)(iVar2_rec + 20)
+ (char)((uw_mobile_object_t *)iVar2_rec)->attack_pitch
|
- iVar2_rec[20]
+ (char)((uw_mobile_object_t *)iVar2_rec)->attack_pitch
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_21_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 21)
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags
|
- *(byte *)(iVar2_rec + 21)
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 21)
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags
|
- *(undefined1 *)(iVar2_rec + 21)
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_21_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->animation_flags
|
- &*(char *)(iVar2_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->animation_flags
|
- &iVar2_rec[21]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->animation_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_21_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags = (byte)E;
|
- *(char *)(iVar2_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags = (byte)E;
|
- iVar2_rec[21] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->animation_flags = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_21_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 21)
+ (char)((uw_mobile_object_t *)iVar2_rec)->animation_flags
|
- *(char *)(iVar2_rec + 21)
+ (char)((uw_mobile_object_t *)iVar2_rec)->animation_flags
|
- iVar2_rec[21]
+ (char)((uw_mobile_object_t *)iVar2_rec)->animation_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_22_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low
|
- *(byte *)(iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low
|
- *(undefined1 *)(iVar2_rec + 22)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_22_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->tile_word_low
|
- &*(char *)(iVar2_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->tile_word_low
|
- &iVar2_rec[22]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->tile_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_22_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low = (byte)E;
|
- *(char *)(iVar2_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low = (byte)E;
|
- iVar2_rec[22] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_low = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_22_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 22)
+ (char)((uw_mobile_object_t *)iVar2_rec)->tile_word_low
|
- *(char *)(iVar2_rec + 22)
+ (char)((uw_mobile_object_t *)iVar2_rec)->tile_word_low
|
- iVar2_rec[22]
+ (char)((uw_mobile_object_t *)iVar2_rec)->tile_word_low
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_23_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 23)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high
|
- *(byte *)(iVar2_rec + 23)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 23)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high
|
- *(undefined1 *)(iVar2_rec + 23)
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_23_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->tile_word_high
|
- &*(char *)(iVar2_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->tile_word_high
|
- &iVar2_rec[23]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->tile_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_23_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high = (byte)E;
|
- *(char *)(iVar2_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high = (byte)E;
|
- iVar2_rec[23] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->tile_word_high = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_23_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 23)
+ (char)((uw_mobile_object_t *)iVar2_rec)->tile_word_high
|
- *(char *)(iVar2_rec + 23)
+ (char)((uw_mobile_object_t *)iVar2_rec)->tile_word_high
|
- iVar2_rec[23]
+ (char)((uw_mobile_object_t *)iVar2_rec)->tile_word_high
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_24_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 24)
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags
|
- *(byte *)(iVar2_rec + 24)
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 24)
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags
|
- *(undefined1 *)(iVar2_rec + 24)
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_24_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->heading_flags
|
- &*(char *)(iVar2_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->heading_flags
|
- &iVar2_rec[24]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->heading_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_24_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags = (byte)E;
|
- *(char *)(iVar2_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags = (byte)E;
|
- iVar2_rec[24] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->heading_flags = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_24_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 24)
+ (char)((uw_mobile_object_t *)iVar2_rec)->heading_flags
|
- *(char *)(iVar2_rec + 24)
+ (char)((uw_mobile_object_t *)iVar2_rec)->heading_flags
|
- iVar2_rec[24]
+ (char)((uw_mobile_object_t *)iVar2_rec)->heading_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_25_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 25)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
|
- *(byte *)(iVar2_rec + 25)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 25)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
|
- *(undefined1 *)(iVar2_rec + 25)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_25_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
|
- &*(char *)(iVar2_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
|
- &iVar2_rec[25]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_25_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar2_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags = (byte)E;
|
- iVar2_rec[25] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_25_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 25)
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
|
- *(char *)(iVar2_rec + 25)
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
|
- iVar2_rec[25]
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_ai_flags
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_26_byte@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2_rec + 26)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami
|
- *(byte *)(iVar2_rec + 26)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2_rec + 26)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami
|
- *(undefined1 *)(iVar2_rec + 26)
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_26_char_address@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_whoami
|
- &*(char *)(iVar2_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_whoami
|
- &iVar2_rec[26]
+ (char *)&((uw_mobile_object_t *)iVar2_rec)->npc_whoami
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_26_char_store@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami = (byte)E;
|
- *(char *)(iVar2_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami = (byte)E;
|
- iVar2_rec[26] = E;
+ ((uw_mobile_object_t *)iVar2_rec)->npc_whoami = (byte)E;
)
...>
}

@npc_combat_engage_wide_tick_iVar2_rec_byte_26_char@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2_rec + 26)
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_whoami
|
- *(char *)(iVar2_rec + 26)
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_whoami
|
- iVar2_rec[26]
+ (char)((uw_mobile_object_t *)iVar2_rec)->npc_whoami
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_0_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 0)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_0_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 0)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_0_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 0)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_2_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 2)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_2_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 2)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_2_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 2)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_4_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 4)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_4_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 4)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_4_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 4)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_6_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 6)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_6_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 6)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_6_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 6)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_11_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 11)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_11_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 11)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_11_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 11)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_13_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 13)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_13_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 13)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_13_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 13)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_15_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 15)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_15_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 15)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_15_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 15)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_22_ushort@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 22)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_22_undefined2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar7_rec + 22)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word
)
...>
}

@npc_combat_position_tick_iVar7_rec_word_22_short@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar7_rec + 22)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_signed
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_0_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 0)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 0)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_0_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 0)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_0_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 0) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_0_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 0)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_1_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 1)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 1)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_1_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 1)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_1_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 1) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_1_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 1)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.type_flags_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_2_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 2)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 2)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_2_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 2)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_2_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 2) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_2_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 2)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_3_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 3)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 3)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_3_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 3)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_3_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 3) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_3_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 3)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.position_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_4_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 4)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 4)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_4_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 4)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_4_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 4) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_4_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 4)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_5_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 5)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 5)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_5_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 5)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_5_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 5) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_5_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 5)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.chain_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_6_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 6)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 6)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_6_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 6)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_6_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 6) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_6_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 6)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_7_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 7)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 7)
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_7_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 7)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_7_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 7) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_7_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 7)
+ (char)((uw_mobile_object_t *)iVar7_rec)->hdr.link_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_8_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 8)
+ ((uw_mobile_object_t *)iVar7_rec)->npc_hp
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 8)
+ ((uw_mobile_object_t *)iVar7_rec)->npc_hp
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_8_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 8)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->npc_hp
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_8_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 8) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->npc_hp = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_8_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 8)
+ (char)((uw_mobile_object_t *)iVar7_rec)->npc_hp
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_9_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 9)
+ ((uw_mobile_object_t *)iVar7_rec)->full_heading
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 9)
+ ((uw_mobile_object_t *)iVar7_rec)->full_heading
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_9_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 9)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->full_heading
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_9_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 9) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->full_heading = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_9_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 9)
+ (char)((uw_mobile_object_t *)iVar7_rec)->full_heading
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_10_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 10)
+ ((uw_mobile_object_t *)iVar7_rec)->movement_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 10)
+ ((uw_mobile_object_t *)iVar7_rec)->movement_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_10_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 10)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->movement_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_10_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 10) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->movement_flags = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_10_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 10)
+ (char)((uw_mobile_object_t *)iVar7_rec)->movement_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_11_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 11)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 11)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_11_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 11)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->goal_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_11_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 11) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_11_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 11)
+ (char)((uw_mobile_object_t *)iVar7_rec)->goal_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_12_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 12)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 12)
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_12_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 12)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->goal_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_12_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 12) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->goal_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_12_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 12)
+ (char)((uw_mobile_object_t *)iVar7_rec)->goal_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_13_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 13)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 13)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_13_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 13)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->status_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_13_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 13) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_13_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 13)
+ (char)((uw_mobile_object_t *)iVar7_rec)->status_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_14_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 14)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 14)
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_14_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 14)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->status_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_14_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 14) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->status_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_14_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 14)
+ (char)((uw_mobile_object_t *)iVar7_rec)->status_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_15_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 15)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 15)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_15_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 15)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->target_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_15_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 15) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_15_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 15)
+ (char)((uw_mobile_object_t *)iVar7_rec)->target_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_16_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 16)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 16)
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_16_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 16)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->target_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_16_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 16) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->target_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_16_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 16)
+ (char)((uw_mobile_object_t *)iVar7_rec)->target_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_17_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 17)
+ ((uw_mobile_object_t *)iVar7_rec)->recent_damage
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 17)
+ ((uw_mobile_object_t *)iVar7_rec)->recent_damage
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_17_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 17)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->recent_damage
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_17_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 17) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->recent_damage = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_17_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 17)
+ (char)((uw_mobile_object_t *)iVar7_rec)->recent_damage
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_18_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 18)
+ ((uw_mobile_object_t *)iVar7_rec)->damage_source
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 18)
+ ((uw_mobile_object_t *)iVar7_rec)->damage_source
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_18_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 18)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->damage_source
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_18_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 18) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->damage_source = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_18_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 18)
+ (char)((uw_mobile_object_t *)iVar7_rec)->damage_source
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_19_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 19)
+ ((uw_mobile_object_t *)iVar7_rec)->motion_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 19)
+ ((uw_mobile_object_t *)iVar7_rec)->motion_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_19_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 19)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->motion_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_19_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 19) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->motion_flags = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_19_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 19)
+ (char)((uw_mobile_object_t *)iVar7_rec)->motion_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_20_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 20)
+ ((uw_mobile_object_t *)iVar7_rec)->attack_pitch
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 20)
+ ((uw_mobile_object_t *)iVar7_rec)->attack_pitch
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_20_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 20)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->attack_pitch
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_20_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 20) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->attack_pitch = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_20_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 20)
+ (char)((uw_mobile_object_t *)iVar7_rec)->attack_pitch
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_21_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 21)
+ ((uw_mobile_object_t *)iVar7_rec)->animation_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 21)
+ ((uw_mobile_object_t *)iVar7_rec)->animation_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_21_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 21)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->animation_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_21_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 21) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->animation_flags = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_21_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 21)
+ (char)((uw_mobile_object_t *)iVar7_rec)->animation_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_22_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 22)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 22)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_22_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 22)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->tile_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_22_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 22) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_low = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_22_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 22)
+ (char)((uw_mobile_object_t *)iVar7_rec)->tile_word_low
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_23_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 23)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 23)
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_23_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 23)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->tile_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_23_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 23) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->tile_word_high = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_23_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 23)
+ (char)((uw_mobile_object_t *)iVar7_rec)->tile_word_high
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_24_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 24)
+ ((uw_mobile_object_t *)iVar7_rec)->heading_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 24)
+ ((uw_mobile_object_t *)iVar7_rec)->heading_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_24_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 24)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->heading_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_24_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 24) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->heading_flags = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_24_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 24)
+ (char)((uw_mobile_object_t *)iVar7_rec)->heading_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_25_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 25)
+ ((uw_mobile_object_t *)iVar7_rec)->npc_ai_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 25)
+ ((uw_mobile_object_t *)iVar7_rec)->npc_ai_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_25_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 25)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->npc_ai_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_25_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 25) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->npc_ai_flags = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_25_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 25)
+ (char)((uw_mobile_object_t *)iVar7_rec)->npc_ai_flags
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_26_byte@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7_rec + 26)
+ ((uw_mobile_object_t *)iVar7_rec)->npc_whoami
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7_rec + 26)
+ ((uw_mobile_object_t *)iVar7_rec)->npc_whoami
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_26_char_address@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar7_rec + 26)
+ (char *)&((uw_mobile_object_t *)iVar7_rec)->npc_whoami
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_26_char_store@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 26) = E;
+ ((uw_mobile_object_t *)iVar7_rec)->npc_whoami = (byte)E;
)
...>
}

@npc_combat_position_tick_iVar7_rec_byte_26_char@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar7_rec + 26)
+ (char)((uw_mobile_object_t *)iVar7_rec)->npc_whoami
)
...>
}

@npc_combat_disengage_tick_iVar2_word_0_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_word_0_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_word_0_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_2_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_2_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_2_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_4_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_4_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_4_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_6_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_6_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_6_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_11_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_11_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_11_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_13_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_13_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_13_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_15_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_15_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_15_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_word_22_ushort@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_22_undefined2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
)
...>
}

@npc_combat_disengage_tick_iVar2_word_22_short@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_signed
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_0_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_0_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_0_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_0_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_1_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_1_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 1)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_1_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 1) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_1_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 1)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_2_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_2_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 2)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_2_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 2) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_2_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 2)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_3_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_3_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 3)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_3_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 3) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_3_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 3)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_4_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_4_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 4)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_4_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 4) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_4_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 4)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_5_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_5_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 5)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_5_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 5) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_5_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 5)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_6_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_6_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 6)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_6_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 6) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_6_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 6)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_7_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_7_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 7)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_7_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 7) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_7_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 7)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_8_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_8_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 8)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_8_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 8) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_8_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 8)
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_9_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_9_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 9)
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_9_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 9) = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_9_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 9)
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_10_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_10_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 10)
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_10_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 10) = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_10_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 10)
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_11_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_11_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 11)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_11_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 11) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_11_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 11)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_12_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_12_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 12)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_12_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 12) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_12_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 12)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_13_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_13_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 13)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_13_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 13) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_13_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 13)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_14_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_14_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 14)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_14_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 14) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_14_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 14)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_15_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_15_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 15)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_15_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 15) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_15_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 15)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_16_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_16_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 16)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_16_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 16) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_16_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 16)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_17_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_17_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 17)
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_17_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 17) = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_17_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 17)
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_18_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_18_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 18)
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_18_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 18) = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_18_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 18)
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_19_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_19_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 19)
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_19_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 19) = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_19_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 19)
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_20_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_20_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 20)
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_20_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 20) = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_20_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 20)
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_21_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_21_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 21)
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_21_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 21) = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_21_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 21)
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_22_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_22_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 22)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_22_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 22) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_22_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 22)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_23_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_23_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 23)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_23_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 23) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_23_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 23)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_24_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_24_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 24)
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_24_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 24) = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_24_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 24)
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_25_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_25_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 25)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_25_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 25) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_25_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 25)
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_26_byte@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_26_char_address@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 26)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_26_char_store@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 26) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
)
...>
}

@npc_combat_disengage_tick_iVar2_byte_26_char@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 26)
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}
