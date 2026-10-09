@puVar7_w_13_0_pair_char_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0xd) = (char)V;
- *(char *)((char *)puVar7 + 0xe) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->status_word = (ushort)V;

...>
}

@puVar7_w_13_0_pair_char_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar7 + 0xd) = (char)V;
- *(byte *)((char *)puVar7 + 0xe) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->status_word = (ushort)V;

...>
}

@puVar7_w_13_0_pair_byte_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0xd) = (byte)V;
- *(char *)((char *)puVar7 + 0xe) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->status_word = (ushort)V;

...>
}

@puVar7_w_13_0_pair_byte_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar7 + 0xd) = (byte)V;
- *(byte *)((char *)puVar7 + 0xe) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar7)->status_word = (ushort)V;

...>
}

@puVar7_w_13_0_word_ushort@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word
|
- *(ushort *)((byte *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word
|
- *(ushort *)(puVar7 + 0x6)
+ ((uw_mobile_object_t *)puVar7)->status_word
|
- puVar7[0x6]
+ ((uw_mobile_object_t *)puVar7)->status_word
)
...>
}


@puVar7_w_13_0_word_undefined2@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word
|
- *(undefined2 *)((byte *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word
|
- *(undefined2 *)(puVar7 + 0x6)
+ ((uw_mobile_object_t *)puVar7)->status_word
|
- puVar7[0x6]
+ ((uw_mobile_object_t *)puVar7)->status_word
)
...>
}


@puVar7_w_13_0_word_short@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word_signed
|
- *(short *)((byte *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word_signed
|
- *(short *)(puVar7 + 0x6)
+ ((uw_mobile_object_t *)puVar7)->status_word_signed
)
...>
}


@puVar7_w_13_0_byte_13_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word_low
|
- *(byte *)((byte *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word_low
|
- ((byte *)puVar7)[0xd]
+ ((uw_mobile_object_t *)puVar7)->status_word_low
)
...>
}


@puVar7_w_13_0_byte_13_undefined1@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word_low
|
- *(undefined1 *)((byte *)puVar7 + 0xd)
+ ((uw_mobile_object_t *)puVar7)->status_word_low
|
- ((undefined1 *)puVar7)[0xd]
+ ((uw_mobile_object_t *)puVar7)->status_word_low
)
...>
}


@puVar7_w_13_0_address_13@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0xd)
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_low
|
- &*(char *)((byte *)puVar7 + 0xd)
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_low
|
- &((char *)puVar7)[0xd]
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_low
)
...>
}


@puVar7_w_13_0_store_13@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0xd) = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_low = (byte)E;
|
- *(char *)((byte *)puVar7 + 0xd) = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_low = (byte)E;
|
- ((char *)puVar7)[0xd] = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_low = (byte)E;
)
...>
}


@puVar7_w_13_0_byte_13_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0xd)
+ (char)((uw_mobile_object_t *)puVar7)->status_word_low
|
- *(char *)((byte *)puVar7 + 0xd)
+ (char)((uw_mobile_object_t *)puVar7)->status_word_low
|
- ((char *)puVar7)[0xd]
+ (char)((uw_mobile_object_t *)puVar7)->status_word_low
)
...>
}


@puVar7_w_13_0_byte_14_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar7 + 0xe)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(byte *)((byte *)puVar7 + 0xe)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- ((byte *)puVar7)[0xe]
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(byte *)((ushort *)puVar7 + 0x7)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- (byte)((ushort *)puVar7)[0x7]
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(byte *)(puVar7 + 0x7)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- (byte)puVar7[0x7]
+ ((uw_mobile_object_t *)puVar7)->status_word_high
)
...>
}


@puVar7_w_13_0_byte_14_undefined1@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar7 + 0xe)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(undefined1 *)((byte *)puVar7 + 0xe)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- ((undefined1 *)puVar7)[0xe]
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(undefined1 *)((ushort *)puVar7 + 0x7)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- (undefined1)((ushort *)puVar7)[0x7]
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(undefined1 *)(puVar7 + 0x7)
+ ((uw_mobile_object_t *)puVar7)->status_word_high
|
- (undefined1)puVar7[0x7]
+ ((uw_mobile_object_t *)puVar7)->status_word_high
)
...>
}


@puVar7_w_13_0_address_14@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0xe)
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_high
|
- &*(char *)((byte *)puVar7 + 0xe)
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_high
|
- &((char *)puVar7)[0xe]
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_high
|
- &*(char *)((ushort *)puVar7 + 0x7)
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_high
|
- &*(char *)(puVar7 + 0x7)
+ (char *)&((uw_mobile_object_t *)puVar7)->status_word_high
)
...>
}


@puVar7_w_13_0_store_14@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0xe) = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_high = (byte)E;
|
- *(char *)((byte *)puVar7 + 0xe) = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_high = (byte)E;
|
- ((char *)puVar7)[0xe] = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_high = (byte)E;
|
- *(char *)((ushort *)puVar7 + 0x7) = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_high = (byte)E;
|
- *(char *)(puVar7 + 0x7) = E;
+ ((uw_mobile_object_t *)puVar7)->status_word_high = (byte)E;
)
...>
}


@puVar7_w_13_0_byte_14_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar7 + 0xe)
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(char *)((byte *)puVar7 + 0xe)
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
|
- ((char *)puVar7)[0xe]
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(char *)((ushort *)puVar7 + 0x7)
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
|
- (char)((ushort *)puVar7)[0x7]
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
|
- *(char *)(puVar7 + 0x7)
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
|
- (char)puVar7[0x7]
+ (char)((uw_mobile_object_t *)puVar7)->status_word_high
)
...>
}


@babl_builtin_set_race_attitude_puVar7_movement@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (puVar7[5] & 0x80)
+ (((uw_mobile_object_t *)puVar7)->movement_flags & 0x80)
)
...>
}

@DAT_00100674_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_00100674 + 0x16) = (char)V;
- *(char *)((char *)DAT_00100674 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position = (ushort)V;

...>
}

@DAT_00100674_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_00100674 + 0x16) = (char)V;
- *(byte *)((char *)DAT_00100674 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position = (ushort)V;

...>
}

@DAT_00100674_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_00100674 + 0x16) = (byte)V;
- *(char *)((char *)DAT_00100674 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position = (ushort)V;

...>
}

@DAT_00100674_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_00100674 + 0x16) = (byte)V;
- *(byte *)((char *)DAT_00100674 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position = (ushort)V;

...>
}

