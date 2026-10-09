@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x16) = (char)V;
- *(char *)((char *)g_player_object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)g_player_object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x16) = (char)V;
- *(byte *)((char *)g_player_object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)g_player_object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x16) = (byte)V;
- *(char *)((char *)g_player_object + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)g_player_object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x16) = (byte)V;
- *(byte *)((char *)g_player_object + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)g_player_object)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position
|
- *(ushort *)((byte *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position
|
- ((ushort *)g_player_object)[0xb]
+ ((uw_mobile_object_t *)g_player_object)->tile_position
|
- *(ushort *)((ushort *)g_player_object + 0xb)
+ ((uw_mobile_object_t *)g_player_object)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position
|
- *(undefined2 *)((byte *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position
|
- ((undefined2 *)g_player_object)[0xb]
+ ((uw_mobile_object_t *)g_player_object)->tile_position
|
- *(undefined2 *)((undefined2 *)g_player_object + 0xb)
+ ((uw_mobile_object_t *)g_player_object)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_signed
|
- *(short *)((byte *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_signed
|
- ((short *)g_player_object)[0xb]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_signed
|
- *(short *)((short *)g_player_object + 0xb)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- *(byte *)((byte *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- ((byte *)g_player_object)[0x16]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- *(byte *)((ushort *)g_player_object + 0xb)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- (byte)((ushort *)g_player_object)[0xb]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- *(undefined1 *)((byte *)g_player_object + 0x16)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- ((undefined1 *)g_player_object)[0x16]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- *(undefined1 *)((ushort *)g_player_object + 0xb)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- (undefined1)((ushort *)g_player_object)[0xb]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x16)
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- &*(char *)((byte *)g_player_object + 0x16)
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- &((char *)g_player_object)[0x16]
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- &*(char *)((ushort *)g_player_object + 0xb)
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x16) = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x16) = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low = (byte)E;
|
- ((char *)g_player_object)[0x16] = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0xb) = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x16)
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- *(char *)((byte *)g_player_object + 0x16)
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- ((char *)g_player_object)[0x16]
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- *(char *)((ushort *)g_player_object + 0xb)
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_low
|
- (char)((ushort *)g_player_object)[0xb]
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x17)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- *(byte *)((byte *)g_player_object + 0x17)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- ((byte *)g_player_object)[0x17]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x17)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- *(undefined1 *)((byte *)g_player_object + 0x17)
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- ((undefined1 *)g_player_object)[0x17]
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x17)
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- &*(char *)((byte *)g_player_object + 0x17)
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- &((char *)g_player_object)[0x17]
+ (char *)&((uw_mobile_object_t *)g_player_object)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x17) = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x17) = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high = (byte)E;
|
- ((char *)g_player_object)[0x17] = E;
+ ((uw_mobile_object_t *)g_player_object)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x17)
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- *(char *)((byte *)g_player_object + 0x17)
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_high
|
- ((char *)g_player_object)[0x17]
+ (char)((uw_mobile_object_t *)g_player_object)->tile_position_high
)
...>
}


@site_0_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)g_player_object)->object_id
|
- ((ushort *)g_player_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)g_player_object)->object_id
|
- *(ushort *)g_player_object & 0x1ff
+ ((uw_object_hdr_t *)g_player_object)->object_id
)
...>
}

