@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x16) = (char)V;
- *(char *)((char *)pp + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x16) = (char)V;
- *(byte *)((char *)pp + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x16) = (byte)V;
- *(char *)((char *)pp + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x16) = (byte)V;
- *(byte *)((char *)pp + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pp)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- *(ushort *)((byte *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- ((ushort *)pp)[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position
|
- *(ushort *)((ushort *)pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- *(ushort *)(pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- pp[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- *(undefined2 *)((byte *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- ((undefined2 *)pp)[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position
|
- *(undefined2 *)((undefined2 *)pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- *(undefined2 *)(pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position
|
- pp[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position_signed
|
- *(short *)((byte *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position_signed
|
- ((short *)pp)[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position_signed
|
- *(short *)((short *)pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position_signed
|
- *(short *)(pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- *(byte *)((byte *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- ((byte *)pp)[0x16]
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- *(byte *)((ushort *)pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- (byte)((ushort *)pp)[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- *(byte *)(pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- (byte)pp[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- *(undefined1 *)((byte *)pp + 0x16)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- ((undefined1 *)pp)[0x16]
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- *(undefined1 *)((ushort *)pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- (undefined1)((ushort *)pp)[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- *(undefined1 *)(pp + 0xb)
+ ((uw_mobile_object_t *)pp)->tile_position_low
|
- (undefined1)pp[0xb]
+ ((uw_mobile_object_t *)pp)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pp + 0x16)
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_low
|
- &*(char *)((byte *)pp + 0x16)
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_low
|
- &((char *)pp)[0x16]
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_low
|
- &*(char *)((ushort *)pp + 0xb)
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_low
|
- &*(char *)(pp + 0xb)
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x16) = E;
+ ((uw_mobile_object_t *)pp)->tile_position_low = (byte)E;
|
- *(char *)((byte *)pp + 0x16) = E;
+ ((uw_mobile_object_t *)pp)->tile_position_low = (byte)E;
|
- ((char *)pp)[0x16] = E;
+ ((uw_mobile_object_t *)pp)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)pp + 0xb) = E;
+ ((uw_mobile_object_t *)pp)->tile_position_low = (byte)E;
|
- *(char *)(pp + 0xb) = E;
+ ((uw_mobile_object_t *)pp)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x16)
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
|
- *(char *)((byte *)pp + 0x16)
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
|
- ((char *)pp)[0x16]
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
|
- *(char *)((ushort *)pp + 0xb)
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
|
- (char)((ushort *)pp)[0xb]
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
|
- *(char *)(pp + 0xb)
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
|
- (char)pp[0xb]
+ (char)((uw_mobile_object_t *)pp)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x17)
+ ((uw_mobile_object_t *)pp)->tile_position_high
|
- *(byte *)((byte *)pp + 0x17)
+ ((uw_mobile_object_t *)pp)->tile_position_high
|
- ((byte *)pp)[0x17]
+ ((uw_mobile_object_t *)pp)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x17)
+ ((uw_mobile_object_t *)pp)->tile_position_high
|
- *(undefined1 *)((byte *)pp + 0x17)
+ ((uw_mobile_object_t *)pp)->tile_position_high
|
- ((undefined1 *)pp)[0x17]
+ ((uw_mobile_object_t *)pp)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pp + 0x17)
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_high
|
- &*(char *)((byte *)pp + 0x17)
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_high
|
- &((char *)pp)[0x17]
+ (char *)&((uw_mobile_object_t *)pp)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x17) = E;
+ ((uw_mobile_object_t *)pp)->tile_position_high = (byte)E;
|
- *(char *)((byte *)pp + 0x17) = E;
+ ((uw_mobile_object_t *)pp)->tile_position_high = (byte)E;
|
- ((char *)pp)[0x17] = E;
+ ((uw_mobile_object_t *)pp)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x17)
+ (char)((uw_mobile_object_t *)pp)->tile_position_high
|
- *(char *)((byte *)pp + 0x17)
+ (char)((uw_mobile_object_t *)pp)->tile_position_high
|
- ((char *)pp)[0x17]
+ (char)((uw_mobile_object_t *)pp)->tile_position_high
)
...>
}