@DAT_00100674_w_22_0_word_ushort@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- *(ushort *)((byte *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- ((ushort *)DAT_00100674)[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- *(ushort *)((ushort *)DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- *(ushort *)(DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- DAT_00100674[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
)
...>
}


@DAT_00100674_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- *(undefined2 *)((byte *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- ((undefined2 *)DAT_00100674)[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- *(undefined2 *)((undefined2 *)DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- *(undefined2 *)(DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
|
- DAT_00100674[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position
)
...>
}


@DAT_00100674_w_22_0_word_short@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_signed
|
- *(short *)((byte *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_signed
|
- ((short *)DAT_00100674)[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_signed
|
- *(short *)((short *)DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_signed
|
- *(short *)(DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_signed
)
...>
}


@DAT_00100674_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(byte *)((byte *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- ((byte *)DAT_00100674)[0x16]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(byte *)((ushort *)DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- (byte)((ushort *)DAT_00100674)[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(byte *)(DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- (byte)DAT_00100674[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
)
...>
}


@DAT_00100674_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(undefined1 *)((byte *)DAT_00100674 + 0x16)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- ((undefined1 *)DAT_00100674)[0x16]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(undefined1 *)((ushort *)DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- (undefined1)((ushort *)DAT_00100674)[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(undefined1 *)(DAT_00100674 + 0xb)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- (undefined1)DAT_00100674[0xb]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low
)
...>
}


@DAT_00100674_w_22_0_address_22@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)DAT_00100674 + 0x16)
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- &*(char *)((byte *)DAT_00100674 + 0x16)
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- &((char *)DAT_00100674)[0x16]
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- &*(char *)((ushort *)DAT_00100674 + 0xb)
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- &*(char *)(DAT_00100674 + 0xb)
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_low
)
...>
}


@DAT_00100674_w_22_0_store_22@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_00100674 + 0x16) = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low = (byte)E;
|
- *(char *)((byte *)DAT_00100674 + 0x16) = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low = (byte)E;
|
- ((char *)DAT_00100674)[0x16] = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)DAT_00100674 + 0xb) = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low = (byte)E;
|
- *(char *)(DAT_00100674 + 0xb) = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_low = (byte)E;
)
...>
}


@DAT_00100674_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_00100674 + 0x16)
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(char *)((byte *)DAT_00100674 + 0x16)
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- ((char *)DAT_00100674)[0x16]
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(char *)((ushort *)DAT_00100674 + 0xb)
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- (char)((ushort *)DAT_00100674)[0xb]
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- *(char *)(DAT_00100674 + 0xb)
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
|
- (char)DAT_00100674[0xb]
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_low
)
...>
}


@DAT_00100674_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_00100674 + 0x17)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- *(byte *)((byte *)DAT_00100674 + 0x17)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- ((byte *)DAT_00100674)[0x17]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high
)
...>
}


@DAT_00100674_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_00100674 + 0x17)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- *(undefined1 *)((byte *)DAT_00100674 + 0x17)
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- ((undefined1 *)DAT_00100674)[0x17]
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high
)
...>
}


@DAT_00100674_w_22_0_address_23@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)DAT_00100674 + 0x17)
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- &*(char *)((byte *)DAT_00100674 + 0x17)
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- &((char *)DAT_00100674)[0x17]
+ (char *)&((uw_mobile_object_t *)DAT_00100674)->tile_position_high
)
...>
}


@DAT_00100674_w_22_0_store_23@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_00100674 + 0x17) = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high = (byte)E;
|
- *(char *)((byte *)DAT_00100674 + 0x17) = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high = (byte)E;
|
- ((char *)DAT_00100674)[0x17] = E;
+ ((uw_mobile_object_t *)DAT_00100674)->tile_position_high = (byte)E;
)
...>
}


@DAT_00100674_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_00100674 + 0x17)
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- *(char *)((byte *)DAT_00100674 + 0x17)
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_high
|
- ((char *)DAT_00100674)[0x17]
+ (char)((uw_mobile_object_t *)DAT_00100674)->tile_position_high
)
...>
}


@status_word_npc_level_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (B->status_word & 0xf) >> 0
+ B->npc_level
|
- (B->status_word >> 0) & 0xf
+ B->npc_level
|
- B->status_word & 0xf
+ B->npc_level
|
- (B->status_word_signed & 0xf) >> 0
+ B->npc_level
|
- (B->status_word_signed >> 0) & 0xf
+ B->npc_level
|
- B->status_word_signed & 0xf
+ B->npc_level
|
- (B->status_word_low & 0xf) >> 0
+ B->npc_level
|
- (B->status_word_low >> 0) & 0xf
+ B->npc_level
|
- B->status_word_low & 0xf
+ B->npc_level
|
- ((char)B->status_word_low & 0xf) >> 0
+ B->npc_level
|
- ((char)B->status_word_low >> 0) & 0xf
+ B->npc_level
|
- (char)B->status_word_low & 0xf
+ B->npc_level
|
- ((byte)B->status_word & 0xf) >> 0
+ B->npc_level
|
- ((byte)B->status_word >> 0) & 0xf
+ B->npc_level
|
- (byte)B->status_word & 0xf
+ B->npc_level
|
- ((char)B->status_word & 0xf) >> 0
+ B->npc_level
|
- ((char)B->status_word >> 0) & 0xf
+ B->npc_level
|
- (char)B->status_word & 0xf
+ B->npc_level
)

