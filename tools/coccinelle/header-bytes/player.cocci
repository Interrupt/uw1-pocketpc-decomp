@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x0) = (char)V;
- *(char *)((char *)puVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x0) = (char)V;
- *(byte *)((char *)puVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x0) = (byte)V;
- *(char *)((char *)puVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x0) = (byte)V;
- *(byte *)((char *)puVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(ushort *)((byte *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- ((ushort *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(ushort *)((ushort *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_signed
|
- *(short *)((byte *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_signed
|
- ((short *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_signed
|
- *(short *)((short *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(byte *)((byte *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- ((byte *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(byte *)((ushort *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- (byte)((ushort *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(byte *)puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(undefined1 *)((byte *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- ((undefined1 *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- (undefined1)((ushort *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(undefined1 *)puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)E;
|
- ((char *)puVar5)[0x0] = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)E;
|
- *(char *)puVar5 = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x0)
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(char *)((byte *)puVar5 + 0x0)
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
|
- ((char *)puVar5)[0x0]
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(char *)((ushort *)puVar5 + 0x0)
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
|
- (char)((ushort *)puVar5)[0x0]
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
|
- *(char *)puVar5
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->type_flags_high
|
- *(byte *)((byte *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->type_flags_high
|
- ((byte *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->type_flags_high
|
- *(undefined1 *)((byte *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->type_flags_high
|
- ((undefined1 *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)E;
|
- ((char *)puVar5)[0x1] = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x1)
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_high
|
- *(char *)((byte *)puVar5 + 0x1)
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_high
|
- ((char *)puVar5)[0x1]
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x2) = (char)V;
- *(char *)((char *)puVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x2) = (char)V;
- *(byte *)((char *)puVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x2) = (byte)V;
- *(char *)((char *)puVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x2) = (byte)V;
- *(byte *)((char *)puVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- *(ushort *)((byte *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- ((ushort *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- *(ushort *)((ushort *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word_signed
|
- *(short *)((byte *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word_signed
|
- ((short *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word_signed
|
- *(short *)((short *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- *(byte *)((byte *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- ((byte *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- *(byte *)((ushort *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- (byte)((ushort *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- *(undefined1 *)((byte *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- ((undefined1 *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- *(undefined1 *)((ushort *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- (undefined1)((ushort *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_low = (byte)E;
|
- ((char *)puVar5)[0x2] = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x2)
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
|
- *(char *)((byte *)puVar5 + 0x2)
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
|
- ((char *)puVar5)[0x2]
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
|
- *(char *)((ushort *)puVar5 + 0x1)
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
|
- (char)((ushort *)puVar5)[0x1]
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->position_word_high
|
- *(byte *)((byte *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->position_word_high
|
- ((byte *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->position_word_high
|
- *(undefined1 *)((byte *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->position_word_high
|
- ((undefined1 *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)E;
|
- ((char *)puVar5)[0x3] = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x3)
+ (char)((uw_object_hdr_t *)puVar5)->position_word_high
|
- *(char *)((byte *)puVar5 + 0x3)
+ (char)((uw_object_hdr_t *)puVar5)->position_word_high
|
- ((char *)puVar5)[0x3]
+ (char)((uw_object_hdr_t *)puVar5)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x4) = (char)V;
- *(char *)((char *)puVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x4) = (char)V;
- *(byte *)((char *)puVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x4) = (byte)V;
- *(char *)((char *)puVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x4) = (byte)V;
- *(byte *)((char *)puVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- *(ushort *)((byte *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- ((ushort *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- *(ushort *)((ushort *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word_signed
|
- *(short *)((byte *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word_signed
|
- ((short *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word_signed
|
- *(short *)((short *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- *(byte *)((byte *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- ((byte *)puVar5)[0x4]
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- *(byte *)((ushort *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- (byte)((ushort *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- *(undefined1 *)((byte *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- ((undefined1 *)puVar5)[0x4]
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- (undefined1)((ushort *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_low = (byte)E;
|
- ((char *)puVar5)[0x4] = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x4)
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
|
- *(char *)((byte *)puVar5 + 0x4)
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
|
- ((char *)puVar5)[0x4]
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
|
- *(char *)((ushort *)puVar5 + 0x2)
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
|
- (char)((ushort *)puVar5)[0x2]
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x5)
+ ((uw_object_hdr_t *)puVar5)->chain_word_high
|
- *(byte *)((byte *)puVar5 + 0x5)
+ ((uw_object_hdr_t *)puVar5)->chain_word_high
|
- ((byte *)puVar5)[0x5]
+ ((uw_object_hdr_t *)puVar5)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x5)
+ ((uw_object_hdr_t *)puVar5)->chain_word_high
|
- *(undefined1 *)((byte *)puVar5 + 0x5)
+ ((uw_object_hdr_t *)puVar5)->chain_word_high
|
- ((undefined1 *)puVar5)[0x5]
+ ((uw_object_hdr_t *)puVar5)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_high = (byte)E;
|
- ((char *)puVar5)[0x5] = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x5)
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_high
|
- *(char *)((byte *)puVar5 + 0x5)
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_high
|
- ((char *)puVar5)[0x5]
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x6) = (char)V;
- *(char *)((char *)puVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar5 + 0x6) = (char)V;
- *(byte *)((char *)puVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x6) = (byte)V;
- *(char *)((char *)puVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar5 + 0x6) = (byte)V;
- *(byte *)((char *)puVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar5)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- *(ushort *)((byte *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- ((ushort *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- *(ushort *)((ushort *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word_signed
|
- *(short *)((byte *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word_signed
|
- ((short *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word_signed
|
- *(short *)((short *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- *(byte *)((byte *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- ((byte *)puVar5)[0x6]
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- *(byte *)((ushort *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- (byte)((ushort *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- *(undefined1 *)((byte *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- ((undefined1 *)puVar5)[0x6]
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- *(undefined1 *)((ushort *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- (undefined1)((ushort *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)E;
|
- ((char *)puVar5)[0x6] = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x6)
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
|
- *(char *)((byte *)puVar5 + 0x6)
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
|
- ((char *)puVar5)[0x6]
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
|
- *(char *)((ushort *)puVar5 + 0x3)
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
|
- (char)((ushort *)puVar5)[0x3]
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar5 + 0x7)
+ ((uw_object_hdr_t *)puVar5)->link_word_high
|
- *(byte *)((byte *)puVar5 + 0x7)
+ ((uw_object_hdr_t *)puVar5)->link_word_high
|
- ((byte *)puVar5)[0x7]
+ ((uw_object_hdr_t *)puVar5)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar5 + 0x7)
+ ((uw_object_hdr_t *)puVar5)->link_word_high
|
- *(undefined1 *)((byte *)puVar5 + 0x7)
+ ((uw_object_hdr_t *)puVar5)->link_word_high
|
- ((undefined1 *)puVar5)[0x7]
+ ((uw_object_hdr_t *)puVar5)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_high = (byte)E;
|
- ((char *)puVar5)[0x7] = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar5 + 0x7)
+ (char)((uw_object_hdr_t *)puVar5)->link_word_high
|
- *(char *)((byte *)puVar5 + 0x7)
+ (char)((uw_object_hdr_t *)puVar5)->link_word_high
|
- ((char *)puVar5)[0x7]
+ (char)((uw_object_hdr_t *)puVar5)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x0) = (char)V;
- *(char *)((char *)pNewObj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x0) = (char)V;
- *(byte *)((char *)pNewObj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x0) = (byte)V;
- *(char *)((char *)pNewObj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x0) = (byte)V;
- *(byte *)((char *)pNewObj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(ushort *)((byte *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- ((ushort *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(ushort *)((ushort *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_signed
|
- *(short *)((byte *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_signed
|
- ((short *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_signed
|
- *(short *)((short *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(byte *)((byte *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- ((byte *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(byte *)((ushort *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- (byte)((ushort *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(byte *)pNewObj
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(undefined1 *)((byte *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- ((undefined1 *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(undefined1 *)((ushort *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- (undefined1)((ushort *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(undefined1 *)pNewObj
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x0) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x0) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
|
- ((char *)pNewObj)[0x0] = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pNewObj + 0x0) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
|
- *(char *)pNewObj = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x0)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(char *)((byte *)pNewObj + 0x0)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- ((char *)pNewObj)[0x0]
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(char *)((ushort *)pNewObj + 0x0)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- (char)((ushort *)pNewObj)[0x0]
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *(char *)pNewObj
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- *(byte *)((byte *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- ((byte *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- *(undefined1 *)((byte *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- ((undefined1 *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x1) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x1) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high = (byte)E;
|
- ((char *)pNewObj)[0x1] = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x1)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- *(char *)((byte *)pNewObj + 0x1)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- ((char *)pNewObj)[0x1]
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x2) = (char)V;
- *(char *)((char *)pNewObj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x2) = (char)V;
- *(byte *)((char *)pNewObj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x2) = (byte)V;
- *(char *)((char *)pNewObj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x2) = (byte)V;
- *(byte *)((char *)pNewObj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- *(ushort *)((byte *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- ((ushort *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- *(ushort *)((ushort *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->position_word
)
...>
}


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_signed
|
- *(short *)((byte *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_signed
|
- ((short *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->position_word_signed
|
- *(short *)((short *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->position_word_signed
)
...>
}


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- *(byte *)((byte *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- ((byte *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- *(byte *)((ushort *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- (byte)((ushort *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- *(undefined1 *)((byte *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- ((undefined1 *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- *(undefined1 *)((ushort *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
|
- (undefined1)((ushort *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x2) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_low = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x2) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_low = (byte)E;
|
- ((char *)pNewObj)[0x2] = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pNewObj + 0x1) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x2)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
|
- *(char *)((byte *)pNewObj + 0x2)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
|
- ((char *)pNewObj)[0x2]
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
|
- *(char *)((ushort *)pNewObj + 0x1)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
|
- (char)((ushort *)pNewObj)[0x1]
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
|
- *(byte *)((byte *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
|
- ((byte *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
|
- *(undefined1 *)((byte *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
|
- ((undefined1 *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x3) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x3) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)E;
|
- ((char *)pNewObj)[0x3] = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x3)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_high
|
- *(char *)((byte *)pNewObj + 0x3)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_high
|
- ((char *)pNewObj)[0x3]
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x4) = (char)V;
- *(char *)((char *)pNewObj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x4) = (char)V;
- *(byte *)((char *)pNewObj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x4) = (byte)V;
- *(char *)((char *)pNewObj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x4) = (byte)V;
- *(byte *)((char *)pNewObj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- *(ushort *)((byte *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- ((ushort *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- *(ushort *)((ushort *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
)
...>
}


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_signed
|
- *(short *)((byte *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_signed
|
- ((short *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_signed
|
- *(short *)((short *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_signed
)
...>
}


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- *(byte *)((byte *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- ((byte *)pNewObj)[0x4]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- *(byte *)((ushort *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- (byte)((ushort *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- *(undefined1 *)((byte *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- ((undefined1 *)pNewObj)[0x4]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- *(undefined1 *)((ushort *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- (undefined1)((ushort *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x4) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x4) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low = (byte)E;
|
- ((char *)pNewObj)[0x4] = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pNewObj + 0x2) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x4)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- *(char *)((byte *)pNewObj + 0x4)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- ((char *)pNewObj)[0x4]
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- *(char *)((ushort *)pNewObj + 0x2)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- (char)((ushort *)pNewObj)[0x2]
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x5)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- *(byte *)((byte *)pNewObj + 0x5)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- ((byte *)pNewObj)[0x5]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x5)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- *(undefined1 *)((byte *)pNewObj + 0x5)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- ((undefined1 *)pNewObj)[0x5]
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x5) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x5) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high = (byte)E;
|
- ((char *)pNewObj)[0x5] = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x5)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- *(char *)((byte *)pNewObj + 0x5)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- ((char *)pNewObj)[0x5]
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x6) = (char)V;
- *(char *)((char *)pNewObj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pNewObj + 0x6) = (char)V;
- *(byte *)((char *)pNewObj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x6) = (byte)V;
- *(char *)((char *)pNewObj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pNewObj + 0x6) = (byte)V;
- *(byte *)((char *)pNewObj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pNewObj)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- *(ushort *)((byte *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- ((ushort *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- *(ushort *)((ushort *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->link_word
)
...>
}


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_signed
|
- *(short *)((byte *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_signed
|
- ((short *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->link_word_signed
|
- *(short *)((short *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->link_word_signed
)
...>
}


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- *(byte *)((byte *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- ((byte *)pNewObj)[0x6]
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- *(byte *)((ushort *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- (byte)((ushort *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- *(undefined1 *)((byte *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- ((undefined1 *)pNewObj)[0x6]
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- *(undefined1 *)((ushort *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
|
- (undefined1)((ushort *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x6) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_low = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x6) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_low = (byte)E;
|
- ((char *)pNewObj)[0x6] = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pNewObj + 0x3) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x6)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
|
- *(char *)((byte *)pNewObj + 0x6)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
|
- ((char *)pNewObj)[0x6]
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
|
- *(char *)((ushort *)pNewObj + 0x3)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
|
- (char)((ushort *)pNewObj)[0x3]
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pNewObj + 0x7)
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
|
- *(byte *)((byte *)pNewObj + 0x7)
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
|
- ((byte *)pNewObj)[0x7]
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pNewObj + 0x7)
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
|
- *(undefined1 *)((byte *)pNewObj + 0x7)
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
|
- ((undefined1 *)pNewObj)[0x7]
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x7) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_high = (byte)E;
|
- *(char *)((byte *)pNewObj + 0x7) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_high = (byte)E;
|
- ((char *)pNewObj)[0x7] = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pNewObj + 0x7)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_high
|
- *(char *)((byte *)pNewObj + 0x7)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_high
|
- ((char *)pNewObj)[0x7]
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}