@site_0_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (((ushort *)g_player_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (((ushort *)g_player_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(ushort *)g_player_object >> 9) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(ushort *)g_player_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(byte *)((char *)g_player_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->flags_res
|
- (*(byte *)((char *)g_player_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)g_player_object)->flags_res
)
...>
}

@site_0_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (((ushort *)g_player_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (((ushort *)g_player_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(ushort *)g_player_object >> 12) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(ushort *)g_player_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(byte *)((char *)g_player_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->enchanted
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)g_player_object)->enchanted
)
...>
}

@site_0_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (((ushort *)g_player_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (((ushort *)g_player_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(ushort *)g_player_object >> 13) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(ushort *)g_player_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(byte *)((char *)g_player_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->doordir
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)g_player_object)->doordir
)
...>
}

@site_0_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (((ushort *)g_player_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (((ushort *)g_player_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(ushort *)g_player_object >> 14) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(ushort *)g_player_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(byte *)((char *)g_player_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->invisible
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)g_player_object)->invisible
)
...>
}

@site_0_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(ushort *)((char *)g_player_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (((ushort *)g_player_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (((ushort *)g_player_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(ushort *)g_player_object >> 15) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(ushort *)g_player_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(byte *)((char *)g_player_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- (*(byte *)((char *)g_player_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)g_player_object)->is_quant
|
- *(byte *)((char *)g_player_object + 0x1) >> 7
+ ((uw_object_hdr_t *)g_player_object)->is_quant
)
...>
}

@site_0_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)g_player_object)->zpos
|
- ((ushort *)g_player_object)[1] & 0x7f
+ ((uw_object_hdr_t *)g_player_object)->zpos
|
- *(byte *)((char *)g_player_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)g_player_object)->zpos
)
...>
}

@site_0_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->heading
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)g_player_object)->heading
|
- (((ushort *)g_player_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->heading
|
- (((ushort *)g_player_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)g_player_object)->heading
)
...>
}

