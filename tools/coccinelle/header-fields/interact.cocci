@field_0_item_id@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->item_id
|
- ((ushort *)pbVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->item_id
|
- *(ushort *)pbVar1 & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->item_id
|
- *(ushort *)(pbVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->item_id
|
- CONCAT11(pbVar1[1], *pbVar1) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->item_id
|
- CONCAT11(pbVar1[1], pbVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (((ushort *)pbVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (((ushort *)pbVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)pbVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)pbVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)(pbVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)(pbVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar1)->flags_res
)
...>
}

@field_0_enchanted@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (((ushort *)pbVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (((ushort *)pbVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)pbVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)pbVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)(pbVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)(pbVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar1)->enchanted
)
...>
}

@field_0_doordir@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (((ushort *)pbVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (((ushort *)pbVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)pbVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)pbVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)(pbVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)(pbVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar1)->doordir
)
...>
}

@field_0_invisible@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (((ushort *)pbVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (((ushort *)pbVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)pbVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)pbVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)(pbVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)(pbVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar1)->invisible
)
...>
}

@field_0_is_quant@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (((ushort *)pbVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (((ushort *)pbVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)pbVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)pbVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)(pbVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)(pbVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
)
...>
}

@field_0_zpos@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- ((ushort *)pbVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(ushort *)(pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(byte *)((char *)pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- pbVar1[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (((ushort *)pbVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (((ushort *)pbVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)(pbVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)(pbVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (((ushort *)pbVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (((ushort *)pbVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)(pbVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)(pbVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)((char *)pbVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)((char *)pbVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar1)->ypos
)
...>
}

@field_0_xpos@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (((ushort *)pbVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (((ushort *)pbVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)(pbVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)(pbVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)((char *)pbVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)((char *)pbVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
)
...>
}

@field_0_quality@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- ((ushort *)pbVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(ushort *)(pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(byte *)((char *)pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- pbVar1[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)((char *)pbVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (((ushort *)pbVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (((ushort *)pbVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)(pbVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)(pbVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- ((ushort *)pbVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(ushort *)(pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(byte *)((char *)pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- pbVar1[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)((char *)pbVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (((ushort *)pbVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (((ushort *)pbVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)(pbVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)(pbVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
)
...>
}

@field_1_item_id@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->item_id
|
- ((ushort *)pbVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->item_id
|
- *(ushort *)pbVar3 & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->item_id
|
- *(ushort *)(pbVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->item_id
|
- CONCAT11(pbVar3[1], *pbVar3) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->item_id
|
- CONCAT11(pbVar3[1], pbVar3[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->item_id
)
...>
}

@field_1_flags_res@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (((ushort *)pbVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (((ushort *)pbVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)pbVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)pbVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)(pbVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)(pbVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar3)->flags_res
)
...>
}

@field_1_enchanted@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (((ushort *)pbVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (((ushort *)pbVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)pbVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)pbVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)(pbVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)(pbVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar3)->enchanted
)
...>
}

@field_1_doordir@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (((ushort *)pbVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (((ushort *)pbVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)pbVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)pbVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)(pbVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)(pbVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar3)->doordir
)
...>
}

@field_1_invisible@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (((ushort *)pbVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (((ushort *)pbVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)pbVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)pbVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)(pbVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)(pbVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar3)->invisible
)
...>
}

@field_1_is_quant@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (((ushort *)pbVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (((ushort *)pbVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)pbVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)pbVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)(pbVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)(pbVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
)
...>
}

@field_1_zpos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- ((ushort *)pbVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- *(ushort *)(pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- *(byte *)((char *)pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- pbVar3[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
)
...>
}

@field_1_heading@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (*(ushort *)((char *)pbVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (((ushort *)pbVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (((ushort *)pbVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (*(ushort *)(pbVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (*(ushort *)(pbVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar3)->heading
)
...>
}

@field_1_ypos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(ushort *)((char *)pbVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (((ushort *)pbVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (((ushort *)pbVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(ushort *)(pbVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(ushort *)(pbVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)((char *)pbVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)((char *)pbVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar3)->ypos
)
...>
}

@field_1_xpos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(ushort *)((char *)pbVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (((ushort *)pbVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (((ushort *)pbVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(ushort *)(pbVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(ushort *)(pbVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)((char *)pbVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)((char *)pbVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
)
...>
}

@field_1_quality@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- ((ushort *)pbVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- *(ushort *)(pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- *(byte *)((char *)pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- pbVar3[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
)
...>
}

@field_1_next@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (*(ushort *)((char *)pbVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (((ushort *)pbVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (((ushort *)pbVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (*(ushort *)(pbVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (*(ushort *)(pbVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->next
)
...>
}

@field_1_owner@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- ((ushort *)pbVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- *(ushort *)(pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- *(byte *)((char *)pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- pbVar3[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
)
...>
}

@field_1_link@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (*(ushort *)((char *)pbVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (((ushort *)pbVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (((ushort *)pbVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (*(ushort *)(pbVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (*(ushort *)(pbVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->link
)
...>
}

@field_2_item_id@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar7)->item_id
|
- ((ushort *)pbVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar7)->item_id
|
- *(ushort *)pbVar7 & 0x1ff
+ ((uw_object_hdr_t *)pbVar7)->item_id
|
- *(ushort *)(pbVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar7)->item_id
|
- CONCAT11(pbVar7[1], *pbVar7) & 0x1ff
+ ((uw_object_hdr_t *)pbVar7)->item_id
|
- CONCAT11(pbVar7[1], pbVar7[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar7)->item_id
)
...>
}

@field_2_flags_res@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(ushort *)((char *)pbVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (((ushort *)pbVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (((ushort *)pbVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(ushort *)pbVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(ushort *)pbVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(ushort *)(pbVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(ushort *)(pbVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (CONCAT11(pbVar7[1], *pbVar7) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (CONCAT11(pbVar7[1], *pbVar7) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (CONCAT11(pbVar7[1], pbVar7[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (CONCAT11(pbVar7[1], pbVar7[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(byte *)((char *)pbVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->flags_res
|
- (*(byte *)((char *)pbVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar7)->flags_res
)
...>
}

@field_2_enchanted@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(ushort *)((char *)pbVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (((ushort *)pbVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (((ushort *)pbVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(ushort *)pbVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(ushort *)pbVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(ushort *)(pbVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(ushort *)(pbVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (CONCAT11(pbVar7[1], *pbVar7) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (CONCAT11(pbVar7[1], *pbVar7) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (CONCAT11(pbVar7[1], pbVar7[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (CONCAT11(pbVar7[1], pbVar7[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(byte *)((char *)pbVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->enchanted
|
- (*(byte *)((char *)pbVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar7)->enchanted
)
...>
}

@field_2_doordir@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(ushort *)((char *)pbVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (((ushort *)pbVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (((ushort *)pbVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(ushort *)pbVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(ushort *)pbVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(ushort *)(pbVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(ushort *)(pbVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (CONCAT11(pbVar7[1], *pbVar7) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (CONCAT11(pbVar7[1], *pbVar7) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (CONCAT11(pbVar7[1], pbVar7[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (CONCAT11(pbVar7[1], pbVar7[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(byte *)((char *)pbVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->doordir
|
- (*(byte *)((char *)pbVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar7)->doordir
)
...>
}

@field_2_invisible@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(ushort *)((char *)pbVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (((ushort *)pbVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (((ushort *)pbVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(ushort *)pbVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(ushort *)pbVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(ushort *)(pbVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(ushort *)(pbVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (CONCAT11(pbVar7[1], *pbVar7) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (CONCAT11(pbVar7[1], *pbVar7) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (CONCAT11(pbVar7[1], pbVar7[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (CONCAT11(pbVar7[1], pbVar7[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(byte *)((char *)pbVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->invisible
|
- (*(byte *)((char *)pbVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar7)->invisible
)
...>
}

@field_2_is_quant@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(ushort *)((char *)pbVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (((ushort *)pbVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (((ushort *)pbVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(ushort *)pbVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(ushort *)pbVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(ushort *)(pbVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(ushort *)(pbVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (CONCAT11(pbVar7[1], *pbVar7) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (CONCAT11(pbVar7[1], *pbVar7) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (CONCAT11(pbVar7[1], pbVar7[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (CONCAT11(pbVar7[1], pbVar7[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(byte *)((char *)pbVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar7)->is_quant
|
- (*(byte *)((char *)pbVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar7)->is_quant
)
...>
}

@field_2_zpos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar7)->zpos
|
- ((ushort *)pbVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar7)->zpos
|
- *(ushort *)(pbVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar7)->zpos
|
- *(byte *)((char *)pbVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar7)->zpos
|
- pbVar7[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar7)->zpos
)
...>
}

@field_2_heading@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->heading
|
- (*(ushort *)((char *)pbVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar7)->heading
|
- (((ushort *)pbVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->heading
|
- (((ushort *)pbVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar7)->heading
|
- (*(ushort *)(pbVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->heading
|
- (*(ushort *)(pbVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar7)->heading
)
...>
}

@field_2_ypos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (*(ushort *)((char *)pbVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (((ushort *)pbVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (((ushort *)pbVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (*(ushort *)(pbVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (*(ushort *)(pbVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (*(byte *)((char *)pbVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->ypos
|
- (*(byte *)((char *)pbVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar7)->ypos
)
...>
}

@field_2_xpos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (*(ushort *)((char *)pbVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (((ushort *)pbVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (((ushort *)pbVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (*(ushort *)(pbVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (*(ushort *)(pbVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (*(byte *)((char *)pbVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar7)->xpos
|
- (*(byte *)((char *)pbVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar7)->xpos
)
...>
}

@field_2_quality@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->quality
|
- ((ushort *)pbVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->quality
|
- *(ushort *)(pbVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->quality
|
- *(byte *)((char *)pbVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->quality
|
- pbVar7[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->quality
)
...>
}

@field_2_next@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar7)->next
|
- (*(ushort *)((char *)pbVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar7)->next
|
- (((ushort *)pbVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar7)->next
|
- (((ushort *)pbVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar7)->next
|
- (*(ushort *)(pbVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar7)->next
|
- (*(ushort *)(pbVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar7)->next
)
...>
}

@field_2_owner@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->owner
|
- ((ushort *)pbVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->owner
|
- *(ushort *)(pbVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->owner
|
- *(byte *)((char *)pbVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->owner
|
- pbVar7[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar7)->owner
)
...>
}

@field_2_link@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar7)->link
|
- (*(ushort *)((char *)pbVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar7)->link
|
- (((ushort *)pbVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar7)->link
|
- (((ushort *)pbVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar7)->link
|
- (*(ushort *)(pbVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar7)->link
|
- (*(ushort *)(pbVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar7)->link
)
...>
}

@field_3_item_id@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_flags_res@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_enchanted@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_doordir@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_invisible@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_is_quant@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_zpos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_heading@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_ypos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_xpos@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_quality@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_next@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_owner@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_3_link@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
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

@field_4_item_id@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- ((ushort *)iVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- *(ushort *)iVar3 & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- *(ushort *)(iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- CONCAT11(iVar3[1], *iVar3) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
|
- CONCAT11(iVar3[1], iVar3[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->item_id
)
...>
}

@field_4_flags_res@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)(iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)(iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], *iVar3) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], *iVar3) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
)
...>
}

@field_4_enchanted@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)(iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)(iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], *iVar3) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], *iVar3) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
)
...>
}

@field_4_doordir@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)(iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)(iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], *iVar3) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], *iVar3) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
)
...>
}

@field_4_invisible@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)(iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)(iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], *iVar3) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], *iVar3) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
)
...>
}

@field_4_is_quant@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)(iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)(iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], *iVar3) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], *iVar3) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], iVar3[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (CONCAT11(iVar3[1], iVar3[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
)
...>
}

@field_4_zpos@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- ((ushort *)iVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(ushort *)(iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- iVar3[2] & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
)
...>
}

@field_4_heading@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)(iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)(iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
)
...>
}

@field_4_ypos@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)(iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)(iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
)
...>
}

@field_4_xpos@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)(iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)(iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
)
...>
}

@field_4_quality@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- ((ushort *)iVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(ushort *)(iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- iVar3[4] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
)
...>
}

@field_4_next@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)((char *)iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)(iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)(iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
)
...>
}

@field_4_owner@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- ((ushort *)iVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(ushort *)(iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- iVar3[6] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
)
...>
}

@field_4_link@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)((char *)iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)(iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)(iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
)
...>
}

@field_5_item_id@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- ((ushort *)puVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- *(ushort *)puVar1 & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- puVar1[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
|
- *puVar1 & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->item_id
)
...>
}

@field_5_flags_res@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (((ushort *)puVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (((ushort *)puVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)puVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)puVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (puVar1[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (puVar1[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*puVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*puVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar1)->flags_res
)
...>
}

@field_5_enchanted@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (((ushort *)puVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (((ushort *)puVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)puVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)puVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (puVar1[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (puVar1[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*puVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*puVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar1)->enchanted
)
...>
}

@field_5_doordir@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (((ushort *)puVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (((ushort *)puVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)puVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)puVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (puVar1[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (puVar1[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*puVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*puVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar1)->doordir
)
...>
}

@field_5_invisible@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (((ushort *)puVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (((ushort *)puVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)puVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)puVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (puVar1[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (puVar1[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*puVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*puVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar1)->invisible
)
...>
}

@field_5_is_quant@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(ushort *)((char *)puVar1 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- ((ushort *)puVar1)[0] >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(ushort *)puVar1 >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (puVar1[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (puVar1[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- puVar1[0] >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *puVar1 >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar1)->is_quant
)
...>
}

@field_5_zpos@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- ((ushort *)puVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- puVar1[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- *(byte *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- (byte)puVar1[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
)
...>
}

@field_5_heading@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (((ushort *)puVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (((ushort *)puVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (puVar1[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (puVar1[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
)
...>
}

@field_5_ypos@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (((ushort *)puVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (((ushort *)puVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (puVar1[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (puVar1[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar1)->ypos
)
...>
}

@field_5_xpos@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- *(ushort *)((char *)puVar1 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- ((ushort *)puVar1)[1] >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (puVar1[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (puVar1[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- puVar1[1] >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar1)->xpos
)
...>
}

@field_5_quality@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- ((ushort *)puVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- puVar1[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- *(byte *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- (byte)puVar1[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
)
...>
}

@field_5_next@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (*(ushort *)((char *)puVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- *(ushort *)((char *)puVar1 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- ((ushort *)puVar1)[2] >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- (puVar1[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (puVar1[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- puVar1[2] >> 6
+ ((uw_object_hdr_t *)puVar1)->next
)
...>
}

@field_5_owner@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- ((ushort *)puVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- puVar1[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- *(byte *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- (byte)puVar1[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
)
...>
}

@field_5_link@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (*(ushort *)((char *)puVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- *(ushort *)((char *)puVar1 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- ((ushort *)puVar1)[3] >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- (puVar1[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (puVar1[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- puVar1[3] >> 6
+ ((uw_object_hdr_t *)puVar1)->link
)
...>
}

@field_6_item_id@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->item_id
|
- ((ushort *)puVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->item_id
|
- *(ushort *)puVar3 & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->item_id
|
- puVar3[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->item_id
|
- *puVar3 & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->item_id
)
...>
}

@field_6_flags_res@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (((ushort *)puVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (((ushort *)puVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)puVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)puVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (puVar3[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (puVar3[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*puVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*puVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(byte *)((char *)puVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(byte *)((char *)puVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar3)->flags_res
)
...>
}

@field_6_enchanted@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (((ushort *)puVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (((ushort *)puVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)puVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)puVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (puVar3[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (puVar3[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*puVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*puVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(byte *)((char *)puVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar3)->enchanted
)
...>
}

@field_6_doordir@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (((ushort *)puVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (((ushort *)puVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)puVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)puVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (puVar3[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (puVar3[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*puVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*puVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(byte *)((char *)puVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar3)->doordir
)
...>
}

@field_6_invisible@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (((ushort *)puVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (((ushort *)puVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)puVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)puVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (puVar3[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (puVar3[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*puVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*puVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(byte *)((char *)puVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar3)->invisible
)
...>
}

@field_6_is_quant@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(ushort *)((char *)puVar3 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- ((ushort *)puVar3)[0] >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(ushort *)puVar3 >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (puVar3[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (puVar3[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- puVar3[0] >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *puVar3 >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(byte *)((char *)puVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar3)->is_quant
)
...>
}

@field_6_zpos@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- ((ushort *)puVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- puVar3[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- *(byte *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- (byte)puVar3[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
)
...>
}

@field_6_heading@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (((ushort *)puVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (((ushort *)puVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (puVar3[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (puVar3[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
)
...>
}

@field_6_ypos@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (((ushort *)puVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (((ushort *)puVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (puVar3[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (puVar3[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(byte *)((char *)puVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(byte *)((char *)puVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar3)->ypos
)
...>
}

@field_6_xpos@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- *(ushort *)((char *)puVar3 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- ((ushort *)puVar3)[1] >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (puVar3[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (puVar3[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- puVar3[1] >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(byte *)((char *)puVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(byte *)((char *)puVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar3)->xpos
)
...>
}

@field_6_quality@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- ((ushort *)puVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- puVar3[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- *(byte *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- (byte)puVar3[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
)
...>
}

@field_6_next@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (*(ushort *)((char *)puVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- *(ushort *)((char *)puVar3 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- ((ushort *)puVar3)[2] >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (puVar3[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (puVar3[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- puVar3[2] >> 6
+ ((uw_object_hdr_t *)puVar3)->next
)
...>
}

@field_6_owner@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- ((ushort *)puVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- puVar3[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- *(byte *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- (byte)puVar3[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
)
...>
}

@field_6_link@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (*(ushort *)((char *)puVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- *(ushort *)((char *)puVar3 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- ((ushort *)puVar3)[3] >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (puVar3[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (puVar3[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- puVar3[3] >> 6
+ ((uw_object_hdr_t *)puVar3)->link
)
...>
}
