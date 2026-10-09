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


@site_1_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x16) = (char)V;
- *(char *)((char *)puVar7 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x16) = (char)V;
- *(byte *)((char *)puVar7 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x16) = (byte)V;
- *(char *)((char *)puVar7 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x16) = (byte)V;
- *(byte *)((char *)puVar7 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_word_ushort@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- *(ushort *)((byte *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- ((ushort *)puVar7)[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- *(ushort *)((ushort *)puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- *(ushort *)(puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- puVar7[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position
)
...>
}


@site_1_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- *(undefined2 *)((byte *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- ((undefined2 *)puVar7)[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- *(undefined2 *)((undefined2 *)puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- *(undefined2 *)(puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position
|
- puVar7[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position
)
...>
}


@site_1_w_22_0_word_short@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position_signed
|
- *(short *)((byte *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position_signed
|
- ((short *)puVar7)[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position_signed
|
- *(short *)((short *)puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position_signed
|
- *(short *)(puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position_signed
)
...>
}


@site_1_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(byte *)((byte *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- ((byte *)puVar7)[0x16]
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(byte *)((ushort *)puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- (byte)((ushort *)puVar7)[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(byte *)(puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- (byte)puVar7[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
)
...>
}


@site_1_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(undefined1 *)((byte *)puVar7 + 0x16)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- ((undefined1 *)puVar7)[0x16]
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(undefined1 *)((ushort *)puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- (undefined1)((ushort *)puVar7)[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(undefined1 *)(puVar7 + 0xb)
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
|
- (undefined1)puVar7[0xb]
+ ((uw_mobile_object_t *)puVar7)->tile_position_low
)
...>
}


@site_1_w_22_0_address_22@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_low
|
- &*(char *)((byte *)puVar7 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_low
|
- &((char *)puVar7)[0x16]
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_low
|
- &*(char *)((ushort *)puVar7 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_low
|
- &*(char *)(puVar7 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_low
)
...>
}


@site_1_w_22_0_store_22@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_low = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_low = (byte)E;
|
- ((char *)puVar7)[0x16] = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)puVar7 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_low = (byte)E;
|
- *(char *)(puVar7 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_low = (byte)E;
)
...>
}


@site_1_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x16)
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(char *)((byte *)puVar7 + 0x16)
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
|
- ((char *)puVar7)[0x16]
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(char *)((ushort *)puVar7 + 0xb)
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
|
- (char)((ushort *)puVar7)[0xb]
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
|
- *(char *)(puVar7 + 0xb)
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
|
- (char)puVar7[0xb]
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_low
)
...>
}


@site_1_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x17)
+ ((uw_mobile_object_t *)puVar7)->tile_position_high
|
- *(byte *)((byte *)puVar7 + 0x17)
+ ((uw_mobile_object_t *)puVar7)->tile_position_high
|
- ((byte *)puVar7)[0x17]
+ ((uw_mobile_object_t *)puVar7)->tile_position_high
)
...>
}


@site_1_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x17)
+ ((uw_mobile_object_t *)puVar7)->tile_position_high
|
- *(undefined1 *)((byte *)puVar7 + 0x17)
+ ((uw_mobile_object_t *)puVar7)->tile_position_high
|
- ((undefined1 *)puVar7)[0x17]
+ ((uw_mobile_object_t *)puVar7)->tile_position_high
)
...>
}


@site_1_w_22_0_address_23@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_high
|
- &*(char *)((byte *)puVar7 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_high
|
- &((char *)puVar7)[0x17]
+ (char *)&((uw_mobile_object_t *)puVar7)->tile_position_high
)
...>
}


@site_1_w_22_0_store_23@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_high = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_high = (byte)E;
|
- ((char *)puVar7)[0x17] = E;
+ ((uw_mobile_object_t *)puVar7)->tile_position_high = (byte)E;
)
...>
}


@site_1_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x17)
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_high
|
- *(char *)((byte *)puVar7 + 0x17)
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_high
|
- ((char *)puVar7)[0x17]
+ (char)((uw_mobile_object_t *)puVar7)->tile_position_high
)
...>
}