@site_0_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (((ushort *)g_player_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (((ushort *)g_player_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (*(byte *)((char *)g_player_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->ypos
|
- (*(byte *)((char *)g_player_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)g_player_object)->ypos
)
...>
}

@site_0_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (*(ushort *)((char *)g_player_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (((ushort *)g_player_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (((ushort *)g_player_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (*(byte *)((char *)g_player_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- (*(byte *)((char *)g_player_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)g_player_object)->xpos
|
- *(byte *)((char *)g_player_object + 0x3) >> 5
+ ((uw_object_hdr_t *)g_player_object)->xpos
)
...>
}

@site_0_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->quality
|
- ((ushort *)g_player_object)[2] & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->quality
|
- *(byte *)((char *)g_player_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->quality
)
...>
}

@site_0_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->next
|
- (*(ushort *)((char *)g_player_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->next
|
- (((ushort *)g_player_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->next
|
- (((ushort *)g_player_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->next
)
...>
}

@site_0_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->owner
|
- ((ushort *)g_player_object)[3] & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->owner
|
- *(byte *)((char *)g_player_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)g_player_object)->owner
)
...>
}

@site_0_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)g_player_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->link
|
- (*(ushort *)((char *)g_player_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->link
|
- (((ushort *)g_player_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)g_player_object)->link
|
- (((ushort *)g_player_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)g_player_object)->link
)
...>
}

@site_0_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x0) = (char)V;
- *(char *)((char *)g_player_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x0) = (char)V;
- *(byte *)((char *)g_player_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x0) = (byte)V;
- *(char *)((char *)g_player_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x0) = (byte)V;
- *(byte *)((char *)g_player_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- *(ushort *)((byte *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- ((ushort *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- *(ushort *)((ushort *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
)
...>
}


@site_0_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- *(undefined2 *)((byte *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- ((undefined2 *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags
|
- *(undefined2 *)((undefined2 *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags
)
...>
}


@site_0_header_w_0_0_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_signed
|
- *(short *)((byte *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_signed
|
- ((short *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_signed
|
- *(short *)((short *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_signed
)
...>
}


@site_0_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(byte *)((byte *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- ((byte *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(byte *)((ushort *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- (byte)((ushort *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(byte *)g_player_object
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(undefined1 *)((byte *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- ((undefined1 *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x0)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- (undefined1)((ushort *)g_player_object)[0x0]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(undefined1 *)g_player_object
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_address_0@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x0)
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- &*(char *)((byte *)g_player_object + 0x0)
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- &((char *)g_player_object)[0x0]
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- &*(char *)((ushort *)g_player_object + 0x0)
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- &*(char *)g_player_object
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_store_0@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x0) = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x0) = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low = (byte)E;
|
- ((char *)g_player_object)[0x0] = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x0) = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low = (byte)E;
|
- *(char *)g_player_object = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_low = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x0)
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(char *)((byte *)g_player_object + 0x0)
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- ((char *)g_player_object)[0x0]
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(char *)((ushort *)g_player_object + 0x0)
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- (char)((ushort *)g_player_object)[0x0]
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_low
|
- *(char *)g_player_object
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- *(byte *)((byte *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- ((byte *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high
)
...>
}


@site_0_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- *(undefined1 *)((byte *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- ((undefined1 *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high
)
...>
}


@site_0_header_w_0_0_address_1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x1)
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- &*(char *)((byte *)g_player_object + 0x1)
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- &((char *)g_player_object)[0x1]
+ (char *)&((uw_object_hdr_t *)g_player_object)->type_flags_high
)
...>
}


@site_0_header_w_0_0_store_1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x1) = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x1) = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high = (byte)E;
|
- ((char *)g_player_object)[0x1] = E;
+ ((uw_object_hdr_t *)g_player_object)->type_flags_high = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x1)
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- *(char *)((byte *)g_player_object + 0x1)
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_high
|
- ((char *)g_player_object)[0x1]
+ (char)((uw_object_hdr_t *)g_player_object)->type_flags_high
)
...>
}


@site_0_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x2) = (char)V;
- *(char *)((char *)g_player_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x2) = (char)V;
- *(byte *)((char *)g_player_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x2) = (byte)V;
- *(char *)((char *)g_player_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x2) = (byte)V;
- *(byte *)((char *)g_player_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- *(ushort *)((byte *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- ((ushort *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- *(ushort *)((ushort *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->position_word
)
...>
}


@site_0_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- *(undefined2 *)((byte *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- ((undefined2 *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->position_word
|
- *(undefined2 *)((undefined2 *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->position_word
)
...>
}


@site_0_header_w_2_17_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word_signed
|
- *(short *)((byte *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word_signed
|
- ((short *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->position_word_signed
|
- *(short *)((short *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->position_word_signed
)
...>
}


@site_0_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- *(byte *)((byte *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- ((byte *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- *(byte *)((ushort *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- (byte)((ushort *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- ((undefined1 *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x1)
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
|
- (undefined1)((ushort *)g_player_object)[0x1]
+ ((uw_object_hdr_t *)g_player_object)->position_word_low
)
...>
}


@site_0_header_w_2_17_address_2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x2)
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_low
|
- &*(char *)((byte *)g_player_object + 0x2)
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_low
|
- &((char *)g_player_object)[0x2]
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_low
|
- &*(char *)((ushort *)g_player_object + 0x1)
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_low
)
...>
}


@site_0_header_w_2_17_store_2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x2) = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x2) = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_low = (byte)E;
|
- ((char *)g_player_object)[0x2] = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x1) = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_low = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x2)
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_low
|
- *(char *)((byte *)g_player_object + 0x2)
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_low
|
- ((char *)g_player_object)[0x2]
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_low
|
- *(char *)((ushort *)g_player_object + 0x1)
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_low
|
- (char)((ushort *)g_player_object)[0x1]
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->position_word_high
|
- *(byte *)((byte *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->position_word_high
|
- ((byte *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->position_word_high
)
...>
}


@site_0_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->position_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->position_word_high
|
- ((undefined1 *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->position_word_high
)
...>
}


@site_0_header_w_2_17_address_3@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x3)
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_high
|
- &*(char *)((byte *)g_player_object + 0x3)
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_high
|
- &((char *)g_player_object)[0x3]
+ (char *)&((uw_object_hdr_t *)g_player_object)->position_word_high
)
...>
}


@site_0_header_w_2_17_store_3@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x3) = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x3) = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_high = (byte)E;
|
- ((char *)g_player_object)[0x3] = E;
+ ((uw_object_hdr_t *)g_player_object)->position_word_high = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x3)
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_high
|
- *(char *)((byte *)g_player_object + 0x3)
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_high
|
- ((char *)g_player_object)[0x3]
+ (char)((uw_object_hdr_t *)g_player_object)->position_word_high
)
...>
}


@site_0_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x4) = (char)V;
- *(char *)((char *)g_player_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x4) = (char)V;
- *(byte *)((char *)g_player_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x4) = (byte)V;
- *(char *)((char *)g_player_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x4) = (byte)V;
- *(byte *)((char *)g_player_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- *(ushort *)((byte *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- ((ushort *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- *(ushort *)((ushort *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
)
...>
}


@site_0_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- *(undefined2 *)((byte *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- ((undefined2 *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->chain_word
|
- *(undefined2 *)((undefined2 *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->chain_word
)
...>
}


@site_0_header_w_4_34_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_signed
|
- *(short *)((byte *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_signed
|
- ((short *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_signed
|
- *(short *)((short *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_signed
)
...>
}


@site_0_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- *(byte *)((byte *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- ((byte *)g_player_object)[0x4]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- *(byte *)((ushort *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- (byte)((ushort *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x4)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- ((undefined1 *)g_player_object)[0x4]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x2)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- (undefined1)((ushort *)g_player_object)[0x2]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_address_4@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x4)
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- &*(char *)((byte *)g_player_object + 0x4)
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- &((char *)g_player_object)[0x4]
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- &*(char *)((ushort *)g_player_object + 0x2)
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_store_4@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x4) = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x4) = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low = (byte)E;
|
- ((char *)g_player_object)[0x4] = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x2) = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_low = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x4)
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- *(char *)((byte *)g_player_object + 0x4)
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- ((char *)g_player_object)[0x4]
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- *(char *)((ushort *)g_player_object + 0x2)
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_low
|
- (char)((ushort *)g_player_object)[0x2]
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x5)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- *(byte *)((byte *)g_player_object + 0x5)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- ((byte *)g_player_object)[0x5]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high
)
...>
}


@site_0_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x5)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x5)
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- ((undefined1 *)g_player_object)[0x5]
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high
)
...>
}


@site_0_header_w_4_34_address_5@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x5)
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- &*(char *)((byte *)g_player_object + 0x5)
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- &((char *)g_player_object)[0x5]
+ (char *)&((uw_object_hdr_t *)g_player_object)->chain_word_high
)
...>
}


@site_0_header_w_4_34_store_5@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x5) = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x5) = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high = (byte)E;
|
- ((char *)g_player_object)[0x5] = E;
+ ((uw_object_hdr_t *)g_player_object)->chain_word_high = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x5)
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- *(char *)((byte *)g_player_object + 0x5)
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_high
|
- ((char *)g_player_object)[0x5]
+ (char)((uw_object_hdr_t *)g_player_object)->chain_word_high
)
...>
}


@site_0_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x6) = (char)V;
- *(char *)((char *)g_player_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)g_player_object + 0x6) = (char)V;
- *(byte *)((char *)g_player_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x6) = (byte)V;
- *(char *)((char *)g_player_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)g_player_object + 0x6) = (byte)V;
- *(byte *)((char *)g_player_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)g_player_object)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- *(ushort *)((byte *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- ((ushort *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- *(ushort *)((ushort *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->link_word
)
...>
}


@site_0_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- *(undefined2 *)((byte *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- ((undefined2 *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->link_word
|
- *(undefined2 *)((undefined2 *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->link_word
)
...>
}


@site_0_header_w_6_51_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word_signed
|
- *(short *)((byte *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word_signed
|
- ((short *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->link_word_signed
|
- *(short *)((short *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->link_word_signed
)
...>
}


@site_0_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- *(byte *)((byte *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- ((byte *)g_player_object)[0x6]
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- *(byte *)((ushort *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- (byte)((ushort *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x6)
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- ((undefined1 *)g_player_object)[0x6]
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x3)
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
|
- (undefined1)((ushort *)g_player_object)[0x3]
+ ((uw_object_hdr_t *)g_player_object)->link_word_low
)
...>
}


@site_0_header_w_6_51_address_6@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x6)
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_low
|
- &*(char *)((byte *)g_player_object + 0x6)
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_low
|
- &((char *)g_player_object)[0x6]
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_low
|
- &*(char *)((ushort *)g_player_object + 0x3)
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_low
)
...>
}


@site_0_header_w_6_51_store_6@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x6) = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x6) = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_low = (byte)E;
|
- ((char *)g_player_object)[0x6] = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x3) = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_low = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x6)
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_low
|
- *(char *)((byte *)g_player_object + 0x6)
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_low
|
- ((char *)g_player_object)[0x6]
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_low
|
- *(char *)((ushort *)g_player_object + 0x3)
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_low
|
- (char)((ushort *)g_player_object)[0x3]
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x7)
+ ((uw_object_hdr_t *)g_player_object)->link_word_high
|
- *(byte *)((byte *)g_player_object + 0x7)
+ ((uw_object_hdr_t *)g_player_object)->link_word_high
|
- ((byte *)g_player_object)[0x7]
+ ((uw_object_hdr_t *)g_player_object)->link_word_high
)
...>
}


@site_0_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x7)
+ ((uw_object_hdr_t *)g_player_object)->link_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x7)
+ ((uw_object_hdr_t *)g_player_object)->link_word_high
|
- ((undefined1 *)g_player_object)[0x7]
+ ((uw_object_hdr_t *)g_player_object)->link_word_high
)
...>
}


@site_0_header_w_6_51_address_7@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x7)
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_high
|
- &*(char *)((byte *)g_player_object + 0x7)
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_high
|
- &((char *)g_player_object)[0x7]
+ (char *)&((uw_object_hdr_t *)g_player_object)->link_word_high
)
...>
}


@site_0_header_w_6_51_store_7@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x7) = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x7) = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_high = (byte)E;
|
- ((char *)g_player_object)[0x7] = E;
+ ((uw_object_hdr_t *)g_player_object)->link_word_high = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x7)
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_high
|
- *(char *)((byte *)g_player_object + 0x7)
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_high
|
- ((char *)g_player_object)[0x7]
+ (char)((uw_object_hdr_t *)g_player_object)->link_word_high
)
...>
}


@begin_directional_move_g_player_object_typed_header_receiver@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

identifier M;
@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)g_player_object)->M
+ g_player_object->hdr.M
)
...>
}

@begin_directional_move_g_player_object_hit_points_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x8)
+ ((uw_mobile_object_t *)g_player_object)->hit_points
)
...>
}

@begin_directional_move_g_player_object_hit_points_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x8)
+ ((uw_mobile_object_t *)g_player_object)->hit_points
)
...>
}

@begin_directional_move_g_player_object_hit_points_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x8)
+ (char *)&((uw_mobile_object_t *)g_player_object)->hit_points
)
...>
}

