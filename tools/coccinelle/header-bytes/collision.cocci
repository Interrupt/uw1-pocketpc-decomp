@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(build_collision_height_field_for_object\)$";
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


@receiver_1_w_0_0_pair_char_char@
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

@receiver_1_w_0_0_pair_char_byte@
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

@receiver_1_w_0_0_pair_byte_char@
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

@receiver_1_w_0_0_pair_byte_byte@
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

@receiver_1_w_0_0_word_ushort@
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


@receiver_1_w_0_0_word_undefined2@
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


@receiver_1_w_0_0_word_short@
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


@receiver_1_w_0_0_byte_0_byte@
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


@receiver_1_w_0_0_byte_0_undefined1@
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


@receiver_1_w_0_0_address_0@
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


@receiver_1_w_0_0_store_0@
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


@receiver_1_w_0_0_byte_0_char@
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


@receiver_1_w_0_0_byte_1_byte@
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


@receiver_1_w_0_0_byte_1_undefined1@
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


@receiver_1_w_0_0_address_1@
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


@receiver_1_w_0_0_store_1@
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


@receiver_1_w_0_0_byte_1_char@
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


@receiver_1_w_2_17_pair_char_char@
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

@receiver_1_w_2_17_pair_char_byte@
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

@receiver_1_w_2_17_pair_byte_char@
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

@receiver_1_w_2_17_pair_byte_byte@
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

@receiver_1_w_2_17_word_ushort@
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


@receiver_1_w_2_17_word_undefined2@
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


@receiver_1_w_2_17_word_short@
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


@receiver_1_w_2_17_byte_2_byte@
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


@receiver_1_w_2_17_byte_2_undefined1@
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


@receiver_1_w_2_17_address_2@
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


@receiver_1_w_2_17_store_2@
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


@receiver_1_w_2_17_byte_2_char@
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


@receiver_1_w_2_17_byte_3_byte@
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


@receiver_1_w_2_17_byte_3_undefined1@
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


@receiver_1_w_2_17_address_3@
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


@receiver_1_w_2_17_store_3@
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


@receiver_1_w_2_17_byte_3_char@
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


@receiver_1_w_4_34_pair_char_char@
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

@receiver_1_w_4_34_pair_char_byte@
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

@receiver_1_w_4_34_pair_byte_char@
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

@receiver_1_w_4_34_pair_byte_byte@
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

@receiver_1_w_4_34_word_ushort@
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


@receiver_1_w_4_34_word_undefined2@
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


@receiver_1_w_4_34_word_short@
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


@receiver_1_w_4_34_byte_4_byte@
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


@receiver_1_w_4_34_byte_4_undefined1@
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


@receiver_1_w_4_34_address_4@
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


@receiver_1_w_4_34_store_4@
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


@receiver_1_w_4_34_byte_4_char@
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


@receiver_1_w_4_34_byte_5_byte@
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


@receiver_1_w_4_34_byte_5_undefined1@
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


@receiver_1_w_4_34_address_5@
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


@receiver_1_w_4_34_store_5@
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


@receiver_1_w_4_34_byte_5_char@
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


@receiver_1_w_6_51_pair_char_char@
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

@receiver_1_w_6_51_pair_char_byte@
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

@receiver_1_w_6_51_pair_byte_char@
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

@receiver_1_w_6_51_pair_byte_byte@
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

@receiver_1_w_6_51_word_ushort@
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


@receiver_1_w_6_51_word_undefined2@
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


@receiver_1_w_6_51_word_short@
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


@receiver_1_w_6_51_byte_6_byte@
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


@receiver_1_w_6_51_byte_6_undefined1@
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


@receiver_1_w_6_51_address_6@
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


@receiver_1_w_6_51_store_6@
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


@receiver_1_w_6_51_byte_6_char@
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


@receiver_1_w_6_51_byte_7_byte@
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


@receiver_1_w_6_51_byte_7_undefined1@
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


@receiver_1_w_6_51_address_7@
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


@receiver_1_w_6_51_store_7@
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


@receiver_1_w_6_51_byte_7_char@
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


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(check_object_placement_clearance\)$";
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
