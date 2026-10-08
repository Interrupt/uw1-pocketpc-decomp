@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x0) = (char)V;
- *(char *)((char *)pbVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x0) = (char)V;
- *(byte *)((char *)pbVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x0) = (byte)V;
- *(char *)((char *)pbVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(ushort *)((byte *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- ((ushort *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(ushort *)((ushort *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_signed
|
- *(short *)((byte *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_signed
|
- ((short *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_signed
|
- *(short *)((short *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(byte *)((byte *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- ((byte *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(byte *)((ushort *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- (byte)((ushort *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(byte *)pbVar1
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- ((undefined1 *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar1 + 0x0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- (undefined1)((ushort *)pbVar1)[0x0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(undefined1 *)pbVar1
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low = (byte)E;
|
- ((char *)pbVar1)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low = (byte)E;
|
- *(char *)pbVar1 = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(char *)((byte *)pbVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- ((char *)pbVar1)[0x0]
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(char *)((ushort *)pbVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- (char)((ushort *)pbVar1)[0x0]
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
|
- *(char *)pbVar1
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- *(byte *)((byte *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- ((byte *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- ((undefined1 *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high = (byte)E;
|
- ((char *)pbVar1)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- *(char *)((byte *)pbVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_high
|
- ((char *)pbVar1)[0x1]
+ (char)((uw_object_hdr_t *)pbVar1)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x2) = (char)V;
- *(char *)((char *)pbVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x2) = (char)V;
- *(byte *)((char *)pbVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x2) = (byte)V;
- *(char *)((char *)pbVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- *(ushort *)((byte *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- ((ushort *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- *(ushort *)((ushort *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_signed
|
- *(short *)((byte *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_signed
|
- ((short *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->position_word_signed
|
- *(short *)((short *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- *(byte *)((byte *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- ((byte *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- *(byte *)((ushort *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- (byte)((ushort *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- *(undefined1 *)((byte *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- ((undefined1 *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar1 + 0x1)
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
|
- (undefined1)((ushort *)pbVar1)[0x1]
+ ((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_low = (byte)E;
|
- ((char *)pbVar1)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_low
|
- *(char *)((byte *)pbVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_low
|
- ((char *)pbVar1)[0x2]
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_low
|
- *(char *)((ushort *)pbVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_low
|
- (char)((ushort *)pbVar1)[0x1]
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
|
- *(byte *)((byte *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
|
- ((byte *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
|
- *(undefined1 *)((byte *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
|
- ((undefined1 *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_high = (byte)E;
|
- ((char *)pbVar1)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_high
|
- *(char *)((byte *)pbVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_high
|
- ((char *)pbVar1)[0x3]
+ (char)((uw_object_hdr_t *)pbVar1)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x4) = (char)V;
- *(char *)((char *)pbVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x4) = (char)V;
- *(byte *)((char *)pbVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x4) = (byte)V;
- *(char *)((char *)pbVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- *(ushort *)((byte *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- ((ushort *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- *(ushort *)((ushort *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_signed
|
- *(short *)((byte *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_signed
|
- ((short *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_signed
|
- *(short *)((short *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- *(byte *)((byte *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- ((byte *)pbVar1)[0x4]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- *(byte *)((ushort *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- (byte)((ushort *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar1 + 0x4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- ((undefined1 *)pbVar1)[0x4]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar1 + 0x2)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- (undefined1)((ushort *)pbVar1)[0x2]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low = (byte)E;
|
- ((char *)pbVar1)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- *(char *)((byte *)pbVar1 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- ((char *)pbVar1)[0x4]
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- *(char *)((ushort *)pbVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_low
|
- (char)((ushort *)pbVar1)[0x2]
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x5)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- *(byte *)((byte *)pbVar1 + 0x5)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- ((byte *)pbVar1)[0x5]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x5)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar1 + 0x5)
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- ((undefined1 *)pbVar1)[0x5]
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high = (byte)E;
|
- ((char *)pbVar1)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- *(char *)((byte *)pbVar1 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_high
|
- ((char *)pbVar1)[0x5]
+ (char)((uw_object_hdr_t *)pbVar1)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x6) = (char)V;
- *(char *)((char *)pbVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar1 + 0x6) = (char)V;
- *(byte *)((char *)pbVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x6) = (byte)V;
- *(char *)((char *)pbVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar1 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar1)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- *(ushort *)((byte *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- ((ushort *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- *(ushort *)((ushort *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_signed
|
- *(short *)((byte *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_signed
|
- ((short *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->link_word_signed
|
- *(short *)((short *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- *(byte *)((byte *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- ((byte *)pbVar1)[0x6]
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- *(byte *)((ushort *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- (byte)((ushort *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- *(undefined1 *)((byte *)pbVar1 + 0x6)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- ((undefined1 *)pbVar1)[0x6]
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar1 + 0x3)
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
|
- (undefined1)((ushort *)pbVar1)[0x3]
+ ((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_low = (byte)E;
|
- ((char *)pbVar1)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_low
|
- *(char *)((byte *)pbVar1 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_low
|
- ((char *)pbVar1)[0x6]
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_low
|
- *(char *)((ushort *)pbVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_low
|
- (char)((ushort *)pbVar1)[0x3]
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar1 + 0x7)
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
|
- *(byte *)((byte *)pbVar1 + 0x7)
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
|
- ((byte *)pbVar1)[0x7]
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar1 + 0x7)
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
|
- *(undefined1 *)((byte *)pbVar1 + 0x7)
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
|
- ((undefined1 *)pbVar1)[0x7]
+ ((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_high = (byte)E;
|
- ((char *)pbVar1)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar1 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_high
|
- *(char *)((byte *)pbVar1 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_high
|
- ((char *)pbVar1)[0x7]
+ (char)((uw_object_hdr_t *)pbVar1)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x0) = (char)V;
- *(char *)((char *)pbVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x0) = (char)V;
- *(byte *)((char *)pbVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x0) = (byte)V;
- *(char *)((char *)pbVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- ((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- ((short *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)((short *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((byte *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (byte)((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((undefined1 *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (undefined1)((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- ((char *)pbVar3)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)pbVar3 = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)((byte *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((char *)pbVar3)[0x0]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)((ushort *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (char)((ushort *)pbVar3)[0x0]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)pbVar3
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(byte *)((byte *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((byte *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((undefined1 *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- ((char *)pbVar3)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(char *)((byte *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((char *)pbVar3)[0x1]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x2) = (char)V;
- *(char *)((char *)pbVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x2) = (char)V;
- *(byte *)((char *)pbVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x2) = (byte)V;
- *(char *)((char *)pbVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- ((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word
)
...>
}


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- ((short *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)((short *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
)
...>
}


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((byte *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (byte)((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((undefined1 *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (undefined1)((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- ((char *)pbVar3)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)((byte *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((char *)pbVar3)[0x2]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)((ushort *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (char)((ushort *)pbVar3)[0x1]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(byte *)((byte *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((byte *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((undefined1 *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- ((char *)pbVar3)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(char *)((byte *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((char *)pbVar3)[0x3]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x4) = (char)V;
- *(char *)((char *)pbVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x4) = (char)V;
- *(byte *)((char *)pbVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x4) = (byte)V;
- *(char *)((char *)pbVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- ((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
)
...>
}


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- ((short *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)((short *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
)
...>
}


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((byte *)pbVar3)[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (byte)((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((undefined1 *)pbVar3)[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (undefined1)((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- ((char *)pbVar3)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)((byte *)pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((char *)pbVar3)[0x4]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)((ushort *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (char)((ushort *)pbVar3)[0x2]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(byte *)((byte *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((byte *)pbVar3)[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((undefined1 *)pbVar3)[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- ((char *)pbVar3)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(char *)((byte *)pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((char *)pbVar3)[0x5]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x6) = (char)V;
- *(char *)((char *)pbVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x6) = (char)V;
- *(byte *)((char *)pbVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x6) = (byte)V;
- *(char *)((char *)pbVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- ((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word
)
...>
}


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- ((short *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)((short *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
)
...>
}


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((byte *)pbVar3)[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (byte)((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((undefined1 *)pbVar3)[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (undefined1)((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- ((char *)pbVar3)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)((byte *)pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((char *)pbVar3)[0x6]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)((ushort *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (char)((ushort *)pbVar3)[0x3]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(byte *)((byte *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((byte *)pbVar3)[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((undefined1 *)pbVar3)[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- ((char *)pbVar3)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(char *)((byte *)pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((char *)pbVar3)[0x7]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x0) = (char)V;
- *(char *)((char *)pbVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x0) = (char)V;
- *(byte *)((char *)pbVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x0) = (byte)V;
- *(char *)((char *)pbVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags
|
- *(ushort *)((byte *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags
|
- ((ushort *)pbVar7)[0x0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags
|
- *(ushort *)((ushort *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_signed
|
- *(short *)((byte *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_signed
|
- ((short *)pbVar7)[0x0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_signed
|
- *(short *)((short *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(byte *)((byte *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- ((byte *)pbVar7)[0x0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(byte *)((ushort *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- (byte)((ushort *)pbVar7)[0x0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(byte *)pbVar7
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- ((undefined1 *)pbVar7)[0x0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar7 + 0x0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- (undefined1)((ushort *)pbVar7)[0x0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(undefined1 *)pbVar7
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low = (byte)E;
|
- ((char *)pbVar7)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low = (byte)E;
|
- *(char *)pbVar7 = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(char *)((byte *)pbVar7 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- ((char *)pbVar7)[0x0]
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(char *)((ushort *)pbVar7 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- (char)((ushort *)pbVar7)[0x0]
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_low
|
- *(char *)pbVar7
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high
|
- *(byte *)((byte *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high
|
- ((byte *)pbVar7)[0x1]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high
|
- ((undefined1 *)pbVar7)[0x1]
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high = (byte)E;
|
- ((char *)pbVar7)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar7)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_high
|
- *(char *)((byte *)pbVar7 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_high
|
- ((char *)pbVar7)[0x1]
+ (char)((uw_object_hdr_t *)pbVar7)->type_flags_high
)
...>
}


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x2) = (char)V;
- *(char *)((char *)pbVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x2) = (char)V;
- *(byte *)((char *)pbVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x2) = (byte)V;
- *(char *)((char *)pbVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word
|
- *(ushort *)((byte *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word
|
- ((ushort *)pbVar7)[0x1]
+ ((uw_object_hdr_t *)pbVar7)->position_word
|
- *(ushort *)((ushort *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->position_word
)
...>
}


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word_signed
|
- *(short *)((byte *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word_signed
|
- ((short *)pbVar7)[0x1]
+ ((uw_object_hdr_t *)pbVar7)->position_word_signed
|
- *(short *)((short *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->position_word_signed
)
...>
}


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- *(byte *)((byte *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- ((byte *)pbVar7)[0x2]
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- *(byte *)((ushort *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- (byte)((ushort *)pbVar7)[0x1]
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
)
...>
}


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- *(undefined1 *)((byte *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- ((undefined1 *)pbVar7)[0x2]
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar7 + 0x1)
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
|
- (undefined1)((ushort *)pbVar7)[0x1]
+ ((uw_object_hdr_t *)pbVar7)->position_word_low
)
...>
}


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_low = (byte)E;
|
- ((char *)pbVar7)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_low
|
- *(char *)((byte *)pbVar7 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_low
|
- ((char *)pbVar7)[0x2]
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_low
|
- *(char *)((ushort *)pbVar7 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_low
|
- (char)((ushort *)pbVar7)[0x1]
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_low
)
...>
}


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->position_word_high
|
- *(byte *)((byte *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->position_word_high
|
- ((byte *)pbVar7)[0x3]
+ ((uw_object_hdr_t *)pbVar7)->position_word_high
)
...>
}


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->position_word_high
|
- *(undefined1 *)((byte *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->position_word_high
|
- ((undefined1 *)pbVar7)[0x3]
+ ((uw_object_hdr_t *)pbVar7)->position_word_high
)
...>
}


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_high = (byte)E;
|
- ((char *)pbVar7)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar7)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_high
|
- *(char *)((byte *)pbVar7 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_high
|
- ((char *)pbVar7)[0x3]
+ (char)((uw_object_hdr_t *)pbVar7)->position_word_high
)
...>
}


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x4) = (char)V;
- *(char *)((char *)pbVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x4) = (char)V;
- *(byte *)((char *)pbVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x4) = (byte)V;
- *(char *)((char *)pbVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word
|
- *(ushort *)((byte *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word
|
- ((ushort *)pbVar7)[0x2]
+ ((uw_object_hdr_t *)pbVar7)->chain_word
|
- *(ushort *)((ushort *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->chain_word
)
...>
}


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_signed
|
- *(short *)((byte *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_signed
|
- ((short *)pbVar7)[0x2]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_signed
|
- *(short *)((short *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_signed
)
...>
}


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- *(byte *)((byte *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- ((byte *)pbVar7)[0x4]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- *(byte *)((ushort *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- (byte)((ushort *)pbVar7)[0x2]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
)
...>
}


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar7 + 0x4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- ((undefined1 *)pbVar7)[0x4]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar7 + 0x2)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- (undefined1)((ushort *)pbVar7)[0x2]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low
)
...>
}


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low = (byte)E;
|
- ((char *)pbVar7)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- *(char *)((byte *)pbVar7 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- ((char *)pbVar7)[0x4]
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- *(char *)((ushort *)pbVar7 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_low
|
- (char)((ushort *)pbVar7)[0x2]
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_low
)
...>
}


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x5)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high
|
- *(byte *)((byte *)pbVar7 + 0x5)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high
|
- ((byte *)pbVar7)[0x5]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high
)
...>
}


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x5)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar7 + 0x5)
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high
|
- ((undefined1 *)pbVar7)[0x5]
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high
)
...>
}


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high = (byte)E;
|
- ((char *)pbVar7)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar7)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_high
|
- *(char *)((byte *)pbVar7 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_high
|
- ((char *)pbVar7)[0x5]
+ (char)((uw_object_hdr_t *)pbVar7)->chain_word_high
)
...>
}


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x6) = (char)V;
- *(char *)((char *)pbVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar7 + 0x6) = (char)V;
- *(byte *)((char *)pbVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x6) = (byte)V;
- *(char *)((char *)pbVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar7 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar7)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word
|
- *(ushort *)((byte *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word
|
- ((ushort *)pbVar7)[0x3]
+ ((uw_object_hdr_t *)pbVar7)->link_word
|
- *(ushort *)((ushort *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->link_word
)
...>
}


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word_signed
|
- *(short *)((byte *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word_signed
|
- ((short *)pbVar7)[0x3]
+ ((uw_object_hdr_t *)pbVar7)->link_word_signed
|
- *(short *)((short *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->link_word_signed
)
...>
}


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- *(byte *)((byte *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- ((byte *)pbVar7)[0x6]
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- *(byte *)((ushort *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- (byte)((ushort *)pbVar7)[0x3]
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
)
...>
}


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- *(undefined1 *)((byte *)pbVar7 + 0x6)
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- ((undefined1 *)pbVar7)[0x6]
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar7 + 0x3)
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
|
- (undefined1)((ushort *)pbVar7)[0x3]
+ ((uw_object_hdr_t *)pbVar7)->link_word_low
)
...>
}


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_low = (byte)E;
|
- ((char *)pbVar7)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_low
|
- *(char *)((byte *)pbVar7 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_low
|
- ((char *)pbVar7)[0x6]
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_low
|
- *(char *)((ushort *)pbVar7 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_low
|
- (char)((ushort *)pbVar7)[0x3]
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_low
)
...>
}


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar7 + 0x7)
+ ((uw_object_hdr_t *)pbVar7)->link_word_high
|
- *(byte *)((byte *)pbVar7 + 0x7)
+ ((uw_object_hdr_t *)pbVar7)->link_word_high
|
- ((byte *)pbVar7)[0x7]
+ ((uw_object_hdr_t *)pbVar7)->link_word_high
)
...>
}


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar7 + 0x7)
+ ((uw_object_hdr_t *)pbVar7)->link_word_high
|
- *(undefined1 *)((byte *)pbVar7 + 0x7)
+ ((uw_object_hdr_t *)pbVar7)->link_word_high
|
- ((undefined1 *)pbVar7)[0x7]
+ ((uw_object_hdr_t *)pbVar7)->link_word_high
)
...>
}


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_high = (byte)E;
|
- ((char *)pbVar7)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar7)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar7 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_high
|
- *(char *)((byte *)pbVar7 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_high
|
- ((char *)pbVar7)[0x7]
+ (char)((uw_object_hdr_t *)pbVar7)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x0) = (char)V;
- *(char *)((char *)pbVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x0) = (char)V;
- *(byte *)((char *)pbVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x0) = (byte)V;
- *(char *)((char *)pbVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- ((short *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)((short *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((byte *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (byte)((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((undefined1 *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (undefined1)((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- ((char *)pbVar4)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)pbVar4 = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)((byte *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((char *)pbVar4)[0x0]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)((ushort *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (char)((ushort *)pbVar4)[0x0]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)pbVar4
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(byte *)((byte *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((byte *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((undefined1 *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- ((char *)pbVar4)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(char *)((byte *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((char *)pbVar4)[0x1]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x2) = (char)V;
- *(char *)((char *)pbVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x2) = (char)V;
- *(byte *)((char *)pbVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x2) = (byte)V;
- *(char *)((char *)pbVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- ((short *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)((short *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((byte *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (byte)((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((undefined1 *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (undefined1)((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- ((char *)pbVar4)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)((byte *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((char *)pbVar4)[0x2]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)((ushort *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (char)((ushort *)pbVar4)[0x1]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(byte *)((byte *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((byte *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((undefined1 *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- ((char *)pbVar4)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(char *)((byte *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((char *)pbVar4)[0x3]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x4) = (char)V;
- *(char *)((char *)pbVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x4) = (char)V;
- *(byte *)((char *)pbVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x4) = (byte)V;
- *(char *)((char *)pbVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- ((short *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)((short *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((byte *)pbVar4)[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (byte)((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((undefined1 *)pbVar4)[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (undefined1)((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- ((char *)pbVar4)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)((byte *)pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((char *)pbVar4)[0x4]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)((ushort *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (char)((ushort *)pbVar4)[0x2]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(byte *)((byte *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((byte *)pbVar4)[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((undefined1 *)pbVar4)[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- ((char *)pbVar4)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(char *)((byte *)pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((char *)pbVar4)[0x5]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x6) = (char)V;
- *(char *)((char *)pbVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x6) = (char)V;
- *(byte *)((char *)pbVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x6) = (byte)V;
- *(char *)((char *)pbVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- ((short *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)((short *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((byte *)pbVar4)[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (byte)((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((undefined1 *)pbVar4)[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (undefined1)((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- ((char *)pbVar4)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)((byte *)pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((char *)pbVar4)[0x6]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)((ushort *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (char)((ushort *)pbVar4)[0x3]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(byte *)((byte *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((byte *)pbVar4)[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((undefined1 *)pbVar4)[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- ((char *)pbVar4)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(char *)((byte *)pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((char *)pbVar4)[0x7]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x0) = (char)V;
- *(char *)((char *)iVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x0) = (char)V;
- *(byte *)((char *)iVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x0) = (byte)V;
- *(char *)((char *)iVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x0) = (byte)V;
- *(byte *)((char *)iVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- ((ushort *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)((ushort *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
|
- *(short *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
|
- ((short *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
|
- *(short *)((short *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(byte *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- ((byte *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(byte *)((ushort *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- (byte)((ushort *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(byte *)iVar3
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(undefined1 *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- ((undefined1 *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- (undefined1)((ushort *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(undefined1 *)iVar3
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- ((char *)iVar3)[0x0] = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *(char *)iVar3 = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(char *)((byte *)iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- ((char *)iVar3)[0x0]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(char *)((ushort *)iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- (char)((ushort *)iVar3)[0x0]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(char *)iVar3
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- *(byte *)((byte *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- ((byte *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- *(undefined1 *)((byte *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- ((undefined1 *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
|
- ((char *)iVar3)[0x1] = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
|
- *(char *)((byte *)iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
|
- ((char *)iVar3)[0x1]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x2) = (char)V;
- *(char *)((char *)iVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x2) = (char)V;
- *(byte *)((char *)iVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x2) = (byte)V;
- *(char *)((char *)iVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x2) = (byte)V;
- *(byte *)((char *)iVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(ushort *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- ((ushort *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(ushort *)((ushort *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
|
- *(short *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
|
- ((short *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
|
- *(short *)((short *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
)
...>
}


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(byte *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- ((byte *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(byte *)((ushort *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- (byte)((ushort *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(undefined1 *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- ((undefined1 *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- (undefined1)((ushort *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- ((char *)iVar3)[0x2] = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(char *)((byte *)iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- ((char *)iVar3)[0x2]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(char *)((ushort *)iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- (char)((ushort *)iVar3)[0x1]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- *(byte *)((byte *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- ((byte *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- *(undefined1 *)((byte *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- ((undefined1 *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
|
- ((char *)iVar3)[0x3] = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
|
- *(char *)((byte *)iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
|
- ((char *)iVar3)[0x3]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x4) = (char)V;
- *(char *)((char *)iVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x4) = (char)V;
- *(byte *)((char *)iVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x4) = (byte)V;
- *(char *)((char *)iVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x4) = (byte)V;
- *(byte *)((char *)iVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(ushort *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- ((ushort *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(ushort *)((ushort *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
|
- *(short *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
|
- ((short *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
|
- *(short *)((short *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
)
...>
}


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(byte *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- ((byte *)iVar3)[0x4]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(byte *)((ushort *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- (byte)((ushort *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(undefined1 *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- ((undefined1 *)iVar3)[0x4]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- (undefined1)((ushort *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- ((char *)iVar3)[0x4] = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x4)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(char *)((byte *)iVar3 + 0x4)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- ((char *)iVar3)[0x4]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(char *)((ushort *)iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- (char)((ushort *)iVar3)[0x2]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- *(byte *)((byte *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- ((byte *)iVar3)[0x5]
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- *(undefined1 *)((byte *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- ((undefined1 *)iVar3)[0x5]
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
|
- ((char *)iVar3)[0x5] = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x5)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
|
- *(char *)((byte *)iVar3 + 0x5)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
|
- ((char *)iVar3)[0x5]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x6) = (char)V;
- *(char *)((char *)iVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x6) = (char)V;
- *(byte *)((char *)iVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x6) = (byte)V;
- *(char *)((char *)iVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x6) = (byte)V;
- *(byte *)((char *)iVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(ushort *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- ((ushort *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(ushort *)((ushort *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
|
- *(short *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
|
- ((short *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
|
- *(short *)((short *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
)
...>
}


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(byte *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- ((byte *)iVar3)[0x6]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(byte *)((ushort *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- (byte)((ushort *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(undefined1 *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- ((undefined1 *)iVar3)[0x6]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- (undefined1)((ushort *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- ((char *)iVar3)[0x6] = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x6)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(char *)((byte *)iVar3 + 0x6)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- ((char *)iVar3)[0x6]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(char *)((ushort *)iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- (char)((ushort *)iVar3)[0x3]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- *(byte *)((byte *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- ((byte *)iVar3)[0x7]
+ ((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- *(undefined1 *)((byte *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- ((undefined1 *)iVar3)[0x7]
+ ((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
|
- ((char *)iVar3)[0x7] = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x7)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
|
- *(char *)((byte *)iVar3 + 0x7)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
|
- ((char *)iVar3)[0x7]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x0) = (char)V;
- *(char *)((char *)puVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x0) = (char)V;
- *(byte *)((char *)puVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x0) = (byte)V;
- *(char *)((char *)puVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x0) = (byte)V;
- *(byte *)((char *)puVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(ushort *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- ((ushort *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(ushort *)((ushort *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
|
- *(short *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
|
- ((short *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
|
- *(short *)((short *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(byte *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- ((byte *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(byte *)((ushort *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- (byte)((ushort *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(byte *)puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(undefined1 *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- ((undefined1 *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- (undefined1)((ushort *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(undefined1 *)puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- ((char *)puVar1)[0x0] = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- *(char *)puVar1 = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(char *)((byte *)puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- ((char *)puVar1)[0x0]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(char *)((ushort *)puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- (char)((ushort *)puVar1)[0x0]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(char *)puVar1
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- *(byte *)((byte *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- ((byte *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- *(undefined1 *)((byte *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- ((undefined1 *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
|
- ((char *)puVar1)[0x1] = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
|
- *(char *)((byte *)puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
|
- ((char *)puVar1)[0x1]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_5_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x2) = (char)V;
- *(char *)((char *)puVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x2) = (char)V;
- *(byte *)((char *)puVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x2) = (byte)V;
- *(char *)((char *)puVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x2) = (byte)V;
- *(byte *)((char *)puVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_word_ushort@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(ushort *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- ((ushort *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(ushort *)((ushort *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_5_w_2_14_word_short@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
|
- *(short *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
|
- ((short *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
|
- *(short *)((short *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
)
...>
}


@receiver_5_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(byte *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- ((byte *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(byte *)((ushort *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- (byte)((ushort *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_5_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(undefined1 *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- ((undefined1 *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- (undefined1)((ushort *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_5_w_2_14_store_2@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
|
- ((char *)puVar1)[0x2] = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(char *)((byte *)puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- ((char *)puVar1)[0x2]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(char *)((ushort *)puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- (char)((ushort *)puVar1)[0x1]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_5_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- *(byte *)((byte *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- ((byte *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_5_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- *(undefined1 *)((byte *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- ((undefined1 *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_5_w_2_14_store_3@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
|
- ((char *)puVar1)[0x3] = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
|
- *(char *)((byte *)puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
|
- ((char *)puVar1)[0x3]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_5_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x4) = (char)V;
- *(char *)((char *)puVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x4) = (char)V;
- *(byte *)((char *)puVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x4) = (byte)V;
- *(char *)((char *)puVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x4) = (byte)V;
- *(byte *)((char *)puVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_word_ushort@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(ushort *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- ((ushort *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(ushort *)((ushort *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_5_w_4_28_word_short@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
|
- *(short *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
|
- ((short *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
|
- *(short *)((short *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
)
...>
}


@receiver_5_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(byte *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- ((byte *)puVar1)[0x4]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(byte *)((ushort *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (byte)((ushort *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_5_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(undefined1 *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- ((undefined1 *)puVar1)[0x4]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (undefined1)((ushort *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_5_w_4_28_store_4@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
|
- ((char *)puVar1)[0x4] = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x4)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(char *)((byte *)puVar1 + 0x4)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- ((char *)puVar1)[0x4]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(char *)((ushort *)puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (char)((ushort *)puVar1)[0x2]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_5_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- *(byte *)((byte *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- ((byte *)puVar1)[0x5]
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_5_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- *(undefined1 *)((byte *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- ((undefined1 *)puVar1)[0x5]
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_5_w_4_28_store_5@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
|
- ((char *)puVar1)[0x5] = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x5)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
|
- *(char *)((byte *)puVar1 + 0x5)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
|
- ((char *)puVar1)[0x5]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_5_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x6) = (char)V;
- *(char *)((char *)puVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x6) = (char)V;
- *(byte *)((char *)puVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x6) = (byte)V;
- *(char *)((char *)puVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x6) = (byte)V;
- *(byte *)((char *)puVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_word_ushort@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(ushort *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- ((ushort *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(ushort *)((ushort *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_5_w_6_42_word_short@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
|
- *(short *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
|
- ((short *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
|
- *(short *)((short *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
)
...>
}


@receiver_5_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(byte *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- ((byte *)puVar1)[0x6]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(byte *)((ushort *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- (byte)((ushort *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_5_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(undefined1 *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- ((undefined1 *)puVar1)[0x6]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- (undefined1)((ushort *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_5_w_6_42_store_6@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
|
- ((char *)puVar1)[0x6] = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x6)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(char *)((byte *)puVar1 + 0x6)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- ((char *)puVar1)[0x6]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(char *)((ushort *)puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- (char)((ushort *)puVar1)[0x3]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_5_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- *(byte *)((byte *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- ((byte *)puVar1)[0x7]
+ ((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_5_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- *(undefined1 *)((byte *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- ((undefined1 *)puVar1)[0x7]
+ ((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_5_w_6_42_store_7@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
|
- ((char *)puVar1)[0x7] = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x7)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
|
- *(char *)((byte *)puVar1 + 0x7)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
|
- ((char *)puVar1)[0x7]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x0) = (char)V;
- *(char *)((char *)puVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x0) = (char)V;
- *(byte *)((char *)puVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x0) = (byte)V;
- *(char *)((char *)puVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x0) = (byte)V;
- *(byte *)((char *)puVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- ((short *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)((short *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
)
...>
}


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((byte *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (byte)((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((undefined1 *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (undefined1)((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- ((char *)puVar3)[0x0] = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)puVar3 = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)((byte *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((char *)puVar3)[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)((ushort *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (char)((ushort *)puVar3)[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)puVar3
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(byte *)((byte *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((byte *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(undefined1 *)((byte *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((undefined1 *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
|
- ((char *)puVar3)[0x1] = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(char *)((byte *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((char *)puVar3)[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_6_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x2) = (char)V;
- *(char *)((char *)puVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x2) = (char)V;
- *(byte *)((char *)puVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x2) = (byte)V;
- *(char *)((char *)puVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x2) = (byte)V;
- *(byte *)((char *)puVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@receiver_6_w_2_14_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- ((short *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)((short *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
)
...>
}


@receiver_6_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((byte *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (byte)((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_6_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((undefined1 *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (undefined1)((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_6_w_2_14_store_2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- ((char *)puVar3)[0x2] = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)((byte *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((char *)puVar3)[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)((ushort *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- (char)((ushort *)puVar3)[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_6_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(byte *)((byte *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((byte *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_6_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((undefined1 *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_6_w_2_14_store_3@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
|
- ((char *)puVar3)[0x3] = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_6_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(char *)((byte *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((char *)puVar3)[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_6_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x4) = (char)V;
- *(char *)((char *)puVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x4) = (char)V;
- *(byte *)((char *)puVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x4) = (byte)V;
- *(char *)((char *)puVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x4) = (byte)V;
- *(byte *)((char *)puVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@receiver_6_w_4_28_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- ((short *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)((short *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
)
...>
}


@receiver_6_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((byte *)puVar3)[0x4]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (byte)((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_6_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((undefined1 *)puVar3)[0x4]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (undefined1)((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_6_w_4_28_store_4@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- ((char *)puVar3)[0x4] = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x4)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)((byte *)puVar3 + 0x4)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((char *)puVar3)[0x4]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)((ushort *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (char)((ushort *)puVar3)[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_6_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(byte *)((byte *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((byte *)puVar3)[0x5]
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_6_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((undefined1 *)puVar3)[0x5]
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_6_w_4_28_store_5@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
|
- ((char *)puVar3)[0x5] = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_6_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x5)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(char *)((byte *)puVar3 + 0x5)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((char *)puVar3)[0x5]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_6_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x6) = (char)V;
- *(char *)((char *)puVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x6) = (char)V;
- *(byte *)((char *)puVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x6) = (byte)V;
- *(char *)((char *)puVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x6) = (byte)V;
- *(byte *)((char *)puVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_word_ushort@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@receiver_6_w_6_42_word_short@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- ((short *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)((short *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
)
...>
}


@receiver_6_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((byte *)puVar3)[0x6]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (byte)((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_6_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((undefined1 *)puVar3)[0x6]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (undefined1)((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_6_w_6_42_store_6@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- ((char *)puVar3)[0x6] = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x6)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)((byte *)puVar3 + 0x6)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((char *)puVar3)[0x6]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)((ushort *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- (char)((ushort *)puVar3)[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_6_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(byte *)((byte *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((byte *)puVar3)[0x7]
+ ((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_6_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((undefined1 *)puVar3)[0x7]
+ ((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_6_w_6_42_store_7@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
|
- ((char *)puVar3)[0x7] = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_6_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x7)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(char *)((byte *)puVar3 + 0x7)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((char *)puVar3)[0x7]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}