@begin_directional_move_g_player_object_hit_points_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x8) = E;
+ ((uw_mobile_object_t *)g_player_object)->hit_points = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_hit_points_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x8)
+ (char)((uw_mobile_object_t *)g_player_object)->hit_points
)
...>
}

@begin_directional_move_g_player_object_full_heading_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x9)
+ ((uw_mobile_object_t *)g_player_object)->full_heading
)
...>
}

@begin_directional_move_g_player_object_full_heading_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x9)
+ ((uw_mobile_object_t *)g_player_object)->full_heading
)
...>
}

@begin_directional_move_g_player_object_full_heading_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x9)
+ (char *)&((uw_mobile_object_t *)g_player_object)->full_heading
)
...>
}

@begin_directional_move_g_player_object_full_heading_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x9) = E;
+ ((uw_mobile_object_t *)g_player_object)->full_heading = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_full_heading_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x9)
+ (char)((uw_mobile_object_t *)g_player_object)->full_heading
)
...>
}

@begin_directional_move_g_player_object_movement_flags_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0xa)
+ ((uw_mobile_object_t *)g_player_object)->movement_flags
)
...>
}

@begin_directional_move_g_player_object_movement_flags_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0xa)
+ ((uw_mobile_object_t *)g_player_object)->movement_flags
)
...>
}

