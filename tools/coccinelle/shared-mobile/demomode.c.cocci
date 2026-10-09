@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x16) = (char)V;
- *(char *)((char *)pl + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pl)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x16) = (char)V;
- *(byte *)((char *)pl + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pl)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x16) = (byte)V;
- *(char *)((char *)pl + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)pl)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x16) = (byte)V;
- *(byte *)((char *)pl + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)pl)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- *(ushort *)((byte *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- ((ushort *)pl)[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position
|
- *(ushort *)((ushort *)pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- *(ushort *)(pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- pl[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- *(undefined2 *)((byte *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- ((undefined2 *)pl)[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position
|
- *(undefined2 *)((undefined2 *)pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- *(undefined2 *)(pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position
|
- pl[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position_signed
|
- *(short *)((byte *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position_signed
|
- ((short *)pl)[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position_signed
|
- *(short *)((short *)pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position_signed
|
- *(short *)(pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- *(byte *)((byte *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- ((byte *)pl)[0x16]
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- *(byte *)((ushort *)pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- (byte)((ushort *)pl)[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- *(byte *)(pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- (byte)pl[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- *(undefined1 *)((byte *)pl + 0x16)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- ((undefined1 *)pl)[0x16]
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- *(undefined1 *)((ushort *)pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- (undefined1)((ushort *)pl)[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- *(undefined1 *)(pl + 0xb)
+ ((uw_mobile_object_t *)pl)->tile_position_low
|
- (undefined1)pl[0xb]
+ ((uw_mobile_object_t *)pl)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pl + 0x16)
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_low
|
- &*(char *)((byte *)pl + 0x16)
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_low
|
- &((char *)pl)[0x16]
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_low
|
- &*(char *)((ushort *)pl + 0xb)
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_low
|
- &*(char *)(pl + 0xb)
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x16) = E;
+ ((uw_mobile_object_t *)pl)->tile_position_low = (byte)E;
|
- *(char *)((byte *)pl + 0x16) = E;
+ ((uw_mobile_object_t *)pl)->tile_position_low = (byte)E;
|
- ((char *)pl)[0x16] = E;
+ ((uw_mobile_object_t *)pl)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)pl + 0xb) = E;
+ ((uw_mobile_object_t *)pl)->tile_position_low = (byte)E;
|
- *(char *)(pl + 0xb) = E;
+ ((uw_mobile_object_t *)pl)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x16)
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
|
- *(char *)((byte *)pl + 0x16)
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
|
- ((char *)pl)[0x16]
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
|
- *(char *)((ushort *)pl + 0xb)
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
|
- (char)((ushort *)pl)[0xb]
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
|
- *(char *)(pl + 0xb)
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
|
- (char)pl[0xb]
+ (char)((uw_mobile_object_t *)pl)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x17)
+ ((uw_mobile_object_t *)pl)->tile_position_high
|
- *(byte *)((byte *)pl + 0x17)
+ ((uw_mobile_object_t *)pl)->tile_position_high
|
- ((byte *)pl)[0x17]
+ ((uw_mobile_object_t *)pl)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x17)
+ ((uw_mobile_object_t *)pl)->tile_position_high
|
- *(undefined1 *)((byte *)pl + 0x17)
+ ((uw_mobile_object_t *)pl)->tile_position_high
|
- ((undefined1 *)pl)[0x17]
+ ((uw_mobile_object_t *)pl)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pl + 0x17)
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_high
|
- &*(char *)((byte *)pl + 0x17)
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_high
|
- &((char *)pl)[0x17]
+ (char *)&((uw_mobile_object_t *)pl)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x17) = E;
+ ((uw_mobile_object_t *)pl)->tile_position_high = (byte)E;
|
- *(char *)((byte *)pl + 0x17) = E;
+ ((uw_mobile_object_t *)pl)->tile_position_high = (byte)E;
|
- ((char *)pl)[0x17] = E;
+ ((uw_mobile_object_t *)pl)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x17)
+ (char)((uw_mobile_object_t *)pl)->tile_position_high
|
- *(char *)((byte *)pl + 0x17)
+ (char)((uw_mobile_object_t *)pl)->tile_position_high
|
- ((char *)pl)[0x17]
+ (char)((uw_mobile_object_t *)pl)->tile_position_high
)
...>
}


@demomode_pump_pl_tile_division_index@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- pl[0x16/2]
+ ((uw_mobile_object_t *)pl)->tile_position
)
...>
}
