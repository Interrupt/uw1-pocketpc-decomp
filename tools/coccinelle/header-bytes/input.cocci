@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x0) = (char)V;
- *(char *)((char *)uVar11 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x0) = (char)V;
- *(byte *)((char *)uVar11 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x0) = (byte)V;
- *(char *)((char *)uVar11 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x0) = (byte)V;
- *(byte *)((char *)uVar11 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(ushort *)((byte *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- ((ushort *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(ushort *)((ushort *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(ushort *)(uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- uVar11[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *uVar11
+ ((uw_object_hdr_t *)uVar11)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(undefined2 *)((byte *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- ((undefined2 *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(undefined2 *)((undefined2 *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *(undefined2 *)(uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- uVar11[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags
|
- *uVar11
+ ((uw_object_hdr_t *)uVar11)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_signed
|
- *(short *)((byte *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_signed
|
- ((short *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_signed
|
- *(short *)((short *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_signed
|
- *(short *)(uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(byte *)((byte *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- ((byte *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(byte *)((ushort *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- (byte)((ushort *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(byte *)uVar11
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(byte *)(uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- (byte)uVar11[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(undefined1 *)((byte *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- ((undefined1 *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(undefined1 *)((ushort *)uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- (undefined1)((ushort *)uVar11)[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(undefined1 *)uVar11
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(undefined1 *)(uVar11 + 0x0)
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
|
- (undefined1)uVar11[0x0]
+ ((uw_object_hdr_t *)uVar11)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_low
|
- &*(char *)((byte *)uVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_low
|
- &((char *)uVar11)[0x0]
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_low
|
- &*(char *)((ushort *)uVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_low
|
- &*(char *)uVar11
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_low
|
- &*(char *)(uVar11 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_low = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_low = (byte)E;
|
- ((char *)uVar11)[0x0] = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)uVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_low = (byte)E;
|
- *(char *)uVar11 = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_low = (byte)E;
|
- *(char *)(uVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x0)
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(char *)((byte *)uVar11 + 0x0)
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- ((char *)uVar11)[0x0]
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(char *)((ushort *)uVar11 + 0x0)
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- (char)((ushort *)uVar11)[0x0]
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(char *)uVar11
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- *(char *)(uVar11 + 0x0)
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
|
- (char)uVar11[0x0]
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->type_flags_high
|
- *(byte *)((byte *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->type_flags_high
|
- ((byte *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->type_flags_high
|
- *(undefined1 *)((byte *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->type_flags_high
|
- ((undefined1 *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->type_flags_high
)
...>
}


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_high
|
- &*(char *)((byte *)uVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_high
|
- &((char *)uVar11)[0x1]
+ (char *)&((uw_object_hdr_t *)uVar11)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_high = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_high = (byte)E;
|
- ((char *)uVar11)[0x1] = E;
+ ((uw_object_hdr_t *)uVar11)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x1)
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_high
|
- *(char *)((byte *)uVar11 + 0x1)
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_high
|
- ((char *)uVar11)[0x1]
+ (char)((uw_object_hdr_t *)uVar11)->type_flags_high
)
...>
}


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x2) = (char)V;
- *(char *)((char *)uVar11 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x2) = (char)V;
- *(byte *)((char *)uVar11 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x2) = (byte)V;
- *(char *)((char *)uVar11 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x2) = (byte)V;
- *(byte *)((char *)uVar11 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- *(ushort *)((byte *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- ((ushort *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- *(ushort *)((ushort *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- *(ushort *)(uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- uVar11[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- *(undefined2 *)((byte *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- ((undefined2 *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- *(undefined2 *)((undefined2 *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- *(undefined2 *)(uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word
|
- uVar11[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word_signed
|
- *(short *)((byte *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word_signed
|
- ((short *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word_signed
|
- *(short *)((short *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word_signed
|
- *(short *)(uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(byte *)((byte *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- ((byte *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(byte *)((ushort *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- (byte)((ushort *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(byte *)(uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- (byte)uVar11[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(undefined1 *)((byte *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- ((undefined1 *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(undefined1 *)((ushort *)uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- (undefined1)((ushort *)uVar11)[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(undefined1 *)(uVar11 + 0x1)
+ ((uw_object_hdr_t *)uVar11)->position_word_low
|
- (undefined1)uVar11[0x1]
+ ((uw_object_hdr_t *)uVar11)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_low
|
- &*(char *)((byte *)uVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_low
|
- &((char *)uVar11)[0x2]
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_low
|
- &*(char *)((ushort *)uVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_low
|
- &*(char *)(uVar11 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_low = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_low = (byte)E;
|
- ((char *)uVar11)[0x2] = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_low = (byte)E;
|
- *(char *)((ushort *)uVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_low = (byte)E;
|
- *(char *)(uVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x2)
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(char *)((byte *)uVar11 + 0x2)
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
|
- ((char *)uVar11)[0x2]
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(char *)((ushort *)uVar11 + 0x1)
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
|
- (char)((ushort *)uVar11)[0x1]
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
|
- *(char *)(uVar11 + 0x1)
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
|
- (char)uVar11[0x1]
+ (char)((uw_object_hdr_t *)uVar11)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->position_word_high
|
- *(byte *)((byte *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->position_word_high
|
- ((byte *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->position_word_high
)
...>
}


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->position_word_high
|
- *(undefined1 *)((byte *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->position_word_high
|
- ((undefined1 *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->position_word_high
)
...>
}


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_high
|
- &*(char *)((byte *)uVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_high
|
- &((char *)uVar11)[0x3]
+ (char *)&((uw_object_hdr_t *)uVar11)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_high = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_high = (byte)E;
|
- ((char *)uVar11)[0x3] = E;
+ ((uw_object_hdr_t *)uVar11)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x3)
+ (char)((uw_object_hdr_t *)uVar11)->position_word_high
|
- *(char *)((byte *)uVar11 + 0x3)
+ (char)((uw_object_hdr_t *)uVar11)->position_word_high
|
- ((char *)uVar11)[0x3]
+ (char)((uw_object_hdr_t *)uVar11)->position_word_high
)
...>
}


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x4) = (char)V;
- *(char *)((char *)uVar11 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x4) = (char)V;
- *(byte *)((char *)uVar11 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x4) = (byte)V;
- *(char *)((char *)uVar11 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x4) = (byte)V;
- *(byte *)((char *)uVar11 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- *(ushort *)((byte *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- ((ushort *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- *(ushort *)((ushort *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- *(ushort *)(uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- uVar11[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- *(undefined2 *)((byte *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- ((undefined2 *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- *(undefined2 *)((undefined2 *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- *(undefined2 *)(uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word
|
- uVar11[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word_signed
|
- *(short *)((byte *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word_signed
|
- ((short *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word_signed
|
- *(short *)((short *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word_signed
|
- *(short *)(uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(byte *)((byte *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- ((byte *)uVar11)[0x4]
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(byte *)((ushort *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- (byte)((ushort *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(byte *)(uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- (byte)uVar11[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(undefined1 *)((byte *)uVar11 + 0x4)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- ((undefined1 *)uVar11)[0x4]
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(undefined1 *)((ushort *)uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- (undefined1)((ushort *)uVar11)[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(undefined1 *)(uVar11 + 0x2)
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
|
- (undefined1)uVar11[0x2]
+ ((uw_object_hdr_t *)uVar11)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_low
|
- &*(char *)((byte *)uVar11 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_low
|
- &((char *)uVar11)[0x4]
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_low
|
- &*(char *)((ushort *)uVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_low
|
- &*(char *)(uVar11 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_low = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_low = (byte)E;
|
- ((char *)uVar11)[0x4] = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)uVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_low = (byte)E;
|
- *(char *)(uVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x4)
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(char *)((byte *)uVar11 + 0x4)
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
|
- ((char *)uVar11)[0x4]
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(char *)((ushort *)uVar11 + 0x2)
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
|
- (char)((ushort *)uVar11)[0x2]
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
|
- *(char *)(uVar11 + 0x2)
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
|
- (char)uVar11[0x2]
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x5)
+ ((uw_object_hdr_t *)uVar11)->chain_word_high
|
- *(byte *)((byte *)uVar11 + 0x5)
+ ((uw_object_hdr_t *)uVar11)->chain_word_high
|
- ((byte *)uVar11)[0x5]
+ ((uw_object_hdr_t *)uVar11)->chain_word_high
)
...>
}


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x5)
+ ((uw_object_hdr_t *)uVar11)->chain_word_high
|
- *(undefined1 *)((byte *)uVar11 + 0x5)
+ ((uw_object_hdr_t *)uVar11)->chain_word_high
|
- ((undefined1 *)uVar11)[0x5]
+ ((uw_object_hdr_t *)uVar11)->chain_word_high
)
...>
}


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_high
|
- &*(char *)((byte *)uVar11 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_high
|
- &((char *)uVar11)[0x5]
+ (char *)&((uw_object_hdr_t *)uVar11)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_high = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_high = (byte)E;
|
- ((char *)uVar11)[0x5] = E;
+ ((uw_object_hdr_t *)uVar11)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x5)
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_high
|
- *(char *)((byte *)uVar11 + 0x5)
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_high
|
- ((char *)uVar11)[0x5]
+ (char)((uw_object_hdr_t *)uVar11)->chain_word_high
)
...>
}


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x6) = (char)V;
- *(char *)((char *)uVar11 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar11 + 0x6) = (char)V;
- *(byte *)((char *)uVar11 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x6) = (byte)V;
- *(char *)((char *)uVar11 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar11 + 0x6) = (byte)V;
- *(byte *)((char *)uVar11 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar11)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- *(ushort *)((byte *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- ((ushort *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- *(ushort *)((ushort *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- *(ushort *)(uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- uVar11[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- *(undefined2 *)((byte *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- ((undefined2 *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- *(undefined2 *)((undefined2 *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- *(undefined2 *)(uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word
|
- uVar11[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word_signed
|
- *(short *)((byte *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word_signed
|
- ((short *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word_signed
|
- *(short *)((short *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word_signed
|
- *(short *)(uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(byte *)((byte *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- ((byte *)uVar11)[0x6]
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(byte *)((ushort *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- (byte)((ushort *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(byte *)(uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- (byte)uVar11[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(undefined1 *)((byte *)uVar11 + 0x6)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- ((undefined1 *)uVar11)[0x6]
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(undefined1 *)((ushort *)uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- (undefined1)((ushort *)uVar11)[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(undefined1 *)(uVar11 + 0x3)
+ ((uw_object_hdr_t *)uVar11)->link_word_low
|
- (undefined1)uVar11[0x3]
+ ((uw_object_hdr_t *)uVar11)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_low
|
- &*(char *)((byte *)uVar11 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_low
|
- &((char *)uVar11)[0x6]
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_low
|
- &*(char *)((ushort *)uVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_low
|
- &*(char *)(uVar11 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_low = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_low = (byte)E;
|
- ((char *)uVar11)[0x6] = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_low = (byte)E;
|
- *(char *)((ushort *)uVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_low = (byte)E;
|
- *(char *)(uVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x6)
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(char *)((byte *)uVar11 + 0x6)
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
|
- ((char *)uVar11)[0x6]
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(char *)((ushort *)uVar11 + 0x3)
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
|
- (char)((ushort *)uVar11)[0x3]
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
|
- *(char *)(uVar11 + 0x3)
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
|
- (char)uVar11[0x3]
+ (char)((uw_object_hdr_t *)uVar11)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar11 + 0x7)
+ ((uw_object_hdr_t *)uVar11)->link_word_high
|
- *(byte *)((byte *)uVar11 + 0x7)
+ ((uw_object_hdr_t *)uVar11)->link_word_high
|
- ((byte *)uVar11)[0x7]
+ ((uw_object_hdr_t *)uVar11)->link_word_high
)
...>
}


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar11 + 0x7)
+ ((uw_object_hdr_t *)uVar11)->link_word_high
|
- *(undefined1 *)((byte *)uVar11 + 0x7)
+ ((uw_object_hdr_t *)uVar11)->link_word_high
|
- ((undefined1 *)uVar11)[0x7]
+ ((uw_object_hdr_t *)uVar11)->link_word_high
)
...>
}


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar11 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_high
|
- &*(char *)((byte *)uVar11 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_high
|
- &((char *)uVar11)[0x7]
+ (char *)&((uw_object_hdr_t *)uVar11)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_high = (byte)E;
|
- *(char *)((byte *)uVar11 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_high = (byte)E;
|
- ((char *)uVar11)[0x7] = E;
+ ((uw_object_hdr_t *)uVar11)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(begin_directional_move\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar11 + 0x7)
+ (char)((uw_object_hdr_t *)uVar11)->link_word_high
|
- *(char *)((byte *)uVar11 + 0x7)
+ (char)((uw_object_hdr_t *)uVar11)->link_word_high
|
- ((char *)uVar11)[0x7]
+ (char)((uw_object_hdr_t *)uVar11)->link_word_high
)
...>
}