@status_word_npc_talkedto_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->status_word >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word & 0x2000) >> 13
+ B->npc_talkedto
|
- B->status_word & 0x2000
+ (B->npc_talkedto << 13)
|
- (byte)(B->status_word_signed >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word_signed >> 13) & 0x1
+ B->npc_talkedto
|
- (B->status_word_signed & 0x2000) >> 13
+ B->npc_talkedto
|
- B->status_word_signed & 0x2000
+ (B->npc_talkedto << 13)
|
- (byte)(B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- (B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- (B->status_word_high & 0x20) >> 5
+ B->npc_talkedto
|
- B->status_word_high & 0x20
+ (B->npc_talkedto << 5)
|
- (byte)((char)B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- ((char)B->status_word_high >> 5) & 0x1
+ B->npc_talkedto
|
- ((char)B->status_word_high & 0x20) >> 5
+ B->npc_talkedto
|
- (char)B->status_word_high & 0x20
+ (B->npc_talkedto << 5)
)

@status_word_npc_attitude_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->status_word >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word & 0xc000) >> 14
+ B->npc_attitude
|
- B->status_word >> 14
+ B->npc_attitude
|
- B->status_word & 0xc000
+ (B->npc_attitude << 14)
|
- (byte)(B->status_word_signed >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word_signed >> 14) & 0x3
+ B->npc_attitude
|
- (B->status_word_signed & 0xc000) >> 14
+ B->npc_attitude
|
- B->status_word_signed & 0xc000
+ (B->npc_attitude << 14)
|
- (byte)(B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- (B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- (B->status_word_high & 0xc0) >> 6
+ B->npc_attitude
|
- B->status_word_high >> 6
+ B->npc_attitude
|
- B->status_word_high & 0xc0
+ (B->npc_attitude << 6)
|
- (byte)((char)B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- ((char)B->status_word_high >> 6) & 0x3
+ B->npc_attitude
|
- ((char)B->status_word_high & 0xc0) >> 6
+ B->npc_attitude
|
- (char)B->status_word_high & 0xc0
+ (B->npc_attitude << 6)
)

@tile_position_tile_y_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->tile_position >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position & 0x3f0) >> 4
+ B->tile_y
|
- B->tile_position & 0x3f0
+ (B->tile_y << 4)
|
- (byte)(B->tile_position_signed >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position_signed >> 4) & 0x3f
+ B->tile_y
|
- (B->tile_position_signed & 0x3f0) >> 4
+ B->tile_y
|
- B->tile_position_signed & 0x3f0
+ (B->tile_y << 4)
)

@tile_position_tile_x_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B->tile_position >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position & 0xfc00) >> 10
+ B->tile_x
|
- B->tile_position >> 10
+ B->tile_x
|
- B->tile_position & 0xfc00
+ (B->tile_x << 10)
|
- (byte)(B->tile_position_signed >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position_signed >> 10) & 0x3f
+ B->tile_x
|
- (B->tile_position_signed & 0xfc00) >> 10
+ B->tile_x
|
- B->tile_position_signed & 0xfc00
+ (B->tile_x << 10)
|
- (byte)(B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- (B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- (B->tile_position_high & 0xfc) >> 2
+ B->tile_x
|
- B->tile_position_high >> 2
+ B->tile_x
|
- B->tile_position_high & 0xfc
+ (B->tile_x << 2)
|
- (byte)((char)B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- ((char)B->tile_position_high >> 2) & 0x3f
+ B->tile_x
|
- ((char)B->tile_position_high & 0xfc) >> 2
+ B->tile_x
|
- (char)B->tile_position_high & 0xfc
+ (B->tile_x << 2)
)

@status_word_npc_level_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (B.status_word & 0xf) >> 0
+ B.npc_level
|
- (B.status_word >> 0) & 0xf
+ B.npc_level
|
- B.status_word & 0xf
+ B.npc_level
|
- (B.status_word_signed & 0xf) >> 0
+ B.npc_level
|
- (B.status_word_signed >> 0) & 0xf
+ B.npc_level
|
- B.status_word_signed & 0xf
+ B.npc_level
|
- (B.status_word_low & 0xf) >> 0
+ B.npc_level
|
- (B.status_word_low >> 0) & 0xf
+ B.npc_level
|
- B.status_word_low & 0xf
+ B.npc_level
|
- ((char)B.status_word_low & 0xf) >> 0
+ B.npc_level
|
- ((char)B.status_word_low >> 0) & 0xf
+ B.npc_level
|
- (char)B.status_word_low & 0xf
+ B.npc_level
|
- ((byte)B.status_word & 0xf) >> 0
+ B.npc_level
|
- ((byte)B.status_word >> 0) & 0xf
+ B.npc_level
|
- (byte)B.status_word & 0xf
+ B.npc_level
|
- ((char)B.status_word & 0xf) >> 0
+ B.npc_level
|
- ((char)B.status_word >> 0) & 0xf
+ B.npc_level
|
- (char)B.status_word & 0xf
+ B.npc_level
)

@status_word_npc_talkedto_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.status_word >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word & 0x2000) >> 13
+ B.npc_talkedto
|
- B.status_word & 0x2000
+ (B.npc_talkedto << 13)
|
- (byte)(B.status_word_signed >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word_signed >> 13) & 0x1
+ B.npc_talkedto
|
- (B.status_word_signed & 0x2000) >> 13
+ B.npc_talkedto
|
- B.status_word_signed & 0x2000
+ (B.npc_talkedto << 13)
|
- (byte)(B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- (B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- (B.status_word_high & 0x20) >> 5
+ B.npc_talkedto
|
- B.status_word_high & 0x20
+ (B.npc_talkedto << 5)
|
- (byte)((char)B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- ((char)B.status_word_high >> 5) & 0x1
+ B.npc_talkedto
|
- ((char)B.status_word_high & 0x20) >> 5
+ B.npc_talkedto
|
- (char)B.status_word_high & 0x20
+ (B.npc_talkedto << 5)
)

@status_word_npc_attitude_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.status_word >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word & 0xc000) >> 14
+ B.npc_attitude
|
- B.status_word >> 14
+ B.npc_attitude
|
- B.status_word & 0xc000
+ (B.npc_attitude << 14)
|
- (byte)(B.status_word_signed >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word_signed >> 14) & 0x3
+ B.npc_attitude
|
- (B.status_word_signed & 0xc000) >> 14
+ B.npc_attitude
|
- B.status_word_signed & 0xc000
+ (B.npc_attitude << 14)
|
- (byte)(B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- (B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- (B.status_word_high & 0xc0) >> 6
+ B.npc_attitude
|
- B.status_word_high >> 6
+ B.npc_attitude
|
- B.status_word_high & 0xc0
+ (B.npc_attitude << 6)
|
- (byte)((char)B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- ((char)B.status_word_high >> 6) & 0x3
+ B.npc_attitude
|
- ((char)B.status_word_high & 0xc0) >> 6
+ B.npc_attitude
|
- (char)B.status_word_high & 0xc0
+ (B.npc_attitude << 6)
)

@tile_position_tile_y_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.tile_position >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position & 0x3f0) >> 4
+ B.tile_y
|
- B.tile_position & 0x3f0
+ (B.tile_y << 4)
|
- (byte)(B.tile_position_signed >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position_signed >> 4) & 0x3f
+ B.tile_y
|
- (B.tile_position_signed & 0x3f0) >> 4
+ B.tile_y
|
- B.tile_position_signed & 0x3f0
+ (B.tile_y << 4)
)

@tile_position_tile_x_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
- (byte)(B.tile_position >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position & 0xfc00) >> 10
+ B.tile_x
|
- B.tile_position >> 10
+ B.tile_x
|
- B.tile_position & 0xfc00
+ (B.tile_x << 10)
|
- (byte)(B.tile_position_signed >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position_signed >> 10) & 0x3f
+ B.tile_x
|
- (B.tile_position_signed & 0xfc00) >> 10
+ B.tile_x
|
- B.tile_position_signed & 0xfc00
+ (B.tile_x << 10)
|
- (byte)(B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- (B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- (B.tile_position_high & 0xfc) >> 2
+ B.tile_x
|
- B.tile_position_high >> 2
+ B.tile_x
|
- B.tile_position_high & 0xfc
+ (B.tile_x << 2)
|
- (byte)((char)B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- ((char)B.tile_position_high >> 2) & 0x3f
+ B.tile_x
|
- ((char)B.tile_position_high & 0xfc) >> 2
+ B.tile_x
|
- (char)B.tile_position_high & 0xfc
+ (B.tile_x << 2)
)

@compare_status_word_npc_talkedto_5_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_talkedto << 5) == 0x0
+ B->npc_talkedto == 0
|
- ((B->npc_talkedto << 5)) == 0x0
+ B->npc_talkedto == 0
|
- (B->npc_talkedto << 5) != 0x0
+ B->npc_talkedto != 0
|
- ((B->npc_talkedto << 5)) != 0x0
+ B->npc_talkedto != 0
|
- (B->npc_talkedto << 5) == 0x20
+ B->npc_talkedto == 1
|
- ((B->npc_talkedto << 5)) == 0x20
+ B->npc_talkedto == 1
|
- (B->npc_talkedto << 5) != 0x20
+ B->npc_talkedto != 1
|
- ((B->npc_talkedto << 5)) != 0x20
+ B->npc_talkedto != 1
)

@compare_status_word_npc_talkedto_13_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_talkedto << 13) == 0x0
+ B->npc_talkedto == 0
|
- ((B->npc_talkedto << 13)) == 0x0
+ B->npc_talkedto == 0
|
- (B->npc_talkedto << 13) != 0x0
+ B->npc_talkedto != 0
|
- ((B->npc_talkedto << 13)) != 0x0
+ B->npc_talkedto != 0
|
- (B->npc_talkedto << 13) == 0x2000
+ B->npc_talkedto == 1
|
- ((B->npc_talkedto << 13)) == 0x2000
+ B->npc_talkedto == 1
|
- (B->npc_talkedto << 13) != 0x2000
+ B->npc_talkedto != 1
|
- ((B->npc_talkedto << 13)) != 0x2000
+ B->npc_talkedto != 1
)

@compare_status_word_npc_attitude_6_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_attitude << 6) == 0x0
+ B->npc_attitude == 0
|
- ((B->npc_attitude << 6)) == 0x0
+ B->npc_attitude == 0
|
- (B->npc_attitude << 6) != 0x0
+ B->npc_attitude != 0
|
- ((B->npc_attitude << 6)) != 0x0
+ B->npc_attitude != 0
|
- (B->npc_attitude << 6) == 0x40
+ B->npc_attitude == 1
|
- ((B->npc_attitude << 6)) == 0x40
+ B->npc_attitude == 1
|
- (B->npc_attitude << 6) != 0x40
+ B->npc_attitude != 1
|
- ((B->npc_attitude << 6)) != 0x40
+ B->npc_attitude != 1
|
- (B->npc_attitude << 6) == 0x80
+ B->npc_attitude == 2
|
- ((B->npc_attitude << 6)) == 0x80
+ B->npc_attitude == 2
|
- (B->npc_attitude << 6) != 0x80
+ B->npc_attitude != 2
|
- ((B->npc_attitude << 6)) != 0x80
+ B->npc_attitude != 2
|
- (B->npc_attitude << 6) == 0xc0
+ B->npc_attitude == 3
|
- ((B->npc_attitude << 6)) == 0xc0
+ B->npc_attitude == 3
|
- (B->npc_attitude << 6) != 0xc0
+ B->npc_attitude != 3
|
- ((B->npc_attitude << 6)) != 0xc0
+ B->npc_attitude != 3
)

