@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x0) = (char)V;
- *(char *)((char *)pp + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x0) = (char)V;
- *(byte *)((char *)pp + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x0) = (byte)V;
- *(char *)((char *)pp + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x0) = (byte)V;
- *(byte *)((char *)pp + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags
|
- *(ushort *)((byte *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags
|
- ((ushort *)pp)[0x0]
+ ((uw_object_hdr_t *)pp)->type_flags
|
- *(ushort *)((ushort *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_signed
|
- *(short *)((byte *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_signed
|
- ((short *)pp)[0x0]
+ ((uw_object_hdr_t *)pp)->type_flags_signed
|
- *(short *)((short *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- *(byte *)((byte *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- ((byte *)pp)[0x0]
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- *(byte *)((ushort *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- (byte)((ushort *)pp)[0x0]
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- *(byte *)pp
+ ((uw_object_hdr_t *)pp)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- *(undefined1 *)((byte *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- ((undefined1 *)pp)[0x0]
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- *(undefined1 *)((ushort *)pp + 0x0)
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- (undefined1)((ushort *)pp)[0x0]
+ ((uw_object_hdr_t *)pp)->type_flags_low
|
- *(undefined1 *)pp
+ ((uw_object_hdr_t *)pp)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x0) = E;
+ ((uw_object_hdr_t *)pp)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pp + 0x0) = E;
+ ((uw_object_hdr_t *)pp)->type_flags_low = (byte)E;
|
- ((char *)pp)[0x0] = E;
+ ((uw_object_hdr_t *)pp)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pp + 0x0) = E;
+ ((uw_object_hdr_t *)pp)->type_flags_low = (byte)E;
|
- *(char *)pp = E;
+ ((uw_object_hdr_t *)pp)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x0)
+ (char)((uw_object_hdr_t *)pp)->type_flags_low
|
- *(char *)((byte *)pp + 0x0)
+ (char)((uw_object_hdr_t *)pp)->type_flags_low
|
- ((char *)pp)[0x0]
+ (char)((uw_object_hdr_t *)pp)->type_flags_low
|
- *(char *)((ushort *)pp + 0x0)
+ (char)((uw_object_hdr_t *)pp)->type_flags_low
|
- (char)((ushort *)pp)[0x0]
+ (char)((uw_object_hdr_t *)pp)->type_flags_low
|
- *(char *)pp
+ (char)((uw_object_hdr_t *)pp)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->type_flags_high
|
- *(byte *)((byte *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->type_flags_high
|
- ((byte *)pp)[0x1]
+ ((uw_object_hdr_t *)pp)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->type_flags_high
|
- *(undefined1 *)((byte *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->type_flags_high
|
- ((undefined1 *)pp)[0x1]
+ ((uw_object_hdr_t *)pp)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x1) = E;
+ ((uw_object_hdr_t *)pp)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pp + 0x1) = E;
+ ((uw_object_hdr_t *)pp)->type_flags_high = (byte)E;
|
- ((char *)pp)[0x1] = E;
+ ((uw_object_hdr_t *)pp)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x1)
+ (char)((uw_object_hdr_t *)pp)->type_flags_high
|
- *(char *)((byte *)pp + 0x1)
+ (char)((uw_object_hdr_t *)pp)->type_flags_high
|
- ((char *)pp)[0x1]
+ (char)((uw_object_hdr_t *)pp)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x2) = (char)V;
- *(char *)((char *)pp + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x2) = (char)V;
- *(byte *)((char *)pp + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x2) = (byte)V;
- *(char *)((char *)pp + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x2) = (byte)V;
- *(byte *)((char *)pp + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word
|
- *(ushort *)((byte *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word
|
- ((ushort *)pp)[0x1]
+ ((uw_object_hdr_t *)pp)->position_word
|
- *(ushort *)((ushort *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word_signed
|
- *(short *)((byte *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word_signed
|
- ((short *)pp)[0x1]
+ ((uw_object_hdr_t *)pp)->position_word_signed
|
- *(short *)((short *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- *(byte *)((byte *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- ((byte *)pp)[0x2]
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- *(byte *)((ushort *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- (byte)((ushort *)pp)[0x1]
+ ((uw_object_hdr_t *)pp)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- *(undefined1 *)((byte *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- ((undefined1 *)pp)[0x2]
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- *(undefined1 *)((ushort *)pp + 0x1)
+ ((uw_object_hdr_t *)pp)->position_word_low
|
- (undefined1)((ushort *)pp)[0x1]
+ ((uw_object_hdr_t *)pp)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x2) = E;
+ ((uw_object_hdr_t *)pp)->position_word_low = (byte)E;
|
- *(char *)((byte *)pp + 0x2) = E;
+ ((uw_object_hdr_t *)pp)->position_word_low = (byte)E;
|
- ((char *)pp)[0x2] = E;
+ ((uw_object_hdr_t *)pp)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pp + 0x1) = E;
+ ((uw_object_hdr_t *)pp)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x2)
+ (char)((uw_object_hdr_t *)pp)->position_word_low
|
- *(char *)((byte *)pp + 0x2)
+ (char)((uw_object_hdr_t *)pp)->position_word_low
|
- ((char *)pp)[0x2]
+ (char)((uw_object_hdr_t *)pp)->position_word_low
|
- *(char *)((ushort *)pp + 0x1)
+ (char)((uw_object_hdr_t *)pp)->position_word_low
|
- (char)((ushort *)pp)[0x1]
+ (char)((uw_object_hdr_t *)pp)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->position_word_high
|
- *(byte *)((byte *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->position_word_high
|
- ((byte *)pp)[0x3]
+ ((uw_object_hdr_t *)pp)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->position_word_high
|
- *(undefined1 *)((byte *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->position_word_high
|
- ((undefined1 *)pp)[0x3]
+ ((uw_object_hdr_t *)pp)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x3) = E;
+ ((uw_object_hdr_t *)pp)->position_word_high = (byte)E;
|
- *(char *)((byte *)pp + 0x3) = E;
+ ((uw_object_hdr_t *)pp)->position_word_high = (byte)E;
|
- ((char *)pp)[0x3] = E;
+ ((uw_object_hdr_t *)pp)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x3)
+ (char)((uw_object_hdr_t *)pp)->position_word_high
|
- *(char *)((byte *)pp + 0x3)
+ (char)((uw_object_hdr_t *)pp)->position_word_high
|
- ((char *)pp)[0x3]
+ (char)((uw_object_hdr_t *)pp)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x4) = (char)V;
- *(char *)((char *)pp + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x4) = (char)V;
- *(byte *)((char *)pp + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x4) = (byte)V;
- *(char *)((char *)pp + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x4) = (byte)V;
- *(byte *)((char *)pp + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word
|
- *(ushort *)((byte *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word
|
- ((ushort *)pp)[0x2]
+ ((uw_object_hdr_t *)pp)->chain_word
|
- *(ushort *)((ushort *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word_signed
|
- *(short *)((byte *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word_signed
|
- ((short *)pp)[0x2]
+ ((uw_object_hdr_t *)pp)->chain_word_signed
|
- *(short *)((short *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- *(byte *)((byte *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- ((byte *)pp)[0x4]
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- *(byte *)((ushort *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- (byte)((ushort *)pp)[0x2]
+ ((uw_object_hdr_t *)pp)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- *(undefined1 *)((byte *)pp + 0x4)
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- ((undefined1 *)pp)[0x4]
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- *(undefined1 *)((ushort *)pp + 0x2)
+ ((uw_object_hdr_t *)pp)->chain_word_low
|
- (undefined1)((ushort *)pp)[0x2]
+ ((uw_object_hdr_t *)pp)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x4) = E;
+ ((uw_object_hdr_t *)pp)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pp + 0x4) = E;
+ ((uw_object_hdr_t *)pp)->chain_word_low = (byte)E;
|
- ((char *)pp)[0x4] = E;
+ ((uw_object_hdr_t *)pp)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pp + 0x2) = E;
+ ((uw_object_hdr_t *)pp)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x4)
+ (char)((uw_object_hdr_t *)pp)->chain_word_low
|
- *(char *)((byte *)pp + 0x4)
+ (char)((uw_object_hdr_t *)pp)->chain_word_low
|
- ((char *)pp)[0x4]
+ (char)((uw_object_hdr_t *)pp)->chain_word_low
|
- *(char *)((ushort *)pp + 0x2)
+ (char)((uw_object_hdr_t *)pp)->chain_word_low
|
- (char)((ushort *)pp)[0x2]
+ (char)((uw_object_hdr_t *)pp)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x5)
+ ((uw_object_hdr_t *)pp)->chain_word_high
|
- *(byte *)((byte *)pp + 0x5)
+ ((uw_object_hdr_t *)pp)->chain_word_high
|
- ((byte *)pp)[0x5]
+ ((uw_object_hdr_t *)pp)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x5)
+ ((uw_object_hdr_t *)pp)->chain_word_high
|
- *(undefined1 *)((byte *)pp + 0x5)
+ ((uw_object_hdr_t *)pp)->chain_word_high
|
- ((undefined1 *)pp)[0x5]
+ ((uw_object_hdr_t *)pp)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x5) = E;
+ ((uw_object_hdr_t *)pp)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pp + 0x5) = E;
+ ((uw_object_hdr_t *)pp)->chain_word_high = (byte)E;
|
- ((char *)pp)[0x5] = E;
+ ((uw_object_hdr_t *)pp)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x5)
+ (char)((uw_object_hdr_t *)pp)->chain_word_high
|
- *(char *)((byte *)pp + 0x5)
+ (char)((uw_object_hdr_t *)pp)->chain_word_high
|
- ((char *)pp)[0x5]
+ (char)((uw_object_hdr_t *)pp)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x6) = (char)V;
- *(char *)((char *)pp + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pp + 0x6) = (char)V;
- *(byte *)((char *)pp + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x6) = (byte)V;
- *(char *)((char *)pp + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pp + 0x6) = (byte)V;
- *(byte *)((char *)pp + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word
|
- *(ushort *)((byte *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word
|
- ((ushort *)pp)[0x3]
+ ((uw_object_hdr_t *)pp)->link_word
|
- *(ushort *)((ushort *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word_signed
|
- *(short *)((byte *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word_signed
|
- ((short *)pp)[0x3]
+ ((uw_object_hdr_t *)pp)->link_word_signed
|
- *(short *)((short *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- *(byte *)((byte *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- ((byte *)pp)[0x6]
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- *(byte *)((ushort *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- (byte)((ushort *)pp)[0x3]
+ ((uw_object_hdr_t *)pp)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- *(undefined1 *)((byte *)pp + 0x6)
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- ((undefined1 *)pp)[0x6]
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- *(undefined1 *)((ushort *)pp + 0x3)
+ ((uw_object_hdr_t *)pp)->link_word_low
|
- (undefined1)((ushort *)pp)[0x3]
+ ((uw_object_hdr_t *)pp)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x6) = E;
+ ((uw_object_hdr_t *)pp)->link_word_low = (byte)E;
|
- *(char *)((byte *)pp + 0x6) = E;
+ ((uw_object_hdr_t *)pp)->link_word_low = (byte)E;
|
- ((char *)pp)[0x6] = E;
+ ((uw_object_hdr_t *)pp)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pp + 0x3) = E;
+ ((uw_object_hdr_t *)pp)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x6)
+ (char)((uw_object_hdr_t *)pp)->link_word_low
|
- *(char *)((byte *)pp + 0x6)
+ (char)((uw_object_hdr_t *)pp)->link_word_low
|
- ((char *)pp)[0x6]
+ (char)((uw_object_hdr_t *)pp)->link_word_low
|
- *(char *)((ushort *)pp + 0x3)
+ (char)((uw_object_hdr_t *)pp)->link_word_low
|
- (char)((ushort *)pp)[0x3]
+ (char)((uw_object_hdr_t *)pp)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pp + 0x7)
+ ((uw_object_hdr_t *)pp)->link_word_high
|
- *(byte *)((byte *)pp + 0x7)
+ ((uw_object_hdr_t *)pp)->link_word_high
|
- ((byte *)pp)[0x7]
+ ((uw_object_hdr_t *)pp)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pp + 0x7)
+ ((uw_object_hdr_t *)pp)->link_word_high
|
- *(undefined1 *)((byte *)pp + 0x7)
+ ((uw_object_hdr_t *)pp)->link_word_high
|
- ((undefined1 *)pp)[0x7]
+ ((uw_object_hdr_t *)pp)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x7) = E;
+ ((uw_object_hdr_t *)pp)->link_word_high = (byte)E;
|
- *(char *)((byte *)pp + 0x7) = E;
+ ((uw_object_hdr_t *)pp)->link_word_high = (byte)E;
|
- ((char *)pp)[0x7] = E;
+ ((uw_object_hdr_t *)pp)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(automap_reveal_byte\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pp + 0x7)
+ (char)((uw_object_hdr_t *)pp)->link_word_high
|
- *(char *)((byte *)pp + 0x7)
+ (char)((uw_object_hdr_t *)pp)->link_word_high
|
- ((char *)pp)[0x7]
+ (char)((uw_object_hdr_t *)pp)->link_word_high
)
...>
}
