@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x16) = (char)V;
- *(char *)((char *)puVar6 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar6)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x16) = (char)V;
- *(byte *)((char *)puVar6 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar6)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x16) = (byte)V;
- *(char *)((char *)puVar6 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar6)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x16) = (byte)V;
- *(byte *)((char *)puVar6 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar6)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- *(ushort *)((byte *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- ((ushort *)puVar6)[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- *(ushort *)((ushort *)puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- *(ushort *)(puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- puVar6[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- *(undefined2 *)((byte *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- ((undefined2 *)puVar6)[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- *(undefined2 *)((undefined2 *)puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- *(undefined2 *)(puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position
|
- puVar6[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position_signed
|
- *(short *)((byte *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position_signed
|
- ((short *)puVar6)[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position_signed
|
- *(short *)((short *)puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position_signed
|
- *(short *)(puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(byte *)((byte *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- ((byte *)puVar6)[0x16]
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(byte *)((ushort *)puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- (byte)((ushort *)puVar6)[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(byte *)(puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- (byte)puVar6[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(undefined1 *)((byte *)puVar6 + 0x16)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- ((undefined1 *)puVar6)[0x16]
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(undefined1 *)((ushort *)puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- (undefined1)((ushort *)puVar6)[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(undefined1 *)(puVar6 + 0xb)
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
|
- (undefined1)puVar6[0xb]
+ ((uw_mobile_object_t *)puVar6)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_low
|
- &*(char *)((byte *)puVar6 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_low
|
- &((char *)puVar6)[0x16]
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_low
|
- &*(char *)((ushort *)puVar6 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_low
|
- &*(char *)(puVar6 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_low = (byte)E;
|
- ((char *)puVar6)[0x16] = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_low = (byte)E;
|
- *(char *)(puVar6 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x16)
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(char *)((byte *)puVar6 + 0x16)
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
|
- ((char *)puVar6)[0x16]
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(char *)((ushort *)puVar6 + 0xb)
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
|
- (char)((ushort *)puVar6)[0xb]
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
|
- *(char *)(puVar6 + 0xb)
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
|
- (char)puVar6[0xb]
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x17)
+ ((uw_mobile_object_t *)puVar6)->tile_position_high
|
- *(byte *)((byte *)puVar6 + 0x17)
+ ((uw_mobile_object_t *)puVar6)->tile_position_high
|
- ((byte *)puVar6)[0x17]
+ ((uw_mobile_object_t *)puVar6)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x17)
+ ((uw_mobile_object_t *)puVar6)->tile_position_high
|
- *(undefined1 *)((byte *)puVar6 + 0x17)
+ ((uw_mobile_object_t *)puVar6)->tile_position_high
|
- ((undefined1 *)puVar6)[0x17]
+ ((uw_mobile_object_t *)puVar6)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_high
|
- &*(char *)((byte *)puVar6 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_high
|
- &((char *)puVar6)[0x17]
+ (char *)&((uw_mobile_object_t *)puVar6)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_high = (byte)E;
|
- ((char *)puVar6)[0x17] = E;
+ ((uw_mobile_object_t *)puVar6)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x17)
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_high
|
- *(char *)((byte *)puVar6 + 0x17)
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_high
|
- ((char *)puVar6)[0x17]
+ (char)((uw_mobile_object_t *)puVar6)->tile_position_high
)
...>
}


@site_0_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- ((ushort *)puVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- *(ushort *)puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- puVar6[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- *puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
)
...>
}

@site_0_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
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

@site_0_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@site_0_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((undefined2 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@site_0_header_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- ((short *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((short *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
)
...>
}


@site_0_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((byte *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (byte)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (byte)puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((undefined1 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (undefined1)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (undefined1)puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@site_0_header_w_0_0_address_0@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((byte *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &((char *)puVar6)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((ushort *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)puVar6
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)(puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@site_0_header_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- ((char *)puVar6)[0x0] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)puVar6 = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)(puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((byte *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((char *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((ushort *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (char)((ushort *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)puVar6
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)(puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (char)puVar6[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(byte *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((byte *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@site_0_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(undefined1 *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((undefined1 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@site_0_header_w_0_0_address_1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &*(char *)((byte *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &((char *)puVar6)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@site_0_header_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- ((char *)puVar6)[0x1] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(char *)((byte *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((char *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@site_0_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@site_0_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((undefined2 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@site_0_header_w_2_17_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- ((short *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((short *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
)
...>
}


@site_0_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((byte *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (byte)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (byte)puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((undefined1 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (undefined1)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (undefined1)puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@site_0_header_w_2_17_address_2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((byte *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &((char *)puVar6)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((ushort *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)(puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@site_0_header_w_2_17_store_2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- ((char *)puVar6)[0x2] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)(puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((byte *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((char *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((ushort *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- (char)((ushort *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)(puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- (char)puVar6[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(byte *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((byte *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@site_0_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((undefined1 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@site_0_header_w_2_17_address_3@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &*(char *)((byte *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &((char *)puVar6)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@site_0_header_w_2_17_store_3@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- ((char *)puVar6)[0x3] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(char *)((byte *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((char *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@site_0_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@site_0_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((undefined2 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@site_0_header_w_4_34_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- ((short *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((short *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
)
...>
}


@site_0_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((byte *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (byte)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (byte)puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((undefined1 *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (undefined1)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (undefined1)puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@site_0_header_w_4_34_address_4@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((byte *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &((char *)puVar6)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((ushort *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)(puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@site_0_header_w_4_34_store_4@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- ((char *)puVar6)[0x4] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)(puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((byte *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((char *)puVar6)[0x4]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((ushort *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (char)((ushort *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)(puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (char)puVar6[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(byte *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((byte *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@site_0_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((undefined1 *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@site_0_header_w_4_34_address_5@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &*(char *)((byte *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &((char *)puVar6)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@site_0_header_w_4_34_store_5@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- ((char *)puVar6)[0x5] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(char *)((byte *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((char *)puVar6)[0x5]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@site_0_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@site_0_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((undefined2 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@site_0_header_w_6_51_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- ((short *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((short *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
)
...>
}


@site_0_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((byte *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (byte)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (byte)puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((undefined1 *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (undefined1)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (undefined1)puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@site_0_header_w_6_51_address_6@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((byte *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &((char *)puVar6)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((ushort *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)(puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@site_0_header_w_6_51_store_6@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- ((char *)puVar6)[0x6] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)(puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((byte *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((char *)puVar6)[0x6]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((ushort *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- (char)((ushort *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)(puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- (char)puVar6[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(byte *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((byte *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@site_0_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((undefined1 *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@site_0_header_w_6_51_address_7@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &*(char *)((byte *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &((char *)puVar6)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@site_0_header_w_6_51_store_7@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- ((char *)puVar6)[0x7] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(char *)((byte *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((char *)puVar6)[0x7]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@apply_melee_damage_puVar6_hit_points_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x8)
+ ((uw_mobile_object_t *)puVar6)->hit_points
|
- *(byte *)(puVar6 + 0x4)
+ ((uw_mobile_object_t *)puVar6)->hit_points
|
- (byte)puVar6[0x4]
+ ((uw_mobile_object_t *)puVar6)->hit_points
)
...>
}

@apply_melee_damage_puVar6_hit_points_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x8)
+ ((uw_mobile_object_t *)puVar6)->hit_points
|
- *(undefined1 *)(puVar6 + 0x4)
+ ((uw_mobile_object_t *)puVar6)->hit_points
|
- (undefined1)puVar6[0x4]
+ ((uw_mobile_object_t *)puVar6)->hit_points
)
...>
}

@apply_melee_damage_puVar6_hit_points_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x8)
+ (char *)&((uw_mobile_object_t *)puVar6)->hit_points
|
- &*(char *)(puVar6 + 0x4)
+ (char *)&((uw_mobile_object_t *)puVar6)->hit_points
)
...>
}

@apply_melee_damage_puVar6_hit_points_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x8) = E;
+ ((uw_mobile_object_t *)puVar6)->hit_points = (byte)E;
|
- *(char *)(puVar6 + 0x4) = E;
+ ((uw_mobile_object_t *)puVar6)->hit_points = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_hit_points_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x8)
+ (char)((uw_mobile_object_t *)puVar6)->hit_points
|
- *(char *)(puVar6 + 0x4)
+ (char)((uw_mobile_object_t *)puVar6)->hit_points
|
- (char)puVar6[0x4]
+ (char)((uw_mobile_object_t *)puVar6)->hit_points
)
...>
}

@apply_melee_damage_puVar6_full_heading_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x9)
+ ((uw_mobile_object_t *)puVar6)->full_heading
)
...>
}

@apply_melee_damage_puVar6_full_heading_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x9)
+ ((uw_mobile_object_t *)puVar6)->full_heading
)
...>
}

@apply_melee_damage_puVar6_full_heading_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x9)
+ (char *)&((uw_mobile_object_t *)puVar6)->full_heading
)
...>
}

@apply_melee_damage_puVar6_full_heading_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x9) = E;
+ ((uw_mobile_object_t *)puVar6)->full_heading = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_full_heading_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x9)
+ (char)((uw_mobile_object_t *)puVar6)->full_heading
)
...>
}

@apply_melee_damage_puVar6_movement_flags_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0xa)
+ ((uw_mobile_object_t *)puVar6)->movement_flags
|
- *(byte *)(puVar6 + 0x5)
+ ((uw_mobile_object_t *)puVar6)->movement_flags
|
- (byte)puVar6[0x5]
+ ((uw_mobile_object_t *)puVar6)->movement_flags
)
...>
}

@apply_melee_damage_puVar6_movement_flags_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0xa)
+ ((uw_mobile_object_t *)puVar6)->movement_flags
|
- *(undefined1 *)(puVar6 + 0x5)
+ ((uw_mobile_object_t *)puVar6)->movement_flags
|
- (undefined1)puVar6[0x5]
+ ((uw_mobile_object_t *)puVar6)->movement_flags
)
...>
}

@apply_melee_damage_puVar6_movement_flags_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar6)->movement_flags
|
- &*(char *)(puVar6 + 0x5)
+ (char *)&((uw_mobile_object_t *)puVar6)->movement_flags
)
...>
}

@apply_melee_damage_puVar6_movement_flags_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar6)->movement_flags = (byte)E;
|
- *(char *)(puVar6 + 0x5) = E;
+ ((uw_mobile_object_t *)puVar6)->movement_flags = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_movement_flags_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0xa)
+ (char)((uw_mobile_object_t *)puVar6)->movement_flags
|
- *(char *)(puVar6 + 0x5)
+ (char)((uw_mobile_object_t *)puVar6)->movement_flags
|
- (char)puVar6[0x5]
+ (char)((uw_mobile_object_t *)puVar6)->movement_flags
)
...>
}

@apply_melee_damage_puVar6_motion_flags_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x13)
+ ((uw_mobile_object_t *)puVar6)->motion_flags
)
...>
}

@apply_melee_damage_puVar6_motion_flags_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x13)
+ ((uw_mobile_object_t *)puVar6)->motion_flags
)
...>
}

@apply_melee_damage_puVar6_motion_flags_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x13)
+ (char *)&((uw_mobile_object_t *)puVar6)->motion_flags
)
...>
}

@apply_melee_damage_puVar6_motion_flags_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x13) = E;
+ ((uw_mobile_object_t *)puVar6)->motion_flags = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_motion_flags_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x13)
+ (char)((uw_mobile_object_t *)puVar6)->motion_flags
)
...>
}

@apply_melee_damage_puVar6_attack_pitch_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x14)
+ ((uw_mobile_object_t *)puVar6)->attack_pitch
|
- *(byte *)(puVar6 + 0xa)
+ ((uw_mobile_object_t *)puVar6)->attack_pitch
|
- (byte)puVar6[0xa]
+ ((uw_mobile_object_t *)puVar6)->attack_pitch
)
...>
}

@apply_melee_damage_puVar6_attack_pitch_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x14)
+ ((uw_mobile_object_t *)puVar6)->attack_pitch
|
- *(undefined1 *)(puVar6 + 0xa)
+ ((uw_mobile_object_t *)puVar6)->attack_pitch
|
- (undefined1)puVar6[0xa]
+ ((uw_mobile_object_t *)puVar6)->attack_pitch
)
...>
}

@apply_melee_damage_puVar6_attack_pitch_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x14)
+ (char *)&((uw_mobile_object_t *)puVar6)->attack_pitch
|
- &*(char *)(puVar6 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar6)->attack_pitch
)
...>
}

@apply_melee_damage_puVar6_attack_pitch_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x14) = E;
+ ((uw_mobile_object_t *)puVar6)->attack_pitch = (byte)E;
|
- *(char *)(puVar6 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar6)->attack_pitch = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_attack_pitch_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x14)
+ (char)((uw_mobile_object_t *)puVar6)->attack_pitch
|
- *(char *)(puVar6 + 0xa)
+ (char)((uw_mobile_object_t *)puVar6)->attack_pitch
|
- (char)puVar6[0xa]
+ (char)((uw_mobile_object_t *)puVar6)->attack_pitch
)
...>
}

@apply_melee_damage_puVar6_animation_flags_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x15)
+ ((uw_mobile_object_t *)puVar6)->animation_flags
)
...>
}

@apply_melee_damage_puVar6_animation_flags_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x15)
+ ((uw_mobile_object_t *)puVar6)->animation_flags
)
...>
}

@apply_melee_damage_puVar6_animation_flags_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x15)
+ (char *)&((uw_mobile_object_t *)puVar6)->animation_flags
)
...>
}

@apply_melee_damage_puVar6_animation_flags_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x15) = E;
+ ((uw_mobile_object_t *)puVar6)->animation_flags = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_animation_flags_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x15)
+ (char)((uw_mobile_object_t *)puVar6)->animation_flags
)
...>
}

@apply_melee_damage_puVar6_heading_flags_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x18)
+ ((uw_mobile_object_t *)puVar6)->heading_flags
|
- *(byte *)(puVar6 + 0xc)
+ ((uw_mobile_object_t *)puVar6)->heading_flags
|
- (byte)puVar6[0xc]
+ ((uw_mobile_object_t *)puVar6)->heading_flags
)
...>
}

@apply_melee_damage_puVar6_heading_flags_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x18)
+ ((uw_mobile_object_t *)puVar6)->heading_flags
|
- *(undefined1 *)(puVar6 + 0xc)
+ ((uw_mobile_object_t *)puVar6)->heading_flags
|
- (undefined1)puVar6[0xc]
+ ((uw_mobile_object_t *)puVar6)->heading_flags
)
...>
}

@apply_melee_damage_puVar6_heading_flags_address@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x18)
+ (char *)&((uw_mobile_object_t *)puVar6)->heading_flags
|
- &*(char *)(puVar6 + 0xc)
+ (char *)&((uw_mobile_object_t *)puVar6)->heading_flags
)
...>
}

@apply_melee_damage_puVar6_heading_flags_store@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x18) = E;
+ ((uw_mobile_object_t *)puVar6)->heading_flags = (byte)E;
|
- *(char *)(puVar6 + 0xc) = E;
+ ((uw_mobile_object_t *)puVar6)->heading_flags = (byte)E;
)
...>
}

@apply_melee_damage_puVar6_heading_flags_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x18)
+ (char)((uw_mobile_object_t *)puVar6)->heading_flags
|
- *(char *)(puVar6 + 0xc)
+ (char)((uw_mobile_object_t *)puVar6)->heading_flags
|
- (char)puVar6[0xc]
+ (char)((uw_mobile_object_t *)puVar6)->heading_flags
)
...>
}

@site_1_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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


@site_1_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- ((ushort *)object)[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- *(ushort *)object & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- object[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- *object & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
)
...>
}

@site_1_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(apply_object_durability_damage\)$";
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


@apply_object_durability_damage_object_hit_points_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_hit_points_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_hit_points_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_hit_points_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_hit_points_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_full_heading_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_full_heading_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_full_heading_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_full_heading_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_full_heading_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_movement_flags_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_movement_flags_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_movement_flags_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_movement_flags_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_movement_flags_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_motion_flags_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_motion_flags_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_motion_flags_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_motion_flags_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_motion_flags_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_attack_pitch_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_attack_pitch_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_attack_pitch_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_attack_pitch_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_attack_pitch_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_animation_flags_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_animation_flags_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_animation_flags_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_animation_flags_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_animation_flags_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_heading_flags_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_heading_flags_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_heading_flags_address@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_heading_flags_store@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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

@apply_object_durability_damage_object_heading_flags_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
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
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x16) = (char)V;
- *(char *)((char *)puVar4 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar4)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x16) = (char)V;
- *(byte *)((char *)puVar4 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar4)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x16) = (byte)V;
- *(char *)((char *)puVar4 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar4)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x16) = (byte)V;
- *(byte *)((char *)puVar4 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar4)->tile_position = (ushort)V;

...>
}

@site_2_w_22_0_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- *(ushort *)((byte *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- ((ushort *)puVar4)[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- *(ushort *)((ushort *)puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- *(ushort *)(puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- puVar4[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position
)
...>
}


@site_2_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- *(undefined2 *)((byte *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- ((undefined2 *)puVar4)[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- *(undefined2 *)((undefined2 *)puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- *(undefined2 *)(puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position
|
- puVar4[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position
)
...>
}


@site_2_w_22_0_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position_signed
|
- *(short *)((byte *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position_signed
|
- ((short *)puVar4)[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position_signed
|
- *(short *)((short *)puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position_signed
|
- *(short *)(puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position_signed
)
...>
}


@site_2_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(byte *)((byte *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- ((byte *)puVar4)[0x16]
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(byte *)((ushort *)puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- (byte)((ushort *)puVar4)[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(byte *)(puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- (byte)puVar4[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
)
...>
}


@site_2_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(undefined1 *)((byte *)puVar4 + 0x16)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- ((undefined1 *)puVar4)[0x16]
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(undefined1 *)((ushort *)puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- (undefined1)((ushort *)puVar4)[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(undefined1 *)(puVar4 + 0xb)
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
|
- (undefined1)puVar4[0xb]
+ ((uw_mobile_object_t *)puVar4)->tile_position_low
)
...>
}


@site_2_w_22_0_address_22@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_low
|
- &*(char *)((byte *)puVar4 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_low
|
- &((char *)puVar4)[0x16]
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_low
|
- &*(char *)((ushort *)puVar4 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_low
|
- &*(char *)(puVar4 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_low
)
...>
}


@site_2_w_22_0_store_22@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_low = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_low = (byte)E;
|
- ((char *)puVar4)[0x16] = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)puVar4 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_low = (byte)E;
|
- *(char *)(puVar4 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_low = (byte)E;
)
...>
}


@site_2_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x16)
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(char *)((byte *)puVar4 + 0x16)
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
|
- ((char *)puVar4)[0x16]
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(char *)((ushort *)puVar4 + 0xb)
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
|
- (char)((ushort *)puVar4)[0xb]
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
|
- *(char *)(puVar4 + 0xb)
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
|
- (char)puVar4[0xb]
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_low
)
...>
}


@site_2_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x17)
+ ((uw_mobile_object_t *)puVar4)->tile_position_high
|
- *(byte *)((byte *)puVar4 + 0x17)
+ ((uw_mobile_object_t *)puVar4)->tile_position_high
|
- ((byte *)puVar4)[0x17]
+ ((uw_mobile_object_t *)puVar4)->tile_position_high
)
...>
}


@site_2_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x17)
+ ((uw_mobile_object_t *)puVar4)->tile_position_high
|
- *(undefined1 *)((byte *)puVar4 + 0x17)
+ ((uw_mobile_object_t *)puVar4)->tile_position_high
|
- ((undefined1 *)puVar4)[0x17]
+ ((uw_mobile_object_t *)puVar4)->tile_position_high
)
...>
}


@site_2_w_22_0_address_23@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_high
|
- &*(char *)((byte *)puVar4 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_high
|
- &((char *)puVar4)[0x17]
+ (char *)&((uw_mobile_object_t *)puVar4)->tile_position_high
)
...>
}


@site_2_w_22_0_store_23@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_high = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_high = (byte)E;
|
- ((char *)puVar4)[0x17] = E;
+ ((uw_mobile_object_t *)puVar4)->tile_position_high = (byte)E;
)
...>
}


@site_2_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x17)
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_high
|
- *(char *)((byte *)puVar4 + 0x17)
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_high
|
- ((char *)puVar4)[0x17]
+ (char)((uw_mobile_object_t *)puVar4)->tile_position_high
)
...>
}


@site_2_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- ((ushort *)puVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *(ushort *)puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- puVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
)
...>
}

@site_2_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (((ushort *)puVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (((ushort *)puVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)puVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)puVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (puVar4[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (puVar4[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*puVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*puVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar4)->flags_res
)
...>
}

@site_2_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (((ushort *)puVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (((ushort *)puVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)puVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)puVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (puVar4[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (puVar4[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*puVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*puVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar4)->enchanted
)
...>
}

@site_2_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (((ushort *)puVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (((ushort *)puVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)puVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)puVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (puVar4[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (puVar4[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*puVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*puVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar4)->doordir
)
...>
}

@site_2_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (((ushort *)puVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (((ushort *)puVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)puVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)puVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (puVar4[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (puVar4[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*puVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*puVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar4)->invisible
)
...>
}

@site_2_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(ushort *)((char *)puVar4 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- ((ushort *)puVar4)[0] >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(ushort *)puVar4 >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (puVar4[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (puVar4[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- puVar4[0] >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *puVar4 >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(byte *)((char *)puVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
)
...>
}

@site_2_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- ((ushort *)puVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- puVar4[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- *(byte *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- (byte)puVar4[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
)
...>
}

@site_2_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (((ushort *)puVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (((ushort *)puVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (puVar4[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (puVar4[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
)
...>
}

@site_2_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (((ushort *)puVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (((ushort *)puVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (puVar4[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (puVar4[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar4)->ypos
)
...>
}

@site_2_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- *(ushort *)((char *)puVar4 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- ((ushort *)puVar4)[1] >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (puVar4[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (puVar4[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- puVar4[1] >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- *(byte *)((char *)puVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
)
...>
}

@site_2_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- ((ushort *)puVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- puVar4[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- *(byte *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- (byte)puVar4[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
)
...>
}

@site_2_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (*(ushort *)((char *)puVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- *(ushort *)((char *)puVar4 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- ((ushort *)puVar4)[2] >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (puVar4[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (puVar4[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- puVar4[2] >> 6
+ ((uw_object_hdr_t *)puVar4)->next
)
...>
}

@site_2_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- ((ushort *)puVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- puVar4[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- *(byte *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- (byte)puVar4[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
)
...>
}

@site_2_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (*(ushort *)((char *)puVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- *(ushort *)((char *)puVar4 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- ((ushort *)puVar4)[3] >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (puVar4[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (puVar4[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- puVar4[3] >> 6
+ ((uw_object_hdr_t *)puVar4)->link
)
...>
}

@site_2_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x0) = (char)V;
- *(char *)((char *)puVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)V;

...>
}

@site_2_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x0) = (char)V;
- *(byte *)((char *)puVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)V;

...>
}

@site_2_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x0) = (byte)V;
- *(char *)((char *)puVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)V;

...>
}

@site_2_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x0) = (byte)V;
- *(byte *)((char *)puVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)V;

...>
}

@site_2_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(ushort *)((byte *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- ((ushort *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(ushort *)((ushort *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(ushort *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}


@site_2_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(undefined2 *)((byte *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- ((undefined2 *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(undefined2 *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}


@site_2_header_w_0_0_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_signed
|
- *(short *)((byte *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_signed
|
- ((short *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_signed
|
- *(short *)((short *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_signed
|
- *(short *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_signed
)
...>
}


@site_2_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(byte *)((byte *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- ((byte *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(byte *)((ushort *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (byte)((ushort *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(byte *)puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(byte *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (byte)puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@site_2_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(undefined1 *)((byte *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- ((undefined1 *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (undefined1)((ushort *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(undefined1 *)puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(undefined1 *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (undefined1)puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@site_2_header_w_0_0_address_0@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)((byte *)puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &((char *)puVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)((ushort *)puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)puVar4
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)(puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@site_2_header_w_0_0_store_0@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
|
- ((char *)puVar4)[0x0] = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
|
- *(char *)puVar4 = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
|
- *(char *)(puVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
)
...>
}


@site_2_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x0)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(char *)((byte *)puVar4 + 0x0)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- ((char *)puVar4)[0x0]
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(char *)((ushort *)puVar4 + 0x0)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (char)((ushort *)puVar4)[0x0]
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(char *)puVar4
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- *(char *)(puVar4 + 0x0)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (char)puVar4[0x0]
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@site_2_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->type_flags_high
|
- *(byte *)((byte *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->type_flags_high
|
- ((byte *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->type_flags_high
)
...>
}


@site_2_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->type_flags_high
|
- *(undefined1 *)((byte *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->type_flags_high
|
- ((undefined1 *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->type_flags_high
)
...>
}


@site_2_header_w_0_0_address_1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_high
|
- &*(char *)((byte *)puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_high
|
- &((char *)puVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_high
)
...>
}


@site_2_header_w_0_0_store_1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)E;
|
- ((char *)puVar4)[0x1] = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)E;
)
...>
}


@site_2_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x1)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_high
|
- *(char *)((byte *)puVar4 + 0x1)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_high
|
- ((char *)puVar4)[0x1]
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_high
)
...>
}


@site_2_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x2) = (char)V;
- *(char *)((char *)puVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->position_word = (ushort)V;

...>
}

@site_2_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x2) = (char)V;
- *(byte *)((char *)puVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->position_word = (ushort)V;

...>
}

@site_2_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x2) = (byte)V;
- *(char *)((char *)puVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->position_word = (ushort)V;

...>
}

@site_2_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x2) = (byte)V;
- *(byte *)((char *)puVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->position_word = (ushort)V;

...>
}

@site_2_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(ushort *)((byte *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- ((ushort *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(ushort *)((ushort *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(ushort *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}


@site_2_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(undefined2 *)((byte *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- ((undefined2 *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(undefined2 *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}


@site_2_header_w_2_17_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word_signed
|
- *(short *)((byte *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word_signed
|
- ((short *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_signed
|
- *(short *)((short *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_signed
|
- *(short *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_signed
)
...>
}


@site_2_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(byte *)((byte *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- ((byte *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(byte *)((ushort *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- (byte)((ushort *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(byte *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- (byte)puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@site_2_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(undefined1 *)((byte *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- ((undefined1 *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(undefined1 *)((ushort *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- (undefined1)((ushort *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(undefined1 *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- (undefined1)puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@site_2_header_w_2_17_address_2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &*(char *)((byte *)puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &((char *)puVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &*(char *)((ushort *)puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &*(char *)(puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@site_2_header_w_2_17_store_2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)E;
|
- ((char *)puVar4)[0x2] = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)E;
|
- *(char *)(puVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)E;
)
...>
}


@site_2_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x2)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(char *)((byte *)puVar4 + 0x2)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- ((char *)puVar4)[0x2]
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(char *)((ushort *)puVar4 + 0x1)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- (char)((ushort *)puVar4)[0x1]
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- *(char *)(puVar4 + 0x1)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- (char)puVar4[0x1]
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@site_2_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->position_word_high
|
- *(byte *)((byte *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->position_word_high
|
- ((byte *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->position_word_high
)
...>
}


@site_2_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->position_word_high
|
- *(undefined1 *)((byte *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->position_word_high
|
- ((undefined1 *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->position_word_high
)
...>
}


@site_2_header_w_2_17_address_3@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_high
|
- &*(char *)((byte *)puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_high
|
- &((char *)puVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_high
)
...>
}


@site_2_header_w_2_17_store_3@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)E;
|
- ((char *)puVar4)[0x3] = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)E;
)
...>
}


@site_2_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x3)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_high
|
- *(char *)((byte *)puVar4 + 0x3)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_high
|
- ((char *)puVar4)[0x3]
+ (char)((uw_object_hdr_t *)puVar4)->position_word_high
)
...>
}


@site_2_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x4) = (char)V;
- *(char *)((char *)puVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->chain_word = (ushort)V;

...>
}

@site_2_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x4) = (char)V;
- *(byte *)((char *)puVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->chain_word = (ushort)V;

...>
}

@site_2_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x4) = (byte)V;
- *(char *)((char *)puVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->chain_word = (ushort)V;

...>
}

@site_2_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x4) = (byte)V;
- *(byte *)((char *)puVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->chain_word = (ushort)V;

...>
}

@site_2_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(ushort *)((byte *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- ((ushort *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(ushort *)((ushort *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(ushort *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}


@site_2_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(undefined2 *)((byte *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- ((undefined2 *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(undefined2 *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}


@site_2_header_w_4_34_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word_signed
|
- *(short *)((byte *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word_signed
|
- ((short *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_signed
|
- *(short *)((short *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_signed
|
- *(short *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_signed
)
...>
}


@site_2_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(byte *)((byte *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- ((byte *)puVar4)[0x4]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(byte *)((ushort *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (byte)((ushort *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(byte *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (byte)puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@site_2_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(undefined1 *)((byte *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- ((undefined1 *)puVar4)[0x4]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (undefined1)((ushort *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(undefined1 *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (undefined1)puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@site_2_header_w_4_34_address_4@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &*(char *)((byte *)puVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &((char *)puVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &*(char *)((ushort *)puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &*(char *)(puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@site_2_header_w_4_34_store_4@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_low = (byte)E;
|
- ((char *)puVar4)[0x4] = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_low = (byte)E;
|
- *(char *)(puVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_low = (byte)E;
)
...>
}


@site_2_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x4)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(char *)((byte *)puVar4 + 0x4)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- ((char *)puVar4)[0x4]
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(char *)((ushort *)puVar4 + 0x2)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (char)((ushort *)puVar4)[0x2]
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- *(char *)(puVar4 + 0x2)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (char)puVar4[0x2]
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@site_2_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x5)
+ ((uw_object_hdr_t *)puVar4)->chain_word_high
|
- *(byte *)((byte *)puVar4 + 0x5)
+ ((uw_object_hdr_t *)puVar4)->chain_word_high
|
- ((byte *)puVar4)[0x5]
+ ((uw_object_hdr_t *)puVar4)->chain_word_high
)
...>
}


@site_2_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x5)
+ ((uw_object_hdr_t *)puVar4)->chain_word_high
|
- *(undefined1 *)((byte *)puVar4 + 0x5)
+ ((uw_object_hdr_t *)puVar4)->chain_word_high
|
- ((undefined1 *)puVar4)[0x5]
+ ((uw_object_hdr_t *)puVar4)->chain_word_high
)
...>
}


@site_2_header_w_4_34_address_5@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_high
|
- &*(char *)((byte *)puVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_high
|
- &((char *)puVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_high
)
...>
}


@site_2_header_w_4_34_store_5@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_high = (byte)E;
|
- ((char *)puVar4)[0x5] = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_high = (byte)E;
)
...>
}


@site_2_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x5)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_high
|
- *(char *)((byte *)puVar4 + 0x5)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_high
|
- ((char *)puVar4)[0x5]
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_high
)
...>
}


@site_2_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x6) = (char)V;
- *(char *)((char *)puVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->link_word = (ushort)V;

...>
}

@site_2_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar4 + 0x6) = (char)V;
- *(byte *)((char *)puVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->link_word = (ushort)V;

...>
}

@site_2_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x6) = (byte)V;
- *(char *)((char *)puVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->link_word = (ushort)V;

...>
}

@site_2_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar4 + 0x6) = (byte)V;
- *(byte *)((char *)puVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar4)->link_word = (ushort)V;

...>
}

@site_2_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(ushort *)((byte *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- ((ushort *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(ushort *)((ushort *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(ushort *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}


@site_2_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(undefined2 *)((byte *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- ((undefined2 *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(undefined2 *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}


@site_2_header_w_6_51_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word_signed
|
- *(short *)((byte *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word_signed
|
- ((short *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_signed
|
- *(short *)((short *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_signed
|
- *(short *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_signed
)
...>
}


@site_2_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(byte *)((byte *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- ((byte *)puVar4)[0x6]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(byte *)((ushort *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- (byte)((ushort *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(byte *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- (byte)puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@site_2_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(undefined1 *)((byte *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- ((undefined1 *)puVar4)[0x6]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(undefined1 *)((ushort *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- (undefined1)((ushort *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(undefined1 *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- (undefined1)puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@site_2_header_w_6_51_address_6@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &*(char *)((byte *)puVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &((char *)puVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &*(char *)((ushort *)puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &*(char *)(puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@site_2_header_w_6_51_store_6@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_low = (byte)E;
|
- ((char *)puVar4)[0x6] = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_low = (byte)E;
|
- *(char *)(puVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_low = (byte)E;
)
...>
}


@site_2_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x6)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(char *)((byte *)puVar4 + 0x6)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- ((char *)puVar4)[0x6]
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(char *)((ushort *)puVar4 + 0x3)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- (char)((ushort *)puVar4)[0x3]
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- *(char *)(puVar4 + 0x3)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- (char)puVar4[0x3]
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@site_2_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x7)
+ ((uw_object_hdr_t *)puVar4)->link_word_high
|
- *(byte *)((byte *)puVar4 + 0x7)
+ ((uw_object_hdr_t *)puVar4)->link_word_high
|
- ((byte *)puVar4)[0x7]
+ ((uw_object_hdr_t *)puVar4)->link_word_high
)
...>
}


@site_2_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x7)
+ ((uw_object_hdr_t *)puVar4)->link_word_high
|
- *(undefined1 *)((byte *)puVar4 + 0x7)
+ ((uw_object_hdr_t *)puVar4)->link_word_high
|
- ((undefined1 *)puVar4)[0x7]
+ ((uw_object_hdr_t *)puVar4)->link_word_high
)
...>
}


@site_2_header_w_6_51_address_7@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_high
|
- &*(char *)((byte *)puVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_high
|
- &((char *)puVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_high
)
...>
}


@site_2_header_w_6_51_store_7@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)E;
|
- ((char *)puVar4)[0x7] = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)E;
)
...>
}


@site_2_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x7)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_high
|
- *(char *)((byte *)puVar4 + 0x7)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_high
|
- ((char *)puVar4)[0x7]
+ (char)((uw_object_hdr_t *)puVar4)->link_word_high
)
...>
}


@resolve_collision_candidate_interaction_puVar4_hit_points_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x8)
+ ((uw_mobile_object_t *)puVar4)->hit_points
|
- *(byte *)(puVar4 + 0x4)
+ ((uw_mobile_object_t *)puVar4)->hit_points
|
- (byte)puVar4[0x4]
+ ((uw_mobile_object_t *)puVar4)->hit_points
)
...>
}

@resolve_collision_candidate_interaction_puVar4_hit_points_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x8)
+ ((uw_mobile_object_t *)puVar4)->hit_points
|
- *(undefined1 *)(puVar4 + 0x4)
+ ((uw_mobile_object_t *)puVar4)->hit_points
|
- (undefined1)puVar4[0x4]
+ ((uw_mobile_object_t *)puVar4)->hit_points
)
...>
}

@resolve_collision_candidate_interaction_puVar4_hit_points_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x8)
+ (char *)&((uw_mobile_object_t *)puVar4)->hit_points
|
- &*(char *)(puVar4 + 0x4)
+ (char *)&((uw_mobile_object_t *)puVar4)->hit_points
)
...>
}

@resolve_collision_candidate_interaction_puVar4_hit_points_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x8) = E;
+ ((uw_mobile_object_t *)puVar4)->hit_points = (byte)E;
|
- *(char *)(puVar4 + 0x4) = E;
+ ((uw_mobile_object_t *)puVar4)->hit_points = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_hit_points_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x8)
+ (char)((uw_mobile_object_t *)puVar4)->hit_points
|
- *(char *)(puVar4 + 0x4)
+ (char)((uw_mobile_object_t *)puVar4)->hit_points
|
- (char)puVar4[0x4]
+ (char)((uw_mobile_object_t *)puVar4)->hit_points
)
...>
}

@resolve_collision_candidate_interaction_puVar4_full_heading_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x9)
+ ((uw_mobile_object_t *)puVar4)->full_heading
)
...>
}

@resolve_collision_candidate_interaction_puVar4_full_heading_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x9)
+ ((uw_mobile_object_t *)puVar4)->full_heading
)
...>
}

@resolve_collision_candidate_interaction_puVar4_full_heading_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x9)
+ (char *)&((uw_mobile_object_t *)puVar4)->full_heading
)
...>
}

@resolve_collision_candidate_interaction_puVar4_full_heading_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x9) = E;
+ ((uw_mobile_object_t *)puVar4)->full_heading = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_full_heading_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x9)
+ (char)((uw_mobile_object_t *)puVar4)->full_heading
)
...>
}

@resolve_collision_candidate_interaction_puVar4_movement_flags_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0xa)
+ ((uw_mobile_object_t *)puVar4)->movement_flags
|
- *(byte *)(puVar4 + 0x5)
+ ((uw_mobile_object_t *)puVar4)->movement_flags
|
- (byte)puVar4[0x5]
+ ((uw_mobile_object_t *)puVar4)->movement_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_movement_flags_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0xa)
+ ((uw_mobile_object_t *)puVar4)->movement_flags
|
- *(undefined1 *)(puVar4 + 0x5)
+ ((uw_mobile_object_t *)puVar4)->movement_flags
|
- (undefined1)puVar4[0x5]
+ ((uw_mobile_object_t *)puVar4)->movement_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_movement_flags_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar4)->movement_flags
|
- &*(char *)(puVar4 + 0x5)
+ (char *)&((uw_mobile_object_t *)puVar4)->movement_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_movement_flags_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar4)->movement_flags = (byte)E;
|
- *(char *)(puVar4 + 0x5) = E;
+ ((uw_mobile_object_t *)puVar4)->movement_flags = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_movement_flags_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0xa)
+ (char)((uw_mobile_object_t *)puVar4)->movement_flags
|
- *(char *)(puVar4 + 0x5)
+ (char)((uw_mobile_object_t *)puVar4)->movement_flags
|
- (char)puVar4[0x5]
+ (char)((uw_mobile_object_t *)puVar4)->movement_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_motion_flags_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x13)
+ ((uw_mobile_object_t *)puVar4)->motion_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_motion_flags_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x13)
+ ((uw_mobile_object_t *)puVar4)->motion_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_motion_flags_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x13)
+ (char *)&((uw_mobile_object_t *)puVar4)->motion_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_motion_flags_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x13) = E;
+ ((uw_mobile_object_t *)puVar4)->motion_flags = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_motion_flags_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x13)
+ (char)((uw_mobile_object_t *)puVar4)->motion_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_attack_pitch_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x14)
+ ((uw_mobile_object_t *)puVar4)->attack_pitch
|
- *(byte *)(puVar4 + 0xa)
+ ((uw_mobile_object_t *)puVar4)->attack_pitch
|
- (byte)puVar4[0xa]
+ ((uw_mobile_object_t *)puVar4)->attack_pitch
)
...>
}

@resolve_collision_candidate_interaction_puVar4_attack_pitch_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x14)
+ ((uw_mobile_object_t *)puVar4)->attack_pitch
|
- *(undefined1 *)(puVar4 + 0xa)
+ ((uw_mobile_object_t *)puVar4)->attack_pitch
|
- (undefined1)puVar4[0xa]
+ ((uw_mobile_object_t *)puVar4)->attack_pitch
)
...>
}

@resolve_collision_candidate_interaction_puVar4_attack_pitch_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x14)
+ (char *)&((uw_mobile_object_t *)puVar4)->attack_pitch
|
- &*(char *)(puVar4 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar4)->attack_pitch
)
...>
}

@resolve_collision_candidate_interaction_puVar4_attack_pitch_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x14) = E;
+ ((uw_mobile_object_t *)puVar4)->attack_pitch = (byte)E;
|
- *(char *)(puVar4 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar4)->attack_pitch = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_attack_pitch_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x14)
+ (char)((uw_mobile_object_t *)puVar4)->attack_pitch
|
- *(char *)(puVar4 + 0xa)
+ (char)((uw_mobile_object_t *)puVar4)->attack_pitch
|
- (char)puVar4[0xa]
+ (char)((uw_mobile_object_t *)puVar4)->attack_pitch
)
...>
}

@resolve_collision_candidate_interaction_puVar4_animation_flags_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x15)
+ ((uw_mobile_object_t *)puVar4)->animation_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_animation_flags_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x15)
+ ((uw_mobile_object_t *)puVar4)->animation_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_animation_flags_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x15)
+ (char *)&((uw_mobile_object_t *)puVar4)->animation_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_animation_flags_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x15) = E;
+ ((uw_mobile_object_t *)puVar4)->animation_flags = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_animation_flags_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x15)
+ (char)((uw_mobile_object_t *)puVar4)->animation_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_heading_flags_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar4 + 0x18)
+ ((uw_mobile_object_t *)puVar4)->heading_flags
|
- *(byte *)(puVar4 + 0xc)
+ ((uw_mobile_object_t *)puVar4)->heading_flags
|
- (byte)puVar4[0xc]
+ ((uw_mobile_object_t *)puVar4)->heading_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_heading_flags_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar4 + 0x18)
+ ((uw_mobile_object_t *)puVar4)->heading_flags
|
- *(undefined1 *)(puVar4 + 0xc)
+ ((uw_mobile_object_t *)puVar4)->heading_flags
|
- (undefined1)puVar4[0xc]
+ ((uw_mobile_object_t *)puVar4)->heading_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_heading_flags_address@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x18)
+ (char *)&((uw_mobile_object_t *)puVar4)->heading_flags
|
- &*(char *)(puVar4 + 0xc)
+ (char *)&((uw_mobile_object_t *)puVar4)->heading_flags
)
...>
}

@resolve_collision_candidate_interaction_puVar4_heading_flags_store@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x18) = E;
+ ((uw_mobile_object_t *)puVar4)->heading_flags = (byte)E;
|
- *(char *)(puVar4 + 0xc) = E;
+ ((uw_mobile_object_t *)puVar4)->heading_flags = (byte)E;
)
...>
}

@resolve_collision_candidate_interaction_puVar4_heading_flags_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar4 + 0x18)
+ (char)((uw_mobile_object_t *)puVar4)->heading_flags
|
- *(char *)(puVar4 + 0xc)
+ (char)((uw_mobile_object_t *)puVar4)->heading_flags
|
- (char)puVar4[0xc]
+ (char)((uw_mobile_object_t *)puVar4)->heading_flags
)
...>
}