@compare_status_word_npc_attitude_14_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->npc_attitude << 14) == 0x0
+ B->npc_attitude == 0
|
- ((B->npc_attitude << 14)) == 0x0
+ B->npc_attitude == 0
|
- (B->npc_attitude << 14) != 0x0
+ B->npc_attitude != 0
|
- ((B->npc_attitude << 14)) != 0x0
+ B->npc_attitude != 0
|
- (B->npc_attitude << 14) == 0x4000
+ B->npc_attitude == 1
|
- ((B->npc_attitude << 14)) == 0x4000
+ B->npc_attitude == 1
|
- (B->npc_attitude << 14) != 0x4000
+ B->npc_attitude != 1
|
- ((B->npc_attitude << 14)) != 0x4000
+ B->npc_attitude != 1
|
- (B->npc_attitude << 14) == 0x8000
+ B->npc_attitude == 2
|
- ((B->npc_attitude << 14)) == 0x8000
+ B->npc_attitude == 2
|
- (B->npc_attitude << 14) != 0x8000
+ B->npc_attitude != 2
|
- ((B->npc_attitude << 14)) != 0x8000
+ B->npc_attitude != 2
|
- (B->npc_attitude << 14) == 0xc000
+ B->npc_attitude == 3
|
- ((B->npc_attitude << 14)) == 0xc000
+ B->npc_attitude == 3
|
- (B->npc_attitude << 14) != 0xc000
+ B->npc_attitude != 3
|
- ((B->npc_attitude << 14)) != 0xc000
+ B->npc_attitude != 3
)

@compare_tile_position_tile_y_4_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->tile_y << 4) == 0x0
+ B->tile_y == 0
|
- ((B->tile_y << 4)) == 0x0
+ B->tile_y == 0
|
- (B->tile_y << 4) != 0x0
+ B->tile_y != 0
|
- ((B->tile_y << 4)) != 0x0
+ B->tile_y != 0
|
- (B->tile_y << 4) == 0x10
+ B->tile_y == 1
|
- ((B->tile_y << 4)) == 0x10
+ B->tile_y == 1
|
- (B->tile_y << 4) != 0x10
+ B->tile_y != 1
|
- ((B->tile_y << 4)) != 0x10
+ B->tile_y != 1
|
- (B->tile_y << 4) == 0x20
+ B->tile_y == 2
|
- ((B->tile_y << 4)) == 0x20
+ B->tile_y == 2
|
- (B->tile_y << 4) != 0x20
+ B->tile_y != 2
|
- ((B->tile_y << 4)) != 0x20
+ B->tile_y != 2
|
- (B->tile_y << 4) == 0x30
+ B->tile_y == 3
|
- ((B->tile_y << 4)) == 0x30
+ B->tile_y == 3
|
- (B->tile_y << 4) != 0x30
+ B->tile_y != 3
|
- ((B->tile_y << 4)) != 0x30
+ B->tile_y != 3
|
- (B->tile_y << 4) == 0x40
+ B->tile_y == 4
|
- ((B->tile_y << 4)) == 0x40
+ B->tile_y == 4
|
- (B->tile_y << 4) != 0x40
+ B->tile_y != 4
|
- ((B->tile_y << 4)) != 0x40
+ B->tile_y != 4
|
- (B->tile_y << 4) == 0x50
+ B->tile_y == 5
|
- ((B->tile_y << 4)) == 0x50
+ B->tile_y == 5
|
- (B->tile_y << 4) != 0x50
+ B->tile_y != 5
|
- ((B->tile_y << 4)) != 0x50
+ B->tile_y != 5
|
- (B->tile_y << 4) == 0x60
+ B->tile_y == 6
|
- ((B->tile_y << 4)) == 0x60
+ B->tile_y == 6
|
- (B->tile_y << 4) != 0x60
+ B->tile_y != 6
|
- ((B->tile_y << 4)) != 0x60
+ B->tile_y != 6
|
- (B->tile_y << 4) == 0x70
+ B->tile_y == 7
|
- ((B->tile_y << 4)) == 0x70
+ B->tile_y == 7
|
- (B->tile_y << 4) != 0x70
+ B->tile_y != 7
|
- ((B->tile_y << 4)) != 0x70
+ B->tile_y != 7
|
- (B->tile_y << 4) == 0x80
+ B->tile_y == 8
|
- ((B->tile_y << 4)) == 0x80
+ B->tile_y == 8
|
- (B->tile_y << 4) != 0x80
+ B->tile_y != 8
|
- ((B->tile_y << 4)) != 0x80
+ B->tile_y != 8
|
- (B->tile_y << 4) == 0x90
+ B->tile_y == 9
|
- ((B->tile_y << 4)) == 0x90
+ B->tile_y == 9
|
- (B->tile_y << 4) != 0x90
+ B->tile_y != 9
|
- ((B->tile_y << 4)) != 0x90
+ B->tile_y != 9
|
- (B->tile_y << 4) == 0xa0
+ B->tile_y == 10
|
- ((B->tile_y << 4)) == 0xa0
+ B->tile_y == 10
|
- (B->tile_y << 4) != 0xa0
+ B->tile_y != 10
|
- ((B->tile_y << 4)) != 0xa0
+ B->tile_y != 10
|
- (B->tile_y << 4) == 0xb0
+ B->tile_y == 11
|
- ((B->tile_y << 4)) == 0xb0
+ B->tile_y == 11
|
- (B->tile_y << 4) != 0xb0
+ B->tile_y != 11
|
- ((B->tile_y << 4)) != 0xb0
+ B->tile_y != 11
|
- (B->tile_y << 4) == 0xc0
+ B->tile_y == 12
|
- ((B->tile_y << 4)) == 0xc0
+ B->tile_y == 12
|
- (B->tile_y << 4) != 0xc0
+ B->tile_y != 12
|
- ((B->tile_y << 4)) != 0xc0
+ B->tile_y != 12
|
- (B->tile_y << 4) == 0xd0
+ B->tile_y == 13
|
- ((B->tile_y << 4)) == 0xd0
+ B->tile_y == 13
|
- (B->tile_y << 4) != 0xd0
+ B->tile_y != 13
|
- ((B->tile_y << 4)) != 0xd0
+ B->tile_y != 13
|
- (B->tile_y << 4) == 0xe0
+ B->tile_y == 14
|
- ((B->tile_y << 4)) == 0xe0
+ B->tile_y == 14
|
- (B->tile_y << 4) != 0xe0
+ B->tile_y != 14
|
- ((B->tile_y << 4)) != 0xe0
+ B->tile_y != 14
|
- (B->tile_y << 4) == 0xf0
+ B->tile_y == 15
|
- ((B->tile_y << 4)) == 0xf0
+ B->tile_y == 15
|
- (B->tile_y << 4) != 0xf0
+ B->tile_y != 15
|
- ((B->tile_y << 4)) != 0xf0
+ B->tile_y != 15
)

