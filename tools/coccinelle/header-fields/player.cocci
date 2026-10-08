@field_0_item_id@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
|
- ((ushort *)puVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
|
- *(ushort *)puVar5 & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (((ushort *)puVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (((ushort *)puVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)puVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)puVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar5)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (((ushort *)puVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (((ushort *)puVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)puVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)puVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar5)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (((ushort *)puVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (((ushort *)puVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)puVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)puVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar5)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (((ushort *)puVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (((ushort *)puVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)puVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)puVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar5)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(byte *)((char *)puVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar5)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- ((ushort *)puVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- *(byte *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (((ushort *)puVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (((ushort *)puVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (((ushort *)puVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (((ushort *)puVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar5)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(byte *)((char *)puVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar5)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- ((ushort *)puVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- *(byte *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (*(ushort *)((char *)puVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- ((ushort *)puVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- *(byte *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (*(ushort *)((char *)puVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
)
...>
}

@field_1_item_id@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pNewObj)->item_id
|
- ((ushort *)pNewObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pNewObj)->item_id
|
- *(ushort *)pNewObj & 0x1ff
+ ((uw_object_hdr_t *)pNewObj)->item_id
|
- *(ushort *)(pNewObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pNewObj)->item_id
|
- CONCAT11(pNewObj[1], *pNewObj) & 0x1ff
+ ((uw_object_hdr_t *)pNewObj)->item_id
|
- CONCAT11(pNewObj[1], pNewObj[0]) & 0x1ff
+ ((uw_object_hdr_t *)pNewObj)->item_id
)
...>
}

@field_1_flags_res@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(ushort *)((char *)pNewObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (((ushort *)pNewObj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (((ushort *)pNewObj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(ushort *)pNewObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(ushort *)pNewObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(ushort *)(pNewObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(ushort *)(pNewObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (CONCAT11(pNewObj[1], *pNewObj) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (CONCAT11(pNewObj[1], *pNewObj) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (CONCAT11(pNewObj[1], pNewObj[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (CONCAT11(pNewObj[1], pNewObj[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(byte *)((char *)pNewObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(byte *)((char *)pNewObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pNewObj)->flags_res
)
...>
}

@field_1_enchanted@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(ushort *)((char *)pNewObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (((ushort *)pNewObj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (((ushort *)pNewObj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(ushort *)pNewObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(ushort *)pNewObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(ushort *)(pNewObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(ushort *)(pNewObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (CONCAT11(pNewObj[1], *pNewObj) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (CONCAT11(pNewObj[1], *pNewObj) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (CONCAT11(pNewObj[1], pNewObj[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (CONCAT11(pNewObj[1], pNewObj[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(byte *)((char *)pNewObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(byte *)((char *)pNewObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pNewObj)->enchanted
)
...>
}

@field_1_doordir@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(ushort *)((char *)pNewObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (((ushort *)pNewObj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (((ushort *)pNewObj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(ushort *)pNewObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(ushort *)pNewObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(ushort *)(pNewObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(ushort *)(pNewObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (CONCAT11(pNewObj[1], *pNewObj) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (CONCAT11(pNewObj[1], *pNewObj) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (CONCAT11(pNewObj[1], pNewObj[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (CONCAT11(pNewObj[1], pNewObj[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(byte *)((char *)pNewObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(byte *)((char *)pNewObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pNewObj)->doordir
)
...>
}

@field_1_invisible@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(ushort *)((char *)pNewObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (((ushort *)pNewObj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (((ushort *)pNewObj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(ushort *)pNewObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(ushort *)pNewObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(ushort *)(pNewObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(ushort *)(pNewObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (CONCAT11(pNewObj[1], *pNewObj) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (CONCAT11(pNewObj[1], *pNewObj) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (CONCAT11(pNewObj[1], pNewObj[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (CONCAT11(pNewObj[1], pNewObj[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(byte *)((char *)pNewObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(byte *)((char *)pNewObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pNewObj)->invisible
)
...>
}

@field_1_is_quant@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(ushort *)((char *)pNewObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (((ushort *)pNewObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (((ushort *)pNewObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(ushort *)pNewObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(ushort *)pNewObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(ushort *)(pNewObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(ushort *)(pNewObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (CONCAT11(pNewObj[1], *pNewObj) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (CONCAT11(pNewObj[1], *pNewObj) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (CONCAT11(pNewObj[1], pNewObj[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (CONCAT11(pNewObj[1], pNewObj[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(byte *)((char *)pNewObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(byte *)((char *)pNewObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pNewObj)->is_quant
)
...>
}

@field_1_zpos@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNewObj)->zpos
|
- ((ushort *)pNewObj)[1] & 0x7f
+ ((uw_object_hdr_t *)pNewObj)->zpos
|
- *(ushort *)(pNewObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNewObj)->zpos
|
- *(byte *)((char *)pNewObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNewObj)->zpos
|
- pNewObj[2] & 0x7f
+ ((uw_object_hdr_t *)pNewObj)->zpos
)
...>
}

@field_1_heading@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->heading
|
- (*(ushort *)((char *)pNewObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pNewObj)->heading
|
- (((ushort *)pNewObj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->heading
|
- (((ushort *)pNewObj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pNewObj)->heading
|
- (*(ushort *)(pNewObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->heading
|
- (*(ushort *)(pNewObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pNewObj)->heading
)
...>
}

@field_1_ypos@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (*(ushort *)((char *)pNewObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (((ushort *)pNewObj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (((ushort *)pNewObj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (*(ushort *)(pNewObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (*(ushort *)(pNewObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (*(byte *)((char *)pNewObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (*(byte *)((char *)pNewObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pNewObj)->ypos
)
...>
}

@field_1_xpos@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(ushort *)((char *)pNewObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (((ushort *)pNewObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (((ushort *)pNewObj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(ushort *)(pNewObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(ushort *)(pNewObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(byte *)((char *)pNewObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(byte *)((char *)pNewObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pNewObj)->xpos
)
...>
}

@field_1_quality@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->quality
|
- ((ushort *)pNewObj)[2] & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->quality
|
- *(ushort *)(pNewObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->quality
|
- *(byte *)((char *)pNewObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->quality
|
- pNewObj[4] & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->quality
)
...>
}

@field_1_next@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNewObj)->next
|
- (*(ushort *)((char *)pNewObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNewObj)->next
|
- (((ushort *)pNewObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNewObj)->next
|
- (((ushort *)pNewObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNewObj)->next
|
- (*(ushort *)(pNewObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNewObj)->next
|
- (*(ushort *)(pNewObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNewObj)->next
)
...>
}

@field_1_owner@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->owner
|
- ((ushort *)pNewObj)[3] & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->owner
|
- *(ushort *)(pNewObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->owner
|
- *(byte *)((char *)pNewObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->owner
|
- pNewObj[6] & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->owner
)
...>
}

@field_1_link@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pNewObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNewObj)->link
|
- (*(ushort *)((char *)pNewObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNewObj)->link
|
- (((ushort *)pNewObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNewObj)->link
|
- (((ushort *)pNewObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNewObj)->link
|
- (*(ushort *)(pNewObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pNewObj)->link
|
- (*(ushort *)(pNewObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pNewObj)->link
)
...>
}