@begin_directional_move_g_player_object_movement_flags_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0xa)
+ (char *)&((uw_mobile_object_t *)g_player_object)->movement_flags
)
...>
}

@begin_directional_move_g_player_object_movement_flags_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0xa) = E;
+ ((uw_mobile_object_t *)g_player_object)->movement_flags = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_movement_flags_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0xa)
+ (char)((uw_mobile_object_t *)g_player_object)->movement_flags
)
...>
}

@begin_directional_move_g_player_object_motion_flags_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x13)
+ ((uw_mobile_object_t *)g_player_object)->motion_flags
)
...>
}

@begin_directional_move_g_player_object_motion_flags_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x13)
+ ((uw_mobile_object_t *)g_player_object)->motion_flags
)
...>
}

@begin_directional_move_g_player_object_motion_flags_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x13)
+ (char *)&((uw_mobile_object_t *)g_player_object)->motion_flags
)
...>
}

@begin_directional_move_g_player_object_motion_flags_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x13) = E;
+ ((uw_mobile_object_t *)g_player_object)->motion_flags = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_motion_flags_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x13)
+ (char)((uw_mobile_object_t *)g_player_object)->motion_flags
)
...>
}

@begin_directional_move_g_player_object_attack_pitch_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x14)
+ ((uw_mobile_object_t *)g_player_object)->attack_pitch
)
...>
}

