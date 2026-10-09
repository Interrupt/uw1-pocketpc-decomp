@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x16) = (char)V;
- *(char *)((char *)_dpp + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)_dpp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x16) = (char)V;
- *(byte *)((char *)_dpp + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)_dpp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x16) = (byte)V;
- *(char *)((char *)_dpp + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)_dpp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x16) = (byte)V;
- *(byte *)((char *)_dpp + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)_dpp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- *(ushort *)((byte *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- ((ushort *)_dpp)[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- *(ushort *)((ushort *)_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- *(ushort *)(_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- _dpp[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- *(undefined2 *)((byte *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- ((undefined2 *)_dpp)[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- *(undefined2 *)((undefined2 *)_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- *(undefined2 *)(_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position
|
- _dpp[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position_signed
|
- *(short *)((byte *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position_signed
|
- ((short *)_dpp)[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position_signed
|
- *(short *)((short *)_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position_signed
|
- *(short *)(_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(byte *)((byte *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- ((byte *)_dpp)[0x16]
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(byte *)((ushort *)_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- (byte)((ushort *)_dpp)[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(byte *)(_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- (byte)_dpp[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(undefined1 *)((byte *)_dpp + 0x16)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- ((undefined1 *)_dpp)[0x16]
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(undefined1 *)((ushort *)_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- (undefined1)((ushort *)_dpp)[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(undefined1 *)(_dpp + 0xb)
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
|
- (undefined1)_dpp[0xb]
+ ((uw_mobile_object_t *)_dpp)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_dpp + 0x16)
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_low
|
- &*(char *)((byte *)_dpp + 0x16)
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_low
|
- &((char *)_dpp)[0x16]
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_low
|
- &*(char *)((ushort *)_dpp + 0xb)
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_low
|
- &*(char *)(_dpp + 0xb)
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x16) = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_low = (byte)E;
|
- *(char *)((byte *)_dpp + 0x16) = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_low = (byte)E;
|
- ((char *)_dpp)[0x16] = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)_dpp + 0xb) = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_low = (byte)E;
|
- *(char *)(_dpp + 0xb) = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x16)
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(char *)((byte *)_dpp + 0x16)
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
|
- ((char *)_dpp)[0x16]
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(char *)((ushort *)_dpp + 0xb)
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
|
- (char)((ushort *)_dpp)[0xb]
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
|
- *(char *)(_dpp + 0xb)
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
|
- (char)_dpp[0xb]
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x17)
+ ((uw_mobile_object_t *)_dpp)->tile_position_high
|
- *(byte *)((byte *)_dpp + 0x17)
+ ((uw_mobile_object_t *)_dpp)->tile_position_high
|
- ((byte *)_dpp)[0x17]
+ ((uw_mobile_object_t *)_dpp)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x17)
+ ((uw_mobile_object_t *)_dpp)->tile_position_high
|
- *(undefined1 *)((byte *)_dpp + 0x17)
+ ((uw_mobile_object_t *)_dpp)->tile_position_high
|
- ((undefined1 *)_dpp)[0x17]
+ ((uw_mobile_object_t *)_dpp)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_dpp + 0x17)
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_high
|
- &*(char *)((byte *)_dpp + 0x17)
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_high
|
- &((char *)_dpp)[0x17]
+ (char *)&((uw_mobile_object_t *)_dpp)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x17) = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_high = (byte)E;
|
- *(char *)((byte *)_dpp + 0x17) = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_high = (byte)E;
|
- ((char *)_dpp)[0x17] = E;
+ ((uw_mobile_object_t *)_dpp)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x17)
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_high
|
- *(char *)((byte *)_dpp + 0x17)
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_high
|
- ((char *)_dpp)[0x17]
+ (char)((uw_mobile_object_t *)_dpp)->tile_position_high
)
...>
}

