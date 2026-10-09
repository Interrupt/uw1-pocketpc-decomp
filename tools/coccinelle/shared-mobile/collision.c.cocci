@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

