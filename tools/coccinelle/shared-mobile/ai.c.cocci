@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x16) = (char)V;
- *(char *)((char *)object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x16) = (char)V;
- *(byte *)((char *)object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x16) = (byte)V;
- *(char *)((char *)object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x16) = (byte)V;
- *(byte *)((char *)object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- ((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- ((undefined2 *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)((undefined2 *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- ((short *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)((short *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- ((byte *)object)[0x16]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (byte)((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (byte)object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- ((undefined1 *)object)[0x16]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (undefined1)((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (undefined1)object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x16)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)((byte *)object + 0x16)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &((char *)object)[0x16]
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)((ushort *)object + 0xb)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)(object + 0xb)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x16) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)((byte *)object + 0x16) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- ((char *)object)[0x16] = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)object + 0xb) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)(object + 0xb) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x16)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)((byte *)object + 0x16)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- ((char *)object)[0x16]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)((ushort *)object + 0xb)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- (char)((ushort *)object)[0xb]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)(object + 0xb)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- (char)object[0xb]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- *(byte *)((byte *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- ((byte *)object)[0x17]
+ ((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- *(undefined1 *)((byte *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- ((undefined1 *)object)[0x17]
+ ((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x17)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
|
- &*(char *)((byte *)object + 0x17)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
|
- &((char *)object)[0x17]
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x17) = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
|
- *(char *)((byte *)object + 0x17) = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
|
- ((char *)object)[0x17] = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x17)
+ (char)((uw_mobile_object_t *)object)->tile_position_high
|
- *(char *)((byte *)object + 0x17)
+ (char)((uw_mobile_object_t *)object)->tile_position_high
|
- ((char *)object)[0x17]
+ (char)((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_0_field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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
|
- *(byte *)((char *)object + 0x1) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@site_0_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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
|
- *(byte *)((char *)object + 0x3) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@site_0_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
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

@site_0_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@site_0_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((undefined2 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((undefined2 *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@site_0_header_w_0_0_word_short@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- ((short *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((short *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
)
...>
}


@site_0_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((byte *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((undefined1 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_address_0@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((byte *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &((char *)object)[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((ushort *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)(object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_store_0@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- ((char *)object)[0x0] = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)object = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)(object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((byte *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- ((char *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((ushort *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)((ushort *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)object
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)(object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)object[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(byte *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((byte *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_0_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(undefined1 *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((undefined1 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_0_header_w_0_0_address_1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)((byte *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &((char *)object)[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_0_header_w_0_0_store_1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- ((char *)object)[0x1] = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- *(char *)((byte *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- ((char *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_0_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@site_0_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((undefined2 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((undefined2 *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@site_0_header_w_2_17_word_short@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- ((short *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((short *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
)
...>
}


@site_0_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((byte *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((undefined1 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_0_header_w_2_17_address_2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((byte *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &((char *)object)[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((ushort *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)(object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_0_header_w_2_17_store_2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- ((char *)object)[0x2] = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)(object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((byte *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- ((char *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((ushort *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)((ushort *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)(object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)object[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(byte *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((byte *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_0_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(undefined1 *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((undefined1 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_0_header_w_2_17_address_3@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)((byte *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &((char *)object)[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_0_header_w_2_17_store_3@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- ((char *)object)[0x3] = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- *(char *)((byte *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- ((char *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_0_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@site_0_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((undefined2 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((undefined2 *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@site_0_header_w_4_34_word_short@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- ((short *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((short *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
)
...>
}


@site_0_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((byte *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((undefined1 *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_address_4@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((byte *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &((char *)object)[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((ushort *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)(object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_store_4@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- ((char *)object)[0x4] = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)(object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((byte *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- ((char *)object)[0x4]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((ushort *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)((ushort *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)(object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)object[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(byte *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((byte *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_0_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(undefined1 *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((undefined1 *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_0_header_w_4_34_address_5@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)((byte *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &((char *)object)[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_0_header_w_4_34_store_5@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- ((char *)object)[0x5] = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- *(char *)((byte *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- ((char *)object)[0x5]
+ (char)((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_0_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@site_0_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((undefined2 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((undefined2 *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@site_0_header_w_6_51_word_short@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- ((short *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((short *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
)
...>
}


@site_0_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((byte *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((undefined1 *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_0_header_w_6_51_address_6@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((byte *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &((char *)object)[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((ushort *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)(object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_0_header_w_6_51_store_6@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- ((char *)object)[0x6] = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)(object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((byte *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- ((char *)object)[0x6]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((ushort *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)((ushort *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)(object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)object[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(byte *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((byte *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@site_0_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(undefined1 *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((undefined1 *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@site_0_header_w_6_51_address_7@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)((byte *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &((char *)object)[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@site_0_header_w_6_51_store_7@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- ((char *)object)[0x7] = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- *(char *)((byte *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- ((char *)object)[0x7]
+ (char)((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@build_object_placement_snapshot_object_hit_points_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x8)
+ ((uw_mobile_object_t *)object)->hit_points
|
- *(byte *)(object + 0x4)
+ ((uw_mobile_object_t *)object)->hit_points
|
- (byte)object[0x4]
+ ((uw_mobile_object_t *)object)->hit_points
)
...>
}

@build_object_placement_snapshot_object_hit_points_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x8)
+ ((uw_mobile_object_t *)object)->hit_points
|
- *(undefined1 *)(object + 0x4)
+ ((uw_mobile_object_t *)object)->hit_points
|
- (undefined1)object[0x4]
+ ((uw_mobile_object_t *)object)->hit_points
)
...>
}

@build_object_placement_snapshot_object_hit_points_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x8)
+ (char *)&((uw_mobile_object_t *)object)->hit_points
|
- &*(char *)(object + 0x4)
+ (char *)&((uw_mobile_object_t *)object)->hit_points
)
...>
}

@build_object_placement_snapshot_object_hit_points_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x8) = E;
+ ((uw_mobile_object_t *)object)->hit_points = (byte)E;
|
- *(char *)(object + 0x4) = E;
+ ((uw_mobile_object_t *)object)->hit_points = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_hit_points_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x8)
+ (char)((uw_mobile_object_t *)object)->hit_points
|
- *(char *)(object + 0x4)
+ (char)((uw_mobile_object_t *)object)->hit_points
|
- (char)object[0x4]
+ (char)((uw_mobile_object_t *)object)->hit_points
)
...>
}

@build_object_placement_snapshot_object_full_heading_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x9)
+ ((uw_mobile_object_t *)object)->full_heading
)
...>
}

@build_object_placement_snapshot_object_full_heading_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x9)
+ ((uw_mobile_object_t *)object)->full_heading
)
...>
}

@build_object_placement_snapshot_object_full_heading_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x9)
+ (char *)&((uw_mobile_object_t *)object)->full_heading
)
...>
}

@build_object_placement_snapshot_object_full_heading_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x9) = E;
+ ((uw_mobile_object_t *)object)->full_heading = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_full_heading_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x9)
+ (char)((uw_mobile_object_t *)object)->full_heading
)
...>
}

@build_object_placement_snapshot_object_movement_flags_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0xa)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- *(byte *)(object + 0x5)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- (byte)object[0x5]
+ ((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@build_object_placement_snapshot_object_movement_flags_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0xa)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- *(undefined1 *)(object + 0x5)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- (undefined1)object[0x5]
+ ((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@build_object_placement_snapshot_object_movement_flags_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0xa)
+ (char *)&((uw_mobile_object_t *)object)->movement_flags
|
- &*(char *)(object + 0x5)
+ (char *)&((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@build_object_placement_snapshot_object_movement_flags_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0xa) = E;
+ ((uw_mobile_object_t *)object)->movement_flags = (byte)E;
|
- *(char *)(object + 0x5) = E;
+ ((uw_mobile_object_t *)object)->movement_flags = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_movement_flags_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0xa)
+ (char)((uw_mobile_object_t *)object)->movement_flags
|
- *(char *)(object + 0x5)
+ (char)((uw_mobile_object_t *)object)->movement_flags
|
- (char)object[0x5]
+ (char)((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@build_object_placement_snapshot_object_motion_flags_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x13)
+ ((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@build_object_placement_snapshot_object_motion_flags_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x13)
+ ((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@build_object_placement_snapshot_object_motion_flags_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x13)
+ (char *)&((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@build_object_placement_snapshot_object_motion_flags_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x13) = E;
+ ((uw_mobile_object_t *)object)->motion_flags = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_motion_flags_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x13)
+ (char)((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@build_object_placement_snapshot_object_attack_pitch_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x14)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- *(byte *)(object + 0xa)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- (byte)object[0xa]
+ ((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@build_object_placement_snapshot_object_attack_pitch_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x14)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- *(undefined1 *)(object + 0xa)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- (undefined1)object[0xa]
+ ((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@build_object_placement_snapshot_object_attack_pitch_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x14)
+ (char *)&((uw_mobile_object_t *)object)->attack_pitch
|
- &*(char *)(object + 0xa)
+ (char *)&((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@build_object_placement_snapshot_object_attack_pitch_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x14) = E;
+ ((uw_mobile_object_t *)object)->attack_pitch = (byte)E;
|
- *(char *)(object + 0xa) = E;
+ ((uw_mobile_object_t *)object)->attack_pitch = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_attack_pitch_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x14)
+ (char)((uw_mobile_object_t *)object)->attack_pitch
|
- *(char *)(object + 0xa)
+ (char)((uw_mobile_object_t *)object)->attack_pitch
|
- (char)object[0xa]
+ (char)((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@build_object_placement_snapshot_object_animation_flags_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x15)
+ ((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@build_object_placement_snapshot_object_animation_flags_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x15)
+ ((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@build_object_placement_snapshot_object_animation_flags_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x15)
+ (char *)&((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@build_object_placement_snapshot_object_animation_flags_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x15) = E;
+ ((uw_mobile_object_t *)object)->animation_flags = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_animation_flags_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x15)
+ (char)((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@build_object_placement_snapshot_object_heading_flags_byte@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x18)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- *(byte *)(object + 0xc)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- (byte)object[0xc]
+ ((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@build_object_placement_snapshot_object_heading_flags_undefined1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x18)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- *(undefined1 *)(object + 0xc)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- (undefined1)object[0xc]
+ ((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@build_object_placement_snapshot_object_heading_flags_address@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x18)
+ (char *)&((uw_mobile_object_t *)object)->heading_flags
|
- &*(char *)(object + 0xc)
+ (char *)&((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@build_object_placement_snapshot_object_heading_flags_store@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x18) = E;
+ ((uw_mobile_object_t *)object)->heading_flags = (byte)E;
|
- *(char *)(object + 0xc) = E;
+ ((uw_mobile_object_t *)object)->heading_flags = (byte)E;
)
...>
}

@build_object_placement_snapshot_object_heading_flags_char@
type R;
identifier F =~ "^\(build_object_placement_snapshot\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x18)
+ (char)((uw_mobile_object_t *)object)->heading_flags
|
- *(char *)(object + 0xc)
+ (char)((uw_mobile_object_t *)object)->heading_flags
|
- (char)object[0xc]
+ (char)((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@site_1_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x16) = (char)V;
- *(char *)((char *)object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x16) = (char)V;
- *(byte *)((char *)object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x16) = (byte)V;
- *(char *)((char *)object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x16) = (byte)V;
- *(byte *)((char *)object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)object)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- ((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(ushort *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
)
...>
}


@site_1_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position
|
- ((undefined2 *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)((undefined2 *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- *(undefined2 *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position
|
- object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position
)
...>
}


@site_1_w_22_0_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- ((short *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)((short *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_signed
|
- *(short *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_signed
)
...>
}


@site_1_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- ((byte *)object)[0x16]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (byte)((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(byte *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (byte)object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_1_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)((byte *)object + 0x16)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- ((undefined1 *)object)[0x16]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)((ushort *)object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (undefined1)((ushort *)object)[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- *(undefined1 *)(object + 0xb)
+ ((uw_mobile_object_t *)object)->tile_position_low
|
- (undefined1)object[0xb]
+ ((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_1_w_22_0_address_22@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x16)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)((byte *)object + 0x16)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &((char *)object)[0x16]
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)((ushort *)object + 0xb)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
|
- &*(char *)(object + 0xb)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_1_w_22_0_store_22@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x16) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)((byte *)object + 0x16) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- ((char *)object)[0x16] = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)object + 0xb) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
|
- *(char *)(object + 0xb) = E;
+ ((uw_mobile_object_t *)object)->tile_position_low = (byte)E;
)
...>
}


@site_1_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x16)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)((byte *)object + 0x16)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- ((char *)object)[0x16]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)((ushort *)object + 0xb)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- (char)((ushort *)object)[0xb]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- *(char *)(object + 0xb)
+ (char)((uw_mobile_object_t *)object)->tile_position_low
|
- (char)object[0xb]
+ (char)((uw_mobile_object_t *)object)->tile_position_low
)
...>
}


@site_1_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- *(byte *)((byte *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- ((byte *)object)[0x17]
+ ((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_1_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- *(undefined1 *)((byte *)object + 0x17)
+ ((uw_mobile_object_t *)object)->tile_position_high
|
- ((undefined1 *)object)[0x17]
+ ((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_1_w_22_0_address_23@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x17)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
|
- &*(char *)((byte *)object + 0x17)
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
|
- &((char *)object)[0x17]
+ (char *)&((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_1_w_22_0_store_23@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x17) = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
|
- *(char *)((byte *)object + 0x17) = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
|
- ((char *)object)[0x17] = E;
+ ((uw_mobile_object_t *)object)->tile_position_high = (byte)E;
)
...>
}


@site_1_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x17)
+ (char)((uw_mobile_object_t *)object)->tile_position_high
|
- *(char *)((byte *)object + 0x17)
+ (char)((uw_mobile_object_t *)object)->tile_position_high
|
- ((char *)object)[0x17]
+ (char)((uw_mobile_object_t *)object)->tile_position_high
)
...>
}


@site_1_field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
|
- *(byte *)((char *)object + 0x1) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@site_1_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
|
- *(byte *)((char *)object + 0x3) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@site_1_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@site_1_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@site_1_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((undefined2 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((undefined2 *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@site_1_header_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- ((short *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((short *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
)
...>
}


@site_1_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((byte *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_1_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((undefined1 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_1_header_w_0_0_address_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((byte *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &((char *)object)[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((ushort *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)(object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_1_header_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- ((char *)object)[0x0] = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)object = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)(object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
)
...>
}


@site_1_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((byte *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- ((char *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((ushort *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)((ushort *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)object
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)(object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)object[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@site_1_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(byte *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((byte *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_1_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(undefined1 *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((undefined1 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_1_header_w_0_0_address_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)((byte *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &((char *)object)[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_1_header_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- ((char *)object)[0x1] = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
)
...>
}


@site_1_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- *(char *)((byte *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- ((char *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@site_1_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@site_1_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((undefined2 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((undefined2 *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@site_1_header_w_2_17_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- ((short *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((short *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
)
...>
}


@site_1_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((byte *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_1_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((undefined1 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_1_header_w_2_17_address_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((byte *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &((char *)object)[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((ushort *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)(object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_1_header_w_2_17_store_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- ((char *)object)[0x2] = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)(object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
)
...>
}


@site_1_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((byte *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- ((char *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((ushort *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)((ushort *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)(object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)object[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@site_1_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(byte *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((byte *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_1_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(undefined1 *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((undefined1 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_1_header_w_2_17_address_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)((byte *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &((char *)object)[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_1_header_w_2_17_store_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- ((char *)object)[0x3] = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
)
...>
}


@site_1_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- *(char *)((byte *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- ((char *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@site_1_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@site_1_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((undefined2 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((undefined2 *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@site_1_header_w_4_34_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- ((short *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((short *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
)
...>
}


@site_1_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((byte *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_1_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((undefined1 *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_1_header_w_4_34_address_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((byte *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &((char *)object)[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((ushort *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)(object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_1_header_w_4_34_store_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- ((char *)object)[0x4] = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)(object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
)
...>
}


@site_1_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((byte *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- ((char *)object)[0x4]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((ushort *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)((ushort *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)(object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)object[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@site_1_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(byte *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((byte *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_1_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(undefined1 *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((undefined1 *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_1_header_w_4_34_address_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)((byte *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &((char *)object)[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_1_header_w_4_34_store_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- ((char *)object)[0x5] = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
)
...>
}


@site_1_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- *(char *)((byte *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- ((char *)object)[0x5]
+ (char)((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@site_1_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@site_1_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((undefined2 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((undefined2 *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@site_1_header_w_6_51_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- ((short *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((short *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
)
...>
}


@site_1_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((byte *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_1_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((undefined1 *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_1_header_w_6_51_address_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((byte *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &((char *)object)[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((ushort *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)(object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_1_header_w_6_51_store_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- ((char *)object)[0x6] = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)(object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
)
...>
}


@site_1_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((byte *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- ((char *)object)[0x6]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((ushort *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)((ushort *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)(object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)object[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@site_1_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(byte *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((byte *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@site_1_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(undefined1 *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((undefined1 *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@site_1_header_w_6_51_address_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)((byte *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &((char *)object)[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@site_1_header_w_6_51_store_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- ((char *)object)[0x7] = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
)
...>
}


@site_1_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- *(char *)((byte *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- ((char *)object)[0x7]
+ (char)((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@settle_mobile_to_immobile_object_hit_points_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x8)
+ ((uw_mobile_object_t *)object)->hit_points
|
- *(byte *)(object + 0x4)
+ ((uw_mobile_object_t *)object)->hit_points
|
- (byte)object[0x4]
+ ((uw_mobile_object_t *)object)->hit_points
)
...>
}

@settle_mobile_to_immobile_object_hit_points_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x8)
+ ((uw_mobile_object_t *)object)->hit_points
|
- *(undefined1 *)(object + 0x4)
+ ((uw_mobile_object_t *)object)->hit_points
|
- (undefined1)object[0x4]
+ ((uw_mobile_object_t *)object)->hit_points
)
...>
}

@settle_mobile_to_immobile_object_hit_points_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x8)
+ (char *)&((uw_mobile_object_t *)object)->hit_points
|
- &*(char *)(object + 0x4)
+ (char *)&((uw_mobile_object_t *)object)->hit_points
)
...>
}

@settle_mobile_to_immobile_object_hit_points_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x8) = E;
+ ((uw_mobile_object_t *)object)->hit_points = (byte)E;
|
- *(char *)(object + 0x4) = E;
+ ((uw_mobile_object_t *)object)->hit_points = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_hit_points_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x8)
+ (char)((uw_mobile_object_t *)object)->hit_points
|
- *(char *)(object + 0x4)
+ (char)((uw_mobile_object_t *)object)->hit_points
|
- (char)object[0x4]
+ (char)((uw_mobile_object_t *)object)->hit_points
)
...>
}

@settle_mobile_to_immobile_object_full_heading_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x9)
+ ((uw_mobile_object_t *)object)->full_heading
)
...>
}

@settle_mobile_to_immobile_object_full_heading_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x9)
+ ((uw_mobile_object_t *)object)->full_heading
)
...>
}

@settle_mobile_to_immobile_object_full_heading_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x9)
+ (char *)&((uw_mobile_object_t *)object)->full_heading
)
...>
}

@settle_mobile_to_immobile_object_full_heading_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x9) = E;
+ ((uw_mobile_object_t *)object)->full_heading = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_full_heading_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x9)
+ (char)((uw_mobile_object_t *)object)->full_heading
)
...>
}

@settle_mobile_to_immobile_object_movement_flags_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0xa)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- *(byte *)(object + 0x5)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- (byte)object[0x5]
+ ((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@settle_mobile_to_immobile_object_movement_flags_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0xa)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- *(undefined1 *)(object + 0x5)
+ ((uw_mobile_object_t *)object)->movement_flags
|
- (undefined1)object[0x5]
+ ((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@settle_mobile_to_immobile_object_movement_flags_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0xa)
+ (char *)&((uw_mobile_object_t *)object)->movement_flags
|
- &*(char *)(object + 0x5)
+ (char *)&((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@settle_mobile_to_immobile_object_movement_flags_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0xa) = E;
+ ((uw_mobile_object_t *)object)->movement_flags = (byte)E;
|
- *(char *)(object + 0x5) = E;
+ ((uw_mobile_object_t *)object)->movement_flags = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_movement_flags_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0xa)
+ (char)((uw_mobile_object_t *)object)->movement_flags
|
- *(char *)(object + 0x5)
+ (char)((uw_mobile_object_t *)object)->movement_flags
|
- (char)object[0x5]
+ (char)((uw_mobile_object_t *)object)->movement_flags
)
...>
}

@settle_mobile_to_immobile_object_motion_flags_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x13)
+ ((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@settle_mobile_to_immobile_object_motion_flags_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x13)
+ ((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@settle_mobile_to_immobile_object_motion_flags_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x13)
+ (char *)&((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@settle_mobile_to_immobile_object_motion_flags_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x13) = E;
+ ((uw_mobile_object_t *)object)->motion_flags = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_motion_flags_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x13)
+ (char)((uw_mobile_object_t *)object)->motion_flags
)
...>
}

@settle_mobile_to_immobile_object_attack_pitch_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x14)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- *(byte *)(object + 0xa)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- (byte)object[0xa]
+ ((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@settle_mobile_to_immobile_object_attack_pitch_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x14)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- *(undefined1 *)(object + 0xa)
+ ((uw_mobile_object_t *)object)->attack_pitch
|
- (undefined1)object[0xa]
+ ((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@settle_mobile_to_immobile_object_attack_pitch_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x14)
+ (char *)&((uw_mobile_object_t *)object)->attack_pitch
|
- &*(char *)(object + 0xa)
+ (char *)&((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@settle_mobile_to_immobile_object_attack_pitch_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x14) = E;
+ ((uw_mobile_object_t *)object)->attack_pitch = (byte)E;
|
- *(char *)(object + 0xa) = E;
+ ((uw_mobile_object_t *)object)->attack_pitch = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_attack_pitch_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x14)
+ (char)((uw_mobile_object_t *)object)->attack_pitch
|
- *(char *)(object + 0xa)
+ (char)((uw_mobile_object_t *)object)->attack_pitch
|
- (char)object[0xa]
+ (char)((uw_mobile_object_t *)object)->attack_pitch
)
...>
}

@settle_mobile_to_immobile_object_animation_flags_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x15)
+ ((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@settle_mobile_to_immobile_object_animation_flags_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x15)
+ ((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@settle_mobile_to_immobile_object_animation_flags_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x15)
+ (char *)&((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@settle_mobile_to_immobile_object_animation_flags_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x15) = E;
+ ((uw_mobile_object_t *)object)->animation_flags = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_animation_flags_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x15)
+ (char)((uw_mobile_object_t *)object)->animation_flags
)
...>
}

@settle_mobile_to_immobile_object_heading_flags_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x18)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- *(byte *)(object + 0xc)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- (byte)object[0xc]
+ ((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@settle_mobile_to_immobile_object_heading_flags_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x18)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- *(undefined1 *)(object + 0xc)
+ ((uw_mobile_object_t *)object)->heading_flags
|
- (undefined1)object[0xc]
+ ((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@settle_mobile_to_immobile_object_heading_flags_address@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x18)
+ (char *)&((uw_mobile_object_t *)object)->heading_flags
|
- &*(char *)(object + 0xc)
+ (char *)&((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@settle_mobile_to_immobile_object_heading_flags_store@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x18) = E;
+ ((uw_mobile_object_t *)object)->heading_flags = (byte)E;
|
- *(char *)(object + 0xc) = E;
+ ((uw_mobile_object_t *)object)->heading_flags = (byte)E;
)
...>
}

@settle_mobile_to_immobile_object_heading_flags_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x18)
+ (char)((uw_mobile_object_t *)object)->heading_flags
|
- *(char *)(object + 0xc)
+ (char)((uw_mobile_object_t *)object)->heading_flags
|
- (char)object[0xc]
+ (char)((uw_mobile_object_t *)object)->heading_flags
)
...>
}

@site_2_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x16) = (char)V;
- *(char *)((char *)player_rec + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)player_rec)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x16) = (char)V;
- *(byte *)((char *)player_rec + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)player_rec)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x16) = (byte)V;
- *(char *)((char *)player_rec + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)player_rec)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x16) = (byte)V;
- *(byte *)((char *)player_rec + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)player_rec)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- *(ushort *)((byte *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- ((ushort *)player_rec)[0xb]
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- *(ushort *)((ushort *)player_rec + 0xb)
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- *(ushort *)(player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position
)
...>
}


@site_2_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- *(undefined2 *)((byte *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- ((undefined2 *)player_rec)[0xb]
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- *(undefined2 *)((undefined2 *)player_rec + 0xb)
+ ((uw_mobile_object_t *)player_rec)->tile_position
|
- *(undefined2 *)(player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position
)
...>
}


@site_2_w_22_0_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_signed
|
- *(short *)((byte *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_signed
|
- ((short *)player_rec)[0xb]
+ ((uw_mobile_object_t *)player_rec)->tile_position_signed
|
- *(short *)((short *)player_rec + 0xb)
+ ((uw_mobile_object_t *)player_rec)->tile_position_signed
|
- *(short *)(player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_signed
)
...>
}


@site_2_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(byte *)((byte *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- ((byte *)player_rec)[0x16]
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(byte *)((ushort *)player_rec + 0xb)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- (byte)((ushort *)player_rec)[0xb]
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(byte *)(player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
)
...>
}


@site_2_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(undefined1 *)((byte *)player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- ((undefined1 *)player_rec)[0x16]
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(undefined1 *)((ushort *)player_rec + 0xb)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- (undefined1)((ushort *)player_rec)[0xb]
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(undefined1 *)(player_rec + 0x16)
+ ((uw_mobile_object_t *)player_rec)->tile_position_low
)
...>
}


@site_2_w_22_0_address_22@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x16)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_low
|
- &*(char *)((byte *)player_rec + 0x16)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_low
|
- &((char *)player_rec)[0x16]
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_low
|
- &*(char *)((ushort *)player_rec + 0xb)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_low
|
- &*(char *)(player_rec + 0x16)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_low
|
- &player_rec[0x16]
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_low
)
...>
}


@site_2_w_22_0_store_22@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x16) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x16) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_low = (byte)E;
|
- ((char *)player_rec)[0x16] = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0xb) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_low = (byte)E;
|
- *(char *)(player_rec + 0x16) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_low = (byte)E;
|
- player_rec[0x16] = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_low = (byte)E;
)
...>
}


@site_2_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x16)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(char *)((byte *)player_rec + 0x16)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
|
- ((char *)player_rec)[0x16]
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(char *)((ushort *)player_rec + 0xb)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
|
- (char)((ushort *)player_rec)[0xb]
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
|
- *(char *)(player_rec + 0x16)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
|
- player_rec[0x16]
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_low
)
...>
}


@site_2_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x17)
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
|
- *(byte *)((byte *)player_rec + 0x17)
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
|
- ((byte *)player_rec)[0x17]
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
|
- *(byte *)(player_rec + 0x17)
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
)
...>
}


@site_2_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x17)
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
|
- *(undefined1 *)((byte *)player_rec + 0x17)
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
|
- ((undefined1 *)player_rec)[0x17]
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
|
- *(undefined1 *)(player_rec + 0x17)
+ ((uw_mobile_object_t *)player_rec)->tile_position_high
)
...>
}


@site_2_w_22_0_address_23@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)player_rec + 0x17)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_high
|
- &*(char *)((byte *)player_rec + 0x17)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_high
|
- &((char *)player_rec)[0x17]
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_high
|
- &*(char *)(player_rec + 0x17)
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_high
|
- &player_rec[0x17]
+ (char *)&((uw_mobile_object_t *)player_rec)->tile_position_high
)
...>
}


@site_2_w_22_0_store_23@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x17) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x17) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_high = (byte)E;
|
- ((char *)player_rec)[0x17] = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_high = (byte)E;
|
- *(char *)(player_rec + 0x17) = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_high = (byte)E;
|
- player_rec[0x17] = E;
+ ((uw_mobile_object_t *)player_rec)->tile_position_high = (byte)E;
)
...>
}


@site_2_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x17)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_high
|
- *(char *)((byte *)player_rec + 0x17)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_high
|
- ((char *)player_rec)[0x17]
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_high
|
- *(char *)(player_rec + 0x17)
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_high
|
- player_rec[0x17]
+ (char)((uw_mobile_object_t *)player_rec)->tile_position_high
)
...>
}


@site_3_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x16) = (char)V;
- *(char *)((char *)npc_rec + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)npc_rec)->tile_position = (ushort)V;

...>
}

@site_3_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x16) = (char)V;
- *(byte *)((char *)npc_rec + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)npc_rec)->tile_position = (ushort)V;

...>
}

@site_3_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x16) = (byte)V;
- *(char *)((char *)npc_rec + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)npc_rec)->tile_position = (ushort)V;

...>
}

@site_3_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x16) = (byte)V;
- *(byte *)((char *)npc_rec + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)npc_rec)->tile_position = (ushort)V;

...>
}

@site_3_w_22_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- *(ushort *)((byte *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- ((ushort *)npc_rec)[0xb]
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- *(ushort *)((ushort *)npc_rec + 0xb)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- *(ushort *)(npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
)
...>
}


@site_3_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- *(undefined2 *)((byte *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- ((undefined2 *)npc_rec)[0xb]
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- *(undefined2 *)((undefined2 *)npc_rec + 0xb)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
|
- *(undefined2 *)(npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position
)
...>
}


@site_3_w_22_0_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_signed
|
- *(short *)((byte *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_signed
|
- ((short *)npc_rec)[0xb]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_signed
|
- *(short *)((short *)npc_rec + 0xb)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_signed
|
- *(short *)(npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_signed
)
...>
}


@site_3_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(byte *)((byte *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- ((byte *)npc_rec)[0x16]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(byte *)((ushort *)npc_rec + 0xb)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- (byte)((ushort *)npc_rec)[0xb]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(byte *)(npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
)
...>
}


@site_3_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(undefined1 *)((byte *)npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- ((undefined1 *)npc_rec)[0x16]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(undefined1 *)((ushort *)npc_rec + 0xb)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- (undefined1)((ushort *)npc_rec)[0xb]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(undefined1 *)(npc_rec + 0x16)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low
)
...>
}


@site_3_w_22_0_address_22@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x16)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- &*(char *)((byte *)npc_rec + 0x16)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- &((char *)npc_rec)[0x16]
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- &*(char *)((ushort *)npc_rec + 0xb)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- &*(char *)(npc_rec + 0x16)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- &npc_rec[0x16]
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_low
)
...>
}


@site_3_w_22_0_store_22@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x16) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x16) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low = (byte)E;
|
- ((char *)npc_rec)[0x16] = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0xb) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low = (byte)E;
|
- *(char *)(npc_rec + 0x16) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low = (byte)E;
|
- npc_rec[0x16] = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_low = (byte)E;
)
...>
}


@site_3_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x16)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(char *)((byte *)npc_rec + 0x16)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- ((char *)npc_rec)[0x16]
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(char *)((ushort *)npc_rec + 0xb)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- (char)((ushort *)npc_rec)[0xb]
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- *(char *)(npc_rec + 0x16)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
|
- npc_rec[0x16]
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_low
)
...>
}


@site_3_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x17)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- *(byte *)((byte *)npc_rec + 0x17)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- ((byte *)npc_rec)[0x17]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- *(byte *)(npc_rec + 0x17)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
)
...>
}


@site_3_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x17)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- *(undefined1 *)((byte *)npc_rec + 0x17)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- ((undefined1 *)npc_rec)[0x17]
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- *(undefined1 *)(npc_rec + 0x17)
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high
)
...>
}


@site_3_w_22_0_address_23@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x17)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- &*(char *)((byte *)npc_rec + 0x17)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- &((char *)npc_rec)[0x17]
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- &*(char *)(npc_rec + 0x17)
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- &npc_rec[0x17]
+ (char *)&((uw_mobile_object_t *)npc_rec)->tile_position_high
)
...>
}


@site_3_w_22_0_store_23@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x17) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x17) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high = (byte)E;
|
- ((char *)npc_rec)[0x17] = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high = (byte)E;
|
- *(char *)(npc_rec + 0x17) = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high = (byte)E;
|
- npc_rec[0x17] = E;
+ ((uw_mobile_object_t *)npc_rec)->tile_position_high = (byte)E;
)
...>
}


@site_3_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x17)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- *(char *)((byte *)npc_rec + 0x17)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- ((char *)npc_rec)[0x17]
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- *(char *)(npc_rec + 0x17)
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_high
|
- npc_rec[0x17]
+ (char)((uw_mobile_object_t *)npc_rec)->tile_position_high
)
...>
}


@site_3_field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->item_id
|
- ((ushort *)npc_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->item_id
|
- *(ushort *)npc_rec & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->item_id
|
- *(ushort *)(npc_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->item_id
|
- CONCAT11(npc_rec[1], *npc_rec) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->item_id
|
- CONCAT11(npc_rec[1], npc_rec[0]) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->item_id
)
...>
}

@site_3_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (((ushort *)npc_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (((ushort *)npc_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)npc_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)npc_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)(npc_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)(npc_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)((char *)npc_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)((char *)npc_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)(npc_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)(npc_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc_rec)->flags_res
)
...>
}

@site_3_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (((ushort *)npc_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (((ushort *)npc_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)npc_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)npc_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)(npc_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)(npc_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)((char *)npc_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)(npc_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)(npc_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc_rec)->enchanted
)
...>
}

@site_3_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (((ushort *)npc_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (((ushort *)npc_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)npc_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)npc_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)(npc_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)(npc_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)((char *)npc_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)(npc_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)(npc_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc_rec)->doordir
)
...>
}

@site_3_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (((ushort *)npc_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (((ushort *)npc_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)npc_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)npc_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)(npc_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)(npc_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)((char *)npc_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)(npc_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)(npc_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc_rec)->invisible
)
...>
}

@site_3_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (((ushort *)npc_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (((ushort *)npc_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)npc_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)npc_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)(npc_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)(npc_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)((char *)npc_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- *(byte *)((char *)npc_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)(npc_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)(npc_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- *(byte *)(npc_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
)
...>
}

@site_3_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- ((ushort *)npc_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- *(ushort *)(npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- *(byte *)((char *)npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- npc_rec[2] & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- *(byte *)(npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
)
...>
}

@site_3_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (*(ushort *)((char *)npc_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (((ushort *)npc_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (((ushort *)npc_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (*(ushort *)(npc_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (*(ushort *)(npc_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_rec)->heading
)
...>
}

@site_3_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(ushort *)((char *)npc_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (((ushort *)npc_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (((ushort *)npc_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(ushort *)(npc_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(ushort *)(npc_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)((char *)npc_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)((char *)npc_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)(npc_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)(npc_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc_rec)->ypos
)
...>
}

@site_3_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(ushort *)((char *)npc_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (((ushort *)npc_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (((ushort *)npc_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(ushort *)(npc_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(ushort *)(npc_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)((char *)npc_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)((char *)npc_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- *(byte *)((char *)npc_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)(npc_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)(npc_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- *(byte *)(npc_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
)
...>
}

@site_3_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- ((ushort *)npc_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- *(ushort *)(npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- *(byte *)((char *)npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- npc_rec[4] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- *(byte *)(npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
)
...>
}

@site_3_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (*(ushort *)((char *)npc_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (((ushort *)npc_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (((ushort *)npc_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (*(ushort *)(npc_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (*(ushort *)(npc_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->next
)
...>
}

@site_3_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- ((ushort *)npc_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- *(ushort *)(npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- *(byte *)((char *)npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- npc_rec[6] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- *(byte *)(npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
)
...>
}

@site_3_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (*(ushort *)((char *)npc_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (((ushort *)npc_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (((ushort *)npc_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (*(ushort *)(npc_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (*(ushort *)(npc_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->link
)
...>
}

@site_3_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x0) = (char)V;
- *(char *)((char *)npc_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@site_3_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x0) = (char)V;
- *(byte *)((char *)npc_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@site_3_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x0) = (byte)V;
- *(char *)((char *)npc_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@site_3_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x0) = (byte)V;
- *(byte *)((char *)npc_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->type_flags = (ushort)V;

...>
}

@site_3_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- ((ushort *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)((ushort *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
)
...>
}


@site_3_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(undefined2 *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- ((undefined2 *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(undefined2 *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
)
...>
}


@site_3_header_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- *(short *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- ((short *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- *(short *)((short *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
|
- *(short *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_signed
)
...>
}


@site_3_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- ((byte *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)((ushort *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- (byte)((ushort *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)npc_rec
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(byte *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@site_3_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)((byte *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- ((undefined1 *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- (undefined1)((ushort *)npc_rec)[0x0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)npc_rec
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(undefined1 *)(npc_rec + 0x0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@site_3_header_w_0_0_address_0@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)((byte *)npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &((char *)npc_rec)[0x0]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)((ushort *)npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)npc_rec
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*(char *)(npc_rec + 0x0)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &npc_rec[0x0]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- &*npc_rec
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@site_3_header_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- ((char *)npc_rec)[0x0] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)npc_rec = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *(char *)(npc_rec + 0x0) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- npc_rec[0x0] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
|
- *npc_rec = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_low = (byte)E;
)
...>
}


@site_3_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)((byte *)npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- ((char *)npc_rec)[0x0]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)((ushort *)npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- (char)((ushort *)npc_rec)[0x0]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)npc_rec
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *(char *)(npc_rec + 0x0)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- npc_rec[0x0]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
|
- *npc_rec
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_low
)
...>
}


@site_3_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(byte *)((byte *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- ((byte *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(byte *)(npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@site_3_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(undefined1 *)((byte *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- ((undefined1 *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(undefined1 *)(npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@site_3_header_w_0_0_address_1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &*(char *)((byte *)npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &((char *)npc_rec)[0x1]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &*(char *)(npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- &npc_rec[0x1]
+ (char *)&((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@site_3_header_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- ((char *)npc_rec)[0x1] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- *(char *)(npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
|
- npc_rec[0x1] = E;
+ ((uw_object_hdr_t *)npc_rec)->type_flags_high = (byte)E;
)
...>
}


@site_3_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(char *)((byte *)npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- ((char *)npc_rec)[0x1]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- *(char *)(npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
|
- npc_rec[0x1]
+ (char)((uw_object_hdr_t *)npc_rec)->type_flags_high
)
...>
}


@site_3_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x2) = (char)V;
- *(char *)((char *)npc_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@site_3_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x2) = (char)V;
- *(byte *)((char *)npc_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@site_3_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x2) = (byte)V;
- *(char *)((char *)npc_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@site_3_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x2) = (byte)V;
- *(byte *)((char *)npc_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->position_word = (ushort)V;

...>
}

@site_3_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- ((ushort *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)((ushort *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
)
...>
}


@site_3_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(undefined2 *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- ((undefined2 *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(undefined2 *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
)
...>
}


@site_3_header_w_2_17_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- *(short *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- ((short *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- *(short *)((short *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
|
- *(short *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_signed
)
...>
}


@site_3_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(byte *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- ((byte *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(byte *)((ushort *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- (byte)((ushort *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(byte *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@site_3_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(undefined1 *)((byte *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- ((undefined1 *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x1)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- (undefined1)((ushort *)npc_rec)[0x1]
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(undefined1 *)(npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@site_3_header_w_2_17_address_2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &*(char *)((byte *)npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &((char *)npc_rec)[0x2]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &*(char *)((ushort *)npc_rec + 0x1)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &*(char *)(npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
|
- &npc_rec[0x2]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@site_3_header_w_2_17_store_2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- ((char *)npc_rec)[0x2] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x1) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- *(char *)(npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
|
- npc_rec[0x2] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)E;
)
...>
}


@site_3_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(char *)((byte *)npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- ((char *)npc_rec)[0x2]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(char *)((ushort *)npc_rec + 0x1)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- (char)((ushort *)npc_rec)[0x1]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- *(char *)(npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
|
- npc_rec[0x2]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_low
)
...>
}


@site_3_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(byte *)((byte *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- ((byte *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(byte *)(npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@site_3_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(undefined1 *)((byte *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- ((undefined1 *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(undefined1 *)(npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@site_3_header_w_2_17_address_3@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &*(char *)((byte *)npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &((char *)npc_rec)[0x3]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &*(char *)(npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
|
- &npc_rec[0x3]
+ (char *)&((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@site_3_header_w_2_17_store_3@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- ((char *)npc_rec)[0x3] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- *(char *)(npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
|
- npc_rec[0x3] = E;
+ ((uw_object_hdr_t *)npc_rec)->position_word_high = (byte)E;
)
...>
}


@site_3_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(char *)((byte *)npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- ((char *)npc_rec)[0x3]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- *(char *)(npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
|
- npc_rec[0x3]
+ (char)((uw_object_hdr_t *)npc_rec)->position_word_high
)
...>
}


@site_3_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x4) = (char)V;
- *(char *)((char *)npc_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@site_3_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x4) = (char)V;
- *(byte *)((char *)npc_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@site_3_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x4) = (byte)V;
- *(char *)((char *)npc_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@site_3_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x4) = (byte)V;
- *(byte *)((char *)npc_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->chain_word = (ushort)V;

...>
}

@site_3_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- ((ushort *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)((ushort *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
)
...>
}


@site_3_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(undefined2 *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- ((undefined2 *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(undefined2 *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
)
...>
}


@site_3_header_w_4_34_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- *(short *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- ((short *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- *(short *)((short *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
|
- *(short *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_signed
)
...>
}


@site_3_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(byte *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- ((byte *)npc_rec)[0x4]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(byte *)((ushort *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- (byte)((ushort *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(byte *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@site_3_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(undefined1 *)((byte *)npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- ((undefined1 *)npc_rec)[0x4]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x2)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- (undefined1)((ushort *)npc_rec)[0x2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(undefined1 *)(npc_rec + 0x4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@site_3_header_w_4_34_address_4@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &*(char *)((byte *)npc_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &((char *)npc_rec)[0x4]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &*(char *)((ushort *)npc_rec + 0x2)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &*(char *)(npc_rec + 0x4)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- &npc_rec[0x4]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@site_3_header_w_4_34_store_4@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x4) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x4) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- ((char *)npc_rec)[0x4] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x2) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- *(char *)(npc_rec + 0x4) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
|
- npc_rec[0x4] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_low = (byte)E;
)
...>
}


@site_3_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x4)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(char *)((byte *)npc_rec + 0x4)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- ((char *)npc_rec)[0x4]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(char *)((ushort *)npc_rec + 0x2)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- (char)((ushort *)npc_rec)[0x2]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- *(char *)(npc_rec + 0x4)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
|
- npc_rec[0x4]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_low
)
...>
}


@site_3_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(byte *)((byte *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- ((byte *)npc_rec)[0x5]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(byte *)(npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@site_3_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(undefined1 *)((byte *)npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- ((undefined1 *)npc_rec)[0x5]
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(undefined1 *)(npc_rec + 0x5)
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@site_3_header_w_4_34_address_5@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &*(char *)((byte *)npc_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &((char *)npc_rec)[0x5]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &*(char *)(npc_rec + 0x5)
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- &npc_rec[0x5]
+ (char *)&((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@site_3_header_w_4_34_store_5@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x5) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x5) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- ((char *)npc_rec)[0x5] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- *(char *)(npc_rec + 0x5) = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
|
- npc_rec[0x5] = E;
+ ((uw_object_hdr_t *)npc_rec)->chain_word_high = (byte)E;
)
...>
}


@site_3_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x5)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(char *)((byte *)npc_rec + 0x5)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- ((char *)npc_rec)[0x5]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- *(char *)(npc_rec + 0x5)
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
|
- npc_rec[0x5]
+ (char)((uw_object_hdr_t *)npc_rec)->chain_word_high
)
...>
}


@site_3_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x6) = (char)V;
- *(char *)((char *)npc_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@site_3_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc_rec + 0x6) = (char)V;
- *(byte *)((char *)npc_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@site_3_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x6) = (byte)V;
- *(char *)((char *)npc_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@site_3_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc_rec + 0x6) = (byte)V;
- *(byte *)((char *)npc_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc_rec)->link_word = (ushort)V;

...>
}

@site_3_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- ((ushort *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)((ushort *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
)
...>
}


@site_3_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(undefined2 *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- ((undefined2 *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(undefined2 *)((undefined2 *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(undefined2 *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
)
...>
}


@site_3_header_w_6_51_word_short@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- *(short *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- ((short *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- *(short *)((short *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
|
- *(short *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_signed
)
...>
}


@site_3_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(byte *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- ((byte *)npc_rec)[0x6]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(byte *)((ushort *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- (byte)((ushort *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(byte *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@site_3_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(undefined1 *)((byte *)npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- ((undefined1 *)npc_rec)[0x6]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(undefined1 *)((ushort *)npc_rec + 0x3)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- (undefined1)((ushort *)npc_rec)[0x3]
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(undefined1 *)(npc_rec + 0x6)
+ ((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@site_3_header_w_6_51_address_6@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &*(char *)((byte *)npc_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &((char *)npc_rec)[0x6]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &*(char *)((ushort *)npc_rec + 0x3)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &*(char *)(npc_rec + 0x6)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
|
- &npc_rec[0x6]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@site_3_header_w_6_51_store_6@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x6) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x6) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- ((char *)npc_rec)[0x6] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- *(char *)((ushort *)npc_rec + 0x3) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- *(char *)(npc_rec + 0x6) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
|
- npc_rec[0x6] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_low = (byte)E;
)
...>
}


@site_3_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x6)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(char *)((byte *)npc_rec + 0x6)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- ((char *)npc_rec)[0x6]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(char *)((ushort *)npc_rec + 0x3)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- (char)((ushort *)npc_rec)[0x3]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- *(char *)(npc_rec + 0x6)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
|
- npc_rec[0x6]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_low
)
...>
}


@site_3_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(byte *)((byte *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- ((byte *)npc_rec)[0x7]
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(byte *)(npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@site_3_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(undefined1 *)((byte *)npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- ((undefined1 *)npc_rec)[0x7]
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(undefined1 *)(npc_rec + 0x7)
+ ((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@site_3_header_w_6_51_address_7@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &*(char *)((byte *)npc_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &((char *)npc_rec)[0x7]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &*(char *)(npc_rec + 0x7)
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
|
- &npc_rec[0x7]
+ (char *)&((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@site_3_header_w_6_51_store_7@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x7) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- *(char *)((byte *)npc_rec + 0x7) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- ((char *)npc_rec)[0x7] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- *(char *)(npc_rec + 0x7) = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
|
- npc_rec[0x7] = E;
+ ((uw_object_hdr_t *)npc_rec)->link_word_high = (byte)E;
)
...>
}


@site_3_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x7)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(char *)((byte *)npc_rec + 0x7)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- ((char *)npc_rec)[0x7]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- *(char *)(npc_rec + 0x7)
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
|
- npc_rec[0x7]
+ (char)((uw_object_hdr_t *)npc_rec)->link_word_high
)
...>
}


@npc_ai_default_tick_npc_rec_hit_points_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x8)
+ ((uw_mobile_object_t *)npc_rec)->hit_points
|
- *(byte *)(npc_rec + 0x8)
+ ((uw_mobile_object_t *)npc_rec)->hit_points
)
...>
}

@npc_ai_default_tick_npc_rec_hit_points_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x8)
+ ((uw_mobile_object_t *)npc_rec)->hit_points
|
- *(undefined1 *)(npc_rec + 0x8)
+ ((uw_mobile_object_t *)npc_rec)->hit_points
)
...>
}

@npc_ai_default_tick_npc_rec_hit_points_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x8)
+ (char *)&((uw_mobile_object_t *)npc_rec)->hit_points
|
- &*(char *)(npc_rec + 0x8)
+ (char *)&((uw_mobile_object_t *)npc_rec)->hit_points
|
- &npc_rec[0x8]
+ (char *)&((uw_mobile_object_t *)npc_rec)->hit_points
)
...>
}

@npc_ai_default_tick_npc_rec_hit_points_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x8) = E;
+ ((uw_mobile_object_t *)npc_rec)->hit_points = (byte)E;
|
- *(char *)(npc_rec + 0x8) = E;
+ ((uw_mobile_object_t *)npc_rec)->hit_points = (byte)E;
|
- npc_rec[0x8] = E;
+ ((uw_mobile_object_t *)npc_rec)->hit_points = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_hit_points_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x8)
+ (char)((uw_mobile_object_t *)npc_rec)->hit_points
|
- *(char *)(npc_rec + 0x8)
+ (char)((uw_mobile_object_t *)npc_rec)->hit_points
|
- npc_rec[0x8]
+ (char)((uw_mobile_object_t *)npc_rec)->hit_points
)
...>
}

@npc_ai_default_tick_npc_rec_full_heading_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x9)
+ ((uw_mobile_object_t *)npc_rec)->full_heading
|
- *(byte *)(npc_rec + 0x9)
+ ((uw_mobile_object_t *)npc_rec)->full_heading
)
...>
}

@npc_ai_default_tick_npc_rec_full_heading_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x9)
+ ((uw_mobile_object_t *)npc_rec)->full_heading
|
- *(undefined1 *)(npc_rec + 0x9)
+ ((uw_mobile_object_t *)npc_rec)->full_heading
)
...>
}

@npc_ai_default_tick_npc_rec_full_heading_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x9)
+ (char *)&((uw_mobile_object_t *)npc_rec)->full_heading
|
- &*(char *)(npc_rec + 0x9)
+ (char *)&((uw_mobile_object_t *)npc_rec)->full_heading
|
- &npc_rec[0x9]
+ (char *)&((uw_mobile_object_t *)npc_rec)->full_heading
)
...>
}

@npc_ai_default_tick_npc_rec_full_heading_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x9) = E;
+ ((uw_mobile_object_t *)npc_rec)->full_heading = (byte)E;
|
- *(char *)(npc_rec + 0x9) = E;
+ ((uw_mobile_object_t *)npc_rec)->full_heading = (byte)E;
|
- npc_rec[0x9] = E;
+ ((uw_mobile_object_t *)npc_rec)->full_heading = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_full_heading_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x9)
+ (char)((uw_mobile_object_t *)npc_rec)->full_heading
|
- *(char *)(npc_rec + 0x9)
+ (char)((uw_mobile_object_t *)npc_rec)->full_heading
|
- npc_rec[0x9]
+ (char)((uw_mobile_object_t *)npc_rec)->full_heading
)
...>
}

@npc_ai_default_tick_npc_rec_movement_flags_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0xa)
+ ((uw_mobile_object_t *)npc_rec)->movement_flags
|
- *(byte *)(npc_rec + 0xa)
+ ((uw_mobile_object_t *)npc_rec)->movement_flags
)
...>
}

@npc_ai_default_tick_npc_rec_movement_flags_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0xa)
+ ((uw_mobile_object_t *)npc_rec)->movement_flags
|
- *(undefined1 *)(npc_rec + 0xa)
+ ((uw_mobile_object_t *)npc_rec)->movement_flags
)
...>
}

@npc_ai_default_tick_npc_rec_movement_flags_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0xa)
+ (char *)&((uw_mobile_object_t *)npc_rec)->movement_flags
|
- &*(char *)(npc_rec + 0xa)
+ (char *)&((uw_mobile_object_t *)npc_rec)->movement_flags
|
- &npc_rec[0xa]
+ (char *)&((uw_mobile_object_t *)npc_rec)->movement_flags
)
...>
}

@npc_ai_default_tick_npc_rec_movement_flags_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0xa) = E;
+ ((uw_mobile_object_t *)npc_rec)->movement_flags = (byte)E;
|
- *(char *)(npc_rec + 0xa) = E;
+ ((uw_mobile_object_t *)npc_rec)->movement_flags = (byte)E;
|
- npc_rec[0xa] = E;
+ ((uw_mobile_object_t *)npc_rec)->movement_flags = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_movement_flags_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0xa)
+ (char)((uw_mobile_object_t *)npc_rec)->movement_flags
|
- *(char *)(npc_rec + 0xa)
+ (char)((uw_mobile_object_t *)npc_rec)->movement_flags
|
- npc_rec[0xa]
+ (char)((uw_mobile_object_t *)npc_rec)->movement_flags
)
...>
}

@npc_ai_default_tick_npc_rec_motion_flags_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x13)
+ ((uw_mobile_object_t *)npc_rec)->motion_flags
|
- *(byte *)(npc_rec + 0x13)
+ ((uw_mobile_object_t *)npc_rec)->motion_flags
)
...>
}

@npc_ai_default_tick_npc_rec_motion_flags_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x13)
+ ((uw_mobile_object_t *)npc_rec)->motion_flags
|
- *(undefined1 *)(npc_rec + 0x13)
+ ((uw_mobile_object_t *)npc_rec)->motion_flags
)
...>
}

@npc_ai_default_tick_npc_rec_motion_flags_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x13)
+ (char *)&((uw_mobile_object_t *)npc_rec)->motion_flags
|
- &*(char *)(npc_rec + 0x13)
+ (char *)&((uw_mobile_object_t *)npc_rec)->motion_flags
|
- &npc_rec[0x13]
+ (char *)&((uw_mobile_object_t *)npc_rec)->motion_flags
)
...>
}

@npc_ai_default_tick_npc_rec_motion_flags_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x13) = E;
+ ((uw_mobile_object_t *)npc_rec)->motion_flags = (byte)E;
|
- *(char *)(npc_rec + 0x13) = E;
+ ((uw_mobile_object_t *)npc_rec)->motion_flags = (byte)E;
|
- npc_rec[0x13] = E;
+ ((uw_mobile_object_t *)npc_rec)->motion_flags = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_motion_flags_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x13)
+ (char)((uw_mobile_object_t *)npc_rec)->motion_flags
|
- *(char *)(npc_rec + 0x13)
+ (char)((uw_mobile_object_t *)npc_rec)->motion_flags
|
- npc_rec[0x13]
+ (char)((uw_mobile_object_t *)npc_rec)->motion_flags
)
...>
}

@npc_ai_default_tick_npc_rec_attack_pitch_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x14)
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch
|
- *(byte *)(npc_rec + 0x14)
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch
)
...>
}

@npc_ai_default_tick_npc_rec_attack_pitch_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x14)
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch
|
- *(undefined1 *)(npc_rec + 0x14)
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch
)
...>
}

@npc_ai_default_tick_npc_rec_attack_pitch_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x14)
+ (char *)&((uw_mobile_object_t *)npc_rec)->attack_pitch
|
- &*(char *)(npc_rec + 0x14)
+ (char *)&((uw_mobile_object_t *)npc_rec)->attack_pitch
|
- &npc_rec[0x14]
+ (char *)&((uw_mobile_object_t *)npc_rec)->attack_pitch
)
...>
}

@npc_ai_default_tick_npc_rec_attack_pitch_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x14) = E;
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch = (byte)E;
|
- *(char *)(npc_rec + 0x14) = E;
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch = (byte)E;
|
- npc_rec[0x14] = E;
+ ((uw_mobile_object_t *)npc_rec)->attack_pitch = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_attack_pitch_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x14)
+ (char)((uw_mobile_object_t *)npc_rec)->attack_pitch
|
- *(char *)(npc_rec + 0x14)
+ (char)((uw_mobile_object_t *)npc_rec)->attack_pitch
|
- npc_rec[0x14]
+ (char)((uw_mobile_object_t *)npc_rec)->attack_pitch
)
...>
}

@npc_ai_default_tick_npc_rec_animation_flags_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x15)
+ ((uw_mobile_object_t *)npc_rec)->animation_flags
|
- *(byte *)(npc_rec + 0x15)
+ ((uw_mobile_object_t *)npc_rec)->animation_flags
)
...>
}

@npc_ai_default_tick_npc_rec_animation_flags_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x15)
+ ((uw_mobile_object_t *)npc_rec)->animation_flags
|
- *(undefined1 *)(npc_rec + 0x15)
+ ((uw_mobile_object_t *)npc_rec)->animation_flags
)
...>
}

@npc_ai_default_tick_npc_rec_animation_flags_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x15)
+ (char *)&((uw_mobile_object_t *)npc_rec)->animation_flags
|
- &*(char *)(npc_rec + 0x15)
+ (char *)&((uw_mobile_object_t *)npc_rec)->animation_flags
|
- &npc_rec[0x15]
+ (char *)&((uw_mobile_object_t *)npc_rec)->animation_flags
)
...>
}

@npc_ai_default_tick_npc_rec_animation_flags_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x15) = E;
+ ((uw_mobile_object_t *)npc_rec)->animation_flags = (byte)E;
|
- *(char *)(npc_rec + 0x15) = E;
+ ((uw_mobile_object_t *)npc_rec)->animation_flags = (byte)E;
|
- npc_rec[0x15] = E;
+ ((uw_mobile_object_t *)npc_rec)->animation_flags = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_animation_flags_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x15)
+ (char)((uw_mobile_object_t *)npc_rec)->animation_flags
|
- *(char *)(npc_rec + 0x15)
+ (char)((uw_mobile_object_t *)npc_rec)->animation_flags
|
- npc_rec[0x15]
+ (char)((uw_mobile_object_t *)npc_rec)->animation_flags
)
...>
}

@npc_ai_default_tick_npc_rec_heading_flags_byte@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_rec + 0x18)
+ ((uw_mobile_object_t *)npc_rec)->heading_flags
|
- *(byte *)(npc_rec + 0x18)
+ ((uw_mobile_object_t *)npc_rec)->heading_flags
)
...>
}

@npc_ai_default_tick_npc_rec_heading_flags_undefined1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_rec + 0x18)
+ ((uw_mobile_object_t *)npc_rec)->heading_flags
|
- *(undefined1 *)(npc_rec + 0x18)
+ ((uw_mobile_object_t *)npc_rec)->heading_flags
)
...>
}

@npc_ai_default_tick_npc_rec_heading_flags_address@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_rec + 0x18)
+ (char *)&((uw_mobile_object_t *)npc_rec)->heading_flags
|
- &*(char *)(npc_rec + 0x18)
+ (char *)&((uw_mobile_object_t *)npc_rec)->heading_flags
|
- &npc_rec[0x18]
+ (char *)&((uw_mobile_object_t *)npc_rec)->heading_flags
)
...>
}

@npc_ai_default_tick_npc_rec_heading_flags_store@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x18) = E;
+ ((uw_mobile_object_t *)npc_rec)->heading_flags = (byte)E;
|
- *(char *)(npc_rec + 0x18) = E;
+ ((uw_mobile_object_t *)npc_rec)->heading_flags = (byte)E;
|
- npc_rec[0x18] = E;
+ ((uw_mobile_object_t *)npc_rec)->heading_flags = (byte)E;
)
...>
}

@npc_ai_default_tick_npc_rec_heading_flags_char@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_rec + 0x18)
+ (char)((uw_mobile_object_t *)npc_rec)->heading_flags
|
- *(char *)(npc_rec + 0x18)
+ (char)((uw_mobile_object_t *)npc_rec)->heading_flags
|
- npc_rec[0x18]
+ (char)((uw_mobile_object_t *)npc_rec)->heading_flags
)
...>
}

@site_4_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x16) = (char)V;
- *(char *)((char *)iVar1 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar1)->tile_position = (ushort)V;

...>
}

@site_4_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x16) = (char)V;
- *(byte *)((char *)iVar1 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar1)->tile_position = (ushort)V;

...>
}

@site_4_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x16) = (byte)V;
- *(char *)((char *)iVar1 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)iVar1)->tile_position = (ushort)V;

...>
}

@site_4_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x16) = (byte)V;
- *(byte *)((char *)iVar1 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)iVar1)->tile_position = (ushort)V;

...>
}

@site_4_w_22_0_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- *(ushort *)((byte *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- ((ushort *)iVar1)[0xb]
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- *(ushort *)((ushort *)iVar1 + 0xb)
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- *(ushort *)(iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position
)
...>
}


@site_4_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- *(undefined2 *)((byte *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- ((undefined2 *)iVar1)[0xb]
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- *(undefined2 *)((undefined2 *)iVar1 + 0xb)
+ ((uw_mobile_object_t *)iVar1)->tile_position
|
- *(undefined2 *)(iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position
)
...>
}


@site_4_w_22_0_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_signed
|
- *(short *)((byte *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_signed
|
- ((short *)iVar1)[0xb]
+ ((uw_mobile_object_t *)iVar1)->tile_position_signed
|
- *(short *)((short *)iVar1 + 0xb)
+ ((uw_mobile_object_t *)iVar1)->tile_position_signed
|
- *(short *)(iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_signed
)
...>
}


@site_4_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(byte *)((byte *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- ((byte *)iVar1)[0x16]
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(byte *)((ushort *)iVar1 + 0xb)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- (byte)((ushort *)iVar1)[0xb]
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(byte *)(iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
)
...>
}


@site_4_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(undefined1 *)((byte *)iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- ((undefined1 *)iVar1)[0x16]
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(undefined1 *)((ushort *)iVar1 + 0xb)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- (undefined1)((ushort *)iVar1)[0xb]
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(undefined1 *)(iVar1 + 0x16)
+ ((uw_mobile_object_t *)iVar1)->tile_position_low
)
...>
}


@site_4_w_22_0_address_22@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x16)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_low
|
- &*(char *)((byte *)iVar1 + 0x16)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_low
|
- &((char *)iVar1)[0x16]
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_low
|
- &*(char *)((ushort *)iVar1 + 0xb)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_low
|
- &*(char *)(iVar1 + 0x16)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_low
|
- &iVar1[0x16]
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_low
)
...>
}


@site_4_w_22_0_store_22@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x16) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x16) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_low = (byte)E;
|
- ((char *)iVar1)[0x16] = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0xb) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_low = (byte)E;
|
- *(char *)(iVar1 + 0x16) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_low = (byte)E;
|
- iVar1[0x16] = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_low = (byte)E;
)
...>
}


@site_4_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x16)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(char *)((byte *)iVar1 + 0x16)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
|
- ((char *)iVar1)[0x16]
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(char *)((ushort *)iVar1 + 0xb)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
|
- (char)((ushort *)iVar1)[0xb]
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
|
- *(char *)(iVar1 + 0x16)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
|
- iVar1[0x16]
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_low
)
...>
}


@site_4_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x17)
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
|
- *(byte *)((byte *)iVar1 + 0x17)
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
|
- ((byte *)iVar1)[0x17]
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
|
- *(byte *)(iVar1 + 0x17)
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
)
...>
}


@site_4_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x17)
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
|
- *(undefined1 *)((byte *)iVar1 + 0x17)
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
|
- ((undefined1 *)iVar1)[0x17]
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
|
- *(undefined1 *)(iVar1 + 0x17)
+ ((uw_mobile_object_t *)iVar1)->tile_position_high
)
...>
}


@site_4_w_22_0_address_23@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x17)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_high
|
- &*(char *)((byte *)iVar1 + 0x17)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_high
|
- &((char *)iVar1)[0x17]
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_high
|
- &*(char *)(iVar1 + 0x17)
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_high
|
- &iVar1[0x17]
+ (char *)&((uw_mobile_object_t *)iVar1)->tile_position_high
)
...>
}


@site_4_w_22_0_store_23@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x17) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x17) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_high = (byte)E;
|
- ((char *)iVar1)[0x17] = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_high = (byte)E;
|
- *(char *)(iVar1 + 0x17) = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_high = (byte)E;
|
- iVar1[0x17] = E;
+ ((uw_mobile_object_t *)iVar1)->tile_position_high = (byte)E;
)
...>
}


@site_4_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x17)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_high
|
- *(char *)((byte *)iVar1 + 0x17)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_high
|
- ((char *)iVar1)[0x17]
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_high
|
- *(char *)(iVar1 + 0x17)
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_high
|
- iVar1[0x17]
+ (char)((uw_mobile_object_t *)iVar1)->tile_position_high
)
...>
}


@site_4_field_0_item_id disable drop_cast, is_zero, isnt_zero@
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

@site_4_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(iVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)(iVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar1)->flags_res
)
...>
}

@site_4_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(iVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)(iVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar1)->enchanted
)
...>
}

@site_4_field_0_doordir disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(iVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)(iVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar1)->doordir
)
...>
}

@site_4_field_0_invisible disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(iVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)(iVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar1)->invisible
)
...>
}

@site_4_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)iVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)(iVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)(iVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- *(byte *)(iVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
)
...>
}

@site_4_field_0_zpos disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)(iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
)
...>
}

@site_4_field_0_heading disable drop_cast, is_zero, isnt_zero@
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

@site_4_field_0_ypos disable drop_cast, is_zero, isnt_zero@
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
|
- (*(byte *)(iVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)(iVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar1)->ypos
)
...>
}

@site_4_field_0_xpos disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)iVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)(iVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)(iVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- *(byte *)(iVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
)
...>
}

@site_4_field_0_quality disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)(iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
)
...>
}

@site_4_field_0_next disable drop_cast, is_zero, isnt_zero@
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

@site_4_field_0_owner disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)(iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
)
...>
}

@site_4_field_0_link disable drop_cast, is_zero, isnt_zero@
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

@site_4_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x0) = (char)V;
- *(char *)((char *)iVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@site_4_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x0) = (char)V;
- *(byte *)((char *)iVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@site_4_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x0) = (byte)V;
- *(char *)((char *)iVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@site_4_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x0) = (byte)V;
- *(byte *)((char *)iVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@site_4_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@site_4_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((undefined2 *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@site_4_header_w_0_0_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- ((short *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)((short *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
)
...>
}


@site_4_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((byte *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (byte)((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@site_4_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((undefined1 *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (undefined1)((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@site_4_header_w_0_0_address_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)((byte *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &((char *)iVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)((ushort *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)iVar1
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)(iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &iVar1[0x0]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*iVar1
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@site_4_header_w_0_0_store_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- ((char *)iVar1)[0x0] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)iVar1 = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)(iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- iVar1[0x0] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *iVar1 = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
)
...>
}


@site_4_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)((byte *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((char *)iVar1)[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)((ushort *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (char)((ushort *)iVar1)[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)iVar1
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)(iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- iVar1[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *iVar1
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@site_4_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(byte *)((byte *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((byte *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(byte *)(iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@site_4_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(undefined1 *)((byte *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((undefined1 *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(undefined1 *)(iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@site_4_header_w_0_0_address_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &*(char *)((byte *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &((char *)iVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &*(char *)(iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &iVar1[0x1]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@site_4_header_w_0_0_store_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- ((char *)iVar1)[0x1] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- *(char *)(iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- iVar1[0x1] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
)
...>
}


@site_4_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(char *)((byte *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((char *)iVar1)[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(char *)(iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- iVar1[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@site_4_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x2) = (char)V;
- *(char *)((char *)iVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@site_4_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x2) = (char)V;
- *(byte *)((char *)iVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@site_4_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x2) = (byte)V;
- *(char *)((char *)iVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@site_4_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x2) = (byte)V;
- *(byte *)((char *)iVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@site_4_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@site_4_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((undefined2 *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@site_4_header_w_2_17_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- ((short *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)((short *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
)
...>
}


@site_4_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((byte *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- (byte)((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@site_4_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((undefined1 *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- (undefined1)((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@site_4_header_w_2_17_address_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)((byte *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &((char *)iVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)((ushort *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)(iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &iVar1[0x2]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@site_4_header_w_2_17_store_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- ((char *)iVar1)[0x2] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)(iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- iVar1[0x2] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
)
...>
}


@site_4_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)((byte *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((char *)iVar1)[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)((ushort *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- (char)((ushort *)iVar1)[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)(iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- iVar1[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@site_4_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(byte *)((byte *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((byte *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(byte *)(iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@site_4_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((undefined1 *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(undefined1 *)(iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@site_4_header_w_2_17_address_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &*(char *)((byte *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &((char *)iVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &*(char *)(iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &iVar1[0x3]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@site_4_header_w_2_17_store_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- ((char *)iVar1)[0x3] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- *(char *)(iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- iVar1[0x3] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
)
...>
}


@site_4_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(char *)((byte *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((char *)iVar1)[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(char *)(iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- iVar1[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@site_4_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x4) = (char)V;
- *(char *)((char *)iVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@site_4_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x4) = (char)V;
- *(byte *)((char *)iVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@site_4_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x4) = (byte)V;
- *(char *)((char *)iVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@site_4_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x4) = (byte)V;
- *(byte *)((char *)iVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@site_4_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@site_4_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((undefined2 *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@site_4_header_w_4_34_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- ((short *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)((short *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
)
...>
}


@site_4_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((byte *)iVar1)[0x4]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (byte)((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@site_4_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((undefined1 *)iVar1)[0x4]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (undefined1)((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@site_4_header_w_4_34_address_4@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)((byte *)iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &((char *)iVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)((ushort *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)(iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &iVar1[0x4]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@site_4_header_w_4_34_store_4@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- ((char *)iVar1)[0x4] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)(iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- iVar1[0x4] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
)
...>
}


@site_4_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)((byte *)iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((char *)iVar1)[0x4]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)((ushort *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (char)((ushort *)iVar1)[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)(iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- iVar1[0x4]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@site_4_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(byte *)((byte *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((byte *)iVar1)[0x5]
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(byte *)(iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@site_4_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((undefined1 *)iVar1)[0x5]
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(undefined1 *)(iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@site_4_header_w_4_34_address_5@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &*(char *)((byte *)iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &((char *)iVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &*(char *)(iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &iVar1[0x5]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@site_4_header_w_4_34_store_5@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- ((char *)iVar1)[0x5] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- *(char *)(iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- iVar1[0x5] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
)
...>
}


@site_4_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(char *)((byte *)iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((char *)iVar1)[0x5]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(char *)(iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- iVar1[0x5]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@site_4_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x6) = (char)V;
- *(char *)((char *)iVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@site_4_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x6) = (char)V;
- *(byte *)((char *)iVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@site_4_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x6) = (byte)V;
- *(char *)((char *)iVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@site_4_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x6) = (byte)V;
- *(byte *)((char *)iVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@site_4_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@site_4_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((undefined2 *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@site_4_header_w_6_51_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- ((short *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)((short *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
)
...>
}


@site_4_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((byte *)iVar1)[0x6]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- (byte)((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@site_4_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((undefined1 *)iVar1)[0x6]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- (undefined1)((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@site_4_header_w_6_51_address_6@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)((byte *)iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &((char *)iVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)((ushort *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)(iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &iVar1[0x6]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@site_4_header_w_6_51_store_6@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- ((char *)iVar1)[0x6] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)(iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- iVar1[0x6] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
)
...>
}


@site_4_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)((byte *)iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((char *)iVar1)[0x6]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)((ushort *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- (char)((ushort *)iVar1)[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)(iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- iVar1[0x6]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@site_4_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(byte *)((byte *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((byte *)iVar1)[0x7]
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(byte *)(iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@site_4_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((undefined1 *)iVar1)[0x7]
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(undefined1 *)(iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@site_4_header_w_6_51_address_7@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &*(char *)((byte *)iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &((char *)iVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &*(char *)(iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &iVar1[0x7]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@site_4_header_w_6_51_store_7@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- ((char *)iVar1)[0x7] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- *(char *)(iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- iVar1[0x7] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
)
...>
}


@site_4_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(char *)((byte *)iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((char *)iVar1)[0x7]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(char *)(iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- iVar1[0x7]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@reset_npc_path_cache_iVar1_hit_points_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x8)
+ ((uw_mobile_object_t *)iVar1)->hit_points
|
- *(byte *)(iVar1 + 0x8)
+ ((uw_mobile_object_t *)iVar1)->hit_points
)
...>
}

@reset_npc_path_cache_iVar1_hit_points_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x8)
+ ((uw_mobile_object_t *)iVar1)->hit_points
|
- *(undefined1 *)(iVar1 + 0x8)
+ ((uw_mobile_object_t *)iVar1)->hit_points
)
...>
}

@reset_npc_path_cache_iVar1_hit_points_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x8)
+ (char *)&((uw_mobile_object_t *)iVar1)->hit_points
|
- &*(char *)(iVar1 + 0x8)
+ (char *)&((uw_mobile_object_t *)iVar1)->hit_points
|
- &iVar1[0x8]
+ (char *)&((uw_mobile_object_t *)iVar1)->hit_points
)
...>
}

@reset_npc_path_cache_iVar1_hit_points_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x8) = E;
+ ((uw_mobile_object_t *)iVar1)->hit_points = (byte)E;
|
- *(char *)(iVar1 + 0x8) = E;
+ ((uw_mobile_object_t *)iVar1)->hit_points = (byte)E;
|
- iVar1[0x8] = E;
+ ((uw_mobile_object_t *)iVar1)->hit_points = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_hit_points_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x8)
+ (char)((uw_mobile_object_t *)iVar1)->hit_points
|
- *(char *)(iVar1 + 0x8)
+ (char)((uw_mobile_object_t *)iVar1)->hit_points
|
- iVar1[0x8]
+ (char)((uw_mobile_object_t *)iVar1)->hit_points
)
...>
}

@reset_npc_path_cache_iVar1_full_heading_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x9)
+ ((uw_mobile_object_t *)iVar1)->full_heading
|
- *(byte *)(iVar1 + 0x9)
+ ((uw_mobile_object_t *)iVar1)->full_heading
)
...>
}

@reset_npc_path_cache_iVar1_full_heading_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x9)
+ ((uw_mobile_object_t *)iVar1)->full_heading
|
- *(undefined1 *)(iVar1 + 0x9)
+ ((uw_mobile_object_t *)iVar1)->full_heading
)
...>
}

@reset_npc_path_cache_iVar1_full_heading_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x9)
+ (char *)&((uw_mobile_object_t *)iVar1)->full_heading
|
- &*(char *)(iVar1 + 0x9)
+ (char *)&((uw_mobile_object_t *)iVar1)->full_heading
|
- &iVar1[0x9]
+ (char *)&((uw_mobile_object_t *)iVar1)->full_heading
)
...>
}

@reset_npc_path_cache_iVar1_full_heading_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x9) = E;
+ ((uw_mobile_object_t *)iVar1)->full_heading = (byte)E;
|
- *(char *)(iVar1 + 0x9) = E;
+ ((uw_mobile_object_t *)iVar1)->full_heading = (byte)E;
|
- iVar1[0x9] = E;
+ ((uw_mobile_object_t *)iVar1)->full_heading = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_full_heading_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x9)
+ (char)((uw_mobile_object_t *)iVar1)->full_heading
|
- *(char *)(iVar1 + 0x9)
+ (char)((uw_mobile_object_t *)iVar1)->full_heading
|
- iVar1[0x9]
+ (char)((uw_mobile_object_t *)iVar1)->full_heading
)
...>
}

@reset_npc_path_cache_iVar1_movement_flags_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0xa)
+ ((uw_mobile_object_t *)iVar1)->movement_flags
|
- *(byte *)(iVar1 + 0xa)
+ ((uw_mobile_object_t *)iVar1)->movement_flags
)
...>
}

@reset_npc_path_cache_iVar1_movement_flags_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0xa)
+ ((uw_mobile_object_t *)iVar1)->movement_flags
|
- *(undefined1 *)(iVar1 + 0xa)
+ ((uw_mobile_object_t *)iVar1)->movement_flags
)
...>
}

@reset_npc_path_cache_iVar1_movement_flags_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0xa)
+ (char *)&((uw_mobile_object_t *)iVar1)->movement_flags
|
- &*(char *)(iVar1 + 0xa)
+ (char *)&((uw_mobile_object_t *)iVar1)->movement_flags
|
- &iVar1[0xa]
+ (char *)&((uw_mobile_object_t *)iVar1)->movement_flags
)
...>
}

@reset_npc_path_cache_iVar1_movement_flags_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0xa) = E;
+ ((uw_mobile_object_t *)iVar1)->movement_flags = (byte)E;
|
- *(char *)(iVar1 + 0xa) = E;
+ ((uw_mobile_object_t *)iVar1)->movement_flags = (byte)E;
|
- iVar1[0xa] = E;
+ ((uw_mobile_object_t *)iVar1)->movement_flags = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_movement_flags_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0xa)
+ (char)((uw_mobile_object_t *)iVar1)->movement_flags
|
- *(char *)(iVar1 + 0xa)
+ (char)((uw_mobile_object_t *)iVar1)->movement_flags
|
- iVar1[0xa]
+ (char)((uw_mobile_object_t *)iVar1)->movement_flags
)
...>
}

@reset_npc_path_cache_iVar1_motion_flags_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x13)
+ ((uw_mobile_object_t *)iVar1)->motion_flags
|
- *(byte *)(iVar1 + 0x13)
+ ((uw_mobile_object_t *)iVar1)->motion_flags
)
...>
}

@reset_npc_path_cache_iVar1_motion_flags_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x13)
+ ((uw_mobile_object_t *)iVar1)->motion_flags
|
- *(undefined1 *)(iVar1 + 0x13)
+ ((uw_mobile_object_t *)iVar1)->motion_flags
)
...>
}

@reset_npc_path_cache_iVar1_motion_flags_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x13)
+ (char *)&((uw_mobile_object_t *)iVar1)->motion_flags
|
- &*(char *)(iVar1 + 0x13)
+ (char *)&((uw_mobile_object_t *)iVar1)->motion_flags
|
- &iVar1[0x13]
+ (char *)&((uw_mobile_object_t *)iVar1)->motion_flags
)
...>
}

@reset_npc_path_cache_iVar1_motion_flags_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x13) = E;
+ ((uw_mobile_object_t *)iVar1)->motion_flags = (byte)E;
|
- *(char *)(iVar1 + 0x13) = E;
+ ((uw_mobile_object_t *)iVar1)->motion_flags = (byte)E;
|
- iVar1[0x13] = E;
+ ((uw_mobile_object_t *)iVar1)->motion_flags = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_motion_flags_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x13)
+ (char)((uw_mobile_object_t *)iVar1)->motion_flags
|
- *(char *)(iVar1 + 0x13)
+ (char)((uw_mobile_object_t *)iVar1)->motion_flags
|
- iVar1[0x13]
+ (char)((uw_mobile_object_t *)iVar1)->motion_flags
)
...>
}

@reset_npc_path_cache_iVar1_attack_pitch_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x14)
+ ((uw_mobile_object_t *)iVar1)->attack_pitch
|
- *(byte *)(iVar1 + 0x14)
+ ((uw_mobile_object_t *)iVar1)->attack_pitch
)
...>
}

@reset_npc_path_cache_iVar1_attack_pitch_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x14)
+ ((uw_mobile_object_t *)iVar1)->attack_pitch
|
- *(undefined1 *)(iVar1 + 0x14)
+ ((uw_mobile_object_t *)iVar1)->attack_pitch
)
...>
}

@reset_npc_path_cache_iVar1_attack_pitch_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x14)
+ (char *)&((uw_mobile_object_t *)iVar1)->attack_pitch
|
- &*(char *)(iVar1 + 0x14)
+ (char *)&((uw_mobile_object_t *)iVar1)->attack_pitch
|
- &iVar1[0x14]
+ (char *)&((uw_mobile_object_t *)iVar1)->attack_pitch
)
...>
}

@reset_npc_path_cache_iVar1_attack_pitch_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x14) = E;
+ ((uw_mobile_object_t *)iVar1)->attack_pitch = (byte)E;
|
- *(char *)(iVar1 + 0x14) = E;
+ ((uw_mobile_object_t *)iVar1)->attack_pitch = (byte)E;
|
- iVar1[0x14] = E;
+ ((uw_mobile_object_t *)iVar1)->attack_pitch = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_attack_pitch_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x14)
+ (char)((uw_mobile_object_t *)iVar1)->attack_pitch
|
- *(char *)(iVar1 + 0x14)
+ (char)((uw_mobile_object_t *)iVar1)->attack_pitch
|
- iVar1[0x14]
+ (char)((uw_mobile_object_t *)iVar1)->attack_pitch
)
...>
}

@reset_npc_path_cache_iVar1_animation_flags_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x15)
+ ((uw_mobile_object_t *)iVar1)->animation_flags
|
- *(byte *)(iVar1 + 0x15)
+ ((uw_mobile_object_t *)iVar1)->animation_flags
)
...>
}

@reset_npc_path_cache_iVar1_animation_flags_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x15)
+ ((uw_mobile_object_t *)iVar1)->animation_flags
|
- *(undefined1 *)(iVar1 + 0x15)
+ ((uw_mobile_object_t *)iVar1)->animation_flags
)
...>
}

@reset_npc_path_cache_iVar1_animation_flags_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x15)
+ (char *)&((uw_mobile_object_t *)iVar1)->animation_flags
|
- &*(char *)(iVar1 + 0x15)
+ (char *)&((uw_mobile_object_t *)iVar1)->animation_flags
|
- &iVar1[0x15]
+ (char *)&((uw_mobile_object_t *)iVar1)->animation_flags
)
...>
}

@reset_npc_path_cache_iVar1_animation_flags_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x15) = E;
+ ((uw_mobile_object_t *)iVar1)->animation_flags = (byte)E;
|
- *(char *)(iVar1 + 0x15) = E;
+ ((uw_mobile_object_t *)iVar1)->animation_flags = (byte)E;
|
- iVar1[0x15] = E;
+ ((uw_mobile_object_t *)iVar1)->animation_flags = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_animation_flags_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x15)
+ (char)((uw_mobile_object_t *)iVar1)->animation_flags
|
- *(char *)(iVar1 + 0x15)
+ (char)((uw_mobile_object_t *)iVar1)->animation_flags
|
- iVar1[0x15]
+ (char)((uw_mobile_object_t *)iVar1)->animation_flags
)
...>
}

@reset_npc_path_cache_iVar1_heading_flags_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x18)
+ ((uw_mobile_object_t *)iVar1)->heading_flags
|
- *(byte *)(iVar1 + 0x18)
+ ((uw_mobile_object_t *)iVar1)->heading_flags
)
...>
}

@reset_npc_path_cache_iVar1_heading_flags_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x18)
+ ((uw_mobile_object_t *)iVar1)->heading_flags
|
- *(undefined1 *)(iVar1 + 0x18)
+ ((uw_mobile_object_t *)iVar1)->heading_flags
)
...>
}

@reset_npc_path_cache_iVar1_heading_flags_address@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x18)
+ (char *)&((uw_mobile_object_t *)iVar1)->heading_flags
|
- &*(char *)(iVar1 + 0x18)
+ (char *)&((uw_mobile_object_t *)iVar1)->heading_flags
|
- &iVar1[0x18]
+ (char *)&((uw_mobile_object_t *)iVar1)->heading_flags
)
...>
}

@reset_npc_path_cache_iVar1_heading_flags_store@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x18) = E;
+ ((uw_mobile_object_t *)iVar1)->heading_flags = (byte)E;
|
- *(char *)(iVar1 + 0x18) = E;
+ ((uw_mobile_object_t *)iVar1)->heading_flags = (byte)E;
|
- iVar1[0x18] = E;
+ ((uw_mobile_object_t *)iVar1)->heading_flags = (byte)E;
)
...>
}

@reset_npc_path_cache_iVar1_heading_flags_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x18)
+ (char)((uw_mobile_object_t *)iVar1)->heading_flags
|
- *(char *)(iVar1 + 0x18)
+ (char)((uw_mobile_object_t *)iVar1)->heading_flags
|
- iVar1[0x18]
+ (char)((uw_mobile_object_t *)iVar1)->heading_flags
)
...>
}