@site_1_field_0_item_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
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

@site_1_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x0) = (char)V;
- *(char *)((char *)puVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x0) = (char)V;
- *(byte *)((char *)puVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x0) = (byte)V;
- *(char *)((char *)puVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x0) = (byte)V;
- *(byte *)((char *)puVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->type_flags = (ushort)V;

...>
}

@site_1_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(ushort *)((byte *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- ((ushort *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(ushort *)((ushort *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(ushort *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}


@site_1_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(undefined2 *)((byte *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- ((undefined2 *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(undefined2 *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}


@site_1_header_w_0_0_word_short@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_signed
|
- *(short *)((byte *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_signed
|
- ((short *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_signed
|
- *(short *)((short *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_signed
|
- *(short *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_signed
)
...>
}


@site_1_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(byte *)((byte *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- ((byte *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(byte *)((ushort *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (byte)((ushort *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(byte *)puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(byte *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (byte)puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@site_1_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(undefined1 *)((byte *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- ((undefined1 *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (undefined1)((ushort *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(undefined1 *)puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(undefined1 *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (undefined1)puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@site_1_header_w_0_0_address_0@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)((byte *)puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &((char *)puVar7)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)((ushort *)puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)puVar7
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)(puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@site_1_header_w_0_0_store_0@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
|
- ((char *)puVar7)[0x0] = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
|
- *(char *)puVar7 = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
|
- *(char *)(puVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
)
...>
}


@site_1_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x0)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(char *)((byte *)puVar7 + 0x0)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- ((char *)puVar7)[0x0]
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(char *)((ushort *)puVar7 + 0x0)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (char)((ushort *)puVar7)[0x0]
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(char *)puVar7
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- *(char *)(puVar7 + 0x0)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (char)puVar7[0x0]
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@site_1_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->type_flags_high
|
- *(byte *)((byte *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->type_flags_high
|
- ((byte *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->type_flags_high
)
...>
}


@site_1_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->type_flags_high
|
- *(undefined1 *)((byte *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->type_flags_high
|
- ((undefined1 *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->type_flags_high
)
...>
}


@site_1_header_w_0_0_address_1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_high
|
- &*(char *)((byte *)puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_high
|
- &((char *)puVar7)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_high
)
...>
}


@site_1_header_w_0_0_store_1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_high = (byte)E;
|
- ((char *)puVar7)[0x1] = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_high = (byte)E;
)
...>
}


@site_1_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x1)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_high
|
- *(char *)((byte *)puVar7 + 0x1)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_high
|
- ((char *)puVar7)[0x1]
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_high
)
...>
}


@site_1_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x2) = (char)V;
- *(char *)((char *)puVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x2) = (char)V;
- *(byte *)((char *)puVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x2) = (byte)V;
- *(char *)((char *)puVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x2) = (byte)V;
- *(byte *)((char *)puVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->position_word = (ushort)V;

...>
}

@site_1_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(ushort *)((byte *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- ((ushort *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(ushort *)((ushort *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(ushort *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}


@site_1_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(undefined2 *)((byte *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- ((undefined2 *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(undefined2 *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}


@site_1_header_w_2_17_word_short@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word_signed
|
- *(short *)((byte *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word_signed
|
- ((short *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_signed
|
- *(short *)((short *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_signed
|
- *(short *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_signed
)
...>
}


@site_1_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(byte *)((byte *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- ((byte *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(byte *)((ushort *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- (byte)((ushort *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(byte *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- (byte)puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@site_1_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(undefined1 *)((byte *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- ((undefined1 *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(undefined1 *)((ushort *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- (undefined1)((ushort *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(undefined1 *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- (undefined1)puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@site_1_header_w_2_17_address_2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &*(char *)((byte *)puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &((char *)puVar7)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &*(char *)((ushort *)puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &*(char *)(puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@site_1_header_w_2_17_store_2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_low = (byte)E;
|
- ((char *)puVar7)[0x2] = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_low = (byte)E;
|
- *(char *)(puVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_low = (byte)E;
)
...>
}


@site_1_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x2)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(char *)((byte *)puVar7 + 0x2)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- ((char *)puVar7)[0x2]
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(char *)((ushort *)puVar7 + 0x1)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- (char)((ushort *)puVar7)[0x1]
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- *(char *)(puVar7 + 0x1)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- (char)puVar7[0x1]
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@site_1_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->position_word_high
|
- *(byte *)((byte *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->position_word_high
|
- ((byte *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->position_word_high
)
...>
}


@site_1_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->position_word_high
|
- *(undefined1 *)((byte *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->position_word_high
|
- ((undefined1 *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->position_word_high
)
...>
}


@site_1_header_w_2_17_address_3@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_high
|
- &*(char *)((byte *)puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_high
|
- &((char *)puVar7)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_high
)
...>
}


@site_1_header_w_2_17_store_3@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_high = (byte)E;
|
- ((char *)puVar7)[0x3] = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_high = (byte)E;
)
...>
}


@site_1_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x3)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_high
|
- *(char *)((byte *)puVar7 + 0x3)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_high
|
- ((char *)puVar7)[0x3]
+ (char)((uw_object_hdr_t *)puVar7)->position_word_high
)
...>
}


@site_1_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x4) = (char)V;
- *(char *)((char *)puVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x4) = (char)V;
- *(byte *)((char *)puVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x4) = (byte)V;
- *(char *)((char *)puVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x4) = (byte)V;
- *(byte *)((char *)puVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->chain_word = (ushort)V;

...>
}

@site_1_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(ushort *)((byte *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- ((ushort *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(ushort *)((ushort *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(ushort *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}


@site_1_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(undefined2 *)((byte *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- ((undefined2 *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(undefined2 *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}


@site_1_header_w_4_34_word_short@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word_signed
|
- *(short *)((byte *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word_signed
|
- ((short *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_signed
|
- *(short *)((short *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_signed
|
- *(short *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_signed
)
...>
}


@site_1_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(byte *)((byte *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- ((byte *)puVar7)[0x4]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(byte *)((ushort *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (byte)((ushort *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(byte *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (byte)puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@site_1_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(undefined1 *)((byte *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- ((undefined1 *)puVar7)[0x4]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (undefined1)((ushort *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(undefined1 *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (undefined1)puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@site_1_header_w_4_34_address_4@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &*(char *)((byte *)puVar7 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &((char *)puVar7)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &*(char *)((ushort *)puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &*(char *)(puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@site_1_header_w_4_34_store_4@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_low = (byte)E;
|
- ((char *)puVar7)[0x4] = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_low = (byte)E;
|
- *(char *)(puVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_low = (byte)E;
)
...>
}


@site_1_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x4)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(char *)((byte *)puVar7 + 0x4)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- ((char *)puVar7)[0x4]
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(char *)((ushort *)puVar7 + 0x2)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (char)((ushort *)puVar7)[0x2]
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- *(char *)(puVar7 + 0x2)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (char)puVar7[0x2]
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@site_1_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x5)
+ ((uw_object_hdr_t *)puVar7)->chain_word_high
|
- *(byte *)((byte *)puVar7 + 0x5)
+ ((uw_object_hdr_t *)puVar7)->chain_word_high
|
- ((byte *)puVar7)[0x5]
+ ((uw_object_hdr_t *)puVar7)->chain_word_high
)
...>
}


@site_1_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x5)
+ ((uw_object_hdr_t *)puVar7)->chain_word_high
|
- *(undefined1 *)((byte *)puVar7 + 0x5)
+ ((uw_object_hdr_t *)puVar7)->chain_word_high
|
- ((undefined1 *)puVar7)[0x5]
+ ((uw_object_hdr_t *)puVar7)->chain_word_high
)
...>
}


@site_1_header_w_4_34_address_5@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_high
|
- &*(char *)((byte *)puVar7 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_high
|
- &((char *)puVar7)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_high
)
...>
}


@site_1_header_w_4_34_store_5@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_high = (byte)E;
|
- ((char *)puVar7)[0x5] = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_high = (byte)E;
)
...>
}


@site_1_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x5)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_high
|
- *(char *)((byte *)puVar7 + 0x5)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_high
|
- ((char *)puVar7)[0x5]
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_high
)
...>
}


@site_1_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x6) = (char)V;
- *(char *)((char *)puVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0x6) = (char)V;
- *(byte *)((char *)puVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x6) = (byte)V;
- *(char *)((char *)puVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0x6) = (byte)V;
- *(byte *)((char *)puVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar7)->link_word = (ushort)V;

...>
}

@site_1_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(ushort *)((byte *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- ((ushort *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(ushort *)((ushort *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(ushort *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}


@site_1_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(undefined2 *)((byte *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- ((undefined2 *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(undefined2 *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}


@site_1_header_w_6_51_word_short@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word_signed
|
- *(short *)((byte *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word_signed
|
- ((short *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_signed
|
- *(short *)((short *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_signed
|
- *(short *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_signed
)
...>
}


@site_1_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(byte *)((byte *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- ((byte *)puVar7)[0x6]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(byte *)((ushort *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- (byte)((ushort *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(byte *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- (byte)puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@site_1_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(undefined1 *)((byte *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- ((undefined1 *)puVar7)[0x6]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(undefined1 *)((ushort *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- (undefined1)((ushort *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(undefined1 *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- (undefined1)puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@site_1_header_w_6_51_address_6@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &*(char *)((byte *)puVar7 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &((char *)puVar7)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &*(char *)((ushort *)puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &*(char *)(puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@site_1_header_w_6_51_store_6@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_low = (byte)E;
|
- ((char *)puVar7)[0x6] = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_low = (byte)E;
|
- *(char *)(puVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_low = (byte)E;
)
...>
}


@site_1_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x6)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(char *)((byte *)puVar7 + 0x6)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- ((char *)puVar7)[0x6]
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(char *)((ushort *)puVar7 + 0x3)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- (char)((ushort *)puVar7)[0x3]
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- *(char *)(puVar7 + 0x3)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- (char)puVar7[0x3]
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@site_1_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x7)
+ ((uw_object_hdr_t *)puVar7)->link_word_high
|
- *(byte *)((byte *)puVar7 + 0x7)
+ ((uw_object_hdr_t *)puVar7)->link_word_high
|
- ((byte *)puVar7)[0x7]
+ ((uw_object_hdr_t *)puVar7)->link_word_high
)
...>
}


@site_1_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x7)
+ ((uw_object_hdr_t *)puVar7)->link_word_high
|
- *(undefined1 *)((byte *)puVar7 + 0x7)
+ ((uw_object_hdr_t *)puVar7)->link_word_high
|
- ((undefined1 *)puVar7)[0x7]
+ ((uw_object_hdr_t *)puVar7)->link_word_high
)
...>
}


@site_1_header_w_6_51_address_7@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_high
|
- &*(char *)((byte *)puVar7 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_high
|
- &((char *)puVar7)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_high
)
...>
}


@site_1_header_w_6_51_store_7@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_high = (byte)E;
|
- ((char *)puVar7)[0x7] = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_high = (byte)E;
)
...>
}


@site_1_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x7)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_high
|
- *(char *)((byte *)puVar7 + 0x7)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_high
|
- ((char *)puVar7)[0x7]
+ (char)((uw_object_hdr_t *)puVar7)->link_word_high
)
...>
}


@collision_height_envelope_puVar7_hit_points_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x8)
+ ((uw_mobile_object_t *)puVar7)->hit_points
|
- *(byte *)(puVar7 + 0x4)
+ ((uw_mobile_object_t *)puVar7)->hit_points
|
- (byte)puVar7[0x4]
+ ((uw_mobile_object_t *)puVar7)->hit_points
)
...>
}

@collision_height_envelope_puVar7_hit_points_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x8)
+ ((uw_mobile_object_t *)puVar7)->hit_points
|
- *(undefined1 *)(puVar7 + 0x4)
+ ((uw_mobile_object_t *)puVar7)->hit_points
|
- (undefined1)puVar7[0x4]
+ ((uw_mobile_object_t *)puVar7)->hit_points
)
...>
}

@collision_height_envelope_puVar7_hit_points_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x8)
+ (char *)&((uw_mobile_object_t *)puVar7)->hit_points
|
- &*(char *)(puVar7 + 0x4)
+ (char *)&((uw_mobile_object_t *)puVar7)->hit_points
)
...>
}

@collision_height_envelope_puVar7_hit_points_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x8) = E;
+ ((uw_mobile_object_t *)puVar7)->hit_points = (byte)E;
|
- *(char *)(puVar7 + 0x4) = E;
+ ((uw_mobile_object_t *)puVar7)->hit_points = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_hit_points_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x8)
+ (char)((uw_mobile_object_t *)puVar7)->hit_points
|
- *(char *)(puVar7 + 0x4)
+ (char)((uw_mobile_object_t *)puVar7)->hit_points
|
- (char)puVar7[0x4]
+ (char)((uw_mobile_object_t *)puVar7)->hit_points
)
...>
}

@collision_height_envelope_puVar7_full_heading_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x9)
+ ((uw_mobile_object_t *)puVar7)->full_heading
)
...>
}

@collision_height_envelope_puVar7_full_heading_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x9)
+ ((uw_mobile_object_t *)puVar7)->full_heading
)
...>
}

@collision_height_envelope_puVar7_full_heading_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x9)
+ (char *)&((uw_mobile_object_t *)puVar7)->full_heading
)
...>
}

@collision_height_envelope_puVar7_full_heading_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x9) = E;
+ ((uw_mobile_object_t *)puVar7)->full_heading = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_full_heading_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x9)
+ (char)((uw_mobile_object_t *)puVar7)->full_heading
)
...>
}

@collision_height_envelope_puVar7_movement_flags_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0xa)
+ ((uw_mobile_object_t *)puVar7)->movement_flags
|
- *(byte *)(puVar7 + 0x5)
+ ((uw_mobile_object_t *)puVar7)->movement_flags
|
- (byte)puVar7[0x5]
+ ((uw_mobile_object_t *)puVar7)->movement_flags
)
...>
}

@collision_height_envelope_puVar7_movement_flags_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0xa)
+ ((uw_mobile_object_t *)puVar7)->movement_flags
|
- *(undefined1 *)(puVar7 + 0x5)
+ ((uw_mobile_object_t *)puVar7)->movement_flags
|
- (undefined1)puVar7[0x5]
+ ((uw_mobile_object_t *)puVar7)->movement_flags
)
...>
}

@collision_height_envelope_puVar7_movement_flags_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar7)->movement_flags
|
- &*(char *)(puVar7 + 0x5)
+ (char *)&((uw_mobile_object_t *)puVar7)->movement_flags
)
...>
}

@collision_height_envelope_puVar7_movement_flags_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar7)->movement_flags = (byte)E;
|
- *(char *)(puVar7 + 0x5) = E;
+ ((uw_mobile_object_t *)puVar7)->movement_flags = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_movement_flags_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0xa)
+ (char)((uw_mobile_object_t *)puVar7)->movement_flags
|
- *(char *)(puVar7 + 0x5)
+ (char)((uw_mobile_object_t *)puVar7)->movement_flags
|
- (char)puVar7[0x5]
+ (char)((uw_mobile_object_t *)puVar7)->movement_flags
)
...>
}

@collision_height_envelope_puVar7_motion_flags_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x13)
+ ((uw_mobile_object_t *)puVar7)->motion_flags
)
...>
}

@collision_height_envelope_puVar7_motion_flags_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x13)
+ ((uw_mobile_object_t *)puVar7)->motion_flags
)
...>
}

@collision_height_envelope_puVar7_motion_flags_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x13)
+ (char *)&((uw_mobile_object_t *)puVar7)->motion_flags
)
...>
}

@collision_height_envelope_puVar7_motion_flags_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x13) = E;
+ ((uw_mobile_object_t *)puVar7)->motion_flags = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_motion_flags_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x13)
+ (char)((uw_mobile_object_t *)puVar7)->motion_flags
)
...>
}

@collision_height_envelope_puVar7_attack_pitch_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x14)
+ ((uw_mobile_object_t *)puVar7)->attack_pitch
|
- *(byte *)(puVar7 + 0xa)
+ ((uw_mobile_object_t *)puVar7)->attack_pitch
|
- (byte)puVar7[0xa]
+ ((uw_mobile_object_t *)puVar7)->attack_pitch
)
...>
}

@collision_height_envelope_puVar7_attack_pitch_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x14)
+ ((uw_mobile_object_t *)puVar7)->attack_pitch
|
- *(undefined1 *)(puVar7 + 0xa)
+ ((uw_mobile_object_t *)puVar7)->attack_pitch
|
- (undefined1)puVar7[0xa]
+ ((uw_mobile_object_t *)puVar7)->attack_pitch
)
...>
}

@collision_height_envelope_puVar7_attack_pitch_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x14)
+ (char *)&((uw_mobile_object_t *)puVar7)->attack_pitch
|
- &*(char *)(puVar7 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar7)->attack_pitch
)
...>
}

@collision_height_envelope_puVar7_attack_pitch_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x14) = E;
+ ((uw_mobile_object_t *)puVar7)->attack_pitch = (byte)E;
|
- *(char *)(puVar7 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar7)->attack_pitch = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_attack_pitch_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x14)
+ (char)((uw_mobile_object_t *)puVar7)->attack_pitch
|
- *(char *)(puVar7 + 0xa)
+ (char)((uw_mobile_object_t *)puVar7)->attack_pitch
|
- (char)puVar7[0xa]
+ (char)((uw_mobile_object_t *)puVar7)->attack_pitch
)
...>
}

@collision_height_envelope_puVar7_animation_flags_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x15)
+ ((uw_mobile_object_t *)puVar7)->animation_flags
)
...>
}

@collision_height_envelope_puVar7_animation_flags_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x15)
+ ((uw_mobile_object_t *)puVar7)->animation_flags
)
...>
}

@collision_height_envelope_puVar7_animation_flags_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x15)
+ (char *)&((uw_mobile_object_t *)puVar7)->animation_flags
)
...>
}

@collision_height_envelope_puVar7_animation_flags_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x15) = E;
+ ((uw_mobile_object_t *)puVar7)->animation_flags = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_animation_flags_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x15)
+ (char)((uw_mobile_object_t *)puVar7)->animation_flags
)
...>
}

@collision_height_envelope_puVar7_heading_flags_byte@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0x18)
+ ((uw_mobile_object_t *)puVar7)->heading_flags
|
- *(byte *)(puVar7 + 0xc)
+ ((uw_mobile_object_t *)puVar7)->heading_flags
|
- (byte)puVar7[0xc]
+ ((uw_mobile_object_t *)puVar7)->heading_flags
)
...>
}

@collision_height_envelope_puVar7_heading_flags_undefined1@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0x18)
+ ((uw_mobile_object_t *)puVar7)->heading_flags
|
- *(undefined1 *)(puVar7 + 0xc)
+ ((uw_mobile_object_t *)puVar7)->heading_flags
|
- (undefined1)puVar7[0xc]
+ ((uw_mobile_object_t *)puVar7)->heading_flags
)
...>
}

@collision_height_envelope_puVar7_heading_flags_address@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x18)
+ (char *)&((uw_mobile_object_t *)puVar7)->heading_flags
|
- &*(char *)(puVar7 + 0xc)
+ (char *)&((uw_mobile_object_t *)puVar7)->heading_flags
)
...>
}

@collision_height_envelope_puVar7_heading_flags_store@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x18) = E;
+ ((uw_mobile_object_t *)puVar7)->heading_flags = (byte)E;
|
- *(char *)(puVar7 + 0xc) = E;
+ ((uw_mobile_object_t *)puVar7)->heading_flags = (byte)E;
)
...>
}

@collision_height_envelope_puVar7_heading_flags_char@
type R;
identifier F =~ "^\(collision_height_envelope\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0x18)
+ (char)((uw_mobile_object_t *)puVar7)->heading_flags
|
- *(char *)(puVar7 + 0xc)
+ (char)((uw_mobile_object_t *)puVar7)->heading_flags
|
- (char)puVar7[0xc]
+ (char)((uw_mobile_object_t *)puVar7)->heading_flags
)
...>
}
