@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x0) = (char)V;
- *(char *)((char *)pl + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x0) = (char)V;
- *(byte *)((char *)pl + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x0) = (byte)V;
- *(char *)((char *)pl + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x0) = (byte)V;
- *(byte *)((char *)pl + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags
|
- *(ushort *)((byte *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags
|
- ((ushort *)pl)[0x0]
+ ((uw_object_hdr_t *)pl)->type_flags
|
- *(ushort *)((ushort *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_signed
|
- *(short *)((byte *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_signed
|
- ((short *)pl)[0x0]
+ ((uw_object_hdr_t *)pl)->type_flags_signed
|
- *(short *)((short *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- *(byte *)((byte *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- ((byte *)pl)[0x0]
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- *(byte *)((ushort *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- (byte)((ushort *)pl)[0x0]
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- *(byte *)pl
+ ((uw_object_hdr_t *)pl)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- *(undefined1 *)((byte *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- ((undefined1 *)pl)[0x0]
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- *(undefined1 *)((ushort *)pl + 0x0)
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- (undefined1)((ushort *)pl)[0x0]
+ ((uw_object_hdr_t *)pl)->type_flags_low
|
- *(undefined1 *)pl
+ ((uw_object_hdr_t *)pl)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x0) = E;
+ ((uw_object_hdr_t *)pl)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pl + 0x0) = E;
+ ((uw_object_hdr_t *)pl)->type_flags_low = (byte)E;
|
- ((char *)pl)[0x0] = E;
+ ((uw_object_hdr_t *)pl)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pl + 0x0) = E;
+ ((uw_object_hdr_t *)pl)->type_flags_low = (byte)E;
|
- *(char *)pl = E;
+ ((uw_object_hdr_t *)pl)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x0)
+ (char)((uw_object_hdr_t *)pl)->type_flags_low
|
- *(char *)((byte *)pl + 0x0)
+ (char)((uw_object_hdr_t *)pl)->type_flags_low
|
- ((char *)pl)[0x0]
+ (char)((uw_object_hdr_t *)pl)->type_flags_low
|
- *(char *)((ushort *)pl + 0x0)
+ (char)((uw_object_hdr_t *)pl)->type_flags_low
|
- (char)((ushort *)pl)[0x0]
+ (char)((uw_object_hdr_t *)pl)->type_flags_low
|
- *(char *)pl
+ (char)((uw_object_hdr_t *)pl)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->type_flags_high
|
- *(byte *)((byte *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->type_flags_high
|
- ((byte *)pl)[0x1]
+ ((uw_object_hdr_t *)pl)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->type_flags_high
|
- *(undefined1 *)((byte *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->type_flags_high
|
- ((undefined1 *)pl)[0x1]
+ ((uw_object_hdr_t *)pl)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x1) = E;
+ ((uw_object_hdr_t *)pl)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pl + 0x1) = E;
+ ((uw_object_hdr_t *)pl)->type_flags_high = (byte)E;
|
- ((char *)pl)[0x1] = E;
+ ((uw_object_hdr_t *)pl)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x1)
+ (char)((uw_object_hdr_t *)pl)->type_flags_high
|
- *(char *)((byte *)pl + 0x1)
+ (char)((uw_object_hdr_t *)pl)->type_flags_high
|
- ((char *)pl)[0x1]
+ (char)((uw_object_hdr_t *)pl)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x2) = (char)V;
- *(char *)((char *)pl + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x2) = (char)V;
- *(byte *)((char *)pl + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x2) = (byte)V;
- *(char *)((char *)pl + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x2) = (byte)V;
- *(byte *)((char *)pl + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word
|
- *(ushort *)((byte *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word
|
- ((ushort *)pl)[0x1]
+ ((uw_object_hdr_t *)pl)->position_word
|
- *(ushort *)((ushort *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word_signed
|
- *(short *)((byte *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word_signed
|
- ((short *)pl)[0x1]
+ ((uw_object_hdr_t *)pl)->position_word_signed
|
- *(short *)((short *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- *(byte *)((byte *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- ((byte *)pl)[0x2]
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- *(byte *)((ushort *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- (byte)((ushort *)pl)[0x1]
+ ((uw_object_hdr_t *)pl)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- *(undefined1 *)((byte *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- ((undefined1 *)pl)[0x2]
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- *(undefined1 *)((ushort *)pl + 0x1)
+ ((uw_object_hdr_t *)pl)->position_word_low
|
- (undefined1)((ushort *)pl)[0x1]
+ ((uw_object_hdr_t *)pl)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x2) = E;
+ ((uw_object_hdr_t *)pl)->position_word_low = (byte)E;
|
- *(char *)((byte *)pl + 0x2) = E;
+ ((uw_object_hdr_t *)pl)->position_word_low = (byte)E;
|
- ((char *)pl)[0x2] = E;
+ ((uw_object_hdr_t *)pl)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pl + 0x1) = E;
+ ((uw_object_hdr_t *)pl)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x2)
+ (char)((uw_object_hdr_t *)pl)->position_word_low
|
- *(char *)((byte *)pl + 0x2)
+ (char)((uw_object_hdr_t *)pl)->position_word_low
|
- ((char *)pl)[0x2]
+ (char)((uw_object_hdr_t *)pl)->position_word_low
|
- *(char *)((ushort *)pl + 0x1)
+ (char)((uw_object_hdr_t *)pl)->position_word_low
|
- (char)((ushort *)pl)[0x1]
+ (char)((uw_object_hdr_t *)pl)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->position_word_high
|
- *(byte *)((byte *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->position_word_high
|
- ((byte *)pl)[0x3]
+ ((uw_object_hdr_t *)pl)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->position_word_high
|
- *(undefined1 *)((byte *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->position_word_high
|
- ((undefined1 *)pl)[0x3]
+ ((uw_object_hdr_t *)pl)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x3) = E;
+ ((uw_object_hdr_t *)pl)->position_word_high = (byte)E;
|
- *(char *)((byte *)pl + 0x3) = E;
+ ((uw_object_hdr_t *)pl)->position_word_high = (byte)E;
|
- ((char *)pl)[0x3] = E;
+ ((uw_object_hdr_t *)pl)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x3)
+ (char)((uw_object_hdr_t *)pl)->position_word_high
|
- *(char *)((byte *)pl + 0x3)
+ (char)((uw_object_hdr_t *)pl)->position_word_high
|
- ((char *)pl)[0x3]
+ (char)((uw_object_hdr_t *)pl)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x4) = (char)V;
- *(char *)((char *)pl + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x4) = (char)V;
- *(byte *)((char *)pl + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x4) = (byte)V;
- *(char *)((char *)pl + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x4) = (byte)V;
- *(byte *)((char *)pl + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word
|
- *(ushort *)((byte *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word
|
- ((ushort *)pl)[0x2]
+ ((uw_object_hdr_t *)pl)->chain_word
|
- *(ushort *)((ushort *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word_signed
|
- *(short *)((byte *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word_signed
|
- ((short *)pl)[0x2]
+ ((uw_object_hdr_t *)pl)->chain_word_signed
|
- *(short *)((short *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- *(byte *)((byte *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- ((byte *)pl)[0x4]
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- *(byte *)((ushort *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- (byte)((ushort *)pl)[0x2]
+ ((uw_object_hdr_t *)pl)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- *(undefined1 *)((byte *)pl + 0x4)
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- ((undefined1 *)pl)[0x4]
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- *(undefined1 *)((ushort *)pl + 0x2)
+ ((uw_object_hdr_t *)pl)->chain_word_low
|
- (undefined1)((ushort *)pl)[0x2]
+ ((uw_object_hdr_t *)pl)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x4) = E;
+ ((uw_object_hdr_t *)pl)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pl + 0x4) = E;
+ ((uw_object_hdr_t *)pl)->chain_word_low = (byte)E;
|
- ((char *)pl)[0x4] = E;
+ ((uw_object_hdr_t *)pl)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pl + 0x2) = E;
+ ((uw_object_hdr_t *)pl)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x4)
+ (char)((uw_object_hdr_t *)pl)->chain_word_low
|
- *(char *)((byte *)pl + 0x4)
+ (char)((uw_object_hdr_t *)pl)->chain_word_low
|
- ((char *)pl)[0x4]
+ (char)((uw_object_hdr_t *)pl)->chain_word_low
|
- *(char *)((ushort *)pl + 0x2)
+ (char)((uw_object_hdr_t *)pl)->chain_word_low
|
- (char)((ushort *)pl)[0x2]
+ (char)((uw_object_hdr_t *)pl)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x5)
+ ((uw_object_hdr_t *)pl)->chain_word_high
|
- *(byte *)((byte *)pl + 0x5)
+ ((uw_object_hdr_t *)pl)->chain_word_high
|
- ((byte *)pl)[0x5]
+ ((uw_object_hdr_t *)pl)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x5)
+ ((uw_object_hdr_t *)pl)->chain_word_high
|
- *(undefined1 *)((byte *)pl + 0x5)
+ ((uw_object_hdr_t *)pl)->chain_word_high
|
- ((undefined1 *)pl)[0x5]
+ ((uw_object_hdr_t *)pl)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x5) = E;
+ ((uw_object_hdr_t *)pl)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pl + 0x5) = E;
+ ((uw_object_hdr_t *)pl)->chain_word_high = (byte)E;
|
- ((char *)pl)[0x5] = E;
+ ((uw_object_hdr_t *)pl)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x5)
+ (char)((uw_object_hdr_t *)pl)->chain_word_high
|
- *(char *)((byte *)pl + 0x5)
+ (char)((uw_object_hdr_t *)pl)->chain_word_high
|
- ((char *)pl)[0x5]
+ (char)((uw_object_hdr_t *)pl)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x6) = (char)V;
- *(char *)((char *)pl + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pl + 0x6) = (char)V;
- *(byte *)((char *)pl + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x6) = (byte)V;
- *(char *)((char *)pl + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pl)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pl + 0x6) = (byte)V;
- *(byte *)((char *)pl + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pl)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word
|
- *(ushort *)((byte *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word
|
- ((ushort *)pl)[0x3]
+ ((uw_object_hdr_t *)pl)->link_word
|
- *(ushort *)((ushort *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word_signed
|
- *(short *)((byte *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word_signed
|
- ((short *)pl)[0x3]
+ ((uw_object_hdr_t *)pl)->link_word_signed
|
- *(short *)((short *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- *(byte *)((byte *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- ((byte *)pl)[0x6]
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- *(byte *)((ushort *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- (byte)((ushort *)pl)[0x3]
+ ((uw_object_hdr_t *)pl)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- *(undefined1 *)((byte *)pl + 0x6)
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- ((undefined1 *)pl)[0x6]
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- *(undefined1 *)((ushort *)pl + 0x3)
+ ((uw_object_hdr_t *)pl)->link_word_low
|
- (undefined1)((ushort *)pl)[0x3]
+ ((uw_object_hdr_t *)pl)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x6) = E;
+ ((uw_object_hdr_t *)pl)->link_word_low = (byte)E;
|
- *(char *)((byte *)pl + 0x6) = E;
+ ((uw_object_hdr_t *)pl)->link_word_low = (byte)E;
|
- ((char *)pl)[0x6] = E;
+ ((uw_object_hdr_t *)pl)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pl + 0x3) = E;
+ ((uw_object_hdr_t *)pl)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x6)
+ (char)((uw_object_hdr_t *)pl)->link_word_low
|
- *(char *)((byte *)pl + 0x6)
+ (char)((uw_object_hdr_t *)pl)->link_word_low
|
- ((char *)pl)[0x6]
+ (char)((uw_object_hdr_t *)pl)->link_word_low
|
- *(char *)((ushort *)pl + 0x3)
+ (char)((uw_object_hdr_t *)pl)->link_word_low
|
- (char)((ushort *)pl)[0x3]
+ (char)((uw_object_hdr_t *)pl)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pl + 0x7)
+ ((uw_object_hdr_t *)pl)->link_word_high
|
- *(byte *)((byte *)pl + 0x7)
+ ((uw_object_hdr_t *)pl)->link_word_high
|
- ((byte *)pl)[0x7]
+ ((uw_object_hdr_t *)pl)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pl + 0x7)
+ ((uw_object_hdr_t *)pl)->link_word_high
|
- *(undefined1 *)((byte *)pl + 0x7)
+ ((uw_object_hdr_t *)pl)->link_word_high
|
- ((undefined1 *)pl)[0x7]
+ ((uw_object_hdr_t *)pl)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x7) = E;
+ ((uw_object_hdr_t *)pl)->link_word_high = (byte)E;
|
- *(char *)((byte *)pl + 0x7) = E;
+ ((uw_object_hdr_t *)pl)->link_word_high = (byte)E;
|
- ((char *)pl)[0x7] = E;
+ ((uw_object_hdr_t *)pl)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pl + 0x7)
+ (char)((uw_object_hdr_t *)pl)->link_word_high
|
- *(char *)((byte *)pl + 0x7)
+ (char)((uw_object_hdr_t *)pl)->link_word_high
|
- ((char *)pl)[0x7]
+ (char)((uw_object_hdr_t *)pl)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x0) = (char)V;
- *(char *)((char *)obj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x0) = (char)V;
- *(byte *)((char *)obj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x0) = (byte)V;
- *(char *)((char *)obj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x0) = (byte)V;
- *(byte *)((char *)obj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags
|
- *(ushort *)((byte *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags
|
- ((ushort *)obj)[0x0]
+ ((uw_object_hdr_t *)obj)->type_flags
|
- *(ushort *)((ushort *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_signed
|
- *(short *)((byte *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_signed
|
- ((short *)obj)[0x0]
+ ((uw_object_hdr_t *)obj)->type_flags_signed
|
- *(short *)((short *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- *(byte *)((byte *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- ((byte *)obj)[0x0]
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- *(byte *)((ushort *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- (byte)((ushort *)obj)[0x0]
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- *(byte *)obj
+ ((uw_object_hdr_t *)obj)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- *(undefined1 *)((byte *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- ((undefined1 *)obj)[0x0]
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- *(undefined1 *)((ushort *)obj + 0x0)
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- (undefined1)((ushort *)obj)[0x0]
+ ((uw_object_hdr_t *)obj)->type_flags_low
|
- *(undefined1 *)obj
+ ((uw_object_hdr_t *)obj)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x0) = E;
+ ((uw_object_hdr_t *)obj)->type_flags_low = (byte)E;
|
- *(char *)((byte *)obj + 0x0) = E;
+ ((uw_object_hdr_t *)obj)->type_flags_low = (byte)E;
|
- ((char *)obj)[0x0] = E;
+ ((uw_object_hdr_t *)obj)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)obj + 0x0) = E;
+ ((uw_object_hdr_t *)obj)->type_flags_low = (byte)E;
|
- *(char *)obj = E;
+ ((uw_object_hdr_t *)obj)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x0)
+ (char)((uw_object_hdr_t *)obj)->type_flags_low
|
- *(char *)((byte *)obj + 0x0)
+ (char)((uw_object_hdr_t *)obj)->type_flags_low
|
- ((char *)obj)[0x0]
+ (char)((uw_object_hdr_t *)obj)->type_flags_low
|
- *(char *)((ushort *)obj + 0x0)
+ (char)((uw_object_hdr_t *)obj)->type_flags_low
|
- (char)((ushort *)obj)[0x0]
+ (char)((uw_object_hdr_t *)obj)->type_flags_low
|
- *(char *)obj
+ (char)((uw_object_hdr_t *)obj)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->type_flags_high
|
- *(byte *)((byte *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->type_flags_high
|
- ((byte *)obj)[0x1]
+ ((uw_object_hdr_t *)obj)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->type_flags_high
|
- *(undefined1 *)((byte *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->type_flags_high
|
- ((undefined1 *)obj)[0x1]
+ ((uw_object_hdr_t *)obj)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x1) = E;
+ ((uw_object_hdr_t *)obj)->type_flags_high = (byte)E;
|
- *(char *)((byte *)obj + 0x1) = E;
+ ((uw_object_hdr_t *)obj)->type_flags_high = (byte)E;
|
- ((char *)obj)[0x1] = E;
+ ((uw_object_hdr_t *)obj)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x1)
+ (char)((uw_object_hdr_t *)obj)->type_flags_high
|
- *(char *)((byte *)obj + 0x1)
+ (char)((uw_object_hdr_t *)obj)->type_flags_high
|
- ((char *)obj)[0x1]
+ (char)((uw_object_hdr_t *)obj)->type_flags_high
)
...>
}


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x2) = (char)V;
- *(char *)((char *)obj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x2) = (char)V;
- *(byte *)((char *)obj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x2) = (byte)V;
- *(char *)((char *)obj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x2) = (byte)V;
- *(byte *)((char *)obj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word
|
- *(ushort *)((byte *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word
|
- ((ushort *)obj)[0x1]
+ ((uw_object_hdr_t *)obj)->position_word
|
- *(ushort *)((ushort *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->position_word
)
...>
}


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word_signed
|
- *(short *)((byte *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word_signed
|
- ((short *)obj)[0x1]
+ ((uw_object_hdr_t *)obj)->position_word_signed
|
- *(short *)((short *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->position_word_signed
)
...>
}


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- *(byte *)((byte *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- ((byte *)obj)[0x2]
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- *(byte *)((ushort *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- (byte)((ushort *)obj)[0x1]
+ ((uw_object_hdr_t *)obj)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- *(undefined1 *)((byte *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- ((undefined1 *)obj)[0x2]
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- *(undefined1 *)((ushort *)obj + 0x1)
+ ((uw_object_hdr_t *)obj)->position_word_low
|
- (undefined1)((ushort *)obj)[0x1]
+ ((uw_object_hdr_t *)obj)->position_word_low
)
...>
}


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x2) = E;
+ ((uw_object_hdr_t *)obj)->position_word_low = (byte)E;
|
- *(char *)((byte *)obj + 0x2) = E;
+ ((uw_object_hdr_t *)obj)->position_word_low = (byte)E;
|
- ((char *)obj)[0x2] = E;
+ ((uw_object_hdr_t *)obj)->position_word_low = (byte)E;
|
- *(char *)((ushort *)obj + 0x1) = E;
+ ((uw_object_hdr_t *)obj)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x2)
+ (char)((uw_object_hdr_t *)obj)->position_word_low
|
- *(char *)((byte *)obj + 0x2)
+ (char)((uw_object_hdr_t *)obj)->position_word_low
|
- ((char *)obj)[0x2]
+ (char)((uw_object_hdr_t *)obj)->position_word_low
|
- *(char *)((ushort *)obj + 0x1)
+ (char)((uw_object_hdr_t *)obj)->position_word_low
|
- (char)((ushort *)obj)[0x1]
+ (char)((uw_object_hdr_t *)obj)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->position_word_high
|
- *(byte *)((byte *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->position_word_high
|
- ((byte *)obj)[0x3]
+ ((uw_object_hdr_t *)obj)->position_word_high
)
...>
}


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->position_word_high
|
- *(undefined1 *)((byte *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->position_word_high
|
- ((undefined1 *)obj)[0x3]
+ ((uw_object_hdr_t *)obj)->position_word_high
)
...>
}


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x3) = E;
+ ((uw_object_hdr_t *)obj)->position_word_high = (byte)E;
|
- *(char *)((byte *)obj + 0x3) = E;
+ ((uw_object_hdr_t *)obj)->position_word_high = (byte)E;
|
- ((char *)obj)[0x3] = E;
+ ((uw_object_hdr_t *)obj)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x3)
+ (char)((uw_object_hdr_t *)obj)->position_word_high
|
- *(char *)((byte *)obj + 0x3)
+ (char)((uw_object_hdr_t *)obj)->position_word_high
|
- ((char *)obj)[0x3]
+ (char)((uw_object_hdr_t *)obj)->position_word_high
)
...>
}


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x4) = (char)V;
- *(char *)((char *)obj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x4) = (char)V;
- *(byte *)((char *)obj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x4) = (byte)V;
- *(char *)((char *)obj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x4) = (byte)V;
- *(byte *)((char *)obj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word
|
- *(ushort *)((byte *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word
|
- ((ushort *)obj)[0x2]
+ ((uw_object_hdr_t *)obj)->chain_word
|
- *(ushort *)((ushort *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->chain_word
)
...>
}


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word_signed
|
- *(short *)((byte *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word_signed
|
- ((short *)obj)[0x2]
+ ((uw_object_hdr_t *)obj)->chain_word_signed
|
- *(short *)((short *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->chain_word_signed
)
...>
}


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- *(byte *)((byte *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- ((byte *)obj)[0x4]
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- *(byte *)((ushort *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- (byte)((ushort *)obj)[0x2]
+ ((uw_object_hdr_t *)obj)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- *(undefined1 *)((byte *)obj + 0x4)
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- ((undefined1 *)obj)[0x4]
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- *(undefined1 *)((ushort *)obj + 0x2)
+ ((uw_object_hdr_t *)obj)->chain_word_low
|
- (undefined1)((ushort *)obj)[0x2]
+ ((uw_object_hdr_t *)obj)->chain_word_low
)
...>
}


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x4) = E;
+ ((uw_object_hdr_t *)obj)->chain_word_low = (byte)E;
|
- *(char *)((byte *)obj + 0x4) = E;
+ ((uw_object_hdr_t *)obj)->chain_word_low = (byte)E;
|
- ((char *)obj)[0x4] = E;
+ ((uw_object_hdr_t *)obj)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)obj + 0x2) = E;
+ ((uw_object_hdr_t *)obj)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x4)
+ (char)((uw_object_hdr_t *)obj)->chain_word_low
|
- *(char *)((byte *)obj + 0x4)
+ (char)((uw_object_hdr_t *)obj)->chain_word_low
|
- ((char *)obj)[0x4]
+ (char)((uw_object_hdr_t *)obj)->chain_word_low
|
- *(char *)((ushort *)obj + 0x2)
+ (char)((uw_object_hdr_t *)obj)->chain_word_low
|
- (char)((ushort *)obj)[0x2]
+ (char)((uw_object_hdr_t *)obj)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x5)
+ ((uw_object_hdr_t *)obj)->chain_word_high
|
- *(byte *)((byte *)obj + 0x5)
+ ((uw_object_hdr_t *)obj)->chain_word_high
|
- ((byte *)obj)[0x5]
+ ((uw_object_hdr_t *)obj)->chain_word_high
)
...>
}


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x5)
+ ((uw_object_hdr_t *)obj)->chain_word_high
|
- *(undefined1 *)((byte *)obj + 0x5)
+ ((uw_object_hdr_t *)obj)->chain_word_high
|
- ((undefined1 *)obj)[0x5]
+ ((uw_object_hdr_t *)obj)->chain_word_high
)
...>
}


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x5) = E;
+ ((uw_object_hdr_t *)obj)->chain_word_high = (byte)E;
|
- *(char *)((byte *)obj + 0x5) = E;
+ ((uw_object_hdr_t *)obj)->chain_word_high = (byte)E;
|
- ((char *)obj)[0x5] = E;
+ ((uw_object_hdr_t *)obj)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x5)
+ (char)((uw_object_hdr_t *)obj)->chain_word_high
|
- *(char *)((byte *)obj + 0x5)
+ (char)((uw_object_hdr_t *)obj)->chain_word_high
|
- ((char *)obj)[0x5]
+ (char)((uw_object_hdr_t *)obj)->chain_word_high
)
...>
}


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x6) = (char)V;
- *(char *)((char *)obj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)obj + 0x6) = (char)V;
- *(byte *)((char *)obj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x6) = (byte)V;
- *(char *)((char *)obj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)obj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)obj + 0x6) = (byte)V;
- *(byte *)((char *)obj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)obj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word
|
- *(ushort *)((byte *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word
|
- ((ushort *)obj)[0x3]
+ ((uw_object_hdr_t *)obj)->link_word
|
- *(ushort *)((ushort *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->link_word
)
...>
}


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word_signed
|
- *(short *)((byte *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word_signed
|
- ((short *)obj)[0x3]
+ ((uw_object_hdr_t *)obj)->link_word_signed
|
- *(short *)((short *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->link_word_signed
)
...>
}


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- *(byte *)((byte *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- ((byte *)obj)[0x6]
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- *(byte *)((ushort *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- (byte)((ushort *)obj)[0x3]
+ ((uw_object_hdr_t *)obj)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- *(undefined1 *)((byte *)obj + 0x6)
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- ((undefined1 *)obj)[0x6]
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- *(undefined1 *)((ushort *)obj + 0x3)
+ ((uw_object_hdr_t *)obj)->link_word_low
|
- (undefined1)((ushort *)obj)[0x3]
+ ((uw_object_hdr_t *)obj)->link_word_low
)
...>
}


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x6) = E;
+ ((uw_object_hdr_t *)obj)->link_word_low = (byte)E;
|
- *(char *)((byte *)obj + 0x6) = E;
+ ((uw_object_hdr_t *)obj)->link_word_low = (byte)E;
|
- ((char *)obj)[0x6] = E;
+ ((uw_object_hdr_t *)obj)->link_word_low = (byte)E;
|
- *(char *)((ushort *)obj + 0x3) = E;
+ ((uw_object_hdr_t *)obj)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x6)
+ (char)((uw_object_hdr_t *)obj)->link_word_low
|
- *(char *)((byte *)obj + 0x6)
+ (char)((uw_object_hdr_t *)obj)->link_word_low
|
- ((char *)obj)[0x6]
+ (char)((uw_object_hdr_t *)obj)->link_word_low
|
- *(char *)((ushort *)obj + 0x3)
+ (char)((uw_object_hdr_t *)obj)->link_word_low
|
- (char)((ushort *)obj)[0x3]
+ (char)((uw_object_hdr_t *)obj)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)obj + 0x7)
+ ((uw_object_hdr_t *)obj)->link_word_high
|
- *(byte *)((byte *)obj + 0x7)
+ ((uw_object_hdr_t *)obj)->link_word_high
|
- ((byte *)obj)[0x7]
+ ((uw_object_hdr_t *)obj)->link_word_high
)
...>
}


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)obj + 0x7)
+ ((uw_object_hdr_t *)obj)->link_word_high
|
- *(undefined1 *)((byte *)obj + 0x7)
+ ((uw_object_hdr_t *)obj)->link_word_high
|
- ((undefined1 *)obj)[0x7]
+ ((uw_object_hdr_t *)obj)->link_word_high
)
...>
}


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x7) = E;
+ ((uw_object_hdr_t *)obj)->link_word_high = (byte)E;
|
- *(char *)((byte *)obj + 0x7) = E;
+ ((uw_object_hdr_t *)obj)->link_word_high = (byte)E;
|
- ((char *)obj)[0x7] = E;
+ ((uw_object_hdr_t *)obj)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)obj + 0x7)
+ (char)((uw_object_hdr_t *)obj)->link_word_high
|
- *(char *)((byte *)obj + 0x7)
+ (char)((uw_object_hdr_t *)obj)->link_word_high
|
- ((char *)obj)[0x7]
+ (char)((uw_object_hdr_t *)obj)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x0) = (char)V;
- *(char *)((char *)contents + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x0) = (char)V;
- *(byte *)((char *)contents + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x0) = (byte)V;
- *(char *)((char *)contents + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x0) = (byte)V;
- *(byte *)((char *)contents + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- ((ushort *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)((ushort *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- *(short *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- ((short *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- *(short *)((short *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- ((byte *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)((ushort *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- (byte)((ushort *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)contents
+ ((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- ((undefined1 *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)((ushort *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- (undefined1)((ushort *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)contents
+ ((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)((byte *)contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- ((char *)contents)[0x0] = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)contents = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)((byte *)contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- ((char *)contents)[0x0]
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)((ushort *)contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- (char)((ushort *)contents)[0x0]
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)contents
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- *(byte *)((byte *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- ((byte *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- *(undefined1 *)((byte *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- ((undefined1 *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
|
- *(char *)((byte *)contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
|
- ((char *)contents)[0x1] = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
|
- *(char *)((byte *)contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
|
- ((char *)contents)[0x1]
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x2) = (char)V;
- *(char *)((char *)contents + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x2) = (char)V;
- *(byte *)((char *)contents + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x2) = (byte)V;
- *(char *)((char *)contents + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x2) = (byte)V;
- *(byte *)((char *)contents + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(ushort *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- ((ushort *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(ushort *)((ushort *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word
)
...>
}


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- *(short *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- ((short *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- *(short *)((short *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word_signed
)
...>
}


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(byte *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- ((byte *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(byte *)((ushort *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- (byte)((ushort *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(undefined1 *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- ((undefined1 *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(undefined1 *)((ushort *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- (undefined1)((ushort *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- *(char *)((byte *)contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- ((char *)contents)[0x2] = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- *(char *)((byte *)contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- ((char *)contents)[0x2]
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- *(char *)((ushort *)contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- (char)((ushort *)contents)[0x1]
+ (char)((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- *(byte *)((byte *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- ((byte *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- *(undefined1 *)((byte *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- ((undefined1 *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
|
- *(char *)((byte *)contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
|
- ((char *)contents)[0x3] = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->position_word_high
|
- *(char *)((byte *)contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->position_word_high
|
- ((char *)contents)[0x3]
+ (char)((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x4) = (char)V;
- *(char *)((char *)contents + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x4) = (char)V;
- *(byte *)((char *)contents + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x4) = (byte)V;
- *(char *)((char *)contents + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x4) = (byte)V;
- *(byte *)((char *)contents + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(ushort *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- ((ushort *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(ushort *)((ushort *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word
)
...>
}


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- *(short *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- ((short *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- *(short *)((short *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
)
...>
}


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(byte *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- ((byte *)contents)[0x4]
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(byte *)((ushort *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- (byte)((ushort *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(undefined1 *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- ((undefined1 *)contents)[0x4]
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(undefined1 *)((ushort *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- (undefined1)((ushort *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x4) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- *(char *)((byte *)contents + 0x4) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- ((char *)contents)[0x4] = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x4)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- *(char *)((byte *)contents + 0x4)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- ((char *)contents)[0x4]
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- *(char *)((ushort *)contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- (char)((ushort *)contents)[0x2]
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- *(byte *)((byte *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- ((byte *)contents)[0x5]
+ ((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- *(undefined1 *)((byte *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- ((undefined1 *)contents)[0x5]
+ ((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x5) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
|
- *(char *)((byte *)contents + 0x5) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
|
- ((char *)contents)[0x5] = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x5)
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
|
- *(char *)((byte *)contents + 0x5)
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
|
- ((char *)contents)[0x5]
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x6) = (char)V;
- *(char *)((char *)contents + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x6) = (char)V;
- *(byte *)((char *)contents + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x6) = (byte)V;
- *(char *)((char *)contents + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x6) = (byte)V;
- *(byte *)((char *)contents + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(ushort *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- ((ushort *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(ushort *)((ushort *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word
)
...>
}


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- *(short *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- ((short *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- *(short *)((short *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word_signed
)
...>
}


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(byte *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- ((byte *)contents)[0x6]
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(byte *)((ushort *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- (byte)((ushort *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(undefined1 *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- ((undefined1 *)contents)[0x6]
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(undefined1 *)((ushort *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- (undefined1)((ushort *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x6) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- *(char *)((byte *)contents + 0x6) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- ((char *)contents)[0x6] = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x6)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- *(char *)((byte *)contents + 0x6)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- ((char *)contents)[0x6]
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- *(char *)((ushort *)contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- (char)((ushort *)contents)[0x3]
+ (char)((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- *(byte *)((byte *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- ((byte *)contents)[0x7]
+ ((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- *(undefined1 *)((byte *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- ((undefined1 *)contents)[0x7]
+ ((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x7) = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
|
- *(char *)((byte *)contents + 0x7) = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
|
- ((char *)contents)[0x7] = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x7)
+ (char)((uw_object_hdr_t *)contents)->link_word_high
|
- *(char *)((byte *)contents + 0x7)
+ (char)((uw_object_hdr_t *)contents)->link_word_high
|
- ((char *)contents)[0x7]
+ (char)((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x0) = (char)V;
- *(char *)((char *)c + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x0) = (char)V;
- *(byte *)((char *)c + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x0) = (byte)V;
- *(char *)((char *)c + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x0) = (byte)V;
- *(byte *)((char *)c + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags
|
- *(ushort *)((byte *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags
|
- ((ushort *)c)[0x0]
+ ((uw_object_hdr_t *)c)->type_flags
|
- *(ushort *)((ushort *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_signed
|
- *(short *)((byte *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_signed
|
- ((short *)c)[0x0]
+ ((uw_object_hdr_t *)c)->type_flags_signed
|
- *(short *)((short *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- *(byte *)((byte *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- ((byte *)c)[0x0]
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- *(byte *)((ushort *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- (byte)((ushort *)c)[0x0]
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- *(byte *)c
+ ((uw_object_hdr_t *)c)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- *(undefined1 *)((byte *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- ((undefined1 *)c)[0x0]
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- *(undefined1 *)((ushort *)c + 0x0)
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- (undefined1)((ushort *)c)[0x0]
+ ((uw_object_hdr_t *)c)->type_flags_low
|
- *(undefined1 *)c
+ ((uw_object_hdr_t *)c)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x0) = E;
+ ((uw_object_hdr_t *)c)->type_flags_low = (byte)E;
|
- *(char *)((byte *)c + 0x0) = E;
+ ((uw_object_hdr_t *)c)->type_flags_low = (byte)E;
|
- ((char *)c)[0x0] = E;
+ ((uw_object_hdr_t *)c)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)c + 0x0) = E;
+ ((uw_object_hdr_t *)c)->type_flags_low = (byte)E;
|
- *(char *)c = E;
+ ((uw_object_hdr_t *)c)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x0)
+ (char)((uw_object_hdr_t *)c)->type_flags_low
|
- *(char *)((byte *)c + 0x0)
+ (char)((uw_object_hdr_t *)c)->type_flags_low
|
- ((char *)c)[0x0]
+ (char)((uw_object_hdr_t *)c)->type_flags_low
|
- *(char *)((ushort *)c + 0x0)
+ (char)((uw_object_hdr_t *)c)->type_flags_low
|
- (char)((ushort *)c)[0x0]
+ (char)((uw_object_hdr_t *)c)->type_flags_low
|
- *(char *)c
+ (char)((uw_object_hdr_t *)c)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x1)
+ ((uw_object_hdr_t *)c)->type_flags_high
|
- *(byte *)((byte *)c + 0x1)
+ ((uw_object_hdr_t *)c)->type_flags_high
|
- ((byte *)c)[0x1]
+ ((uw_object_hdr_t *)c)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x1)
+ ((uw_object_hdr_t *)c)->type_flags_high
|
- *(undefined1 *)((byte *)c + 0x1)
+ ((uw_object_hdr_t *)c)->type_flags_high
|
- ((undefined1 *)c)[0x1]
+ ((uw_object_hdr_t *)c)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x1) = E;
+ ((uw_object_hdr_t *)c)->type_flags_high = (byte)E;
|
- *(char *)((byte *)c + 0x1) = E;
+ ((uw_object_hdr_t *)c)->type_flags_high = (byte)E;
|
- ((char *)c)[0x1] = E;
+ ((uw_object_hdr_t *)c)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x1)
+ (char)((uw_object_hdr_t *)c)->type_flags_high
|
- *(char *)((byte *)c + 0x1)
+ (char)((uw_object_hdr_t *)c)->type_flags_high
|
- ((char *)c)[0x1]
+ (char)((uw_object_hdr_t *)c)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x2) = (char)V;
- *(char *)((char *)c + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x2) = (char)V;
- *(byte *)((char *)c + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x2) = (byte)V;
- *(char *)((char *)c + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x2) = (byte)V;
- *(byte *)((char *)c + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word
|
- *(ushort *)((byte *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word
|
- ((ushort *)c)[0x1]
+ ((uw_object_hdr_t *)c)->position_word
|
- *(ushort *)((ushort *)c + 0x1)
+ ((uw_object_hdr_t *)c)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word_signed
|
- *(short *)((byte *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word_signed
|
- ((short *)c)[0x1]
+ ((uw_object_hdr_t *)c)->position_word_signed
|
- *(short *)((short *)c + 0x1)
+ ((uw_object_hdr_t *)c)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word_low
|
- *(byte *)((byte *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word_low
|
- ((byte *)c)[0x2]
+ ((uw_object_hdr_t *)c)->position_word_low
|
- *(byte *)((ushort *)c + 0x1)
+ ((uw_object_hdr_t *)c)->position_word_low
|
- (byte)((ushort *)c)[0x1]
+ ((uw_object_hdr_t *)c)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word_low
|
- *(undefined1 *)((byte *)c + 0x2)
+ ((uw_object_hdr_t *)c)->position_word_low
|
- ((undefined1 *)c)[0x2]
+ ((uw_object_hdr_t *)c)->position_word_low
|
- *(undefined1 *)((ushort *)c + 0x1)
+ ((uw_object_hdr_t *)c)->position_word_low
|
- (undefined1)((ushort *)c)[0x1]
+ ((uw_object_hdr_t *)c)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x2) = E;
+ ((uw_object_hdr_t *)c)->position_word_low = (byte)E;
|
- *(char *)((byte *)c + 0x2) = E;
+ ((uw_object_hdr_t *)c)->position_word_low = (byte)E;
|
- ((char *)c)[0x2] = E;
+ ((uw_object_hdr_t *)c)->position_word_low = (byte)E;
|
- *(char *)((ushort *)c + 0x1) = E;
+ ((uw_object_hdr_t *)c)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x2)
+ (char)((uw_object_hdr_t *)c)->position_word_low
|
- *(char *)((byte *)c + 0x2)
+ (char)((uw_object_hdr_t *)c)->position_word_low
|
- ((char *)c)[0x2]
+ (char)((uw_object_hdr_t *)c)->position_word_low
|
- *(char *)((ushort *)c + 0x1)
+ (char)((uw_object_hdr_t *)c)->position_word_low
|
- (char)((ushort *)c)[0x1]
+ (char)((uw_object_hdr_t *)c)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x3)
+ ((uw_object_hdr_t *)c)->position_word_high
|
- *(byte *)((byte *)c + 0x3)
+ ((uw_object_hdr_t *)c)->position_word_high
|
- ((byte *)c)[0x3]
+ ((uw_object_hdr_t *)c)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x3)
+ ((uw_object_hdr_t *)c)->position_word_high
|
- *(undefined1 *)((byte *)c + 0x3)
+ ((uw_object_hdr_t *)c)->position_word_high
|
- ((undefined1 *)c)[0x3]
+ ((uw_object_hdr_t *)c)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x3) = E;
+ ((uw_object_hdr_t *)c)->position_word_high = (byte)E;
|
- *(char *)((byte *)c + 0x3) = E;
+ ((uw_object_hdr_t *)c)->position_word_high = (byte)E;
|
- ((char *)c)[0x3] = E;
+ ((uw_object_hdr_t *)c)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x3)
+ (char)((uw_object_hdr_t *)c)->position_word_high
|
- *(char *)((byte *)c + 0x3)
+ (char)((uw_object_hdr_t *)c)->position_word_high
|
- ((char *)c)[0x3]
+ (char)((uw_object_hdr_t *)c)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x4) = (char)V;
- *(char *)((char *)c + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x4) = (char)V;
- *(byte *)((char *)c + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x4) = (byte)V;
- *(char *)((char *)c + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x4) = (byte)V;
- *(byte *)((char *)c + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word
|
- *(ushort *)((byte *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word
|
- ((ushort *)c)[0x2]
+ ((uw_object_hdr_t *)c)->chain_word
|
- *(ushort *)((ushort *)c + 0x2)
+ ((uw_object_hdr_t *)c)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word_signed
|
- *(short *)((byte *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word_signed
|
- ((short *)c)[0x2]
+ ((uw_object_hdr_t *)c)->chain_word_signed
|
- *(short *)((short *)c + 0x2)
+ ((uw_object_hdr_t *)c)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- *(byte *)((byte *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- ((byte *)c)[0x4]
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- *(byte *)((ushort *)c + 0x2)
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- (byte)((ushort *)c)[0x2]
+ ((uw_object_hdr_t *)c)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- *(undefined1 *)((byte *)c + 0x4)
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- ((undefined1 *)c)[0x4]
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- *(undefined1 *)((ushort *)c + 0x2)
+ ((uw_object_hdr_t *)c)->chain_word_low
|
- (undefined1)((ushort *)c)[0x2]
+ ((uw_object_hdr_t *)c)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x4) = E;
+ ((uw_object_hdr_t *)c)->chain_word_low = (byte)E;
|
- *(char *)((byte *)c + 0x4) = E;
+ ((uw_object_hdr_t *)c)->chain_word_low = (byte)E;
|
- ((char *)c)[0x4] = E;
+ ((uw_object_hdr_t *)c)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)c + 0x2) = E;
+ ((uw_object_hdr_t *)c)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x4)
+ (char)((uw_object_hdr_t *)c)->chain_word_low
|
- *(char *)((byte *)c + 0x4)
+ (char)((uw_object_hdr_t *)c)->chain_word_low
|
- ((char *)c)[0x4]
+ (char)((uw_object_hdr_t *)c)->chain_word_low
|
- *(char *)((ushort *)c + 0x2)
+ (char)((uw_object_hdr_t *)c)->chain_word_low
|
- (char)((ushort *)c)[0x2]
+ (char)((uw_object_hdr_t *)c)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x5)
+ ((uw_object_hdr_t *)c)->chain_word_high
|
- *(byte *)((byte *)c + 0x5)
+ ((uw_object_hdr_t *)c)->chain_word_high
|
- ((byte *)c)[0x5]
+ ((uw_object_hdr_t *)c)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x5)
+ ((uw_object_hdr_t *)c)->chain_word_high
|
- *(undefined1 *)((byte *)c + 0x5)
+ ((uw_object_hdr_t *)c)->chain_word_high
|
- ((undefined1 *)c)[0x5]
+ ((uw_object_hdr_t *)c)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x5) = E;
+ ((uw_object_hdr_t *)c)->chain_word_high = (byte)E;
|
- *(char *)((byte *)c + 0x5) = E;
+ ((uw_object_hdr_t *)c)->chain_word_high = (byte)E;
|
- ((char *)c)[0x5] = E;
+ ((uw_object_hdr_t *)c)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x5)
+ (char)((uw_object_hdr_t *)c)->chain_word_high
|
- *(char *)((byte *)c + 0x5)
+ (char)((uw_object_hdr_t *)c)->chain_word_high
|
- ((char *)c)[0x5]
+ (char)((uw_object_hdr_t *)c)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x6) = (char)V;
- *(char *)((char *)c + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)c + 0x6) = (char)V;
- *(byte *)((char *)c + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x6) = (byte)V;
- *(char *)((char *)c + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)c)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)c + 0x6) = (byte)V;
- *(byte *)((char *)c + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)c)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word
|
- *(ushort *)((byte *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word
|
- ((ushort *)c)[0x3]
+ ((uw_object_hdr_t *)c)->link_word
|
- *(ushort *)((ushort *)c + 0x3)
+ ((uw_object_hdr_t *)c)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word_signed
|
- *(short *)((byte *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word_signed
|
- ((short *)c)[0x3]
+ ((uw_object_hdr_t *)c)->link_word_signed
|
- *(short *)((short *)c + 0x3)
+ ((uw_object_hdr_t *)c)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word_low
|
- *(byte *)((byte *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word_low
|
- ((byte *)c)[0x6]
+ ((uw_object_hdr_t *)c)->link_word_low
|
- *(byte *)((ushort *)c + 0x3)
+ ((uw_object_hdr_t *)c)->link_word_low
|
- (byte)((ushort *)c)[0x3]
+ ((uw_object_hdr_t *)c)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word_low
|
- *(undefined1 *)((byte *)c + 0x6)
+ ((uw_object_hdr_t *)c)->link_word_low
|
- ((undefined1 *)c)[0x6]
+ ((uw_object_hdr_t *)c)->link_word_low
|
- *(undefined1 *)((ushort *)c + 0x3)
+ ((uw_object_hdr_t *)c)->link_word_low
|
- (undefined1)((ushort *)c)[0x3]
+ ((uw_object_hdr_t *)c)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x6) = E;
+ ((uw_object_hdr_t *)c)->link_word_low = (byte)E;
|
- *(char *)((byte *)c + 0x6) = E;
+ ((uw_object_hdr_t *)c)->link_word_low = (byte)E;
|
- ((char *)c)[0x6] = E;
+ ((uw_object_hdr_t *)c)->link_word_low = (byte)E;
|
- *(char *)((ushort *)c + 0x3) = E;
+ ((uw_object_hdr_t *)c)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x6)
+ (char)((uw_object_hdr_t *)c)->link_word_low
|
- *(char *)((byte *)c + 0x6)
+ (char)((uw_object_hdr_t *)c)->link_word_low
|
- ((char *)c)[0x6]
+ (char)((uw_object_hdr_t *)c)->link_word_low
|
- *(char *)((ushort *)c + 0x3)
+ (char)((uw_object_hdr_t *)c)->link_word_low
|
- (char)((ushort *)c)[0x3]
+ (char)((uw_object_hdr_t *)c)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)c + 0x7)
+ ((uw_object_hdr_t *)c)->link_word_high
|
- *(byte *)((byte *)c + 0x7)
+ ((uw_object_hdr_t *)c)->link_word_high
|
- ((byte *)c)[0x7]
+ ((uw_object_hdr_t *)c)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)c + 0x7)
+ ((uw_object_hdr_t *)c)->link_word_high
|
- *(undefined1 *)((byte *)c + 0x7)
+ ((uw_object_hdr_t *)c)->link_word_high
|
- ((undefined1 *)c)[0x7]
+ ((uw_object_hdr_t *)c)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x7) = E;
+ ((uw_object_hdr_t *)c)->link_word_high = (byte)E;
|
- *(char *)((byte *)c + 0x7) = E;
+ ((uw_object_hdr_t *)c)->link_word_high = (byte)E;
|
- ((char *)c)[0x7] = E;
+ ((uw_object_hdr_t *)c)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)c + 0x7)
+ (char)((uw_object_hdr_t *)c)->link_word_high
|
- *(char *)((byte *)c + 0x7)
+ (char)((uw_object_hdr_t *)c)->link_word_high
|
- ((char *)c)[0x7]
+ (char)((uw_object_hdr_t *)c)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x0) = (char)V;
- *(char *)((char *)nx + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x0) = (char)V;
- *(byte *)((char *)nx + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x0) = (byte)V;
- *(char *)((char *)nx + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x0) = (byte)V;
- *(byte *)((char *)nx + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags
|
- *(ushort *)((byte *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags
|
- ((ushort *)nx)[0x0]
+ ((uw_object_hdr_t *)nx)->type_flags
|
- *(ushort *)((ushort *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_signed
|
- *(short *)((byte *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_signed
|
- ((short *)nx)[0x0]
+ ((uw_object_hdr_t *)nx)->type_flags_signed
|
- *(short *)((short *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- *(byte *)((byte *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- ((byte *)nx)[0x0]
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- *(byte *)((ushort *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- (byte)((ushort *)nx)[0x0]
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- *(byte *)nx
+ ((uw_object_hdr_t *)nx)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- *(undefined1 *)((byte *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- ((undefined1 *)nx)[0x0]
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- *(undefined1 *)((ushort *)nx + 0x0)
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- (undefined1)((ushort *)nx)[0x0]
+ ((uw_object_hdr_t *)nx)->type_flags_low
|
- *(undefined1 *)nx
+ ((uw_object_hdr_t *)nx)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x0) = E;
+ ((uw_object_hdr_t *)nx)->type_flags_low = (byte)E;
|
- *(char *)((byte *)nx + 0x0) = E;
+ ((uw_object_hdr_t *)nx)->type_flags_low = (byte)E;
|
- ((char *)nx)[0x0] = E;
+ ((uw_object_hdr_t *)nx)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)nx + 0x0) = E;
+ ((uw_object_hdr_t *)nx)->type_flags_low = (byte)E;
|
- *(char *)nx = E;
+ ((uw_object_hdr_t *)nx)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x0)
+ (char)((uw_object_hdr_t *)nx)->type_flags_low
|
- *(char *)((byte *)nx + 0x0)
+ (char)((uw_object_hdr_t *)nx)->type_flags_low
|
- ((char *)nx)[0x0]
+ (char)((uw_object_hdr_t *)nx)->type_flags_low
|
- *(char *)((ushort *)nx + 0x0)
+ (char)((uw_object_hdr_t *)nx)->type_flags_low
|
- (char)((ushort *)nx)[0x0]
+ (char)((uw_object_hdr_t *)nx)->type_flags_low
|
- *(char *)nx
+ (char)((uw_object_hdr_t *)nx)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->type_flags_high
|
- *(byte *)((byte *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->type_flags_high
|
- ((byte *)nx)[0x1]
+ ((uw_object_hdr_t *)nx)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->type_flags_high
|
- *(undefined1 *)((byte *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->type_flags_high
|
- ((undefined1 *)nx)[0x1]
+ ((uw_object_hdr_t *)nx)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x1) = E;
+ ((uw_object_hdr_t *)nx)->type_flags_high = (byte)E;
|
- *(char *)((byte *)nx + 0x1) = E;
+ ((uw_object_hdr_t *)nx)->type_flags_high = (byte)E;
|
- ((char *)nx)[0x1] = E;
+ ((uw_object_hdr_t *)nx)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x1)
+ (char)((uw_object_hdr_t *)nx)->type_flags_high
|
- *(char *)((byte *)nx + 0x1)
+ (char)((uw_object_hdr_t *)nx)->type_flags_high
|
- ((char *)nx)[0x1]
+ (char)((uw_object_hdr_t *)nx)->type_flags_high
)
...>
}


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x2) = (char)V;
- *(char *)((char *)nx + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x2) = (char)V;
- *(byte *)((char *)nx + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x2) = (byte)V;
- *(char *)((char *)nx + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x2) = (byte)V;
- *(byte *)((char *)nx + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word
|
- *(ushort *)((byte *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word
|
- ((ushort *)nx)[0x1]
+ ((uw_object_hdr_t *)nx)->position_word
|
- *(ushort *)((ushort *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->position_word
)
...>
}


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word_signed
|
- *(short *)((byte *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word_signed
|
- ((short *)nx)[0x1]
+ ((uw_object_hdr_t *)nx)->position_word_signed
|
- *(short *)((short *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->position_word_signed
)
...>
}


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- *(byte *)((byte *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- ((byte *)nx)[0x2]
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- *(byte *)((ushort *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- (byte)((ushort *)nx)[0x1]
+ ((uw_object_hdr_t *)nx)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- *(undefined1 *)((byte *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- ((undefined1 *)nx)[0x2]
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- *(undefined1 *)((ushort *)nx + 0x1)
+ ((uw_object_hdr_t *)nx)->position_word_low
|
- (undefined1)((ushort *)nx)[0x1]
+ ((uw_object_hdr_t *)nx)->position_word_low
)
...>
}


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x2) = E;
+ ((uw_object_hdr_t *)nx)->position_word_low = (byte)E;
|
- *(char *)((byte *)nx + 0x2) = E;
+ ((uw_object_hdr_t *)nx)->position_word_low = (byte)E;
|
- ((char *)nx)[0x2] = E;
+ ((uw_object_hdr_t *)nx)->position_word_low = (byte)E;
|
- *(char *)((ushort *)nx + 0x1) = E;
+ ((uw_object_hdr_t *)nx)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x2)
+ (char)((uw_object_hdr_t *)nx)->position_word_low
|
- *(char *)((byte *)nx + 0x2)
+ (char)((uw_object_hdr_t *)nx)->position_word_low
|
- ((char *)nx)[0x2]
+ (char)((uw_object_hdr_t *)nx)->position_word_low
|
- *(char *)((ushort *)nx + 0x1)
+ (char)((uw_object_hdr_t *)nx)->position_word_low
|
- (char)((ushort *)nx)[0x1]
+ (char)((uw_object_hdr_t *)nx)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->position_word_high
|
- *(byte *)((byte *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->position_word_high
|
- ((byte *)nx)[0x3]
+ ((uw_object_hdr_t *)nx)->position_word_high
)
...>
}


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->position_word_high
|
- *(undefined1 *)((byte *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->position_word_high
|
- ((undefined1 *)nx)[0x3]
+ ((uw_object_hdr_t *)nx)->position_word_high
)
...>
}


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x3) = E;
+ ((uw_object_hdr_t *)nx)->position_word_high = (byte)E;
|
- *(char *)((byte *)nx + 0x3) = E;
+ ((uw_object_hdr_t *)nx)->position_word_high = (byte)E;
|
- ((char *)nx)[0x3] = E;
+ ((uw_object_hdr_t *)nx)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x3)
+ (char)((uw_object_hdr_t *)nx)->position_word_high
|
- *(char *)((byte *)nx + 0x3)
+ (char)((uw_object_hdr_t *)nx)->position_word_high
|
- ((char *)nx)[0x3]
+ (char)((uw_object_hdr_t *)nx)->position_word_high
)
...>
}


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x4) = (char)V;
- *(char *)((char *)nx + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x4) = (char)V;
- *(byte *)((char *)nx + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x4) = (byte)V;
- *(char *)((char *)nx + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x4) = (byte)V;
- *(byte *)((char *)nx + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word
|
- *(ushort *)((byte *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word
|
- ((ushort *)nx)[0x2]
+ ((uw_object_hdr_t *)nx)->chain_word
|
- *(ushort *)((ushort *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->chain_word
)
...>
}


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word_signed
|
- *(short *)((byte *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word_signed
|
- ((short *)nx)[0x2]
+ ((uw_object_hdr_t *)nx)->chain_word_signed
|
- *(short *)((short *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->chain_word_signed
)
...>
}


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- *(byte *)((byte *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- ((byte *)nx)[0x4]
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- *(byte *)((ushort *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- (byte)((ushort *)nx)[0x2]
+ ((uw_object_hdr_t *)nx)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- *(undefined1 *)((byte *)nx + 0x4)
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- ((undefined1 *)nx)[0x4]
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- *(undefined1 *)((ushort *)nx + 0x2)
+ ((uw_object_hdr_t *)nx)->chain_word_low
|
- (undefined1)((ushort *)nx)[0x2]
+ ((uw_object_hdr_t *)nx)->chain_word_low
)
...>
}


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x4) = E;
+ ((uw_object_hdr_t *)nx)->chain_word_low = (byte)E;
|
- *(char *)((byte *)nx + 0x4) = E;
+ ((uw_object_hdr_t *)nx)->chain_word_low = (byte)E;
|
- ((char *)nx)[0x4] = E;
+ ((uw_object_hdr_t *)nx)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)nx + 0x2) = E;
+ ((uw_object_hdr_t *)nx)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x4)
+ (char)((uw_object_hdr_t *)nx)->chain_word_low
|
- *(char *)((byte *)nx + 0x4)
+ (char)((uw_object_hdr_t *)nx)->chain_word_low
|
- ((char *)nx)[0x4]
+ (char)((uw_object_hdr_t *)nx)->chain_word_low
|
- *(char *)((ushort *)nx + 0x2)
+ (char)((uw_object_hdr_t *)nx)->chain_word_low
|
- (char)((ushort *)nx)[0x2]
+ (char)((uw_object_hdr_t *)nx)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x5)
+ ((uw_object_hdr_t *)nx)->chain_word_high
|
- *(byte *)((byte *)nx + 0x5)
+ ((uw_object_hdr_t *)nx)->chain_word_high
|
- ((byte *)nx)[0x5]
+ ((uw_object_hdr_t *)nx)->chain_word_high
)
...>
}


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x5)
+ ((uw_object_hdr_t *)nx)->chain_word_high
|
- *(undefined1 *)((byte *)nx + 0x5)
+ ((uw_object_hdr_t *)nx)->chain_word_high
|
- ((undefined1 *)nx)[0x5]
+ ((uw_object_hdr_t *)nx)->chain_word_high
)
...>
}


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x5) = E;
+ ((uw_object_hdr_t *)nx)->chain_word_high = (byte)E;
|
- *(char *)((byte *)nx + 0x5) = E;
+ ((uw_object_hdr_t *)nx)->chain_word_high = (byte)E;
|
- ((char *)nx)[0x5] = E;
+ ((uw_object_hdr_t *)nx)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x5)
+ (char)((uw_object_hdr_t *)nx)->chain_word_high
|
- *(char *)((byte *)nx + 0x5)
+ (char)((uw_object_hdr_t *)nx)->chain_word_high
|
- ((char *)nx)[0x5]
+ (char)((uw_object_hdr_t *)nx)->chain_word_high
)
...>
}


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x6) = (char)V;
- *(char *)((char *)nx + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nx + 0x6) = (char)V;
- *(byte *)((char *)nx + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x6) = (byte)V;
- *(char *)((char *)nx + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nx)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nx + 0x6) = (byte)V;
- *(byte *)((char *)nx + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nx)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word
|
- *(ushort *)((byte *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word
|
- ((ushort *)nx)[0x3]
+ ((uw_object_hdr_t *)nx)->link_word
|
- *(ushort *)((ushort *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->link_word
)
...>
}


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word_signed
|
- *(short *)((byte *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word_signed
|
- ((short *)nx)[0x3]
+ ((uw_object_hdr_t *)nx)->link_word_signed
|
- *(short *)((short *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->link_word_signed
)
...>
}


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- *(byte *)((byte *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- ((byte *)nx)[0x6]
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- *(byte *)((ushort *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- (byte)((ushort *)nx)[0x3]
+ ((uw_object_hdr_t *)nx)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- *(undefined1 *)((byte *)nx + 0x6)
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- ((undefined1 *)nx)[0x6]
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- *(undefined1 *)((ushort *)nx + 0x3)
+ ((uw_object_hdr_t *)nx)->link_word_low
|
- (undefined1)((ushort *)nx)[0x3]
+ ((uw_object_hdr_t *)nx)->link_word_low
)
...>
}


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x6) = E;
+ ((uw_object_hdr_t *)nx)->link_word_low = (byte)E;
|
- *(char *)((byte *)nx + 0x6) = E;
+ ((uw_object_hdr_t *)nx)->link_word_low = (byte)E;
|
- ((char *)nx)[0x6] = E;
+ ((uw_object_hdr_t *)nx)->link_word_low = (byte)E;
|
- *(char *)((ushort *)nx + 0x3) = E;
+ ((uw_object_hdr_t *)nx)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x6)
+ (char)((uw_object_hdr_t *)nx)->link_word_low
|
- *(char *)((byte *)nx + 0x6)
+ (char)((uw_object_hdr_t *)nx)->link_word_low
|
- ((char *)nx)[0x6]
+ (char)((uw_object_hdr_t *)nx)->link_word_low
|
- *(char *)((ushort *)nx + 0x3)
+ (char)((uw_object_hdr_t *)nx)->link_word_low
|
- (char)((ushort *)nx)[0x3]
+ (char)((uw_object_hdr_t *)nx)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nx + 0x7)
+ ((uw_object_hdr_t *)nx)->link_word_high
|
- *(byte *)((byte *)nx + 0x7)
+ ((uw_object_hdr_t *)nx)->link_word_high
|
- ((byte *)nx)[0x7]
+ ((uw_object_hdr_t *)nx)->link_word_high
)
...>
}


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nx + 0x7)
+ ((uw_object_hdr_t *)nx)->link_word_high
|
- *(undefined1 *)((byte *)nx + 0x7)
+ ((uw_object_hdr_t *)nx)->link_word_high
|
- ((undefined1 *)nx)[0x7]
+ ((uw_object_hdr_t *)nx)->link_word_high
)
...>
}


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x7) = E;
+ ((uw_object_hdr_t *)nx)->link_word_high = (byte)E;
|
- *(char *)((byte *)nx + 0x7) = E;
+ ((uw_object_hdr_t *)nx)->link_word_high = (byte)E;
|
- ((char *)nx)[0x7] = E;
+ ((uw_object_hdr_t *)nx)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nx + 0x7)
+ (char)((uw_object_hdr_t *)nx)->link_word_high
|
- *(char *)((byte *)nx + 0x7)
+ (char)((uw_object_hdr_t *)nx)->link_word_high
|
- ((char *)nx)[0x7]
+ (char)((uw_object_hdr_t *)nx)->link_word_high
)
...>
}


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x0) = (char)V;
- *(char *)((char *)nc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x0) = (char)V;
- *(byte *)((char *)nc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x0) = (byte)V;
- *(char *)((char *)nc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x0) = (byte)V;
- *(byte *)((char *)nc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags
|
- *(ushort *)((byte *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags
|
- ((ushort *)nc)[0x0]
+ ((uw_object_hdr_t *)nc)->type_flags
|
- *(ushort *)((ushort *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_signed
|
- *(short *)((byte *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_signed
|
- ((short *)nc)[0x0]
+ ((uw_object_hdr_t *)nc)->type_flags_signed
|
- *(short *)((short *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- *(byte *)((byte *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- ((byte *)nc)[0x0]
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- *(byte *)((ushort *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- (byte)((ushort *)nc)[0x0]
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- *(byte *)nc
+ ((uw_object_hdr_t *)nc)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- *(undefined1 *)((byte *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- ((undefined1 *)nc)[0x0]
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- *(undefined1 *)((ushort *)nc + 0x0)
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- (undefined1)((ushort *)nc)[0x0]
+ ((uw_object_hdr_t *)nc)->type_flags_low
|
- *(undefined1 *)nc
+ ((uw_object_hdr_t *)nc)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x0) = E;
+ ((uw_object_hdr_t *)nc)->type_flags_low = (byte)E;
|
- *(char *)((byte *)nc + 0x0) = E;
+ ((uw_object_hdr_t *)nc)->type_flags_low = (byte)E;
|
- ((char *)nc)[0x0] = E;
+ ((uw_object_hdr_t *)nc)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)nc + 0x0) = E;
+ ((uw_object_hdr_t *)nc)->type_flags_low = (byte)E;
|
- *(char *)nc = E;
+ ((uw_object_hdr_t *)nc)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x0)
+ (char)((uw_object_hdr_t *)nc)->type_flags_low
|
- *(char *)((byte *)nc + 0x0)
+ (char)((uw_object_hdr_t *)nc)->type_flags_low
|
- ((char *)nc)[0x0]
+ (char)((uw_object_hdr_t *)nc)->type_flags_low
|
- *(char *)((ushort *)nc + 0x0)
+ (char)((uw_object_hdr_t *)nc)->type_flags_low
|
- (char)((ushort *)nc)[0x0]
+ (char)((uw_object_hdr_t *)nc)->type_flags_low
|
- *(char *)nc
+ (char)((uw_object_hdr_t *)nc)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->type_flags_high
|
- *(byte *)((byte *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->type_flags_high
|
- ((byte *)nc)[0x1]
+ ((uw_object_hdr_t *)nc)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->type_flags_high
|
- *(undefined1 *)((byte *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->type_flags_high
|
- ((undefined1 *)nc)[0x1]
+ ((uw_object_hdr_t *)nc)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x1) = E;
+ ((uw_object_hdr_t *)nc)->type_flags_high = (byte)E;
|
- *(char *)((byte *)nc + 0x1) = E;
+ ((uw_object_hdr_t *)nc)->type_flags_high = (byte)E;
|
- ((char *)nc)[0x1] = E;
+ ((uw_object_hdr_t *)nc)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x1)
+ (char)((uw_object_hdr_t *)nc)->type_flags_high
|
- *(char *)((byte *)nc + 0x1)
+ (char)((uw_object_hdr_t *)nc)->type_flags_high
|
- ((char *)nc)[0x1]
+ (char)((uw_object_hdr_t *)nc)->type_flags_high
)
...>
}


@receiver_5_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x2) = (char)V;
- *(char *)((char *)nc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x2) = (char)V;
- *(byte *)((char *)nc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x2) = (byte)V;
- *(char *)((char *)nc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x2) = (byte)V;
- *(byte *)((char *)nc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word
|
- *(ushort *)((byte *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word
|
- ((ushort *)nc)[0x1]
+ ((uw_object_hdr_t *)nc)->position_word
|
- *(ushort *)((ushort *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->position_word
)
...>
}


@receiver_5_w_2_14_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word_signed
|
- *(short *)((byte *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word_signed
|
- ((short *)nc)[0x1]
+ ((uw_object_hdr_t *)nc)->position_word_signed
|
- *(short *)((short *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->position_word_signed
)
...>
}


@receiver_5_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- *(byte *)((byte *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- ((byte *)nc)[0x2]
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- *(byte *)((ushort *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- (byte)((ushort *)nc)[0x1]
+ ((uw_object_hdr_t *)nc)->position_word_low
)
...>
}


@receiver_5_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- *(undefined1 *)((byte *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- ((undefined1 *)nc)[0x2]
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- *(undefined1 *)((ushort *)nc + 0x1)
+ ((uw_object_hdr_t *)nc)->position_word_low
|
- (undefined1)((ushort *)nc)[0x1]
+ ((uw_object_hdr_t *)nc)->position_word_low
)
...>
}


@receiver_5_w_2_14_store_2@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x2) = E;
+ ((uw_object_hdr_t *)nc)->position_word_low = (byte)E;
|
- *(char *)((byte *)nc + 0x2) = E;
+ ((uw_object_hdr_t *)nc)->position_word_low = (byte)E;
|
- ((char *)nc)[0x2] = E;
+ ((uw_object_hdr_t *)nc)->position_word_low = (byte)E;
|
- *(char *)((ushort *)nc + 0x1) = E;
+ ((uw_object_hdr_t *)nc)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x2)
+ (char)((uw_object_hdr_t *)nc)->position_word_low
|
- *(char *)((byte *)nc + 0x2)
+ (char)((uw_object_hdr_t *)nc)->position_word_low
|
- ((char *)nc)[0x2]
+ (char)((uw_object_hdr_t *)nc)->position_word_low
|
- *(char *)((ushort *)nc + 0x1)
+ (char)((uw_object_hdr_t *)nc)->position_word_low
|
- (char)((ushort *)nc)[0x1]
+ (char)((uw_object_hdr_t *)nc)->position_word_low
)
...>
}


@receiver_5_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->position_word_high
|
- *(byte *)((byte *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->position_word_high
|
- ((byte *)nc)[0x3]
+ ((uw_object_hdr_t *)nc)->position_word_high
)
...>
}


@receiver_5_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->position_word_high
|
- *(undefined1 *)((byte *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->position_word_high
|
- ((undefined1 *)nc)[0x3]
+ ((uw_object_hdr_t *)nc)->position_word_high
)
...>
}


@receiver_5_w_2_14_store_3@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x3) = E;
+ ((uw_object_hdr_t *)nc)->position_word_high = (byte)E;
|
- *(char *)((byte *)nc + 0x3) = E;
+ ((uw_object_hdr_t *)nc)->position_word_high = (byte)E;
|
- ((char *)nc)[0x3] = E;
+ ((uw_object_hdr_t *)nc)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x3)
+ (char)((uw_object_hdr_t *)nc)->position_word_high
|
- *(char *)((byte *)nc + 0x3)
+ (char)((uw_object_hdr_t *)nc)->position_word_high
|
- ((char *)nc)[0x3]
+ (char)((uw_object_hdr_t *)nc)->position_word_high
)
...>
}


@receiver_5_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x4) = (char)V;
- *(char *)((char *)nc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x4) = (char)V;
- *(byte *)((char *)nc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x4) = (byte)V;
- *(char *)((char *)nc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x4) = (byte)V;
- *(byte *)((char *)nc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word
|
- *(ushort *)((byte *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word
|
- ((ushort *)nc)[0x2]
+ ((uw_object_hdr_t *)nc)->chain_word
|
- *(ushort *)((ushort *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->chain_word
)
...>
}


@receiver_5_w_4_28_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word_signed
|
- *(short *)((byte *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word_signed
|
- ((short *)nc)[0x2]
+ ((uw_object_hdr_t *)nc)->chain_word_signed
|
- *(short *)((short *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->chain_word_signed
)
...>
}


@receiver_5_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- *(byte *)((byte *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- ((byte *)nc)[0x4]
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- *(byte *)((ushort *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- (byte)((ushort *)nc)[0x2]
+ ((uw_object_hdr_t *)nc)->chain_word_low
)
...>
}


@receiver_5_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- *(undefined1 *)((byte *)nc + 0x4)
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- ((undefined1 *)nc)[0x4]
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- *(undefined1 *)((ushort *)nc + 0x2)
+ ((uw_object_hdr_t *)nc)->chain_word_low
|
- (undefined1)((ushort *)nc)[0x2]
+ ((uw_object_hdr_t *)nc)->chain_word_low
)
...>
}


@receiver_5_w_4_28_store_4@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x4) = E;
+ ((uw_object_hdr_t *)nc)->chain_word_low = (byte)E;
|
- *(char *)((byte *)nc + 0x4) = E;
+ ((uw_object_hdr_t *)nc)->chain_word_low = (byte)E;
|
- ((char *)nc)[0x4] = E;
+ ((uw_object_hdr_t *)nc)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)nc + 0x2) = E;
+ ((uw_object_hdr_t *)nc)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x4)
+ (char)((uw_object_hdr_t *)nc)->chain_word_low
|
- *(char *)((byte *)nc + 0x4)
+ (char)((uw_object_hdr_t *)nc)->chain_word_low
|
- ((char *)nc)[0x4]
+ (char)((uw_object_hdr_t *)nc)->chain_word_low
|
- *(char *)((ushort *)nc + 0x2)
+ (char)((uw_object_hdr_t *)nc)->chain_word_low
|
- (char)((ushort *)nc)[0x2]
+ (char)((uw_object_hdr_t *)nc)->chain_word_low
)
...>
}


@receiver_5_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x5)
+ ((uw_object_hdr_t *)nc)->chain_word_high
|
- *(byte *)((byte *)nc + 0x5)
+ ((uw_object_hdr_t *)nc)->chain_word_high
|
- ((byte *)nc)[0x5]
+ ((uw_object_hdr_t *)nc)->chain_word_high
)
...>
}


@receiver_5_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x5)
+ ((uw_object_hdr_t *)nc)->chain_word_high
|
- *(undefined1 *)((byte *)nc + 0x5)
+ ((uw_object_hdr_t *)nc)->chain_word_high
|
- ((undefined1 *)nc)[0x5]
+ ((uw_object_hdr_t *)nc)->chain_word_high
)
...>
}


@receiver_5_w_4_28_store_5@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x5) = E;
+ ((uw_object_hdr_t *)nc)->chain_word_high = (byte)E;
|
- *(char *)((byte *)nc + 0x5) = E;
+ ((uw_object_hdr_t *)nc)->chain_word_high = (byte)E;
|
- ((char *)nc)[0x5] = E;
+ ((uw_object_hdr_t *)nc)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x5)
+ (char)((uw_object_hdr_t *)nc)->chain_word_high
|
- *(char *)((byte *)nc + 0x5)
+ (char)((uw_object_hdr_t *)nc)->chain_word_high
|
- ((char *)nc)[0x5]
+ (char)((uw_object_hdr_t *)nc)->chain_word_high
)
...>
}


@receiver_5_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x6) = (char)V;
- *(char *)((char *)nc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)nc + 0x6) = (char)V;
- *(byte *)((char *)nc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x6) = (byte)V;
- *(char *)((char *)nc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)nc)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)nc + 0x6) = (byte)V;
- *(byte *)((char *)nc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)nc)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_word_ushort@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word
|
- *(ushort *)((byte *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word
|
- ((ushort *)nc)[0x3]
+ ((uw_object_hdr_t *)nc)->link_word
|
- *(ushort *)((ushort *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->link_word
)
...>
}


@receiver_5_w_6_42_word_short@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word_signed
|
- *(short *)((byte *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word_signed
|
- ((short *)nc)[0x3]
+ ((uw_object_hdr_t *)nc)->link_word_signed
|
- *(short *)((short *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->link_word_signed
)
...>
}


@receiver_5_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- *(byte *)((byte *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- ((byte *)nc)[0x6]
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- *(byte *)((ushort *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- (byte)((ushort *)nc)[0x3]
+ ((uw_object_hdr_t *)nc)->link_word_low
)
...>
}


@receiver_5_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- *(undefined1 *)((byte *)nc + 0x6)
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- ((undefined1 *)nc)[0x6]
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- *(undefined1 *)((ushort *)nc + 0x3)
+ ((uw_object_hdr_t *)nc)->link_word_low
|
- (undefined1)((ushort *)nc)[0x3]
+ ((uw_object_hdr_t *)nc)->link_word_low
)
...>
}


@receiver_5_w_6_42_store_6@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x6) = E;
+ ((uw_object_hdr_t *)nc)->link_word_low = (byte)E;
|
- *(char *)((byte *)nc + 0x6) = E;
+ ((uw_object_hdr_t *)nc)->link_word_low = (byte)E;
|
- ((char *)nc)[0x6] = E;
+ ((uw_object_hdr_t *)nc)->link_word_low = (byte)E;
|
- *(char *)((ushort *)nc + 0x3) = E;
+ ((uw_object_hdr_t *)nc)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x6)
+ (char)((uw_object_hdr_t *)nc)->link_word_low
|
- *(char *)((byte *)nc + 0x6)
+ (char)((uw_object_hdr_t *)nc)->link_word_low
|
- ((char *)nc)[0x6]
+ (char)((uw_object_hdr_t *)nc)->link_word_low
|
- *(char *)((ushort *)nc + 0x3)
+ (char)((uw_object_hdr_t *)nc)->link_word_low
|
- (char)((ushort *)nc)[0x3]
+ (char)((uw_object_hdr_t *)nc)->link_word_low
)
...>
}


@receiver_5_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)nc + 0x7)
+ ((uw_object_hdr_t *)nc)->link_word_high
|
- *(byte *)((byte *)nc + 0x7)
+ ((uw_object_hdr_t *)nc)->link_word_high
|
- ((byte *)nc)[0x7]
+ ((uw_object_hdr_t *)nc)->link_word_high
)
...>
}


@receiver_5_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)nc + 0x7)
+ ((uw_object_hdr_t *)nc)->link_word_high
|
- *(undefined1 *)((byte *)nc + 0x7)
+ ((uw_object_hdr_t *)nc)->link_word_high
|
- ((undefined1 *)nc)[0x7]
+ ((uw_object_hdr_t *)nc)->link_word_high
)
...>
}


@receiver_5_w_6_42_store_7@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x7) = E;
+ ((uw_object_hdr_t *)nc)->link_word_high = (byte)E;
|
- *(char *)((byte *)nc + 0x7) = E;
+ ((uw_object_hdr_t *)nc)->link_word_high = (byte)E;
|
- ((char *)nc)[0x7] = E;
+ ((uw_object_hdr_t *)nc)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(demomode_pump\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)nc + 0x7)
+ (char)((uw_object_hdr_t *)nc)->link_word_high
|
- *(char *)((byte *)nc + 0x7)
+ (char)((uw_object_hdr_t *)nc)->link_word_high
|
- ((char *)nc)[0x7]
+ (char)((uw_object_hdr_t *)nc)->link_word_high
)
...>
}
