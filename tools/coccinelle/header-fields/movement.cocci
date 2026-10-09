@field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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
|
- *(byte *)((char *)puVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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
|
- *(byte *)((char *)puVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
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

@field_1_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)psVar3)->item_id
|
- ((ushort *)psVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)psVar3)->item_id
|
- *(ushort *)psVar3 & 0x1ff
+ ((uw_object_hdr_t *)psVar3)->item_id
|
- psVar3[0] & 0x1ff
+ ((uw_object_hdr_t *)psVar3)->item_id
|
- *psVar3 & 0x1ff
+ ((uw_object_hdr_t *)psVar3)->item_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*(ushort *)((char *)psVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (((ushort *)psVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (((ushort *)psVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*(ushort *)psVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*(ushort *)psVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (psVar3[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (psVar3[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*psVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*psVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*(byte *)((char *)psVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)psVar3)->flags_res
|
- (*(byte *)((char *)psVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)psVar3)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*(ushort *)((char *)psVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (((ushort *)psVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (((ushort *)psVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*(ushort *)psVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*(ushort *)psVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (psVar3[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (psVar3[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*psVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*psVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*(byte *)((char *)psVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)psVar3)->enchanted
|
- (*(byte *)((char *)psVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)psVar3)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*(ushort *)((char *)psVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (((ushort *)psVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (((ushort *)psVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*(ushort *)psVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*(ushort *)psVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (psVar3[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (psVar3[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*psVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*psVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*(byte *)((char *)psVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)psVar3)->doordir
|
- (*(byte *)((char *)psVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)psVar3)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*(ushort *)((char *)psVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (((ushort *)psVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (((ushort *)psVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*(ushort *)psVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*(ushort *)psVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (psVar3[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (psVar3[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*psVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*psVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*(byte *)((char *)psVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)psVar3)->invisible
|
- (*(byte *)((char *)psVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)psVar3)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*(ushort *)((char *)psVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (((ushort *)psVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (((ushort *)psVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*(ushort *)psVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*(ushort *)psVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (psVar3[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (psVar3[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*psVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*psVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*(byte *)((char *)psVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- (*(byte *)((char *)psVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)psVar3)->is_quant
|
- *(byte *)((char *)psVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)psVar3)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)psVar3)->zpos
|
- ((ushort *)psVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)psVar3)->zpos
|
- psVar3[1] & 0x7f
+ ((uw_object_hdr_t *)psVar3)->zpos
|
- *(byte *)((char *)psVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)psVar3)->zpos
|
- (byte)psVar3[1] & 0x7f
+ ((uw_object_hdr_t *)psVar3)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar3)->heading
|
- (*(ushort *)((char *)psVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar3)->heading
|
- (((ushort *)psVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar3)->heading
|
- (((ushort *)psVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar3)->heading
|
- (psVar3[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar3)->heading
|
- (psVar3[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar3)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (*(ushort *)((char *)psVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (((ushort *)psVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (((ushort *)psVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (psVar3[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (psVar3[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (*(byte *)((char *)psVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)psVar3)->ypos
|
- (*(byte *)((char *)psVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)psVar3)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (*(ushort *)((char *)psVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (((ushort *)psVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (((ushort *)psVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (psVar3[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (psVar3[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (*(byte *)((char *)psVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- (*(byte *)((char *)psVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)psVar3)->xpos
|
- *(byte *)((char *)psVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)psVar3)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)psVar3)->quality
|
- ((ushort *)psVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)psVar3)->quality
|
- psVar3[2] & 0x3f
+ ((uw_object_hdr_t *)psVar3)->quality
|
- *(byte *)((char *)psVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)psVar3)->quality
|
- (byte)psVar3[2] & 0x3f
+ ((uw_object_hdr_t *)psVar3)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar3)->next
|
- (*(ushort *)((char *)psVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar3)->next
|
- (((ushort *)psVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar3)->next
|
- (((ushort *)psVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar3)->next
|
- (psVar3[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar3)->next
|
- (psVar3[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar3)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)psVar3)->owner
|
- ((ushort *)psVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)psVar3)->owner
|
- psVar3[3] & 0x3f
+ ((uw_object_hdr_t *)psVar3)->owner
|
- *(byte *)((char *)psVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)psVar3)->owner
|
- (byte)psVar3[3] & 0x3f
+ ((uw_object_hdr_t *)psVar3)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar3)->link
|
- (*(ushort *)((char *)psVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar3)->link
|
- (((ushort *)psVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar3)->link
|
- (((ushort *)psVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar3)->link
|
- (psVar3[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar3)->link
|
- (psVar3[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar3)->link
)
...>
}

@field_2_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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
|
- *(byte *)((char *)puVar7 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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
|
- *(byte *)((char *)puVar7 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@field_3_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
|
- ((ushort *)uVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
|
- *(ushort *)uVar4 & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
|
- *(ushort *)(uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->item_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)(uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)(uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)(uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)(uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)(uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)(uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)(uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)(uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)(uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)(uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)(uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)(uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)(uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)(uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)(uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)(uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)(uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)(uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)((char *)uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)(uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)(uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)(uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- ((ushort *)uVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(ushort *)(uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)(uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)(uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)(uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)(uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)(uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)(uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)(uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)(uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)(uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)((char *)uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)(uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)(uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)(uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- ((ushort *)uVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(ushort *)(uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)(uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)((char *)uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)(uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)(uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- ((ushort *)uVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(ushort *)(uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)(uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)((char *)uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)(uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)(uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
)
...>
}

@field_4_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->item_id
|
- ((ushort *)uVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->item_id
|
- *(ushort *)uVar1 & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->item_id
|
- *(ushort *)(uVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->item_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (((ushort *)uVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (((ushort *)uVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)uVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)uVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)(uVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)(uVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)((char *)uVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)((char *)uVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)(uVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)(uVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar1)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (((ushort *)uVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (((ushort *)uVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)uVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)uVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)(uVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)(uVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)((char *)uVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)(uVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)(uVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar1)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (((ushort *)uVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (((ushort *)uVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)uVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)uVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)(uVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)(uVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)((char *)uVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)(uVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)(uVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar1)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (((ushort *)uVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (((ushort *)uVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)uVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)uVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)(uVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)(uVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)((char *)uVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)(uVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)(uVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar1)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (((ushort *)uVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (((ushort *)uVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)uVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)uVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)(uVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)(uVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)((char *)uVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(byte *)((char *)uVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)(uVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)(uVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(byte *)(uVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- ((ushort *)uVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(ushort *)(uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(byte *)((char *)uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(byte *)(uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (((ushort *)uVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (((ushort *)uVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)(uVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)(uVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (((ushort *)uVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (((ushort *)uVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)(uVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)(uVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)((char *)uVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)((char *)uVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)(uVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)(uVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar1)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (((ushort *)uVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (((ushort *)uVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)(uVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)(uVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)((char *)uVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)((char *)uVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- *(byte *)((char *)uVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)(uVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)(uVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- *(byte *)(uVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- ((ushort *)uVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(ushort *)(uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(byte *)((char *)uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(byte *)(uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)((char *)uVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- (((ushort *)uVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (((ushort *)uVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)(uVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)(uVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- ((ushort *)uVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(ushort *)(uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(byte *)((char *)uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(byte *)(uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)((char *)uVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- (((ushort *)uVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (((ushort *)uVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)(uVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)(uVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
)
...>
}