@compare_tile_position_tile_x_2_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->tile_x << 2) == 0x0
+ B->tile_x == 0
|
- ((B->tile_x << 2)) == 0x0
+ B->tile_x == 0
|
- (B->tile_x << 2) != 0x0
+ B->tile_x != 0
|
- ((B->tile_x << 2)) != 0x0
+ B->tile_x != 0
|
- (B->tile_x << 2) == 0x4
+ B->tile_x == 1
|
- ((B->tile_x << 2)) == 0x4
+ B->tile_x == 1
|
- (B->tile_x << 2) != 0x4
+ B->tile_x != 1
|
- ((B->tile_x << 2)) != 0x4
+ B->tile_x != 1
|
- (B->tile_x << 2) == 0x8
+ B->tile_x == 2
|
- ((B->tile_x << 2)) == 0x8
+ B->tile_x == 2
|
- (B->tile_x << 2) != 0x8
+ B->tile_x != 2
|
- ((B->tile_x << 2)) != 0x8
+ B->tile_x != 2
|
- (B->tile_x << 2) == 0xc
+ B->tile_x == 3
|
- ((B->tile_x << 2)) == 0xc
+ B->tile_x == 3
|
- (B->tile_x << 2) != 0xc
+ B->tile_x != 3
|
- ((B->tile_x << 2)) != 0xc
+ B->tile_x != 3
|
- (B->tile_x << 2) == 0x10
+ B->tile_x == 4
|
- ((B->tile_x << 2)) == 0x10
+ B->tile_x == 4
|
- (B->tile_x << 2) != 0x10
+ B->tile_x != 4
|
- ((B->tile_x << 2)) != 0x10
+ B->tile_x != 4
|
- (B->tile_x << 2) == 0x14
+ B->tile_x == 5
|
- ((B->tile_x << 2)) == 0x14
+ B->tile_x == 5
|
- (B->tile_x << 2) != 0x14
+ B->tile_x != 5
|
- ((B->tile_x << 2)) != 0x14
+ B->tile_x != 5
|
- (B->tile_x << 2) == 0x18
+ B->tile_x == 6
|
- ((B->tile_x << 2)) == 0x18
+ B->tile_x == 6
|
- (B->tile_x << 2) != 0x18
+ B->tile_x != 6
|
- ((B->tile_x << 2)) != 0x18
+ B->tile_x != 6
|
- (B->tile_x << 2) == 0x1c
+ B->tile_x == 7
|
- ((B->tile_x << 2)) == 0x1c
+ B->tile_x == 7
|
- (B->tile_x << 2) != 0x1c
+ B->tile_x != 7
|
- ((B->tile_x << 2)) != 0x1c
+ B->tile_x != 7
|
- (B->tile_x << 2) == 0x20
+ B->tile_x == 8
|
- ((B->tile_x << 2)) == 0x20
+ B->tile_x == 8
|
- (B->tile_x << 2) != 0x20
+ B->tile_x != 8
|
- ((B->tile_x << 2)) != 0x20
+ B->tile_x != 8
|
- (B->tile_x << 2) == 0x24
+ B->tile_x == 9
|
- ((B->tile_x << 2)) == 0x24
+ B->tile_x == 9
|
- (B->tile_x << 2) != 0x24
+ B->tile_x != 9
|
- ((B->tile_x << 2)) != 0x24
+ B->tile_x != 9
|
- (B->tile_x << 2) == 0x28
+ B->tile_x == 10
|
- ((B->tile_x << 2)) == 0x28
+ B->tile_x == 10
|
- (B->tile_x << 2) != 0x28
+ B->tile_x != 10
|
- ((B->tile_x << 2)) != 0x28
+ B->tile_x != 10
|
- (B->tile_x << 2) == 0x2c
+ B->tile_x == 11
|
- ((B->tile_x << 2)) == 0x2c
+ B->tile_x == 11
|
- (B->tile_x << 2) != 0x2c
+ B->tile_x != 11
|
- ((B->tile_x << 2)) != 0x2c
+ B->tile_x != 11
|
- (B->tile_x << 2) == 0x30
+ B->tile_x == 12
|
- ((B->tile_x << 2)) == 0x30
+ B->tile_x == 12
|
- (B->tile_x << 2) != 0x30
+ B->tile_x != 12
|
- ((B->tile_x << 2)) != 0x30
+ B->tile_x != 12
|
- (B->tile_x << 2) == 0x34
+ B->tile_x == 13
|
- ((B->tile_x << 2)) == 0x34
+ B->tile_x == 13
|
- (B->tile_x << 2) != 0x34
+ B->tile_x != 13
|
- ((B->tile_x << 2)) != 0x34
+ B->tile_x != 13
|
- (B->tile_x << 2) == 0x38
+ B->tile_x == 14
|
- ((B->tile_x << 2)) == 0x38
+ B->tile_x == 14
|
- (B->tile_x << 2) != 0x38
+ B->tile_x != 14
|
- ((B->tile_x << 2)) != 0x38
+ B->tile_x != 14
|
- (B->tile_x << 2) == 0x3c
+ B->tile_x == 15
|
- ((B->tile_x << 2)) == 0x3c
+ B->tile_x == 15
|
- (B->tile_x << 2) != 0x3c
+ B->tile_x != 15
|
- ((B->tile_x << 2)) != 0x3c
+ B->tile_x != 15
)

@compare_tile_position_tile_x_10_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B->tile_x << 10) == 0x0
+ B->tile_x == 0
|
- ((B->tile_x << 10)) == 0x0
+ B->tile_x == 0
|
- (B->tile_x << 10) != 0x0
+ B->tile_x != 0
|
- ((B->tile_x << 10)) != 0x0
+ B->tile_x != 0
|
- (B->tile_x << 10) == 0x400
+ B->tile_x == 1
|
- ((B->tile_x << 10)) == 0x400
+ B->tile_x == 1
|
- (B->tile_x << 10) != 0x400
+ B->tile_x != 1
|
- ((B->tile_x << 10)) != 0x400
+ B->tile_x != 1
|
- (B->tile_x << 10) == 0x800
+ B->tile_x == 2
|
- ((B->tile_x << 10)) == 0x800
+ B->tile_x == 2
|
- (B->tile_x << 10) != 0x800
+ B->tile_x != 2
|
- ((B->tile_x << 10)) != 0x800
+ B->tile_x != 2
|
- (B->tile_x << 10) == 0xc00
+ B->tile_x == 3
|
- ((B->tile_x << 10)) == 0xc00
+ B->tile_x == 3
|
- (B->tile_x << 10) != 0xc00
+ B->tile_x != 3
|
- ((B->tile_x << 10)) != 0xc00
+ B->tile_x != 3
|
- (B->tile_x << 10) == 0x1000
+ B->tile_x == 4
|
- ((B->tile_x << 10)) == 0x1000
+ B->tile_x == 4
|
- (B->tile_x << 10) != 0x1000
+ B->tile_x != 4
|
- ((B->tile_x << 10)) != 0x1000
+ B->tile_x != 4
|
- (B->tile_x << 10) == 0x1400
+ B->tile_x == 5
|
- ((B->tile_x << 10)) == 0x1400
+ B->tile_x == 5
|
- (B->tile_x << 10) != 0x1400
+ B->tile_x != 5
|
- ((B->tile_x << 10)) != 0x1400
+ B->tile_x != 5
|
- (B->tile_x << 10) == 0x1800
+ B->tile_x == 6
|
- ((B->tile_x << 10)) == 0x1800
+ B->tile_x == 6
|
- (B->tile_x << 10) != 0x1800
+ B->tile_x != 6
|
- ((B->tile_x << 10)) != 0x1800
+ B->tile_x != 6
|
- (B->tile_x << 10) == 0x1c00
+ B->tile_x == 7
|
- ((B->tile_x << 10)) == 0x1c00
+ B->tile_x == 7
|
- (B->tile_x << 10) != 0x1c00
+ B->tile_x != 7
|
- ((B->tile_x << 10)) != 0x1c00
+ B->tile_x != 7
|
- (B->tile_x << 10) == 0x2000
+ B->tile_x == 8
|
- ((B->tile_x << 10)) == 0x2000
+ B->tile_x == 8
|
- (B->tile_x << 10) != 0x2000
+ B->tile_x != 8
|
- ((B->tile_x << 10)) != 0x2000
+ B->tile_x != 8
|
- (B->tile_x << 10) == 0x2400
+ B->tile_x == 9
|
- ((B->tile_x << 10)) == 0x2400
+ B->tile_x == 9
|
- (B->tile_x << 10) != 0x2400
+ B->tile_x != 9
|
- ((B->tile_x << 10)) != 0x2400
+ B->tile_x != 9
|
- (B->tile_x << 10) == 0x2800
+ B->tile_x == 10
|
- ((B->tile_x << 10)) == 0x2800
+ B->tile_x == 10
|
- (B->tile_x << 10) != 0x2800
+ B->tile_x != 10
|
- ((B->tile_x << 10)) != 0x2800
+ B->tile_x != 10
|
- (B->tile_x << 10) == 0x2c00
+ B->tile_x == 11
|
- ((B->tile_x << 10)) == 0x2c00
+ B->tile_x == 11
|
- (B->tile_x << 10) != 0x2c00
+ B->tile_x != 11
|
- ((B->tile_x << 10)) != 0x2c00
+ B->tile_x != 11
|
- (B->tile_x << 10) == 0x3000
+ B->tile_x == 12
|
- ((B->tile_x << 10)) == 0x3000
+ B->tile_x == 12
|
- (B->tile_x << 10) != 0x3000
+ B->tile_x != 12
|
- ((B->tile_x << 10)) != 0x3000
+ B->tile_x != 12
|
- (B->tile_x << 10) == 0x3400
+ B->tile_x == 13
|
- ((B->tile_x << 10)) == 0x3400
+ B->tile_x == 13
|
- (B->tile_x << 10) != 0x3400
+ B->tile_x != 13
|
- ((B->tile_x << 10)) != 0x3400
+ B->tile_x != 13
|
- (B->tile_x << 10) == 0x3800
+ B->tile_x == 14
|
- ((B->tile_x << 10)) == 0x3800
+ B->tile_x == 14
|
- (B->tile_x << 10) != 0x3800
+ B->tile_x != 14
|
- ((B->tile_x << 10)) != 0x3800
+ B->tile_x != 14
|
- (B->tile_x << 10) == 0x3c00
+ B->tile_x == 15
|
- ((B->tile_x << 10)) == 0x3c00
+ B->tile_x == 15
|
- (B->tile_x << 10) != 0x3c00
+ B->tile_x != 15
|
- ((B->tile_x << 10)) != 0x3c00
+ B->tile_x != 15
)

