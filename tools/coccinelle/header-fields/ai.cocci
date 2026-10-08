@field_0_item_id@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->item_id
|
- ((ushort *)player_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->item_id
|
- *(ushort *)player_rec & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->item_id
|
- *(ushort *)(player_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->item_id
|
- CONCAT11(player_rec[1], *player_rec) & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->item_id
|
- CONCAT11(player_rec[1], player_rec[0]) & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)((char *)player_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (((ushort *)player_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (((ushort *)player_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)player_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)player_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)(player_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)(player_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (CONCAT11(player_rec[1], *player_rec) >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (CONCAT11(player_rec[1], *player_rec) & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (CONCAT11(player_rec[1], player_rec[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (CONCAT11(player_rec[1], player_rec[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(byte *)((char *)player_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(byte *)((char *)player_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)player_rec)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (((ushort *)player_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (((ushort *)player_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)player_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)player_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)(player_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)(player_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (CONCAT11(player_rec[1], *player_rec) >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (CONCAT11(player_rec[1], *player_rec) & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (CONCAT11(player_rec[1], player_rec[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (CONCAT11(player_rec[1], player_rec[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(byte *)((char *)player_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(byte *)((char *)player_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)player_rec)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (((ushort *)player_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (((ushort *)player_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)player_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)player_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)(player_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)(player_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (CONCAT11(player_rec[1], *player_rec) >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (CONCAT11(player_rec[1], *player_rec) & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (CONCAT11(player_rec[1], player_rec[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (CONCAT11(player_rec[1], player_rec[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(byte *)((char *)player_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(byte *)((char *)player_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)player_rec)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (((ushort *)player_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (((ushort *)player_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)player_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)player_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)(player_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)(player_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (CONCAT11(player_rec[1], *player_rec) >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (CONCAT11(player_rec[1], *player_rec) & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (CONCAT11(player_rec[1], player_rec[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (CONCAT11(player_rec[1], player_rec[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(byte *)((char *)player_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(byte *)((char *)player_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)player_rec)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (((ushort *)player_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (((ushort *)player_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)player_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)player_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)(player_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)(player_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (CONCAT11(player_rec[1], *player_rec) >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (CONCAT11(player_rec[1], *player_rec) & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (CONCAT11(player_rec[1], player_rec[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (CONCAT11(player_rec[1], player_rec[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(byte *)((char *)player_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(byte *)((char *)player_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)player_rec)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
|
- ((ushort *)player_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
|
- *(ushort *)(player_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
|
- *(byte *)((char *)player_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
|
- player_rec[2] & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (*(ushort *)((char *)player_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (((ushort *)player_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (((ushort *)player_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (*(ushort *)(player_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (*(ushort *)(player_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)player_rec)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(ushort *)((char *)player_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (((ushort *)player_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (((ushort *)player_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(ushort *)(player_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(ushort *)(player_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(byte *)((char *)player_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(byte *)((char *)player_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)player_rec)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(ushort *)((char *)player_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (((ushort *)player_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (((ushort *)player_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(ushort *)(player_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(ushort *)(player_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(byte *)((char *)player_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(byte *)((char *)player_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)player_rec)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
|
- ((ushort *)player_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
|
- *(ushort *)(player_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
|
- *(byte *)((char *)player_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
|
- player_rec[4] & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->next
|
- (*(ushort *)((char *)player_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->next
|
- (((ushort *)player_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->next
|
- (((ushort *)player_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->next
|
- (*(ushort *)(player_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->next
|
- (*(ushort *)(player_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
|
- ((ushort *)player_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
|
- *(ushort *)(player_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
|
- *(byte *)((char *)player_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
|
- player_rec[6] & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->link
|
- (*(ushort *)((char *)player_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->link
|
- (((ushort *)player_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->link
|
- (((ushort *)player_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->link
|
- (*(ushort *)(player_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->link
|
- (*(ushort *)(player_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->link
)
...>
}

@field_1_item_id@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->item_id
|
- ((ushort *)pcVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->item_id
|
- *(ushort *)pcVar3 & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->item_id
|
- *(ushort *)(pcVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->item_id
|
- CONCAT11(pcVar3[1], *pcVar3) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->item_id
|
- CONCAT11(pcVar3[1], pcVar3[0]) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->item_id
)
...>
}

@field_1_flags_res@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (((ushort *)pcVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (((ushort *)pcVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)pcVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)pcVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)(pcVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)(pcVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar3)->flags_res
)
...>
}

@field_1_enchanted@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (((ushort *)pcVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (((ushort *)pcVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)pcVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)pcVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)(pcVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)(pcVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar3)->enchanted
)
...>
}

@field_1_doordir@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (((ushort *)pcVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (((ushort *)pcVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)pcVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)pcVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)(pcVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)(pcVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar3)->doordir
)
...>
}

@field_1_invisible@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (((ushort *)pcVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (((ushort *)pcVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)pcVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)pcVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)(pcVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)(pcVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar3)->invisible
)
...>
}

@field_1_is_quant@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (((ushort *)pcVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (((ushort *)pcVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)pcVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)pcVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)(pcVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)(pcVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar3)->is_quant
)
...>
}

@field_1_zpos@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- ((ushort *)pcVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- *(ushort *)(pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- *(byte *)((char *)pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- pcVar3[2] & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
)
...>
}

@field_1_heading@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (*(ushort *)((char *)pcVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (((ushort *)pcVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (((ushort *)pcVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (*(ushort *)(pcVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (*(ushort *)(pcVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar3)->heading
)
...>
}

@field_1_ypos@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(ushort *)((char *)pcVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (((ushort *)pcVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (((ushort *)pcVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(ushort *)(pcVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(ushort *)(pcVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(byte *)((char *)pcVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(byte *)((char *)pcVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar3)->ypos
)
...>
}

@field_1_xpos@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(ushort *)((char *)pcVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (((ushort *)pcVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (((ushort *)pcVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(ushort *)(pcVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(ushort *)(pcVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(byte *)((char *)pcVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(byte *)((char *)pcVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar3)->xpos
)
...>
}

@field_1_quality@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- ((ushort *)pcVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- *(ushort *)(pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- *(byte *)((char *)pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- pcVar3[4] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
)
...>
}

@field_1_next@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (*(ushort *)((char *)pcVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (((ushort *)pcVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (((ushort *)pcVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (*(ushort *)(pcVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (*(ushort *)(pcVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->next
)
...>
}

@field_1_owner@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- ((ushort *)pcVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- *(ushort *)(pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- *(byte *)((char *)pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- pcVar3[6] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
)
...>
}

@field_1_link@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (*(ushort *)((char *)pcVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (((ushort *)pcVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (((ushort *)pcVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (*(ushort *)(pcVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (*(ushort *)(pcVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->link
)
...>
}

@field_2_item_id@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- ((ushort *)object)[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- *(ushort *)object & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- object[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
|
- *object & 0x1ff
+ ((uw_object_hdr_t *)object)->item_id
)
...>
}

@field_2_flags_res@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)((char *)object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
)
...>
}

@field_2_enchanted@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)((char *)object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
)
...>
}

@field_2_doordir@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)((char *)object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
)
...>
}

@field_2_invisible@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)((char *)object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
)
...>
}

@field_2_is_quant@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)((char *)object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(ushort *)((char *)object + 0x0) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- ((ushort *)object)[0] >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(ushort *)object >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- object[0] >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *object >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@field_2_zpos@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- ((ushort *)object)[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- *(byte *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- (byte)object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
)
...>
}

@field_2_heading@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (*(ushort *)((char *)object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
)
...>
}

@field_2_ypos@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(ushort *)((char *)object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
)
...>
}

@field_2_xpos@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(ushort *)((char *)object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- *(ushort *)((char *)object + 0x2) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- ((ushort *)object)[1] >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- object[1] >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@field_2_quality@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- ((ushort *)object)[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- *(byte *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- (byte)object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
)
...>
}

@field_2_next@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (*(ushort *)((char *)object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- *(ushort *)((char *)object + 0x4) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- ((ushort *)object)[2] >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- object[2] >> 6
+ ((uw_object_hdr_t *)object)->next
)
...>
}

@field_2_owner@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- ((ushort *)object)[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- *(byte *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- (byte)object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
)
...>
}

@field_2_link@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (*(ushort *)((char *)object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- *(ushort *)((char *)object + 0x6) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- ((ushort *)object)[3] >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- object[3] >> 6
+ ((uw_object_hdr_t *)object)->link
)
...>
}

@field_3_item_id@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- ((ushort *)pObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- *(ushort *)pObj & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- *(ushort *)(pObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- CONCAT11(pObj[1], *pObj) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
|
- CONCAT11(pObj[1], pObj[0]) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->item_id
)
...>
}

@field_3_flags_res@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)((char *)pObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (((ushort *)pObj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (((ushort *)pObj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)pObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)pObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)(pObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)(pObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (CONCAT11(pObj[1], *pObj) >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (CONCAT11(pObj[1], *pObj) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (CONCAT11(pObj[1], pObj[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (CONCAT11(pObj[1], pObj[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pObj)->flags_res
)
...>
}

@field_3_enchanted@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)((char *)pObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (((ushort *)pObj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (((ushort *)pObj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)pObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)pObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)(pObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)(pObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (CONCAT11(pObj[1], *pObj) >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (CONCAT11(pObj[1], *pObj) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (CONCAT11(pObj[1], pObj[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (CONCAT11(pObj[1], pObj[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pObj)->enchanted
)
...>
}

@field_3_doordir@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)((char *)pObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (((ushort *)pObj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (((ushort *)pObj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)pObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)pObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)(pObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)(pObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (CONCAT11(pObj[1], *pObj) >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (CONCAT11(pObj[1], *pObj) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (CONCAT11(pObj[1], pObj[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (CONCAT11(pObj[1], pObj[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pObj)->doordir
)
...>
}

@field_3_invisible@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)((char *)pObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (((ushort *)pObj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (((ushort *)pObj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)pObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)pObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)(pObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)(pObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (CONCAT11(pObj[1], *pObj) >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (CONCAT11(pObj[1], *pObj) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (CONCAT11(pObj[1], pObj[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (CONCAT11(pObj[1], pObj[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pObj)->invisible
)
...>
}

@field_3_is_quant@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)((char *)pObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)(pObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)(pObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (CONCAT11(pObj[1], *pObj) >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (CONCAT11(pObj[1], *pObj) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (CONCAT11(pObj[1], pObj[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (CONCAT11(pObj[1], pObj[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(byte *)((char *)pObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(byte *)((char *)pObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pObj)->is_quant
)
...>
}

@field_3_zpos@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- ((ushort *)pObj)[1] & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- *(ushort *)(pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- *(byte *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- pObj[2] & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
)
...>
}

@field_3_heading@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (*(ushort *)((char *)pObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (((ushort *)pObj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (((ushort *)pObj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (*(ushort *)(pObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (*(ushort *)(pObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
)
...>
}

@field_3_ypos@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(ushort *)((char *)pObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (((ushort *)pObj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (((ushort *)pObj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(ushort *)(pObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(ushort *)(pObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pObj)->ypos
)
...>
}

@field_3_xpos@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(ushort *)((char *)pObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(ushort *)(pObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(ushort *)(pObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(byte *)((char *)pObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(byte *)((char *)pObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pObj)->xpos
)
...>
}

@field_3_quality@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- ((ushort *)pObj)[2] & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- *(ushort *)(pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- *(byte *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- pObj[4] & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
)
...>
}

@field_3_next@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (*(ushort *)((char *)pObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- (*(ushort *)(pObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (*(ushort *)(pObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
)
...>
}

@field_3_owner@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- ((ushort *)pObj)[3] & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- *(ushort *)(pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- *(byte *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- pObj[6] & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
)
...>
}

@field_3_link@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (*(ushort *)((char *)pObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- (*(ushort *)(pObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (*(ushort *)(pObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
)
...>
}

@field_4_item_id@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->item_id
|
- ((ushort *)pbVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->item_id
|
- *(ushort *)pbVar4 & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->item_id
|
- *(ushort *)(pbVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->item_id
|
- CONCAT11(pbVar4[1], *pbVar4) & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->item_id
|
- CONCAT11(pbVar4[1], pbVar4[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->item_id
)
...>
}

@field_4_flags_res@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (((ushort *)pbVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (((ushort *)pbVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)pbVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)pbVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)(pbVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)(pbVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (CONCAT11(pbVar4[1], *pbVar4) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (CONCAT11(pbVar4[1], *pbVar4) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (CONCAT11(pbVar4[1], pbVar4[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (CONCAT11(pbVar4[1], pbVar4[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar4)->flags_res
)
...>
}

@field_4_enchanted@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (((ushort *)pbVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (((ushort *)pbVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)pbVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)pbVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)(pbVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)(pbVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (CONCAT11(pbVar4[1], *pbVar4) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (CONCAT11(pbVar4[1], *pbVar4) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (CONCAT11(pbVar4[1], pbVar4[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (CONCAT11(pbVar4[1], pbVar4[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar4)->enchanted
)
...>
}

@field_4_doordir@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (((ushort *)pbVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (((ushort *)pbVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)pbVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)pbVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)(pbVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)(pbVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (CONCAT11(pbVar4[1], *pbVar4) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (CONCAT11(pbVar4[1], *pbVar4) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (CONCAT11(pbVar4[1], pbVar4[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (CONCAT11(pbVar4[1], pbVar4[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar4)->doordir
)
...>
}

@field_4_invisible@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (((ushort *)pbVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (((ushort *)pbVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)pbVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)pbVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)(pbVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)(pbVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (CONCAT11(pbVar4[1], *pbVar4) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (CONCAT11(pbVar4[1], *pbVar4) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (CONCAT11(pbVar4[1], pbVar4[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (CONCAT11(pbVar4[1], pbVar4[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar4)->invisible
)
...>
}

@field_4_is_quant@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (((ushort *)pbVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (((ushort *)pbVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)pbVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)pbVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)(pbVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)(pbVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (CONCAT11(pbVar4[1], *pbVar4) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (CONCAT11(pbVar4[1], *pbVar4) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (CONCAT11(pbVar4[1], pbVar4[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (CONCAT11(pbVar4[1], pbVar4[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar4)->is_quant
)
...>
}

@field_4_zpos@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
|
- ((ushort *)pbVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
|
- *(ushort *)(pbVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
|
- *(byte *)((char *)pbVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
|
- pbVar4[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
)
...>
}

@field_4_heading@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (*(ushort *)((char *)pbVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (((ushort *)pbVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (((ushort *)pbVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (*(ushort *)(pbVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (*(ushort *)(pbVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar4)->heading
)
...>
}

@field_4_ypos@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(ushort *)((char *)pbVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (((ushort *)pbVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (((ushort *)pbVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(ushort *)(pbVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(ushort *)(pbVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(byte *)((char *)pbVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(byte *)((char *)pbVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar4)->ypos
)
...>
}

@field_4_xpos@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(ushort *)((char *)pbVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (((ushort *)pbVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (((ushort *)pbVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(ushort *)(pbVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(ushort *)(pbVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(byte *)((char *)pbVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(byte *)((char *)pbVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar4)->xpos
)
...>
}

@field_4_quality@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
|
- ((ushort *)pbVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
|
- *(ushort *)(pbVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
|
- *(byte *)((char *)pbVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
|
- pbVar4[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
)
...>
}

@field_4_next@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (*(ushort *)((char *)pbVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (((ushort *)pbVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (((ushort *)pbVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (*(ushort *)(pbVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (*(ushort *)(pbVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->next
)
...>
}

@field_4_owner@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
|
- ((ushort *)pbVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
|
- *(ushort *)(pbVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
|
- *(byte *)((char *)pbVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
|
- pbVar4[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
)
...>
}

@field_4_link@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (*(ushort *)((char *)pbVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (((ushort *)pbVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (((ushort *)pbVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (*(ushort *)(pbVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (*(ushort *)(pbVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->link
)
...>
}

@field_5_item_id@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->item_id
|
- ((ushort *)iVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->item_id
|
- *(ushort *)iVar6 & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->item_id
|
- *(ushort *)(iVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->item_id
|
- CONCAT11(iVar6[1], *iVar6) & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->item_id
|
- CONCAT11(iVar6[1], iVar6[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->item_id
)
...>
}

@field_5_flags_res@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (((ushort *)iVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (((ushort *)iVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)iVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)iVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)(iVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)(iVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (CONCAT11(iVar6[1], *iVar6) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (CONCAT11(iVar6[1], *iVar6) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (CONCAT11(iVar6[1], iVar6[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (CONCAT11(iVar6[1], iVar6[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(byte *)((char *)iVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(byte *)((char *)iVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar6)->flags_res
)
...>
}

@field_5_enchanted@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (((ushort *)iVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (((ushort *)iVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)iVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)iVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)(iVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)(iVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (CONCAT11(iVar6[1], *iVar6) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (CONCAT11(iVar6[1], *iVar6) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (CONCAT11(iVar6[1], iVar6[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (CONCAT11(iVar6[1], iVar6[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(byte *)((char *)iVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar6)->enchanted
)
...>
}

@field_5_doordir@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (((ushort *)iVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (((ushort *)iVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)iVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)iVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)(iVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)(iVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (CONCAT11(iVar6[1], *iVar6) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (CONCAT11(iVar6[1], *iVar6) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (CONCAT11(iVar6[1], iVar6[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (CONCAT11(iVar6[1], iVar6[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(byte *)((char *)iVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar6)->doordir
)
...>
}

@field_5_invisible@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (((ushort *)iVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (((ushort *)iVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)iVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)iVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)(iVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)(iVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (CONCAT11(iVar6[1], *iVar6) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (CONCAT11(iVar6[1], *iVar6) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (CONCAT11(iVar6[1], iVar6[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (CONCAT11(iVar6[1], iVar6[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(byte *)((char *)iVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar6)->invisible
)
...>
}

@field_5_is_quant@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (((ushort *)iVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (((ushort *)iVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)iVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)iVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)(iVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)(iVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (CONCAT11(iVar6[1], *iVar6) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (CONCAT11(iVar6[1], *iVar6) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (CONCAT11(iVar6[1], iVar6[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (CONCAT11(iVar6[1], iVar6[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(byte *)((char *)iVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar6)->is_quant
)
...>
}

@field_5_zpos@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- ((ushort *)iVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- *(ushort *)(iVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- *(byte *)((char *)iVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- iVar6[2] & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
)
...>
}

@field_5_heading@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (*(ushort *)((char *)iVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (((ushort *)iVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (((ushort *)iVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (*(ushort *)(iVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (*(ushort *)(iVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6)->heading
)
...>
}

@field_5_ypos@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(ushort *)((char *)iVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (((ushort *)iVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (((ushort *)iVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(ushort *)(iVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(ushort *)(iVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(byte *)((char *)iVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(byte *)((char *)iVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar6)->ypos
)
...>
}

@field_5_xpos@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(ushort *)((char *)iVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (((ushort *)iVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (((ushort *)iVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(ushort *)(iVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(ushort *)(iVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(byte *)((char *)iVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(byte *)((char *)iVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar6)->xpos
)
...>
}

@field_5_quality@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- ((ushort *)iVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- *(ushort *)(iVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- *(byte *)((char *)iVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- iVar6[4] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
)
...>
}

@field_5_next@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (*(ushort *)((char *)iVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- (((ushort *)iVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (((ushort *)iVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- (*(ushort *)(iVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (*(ushort *)(iVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
)
...>
}

@field_5_owner@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- ((ushort *)iVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- *(ushort *)(iVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- *(byte *)((char *)iVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- iVar6[6] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
)
...>
}

@field_5_link@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (*(ushort *)((char *)iVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- (((ushort *)iVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (((ushort *)iVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- (*(ushort *)(iVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (*(ushort *)(iVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
)
...>
}

@field_6_item_id@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->item_id
|
- ((ushort *)pDropObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->item_id
|
- *(ushort *)pDropObj & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->item_id
|
- *(ushort *)(pDropObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->item_id
|
- CONCAT11(pDropObj[1], *pDropObj) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->item_id
|
- CONCAT11(pDropObj[1], pDropObj[0]) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->item_id
)
...>
}

@field_6_flags_res@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (((ushort *)pDropObj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (((ushort *)pDropObj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)pDropObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)pDropObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)(pDropObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)(pDropObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)((char *)pDropObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)((char *)pDropObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pDropObj)->flags_res
)
...>
}

@field_6_enchanted@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (((ushort *)pDropObj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (((ushort *)pDropObj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)pDropObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)pDropObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)(pDropObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)(pDropObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)((char *)pDropObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pDropObj)->enchanted
)
...>
}

@field_6_doordir@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (((ushort *)pDropObj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (((ushort *)pDropObj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)pDropObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)pDropObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)(pDropObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)(pDropObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)((char *)pDropObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pDropObj)->doordir
)
...>
}

@field_6_invisible@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (((ushort *)pDropObj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (((ushort *)pDropObj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)pDropObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)pDropObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)(pDropObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)(pDropObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)((char *)pDropObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pDropObj)->invisible
)
...>
}

@field_6_is_quant@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (((ushort *)pDropObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (((ushort *)pDropObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)pDropObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)pDropObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)(pDropObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)(pDropObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(byte *)((char *)pDropObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pDropObj)->is_quant
)
...>
}

@field_6_zpos@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- ((ushort *)pDropObj)[1] & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- *(ushort *)(pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- *(byte *)((char *)pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- pDropObj[2] & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
)
...>
}

@field_6_heading@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (*(ushort *)((char *)pDropObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (((ushort *)pDropObj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (((ushort *)pDropObj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (*(ushort *)(pDropObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (*(ushort *)(pDropObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pDropObj)->heading
)
...>
}

@field_6_ypos@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(ushort *)((char *)pDropObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (((ushort *)pDropObj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (((ushort *)pDropObj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(ushort *)(pDropObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(ushort *)(pDropObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)((char *)pDropObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)((char *)pDropObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pDropObj)->ypos
)
...>
}

@field_6_xpos@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(ushort *)((char *)pDropObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (((ushort *)pDropObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (((ushort *)pDropObj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(ushort *)(pDropObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(ushort *)(pDropObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(byte *)((char *)pDropObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(byte *)((char *)pDropObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pDropObj)->xpos
)
...>
}

@field_6_quality@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- ((ushort *)pDropObj)[2] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- *(ushort *)(pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- *(byte *)((char *)pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- pDropObj[4] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
)
...>
}

@field_6_next@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (*(ushort *)((char *)pDropObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (((ushort *)pDropObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (((ushort *)pDropObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (*(ushort *)(pDropObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (*(ushort *)(pDropObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->next
)
...>
}

@field_6_owner@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- ((ushort *)pDropObj)[3] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- *(ushort *)(pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- *(byte *)((char *)pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- pDropObj[6] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
)
...>
}

@field_6_link@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (*(ushort *)((char *)pDropObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (((ushort *)pDropObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (((ushort *)pDropObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (*(ushort *)(pDropObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (*(ushort *)(pDropObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->link
)
...>
}

@field_7_item_id@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- ((ushort *)iVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- *(ushort *)iVar1 & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- *(ushort *)(iVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- CONCAT11(iVar1[1], *iVar1) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
|
- CONCAT11(iVar1[1], iVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->item_id
)
...>
}

@field_7_flags_res@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (((ushort *)iVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (((ushort *)iVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)iVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)iVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)(iVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)(iVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], *iVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], *iVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar1)->flags_res
)
...>
}

@field_7_enchanted@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (((ushort *)iVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (((ushort *)iVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)iVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)iVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)(iVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)(iVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], *iVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], *iVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar1)->enchanted
)
...>
}

@field_7_doordir@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (((ushort *)iVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (((ushort *)iVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)iVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)iVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)(iVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)(iVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], *iVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], *iVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar1)->doordir
)
...>
}

@field_7_invisible@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (((ushort *)iVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (((ushort *)iVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)iVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)iVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)(iVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)(iVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], *iVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], *iVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar1)->invisible
)
...>
}

@field_7_is_quant@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (((ushort *)iVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (((ushort *)iVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)iVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)iVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)(iVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)(iVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], *iVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], *iVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)((char *)iVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
)
...>
}

@field_7_zpos@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- ((ushort *)iVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(ushort *)(iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(byte *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- iVar1[2] & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
)
...>
}

@field_7_heading@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (((ushort *)iVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (((ushort *)iVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)(iVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)(iVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
)
...>
}

@field_7_ypos@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (((ushort *)iVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (((ushort *)iVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)(iVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)(iVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar1)->ypos
)
...>
}

@field_7_xpos@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (((ushort *)iVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (((ushort *)iVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)(iVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)(iVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
)
...>
}

@field_7_quality@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- ((ushort *)iVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(ushort *)(iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(byte *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- iVar1[4] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
)
...>
}

@field_7_next@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)((char *)iVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
|
- (((ushort *)iVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (((ushort *)iVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)(iVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)(iVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
)
...>
}

@field_7_owner@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- ((ushort *)iVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(ushort *)(iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(byte *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- iVar1[6] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
)
...>
}

@field_7_link@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)((char *)iVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
|
- (((ushort *)iVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (((ushort *)iVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)(iVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)(iVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
)
...>
}

@field_8_item_id@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- ((ushort *)puVar8)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- *(ushort *)puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- puVar8[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
|
- *puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->item_id
)
...>
}

@field_8_flags_res@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (((ushort *)puVar8)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (((ushort *)puVar8)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)puVar8 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)puVar8 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (puVar8[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (puVar8[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*puVar8 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*puVar8 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(byte *)((char *)puVar8 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(byte *)((char *)puVar8 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar8)->flags_res
)
...>
}

@field_8_enchanted@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (((ushort *)puVar8)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (((ushort *)puVar8)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)puVar8 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)puVar8 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (puVar8[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (puVar8[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*puVar8 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*puVar8 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(byte *)((char *)puVar8 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar8)->enchanted
)
...>
}

@field_8_doordir@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (((ushort *)puVar8)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (((ushort *)puVar8)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)puVar8 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)puVar8 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (puVar8[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (puVar8[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*puVar8 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*puVar8 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(byte *)((char *)puVar8 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar8)->doordir
)
...>
}

@field_8_invisible@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (((ushort *)puVar8)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (((ushort *)puVar8)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)puVar8 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)puVar8 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (puVar8[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (puVar8[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*puVar8 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*puVar8 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(byte *)((char *)puVar8 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar8)->invisible
)
...>
}

@field_8_is_quant@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(ushort *)((char *)puVar8 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- ((ushort *)puVar8)[0] >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(ushort *)puVar8 >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (puVar8[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (puVar8[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- puVar8[0] >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *puVar8 >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(byte *)((char *)puVar8 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar8)->is_quant
)
...>
}

@field_8_zpos@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- ((ushort *)puVar8)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- puVar8[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- *(byte *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- (byte)puVar8[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
)
...>
}

@field_8_heading@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (((ushort *)puVar8)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (((ushort *)puVar8)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (puVar8[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (puVar8[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
)
...>
}

@field_8_ypos@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (((ushort *)puVar8)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (((ushort *)puVar8)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (puVar8[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (puVar8[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(byte *)((char *)puVar8 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(byte *)((char *)puVar8 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar8)->ypos
)
...>
}

@field_8_xpos@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- *(ushort *)((char *)puVar8 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- ((ushort *)puVar8)[1] >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (puVar8[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (puVar8[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- puVar8[1] >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(byte *)((char *)puVar8 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(byte *)((char *)puVar8 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar8)->xpos
)
...>
}

@field_8_quality@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- ((ushort *)puVar8)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- puVar8[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- *(byte *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- (byte)puVar8[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
)
...>
}

@field_8_next@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (*(ushort *)((char *)puVar8 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- *(ushort *)((char *)puVar8 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- ((ushort *)puVar8)[2] >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (puVar8[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (puVar8[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- puVar8[2] >> 6
+ ((uw_object_hdr_t *)puVar8)->next
)
...>
}

@field_8_owner@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- ((ushort *)puVar8)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- puVar8[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- *(byte *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- (byte)puVar8[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
)
...>
}

@field_8_link@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (*(ushort *)((char *)puVar8 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- *(ushort *)((char *)puVar8 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- ((ushort *)puVar8)[3] >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (puVar8[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (puVar8[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- puVar8[3] >> 6
+ ((uw_object_hdr_t *)puVar8)->link
)
...>
}

@field_9_item_id@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
|
- ((ushort *)npc)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
|
- *(ushort *)npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
|
- npc[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
|
- *npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->item_id
)
...>
}

@field_9_flags_res@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)((char *)npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (npc[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (npc[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc)->flags_res
)
...>
}

@field_9_enchanted@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)((char *)npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (npc[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (npc[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc)->enchanted
)
...>
}

@field_9_doordir@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)((char *)npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (npc[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (npc[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc)->doordir
)
...>
}

@field_9_invisible@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)((char *)npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (npc[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (npc[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc)->invisible
)
...>
}

@field_9_is_quant@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)((char *)npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(ushort *)((char *)npc + 0x0) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- ((ushort *)npc)[0] >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(ushort *)npc >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (npc[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (npc[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- npc[0] >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *npc >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
)
...>
}

@field_9_zpos@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- ((ushort *)npc)[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- npc[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(byte *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- (byte)npc[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
)
...>
}

@field_9_heading@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)((char *)npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (npc[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (npc[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
)
...>
}

@field_9_ypos@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)((char *)npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (npc[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (npc[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc)->ypos
)
...>
}

@field_9_xpos@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)((char *)npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(ushort *)((char *)npc + 0x2) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- ((ushort *)npc)[1] >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (npc[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (npc[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- npc[1] >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
)
...>
}

@field_9_quality@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- ((ushort *)npc)[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- npc[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(byte *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- (byte)npc[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
)
...>
}

@field_9_next@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)((char *)npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- *(ushort *)((char *)npc + 0x4) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- ((ushort *)npc)[2] >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (npc[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (npc[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- npc[2] >> 6
+ ((uw_object_hdr_t *)npc)->next
)
...>
}

@field_9_owner@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- ((ushort *)npc)[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- npc[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(byte *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- (byte)npc[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
)
...>
}

@field_9_link@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)((char *)npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- *(ushort *)((char *)npc + 0x6) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- ((ushort *)npc)[3] >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (npc[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (npc[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- npc[3] >> 6
+ ((uw_object_hdr_t *)npc)->link
)
...>
}

@field_10_item_id@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)source)->item_id
|
- ((ushort *)source)[0] & 0x1ff
+ ((uw_object_hdr_t *)source)->item_id
|
- *(ushort *)source & 0x1ff
+ ((uw_object_hdr_t *)source)->item_id
|
- source[0] & 0x1ff
+ ((uw_object_hdr_t *)source)->item_id
|
- *source & 0x1ff
+ ((uw_object_hdr_t *)source)->item_id
)
...>
}

@field_10_flags_res@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(ushort *)((char *)source + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (((ushort *)source)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (((ushort *)source)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(ushort *)source >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(ushort *)source & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (source[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (source[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*source >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*source & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(byte *)((char *)source + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(byte *)((char *)source + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)source)->flags_res
)
...>
}

@field_10_enchanted@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(ushort *)((char *)source + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (((ushort *)source)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (((ushort *)source)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(ushort *)source >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(ushort *)source & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (source[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (source[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*source >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*source & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(byte *)((char *)source + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(byte *)((char *)source + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)source)->enchanted
)
...>
}

@field_10_doordir@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(ushort *)((char *)source + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (((ushort *)source)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (((ushort *)source)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(ushort *)source >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(ushort *)source & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (source[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (source[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (*source >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*source & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(byte *)((char *)source + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(byte *)((char *)source + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)source)->doordir
)
...>
}

@field_10_invisible@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(ushort *)((char *)source + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (((ushort *)source)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (((ushort *)source)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(ushort *)source >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(ushort *)source & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (source[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (source[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (*source >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*source & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(byte *)((char *)source + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(byte *)((char *)source + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)source)->invisible
)
...>
}

@field_10_is_quant@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(ushort *)((char *)source + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- *(ushort *)((char *)source + 0x0) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (((ushort *)source)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (((ushort *)source)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- ((ushort *)source)[0] >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(ushort *)source >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(ushort *)source & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- *(ushort *)source >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (source[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (source[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- source[0] >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*source >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*source & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- *source >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(byte *)((char *)source + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(byte *)((char *)source + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)source)->is_quant
)
...>
}

@field_10_zpos@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x2) & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- ((ushort *)source)[1] & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- source[1] & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- *(byte *)((char *)source + 0x2) & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- (byte)source[1] & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
)
...>
}

@field_10_heading@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)source)->heading
|
- (*(ushort *)((char *)source + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)source)->heading
|
- (((ushort *)source)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)source)->heading
|
- (((ushort *)source)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)source)->heading
|
- (source[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)source)->heading
|
- (source[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)source)->heading
)
...>
}

@field_10_ypos@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (*(ushort *)((char *)source + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source)->ypos
|
- (((ushort *)source)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (((ushort *)source)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source)->ypos
|
- (source[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (source[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source)->ypos
|
- (*(byte *)((char *)source + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (*(byte *)((char *)source + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)source)->ypos
)
...>
}

@field_10_xpos@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (*(ushort *)((char *)source + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- *(ushort *)((char *)source + 0x2) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- (((ushort *)source)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (((ushort *)source)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- ((ushort *)source)[1] >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- (source[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (source[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- source[1] >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- (*(byte *)((char *)source + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (*(byte *)((char *)source + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)source)->xpos
)
...>
}

@field_10_quality@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x4) & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- ((ushort *)source)[2] & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- source[2] & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- *(byte *)((char *)source + 0x4) & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- (byte)source[2] & 0x3f
+ ((uw_object_hdr_t *)source)->quality
)
...>
}

@field_10_next@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->next
|
- (*(ushort *)((char *)source + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- *(ushort *)((char *)source + 0x4) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- (((ushort *)source)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->next
|
- (((ushort *)source)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- ((ushort *)source)[2] >> 6
+ ((uw_object_hdr_t *)source)->next
|
- (source[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->next
|
- (source[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- source[2] >> 6
+ ((uw_object_hdr_t *)source)->next
)
...>
}

@field_10_owner@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x6) & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- ((ushort *)source)[3] & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- source[3] & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- *(byte *)((char *)source + 0x6) & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- (byte)source[3] & 0x3f
+ ((uw_object_hdr_t *)source)->owner
)
...>
}

@field_10_link@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->link
|
- (*(ushort *)((char *)source + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- *(ushort *)((char *)source + 0x6) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- (((ushort *)source)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->link
|
- (((ushort *)source)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- ((ushort *)source)[3] >> 6
+ ((uw_object_hdr_t *)source)->link
|
- (source[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->link
|
- (source[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- source[3] >> 6
+ ((uw_object_hdr_t *)source)->link
)
...>
}