@begin_directional_move_g_player_object_attack_pitch_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x14)
+ ((uw_mobile_object_t *)g_player_object)->attack_pitch
)
...>
}

@begin_directional_move_g_player_object_attack_pitch_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x14)
+ (char *)&((uw_mobile_object_t *)g_player_object)->attack_pitch
)
...>
}

@begin_directional_move_g_player_object_attack_pitch_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x14) = E;
+ ((uw_mobile_object_t *)g_player_object)->attack_pitch = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_attack_pitch_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x14)
+ (char)((uw_mobile_object_t *)g_player_object)->attack_pitch
)
...>
}

@begin_directional_move_g_player_object_animation_flags_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x15)
+ ((uw_mobile_object_t *)g_player_object)->animation_flags
)
...>
}

@begin_directional_move_g_player_object_animation_flags_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x15)
+ ((uw_mobile_object_t *)g_player_object)->animation_flags
)
...>
}

@begin_directional_move_g_player_object_animation_flags_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x15)
+ (char *)&((uw_mobile_object_t *)g_player_object)->animation_flags
)
...>
}

@begin_directional_move_g_player_object_animation_flags_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x15) = E;
+ ((uw_mobile_object_t *)g_player_object)->animation_flags = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_animation_flags_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x15)
+ (char)((uw_mobile_object_t *)g_player_object)->animation_flags
)
...>
}

@begin_directional_move_g_player_object_heading_flags_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)g_player_object + 0x18)
+ ((uw_mobile_object_t *)g_player_object)->heading_flags
)
...>
}

@begin_directional_move_g_player_object_heading_flags_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)g_player_object + 0x18)
+ ((uw_mobile_object_t *)g_player_object)->heading_flags
)
...>
}

@begin_directional_move_g_player_object_heading_flags_address@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)g_player_object + 0x18)
+ (char *)&((uw_mobile_object_t *)g_player_object)->heading_flags
)
...>
}

@begin_directional_move_g_player_object_heading_flags_store@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x18) = E;
+ ((uw_mobile_object_t *)g_player_object)->heading_flags = (byte)E;
)
...>
}

@begin_directional_move_g_player_object_heading_flags_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)g_player_object + 0x18)
+ (char)((uw_mobile_object_t *)g_player_object)->heading_flags
)
...>
}
