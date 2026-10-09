@field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_o)->item_id
|
- ((ushort *)_o)[0] & 0x1ff
+ ((uw_object_hdr_t *)_o)->item_id
|
- *(ushort *)_o & 0x1ff
+ ((uw_object_hdr_t *)_o)->item_id
|
- _o[0] & 0x1ff
+ ((uw_object_hdr_t *)_o)->item_id
|
- *_o & 0x1ff
+ ((uw_object_hdr_t *)_o)->item_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)((char *)_o + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (((ushort *)_o)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (((ushort *)_o)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)_o >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(ushort *)_o & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (_o[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (_o[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*_o >> 9) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*_o & 0xe00) >> 9
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(byte *)((char *)_o + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_o)->flags_res
|
- (*(byte *)((char *)_o + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_o)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)((char *)_o + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (((ushort *)_o)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (((ushort *)_o)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)_o >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(ushort *)_o & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (_o[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (_o[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*_o >> 12) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*_o & 0x1000) >> 12
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(byte *)((char *)_o + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_o)->enchanted
|
- (*(byte *)((char *)_o + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_o)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)((char *)_o + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (((ushort *)_o)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (((ushort *)_o)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)_o >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(ushort *)_o & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (_o[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (_o[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*_o >> 13) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*_o & 0x2000) >> 13
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(byte *)((char *)_o + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_o)->doordir
|
- (*(byte *)((char *)_o + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_o)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)((char *)_o + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (((ushort *)_o)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (((ushort *)_o)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)_o >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(ushort *)_o & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (_o[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (_o[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*_o >> 14) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*_o & 0x4000) >> 14
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(byte *)((char *)_o + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_o)->invisible
|
- (*(byte *)((char *)_o + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_o)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)((char *)_o + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- *(ushort *)((char *)_o + 0x0) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (((ushort *)_o)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (((ushort *)_o)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- ((ushort *)_o)[0] >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)_o >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(ushort *)_o & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- *(ushort *)_o >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (_o[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (_o[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- _o[0] >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*_o >> 15) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*_o & 0x8000) >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- *_o >> 15
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(byte *)((char *)_o + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_o)->is_quant
|
- (*(byte *)((char *)_o + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_o)->is_quant
|
- *(byte *)((char *)_o + 0x1) >> 7
+ ((uw_object_hdr_t *)_o)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- ((ushort *)_o)[1] & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- _o[1] & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- *(byte *)((char *)_o + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
|
- (byte)_o[1] & 0x7f
+ ((uw_object_hdr_t *)_o)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_o)->heading
|
- (*(ushort *)((char *)_o + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_o)->heading
|
- (((ushort *)_o)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_o)->heading
|
- (((ushort *)_o)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_o)->heading
|
- (_o[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_o)->heading
|
- (_o[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_o)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(ushort *)((char *)_o + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_o)->ypos
|
- (((ushort *)_o)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (((ushort *)_o)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_o)->ypos
|
- (_o[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (_o[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(byte *)((char *)_o + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_o)->ypos
|
- (*(byte *)((char *)_o + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_o)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(ushort *)((char *)_o + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- *(ushort *)((char *)_o + 0x2) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- (((ushort *)_o)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (((ushort *)_o)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- ((ushort *)_o)[1] >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- (_o[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (_o[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- _o[1] >> 13
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(byte *)((char *)_o + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_o)->xpos
|
- (*(byte *)((char *)_o + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_o)->xpos
|
- *(byte *)((char *)_o + 0x3) >> 5
+ ((uw_object_hdr_t *)_o)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- ((ushort *)_o)[2] & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- _o[2] & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- *(byte *)((char *)_o + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
|
- (byte)_o[2] & 0x3f
+ ((uw_object_hdr_t *)_o)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->next
|
- (*(ushort *)((char *)_o + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- *(ushort *)((char *)_o + 0x4) >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- (((ushort *)_o)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->next
|
- (((ushort *)_o)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- ((ushort *)_o)[2] >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- (_o[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->next
|
- (_o[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->next
|
- _o[2] >> 6
+ ((uw_object_hdr_t *)_o)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- ((ushort *)_o)[3] & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- _o[3] & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- *(byte *)((char *)_o + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
|
- (byte)_o[3] & 0x3f
+ ((uw_object_hdr_t *)_o)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_o + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->link
|
- (*(ushort *)((char *)_o + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- *(ushort *)((char *)_o + 0x6) >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- (((ushort *)_o)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->link
|
- (((ushort *)_o)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- ((ushort *)_o)[3] >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- (_o[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_o)->link
|
- (_o[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_o)->link
|
- _o[3] >> 6
+ ((uw_object_hdr_t *)_o)->link
)
...>
}

@field_1_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)equipped)->item_id
|
- ((ushort *)equipped)[0] & 0x1ff
+ ((uw_object_hdr_t *)equipped)->item_id
|
- *(ushort *)equipped & 0x1ff
+ ((uw_object_hdr_t *)equipped)->item_id
|
- equipped[0] & 0x1ff
+ ((uw_object_hdr_t *)equipped)->item_id
|
- *equipped & 0x1ff
+ ((uw_object_hdr_t *)equipped)->item_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*(ushort *)((char *)equipped + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (((ushort *)equipped)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (((ushort *)equipped)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*(ushort *)equipped >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*(ushort *)equipped & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (equipped[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (equipped[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*equipped >> 9) & 0x7
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*equipped & 0xe00) >> 9
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*(byte *)((char *)equipped + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)equipped)->flags_res
|
- (*(byte *)((char *)equipped + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)equipped)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*(ushort *)((char *)equipped + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (((ushort *)equipped)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (((ushort *)equipped)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*(ushort *)equipped >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*(ushort *)equipped & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (equipped[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (equipped[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*equipped >> 12) & 0x1
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*equipped & 0x1000) >> 12
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*(byte *)((char *)equipped + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)equipped)->enchanted
|
- (*(byte *)((char *)equipped + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)equipped)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*(ushort *)((char *)equipped + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (((ushort *)equipped)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (((ushort *)equipped)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*(ushort *)equipped >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*(ushort *)equipped & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (equipped[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (equipped[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*equipped >> 13) & 0x1
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*equipped & 0x2000) >> 13
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*(byte *)((char *)equipped + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)equipped)->doordir
|
- (*(byte *)((char *)equipped + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)equipped)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*(ushort *)((char *)equipped + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (((ushort *)equipped)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (((ushort *)equipped)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*(ushort *)equipped >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*(ushort *)equipped & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (equipped[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (equipped[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*equipped >> 14) & 0x1
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*equipped & 0x4000) >> 14
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*(byte *)((char *)equipped + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)equipped)->invisible
|
- (*(byte *)((char *)equipped + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)equipped)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*(ushort *)((char *)equipped + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- *(ushort *)((char *)equipped + 0x0) >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (((ushort *)equipped)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (((ushort *)equipped)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- ((ushort *)equipped)[0] >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*(ushort *)equipped >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*(ushort *)equipped & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- *(ushort *)equipped >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (equipped[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (equipped[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- equipped[0] >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*equipped >> 15) & 0x1
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*equipped & 0x8000) >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- *equipped >> 15
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*(byte *)((char *)equipped + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- (*(byte *)((char *)equipped + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)equipped)->is_quant
|
- *(byte *)((char *)equipped + 0x1) >> 7
+ ((uw_object_hdr_t *)equipped)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equipped)->zpos
|
- ((ushort *)equipped)[1] & 0x7f
+ ((uw_object_hdr_t *)equipped)->zpos
|
- equipped[1] & 0x7f
+ ((uw_object_hdr_t *)equipped)->zpos
|
- *(byte *)((char *)equipped + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equipped)->zpos
|
- (byte)equipped[1] & 0x7f
+ ((uw_object_hdr_t *)equipped)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)equipped)->heading
|
- (*(ushort *)((char *)equipped + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)equipped)->heading
|
- (((ushort *)equipped)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equipped)->heading
|
- (((ushort *)equipped)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equipped)->heading
|
- (equipped[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equipped)->heading
|
- (equipped[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equipped)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (*(ushort *)((char *)equipped + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (((ushort *)equipped)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (((ushort *)equipped)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (equipped[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (equipped[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (*(byte *)((char *)equipped + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)equipped)->ypos
|
- (*(byte *)((char *)equipped + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)equipped)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (*(ushort *)((char *)equipped + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)equipped)->xpos
|
- *(ushort *)((char *)equipped + 0x2) >> 13
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (((ushort *)equipped)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (((ushort *)equipped)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equipped)->xpos
|
- ((ushort *)equipped)[1] >> 13
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (equipped[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (equipped[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equipped)->xpos
|
- equipped[1] >> 13
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (*(byte *)((char *)equipped + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)equipped)->xpos
|
- (*(byte *)((char *)equipped + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)equipped)->xpos
|
- *(byte *)((char *)equipped + 0x3) >> 5
+ ((uw_object_hdr_t *)equipped)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equipped)->quality
|
- ((ushort *)equipped)[2] & 0x3f
+ ((uw_object_hdr_t *)equipped)->quality
|
- equipped[2] & 0x3f
+ ((uw_object_hdr_t *)equipped)->quality
|
- *(byte *)((char *)equipped + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equipped)->quality
|
- (byte)equipped[2] & 0x3f
+ ((uw_object_hdr_t *)equipped)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped)->next
|
- (*(ushort *)((char *)equipped + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped)->next
|
- *(ushort *)((char *)equipped + 0x4) >> 6
+ ((uw_object_hdr_t *)equipped)->next
|
- (((ushort *)equipped)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped)->next
|
- (((ushort *)equipped)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped)->next
|
- ((ushort *)equipped)[2] >> 6
+ ((uw_object_hdr_t *)equipped)->next
|
- (equipped[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped)->next
|
- (equipped[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped)->next
|
- equipped[2] >> 6
+ ((uw_object_hdr_t *)equipped)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equipped)->owner
|
- ((ushort *)equipped)[3] & 0x3f
+ ((uw_object_hdr_t *)equipped)->owner
|
- equipped[3] & 0x3f
+ ((uw_object_hdr_t *)equipped)->owner
|
- *(byte *)((char *)equipped + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equipped)->owner
|
- (byte)equipped[3] & 0x3f
+ ((uw_object_hdr_t *)equipped)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equipped + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped)->link
|
- (*(ushort *)((char *)equipped + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped)->link
|
- *(ushort *)((char *)equipped + 0x6) >> 6
+ ((uw_object_hdr_t *)equipped)->link
|
- (((ushort *)equipped)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped)->link
|
- (((ushort *)equipped)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped)->link
|
- ((ushort *)equipped)[3] >> 6
+ ((uw_object_hdr_t *)equipped)->link
|
- (equipped[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equipped)->link
|
- (equipped[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equipped)->link
|
- equipped[3] >> 6
+ ((uw_object_hdr_t *)equipped)->link
)
...>
}

@field_2_item_id disable drop_cast, is_zero, isnt_zero@
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

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
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

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
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

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
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

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
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

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)puVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar5)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
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

@field_2_heading disable drop_cast, is_zero, isnt_zero@
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

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
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

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)puVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar5)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
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

@field_2_next disable drop_cast, is_zero, isnt_zero@
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

@field_2_owner disable drop_cast, is_zero, isnt_zero@
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

@field_2_link disable drop_cast, is_zero, isnt_zero@
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

@field_3_item_id disable drop_cast, is_zero, isnt_zero@
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

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(pNewObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->flags_res
|
- (*(byte *)(pNewObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pNewObj)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(pNewObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->enchanted
|
- (*(byte *)(pNewObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pNewObj)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(pNewObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->doordir
|
- (*(byte *)(pNewObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pNewObj)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(pNewObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->invisible
|
- (*(byte *)(pNewObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pNewObj)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)pNewObj + 0x1) >> 7
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(byte *)(pNewObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- (*(byte *)(pNewObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pNewObj)->is_quant
|
- *(byte *)(pNewObj + 0x1) >> 7
+ ((uw_object_hdr_t *)pNewObj)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)(pNewObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pNewObj)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
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

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(pNewObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->ypos
|
- (*(byte *)(pNewObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pNewObj)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)pNewObj + 0x3) >> 5
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(byte *)(pNewObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- (*(byte *)(pNewObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pNewObj)->xpos
|
- *(byte *)(pNewObj + 0x3) >> 5
+ ((uw_object_hdr_t *)pNewObj)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)(pNewObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
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

@field_3_owner disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)(pNewObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pNewObj)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
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

@field_4_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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
|
- *(byte *)((char *)puVar6 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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
|
- *(byte *)((char *)puVar6 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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
