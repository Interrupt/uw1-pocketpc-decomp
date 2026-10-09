@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x16) = (char)V;
- *(char *)((char *)puVar3 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar3)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x16) = (char)V;
- *(byte *)((char *)puVar3 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar3)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x16) = (byte)V;
- *(char *)((char *)puVar3 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar3)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x16) = (byte)V;
- *(byte *)((char *)puVar3 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar3)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- *(ushort *)((byte *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- ((ushort *)puVar3)[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- *(ushort *)((ushort *)puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- *(ushort *)(puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- puVar3[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- *(undefined2 *)((byte *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- ((undefined2 *)puVar3)[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- *(undefined2 *)((undefined2 *)puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- *(undefined2 *)(puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position
|
- puVar3[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position_signed
|
- *(short *)((byte *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position_signed
|
- ((short *)puVar3)[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position_signed
|
- *(short *)((short *)puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position_signed
|
- *(short *)(puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(byte *)((byte *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- ((byte *)puVar3)[0x16]
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(byte *)((ushort *)puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- (byte)((ushort *)puVar3)[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(byte *)(puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- (byte)puVar3[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(undefined1 *)((byte *)puVar3 + 0x16)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- ((undefined1 *)puVar3)[0x16]
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(undefined1 *)((ushort *)puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- (undefined1)((ushort *)puVar3)[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(undefined1 *)(puVar3 + 0xb)
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
|
- (undefined1)puVar3[0xb]
+ ((uw_mobile_object_t *)puVar3)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_low
|
- &*(char *)((byte *)puVar3 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_low
|
- &((char *)puVar3)[0x16]
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_low
|
- &*(char *)((ushort *)puVar3 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_low
|
- &*(char *)(puVar3 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_low = (byte)E;
|
- ((char *)puVar3)[0x16] = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_low = (byte)E;
|
- *(char *)(puVar3 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x16)
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(char *)((byte *)puVar3 + 0x16)
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
|
- ((char *)puVar3)[0x16]
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(char *)((ushort *)puVar3 + 0xb)
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
|
- (char)((ushort *)puVar3)[0xb]
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
|
- *(char *)(puVar3 + 0xb)
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
|
- (char)puVar3[0xb]
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x17)
+ ((uw_mobile_object_t *)puVar3)->tile_position_high
|
- *(byte *)((byte *)puVar3 + 0x17)
+ ((uw_mobile_object_t *)puVar3)->tile_position_high
|
- ((byte *)puVar3)[0x17]
+ ((uw_mobile_object_t *)puVar3)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x17)
+ ((uw_mobile_object_t *)puVar3)->tile_position_high
|
- *(undefined1 *)((byte *)puVar3 + 0x17)
+ ((uw_mobile_object_t *)puVar3)->tile_position_high
|
- ((undefined1 *)puVar3)[0x17]
+ ((uw_mobile_object_t *)puVar3)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_high
|
- &*(char *)((byte *)puVar3 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_high
|
- &((char *)puVar3)[0x17]
+ (char *)&((uw_mobile_object_t *)puVar3)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_high = (byte)E;
|
- ((char *)puVar3)[0x17] = E;
+ ((uw_mobile_object_t *)puVar3)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x17)
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_high
|
- *(char *)((byte *)puVar3 + 0x17)
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_high
|
- ((char *)puVar3)[0x17]
+ (char)((uw_mobile_object_t *)puVar3)->tile_position_high
)
...>
}


@site_0_field_0_item_id disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_doordir disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_invisible disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)puVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar3)->is_quant
)
...>
}

@site_0_field_0_zpos disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_heading disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_ypos disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_xpos disable drop_cast, is_zero, isnt_zero@
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
|
- *(byte *)((char *)puVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar3)->xpos
)
...>
}

@site_0_field_0_quality disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_next disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_owner disable drop_cast, is_zero, isnt_zero@
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

@site_0_field_0_link disable drop_cast, is_zero, isnt_zero@
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

@site_0_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x0) = (char)V;
- *(char *)((char *)puVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x0) = (char)V;
- *(byte *)((char *)puVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x0) = (byte)V;
- *(char *)((char *)puVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x0) = (byte)V;
- *(byte *)((char *)puVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@site_0_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((undefined2 *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@site_0_header_w_0_0_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- ((short *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)((short *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
)
...>
}


@site_0_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((byte *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (byte)((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (byte)puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((undefined1 *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (undefined1)((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)(puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (undefined1)puVar3[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@site_0_header_w_0_0_address_0@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)((byte *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &((char *)puVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)((ushort *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)puVar3
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)(puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@site_0_header_w_0_0_store_0@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- ((char *)puVar3)[0x0] = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)puVar3 = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)(puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)((byte *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((char *)puVar3)[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)((ushort *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (char)((ushort *)puVar3)[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)puVar3
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)(puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (char)puVar3[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(byte *)((byte *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((byte *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@site_0_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(undefined1 *)((byte *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((undefined1 *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@site_0_header_w_0_0_address_1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
|
- &*(char *)((byte *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
|
- &((char *)puVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@site_0_header_w_0_0_store_1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
|
- ((char *)puVar3)[0x1] = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(char *)((byte *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((char *)puVar3)[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@site_0_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x2) = (char)V;
- *(char *)((char *)puVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x2) = (char)V;
- *(byte *)((char *)puVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x2) = (byte)V;
- *(char *)((char *)puVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x2) = (byte)V;
- *(byte *)((char *)puVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@site_0_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((undefined2 *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@site_0_header_w_2_17_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- ((short *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)((short *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
)
...>
}


@site_0_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((byte *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (byte)((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (byte)puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((undefined1 *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (undefined1)((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)(puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (undefined1)puVar3[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@site_0_header_w_2_17_address_2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)((byte *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &((char *)puVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)((ushort *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)(puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@site_0_header_w_2_17_store_2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- ((char *)puVar3)[0x2] = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)(puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)((byte *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((char *)puVar3)[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)((ushort *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- (char)((ushort *)puVar3)[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)(puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- (char)puVar3[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(byte *)((byte *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((byte *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@site_0_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((undefined1 *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@site_0_header_w_2_17_address_3@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
|
- &*(char *)((byte *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
|
- &((char *)puVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@site_0_header_w_2_17_store_3@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
|
- ((char *)puVar3)[0x3] = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(char *)((byte *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((char *)puVar3)[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@site_0_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x4) = (char)V;
- *(char *)((char *)puVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x4) = (char)V;
- *(byte *)((char *)puVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x4) = (byte)V;
- *(char *)((char *)puVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x4) = (byte)V;
- *(byte *)((char *)puVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@site_0_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((undefined2 *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@site_0_header_w_4_34_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- ((short *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)((short *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
)
...>
}


@site_0_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((byte *)puVar3)[0x4]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (byte)((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (byte)puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((undefined1 *)puVar3)[0x4]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (undefined1)((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)(puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (undefined1)puVar3[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@site_0_header_w_4_34_address_4@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)((byte *)puVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &((char *)puVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)((ushort *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)(puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@site_0_header_w_4_34_store_4@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- ((char *)puVar3)[0x4] = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)(puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x4)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)((byte *)puVar3 + 0x4)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((char *)puVar3)[0x4]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)((ushort *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (char)((ushort *)puVar3)[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)(puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (char)puVar3[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(byte *)((byte *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((byte *)puVar3)[0x5]
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@site_0_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((undefined1 *)puVar3)[0x5]
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@site_0_header_w_4_34_address_5@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
|
- &*(char *)((byte *)puVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
|
- &((char *)puVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@site_0_header_w_4_34_store_5@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
|
- ((char *)puVar3)[0x5] = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x5)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(char *)((byte *)puVar3 + 0x5)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((char *)puVar3)[0x5]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@site_0_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x6) = (char)V;
- *(char *)((char *)puVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x6) = (char)V;
- *(byte *)((char *)puVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x6) = (byte)V;
- *(char *)((char *)puVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x6) = (byte)V;
- *(byte *)((char *)puVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@site_0_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((undefined2 *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@site_0_header_w_6_51_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- ((short *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)((short *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
)
...>
}


@site_0_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((byte *)puVar3)[0x6]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (byte)((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (byte)puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((undefined1 *)puVar3)[0x6]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (undefined1)((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)(puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (undefined1)puVar3[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@site_0_header_w_6_51_address_6@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)((byte *)puVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &((char *)puVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)((ushort *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)(puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@site_0_header_w_6_51_store_6@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- ((char *)puVar3)[0x6] = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)(puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x6)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)((byte *)puVar3 + 0x6)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((char *)puVar3)[0x6]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)((ushort *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- (char)((ushort *)puVar3)[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)(puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- (char)puVar3[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(byte *)((byte *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((byte *)puVar3)[0x7]
+ ((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@site_0_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((undefined1 *)puVar3)[0x7]
+ ((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@site_0_header_w_6_51_address_7@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
|
- &*(char *)((byte *)puVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
|
- &((char *)puVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@site_0_header_w_6_51_store_7@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
|
- ((char *)puVar3)[0x7] = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x7)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(char *)((byte *)puVar3 + 0x7)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((char *)puVar3)[0x7]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@pick_object_under_cursor_puVar3_hit_points_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x8)
+ ((uw_mobile_object_t *)puVar3)->hit_points
|
- *(byte *)(puVar3 + 0x4)
+ ((uw_mobile_object_t *)puVar3)->hit_points
|
- (byte)puVar3[0x4]
+ ((uw_mobile_object_t *)puVar3)->hit_points
)
...>
}

@pick_object_under_cursor_puVar3_hit_points_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x8)
+ ((uw_mobile_object_t *)puVar3)->hit_points
|
- *(undefined1 *)(puVar3 + 0x4)
+ ((uw_mobile_object_t *)puVar3)->hit_points
|
- (undefined1)puVar3[0x4]
+ ((uw_mobile_object_t *)puVar3)->hit_points
)
...>
}

@pick_object_under_cursor_puVar3_hit_points_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x8)
+ (char *)&((uw_mobile_object_t *)puVar3)->hit_points
|
- &*(char *)(puVar3 + 0x4)
+ (char *)&((uw_mobile_object_t *)puVar3)->hit_points
)
...>
}

@pick_object_under_cursor_puVar3_hit_points_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x8) = E;
+ ((uw_mobile_object_t *)puVar3)->hit_points = (byte)E;
|
- *(char *)(puVar3 + 0x4) = E;
+ ((uw_mobile_object_t *)puVar3)->hit_points = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_hit_points_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x8)
+ (char)((uw_mobile_object_t *)puVar3)->hit_points
|
- *(char *)(puVar3 + 0x4)
+ (char)((uw_mobile_object_t *)puVar3)->hit_points
|
- (char)puVar3[0x4]
+ (char)((uw_mobile_object_t *)puVar3)->hit_points
)
...>
}

@pick_object_under_cursor_puVar3_full_heading_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x9)
+ ((uw_mobile_object_t *)puVar3)->full_heading
)
...>
}

@pick_object_under_cursor_puVar3_full_heading_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x9)
+ ((uw_mobile_object_t *)puVar3)->full_heading
)
...>
}

@pick_object_under_cursor_puVar3_full_heading_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x9)
+ (char *)&((uw_mobile_object_t *)puVar3)->full_heading
)
...>
}

@pick_object_under_cursor_puVar3_full_heading_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x9) = E;
+ ((uw_mobile_object_t *)puVar3)->full_heading = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_full_heading_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x9)
+ (char)((uw_mobile_object_t *)puVar3)->full_heading
)
...>
}

@pick_object_under_cursor_puVar3_movement_flags_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0xa)
+ ((uw_mobile_object_t *)puVar3)->movement_flags
|
- *(byte *)(puVar3 + 0x5)
+ ((uw_mobile_object_t *)puVar3)->movement_flags
|
- (byte)puVar3[0x5]
+ ((uw_mobile_object_t *)puVar3)->movement_flags
)
...>
}

@pick_object_under_cursor_puVar3_movement_flags_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0xa)
+ ((uw_mobile_object_t *)puVar3)->movement_flags
|
- *(undefined1 *)(puVar3 + 0x5)
+ ((uw_mobile_object_t *)puVar3)->movement_flags
|
- (undefined1)puVar3[0x5]
+ ((uw_mobile_object_t *)puVar3)->movement_flags
)
...>
}

@pick_object_under_cursor_puVar3_movement_flags_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar3)->movement_flags
|
- &*(char *)(puVar3 + 0x5)
+ (char *)&((uw_mobile_object_t *)puVar3)->movement_flags
)
...>
}

@pick_object_under_cursor_puVar3_movement_flags_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar3)->movement_flags = (byte)E;
|
- *(char *)(puVar3 + 0x5) = E;
+ ((uw_mobile_object_t *)puVar3)->movement_flags = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_movement_flags_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0xa)
+ (char)((uw_mobile_object_t *)puVar3)->movement_flags
|
- *(char *)(puVar3 + 0x5)
+ (char)((uw_mobile_object_t *)puVar3)->movement_flags
|
- (char)puVar3[0x5]
+ (char)((uw_mobile_object_t *)puVar3)->movement_flags
)
...>
}

@pick_object_under_cursor_puVar3_motion_flags_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x13)
+ ((uw_mobile_object_t *)puVar3)->motion_flags
)
...>
}

@pick_object_under_cursor_puVar3_motion_flags_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x13)
+ ((uw_mobile_object_t *)puVar3)->motion_flags
)
...>
}

@pick_object_under_cursor_puVar3_motion_flags_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x13)
+ (char *)&((uw_mobile_object_t *)puVar3)->motion_flags
)
...>
}

@pick_object_under_cursor_puVar3_motion_flags_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x13) = E;
+ ((uw_mobile_object_t *)puVar3)->motion_flags = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_motion_flags_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x13)
+ (char)((uw_mobile_object_t *)puVar3)->motion_flags
)
...>
}

@pick_object_under_cursor_puVar3_attack_pitch_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x14)
+ ((uw_mobile_object_t *)puVar3)->attack_pitch
|
- *(byte *)(puVar3 + 0xa)
+ ((uw_mobile_object_t *)puVar3)->attack_pitch
|
- (byte)puVar3[0xa]
+ ((uw_mobile_object_t *)puVar3)->attack_pitch
)
...>
}

@pick_object_under_cursor_puVar3_attack_pitch_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x14)
+ ((uw_mobile_object_t *)puVar3)->attack_pitch
|
- *(undefined1 *)(puVar3 + 0xa)
+ ((uw_mobile_object_t *)puVar3)->attack_pitch
|
- (undefined1)puVar3[0xa]
+ ((uw_mobile_object_t *)puVar3)->attack_pitch
)
...>
}

@pick_object_under_cursor_puVar3_attack_pitch_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x14)
+ (char *)&((uw_mobile_object_t *)puVar3)->attack_pitch
|
- &*(char *)(puVar3 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar3)->attack_pitch
)
...>
}

@pick_object_under_cursor_puVar3_attack_pitch_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x14) = E;
+ ((uw_mobile_object_t *)puVar3)->attack_pitch = (byte)E;
|
- *(char *)(puVar3 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar3)->attack_pitch = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_attack_pitch_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x14)
+ (char)((uw_mobile_object_t *)puVar3)->attack_pitch
|
- *(char *)(puVar3 + 0xa)
+ (char)((uw_mobile_object_t *)puVar3)->attack_pitch
|
- (char)puVar3[0xa]
+ (char)((uw_mobile_object_t *)puVar3)->attack_pitch
)
...>
}

@pick_object_under_cursor_puVar3_animation_flags_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x15)
+ ((uw_mobile_object_t *)puVar3)->animation_flags
)
...>
}

@pick_object_under_cursor_puVar3_animation_flags_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x15)
+ ((uw_mobile_object_t *)puVar3)->animation_flags
)
...>
}

@pick_object_under_cursor_puVar3_animation_flags_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x15)
+ (char *)&((uw_mobile_object_t *)puVar3)->animation_flags
)
...>
}

@pick_object_under_cursor_puVar3_animation_flags_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x15) = E;
+ ((uw_mobile_object_t *)puVar3)->animation_flags = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_animation_flags_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x15)
+ (char)((uw_mobile_object_t *)puVar3)->animation_flags
)
...>
}

@pick_object_under_cursor_puVar3_heading_flags_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x18)
+ ((uw_mobile_object_t *)puVar3)->heading_flags
|
- *(byte *)(puVar3 + 0xc)
+ ((uw_mobile_object_t *)puVar3)->heading_flags
|
- (byte)puVar3[0xc]
+ ((uw_mobile_object_t *)puVar3)->heading_flags
)
...>
}

@pick_object_under_cursor_puVar3_heading_flags_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x18)
+ ((uw_mobile_object_t *)puVar3)->heading_flags
|
- *(undefined1 *)(puVar3 + 0xc)
+ ((uw_mobile_object_t *)puVar3)->heading_flags
|
- (undefined1)puVar3[0xc]
+ ((uw_mobile_object_t *)puVar3)->heading_flags
)
...>
}

@pick_object_under_cursor_puVar3_heading_flags_address@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x18)
+ (char *)&((uw_mobile_object_t *)puVar3)->heading_flags
|
- &*(char *)(puVar3 + 0xc)
+ (char *)&((uw_mobile_object_t *)puVar3)->heading_flags
)
...>
}

@pick_object_under_cursor_puVar3_heading_flags_store@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x18) = E;
+ ((uw_mobile_object_t *)puVar3)->heading_flags = (byte)E;
|
- *(char *)(puVar3 + 0xc) = E;
+ ((uw_mobile_object_t *)puVar3)->heading_flags = (byte)E;
)
...>
}

@pick_object_under_cursor_puVar3_heading_flags_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x18)
+ (char)((uw_mobile_object_t *)puVar3)->heading_flags
|
- *(char *)(puVar3 + 0xc)
+ (char)((uw_mobile_object_t *)puVar3)->heading_flags
|
- (char)puVar3[0xc]
+ (char)((uw_mobile_object_t *)puVar3)->heading_flags
)
...>
}