@compare_status_word_npc_talkedto_5_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_talkedto << 5) == 0x0
+ B.npc_talkedto == 0
|
- ((B.npc_talkedto << 5)) == 0x0
+ B.npc_talkedto == 0
|
- (B.npc_talkedto << 5) != 0x0
+ B.npc_talkedto != 0
|
- ((B.npc_talkedto << 5)) != 0x0
+ B.npc_talkedto != 0
|
- (B.npc_talkedto << 5) == 0x20
+ B.npc_talkedto == 1
|
- ((B.npc_talkedto << 5)) == 0x20
+ B.npc_talkedto == 1
|
- (B.npc_talkedto << 5) != 0x20
+ B.npc_talkedto != 1
|
- ((B.npc_talkedto << 5)) != 0x20
+ B.npc_talkedto != 1
)

@compare_status_word_npc_talkedto_13_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_talkedto << 13) == 0x0
+ B.npc_talkedto == 0
|
- ((B.npc_talkedto << 13)) == 0x0
+ B.npc_talkedto == 0
|
- (B.npc_talkedto << 13) != 0x0
+ B.npc_talkedto != 0
|
- ((B.npc_talkedto << 13)) != 0x0
+ B.npc_talkedto != 0
|
- (B.npc_talkedto << 13) == 0x2000
+ B.npc_talkedto == 1
|
- ((B.npc_talkedto << 13)) == 0x2000
+ B.npc_talkedto == 1
|
- (B.npc_talkedto << 13) != 0x2000
+ B.npc_talkedto != 1
|
- ((B.npc_talkedto << 13)) != 0x2000
+ B.npc_talkedto != 1
)

@compare_status_word_npc_attitude_6_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_attitude << 6) == 0x0
+ B.npc_attitude == 0
|
- ((B.npc_attitude << 6)) == 0x0
+ B.npc_attitude == 0
|
- (B.npc_attitude << 6) != 0x0
+ B.npc_attitude != 0
|
- ((B.npc_attitude << 6)) != 0x0
+ B.npc_attitude != 0
|
- (B.npc_attitude << 6) == 0x40
+ B.npc_attitude == 1
|
- ((B.npc_attitude << 6)) == 0x40
+ B.npc_attitude == 1
|
- (B.npc_attitude << 6) != 0x40
+ B.npc_attitude != 1
|
- ((B.npc_attitude << 6)) != 0x40
+ B.npc_attitude != 1
|
- (B.npc_attitude << 6) == 0x80
+ B.npc_attitude == 2
|
- ((B.npc_attitude << 6)) == 0x80
+ B.npc_attitude == 2
|
- (B.npc_attitude << 6) != 0x80
+ B.npc_attitude != 2
|
- ((B.npc_attitude << 6)) != 0x80
+ B.npc_attitude != 2
|
- (B.npc_attitude << 6) == 0xc0
+ B.npc_attitude == 3
|
- ((B.npc_attitude << 6)) == 0xc0
+ B.npc_attitude == 3
|
- (B.npc_attitude << 6) != 0xc0
+ B.npc_attitude != 3
|
- ((B.npc_attitude << 6)) != 0xc0
+ B.npc_attitude != 3
)

@compare_status_word_npc_attitude_14_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.npc_attitude << 14) == 0x0
+ B.npc_attitude == 0
|
- ((B.npc_attitude << 14)) == 0x0
+ B.npc_attitude == 0
|
- (B.npc_attitude << 14) != 0x0
+ B.npc_attitude != 0
|
- ((B.npc_attitude << 14)) != 0x0
+ B.npc_attitude != 0
|
- (B.npc_attitude << 14) == 0x4000
+ B.npc_attitude == 1
|
- ((B.npc_attitude << 14)) == 0x4000
+ B.npc_attitude == 1
|
- (B.npc_attitude << 14) != 0x4000
+ B.npc_attitude != 1
|
- ((B.npc_attitude << 14)) != 0x4000
+ B.npc_attitude != 1
|
- (B.npc_attitude << 14) == 0x8000
+ B.npc_attitude == 2
|
- ((B.npc_attitude << 14)) == 0x8000
+ B.npc_attitude == 2
|
- (B.npc_attitude << 14) != 0x8000
+ B.npc_attitude != 2
|
- ((B.npc_attitude << 14)) != 0x8000
+ B.npc_attitude != 2
|
- (B.npc_attitude << 14) == 0xc000
+ B.npc_attitude == 3
|
- ((B.npc_attitude << 14)) == 0xc000
+ B.npc_attitude == 3
|
- (B.npc_attitude << 14) != 0xc000
+ B.npc_attitude != 3
|
- ((B.npc_attitude << 14)) != 0xc000
+ B.npc_attitude != 3
)

