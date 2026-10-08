@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x0) = (char)V;
- *(char *)((char *)iVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x0) = (char)V;
- *(byte *)((char *)iVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x0) = (byte)V;
- *(char *)((char *)iVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x0) = (byte)V;
- *(byte *)((char *)iVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- ((short *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)((short *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((byte *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (byte)((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((undefined1 *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (undefined1)((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- ((char *)iVar1)[0x0] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)iVar1 = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)((byte *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((char *)iVar1)[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)((ushort *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (char)((ushort *)iVar1)[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)iVar1
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(byte *)((byte *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((byte *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(undefined1 *)((byte *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((undefined1 *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- ((char *)iVar1)[0x1] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(char *)((byte *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((char *)iVar1)[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x2) = (char)V;
- *(char *)((char *)iVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x2) = (char)V;
- *(byte *)((char *)iVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x2) = (byte)V;
- *(char *)((char *)iVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x2) = (byte)V;
- *(byte *)((char *)iVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- ((short *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)((short *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((byte *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- (byte)((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((undefined1 *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- (undefined1)((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- ((char *)iVar1)[0x2] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)((byte *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((char *)iVar1)[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)((ushort *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- (char)((ushort *)iVar1)[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(byte *)((byte *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((byte *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((undefined1 *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- ((char *)iVar1)[0x3] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(char *)((byte *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((char *)iVar1)[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x4) = (char)V;
- *(char *)((char *)iVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x4) = (char)V;
- *(byte *)((char *)iVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x4) = (byte)V;
- *(char *)((char *)iVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x4) = (byte)V;
- *(byte *)((char *)iVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- ((short *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)((short *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((byte *)iVar1)[0x4]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (byte)((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((undefined1 *)iVar1)[0x4]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (undefined1)((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- ((char *)iVar1)[0x4] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)((byte *)iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((char *)iVar1)[0x4]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)((ushort *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (char)((ushort *)iVar1)[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(byte *)((byte *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((byte *)iVar1)[0x5]
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((undefined1 *)iVar1)[0x5]
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- ((char *)iVar1)[0x5] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(char *)((byte *)iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((char *)iVar1)[0x5]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x6) = (char)V;
- *(char *)((char *)iVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x6) = (char)V;
- *(byte *)((char *)iVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x6) = (byte)V;
- *(char *)((char *)iVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x6) = (byte)V;
- *(byte *)((char *)iVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- ((short *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)((short *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((byte *)iVar1)[0x6]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- (byte)((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((undefined1 *)iVar1)[0x6]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- (undefined1)((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- ((char *)iVar1)[0x6] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)((byte *)iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((char *)iVar1)[0x6]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)((ushort *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- (char)((ushort *)iVar1)[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(byte *)((byte *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((byte *)iVar1)[0x7]
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((undefined1 *)iVar1)[0x7]
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- ((char *)iVar1)[0x7] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(set_custom_view_target\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(char *)((byte *)iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((char *)iVar1)[0x7]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}
