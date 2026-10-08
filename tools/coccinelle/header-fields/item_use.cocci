@field_0_item_id@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
|
- puVar5[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
|
- *puVar5 & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
)
...>
}

@field_0_flags_res@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- (puVar5[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (puVar5[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*puVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*puVar5 & 0xe00) >> 9
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- (puVar5[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (puVar5[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*puVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*puVar5 & 0x1000) >> 12
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- (puVar5[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (puVar5[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*puVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*puVar5 & 0x2000) >> 13
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- (puVar5[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (puVar5[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*puVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*puVar5 & 0x4000) >> 14
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- *(ushort *)((char *)puVar5 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- ((ushort *)puVar5)[0] >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(ushort *)puVar5 >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (puVar5[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (puVar5[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- puVar5[0] >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *puVar5 >> 15
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- puVar5[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- *(byte *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- (byte)puVar5[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
)
...>
}

@field_0_heading@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
|
- (puVar5[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (puVar5[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
)
...>
}

@field_0_ypos@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- (puVar5[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (puVar5[1] & 0x1c00) >> 10
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- *(ushort *)((char *)puVar5 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- ((ushort *)puVar5)[1] >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (puVar5[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (puVar5[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- puVar5[1] >> 13
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
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- puVar5[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- *(byte *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- (byte)puVar5[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
)
...>
}

@field_0_next@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- *(ushort *)((char *)puVar5 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- ((ushort *)puVar5)[2] >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (puVar5[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (puVar5[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- puVar5[2] >> 6
+ ((uw_object_hdr_t *)puVar5)->next
)
...>
}

@field_0_owner@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- puVar5[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- *(byte *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- (byte)puVar5[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
)
...>
}

@field_0_link@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|drop_held_object_near_player\|place_object_in_equipment_slot\)$";
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
- *(ushort *)((char *)puVar5 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- ((ushort *)puVar5)[3] >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (puVar5[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (puVar5[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- puVar5[3] >> 6
+ ((uw_object_hdr_t *)puVar5)->link
)
...>
}

@field_1_item_id@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- ((ushort *)puVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- *(ushort *)puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- puVar7[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
|
- *puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->item_id
)
...>
}

@field_1_flags_res@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (puVar7[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (puVar7[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar7)->flags_res
)
...>
}

@field_1_enchanted@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (puVar7[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (puVar7[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar7)->enchanted
)
...>
}

@field_1_doordir@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (puVar7[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (puVar7[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar7)->doordir
)
...>
}

@field_1_invisible@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (puVar7[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (puVar7[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar7)->invisible
)
...>
}

@field_1_is_quant@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(ushort *)((char *)puVar7 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- ((ushort *)puVar7)[0] >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(ushort *)puVar7 >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (puVar7[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (puVar7[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- puVar7[0] >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *puVar7 >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
)
...>
}

@field_1_zpos@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- ((ushort *)puVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- puVar7[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- *(byte *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- (byte)puVar7[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
)
...>
}

@field_1_heading@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (puVar7[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (puVar7[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
)
...>
}

@field_1_ypos@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (puVar7[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (puVar7[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar7)->ypos
)
...>
}

@field_1_xpos@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- *(ushort *)((char *)puVar7 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- ((ushort *)puVar7)[1] >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (puVar7[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (puVar7[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- puVar7[1] >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
)
...>
}

@field_1_quality@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- ((ushort *)puVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- puVar7[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- *(byte *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- (byte)puVar7[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
)
...>
}

@field_1_next@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (*(ushort *)((char *)puVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- *(ushort *)((char *)puVar7 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- ((ushort *)puVar7)[2] >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (puVar7[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (puVar7[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- puVar7[2] >> 6
+ ((uw_object_hdr_t *)puVar7)->next
)
...>
}

@field_1_owner@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- ((ushort *)puVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- puVar7[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- *(byte *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- (byte)puVar7[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
)
...>
}

@field_1_link@
type R;
identifier F =~ "^\(use_light_source\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (*(ushort *)((char *)puVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- *(ushort *)((char *)puVar7 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- ((ushort *)puVar7)[3] >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (puVar7[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (puVar7[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- puVar7[3] >> 6
+ ((uw_object_hdr_t *)puVar7)->link
)
...>
}

@field_2_item_id@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
- (((ushort *)object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object & 0x8000) >> 15
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
- (((ushort *)object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] & 0xe000) >> 13
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
- (((ushort *)object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
)
...>
}

@field_2_owner@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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
- (((ushort *)object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
)
...>
}

@field_3_item_id@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
)
...>
}

@field_3_flags_res@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
)
...>
}

@field_3_enchanted@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
)
...>
}

@field_3_doordir@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
)
...>
}

@field_3_invisible@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
)
...>
}

@field_3_is_quant@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
)
...>
}

@field_3_zpos@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- *(byte *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
)
...>
}

@field_3_heading@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
)
...>
}

@field_3_ypos@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
)
...>
}

@field_3_xpos@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- (*(byte *)((char *)iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
)
...>
}

@field_3_quality@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- *(byte *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
)
...>
}

@field_3_next@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
)
...>
}

@field_3_owner@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
- *(byte *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
)
...>
}

@field_3_link@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
)
...>
}

@field_4_item_id@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_flags_res@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_enchanted@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_doordir@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_invisible@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_is_quant@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_zpos@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_heading@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_ypos@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_xpos@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_quality@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_next@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_owner@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_4_link@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@field_5_item_id@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)found_item)->item_id
|
- ((ushort *)found_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)found_item)->item_id
|
- *(ushort *)found_item & 0x1ff
+ ((uw_object_hdr_t *)found_item)->item_id
|
- found_item[0] & 0x1ff
+ ((uw_object_hdr_t *)found_item)->item_id
|
- *found_item & 0x1ff
+ ((uw_object_hdr_t *)found_item)->item_id
)
...>
}

@field_5_flags_res@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(ushort *)((char *)found_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (((ushort *)found_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (((ushort *)found_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(ushort *)found_item >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(ushort *)found_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (found_item[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (found_item[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*found_item >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*found_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(byte *)((char *)found_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(byte *)((char *)found_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)found_item)->flags_res
)
...>
}

@field_5_enchanted@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(ushort *)((char *)found_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (((ushort *)found_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (((ushort *)found_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(ushort *)found_item >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(ushort *)found_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (found_item[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (found_item[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*found_item >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*found_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(byte *)((char *)found_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(byte *)((char *)found_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)found_item)->enchanted
)
...>
}

@field_5_doordir@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(ushort *)((char *)found_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (((ushort *)found_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (((ushort *)found_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(ushort *)found_item >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(ushort *)found_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (found_item[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (found_item[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*found_item >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*found_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(byte *)((char *)found_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(byte *)((char *)found_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)found_item)->doordir
)
...>
}

@field_5_invisible@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(ushort *)((char *)found_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (((ushort *)found_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (((ushort *)found_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(ushort *)found_item >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(ushort *)found_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (found_item[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (found_item[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*found_item >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*found_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(byte *)((char *)found_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(byte *)((char *)found_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)found_item)->invisible
)
...>
}

@field_5_is_quant@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(ushort *)((char *)found_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *(ushort *)((char *)found_item + 0x0) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (((ushort *)found_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (((ushort *)found_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- ((ushort *)found_item)[0] >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(ushort *)found_item >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(ushort *)found_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *(ushort *)found_item >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (found_item[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (found_item[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- found_item[0] >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*found_item >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*found_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *found_item >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(byte *)((char *)found_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(byte *)((char *)found_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)found_item)->is_quant
)
...>
}

@field_5_zpos@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- ((ushort *)found_item)[1] & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- found_item[1] & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- *(byte *)((char *)found_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- (byte)found_item[1] & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
)
...>
}

@field_5_heading@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (*(ushort *)((char *)found_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (((ushort *)found_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (((ushort *)found_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (found_item[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (found_item[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)found_item)->heading
)
...>
}

@field_5_ypos@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (*(ushort *)((char *)found_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (((ushort *)found_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (((ushort *)found_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (found_item[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (found_item[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (*(byte *)((char *)found_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (*(byte *)((char *)found_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)found_item)->ypos
)
...>
}

@field_5_xpos@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (*(ushort *)((char *)found_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- *(ushort *)((char *)found_item + 0x2) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (((ushort *)found_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (((ushort *)found_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- ((ushort *)found_item)[1] >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (found_item[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (found_item[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- found_item[1] >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (*(byte *)((char *)found_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (*(byte *)((char *)found_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)found_item)->xpos
)
...>
}

@field_5_quality@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- ((ushort *)found_item)[2] & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- found_item[2] & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- *(byte *)((char *)found_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- (byte)found_item[2] & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
)
...>
}

@field_5_next@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->next
|
- (*(ushort *)((char *)found_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- *(ushort *)((char *)found_item + 0x4) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- (((ushort *)found_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->next
|
- (((ushort *)found_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- ((ushort *)found_item)[2] >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- (found_item[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->next
|
- (found_item[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- found_item[2] >> 6
+ ((uw_object_hdr_t *)found_item)->next
)
...>
}

@field_5_owner@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- ((ushort *)found_item)[3] & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- found_item[3] & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- *(byte *)((char *)found_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- (byte)found_item[3] & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
)
...>
}

@field_5_link@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->link
|
- (*(ushort *)((char *)found_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- *(ushort *)((char *)found_item + 0x6) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- (((ushort *)found_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->link
|
- (((ushort *)found_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- ((ushort *)found_item)[3] >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- (found_item[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->link
|
- (found_item[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- found_item[3] >> 6
+ ((uw_object_hdr_t *)found_item)->link
)
...>
}

@field_6_item_id@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_flags_res@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_enchanted@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_doordir@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_invisible@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_is_quant@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_zpos@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_heading@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_ypos@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_xpos@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_quality@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_next@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_owner@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_6_link@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_7_item_id@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- ((ushort *)puVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- *(ushort *)puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- puVar6[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- *puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
)
...>
}

@field_7_flags_res@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (puVar6[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (puVar6[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar6)->flags_res
)
...>
}

@field_7_enchanted@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (puVar6[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (puVar6[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar6)->enchanted
)
...>
}

@field_7_doordir@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (puVar6[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (puVar6[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar6)->doordir
)
...>
}

@field_7_invisible@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (puVar6[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (puVar6[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar6)->invisible
)
...>
}

@field_7_is_quant@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(ushort *)((char *)puVar6 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- ((ushort *)puVar6)[0] >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(ushort *)puVar6 >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (puVar6[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (puVar6[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- puVar6[0] >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *puVar6 >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
)
...>
}

@field_7_zpos@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- ((ushort *)puVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- puVar6[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- *(byte *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- (byte)puVar6[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
)
...>
}

@field_7_heading@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (puVar6[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (puVar6[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
)
...>
}

@field_7_ypos@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (puVar6[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (puVar6[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar6)->ypos
)
...>
}

@field_7_xpos@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- *(ushort *)((char *)puVar6 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- ((ushort *)puVar6)[1] >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (puVar6[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (puVar6[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- puVar6[1] >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
)
...>
}

@field_7_quality@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- ((ushort *)puVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- puVar6[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- *(byte *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- (byte)puVar6[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
)
...>
}

@field_7_next@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (*(ushort *)((char *)puVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- *(ushort *)((char *)puVar6 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- ((ushort *)puVar6)[2] >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (puVar6[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (puVar6[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- puVar6[2] >> 6
+ ((uw_object_hdr_t *)puVar6)->next
)
...>
}

@field_7_owner@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- ((ushort *)puVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- puVar6[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- *(byte *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- (byte)puVar6[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
)
...>
}

@field_7_link@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (*(ushort *)((char *)puVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- *(ushort *)((char *)puVar6 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- ((ushort *)puVar6)[3] >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (puVar6[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (puVar6[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- puVar6[3] >> 6
+ ((uw_object_hdr_t *)puVar6)->link
)
...>
}

@field_8_item_id@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->item_id
|
- ((ushort *)equip_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->item_id
|
- *(ushort *)equip_object & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->item_id
|
- equip_object[0] & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->item_id
|
- *equip_object & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->item_id
)
...>
}

@field_8_flags_res@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(ushort *)((char *)equip_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (((ushort *)equip_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (((ushort *)equip_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(ushort *)equip_object >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(ushort *)equip_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (equip_object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (equip_object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*equip_object >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*equip_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(byte *)((char *)equip_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(byte *)((char *)equip_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)equip_object)->flags_res
)
...>
}

@field_8_enchanted@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (((ushort *)equip_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (((ushort *)equip_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(ushort *)equip_object >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(ushort *)equip_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (equip_object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (equip_object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*equip_object >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*equip_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(byte *)((char *)equip_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(byte *)((char *)equip_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)equip_object)->enchanted
)
...>
}

@field_8_doordir@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (((ushort *)equip_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (((ushort *)equip_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(ushort *)equip_object >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(ushort *)equip_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (equip_object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (equip_object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*equip_object >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*equip_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(byte *)((char *)equip_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(byte *)((char *)equip_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)equip_object)->doordir
)
...>
}

@field_8_invisible@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (((ushort *)equip_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (((ushort *)equip_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(ushort *)equip_object >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(ushort *)equip_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (equip_object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (equip_object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*equip_object >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*equip_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(byte *)((char *)equip_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(byte *)((char *)equip_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)equip_object)->invisible
)
...>
}

@field_8_is_quant@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *(ushort *)((char *)equip_object + 0x0) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (((ushort *)equip_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (((ushort *)equip_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- ((ushort *)equip_object)[0] >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(ushort *)equip_object >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(ushort *)equip_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *(ushort *)equip_object >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (equip_object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (equip_object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- equip_object[0] >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*equip_object >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*equip_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *equip_object >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(byte *)((char *)equip_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(byte *)((char *)equip_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)equip_object)->is_quant
)
...>
}

@field_8_zpos@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- ((ushort *)equip_object)[1] & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- equip_object[1] & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- *(byte *)((char *)equip_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- (byte)equip_object[1] & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
)
...>
}

@field_8_heading@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (*(ushort *)((char *)equip_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (((ushort *)equip_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (((ushort *)equip_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (equip_object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (equip_object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equip_object)->heading
)
...>
}

@field_8_ypos@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (*(ushort *)((char *)equip_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (((ushort *)equip_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (((ushort *)equip_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (equip_object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (equip_object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (*(byte *)((char *)equip_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (*(byte *)((char *)equip_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)equip_object)->ypos
)
...>
}

@field_8_xpos@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (*(ushort *)((char *)equip_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- *(ushort *)((char *)equip_object + 0x2) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (((ushort *)equip_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (((ushort *)equip_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- ((ushort *)equip_object)[1] >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (equip_object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (equip_object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- equip_object[1] >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (*(byte *)((char *)equip_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (*(byte *)((char *)equip_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)equip_object)->xpos
)
...>
}

@field_8_quality@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- ((ushort *)equip_object)[2] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- equip_object[2] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- *(byte *)((char *)equip_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- (byte)equip_object[2] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
)
...>
}

@field_8_next@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->next
|
- (*(ushort *)((char *)equip_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- *(ushort *)((char *)equip_object + 0x4) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- (((ushort *)equip_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->next
|
- (((ushort *)equip_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- ((ushort *)equip_object)[2] >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- (equip_object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->next
|
- (equip_object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- equip_object[2] >> 6
+ ((uw_object_hdr_t *)equip_object)->next
)
...>
}

@field_8_owner@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- ((ushort *)equip_object)[3] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- equip_object[3] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- *(byte *)((char *)equip_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- (byte)equip_object[3] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
)
...>
}

@field_8_link@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->link
|
- (*(ushort *)((char *)equip_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- *(ushort *)((char *)equip_object + 0x6) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- (((ushort *)equip_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->link
|
- (((ushort *)equip_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- ((ushort *)equip_object)[3] >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- (equip_object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->link
|
- (equip_object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- equip_object[3] >> 6
+ ((uw_object_hdr_t *)equip_object)->link
)
...>
}

@field_9_item_id@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_a)->item_id
|
- ((ushort *)object_a)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_a)->item_id
|
- *(ushort *)object_a & 0x1ff
+ ((uw_object_hdr_t *)object_a)->item_id
)
...>
}

@field_9_flags_res@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(ushort *)((char *)object_a + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (((ushort *)object_a)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (((ushort *)object_a)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(ushort *)object_a >> 9) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(ushort *)object_a & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(byte *)((char *)object_a + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(byte *)((char *)object_a + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_a)->flags_res
)
...>
}

@field_9_enchanted@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(ushort *)((char *)object_a + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (((ushort *)object_a)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (((ushort *)object_a)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(ushort *)object_a >> 12) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(ushort *)object_a & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(byte *)((char *)object_a + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(byte *)((char *)object_a + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_a)->enchanted
)
...>
}

@field_9_doordir@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(ushort *)((char *)object_a + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (((ushort *)object_a)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (((ushort *)object_a)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(ushort *)object_a >> 13) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(ushort *)object_a & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(byte *)((char *)object_a + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(byte *)((char *)object_a + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_a)->doordir
)
...>
}

@field_9_invisible@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(ushort *)((char *)object_a + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (((ushort *)object_a)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (((ushort *)object_a)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(ushort *)object_a >> 14) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(ushort *)object_a & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(byte *)((char *)object_a + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(byte *)((char *)object_a + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_a)->invisible
)
...>
}

@field_9_is_quant@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(ushort *)((char *)object_a + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (((ushort *)object_a)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (((ushort *)object_a)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(ushort *)object_a >> 15) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(ushort *)object_a & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(byte *)((char *)object_a + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(byte *)((char *)object_a + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_a)->is_quant
)
...>
}

@field_9_zpos@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_a)->zpos
|
- ((ushort *)object_a)[1] & 0x7f
+ ((uw_object_hdr_t *)object_a)->zpos
|
- *(byte *)((char *)object_a + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_a)->zpos
)
...>
}

@field_9_heading@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_a)->heading
|
- (*(ushort *)((char *)object_a + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_a)->heading
|
- (((ushort *)object_a)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_a)->heading
|
- (((ushort *)object_a)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_a)->heading
)
...>
}

@field_9_ypos@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (*(ushort *)((char *)object_a + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (((ushort *)object_a)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (((ushort *)object_a)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (*(byte *)((char *)object_a + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (*(byte *)((char *)object_a + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_a)->ypos
)
...>
}

@field_9_xpos@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (*(ushort *)((char *)object_a + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (((ushort *)object_a)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (((ushort *)object_a)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (*(byte *)((char *)object_a + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (*(byte *)((char *)object_a + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_a)->xpos
)
...>
}

@field_9_quality@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_a)->quality
|
- ((ushort *)object_a)[2] & 0x3f
+ ((uw_object_hdr_t *)object_a)->quality
|
- *(byte *)((char *)object_a + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_a)->quality
)
...>
}

@field_9_next@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->next
|
- (*(ushort *)((char *)object_a + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->next
|
- (((ushort *)object_a)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->next
|
- (((ushort *)object_a)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->next
)
...>
}

@field_9_owner@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_a)->owner
|
- ((ushort *)object_a)[3] & 0x3f
+ ((uw_object_hdr_t *)object_a)->owner
|
- *(byte *)((char *)object_a + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_a)->owner
)
...>
}

@field_9_link@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->link
|
- (*(ushort *)((char *)object_a + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->link
|
- (((ushort *)object_a)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->link
|
- (((ushort *)object_a)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->link
)
...>
}

@field_10_item_id@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_b)->item_id
|
- ((ushort *)object_b)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_b)->item_id
|
- *(ushort *)object_b & 0x1ff
+ ((uw_object_hdr_t *)object_b)->item_id
)
...>
}

@field_10_flags_res@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(ushort *)((char *)object_b + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (((ushort *)object_b)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (((ushort *)object_b)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(ushort *)object_b >> 9) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(ushort *)object_b & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(byte *)((char *)object_b + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(byte *)((char *)object_b + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_b)->flags_res
)
...>
}

@field_10_enchanted@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(ushort *)((char *)object_b + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (((ushort *)object_b)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (((ushort *)object_b)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(ushort *)object_b >> 12) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(ushort *)object_b & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(byte *)((char *)object_b + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(byte *)((char *)object_b + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_b)->enchanted
)
...>
}

@field_10_doordir@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(ushort *)((char *)object_b + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (((ushort *)object_b)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (((ushort *)object_b)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(ushort *)object_b >> 13) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(ushort *)object_b & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(byte *)((char *)object_b + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(byte *)((char *)object_b + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_b)->doordir
)
...>
}

@field_10_invisible@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(ushort *)((char *)object_b + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (((ushort *)object_b)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (((ushort *)object_b)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(ushort *)object_b >> 14) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(ushort *)object_b & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(byte *)((char *)object_b + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(byte *)((char *)object_b + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_b)->invisible
)
...>
}

@field_10_is_quant@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(ushort *)((char *)object_b + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (((ushort *)object_b)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (((ushort *)object_b)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(ushort *)object_b >> 15) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(ushort *)object_b & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(byte *)((char *)object_b + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(byte *)((char *)object_b + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_b)->is_quant
)
...>
}

@field_10_zpos@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_b)->zpos
|
- ((ushort *)object_b)[1] & 0x7f
+ ((uw_object_hdr_t *)object_b)->zpos
|
- *(byte *)((char *)object_b + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_b)->zpos
)
...>
}

@field_10_heading@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_b)->heading
|
- (*(ushort *)((char *)object_b + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_b)->heading
|
- (((ushort *)object_b)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_b)->heading
|
- (((ushort *)object_b)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_b)->heading
)
...>
}

@field_10_ypos@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (*(ushort *)((char *)object_b + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (((ushort *)object_b)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (((ushort *)object_b)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (*(byte *)((char *)object_b + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (*(byte *)((char *)object_b + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_b)->ypos
)
...>
}

@field_10_xpos@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (*(ushort *)((char *)object_b + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (((ushort *)object_b)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (((ushort *)object_b)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (*(byte *)((char *)object_b + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (*(byte *)((char *)object_b + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_b)->xpos
)
...>
}

@field_10_quality@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_b)->quality
|
- ((ushort *)object_b)[2] & 0x3f
+ ((uw_object_hdr_t *)object_b)->quality
|
- *(byte *)((char *)object_b + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_b)->quality
)
...>
}

@field_10_next@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->next
|
- (*(ushort *)((char *)object_b + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->next
|
- (((ushort *)object_b)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->next
|
- (((ushort *)object_b)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->next
)
...>
}

@field_10_owner@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_b)->owner
|
- ((ushort *)object_b)[3] & 0x3f
+ ((uw_object_hdr_t *)object_b)->owner
|
- *(byte *)((char *)object_b + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_b)->owner
)
...>
}

@field_10_link@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->link
|
- (*(ushort *)((char *)object_b + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->link
|
- (((ushort *)object_b)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->link
|
- (((ushort *)object_b)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->link
)
...>
}

@field_11_item_id@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->item_id
|
- ((ushort *)local_1c)[0] & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->item_id
|
- *(ushort *)local_1c & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->item_id
|
- *(ushort *)(local_1c + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->item_id
|
- CONCAT11(local_1c[1], *local_1c) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->item_id
|
- CONCAT11(local_1c[1], local_1c[0]) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->item_id
)
...>
}

@field_11_flags_res@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)((char *)local_1c + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (((ushort *)local_1c)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (((ushort *)local_1c)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)local_1c >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)local_1c & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)(local_1c + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)(local_1c + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], *local_1c) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], *local_1c) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(byte *)((char *)local_1c + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(byte *)((char *)local_1c + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)local_1c)->flags_res
)
...>
}

@field_11_enchanted@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (((ushort *)local_1c)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (((ushort *)local_1c)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)local_1c >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)local_1c & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)(local_1c + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)(local_1c + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], *local_1c) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], *local_1c) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(byte *)((char *)local_1c + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(byte *)((char *)local_1c + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)local_1c)->enchanted
)
...>
}

@field_11_doordir@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (((ushort *)local_1c)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (((ushort *)local_1c)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)local_1c >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)local_1c & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)(local_1c + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)(local_1c + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], *local_1c) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], *local_1c) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(byte *)((char *)local_1c + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(byte *)((char *)local_1c + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)local_1c)->doordir
)
...>
}

@field_11_invisible@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (((ushort *)local_1c)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (((ushort *)local_1c)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)local_1c >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)local_1c & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)(local_1c + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)(local_1c + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], *local_1c) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], *local_1c) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(byte *)((char *)local_1c + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(byte *)((char *)local_1c + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)local_1c)->invisible
)
...>
}

@field_11_is_quant@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (((ushort *)local_1c)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (((ushort *)local_1c)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)local_1c >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)local_1c & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)(local_1c + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)(local_1c + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], *local_1c) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], *local_1c) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(byte *)((char *)local_1c + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(byte *)((char *)local_1c + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)local_1c)->is_quant
)
...>
}

@field_11_zpos@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- ((ushort *)local_1c)[1] & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- *(ushort *)(local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- *(byte *)((char *)local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- local_1c[2] & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
)
...>
}

@field_11_heading@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (*(ushort *)((char *)local_1c + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (((ushort *)local_1c)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (((ushort *)local_1c)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (*(ushort *)(local_1c + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (*(ushort *)(local_1c + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_1c)->heading
)
...>
}

@field_11_ypos@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(ushort *)((char *)local_1c + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (((ushort *)local_1c)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (((ushort *)local_1c)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(ushort *)(local_1c + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(ushort *)(local_1c + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(byte *)((char *)local_1c + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(byte *)((char *)local_1c + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)local_1c)->ypos
)
...>
}

@field_11_xpos@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(ushort *)((char *)local_1c + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (((ushort *)local_1c)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (((ushort *)local_1c)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(ushort *)(local_1c + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(ushort *)(local_1c + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(byte *)((char *)local_1c + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(byte *)((char *)local_1c + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)local_1c)->xpos
)
...>
}

@field_11_quality@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- ((ushort *)local_1c)[2] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- *(ushort *)(local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- *(byte *)((char *)local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- local_1c[4] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
)
...>
}

@field_11_next@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->next
|
- (*(ushort *)((char *)local_1c + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->next
|
- (((ushort *)local_1c)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->next
|
- (((ushort *)local_1c)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->next
|
- (*(ushort *)(local_1c + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->next
|
- (*(ushort *)(local_1c + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->next
)
...>
}

@field_11_owner@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- ((ushort *)local_1c)[3] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- *(ushort *)(local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- *(byte *)((char *)local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- local_1c[6] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
)
...>
}

@field_11_link@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->link
|
- (*(ushort *)((char *)local_1c + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->link
|
- (((ushort *)local_1c)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->link
|
- (((ushort *)local_1c)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->link
|
- (*(ushort *)(local_1c + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->link
|
- (*(ushort *)(local_1c + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->link
)
...>
}

@field_12_item_id@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
|
- *(ushort *)(puVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
|
- CONCAT11(puVar5[1], *puVar5) & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
|
- CONCAT11(puVar5[1], puVar5[0]) & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->item_id
)
...>
}

@field_12_flags_res@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)(puVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (CONCAT11(puVar5[1], *puVar5) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (CONCAT11(puVar5[1], *puVar5) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (CONCAT11(puVar5[1], puVar5[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (CONCAT11(puVar5[1], puVar5[0]) & 0xe00) >> 9
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

@field_12_enchanted@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)(puVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (CONCAT11(puVar5[1], *puVar5) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (CONCAT11(puVar5[1], *puVar5) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (CONCAT11(puVar5[1], puVar5[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (CONCAT11(puVar5[1], puVar5[0]) & 0x1000) >> 12
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

@field_12_doordir@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)(puVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (CONCAT11(puVar5[1], *puVar5) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (CONCAT11(puVar5[1], *puVar5) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (CONCAT11(puVar5[1], puVar5[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (CONCAT11(puVar5[1], puVar5[0]) & 0x2000) >> 13
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

@field_12_invisible@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)(puVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (CONCAT11(puVar5[1], *puVar5) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (CONCAT11(puVar5[1], *puVar5) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (CONCAT11(puVar5[1], puVar5[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (CONCAT11(puVar5[1], puVar5[0]) & 0x4000) >> 14
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

@field_12_is_quant@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)(puVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (CONCAT11(puVar5[1], *puVar5) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (CONCAT11(puVar5[1], *puVar5) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (CONCAT11(puVar5[1], puVar5[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (CONCAT11(puVar5[1], puVar5[0]) & 0x8000) >> 15
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

@field_12_zpos@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- *(ushort *)(puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- *(byte *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- puVar5[2] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
)
...>
}

@field_12_heading@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
|
- (*(ushort *)(puVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (*(ushort *)(puVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
)
...>
}

@field_12_ypos@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(ushort *)(puVar5 + 0x2) & 0x1c00) >> 10
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

@field_12_xpos@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(ushort *)(puVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(ushort *)(puVar5 + 0x2) & 0xe000) >> 13
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

@field_12_quality@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- *(ushort *)(puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- *(byte *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- puVar5[4] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
)
...>
}

@field_12_next@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
|
- (*(ushort *)(puVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (*(ushort *)(puVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
)
...>
}

@field_12_owner@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- *(ushort *)(puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- *(byte *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- puVar5[6] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
)
...>
}

@field_12_link@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
|
- (*(ushort *)(puVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (*(ushort *)(puVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
)
...>
}

@field_13_item_id@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- ((ushort *)puVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- *(ushort *)puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- *(ushort *)(puVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- CONCAT11(puVar6[1], *puVar6) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
|
- CONCAT11(puVar6[1], puVar6[0]) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->item_id
)
...>
}

@field_13_flags_res@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)(puVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)(puVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (CONCAT11(puVar6[1], *puVar6) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (CONCAT11(puVar6[1], *puVar6) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (CONCAT11(puVar6[1], puVar6[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (CONCAT11(puVar6[1], puVar6[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar6)->flags_res
)
...>
}

@field_13_enchanted@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)(puVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)(puVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (CONCAT11(puVar6[1], *puVar6) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (CONCAT11(puVar6[1], *puVar6) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (CONCAT11(puVar6[1], puVar6[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (CONCAT11(puVar6[1], puVar6[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar6)->enchanted
)
...>
}

@field_13_doordir@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)(puVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)(puVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (CONCAT11(puVar6[1], *puVar6) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (CONCAT11(puVar6[1], *puVar6) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (CONCAT11(puVar6[1], puVar6[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (CONCAT11(puVar6[1], puVar6[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar6)->doordir
)
...>
}

@field_13_invisible@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)(puVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)(puVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (CONCAT11(puVar6[1], *puVar6) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (CONCAT11(puVar6[1], *puVar6) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (CONCAT11(puVar6[1], puVar6[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (CONCAT11(puVar6[1], puVar6[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar6)->invisible
)
...>
}

@field_13_is_quant@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)(puVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)(puVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (CONCAT11(puVar6[1], *puVar6) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (CONCAT11(puVar6[1], *puVar6) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (CONCAT11(puVar6[1], puVar6[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (CONCAT11(puVar6[1], puVar6[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
)
...>
}

@field_13_zpos@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- ((ushort *)puVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- *(ushort *)(puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- *(byte *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- puVar6[2] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
)
...>
}

@field_13_heading@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (*(ushort *)(puVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (*(ushort *)(puVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
)
...>
}

@field_13_ypos@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(ushort *)(puVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(ushort *)(puVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar6)->ypos
)
...>
}

@field_13_xpos@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(ushort *)(puVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(ushort *)(puVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
)
...>
}

@field_13_quality@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- ((ushort *)puVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- *(ushort *)(puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- *(byte *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- puVar6[4] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
)
...>
}

@field_13_next@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (*(ushort *)((char *)puVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (*(ushort *)(puVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (*(ushort *)(puVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
)
...>
}

@field_13_owner@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- ((ushort *)puVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- *(ushort *)(puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- *(byte *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- puVar6[6] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
)
...>
}

@field_13_link@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (*(ushort *)((char *)puVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (*(ushort *)(puVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (*(ushort *)(puVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
)
...>
}

@field_14_item_id@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- ((ushort *)puVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- *(ushort *)puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- puVar2[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
|
- *puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->item_id
)
...>
}

@field_14_flags_res@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (puVar2[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (puVar2[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar2)->flags_res
)
...>
}

@field_14_enchanted@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (puVar2[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (puVar2[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar2)->enchanted
)
...>
}

@field_14_doordir@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (puVar2[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (puVar2[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar2)->doordir
)
...>
}

@field_14_invisible@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (puVar2[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (puVar2[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar2)->invisible
)
...>
}

@field_14_is_quant@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(ushort *)((char *)puVar2 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- ((ushort *)puVar2)[0] >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(ushort *)puVar2 >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (puVar2[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (puVar2[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- puVar2[0] >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *puVar2 >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
)
...>
}

@field_14_zpos@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- ((ushort *)puVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- puVar2[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- *(byte *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- (byte)puVar2[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
)
...>
}

@field_14_heading@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (puVar2[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (puVar2[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
)
...>
}

@field_14_ypos@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (puVar2[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (puVar2[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar2)->ypos
)
...>
}

@field_14_xpos@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- *(ushort *)((char *)puVar2 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- ((ushort *)puVar2)[1] >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (puVar2[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (puVar2[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- puVar2[1] >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
)
...>
}

@field_14_quality@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- ((ushort *)puVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- puVar2[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- *(byte *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- (byte)puVar2[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
)
...>
}

@field_14_next@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (*(ushort *)((char *)puVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- *(ushort *)((char *)puVar2 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- ((ushort *)puVar2)[2] >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (puVar2[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (puVar2[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- puVar2[2] >> 6
+ ((uw_object_hdr_t *)puVar2)->next
)
...>
}

@field_14_owner@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- ((ushort *)puVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- puVar2[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- *(byte *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- (byte)puVar2[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
)
...>
}

@field_14_link@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (*(ushort *)((char *)puVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- *(ushort *)((char *)puVar2 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- ((ushort *)puVar2)[3] >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (puVar2[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (puVar2[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- puVar2[3] >> 6
+ ((uw_object_hdr_t *)puVar2)->link
)
...>
}

@field_15_item_id@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->item_id
|
- ((ushort *)pbVar10)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->item_id
|
- *(ushort *)pbVar10 & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->item_id
|
- *(ushort *)(pbVar10 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->item_id
|
- CONCAT11(pbVar10[1], *pbVar10) & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->item_id
|
- CONCAT11(pbVar10[1], pbVar10[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->item_id
)
...>
}

@field_15_flags_res@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (((ushort *)pbVar10)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (((ushort *)pbVar10)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)pbVar10 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)pbVar10 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)(pbVar10 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)(pbVar10 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (CONCAT11(pbVar10[1], *pbVar10) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (CONCAT11(pbVar10[1], *pbVar10) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (CONCAT11(pbVar10[1], pbVar10[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (CONCAT11(pbVar10[1], pbVar10[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar10)->flags_res
)
...>
}

@field_15_enchanted@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (((ushort *)pbVar10)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (((ushort *)pbVar10)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)pbVar10 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)pbVar10 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)(pbVar10 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)(pbVar10 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (CONCAT11(pbVar10[1], *pbVar10) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (CONCAT11(pbVar10[1], *pbVar10) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (CONCAT11(pbVar10[1], pbVar10[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (CONCAT11(pbVar10[1], pbVar10[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar10)->enchanted
)
...>
}

@field_15_doordir@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (((ushort *)pbVar10)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (((ushort *)pbVar10)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)pbVar10 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)pbVar10 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)(pbVar10 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)(pbVar10 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (CONCAT11(pbVar10[1], *pbVar10) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (CONCAT11(pbVar10[1], *pbVar10) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (CONCAT11(pbVar10[1], pbVar10[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (CONCAT11(pbVar10[1], pbVar10[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar10)->doordir
)
...>
}

@field_15_invisible@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (((ushort *)pbVar10)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (((ushort *)pbVar10)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)pbVar10 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)pbVar10 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)(pbVar10 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)(pbVar10 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (CONCAT11(pbVar10[1], *pbVar10) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (CONCAT11(pbVar10[1], *pbVar10) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (CONCAT11(pbVar10[1], pbVar10[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (CONCAT11(pbVar10[1], pbVar10[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar10)->invisible
)
...>
}

@field_15_is_quant@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (((ushort *)pbVar10)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (((ushort *)pbVar10)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)pbVar10 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)pbVar10 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)(pbVar10 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)(pbVar10 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (CONCAT11(pbVar10[1], *pbVar10) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (CONCAT11(pbVar10[1], *pbVar10) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (CONCAT11(pbVar10[1], pbVar10[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (CONCAT11(pbVar10[1], pbVar10[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar10)->is_quant
)
...>
}

@field_15_zpos@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
|
- ((ushort *)pbVar10)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
|
- *(ushort *)(pbVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
|
- *(byte *)((char *)pbVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
|
- pbVar10[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
)
...>
}

@field_15_heading@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (*(ushort *)((char *)pbVar10 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (((ushort *)pbVar10)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (((ushort *)pbVar10)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (*(ushort *)(pbVar10 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (*(ushort *)(pbVar10 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar10)->heading
)
...>
}

@field_15_ypos@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(ushort *)((char *)pbVar10 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (((ushort *)pbVar10)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (((ushort *)pbVar10)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(ushort *)(pbVar10 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(ushort *)(pbVar10 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(byte *)((char *)pbVar10 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(byte *)((char *)pbVar10 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar10)->ypos
)
...>
}

@field_15_xpos@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(ushort *)((char *)pbVar10 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (((ushort *)pbVar10)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (((ushort *)pbVar10)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(ushort *)(pbVar10 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(ushort *)(pbVar10 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(byte *)((char *)pbVar10 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(byte *)((char *)pbVar10 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar10)->xpos
)
...>
}

@field_15_quality@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
|
- ((ushort *)pbVar10)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
|
- *(ushort *)(pbVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
|
- *(byte *)((char *)pbVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
|
- pbVar10[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
)
...>
}

@field_15_next@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (*(ushort *)((char *)pbVar10 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (((ushort *)pbVar10)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (((ushort *)pbVar10)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (*(ushort *)(pbVar10 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (*(ushort *)(pbVar10 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->next
)
...>
}

@field_15_owner@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
|
- ((ushort *)pbVar10)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
|
- *(ushort *)(pbVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
|
- *(byte *)((char *)pbVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
|
- pbVar10[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
)
...>
}

@field_15_link@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (*(ushort *)((char *)pbVar10 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (((ushort *)pbVar10)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (((ushort *)pbVar10)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (*(ushort *)(pbVar10 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (*(ushort *)(pbVar10 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->link
)
...>
}

@field_16_item_id@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->item_id
|
- ((ushort *)local_28)[0] & 0x1ff
+ ((uw_object_hdr_t *)local_28)->item_id
|
- *(ushort *)local_28 & 0x1ff
+ ((uw_object_hdr_t *)local_28)->item_id
|
- *(ushort *)(local_28 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->item_id
|
- CONCAT11(local_28[1], *local_28) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->item_id
|
- CONCAT11(local_28[1], local_28[0]) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->item_id
)
...>
}

@field_16_flags_res@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)((char *)local_28 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (((ushort *)local_28)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (((ushort *)local_28)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)local_28 >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)local_28 & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)(local_28 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)(local_28 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], *local_28) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], *local_28) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], local_28[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], local_28[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(byte *)((char *)local_28 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(byte *)((char *)local_28 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)local_28)->flags_res
)
...>
}

@field_16_enchanted@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (((ushort *)local_28)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (((ushort *)local_28)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)local_28 >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)local_28 & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)(local_28 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)(local_28 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], *local_28) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], *local_28) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], local_28[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], local_28[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(byte *)((char *)local_28 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(byte *)((char *)local_28 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)local_28)->enchanted
)
...>
}

@field_16_doordir@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (((ushort *)local_28)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (((ushort *)local_28)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)local_28 >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)local_28 & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)(local_28 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)(local_28 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], *local_28) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], *local_28) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], local_28[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], local_28[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(byte *)((char *)local_28 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(byte *)((char *)local_28 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)local_28)->doordir
)
...>
}

@field_16_invisible@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (((ushort *)local_28)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (((ushort *)local_28)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)local_28 >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)local_28 & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)(local_28 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)(local_28 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], *local_28) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], *local_28) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], local_28[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], local_28[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(byte *)((char *)local_28 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(byte *)((char *)local_28 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)local_28)->invisible
)
...>
}

@field_16_is_quant@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (((ushort *)local_28)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (((ushort *)local_28)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)local_28 >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)local_28 & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)(local_28 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)(local_28 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], *local_28) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], *local_28) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], local_28[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], local_28[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(byte *)((char *)local_28 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(byte *)((char *)local_28 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)local_28)->is_quant
)
...>
}

@field_16_zpos@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- ((ushort *)local_28)[1] & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- *(ushort *)(local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- *(byte *)((char *)local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- local_28[2] & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
)
...>
}

@field_16_heading@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (*(ushort *)((char *)local_28 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (((ushort *)local_28)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (((ushort *)local_28)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (*(ushort *)(local_28 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (*(ushort *)(local_28 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_28)->heading
)
...>
}

@field_16_ypos@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(ushort *)((char *)local_28 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (((ushort *)local_28)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (((ushort *)local_28)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(ushort *)(local_28 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(ushort *)(local_28 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(byte *)((char *)local_28 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(byte *)((char *)local_28 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)local_28)->ypos
)
...>
}

@field_16_xpos@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(ushort *)((char *)local_28 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (((ushort *)local_28)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (((ushort *)local_28)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(ushort *)(local_28 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(ushort *)(local_28 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(byte *)((char *)local_28 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(byte *)((char *)local_28 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)local_28)->xpos
)
...>
}

@field_16_quality@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- ((ushort *)local_28)[2] & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- *(ushort *)(local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- *(byte *)((char *)local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- local_28[4] & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
)
...>
}

@field_16_next@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->next
|
- (*(ushort *)((char *)local_28 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->next
|
- (((ushort *)local_28)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->next
|
- (((ushort *)local_28)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->next
|
- (*(ushort *)(local_28 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->next
|
- (*(ushort *)(local_28 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->next
)
...>
}

@field_16_owner@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- ((ushort *)local_28)[3] & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- *(ushort *)(local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- *(byte *)((char *)local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- local_28[6] & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
)
...>
}

@field_16_link@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->link
|
- (*(ushort *)((char *)local_28 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->link
|
- (((ushort *)local_28)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->link
|
- (((ushort *)local_28)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->link
|
- (*(ushort *)(local_28 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->link
|
- (*(ushort *)(local_28 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->link
)
...>
}

@field_17_item_id@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_flags_res@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_enchanted@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_doordir@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_invisible@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_is_quant@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_zpos@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_heading@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_ypos@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_xpos@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_quality@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_next@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_owner@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_17_link@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@field_18_item_id@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->item_id
|
- ((ushort *)slot_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->item_id
|
- *(ushort *)slot_item & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->item_id
)
...>
}

@field_18_flags_res@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)((char *)slot_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (((ushort *)slot_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (((ushort *)slot_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)slot_item >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)slot_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(byte *)((char *)slot_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(byte *)((char *)slot_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)slot_item)->flags_res
)
...>
}

@field_18_enchanted@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (((ushort *)slot_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (((ushort *)slot_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)slot_item >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)slot_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(byte *)((char *)slot_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(byte *)((char *)slot_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)slot_item)->enchanted
)
...>
}

@field_18_doordir@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (((ushort *)slot_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (((ushort *)slot_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)slot_item >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)slot_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(byte *)((char *)slot_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(byte *)((char *)slot_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)slot_item)->doordir
)
...>
}

@field_18_invisible@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (((ushort *)slot_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (((ushort *)slot_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)slot_item >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)slot_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(byte *)((char *)slot_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(byte *)((char *)slot_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)slot_item)->invisible
)
...>
}

@field_18_is_quant@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (((ushort *)slot_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (((ushort *)slot_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)slot_item >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)slot_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(byte *)((char *)slot_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(byte *)((char *)slot_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)slot_item)->is_quant
)
...>
}

@field_18_zpos@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
|
- ((ushort *)slot_item)[1] & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
|
- *(byte *)((char *)slot_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
)
...>
}

@field_18_heading@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (*(ushort *)((char *)slot_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (((ushort *)slot_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (((ushort *)slot_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)slot_item)->heading
)
...>
}

@field_18_ypos@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(ushort *)((char *)slot_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (((ushort *)slot_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (((ushort *)slot_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(byte *)((char *)slot_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(byte *)((char *)slot_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)slot_item)->ypos
)
...>
}

@field_18_xpos@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(ushort *)((char *)slot_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (((ushort *)slot_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (((ushort *)slot_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(byte *)((char *)slot_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(byte *)((char *)slot_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)slot_item)->xpos
)
...>
}

@field_18_quality@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
|
- ((ushort *)slot_item)[2] & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
|
- *(byte *)((char *)slot_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
)
...>
}

@field_18_next@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->next
|
- (*(ushort *)((char *)slot_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->next
|
- (((ushort *)slot_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->next
|
- (((ushort *)slot_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->next
)
...>
}

@field_18_owner@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
|
- ((ushort *)slot_item)[3] & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
|
- *(byte *)((char *)slot_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
)
...>
}

@field_18_link@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->link
|
- (*(ushort *)((char *)slot_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->link
|
- (((ushort *)slot_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->link
|
- (((ushort *)slot_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->link
)
...>
}

@field_19_item_id@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- ((ushort *)iVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- *(ushort *)iVar4 & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- *(ushort *)(iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- CONCAT11(iVar4[1], *iVar4) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- CONCAT11(iVar4[1], iVar4[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
)
...>
}

@field_19_flags_res@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)(iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)(iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], *iVar4) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], *iVar4) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
)
...>
}

@field_19_enchanted@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)(iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)(iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], *iVar4) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], *iVar4) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
)
...>
}

@field_19_doordir@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)(iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)(iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], *iVar4) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], *iVar4) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
)
...>
}

@field_19_invisible@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)(iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)(iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], *iVar4) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], *iVar4) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
)
...>
}

@field_19_is_quant@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)(iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)(iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], *iVar4) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], *iVar4) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
)
...>
}

@field_19_zpos@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- ((ushort *)iVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(ushort *)(iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- iVar4[2] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
)
...>
}

@field_19_heading@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)(iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)(iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
)
...>
}

@field_19_ypos@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)(iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)(iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
)
...>
}

@field_19_xpos@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)(iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)(iVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
)
...>
}

@field_19_quality@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- ((ushort *)iVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(ushort *)(iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- iVar4[4] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
)
...>
}

@field_19_next@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)((char *)iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)(iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)(iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
)
...>
}

@field_19_owner@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- ((ushort *)iVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(ushort *)(iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- iVar4[6] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
)
...>
}

@field_19_link@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)((char *)iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)(iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)(iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
)
...>
}

@field_20_item_id@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_flags_res@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_enchanted@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_doordir@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_invisible@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_is_quant@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_zpos@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_heading@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_ypos@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_xpos@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_quality@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_next@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_owner@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_20_link@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@field_21_item_id@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- ((ushort *)iVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- *(ushort *)iVar4 & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- iVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
|
- *iVar4 & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->item_id
)
...>
}

@field_21_flags_res@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (iVar4[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (iVar4[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*iVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*iVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
)
...>
}

@field_21_enchanted@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (iVar4[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (iVar4[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*iVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*iVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
)
...>
}

@field_21_doordir@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (iVar4[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (iVar4[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*iVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*iVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
)
...>
}

@field_21_invisible@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (iVar4[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (iVar4[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*iVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*iVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
)
...>
}

@field_21_is_quant@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(ushort *)((char *)iVar4 + 0x0) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- ((ushort *)iVar4)[0] >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(ushort *)iVar4 >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (iVar4[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (iVar4[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- iVar4[0] >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *iVar4 >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
)
...>
}

@field_21_zpos@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- ((ushort *)iVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- iVar4[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- (byte)iVar4[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
)
...>
}

@field_21_heading@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (iVar4[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (iVar4[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
)
...>
}

@field_21_ypos@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (iVar4[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (iVar4[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
)
...>
}

@field_21_xpos@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- *(ushort *)((char *)iVar4 + 0x2) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- ((ushort *)iVar4)[1] >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (iVar4[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (iVar4[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- iVar4[1] >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
)
...>
}

@field_21_quality@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- ((ushort *)iVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- iVar4[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- (byte)iVar4[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
)
...>
}

@field_21_next@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)((char *)iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- *(ushort *)((char *)iVar4 + 0x4) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- ((ushort *)iVar4)[2] >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (iVar4[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (iVar4[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- iVar4[2] >> 6
+ ((uw_object_hdr_t *)iVar4)->next
)
...>
}

@field_21_owner@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- ((ushort *)iVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- iVar4[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- (byte)iVar4[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
)
...>
}

@field_21_link@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)((char *)iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- *(ushort *)((char *)iVar4 + 0x6) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- ((ushort *)iVar4)[3] >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (iVar4[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (iVar4[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- iVar4[3] >> 6
+ ((uw_object_hdr_t *)iVar4)->link
)
...>
}

@field_22_item_id@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->item_id
|
- ((ushort *)puVar11)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->item_id
|
- *(ushort *)puVar11 & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->item_id
|
- puVar11[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->item_id
|
- *puVar11 & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->item_id
)
...>
}

@field_22_flags_res@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (((ushort *)puVar11)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (((ushort *)puVar11)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(ushort *)puVar11 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(ushort *)puVar11 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (puVar11[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (puVar11[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*puVar11 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*puVar11 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(byte *)((char *)puVar11 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(byte *)((char *)puVar11 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar11)->flags_res
)
...>
}

@field_22_enchanted@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (((ushort *)puVar11)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (((ushort *)puVar11)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(ushort *)puVar11 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(ushort *)puVar11 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (puVar11[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (puVar11[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*puVar11 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*puVar11 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(byte *)((char *)puVar11 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar11)->enchanted
)
...>
}

@field_22_doordir@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (((ushort *)puVar11)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (((ushort *)puVar11)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(ushort *)puVar11 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(ushort *)puVar11 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (puVar11[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (puVar11[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*puVar11 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*puVar11 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(byte *)((char *)puVar11 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar11)->doordir
)
...>
}

@field_22_invisible@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (((ushort *)puVar11)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (((ushort *)puVar11)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(ushort *)puVar11 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(ushort *)puVar11 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (puVar11[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (puVar11[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*puVar11 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*puVar11 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(byte *)((char *)puVar11 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar11)->invisible
)
...>
}

@field_22_is_quant@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- *(ushort *)((char *)puVar11 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (((ushort *)puVar11)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (((ushort *)puVar11)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- ((ushort *)puVar11)[0] >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(ushort *)puVar11 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(ushort *)puVar11 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- *(ushort *)puVar11 >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (puVar11[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (puVar11[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- puVar11[0] >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*puVar11 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*puVar11 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- *puVar11 >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(byte *)((char *)puVar11 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar11)->is_quant
)
...>
}

@field_22_zpos@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
|
- ((ushort *)puVar11)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
|
- puVar11[1] & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
|
- *(byte *)((char *)puVar11 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
|
- (byte)puVar11[1] & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
)
...>
}

@field_22_heading@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (*(ushort *)((char *)puVar11 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (((ushort *)puVar11)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (((ushort *)puVar11)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (puVar11[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (puVar11[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11)->heading
)
...>
}

@field_22_ypos@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (*(ushort *)((char *)puVar11 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (((ushort *)puVar11)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (((ushort *)puVar11)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (puVar11[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (puVar11[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (*(byte *)((char *)puVar11 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (*(byte *)((char *)puVar11 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar11)->ypos
)
...>
}

@field_22_xpos@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (*(ushort *)((char *)puVar11 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- *(ushort *)((char *)puVar11 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (((ushort *)puVar11)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (((ushort *)puVar11)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- ((ushort *)puVar11)[1] >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (puVar11[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (puVar11[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- puVar11[1] >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (*(byte *)((char *)puVar11 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (*(byte *)((char *)puVar11 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar11)->xpos
)
...>
}

@field_22_quality@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
|
- ((ushort *)puVar11)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
|
- puVar11[2] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
|
- *(byte *)((char *)puVar11 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
|
- (byte)puVar11[2] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
)
...>
}

@field_22_next@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->next
|
- (*(ushort *)((char *)puVar11 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->next
|
- *(ushort *)((char *)puVar11 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar11)->next
|
- (((ushort *)puVar11)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->next
|
- (((ushort *)puVar11)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->next
|
- ((ushort *)puVar11)[2] >> 6
+ ((uw_object_hdr_t *)puVar11)->next
|
- (puVar11[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->next
|
- (puVar11[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->next
|
- puVar11[2] >> 6
+ ((uw_object_hdr_t *)puVar11)->next
)
...>
}

@field_22_owner@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
|
- ((ushort *)puVar11)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
|
- puVar11[3] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
|
- *(byte *)((char *)puVar11 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
|
- (byte)puVar11[3] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
)
...>
}

@field_22_link@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->link
|
- (*(ushort *)((char *)puVar11 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->link
|
- *(ushort *)((char *)puVar11 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar11)->link
|
- (((ushort *)puVar11)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->link
|
- (((ushort *)puVar11)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->link
|
- ((ushort *)puVar11)[3] >> 6
+ ((uw_object_hdr_t *)puVar11)->link
|
- (puVar11[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->link
|
- (puVar11[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->link
|
- puVar11[3] >> 6
+ ((uw_object_hdr_t *)puVar11)->link
)
...>
}

@field_23_item_id@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->item_id
|
- ((ushort *)pbVar13)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->item_id
|
- *(ushort *)pbVar13 & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->item_id
|
- *(ushort *)(pbVar13 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->item_id
|
- CONCAT11(pbVar13[1], *pbVar13) & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->item_id
|
- CONCAT11(pbVar13[1], pbVar13[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->item_id
)
...>
}

@field_23_flags_res@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (((ushort *)pbVar13)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (((ushort *)pbVar13)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)pbVar13 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)pbVar13 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)(pbVar13 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)(pbVar13 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (CONCAT11(pbVar13[1], *pbVar13) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (CONCAT11(pbVar13[1], *pbVar13) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (CONCAT11(pbVar13[1], pbVar13[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (CONCAT11(pbVar13[1], pbVar13[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar13)->flags_res
)
...>
}

@field_23_enchanted@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (((ushort *)pbVar13)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (((ushort *)pbVar13)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)pbVar13 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)pbVar13 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)(pbVar13 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)(pbVar13 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (CONCAT11(pbVar13[1], *pbVar13) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (CONCAT11(pbVar13[1], *pbVar13) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (CONCAT11(pbVar13[1], pbVar13[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (CONCAT11(pbVar13[1], pbVar13[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar13)->enchanted
)
...>
}

@field_23_doordir@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (((ushort *)pbVar13)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (((ushort *)pbVar13)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)pbVar13 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)pbVar13 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)(pbVar13 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)(pbVar13 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (CONCAT11(pbVar13[1], *pbVar13) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (CONCAT11(pbVar13[1], *pbVar13) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (CONCAT11(pbVar13[1], pbVar13[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (CONCAT11(pbVar13[1], pbVar13[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar13)->doordir
)
...>
}

@field_23_invisible@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (((ushort *)pbVar13)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (((ushort *)pbVar13)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)pbVar13 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)pbVar13 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)(pbVar13 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)(pbVar13 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (CONCAT11(pbVar13[1], *pbVar13) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (CONCAT11(pbVar13[1], *pbVar13) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (CONCAT11(pbVar13[1], pbVar13[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (CONCAT11(pbVar13[1], pbVar13[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar13)->invisible
)
...>
}

@field_23_is_quant@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (((ushort *)pbVar13)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (((ushort *)pbVar13)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)pbVar13 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)pbVar13 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)(pbVar13 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)(pbVar13 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (CONCAT11(pbVar13[1], *pbVar13) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (CONCAT11(pbVar13[1], *pbVar13) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (CONCAT11(pbVar13[1], pbVar13[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (CONCAT11(pbVar13[1], pbVar13[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar13)->is_quant
)
...>
}

@field_23_zpos@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
|
- ((ushort *)pbVar13)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
|
- *(ushort *)(pbVar13 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
|
- *(byte *)((char *)pbVar13 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
|
- pbVar13[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
)
...>
}

@field_23_heading@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (*(ushort *)((char *)pbVar13 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (((ushort *)pbVar13)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (((ushort *)pbVar13)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (*(ushort *)(pbVar13 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (*(ushort *)(pbVar13 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar13)->heading
)
...>
}

@field_23_ypos@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(ushort *)((char *)pbVar13 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (((ushort *)pbVar13)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (((ushort *)pbVar13)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(ushort *)(pbVar13 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(ushort *)(pbVar13 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(byte *)((char *)pbVar13 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(byte *)((char *)pbVar13 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar13)->ypos
)
...>
}

@field_23_xpos@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(ushort *)((char *)pbVar13 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (((ushort *)pbVar13)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (((ushort *)pbVar13)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(ushort *)(pbVar13 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(ushort *)(pbVar13 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(byte *)((char *)pbVar13 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(byte *)((char *)pbVar13 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar13)->xpos
)
...>
}

@field_23_quality@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
|
- ((ushort *)pbVar13)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
|
- *(ushort *)(pbVar13 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
|
- *(byte *)((char *)pbVar13 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
|
- pbVar13[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
)
...>
}

@field_23_next@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (*(ushort *)((char *)pbVar13 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (((ushort *)pbVar13)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (((ushort *)pbVar13)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (*(ushort *)(pbVar13 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (*(ushort *)(pbVar13 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->next
)
...>
}

@field_23_owner@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
|
- ((ushort *)pbVar13)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
|
- *(ushort *)(pbVar13 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
|
- *(byte *)((char *)pbVar13 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
|
- pbVar13[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
)
...>
}

@field_23_link@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (*(ushort *)((char *)pbVar13 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (((ushort *)pbVar13)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (((ushort *)pbVar13)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (*(ushort *)(pbVar13 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (*(ushort *)(pbVar13 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->link
)
...>
}