@compare_tile_position_tile_y_4_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.tile_y << 4) == 0x0
+ B.tile_y == 0
|
- ((B.tile_y << 4)) == 0x0
+ B.tile_y == 0
|
- (B.tile_y << 4) != 0x0
+ B.tile_y != 0
|
- ((B.tile_y << 4)) != 0x0
+ B.tile_y != 0
|
- (B.tile_y << 4) == 0x10
+ B.tile_y == 1
|
- ((B.tile_y << 4)) == 0x10
+ B.tile_y == 1
|
- (B.tile_y << 4) != 0x10
+ B.tile_y != 1
|
- ((B.tile_y << 4)) != 0x10
+ B.tile_y != 1
|
- (B.tile_y << 4) == 0x20
+ B.tile_y == 2
|
- ((B.tile_y << 4)) == 0x20
+ B.tile_y == 2
|
- (B.tile_y << 4) != 0x20
+ B.tile_y != 2
|
- ((B.tile_y << 4)) != 0x20
+ B.tile_y != 2
|
- (B.tile_y << 4) == 0x30
+ B.tile_y == 3
|
- ((B.tile_y << 4)) == 0x30
+ B.tile_y == 3
|
- (B.tile_y << 4) != 0x30
+ B.tile_y != 3
|
- ((B.tile_y << 4)) != 0x30
+ B.tile_y != 3
|
- (B.tile_y << 4) == 0x40
+ B.tile_y == 4
|
- ((B.tile_y << 4)) == 0x40
+ B.tile_y == 4
|
- (B.tile_y << 4) != 0x40
+ B.tile_y != 4
|
- ((B.tile_y << 4)) != 0x40
+ B.tile_y != 4
|
- (B.tile_y << 4) == 0x50
+ B.tile_y == 5
|
- ((B.tile_y << 4)) == 0x50
+ B.tile_y == 5
|
- (B.tile_y << 4) != 0x50
+ B.tile_y != 5
|
- ((B.tile_y << 4)) != 0x50
+ B.tile_y != 5
|
- (B.tile_y << 4) == 0x60
+ B.tile_y == 6
|
- ((B.tile_y << 4)) == 0x60
+ B.tile_y == 6
|
- (B.tile_y << 4) != 0x60
+ B.tile_y != 6
|
- ((B.tile_y << 4)) != 0x60
+ B.tile_y != 6
|
- (B.tile_y << 4) == 0x70
+ B.tile_y == 7
|
- ((B.tile_y << 4)) == 0x70
+ B.tile_y == 7
|
- (B.tile_y << 4) != 0x70
+ B.tile_y != 7
|
- ((B.tile_y << 4)) != 0x70
+ B.tile_y != 7
|
- (B.tile_y << 4) == 0x80
+ B.tile_y == 8
|
- ((B.tile_y << 4)) == 0x80
+ B.tile_y == 8
|
- (B.tile_y << 4) != 0x80
+ B.tile_y != 8
|
- ((B.tile_y << 4)) != 0x80
+ B.tile_y != 8
|
- (B.tile_y << 4) == 0x90
+ B.tile_y == 9
|
- ((B.tile_y << 4)) == 0x90
+ B.tile_y == 9
|
- (B.tile_y << 4) != 0x90
+ B.tile_y != 9
|
- ((B.tile_y << 4)) != 0x90
+ B.tile_y != 9
|
- (B.tile_y << 4) == 0xa0
+ B.tile_y == 10
|
- ((B.tile_y << 4)) == 0xa0
+ B.tile_y == 10
|
- (B.tile_y << 4) != 0xa0
+ B.tile_y != 10
|
- ((B.tile_y << 4)) != 0xa0
+ B.tile_y != 10
|
- (B.tile_y << 4) == 0xb0
+ B.tile_y == 11
|
- ((B.tile_y << 4)) == 0xb0
+ B.tile_y == 11
|
- (B.tile_y << 4) != 0xb0
+ B.tile_y != 11
|
- ((B.tile_y << 4)) != 0xb0
+ B.tile_y != 11
|
- (B.tile_y << 4) == 0xc0
+ B.tile_y == 12
|
- ((B.tile_y << 4)) == 0xc0
+ B.tile_y == 12
|
- (B.tile_y << 4) != 0xc0
+ B.tile_y != 12
|
- ((B.tile_y << 4)) != 0xc0
+ B.tile_y != 12
|
- (B.tile_y << 4) == 0xd0
+ B.tile_y == 13
|
- ((B.tile_y << 4)) == 0xd0
+ B.tile_y == 13
|
- (B.tile_y << 4) != 0xd0
+ B.tile_y != 13
|
- ((B.tile_y << 4)) != 0xd0
+ B.tile_y != 13
|
- (B.tile_y << 4) == 0xe0
+ B.tile_y == 14
|
- ((B.tile_y << 4)) == 0xe0
+ B.tile_y == 14
|
- (B.tile_y << 4) != 0xe0
+ B.tile_y != 14
|
- ((B.tile_y << 4)) != 0xe0
+ B.tile_y != 14
|
- (B.tile_y << 4) == 0xf0
+ B.tile_y == 15
|
- ((B.tile_y << 4)) == 0xf0
+ B.tile_y == 15
|
- (B.tile_y << 4) != 0xf0
+ B.tile_y != 15
|
- ((B.tile_y << 4)) != 0xf0
+ B.tile_y != 15
)

@compare_tile_position_tile_x_2_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.tile_x << 2) == 0x0
+ B.tile_x == 0
|
- ((B.tile_x << 2)) == 0x0
+ B.tile_x == 0
|
- (B.tile_x << 2) != 0x0
+ B.tile_x != 0
|
- ((B.tile_x << 2)) != 0x0
+ B.tile_x != 0
|
- (B.tile_x << 2) == 0x4
+ B.tile_x == 1
|
- ((B.tile_x << 2)) == 0x4
+ B.tile_x == 1
|
- (B.tile_x << 2) != 0x4
+ B.tile_x != 1
|
- ((B.tile_x << 2)) != 0x4
+ B.tile_x != 1
|
- (B.tile_x << 2) == 0x8
+ B.tile_x == 2
|
- ((B.tile_x << 2)) == 0x8
+ B.tile_x == 2
|
- (B.tile_x << 2) != 0x8
+ B.tile_x != 2
|
- ((B.tile_x << 2)) != 0x8
+ B.tile_x != 2
|
- (B.tile_x << 2) == 0xc
+ B.tile_x == 3
|
- ((B.tile_x << 2)) == 0xc
+ B.tile_x == 3
|
- (B.tile_x << 2) != 0xc
+ B.tile_x != 3
|
- ((B.tile_x << 2)) != 0xc
+ B.tile_x != 3
|
- (B.tile_x << 2) == 0x10
+ B.tile_x == 4
|
- ((B.tile_x << 2)) == 0x10
+ B.tile_x == 4
|
- (B.tile_x << 2) != 0x10
+ B.tile_x != 4
|
- ((B.tile_x << 2)) != 0x10
+ B.tile_x != 4
|
- (B.tile_x << 2) == 0x14
+ B.tile_x == 5
|
- ((B.tile_x << 2)) == 0x14
+ B.tile_x == 5
|
- (B.tile_x << 2) != 0x14
+ B.tile_x != 5
|
- ((B.tile_x << 2)) != 0x14
+ B.tile_x != 5
|
- (B.tile_x << 2) == 0x18
+ B.tile_x == 6
|
- ((B.tile_x << 2)) == 0x18
+ B.tile_x == 6
|
- (B.tile_x << 2) != 0x18
+ B.tile_x != 6
|
- ((B.tile_x << 2)) != 0x18
+ B.tile_x != 6
|
- (B.tile_x << 2) == 0x1c
+ B.tile_x == 7
|
- ((B.tile_x << 2)) == 0x1c
+ B.tile_x == 7
|
- (B.tile_x << 2) != 0x1c
+ B.tile_x != 7
|
- ((B.tile_x << 2)) != 0x1c
+ B.tile_x != 7
|
- (B.tile_x << 2) == 0x20
+ B.tile_x == 8
|
- ((B.tile_x << 2)) == 0x20
+ B.tile_x == 8
|
- (B.tile_x << 2) != 0x20
+ B.tile_x != 8
|
- ((B.tile_x << 2)) != 0x20
+ B.tile_x != 8
|
- (B.tile_x << 2) == 0x24
+ B.tile_x == 9
|
- ((B.tile_x << 2)) == 0x24
+ B.tile_x == 9
|
- (B.tile_x << 2) != 0x24
+ B.tile_x != 9
|
- ((B.tile_x << 2)) != 0x24
+ B.tile_x != 9
|
- (B.tile_x << 2) == 0x28
+ B.tile_x == 10
|
- ((B.tile_x << 2)) == 0x28
+ B.tile_x == 10
|
- (B.tile_x << 2) != 0x28
+ B.tile_x != 10
|
- ((B.tile_x << 2)) != 0x28
+ B.tile_x != 10
|
- (B.tile_x << 2) == 0x2c
+ B.tile_x == 11
|
- ((B.tile_x << 2)) == 0x2c
+ B.tile_x == 11
|
- (B.tile_x << 2) != 0x2c
+ B.tile_x != 11
|
- ((B.tile_x << 2)) != 0x2c
+ B.tile_x != 11
|
- (B.tile_x << 2) == 0x30
+ B.tile_x == 12
|
- ((B.tile_x << 2)) == 0x30
+ B.tile_x == 12
|
- (B.tile_x << 2) != 0x30
+ B.tile_x != 12
|
- ((B.tile_x << 2)) != 0x30
+ B.tile_x != 12
|
- (B.tile_x << 2) == 0x34
+ B.tile_x == 13
|
- ((B.tile_x << 2)) == 0x34
+ B.tile_x == 13
|
- (B.tile_x << 2) != 0x34
+ B.tile_x != 13
|
- ((B.tile_x << 2)) != 0x34
+ B.tile_x != 13
|
- (B.tile_x << 2) == 0x38
+ B.tile_x == 14
|
- ((B.tile_x << 2)) == 0x38
+ B.tile_x == 14
|
- (B.tile_x << 2) != 0x38
+ B.tile_x != 14
|
- ((B.tile_x << 2)) != 0x38
+ B.tile_x != 14
|
- (B.tile_x << 2) == 0x3c
+ B.tile_x == 15
|
- ((B.tile_x << 2)) == 0x3c
+ B.tile_x == 15
|
- (B.tile_x << 2) != 0x3c
+ B.tile_x != 15
|
- ((B.tile_x << 2)) != 0x3c
+ B.tile_x != 15
)

@compare_tile_position_tile_x_10_value disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
- (B.tile_x << 10) == 0x0
+ B.tile_x == 0
|
- ((B.tile_x << 10)) == 0x0
+ B.tile_x == 0
|
- (B.tile_x << 10) != 0x0
+ B.tile_x != 0
|
- ((B.tile_x << 10)) != 0x0
+ B.tile_x != 0
|
- (B.tile_x << 10) == 0x400
+ B.tile_x == 1
|
- ((B.tile_x << 10)) == 0x400
+ B.tile_x == 1
|
- (B.tile_x << 10) != 0x400
+ B.tile_x != 1
|
- ((B.tile_x << 10)) != 0x400
+ B.tile_x != 1
|
- (B.tile_x << 10) == 0x800
+ B.tile_x == 2
|
- ((B.tile_x << 10)) == 0x800
+ B.tile_x == 2
|
- (B.tile_x << 10) != 0x800
+ B.tile_x != 2
|
- ((B.tile_x << 10)) != 0x800
+ B.tile_x != 2
|
- (B.tile_x << 10) == 0xc00
+ B.tile_x == 3
|
- ((B.tile_x << 10)) == 0xc00
+ B.tile_x == 3
|
- (B.tile_x << 10) != 0xc00
+ B.tile_x != 3
|
- ((B.tile_x << 10)) != 0xc00
+ B.tile_x != 3
|
- (B.tile_x << 10) == 0x1000
+ B.tile_x == 4
|
- ((B.tile_x << 10)) == 0x1000
+ B.tile_x == 4
|
- (B.tile_x << 10) != 0x1000
+ B.tile_x != 4
|
- ((B.tile_x << 10)) != 0x1000
+ B.tile_x != 4
|
- (B.tile_x << 10) == 0x1400
+ B.tile_x == 5
|
- ((B.tile_x << 10)) == 0x1400
+ B.tile_x == 5
|
- (B.tile_x << 10) != 0x1400
+ B.tile_x != 5
|
- ((B.tile_x << 10)) != 0x1400
+ B.tile_x != 5
|
- (B.tile_x << 10) == 0x1800
+ B.tile_x == 6
|
- ((B.tile_x << 10)) == 0x1800
+ B.tile_x == 6
|
- (B.tile_x << 10) != 0x1800
+ B.tile_x != 6
|
- ((B.tile_x << 10)) != 0x1800
+ B.tile_x != 6
|
- (B.tile_x << 10) == 0x1c00
+ B.tile_x == 7
|
- ((B.tile_x << 10)) == 0x1c00
+ B.tile_x == 7
|
- (B.tile_x << 10) != 0x1c00
+ B.tile_x != 7
|
- ((B.tile_x << 10)) != 0x1c00
+ B.tile_x != 7
|
- (B.tile_x << 10) == 0x2000
+ B.tile_x == 8
|
- ((B.tile_x << 10)) == 0x2000
+ B.tile_x == 8
|
- (B.tile_x << 10) != 0x2000
+ B.tile_x != 8
|
- ((B.tile_x << 10)) != 0x2000
+ B.tile_x != 8
|
- (B.tile_x << 10) == 0x2400
+ B.tile_x == 9
|
- ((B.tile_x << 10)) == 0x2400
+ B.tile_x == 9
|
- (B.tile_x << 10) != 0x2400
+ B.tile_x != 9
|
- ((B.tile_x << 10)) != 0x2400
+ B.tile_x != 9
|
- (B.tile_x << 10) == 0x2800
+ B.tile_x == 10
|
- ((B.tile_x << 10)) == 0x2800
+ B.tile_x == 10
|
- (B.tile_x << 10) != 0x2800
+ B.tile_x != 10
|
- ((B.tile_x << 10)) != 0x2800
+ B.tile_x != 10
|
- (B.tile_x << 10) == 0x2c00
+ B.tile_x == 11
|
- ((B.tile_x << 10)) == 0x2c00
+ B.tile_x == 11
|
- (B.tile_x << 10) != 0x2c00
+ B.tile_x != 11
|
- ((B.tile_x << 10)) != 0x2c00
+ B.tile_x != 11
|
- (B.tile_x << 10) == 0x3000
+ B.tile_x == 12
|
- ((B.tile_x << 10)) == 0x3000
+ B.tile_x == 12
|
- (B.tile_x << 10) != 0x3000
+ B.tile_x != 12
|
- ((B.tile_x << 10)) != 0x3000
+ B.tile_x != 12
|
- (B.tile_x << 10) == 0x3400
+ B.tile_x == 13
|
- ((B.tile_x << 10)) == 0x3400
+ B.tile_x == 13
|
- (B.tile_x << 10) != 0x3400
+ B.tile_x != 13
|
- ((B.tile_x << 10)) != 0x3400
+ B.tile_x != 13
|
- (B.tile_x << 10) == 0x3800
+ B.tile_x == 14
|
- ((B.tile_x << 10)) == 0x3800
+ B.tile_x == 14
|
- (B.tile_x << 10) != 0x3800
+ B.tile_x != 14
|
- ((B.tile_x << 10)) != 0x3800
+ B.tile_x != 14
|
- (B.tile_x << 10) == 0x3c00
+ B.tile_x == 15
|
- ((B.tile_x << 10)) == 0x3c00
+ B.tile_x == 15
|
- (B.tile_x << 10) != 0x3c00
+ B.tile_x != 15
|
- ((B.tile_x << 10)) != 0x3c00
+ B.tile_x != 15
)
