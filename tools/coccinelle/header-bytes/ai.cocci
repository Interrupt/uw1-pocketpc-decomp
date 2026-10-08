@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x0) = (char)V;
- *(char *)((char *)player_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x0) = (char)V;
- *(byte *)((char *)player_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x0) = (byte)V;
- *(char *)((char *)player_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x0) = (byte)V;
- *(byte *)((char *)player_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- ((ushort *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)((ushort *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- *(short *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- ((short *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
|
- *(short *)((short *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- ((byte *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)((ushort *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- (byte)((ushort *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(byte *)player_rec
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)((byte *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- ((undefined1 *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)((ushort *)player_rec + 0x0)
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- (undefined1)((ushort *)player_rec)[0x0]
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(undefined1 *)player_rec
+ ((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- ((char *)player_rec)[0x0] = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x0) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
|
- *(char *)player_rec = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)((byte *)player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- ((char *)player_rec)[0x0]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)((ushort *)player_rec + 0x0)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- (char)((ushort *)player_rec)[0x0]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
|
- *(char *)player_rec
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(byte *)((byte *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- ((byte *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(undefined1 *)((byte *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
|
- ((undefined1 *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
|
- ((char *)player_rec)[0x1] = E;
+ ((uw_object_hdr_t *)player_rec)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
|
- *(char *)((byte *)player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
|
- ((char *)player_rec)[0x1]
+ (char)((uw_object_hdr_t *)player_rec)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x2) = (char)V;
- *(char *)((char *)player_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x2) = (char)V;
- *(byte *)((char *)player_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x2) = (byte)V;
- *(char *)((char *)player_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x2) = (byte)V;
- *(byte *)((char *)player_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(ushort *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- ((ushort *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(ushort *)((ushort *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- *(short *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- ((short *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
|
- *(short *)((short *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(byte *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- ((byte *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(byte *)((ushort *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- (byte)((ushort *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(undefined1 *)((byte *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- ((undefined1 *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(undefined1 *)((ushort *)player_rec + 0x1)
+ ((uw_object_hdr_t *)player_rec)->position_word_low
|
- (undefined1)((ushort *)player_rec)[0x1]
+ ((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- ((char *)player_rec)[0x2] = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x1) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(char *)((byte *)player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- ((char *)player_rec)[0x2]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- *(char *)((ushort *)player_rec + 0x1)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
|
- (char)((ushort *)player_rec)[0x1]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(byte *)((byte *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- ((byte *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(undefined1 *)((byte *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->position_word_high
|
- ((undefined1 *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
|
- ((char *)player_rec)[0x3] = E;
+ ((uw_object_hdr_t *)player_rec)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
|
- *(char *)((byte *)player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
|
- ((char *)player_rec)[0x3]
+ (char)((uw_object_hdr_t *)player_rec)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x4) = (char)V;
- *(char *)((char *)player_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x4) = (char)V;
- *(byte *)((char *)player_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x4) = (byte)V;
- *(char *)((char *)player_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x4) = (byte)V;
- *(byte *)((char *)player_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(ushort *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- ((ushort *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(ushort *)((ushort *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- *(short *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- ((short *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
|
- *(short *)((short *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(byte *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- ((byte *)player_rec)[0x4]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(byte *)((ushort *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- (byte)((ushort *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(undefined1 *)((byte *)player_rec + 0x4)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- ((undefined1 *)player_rec)[0x4]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(undefined1 *)((ushort *)player_rec + 0x2)
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
|
- (undefined1)((ushort *)player_rec)[0x2]
+ ((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x4) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x4) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- ((char *)player_rec)[0x4] = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x2) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x4)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(char *)((byte *)player_rec + 0x4)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- ((char *)player_rec)[0x4]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- *(char *)((ushort *)player_rec + 0x2)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
|
- (char)((ushort *)player_rec)[0x2]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(byte *)((byte *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- ((byte *)player_rec)[0x5]
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(undefined1 *)((byte *)player_rec + 0x5)
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
|
- ((undefined1 *)player_rec)[0x5]
+ ((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x5) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x5) = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
|
- ((char *)player_rec)[0x5] = E;
+ ((uw_object_hdr_t *)player_rec)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x5)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
|
- *(char *)((byte *)player_rec + 0x5)
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
|
- ((char *)player_rec)[0x5]
+ (char)((uw_object_hdr_t *)player_rec)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x6) = (char)V;
- *(char *)((char *)player_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)player_rec + 0x6) = (char)V;
- *(byte *)((char *)player_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x6) = (byte)V;
- *(char *)((char *)player_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)player_rec + 0x6) = (byte)V;
- *(byte *)((char *)player_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)player_rec)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(ushort *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- ((ushort *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(ushort *)((ushort *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- *(short *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- ((short *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
|
- *(short *)((short *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(byte *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- ((byte *)player_rec)[0x6]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(byte *)((ushort *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- (byte)((ushort *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(undefined1 *)((byte *)player_rec + 0x6)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- ((undefined1 *)player_rec)[0x6]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(undefined1 *)((ushort *)player_rec + 0x3)
+ ((uw_object_hdr_t *)player_rec)->link_word_low
|
- (undefined1)((ushort *)player_rec)[0x3]
+ ((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x6) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- *(char *)((byte *)player_rec + 0x6) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- ((char *)player_rec)[0x6] = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
|
- *(char *)((ushort *)player_rec + 0x3) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x6)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(char *)((byte *)player_rec + 0x6)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- ((char *)player_rec)[0x6]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- *(char *)((ushort *)player_rec + 0x3)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
|
- (char)((ushort *)player_rec)[0x3]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(byte *)((byte *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- ((byte *)player_rec)[0x7]
+ ((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(undefined1 *)((byte *)player_rec + 0x7)
+ ((uw_object_hdr_t *)player_rec)->link_word_high
|
- ((undefined1 *)player_rec)[0x7]
+ ((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x7) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
|
- *(char *)((byte *)player_rec + 0x7) = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
|
- ((char *)player_rec)[0x7] = E;
+ ((uw_object_hdr_t *)player_rec)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)player_rec + 0x7)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
|
- *(char *)((byte *)player_rec + 0x7)
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
|
- ((char *)player_rec)[0x7]
+ (char)((uw_object_hdr_t *)player_rec)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x0) = (char)V;
- *(char *)((char *)pcVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x0) = (char)V;
- *(byte *)((char *)pcVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x0) = (byte)V;
- *(char *)((char *)pcVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x0) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- ((ushort *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)((ushort *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- *(short *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- ((short *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
|
- *(short *)((short *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- ((byte *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)((ushort *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- (byte)((ushort *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(byte *)pcVar3
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- ((undefined1 *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- (undefined1)((ushort *)pcVar3)[0x0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(undefined1 *)pcVar3
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- ((char *)pcVar3)[0x0] = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
|
- *(char *)pcVar3 = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)((byte *)pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- ((char *)pcVar3)[0x0]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)((ushort *)pcVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- (char)((ushort *)pcVar3)[0x0]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
|
- *(char *)pcVar3
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(byte *)((byte *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- ((byte *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- ((undefined1 *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
|
- ((char *)pcVar3)[0x1] = E;
+ ((uw_object_hdr_t *)pcVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- *(char *)((byte *)pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
|
- ((char *)pcVar3)[0x1]
+ (char)((uw_object_hdr_t *)pcVar3)->type_flags_high
)
...>
}


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x2) = (char)V;
- *(char *)((char *)pcVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x2) = (char)V;
- *(byte *)((char *)pcVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x2) = (byte)V;
- *(char *)((char *)pcVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x2) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- ((ushort *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)((ushort *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word
)
...>
}


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- *(short *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- ((short *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
|
- *(short *)((short *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word_signed
)
...>
}


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(byte *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- ((byte *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(byte *)((ushort *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- (byte)((ushort *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- ((undefined1 *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x1)
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
|
- (undefined1)((ushort *)pcVar3)[0x1]
+ ((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- ((char *)pcVar3)[0x2] = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(char *)((byte *)pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- ((char *)pcVar3)[0x2]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- *(char *)((ushort *)pcVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
|
- (char)((ushort *)pcVar3)[0x1]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(byte *)((byte *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- ((byte *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
|
- ((undefined1 *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
|
- ((char *)pcVar3)[0x3] = E;
+ ((uw_object_hdr_t *)pcVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
|
- *(char *)((byte *)pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
|
- ((char *)pcVar3)[0x3]
+ (char)((uw_object_hdr_t *)pcVar3)->position_word_high
)
...>
}


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x4) = (char)V;
- *(char *)((char *)pcVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x4) = (char)V;
- *(byte *)((char *)pcVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x4) = (byte)V;
- *(char *)((char *)pcVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x4) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- ((ushort *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)((ushort *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
)
...>
}


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- *(short *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- ((short *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
|
- *(short *)((short *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_signed
)
...>
}


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(byte *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- ((byte *)pcVar3)[0x4]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(byte *)((ushort *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- (byte)((ushort *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- ((undefined1 *)pcVar3)[0x4]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x2)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- (undefined1)((ushort *)pcVar3)[0x2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- ((char *)pcVar3)[0x4] = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(char *)((byte *)pcVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- ((char *)pcVar3)[0x4]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- *(char *)((ushort *)pcVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
|
- (char)((ushort *)pcVar3)[0x2]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(byte *)((byte *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- ((byte *)pcVar3)[0x5]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x5)
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- ((undefined1 *)pcVar3)[0x5]
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
|
- ((char *)pcVar3)[0x5] = E;
+ ((uw_object_hdr_t *)pcVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- *(char *)((byte *)pcVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
|
- ((char *)pcVar3)[0x5]
+ (char)((uw_object_hdr_t *)pcVar3)->chain_word_high
)
...>
}


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x6) = (char)V;
- *(char *)((char *)pcVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar3 + 0x6) = (char)V;
- *(byte *)((char *)pcVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x6) = (byte)V;
- *(char *)((char *)pcVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar3 + 0x6) = (byte)V;
- *(byte *)((char *)pcVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- ((ushort *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)((ushort *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word
)
...>
}


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- *(short *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- ((short *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
|
- *(short *)((short *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word_signed
)
...>
}


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(byte *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- ((byte *)pcVar3)[0x6]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(byte *)((ushort *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- (byte)((ushort *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(undefined1 *)((byte *)pcVar3 + 0x6)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- ((undefined1 *)pcVar3)[0x6]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(undefined1 *)((ushort *)pcVar3 + 0x3)
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
|
- (undefined1)((ushort *)pcVar3)[0x3]
+ ((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- ((char *)pcVar3)[0x6] = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(char *)((byte *)pcVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- ((char *)pcVar3)[0x6]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- *(char *)((ushort *)pcVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
|
- (char)((ushort *)pcVar3)[0x3]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(byte *)((byte *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- ((byte *)pcVar3)[0x7]
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(undefined1 *)((byte *)pcVar3 + 0x7)
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
|
- ((undefined1 *)pcVar3)[0x7]
+ ((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)pcVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
|
- ((char *)pcVar3)[0x7] = E;
+ ((uw_object_hdr_t *)pcVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
|
- *(char *)((byte *)pcVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
|
- ((char *)pcVar3)[0x7]
+ (char)((uw_object_hdr_t *)pcVar3)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x0) = (char)V;
- *(char *)((char *)pObj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x0) = (char)V;
- *(byte *)((char *)pObj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x0) = (byte)V;
- *(char *)((char *)pObj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x0) = (byte)V;
- *(byte *)((char *)pObj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(ushort *)((byte *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- ((ushort *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(ushort *)((ushort *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_signed
|
- *(short *)((byte *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_signed
|
- ((short *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_signed
|
- *(short *)((short *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(byte *)((byte *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- ((byte *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(byte *)((ushort *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- (byte)((ushort *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(byte *)pObj
+ ((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(undefined1 *)((byte *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- ((undefined1 *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(undefined1 *)((ushort *)pObj + 0x0)
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- (undefined1)((ushort *)pObj)[0x0]
+ ((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(undefined1 *)pObj
+ ((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x0) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pObj + 0x0) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
|
- ((char *)pObj)[0x0] = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pObj + 0x0) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
|
- *(char *)pObj = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x0)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(char *)((byte *)pObj + 0x0)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- ((char *)pObj)[0x0]
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(char *)((ushort *)pObj + 0x0)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- (char)((ushort *)pObj)[0x0]
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
|
- *(char *)pObj
+ (char)((uw_object_hdr_t *)pObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->type_flags_high
|
- *(byte *)((byte *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->type_flags_high
|
- ((byte *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->type_flags_high
|
- *(undefined1 *)((byte *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->type_flags_high
|
- ((undefined1 *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x1) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pObj + 0x1) = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_high = (byte)E;
|
- ((char *)pObj)[0x1] = E;
+ ((uw_object_hdr_t *)pObj)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x1)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_high
|
- *(char *)((byte *)pObj + 0x1)
+ (char)((uw_object_hdr_t *)pObj)->type_flags_high
|
- ((char *)pObj)[0x1]
+ (char)((uw_object_hdr_t *)pObj)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x2) = (char)V;
- *(char *)((char *)pObj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x2) = (char)V;
- *(byte *)((char *)pObj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x2) = (byte)V;
- *(char *)((char *)pObj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x2) = (byte)V;
- *(byte *)((char *)pObj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- *(ushort *)((byte *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- ((ushort *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word
|
- *(ushort *)((ushort *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_signed
|
- *(short *)((byte *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_signed
|
- ((short *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word_signed
|
- *(short *)((short *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- *(byte *)((byte *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- ((byte *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- *(byte *)((ushort *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- (byte)((ushort *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- *(undefined1 *)((byte *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- ((undefined1 *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- *(undefined1 *)((ushort *)pObj + 0x1)
+ ((uw_object_hdr_t *)pObj)->position_word_low
|
- (undefined1)((ushort *)pObj)[0x1]
+ ((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x2) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
|
- *(char *)((byte *)pObj + 0x2) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
|
- ((char *)pObj)[0x2] = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pObj + 0x1) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x2)
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
|
- *(char *)((byte *)pObj + 0x2)
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
|
- ((char *)pObj)[0x2]
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
|
- *(char *)((ushort *)pObj + 0x1)
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
|
- (char)((ushort *)pObj)[0x1]
+ (char)((uw_object_hdr_t *)pObj)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->position_word_high
|
- *(byte *)((byte *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->position_word_high
|
- ((byte *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->position_word_high
|
- *(undefined1 *)((byte *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->position_word_high
|
- ((undefined1 *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x3) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_high = (byte)E;
|
- *(char *)((byte *)pObj + 0x3) = E;
+ ((uw_object_hdr_t *)pObj)->position_word_high = (byte)E;
|
- ((char *)pObj)[0x3] = E;
+ ((uw_object_hdr_t *)pObj)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x3)
+ (char)((uw_object_hdr_t *)pObj)->position_word_high
|
- *(char *)((byte *)pObj + 0x3)
+ (char)((uw_object_hdr_t *)pObj)->position_word_high
|
- ((char *)pObj)[0x3]
+ (char)((uw_object_hdr_t *)pObj)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x4) = (char)V;
- *(char *)((char *)pObj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x4) = (char)V;
- *(byte *)((char *)pObj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x4) = (byte)V;
- *(char *)((char *)pObj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x4) = (byte)V;
- *(byte *)((char *)pObj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- *(ushort *)((byte *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- ((ushort *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- *(ushort *)((ushort *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_signed
|
- *(short *)((byte *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_signed
|
- ((short *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word_signed
|
- *(short *)((short *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- *(byte *)((byte *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- ((byte *)pObj)[0x4]
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- *(byte *)((ushort *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- (byte)((ushort *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- *(undefined1 *)((byte *)pObj + 0x4)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- ((undefined1 *)pObj)[0x4]
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- *(undefined1 *)((ushort *)pObj + 0x2)
+ ((uw_object_hdr_t *)pObj)->chain_word_low
|
- (undefined1)((ushort *)pObj)[0x2]
+ ((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x4) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pObj + 0x4) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
|
- ((char *)pObj)[0x4] = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pObj + 0x2) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x4)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
|
- *(char *)((byte *)pObj + 0x4)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
|
- ((char *)pObj)[0x4]
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
|
- *(char *)((ushort *)pObj + 0x2)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
|
- (char)((ushort *)pObj)[0x2]
+ (char)((uw_object_hdr_t *)pObj)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x5)
+ ((uw_object_hdr_t *)pObj)->chain_word_high
|
- *(byte *)((byte *)pObj + 0x5)
+ ((uw_object_hdr_t *)pObj)->chain_word_high
|
- ((byte *)pObj)[0x5]
+ ((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x5)
+ ((uw_object_hdr_t *)pObj)->chain_word_high
|
- *(undefined1 *)((byte *)pObj + 0x5)
+ ((uw_object_hdr_t *)pObj)->chain_word_high
|
- ((undefined1 *)pObj)[0x5]
+ ((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x5) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pObj + 0x5) = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_high = (byte)E;
|
- ((char *)pObj)[0x5] = E;
+ ((uw_object_hdr_t *)pObj)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x5)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_high
|
- *(char *)((byte *)pObj + 0x5)
+ (char)((uw_object_hdr_t *)pObj)->chain_word_high
|
- ((char *)pObj)[0x5]
+ (char)((uw_object_hdr_t *)pObj)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x6) = (char)V;
- *(char *)((char *)pObj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pObj + 0x6) = (char)V;
- *(byte *)((char *)pObj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x6) = (byte)V;
- *(char *)((char *)pObj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pObj + 0x6) = (byte)V;
- *(byte *)((char *)pObj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pObj)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- *(ushort *)((byte *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- ((ushort *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word
|
- *(ushort *)((ushort *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_signed
|
- *(short *)((byte *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_signed
|
- ((short *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word_signed
|
- *(short *)((short *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- *(byte *)((byte *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- ((byte *)pObj)[0x6]
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- *(byte *)((ushort *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- (byte)((ushort *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- *(undefined1 *)((byte *)pObj + 0x6)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- ((undefined1 *)pObj)[0x6]
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- *(undefined1 *)((ushort *)pObj + 0x3)
+ ((uw_object_hdr_t *)pObj)->link_word_low
|
- (undefined1)((ushort *)pObj)[0x3]
+ ((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x6) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
|
- *(char *)((byte *)pObj + 0x6) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
|
- ((char *)pObj)[0x6] = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pObj + 0x3) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x6)
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
|
- *(char *)((byte *)pObj + 0x6)
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
|
- ((char *)pObj)[0x6]
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
|
- *(char *)((ushort *)pObj + 0x3)
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
|
- (char)((ushort *)pObj)[0x3]
+ (char)((uw_object_hdr_t *)pObj)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pObj + 0x7)
+ ((uw_object_hdr_t *)pObj)->link_word_high
|
- *(byte *)((byte *)pObj + 0x7)
+ ((uw_object_hdr_t *)pObj)->link_word_high
|
- ((byte *)pObj)[0x7]
+ ((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pObj + 0x7)
+ ((uw_object_hdr_t *)pObj)->link_word_high
|
- *(undefined1 *)((byte *)pObj + 0x7)
+ ((uw_object_hdr_t *)pObj)->link_word_high
|
- ((undefined1 *)pObj)[0x7]
+ ((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x7) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_high = (byte)E;
|
- *(char *)((byte *)pObj + 0x7) = E;
+ ((uw_object_hdr_t *)pObj)->link_word_high = (byte)E;
|
- ((char *)pObj)[0x7] = E;
+ ((uw_object_hdr_t *)pObj)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pObj + 0x7)
+ (char)((uw_object_hdr_t *)pObj)->link_word_high
|
- *(char *)((byte *)pObj + 0x7)
+ (char)((uw_object_hdr_t *)pObj)->link_word_high
|
- ((char *)pObj)[0x7]
+ (char)((uw_object_hdr_t *)pObj)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x0) = (char)V;
- *(char *)((char *)iVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x0) = (char)V;
- *(byte *)((char *)iVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x0) = (byte)V;
- *(char *)((char *)iVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x0) = (byte)V;
- *(byte *)((char *)iVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- ((ushort *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)((ushort *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- *(short *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- ((short *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
|
- *(short *)((short *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- ((byte *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)((ushort *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- (byte)((ushort *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(byte *)iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)((byte *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- ((undefined1 *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x0)
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- (undefined1)((ushort *)iVar6)[0x0]
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(undefined1 *)iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- ((char *)iVar6)[0x0] = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
|
- *(char *)iVar6 = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)((byte *)iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- ((char *)iVar6)[0x0]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)((ushort *)iVar6 + 0x0)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- (char)((ushort *)iVar6)[0x0]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
|
- *(char *)iVar6
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(byte *)((byte *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- ((byte *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(undefined1 *)((byte *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
|
- ((undefined1 *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
|
- ((char *)iVar6)[0x1] = E;
+ ((uw_object_hdr_t *)iVar6)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
|
- *(char *)((byte *)iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
|
- ((char *)iVar6)[0x1]
+ (char)((uw_object_hdr_t *)iVar6)->type_flags_high
)
...>
}


@receiver_5_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x2) = (char)V;
- *(char *)((char *)iVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x2) = (char)V;
- *(byte *)((char *)iVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x2) = (byte)V;
- *(char *)((char *)iVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x2) = (byte)V;
- *(byte *)((char *)iVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_14_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(ushort *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- ((ushort *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(ushort *)((ushort *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word
)
...>
}


@receiver_5_w_2_14_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- *(short *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- ((short *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
|
- *(short *)((short *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word_signed
)
...>
}


@receiver_5_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(byte *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- ((byte *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(byte *)((ushort *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- (byte)((ushort *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_5_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(undefined1 *)((byte *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- ((undefined1 *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x1)
+ ((uw_object_hdr_t *)iVar6)->position_word_low
|
- (undefined1)((ushort *)iVar6)[0x1]
+ ((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_5_w_2_14_store_2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- ((char *)iVar6)[0x2] = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(char *)((byte *)iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- ((char *)iVar6)[0x2]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- *(char *)((ushort *)iVar6 + 0x1)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
|
- (char)((ushort *)iVar6)[0x1]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_low
)
...>
}


@receiver_5_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(byte *)((byte *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- ((byte *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_5_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(undefined1 *)((byte *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->position_word_high
|
- ((undefined1 *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_5_w_2_14_store_3@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
|
- ((char *)iVar6)[0x3] = E;
+ ((uw_object_hdr_t *)iVar6)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
|
- *(char *)((byte *)iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
|
- ((char *)iVar6)[0x3]
+ (char)((uw_object_hdr_t *)iVar6)->position_word_high
)
...>
}


@receiver_5_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x4) = (char)V;
- *(char *)((char *)iVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x4) = (char)V;
- *(byte *)((char *)iVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x4) = (byte)V;
- *(char *)((char *)iVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x4) = (byte)V;
- *(byte *)((char *)iVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_28_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(ushort *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- ((ushort *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(ushort *)((ushort *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word
)
...>
}


@receiver_5_w_4_28_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- *(short *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- ((short *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
|
- *(short *)((short *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word_signed
)
...>
}


@receiver_5_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(byte *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- ((byte *)iVar6)[0x4]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(byte *)((ushort *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- (byte)((ushort *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_5_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(undefined1 *)((byte *)iVar6 + 0x4)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- ((undefined1 *)iVar6)[0x4]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x2)
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
|
- (undefined1)((ushort *)iVar6)[0x2]
+ ((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_5_w_4_28_store_4@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- ((char *)iVar6)[0x4] = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x4)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(char *)((byte *)iVar6 + 0x4)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- ((char *)iVar6)[0x4]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- *(char *)((ushort *)iVar6 + 0x2)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
|
- (char)((ushort *)iVar6)[0x2]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_low
)
...>
}


@receiver_5_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(byte *)((byte *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- ((byte *)iVar6)[0x5]
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_5_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(undefined1 *)((byte *)iVar6 + 0x5)
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
|
- ((undefined1 *)iVar6)[0x5]
+ ((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_5_w_4_28_store_5@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
|
- ((char *)iVar6)[0x5] = E;
+ ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x5)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
|
- *(char *)((byte *)iVar6 + 0x5)
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
|
- ((char *)iVar6)[0x5]
+ (char)((uw_object_hdr_t *)iVar6)->chain_word_high
)
...>
}


@receiver_5_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x6) = (char)V;
- *(char *)((char *)iVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar6 + 0x6) = (char)V;
- *(byte *)((char *)iVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x6) = (byte)V;
- *(char *)((char *)iVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar6 + 0x6) = (byte)V;
- *(byte *)((char *)iVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar6)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_42_word_ushort@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(ushort *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- ((ushort *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(ushort *)((ushort *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word
)
...>
}


@receiver_5_w_6_42_word_short@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- *(short *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- ((short *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
|
- *(short *)((short *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word_signed
)
...>
}


@receiver_5_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(byte *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- ((byte *)iVar6)[0x6]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(byte *)((ushort *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- (byte)((ushort *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_5_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(undefined1 *)((byte *)iVar6 + 0x6)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- ((undefined1 *)iVar6)[0x6]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(undefined1 *)((ushort *)iVar6 + 0x3)
+ ((uw_object_hdr_t *)iVar6)->link_word_low
|
- (undefined1)((ushort *)iVar6)[0x3]
+ ((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_5_w_6_42_store_6@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- ((char *)iVar6)[0x6] = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x6)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(char *)((byte *)iVar6 + 0x6)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- ((char *)iVar6)[0x6]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- *(char *)((ushort *)iVar6 + 0x3)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
|
- (char)((ushort *)iVar6)[0x3]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_low
)
...>
}


@receiver_5_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(byte *)((byte *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- ((byte *)iVar6)[0x7]
+ ((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_5_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(undefined1 *)((byte *)iVar6 + 0x7)
+ ((uw_object_hdr_t *)iVar6)->link_word_high
|
- ((undefined1 *)iVar6)[0x7]
+ ((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_5_w_6_42_store_7@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
|
- ((char *)iVar6)[0x7] = E;
+ ((uw_object_hdr_t *)iVar6)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar6 + 0x7)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
|
- *(char *)((byte *)iVar6 + 0x7)
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
|
- ((char *)iVar6)[0x7]
+ (char)((uw_object_hdr_t *)iVar6)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x0) = (char)V;
- *(char *)((char *)pDropObj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x0) = (char)V;
- *(byte *)((char *)pDropObj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x0) = (byte)V;
- *(char *)((char *)pDropObj + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x0) = (byte)V;
- *(byte *)((char *)pDropObj + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(ushort *)((byte *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- ((ushort *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(ushort *)((ushort *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_signed
|
- *(short *)((byte *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_signed
|
- ((short *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_signed
|
- *(short *)((short *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_signed
)
...>
}


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(byte *)((byte *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- ((byte *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(byte *)((ushort *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- (byte)((ushort *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(byte *)pDropObj
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(undefined1 *)((byte *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- ((undefined1 *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(undefined1 *)((ushort *)pDropObj + 0x0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- (undefined1)((ushort *)pDropObj)[0x0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(undefined1 *)pDropObj
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x0) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x0) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
|
- ((char *)pDropObj)[0x0] = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pDropObj + 0x0) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
|
- *(char *)pDropObj = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x0)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(char *)((byte *)pDropObj + 0x0)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- ((char *)pDropObj)[0x0]
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(char *)((ushort *)pDropObj + 0x0)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- (char)((ushort *)pDropObj)[0x0]
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
|
- *(char *)pDropObj
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- *(byte *)((byte *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- ((byte *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- *(undefined1 *)((byte *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- ((undefined1 *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x1) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x1) = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high = (byte)E;
|
- ((char *)pDropObj)[0x1] = E;
+ ((uw_object_hdr_t *)pDropObj)->type_flags_high = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x1)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- *(char *)((byte *)pDropObj + 0x1)
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_high
|
- ((char *)pDropObj)[0x1]
+ (char)((uw_object_hdr_t *)pDropObj)->type_flags_high
)
...>
}


@receiver_6_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x2) = (char)V;
- *(char *)((char *)pDropObj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x2) = (char)V;
- *(byte *)((char *)pDropObj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x2) = (byte)V;
- *(char *)((char *)pDropObj + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x2) = (byte)V;
- *(byte *)((char *)pDropObj + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- *(ushort *)((byte *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- ((ushort *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- *(ushort *)((ushort *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->position_word
)
...>
}


@receiver_6_w_2_14_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_signed
|
- *(short *)((byte *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_signed
|
- ((short *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->position_word_signed
|
- *(short *)((short *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->position_word_signed
)
...>
}


@receiver_6_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- *(byte *)((byte *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- ((byte *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- *(byte *)((ushort *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- (byte)((ushort *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_6_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- *(undefined1 *)((byte *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- ((undefined1 *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- *(undefined1 *)((ushort *)pDropObj + 0x1)
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
|
- (undefined1)((ushort *)pDropObj)[0x1]
+ ((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_6_w_2_14_store_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x2) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_low = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x2) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_low = (byte)E;
|
- ((char *)pDropObj)[0x2] = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pDropObj + 0x1) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x2)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
|
- *(char *)((byte *)pDropObj + 0x2)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
|
- ((char *)pDropObj)[0x2]
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
|
- *(char *)((ushort *)pDropObj + 0x1)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
|
- (char)((ushort *)pDropObj)[0x1]
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_low
)
...>
}


@receiver_6_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
|
- *(byte *)((byte *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
|
- ((byte *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_6_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
|
- *(undefined1 *)((byte *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
|
- ((undefined1 *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_6_w_2_14_store_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x3) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_high = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x3) = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_high = (byte)E;
|
- ((char *)pDropObj)[0x3] = E;
+ ((uw_object_hdr_t *)pDropObj)->position_word_high = (byte)E;
)
...>
}


@receiver_6_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x3)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_high
|
- *(char *)((byte *)pDropObj + 0x3)
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_high
|
- ((char *)pDropObj)[0x3]
+ (char)((uw_object_hdr_t *)pDropObj)->position_word_high
)
...>
}


@receiver_6_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x4) = (char)V;
- *(char *)((char *)pDropObj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x4) = (char)V;
- *(byte *)((char *)pDropObj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x4) = (byte)V;
- *(char *)((char *)pDropObj + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x4) = (byte)V;
- *(byte *)((char *)pDropObj + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- *(ushort *)((byte *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- ((ushort *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- *(ushort *)((ushort *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
)
...>
}


@receiver_6_w_4_28_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_signed
|
- *(short *)((byte *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_signed
|
- ((short *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_signed
|
- *(short *)((short *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_signed
)
...>
}


@receiver_6_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- *(byte *)((byte *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- ((byte *)pDropObj)[0x4]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- *(byte *)((ushort *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- (byte)((ushort *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_6_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- *(undefined1 *)((byte *)pDropObj + 0x4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- ((undefined1 *)pDropObj)[0x4]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- *(undefined1 *)((ushort *)pDropObj + 0x2)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- (undefined1)((ushort *)pDropObj)[0x2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_6_w_4_28_store_4@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x4) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x4) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)E;
|
- ((char *)pDropObj)[0x4] = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pDropObj + 0x2) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x4)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- *(char *)((byte *)pDropObj + 0x4)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- ((char *)pDropObj)[0x4]
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- *(char *)((ushort *)pDropObj + 0x2)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
|
- (char)((ushort *)pDropObj)[0x2]
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_low
)
...>
}


@receiver_6_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x5)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- *(byte *)((byte *)pDropObj + 0x5)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- ((byte *)pDropObj)[0x5]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_6_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x5)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- *(undefined1 *)((byte *)pDropObj + 0x5)
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- ((undefined1 *)pDropObj)[0x5]
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_6_w_4_28_store_5@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x5) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x5) = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high = (byte)E;
|
- ((char *)pDropObj)[0x5] = E;
+ ((uw_object_hdr_t *)pDropObj)->chain_word_high = (byte)E;
)
...>
}


@receiver_6_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x5)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- *(char *)((byte *)pDropObj + 0x5)
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_high
|
- ((char *)pDropObj)[0x5]
+ (char)((uw_object_hdr_t *)pDropObj)->chain_word_high
)
...>
}


@receiver_6_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x6) = (char)V;
- *(char *)((char *)pDropObj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pDropObj + 0x6) = (char)V;
- *(byte *)((char *)pDropObj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x6) = (byte)V;
- *(char *)((char *)pDropObj + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pDropObj + 0x6) = (byte)V;
- *(byte *)((char *)pDropObj + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pDropObj)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_word_ushort@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- *(ushort *)((byte *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- ((ushort *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- *(ushort *)((ushort *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->link_word
)
...>
}


@receiver_6_w_6_42_word_short@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_signed
|
- *(short *)((byte *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_signed
|
- ((short *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->link_word_signed
|
- *(short *)((short *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->link_word_signed
)
...>
}


@receiver_6_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- *(byte *)((byte *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- ((byte *)pDropObj)[0x6]
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- *(byte *)((ushort *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- (byte)((ushort *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_6_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- *(undefined1 *)((byte *)pDropObj + 0x6)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- ((undefined1 *)pDropObj)[0x6]
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- *(undefined1 *)((ushort *)pDropObj + 0x3)
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
|
- (undefined1)((ushort *)pDropObj)[0x3]
+ ((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_6_w_6_42_store_6@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x6) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_low = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x6) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_low = (byte)E;
|
- ((char *)pDropObj)[0x6] = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pDropObj + 0x3) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x6)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
|
- *(char *)((byte *)pDropObj + 0x6)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
|
- ((char *)pDropObj)[0x6]
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
|
- *(char *)((ushort *)pDropObj + 0x3)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
|
- (char)((ushort *)pDropObj)[0x3]
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_low
)
...>
}


@receiver_6_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pDropObj + 0x7)
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
|
- *(byte *)((byte *)pDropObj + 0x7)
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
|
- ((byte *)pDropObj)[0x7]
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_6_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pDropObj + 0x7)
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
|
- *(undefined1 *)((byte *)pDropObj + 0x7)
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
|
- ((undefined1 *)pDropObj)[0x7]
+ ((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_6_w_6_42_store_7@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x7) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_high = (byte)E;
|
- *(char *)((byte *)pDropObj + 0x7) = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_high = (byte)E;
|
- ((char *)pDropObj)[0x7] = E;
+ ((uw_object_hdr_t *)pDropObj)->link_word_high = (byte)E;
)
...>
}


@receiver_6_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pDropObj + 0x7)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_high
|
- *(char *)((byte *)pDropObj + 0x7)
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_high
|
- ((char *)pDropObj)[0x7]
+ (char)((uw_object_hdr_t *)pDropObj)->link_word_high
)
...>
}


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_2_14_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_store_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_store_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_4_28_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_store_4@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_store_5@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@receiver_7_w_6_42_word_ushort@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_word_short@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_store_6@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_store_7@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_7_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x0) = (char)V;
- *(char *)((char *)puVar8 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x0) = (char)V;
- *(byte *)((char *)puVar8 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x0) = (byte)V;
- *(char *)((char *)puVar8 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x0) = (byte)V;
- *(byte *)((char *)puVar8 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(ushort *)((byte *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- ((ushort *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(ushort *)((ushort *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
)
...>
}


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_signed
|
- *(short *)((byte *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_signed
|
- ((short *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_signed
|
- *(short *)((short *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_signed
)
...>
}


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(byte *)((byte *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- ((byte *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(byte *)((ushort *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- (byte)((ushort *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(byte *)puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(undefined1 *)((byte *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- ((undefined1 *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- (undefined1)((ushort *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(undefined1 *)puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)E;
|
- ((char *)puVar8)[0x0] = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar8 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)E;
|
- *(char *)puVar8 = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x0)
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(char *)((byte *)puVar8 + 0x0)
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
|
- ((char *)puVar8)[0x0]
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(char *)((ushort *)puVar8 + 0x0)
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
|
- (char)((ushort *)puVar8)[0x0]
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
|
- *(char *)puVar8
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->type_flags_high
|
- *(byte *)((byte *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->type_flags_high
|
- ((byte *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->type_flags_high
)
...>
}


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->type_flags_high
|
- *(undefined1 *)((byte *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->type_flags_high
|
- ((undefined1 *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->type_flags_high
)
...>
}


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_high = (byte)E;
|
- ((char *)puVar8)[0x1] = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_high = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x1)
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_high
|
- *(char *)((byte *)puVar8 + 0x1)
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_high
|
- ((char *)puVar8)[0x1]
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_high
)
...>
}


@receiver_8_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x2) = (char)V;
- *(char *)((char *)puVar8 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x2) = (char)V;
- *(byte *)((char *)puVar8 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x2) = (byte)V;
- *(char *)((char *)puVar8 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x2) = (byte)V;
- *(byte *)((char *)puVar8 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- *(ushort *)((byte *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- ((ushort *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- *(ushort *)((ushort *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word
)
...>
}


@receiver_8_w_2_14_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word_signed
|
- *(short *)((byte *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word_signed
|
- ((short *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word_signed
|
- *(short *)((short *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word_signed
)
...>
}


@receiver_8_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- *(byte *)((byte *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- ((byte *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- *(byte *)((ushort *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- (byte)((ushort *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_8_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- *(undefined1 *)((byte *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- ((undefined1 *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- *(undefined1 *)((ushort *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- (undefined1)((ushort *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_8_w_2_14_store_2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)E;
|
- ((char *)puVar8)[0x2] = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar8 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)E;
)
...>
}


@receiver_8_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x2)
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
|
- *(char *)((byte *)puVar8 + 0x2)
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
|
- ((char *)puVar8)[0x2]
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
|
- *(char *)((ushort *)puVar8 + 0x1)
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
|
- (char)((ushort *)puVar8)[0x1]
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_8_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->position_word_high
|
- *(byte *)((byte *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->position_word_high
|
- ((byte *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->position_word_high
)
...>
}


@receiver_8_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->position_word_high
|
- *(undefined1 *)((byte *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->position_word_high
|
- ((undefined1 *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->position_word_high
)
...>
}


@receiver_8_w_2_14_store_3@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)E;
|
- ((char *)puVar8)[0x3] = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)E;
)
...>
}


@receiver_8_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x3)
+ (char)((uw_object_hdr_t *)puVar8)->position_word_high
|
- *(char *)((byte *)puVar8 + 0x3)
+ (char)((uw_object_hdr_t *)puVar8)->position_word_high
|
- ((char *)puVar8)[0x3]
+ (char)((uw_object_hdr_t *)puVar8)->position_word_high
)
...>
}


@receiver_8_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x4) = (char)V;
- *(char *)((char *)puVar8 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x4) = (char)V;
- *(byte *)((char *)puVar8 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x4) = (byte)V;
- *(char *)((char *)puVar8 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x4) = (byte)V;
- *(byte *)((char *)puVar8 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- *(ushort *)((byte *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- ((ushort *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- *(ushort *)((ushort *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word
)
...>
}


@receiver_8_w_4_28_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word_signed
|
- *(short *)((byte *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word_signed
|
- ((short *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word_signed
|
- *(short *)((short *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word_signed
)
...>
}


@receiver_8_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- *(byte *)((byte *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- ((byte *)puVar8)[0x4]
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- *(byte *)((ushort *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- (byte)((ushort *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_8_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- *(undefined1 *)((byte *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- ((undefined1 *)puVar8)[0x4]
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- (undefined1)((ushort *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_8_w_4_28_store_4@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)E;
|
- ((char *)puVar8)[0x4] = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar8 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)E;
)
...>
}


@receiver_8_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x4)
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
|
- *(char *)((byte *)puVar8 + 0x4)
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
|
- ((char *)puVar8)[0x4]
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
|
- *(char *)((ushort *)puVar8 + 0x2)
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
|
- (char)((ushort *)puVar8)[0x2]
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_8_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x5)
+ ((uw_object_hdr_t *)puVar8)->chain_word_high
|
- *(byte *)((byte *)puVar8 + 0x5)
+ ((uw_object_hdr_t *)puVar8)->chain_word_high
|
- ((byte *)puVar8)[0x5]
+ ((uw_object_hdr_t *)puVar8)->chain_word_high
)
...>
}


@receiver_8_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x5)
+ ((uw_object_hdr_t *)puVar8)->chain_word_high
|
- *(undefined1 *)((byte *)puVar8 + 0x5)
+ ((uw_object_hdr_t *)puVar8)->chain_word_high
|
- ((undefined1 *)puVar8)[0x5]
+ ((uw_object_hdr_t *)puVar8)->chain_word_high
)
...>
}


@receiver_8_w_4_28_store_5@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_high = (byte)E;
|
- ((char *)puVar8)[0x5] = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_high = (byte)E;
)
...>
}


@receiver_8_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x5)
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_high
|
- *(char *)((byte *)puVar8 + 0x5)
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_high
|
- ((char *)puVar8)[0x5]
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_high
)
...>
}


@receiver_8_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x6) = (char)V;
- *(char *)((char *)puVar8 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar8 + 0x6) = (char)V;
- *(byte *)((char *)puVar8 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x6) = (byte)V;
- *(char *)((char *)puVar8 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar8 + 0x6) = (byte)V;
- *(byte *)((char *)puVar8 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar8)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_word_ushort@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- *(ushort *)((byte *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- ((ushort *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- *(ushort *)((ushort *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word
)
...>
}


@receiver_8_w_6_42_word_short@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word_signed
|
- *(short *)((byte *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word_signed
|
- ((short *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word_signed
|
- *(short *)((short *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word_signed
)
...>
}


@receiver_8_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- *(byte *)((byte *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- ((byte *)puVar8)[0x6]
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- *(byte *)((ushort *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- (byte)((ushort *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_8_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- *(undefined1 *)((byte *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- ((undefined1 *)puVar8)[0x6]
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- *(undefined1 *)((ushort *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- (undefined1)((ushort *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_8_w_6_42_store_6@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)E;
|
- ((char *)puVar8)[0x6] = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar8 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)E;
)
...>
}


@receiver_8_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x6)
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
|
- *(char *)((byte *)puVar8 + 0x6)
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
|
- ((char *)puVar8)[0x6]
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
|
- *(char *)((ushort *)puVar8 + 0x3)
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
|
- (char)((ushort *)puVar8)[0x3]
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_8_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar8 + 0x7)
+ ((uw_object_hdr_t *)puVar8)->link_word_high
|
- *(byte *)((byte *)puVar8 + 0x7)
+ ((uw_object_hdr_t *)puVar8)->link_word_high
|
- ((byte *)puVar8)[0x7]
+ ((uw_object_hdr_t *)puVar8)->link_word_high
)
...>
}


@receiver_8_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar8 + 0x7)
+ ((uw_object_hdr_t *)puVar8)->link_word_high
|
- *(undefined1 *)((byte *)puVar8 + 0x7)
+ ((uw_object_hdr_t *)puVar8)->link_word_high
|
- ((undefined1 *)puVar8)[0x7]
+ ((uw_object_hdr_t *)puVar8)->link_word_high
)
...>
}


@receiver_8_w_6_42_store_7@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar8 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_high = (byte)E;
|
- ((char *)puVar8)[0x7] = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_high = (byte)E;
)
...>
}


@receiver_8_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar8 + 0x7)
+ (char)((uw_object_hdr_t *)puVar8)->link_word_high
|
- *(char *)((byte *)puVar8 + 0x7)
+ (char)((uw_object_hdr_t *)puVar8)->link_word_high
|
- ((char *)puVar8)[0x7]
+ (char)((uw_object_hdr_t *)puVar8)->link_word_high
)
...>
}


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x0) = (char)V;
- *(char *)((char *)npc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x0) = (char)V;
- *(byte *)((char *)npc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x0) = (byte)V;
- *(char *)((char *)npc + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x0) = (byte)V;
- *(byte *)((char *)npc + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((ushort *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)((ushort *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
|
- *(short *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
|
- ((short *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_signed
|
- *(short *)((short *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_signed
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(byte *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- ((byte *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(byte *)((ushort *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- (byte)((ushort *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(byte *)npc
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(undefined1 *)((byte *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- ((undefined1 *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(undefined1 *)((ushort *)npc + 0x0)
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- (undefined1)((ushort *)npc)[0x0]
+ ((uw_object_hdr_t *)npc)->type_flags_low
|
- *(undefined1 *)npc
+ ((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *(char *)((byte *)npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- ((char *)npc)[0x0] = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x0) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
|
- *(char *)npc = E;
+ ((uw_object_hdr_t *)npc)->type_flags_low = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *(char *)((byte *)npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- ((char *)npc)[0x0]
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *(char *)((ushort *)npc + 0x0)
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- (char)((ushort *)npc)[0x0]
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
|
- *(char *)npc
+ (char)((uw_object_hdr_t *)npc)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- *(byte *)((byte *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- ((byte *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- *(undefined1 *)((byte *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->type_flags_high
|
- ((undefined1 *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
|
- *(char *)((byte *)npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
|
- ((char *)npc)[0x1] = E;
+ ((uw_object_hdr_t *)npc)->type_flags_high = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
|
- *(char *)((byte *)npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
|
- ((char *)npc)[0x1]
+ (char)((uw_object_hdr_t *)npc)->type_flags_high
)
...>
}


@receiver_9_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x2) = (char)V;
- *(char *)((char *)npc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x2) = (char)V;
- *(byte *)((char *)npc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x2) = (byte)V;
- *(char *)((char *)npc + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x2) = (byte)V;
- *(byte *)((char *)npc + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(ushort *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((ushort *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(ushort *)((ushort *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}


@receiver_9_w_2_14_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_signed
|
- *(short *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_signed
|
- ((short *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_signed
|
- *(short *)((short *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_signed
)
...>
}


@receiver_9_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(byte *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- ((byte *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(byte *)((ushort *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- (byte)((ushort *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_9_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(undefined1 *)((byte *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- ((undefined1 *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- *(undefined1 *)((ushort *)npc + 0x1)
+ ((uw_object_hdr_t *)npc)->position_word_low
|
- (undefined1)((ushort *)npc)[0x1]
+ ((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_9_w_2_14_store_2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- *(char *)((byte *)npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- ((char *)npc)[0x2] = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x1) = E;
+ ((uw_object_hdr_t *)npc)->position_word_low = (byte)E;
)
...>
}


@receiver_9_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- *(char *)((byte *)npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- ((char *)npc)[0x2]
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- *(char *)((ushort *)npc + 0x1)
+ (char)((uw_object_hdr_t *)npc)->position_word_low
|
- (char)((ushort *)npc)[0x1]
+ (char)((uw_object_hdr_t *)npc)->position_word_low
)
...>
}


@receiver_9_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- *(byte *)((byte *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- ((byte *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_9_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- *(undefined1 *)((byte *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->position_word_high
|
- ((undefined1 *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_9_w_2_14_store_3@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
|
- *(char *)((byte *)npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
|
- ((char *)npc)[0x3] = E;
+ ((uw_object_hdr_t *)npc)->position_word_high = (byte)E;
)
...>
}


@receiver_9_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->position_word_high
|
- *(char *)((byte *)npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->position_word_high
|
- ((char *)npc)[0x3]
+ (char)((uw_object_hdr_t *)npc)->position_word_high
)
...>
}


@receiver_9_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x4) = (char)V;
- *(char *)((char *)npc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x4) = (char)V;
- *(byte *)((char *)npc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x4) = (byte)V;
- *(char *)((char *)npc + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x4) = (byte)V;
- *(byte *)((char *)npc + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(ushort *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((ushort *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(ushort *)((ushort *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}


@receiver_9_w_4_28_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
|
- *(short *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
|
- ((short *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_signed
|
- *(short *)((short *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_signed
)
...>
}


@receiver_9_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(byte *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- ((byte *)npc)[0x4]
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(byte *)((ushort *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- (byte)((ushort *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_9_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(undefined1 *)((byte *)npc + 0x4)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- ((undefined1 *)npc)[0x4]
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- *(undefined1 *)((ushort *)npc + 0x2)
+ ((uw_object_hdr_t *)npc)->chain_word_low
|
- (undefined1)((ushort *)npc)[0x2]
+ ((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_9_w_4_28_store_4@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x4) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- *(char *)((byte *)npc + 0x4) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- ((char *)npc)[0x4] = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x2) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_low = (byte)E;
)
...>
}


@receiver_9_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x4)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- *(char *)((byte *)npc + 0x4)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- ((char *)npc)[0x4]
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- *(char *)((ushort *)npc + 0x2)
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
|
- (char)((ushort *)npc)[0x2]
+ (char)((uw_object_hdr_t *)npc)->chain_word_low
)
...>
}


@receiver_9_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- *(byte *)((byte *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- ((byte *)npc)[0x5]
+ ((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_9_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- *(undefined1 *)((byte *)npc + 0x5)
+ ((uw_object_hdr_t *)npc)->chain_word_high
|
- ((undefined1 *)npc)[0x5]
+ ((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_9_w_4_28_store_5@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x5) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
|
- *(char *)((byte *)npc + 0x5) = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
|
- ((char *)npc)[0x5] = E;
+ ((uw_object_hdr_t *)npc)->chain_word_high = (byte)E;
)
...>
}


@receiver_9_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x5)
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
|
- *(char *)((byte *)npc + 0x5)
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
|
- ((char *)npc)[0x5]
+ (char)((uw_object_hdr_t *)npc)->chain_word_high
)
...>
}


@receiver_9_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x6) = (char)V;
- *(char *)((char *)npc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)npc + 0x6) = (char)V;
- *(byte *)((char *)npc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x6) = (byte)V;
- *(char *)((char *)npc + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)npc + 0x6) = (byte)V;
- *(byte *)((char *)npc + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)npc)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_word_ushort@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(ushort *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((ushort *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(ushort *)((ushort *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}


@receiver_9_w_6_42_word_short@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_signed
|
- *(short *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_signed
|
- ((short *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_signed
|
- *(short *)((short *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_signed
)
...>
}


@receiver_9_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(byte *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- ((byte *)npc)[0x6]
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(byte *)((ushort *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- (byte)((ushort *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_9_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(undefined1 *)((byte *)npc + 0x6)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- ((undefined1 *)npc)[0x6]
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- *(undefined1 *)((ushort *)npc + 0x3)
+ ((uw_object_hdr_t *)npc)->link_word_low
|
- (undefined1)((ushort *)npc)[0x3]
+ ((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_9_w_6_42_store_6@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x6) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- *(char *)((byte *)npc + 0x6) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- ((char *)npc)[0x6] = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
|
- *(char *)((ushort *)npc + 0x3) = E;
+ ((uw_object_hdr_t *)npc)->link_word_low = (byte)E;
)
...>
}


@receiver_9_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x6)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- *(char *)((byte *)npc + 0x6)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- ((char *)npc)[0x6]
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- *(char *)((ushort *)npc + 0x3)
+ (char)((uw_object_hdr_t *)npc)->link_word_low
|
- (char)((ushort *)npc)[0x3]
+ (char)((uw_object_hdr_t *)npc)->link_word_low
)
...>
}


@receiver_9_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- *(byte *)((byte *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- ((byte *)npc)[0x7]
+ ((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_9_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- *(undefined1 *)((byte *)npc + 0x7)
+ ((uw_object_hdr_t *)npc)->link_word_high
|
- ((undefined1 *)npc)[0x7]
+ ((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_9_w_6_42_store_7@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x7) = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
|
- *(char *)((byte *)npc + 0x7) = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
|
- ((char *)npc)[0x7] = E;
+ ((uw_object_hdr_t *)npc)->link_word_high = (byte)E;
)
...>
}


@receiver_9_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)npc + 0x7)
+ (char)((uw_object_hdr_t *)npc)->link_word_high
|
- *(char *)((byte *)npc + 0x7)
+ (char)((uw_object_hdr_t *)npc)->link_word_high
|
- ((char *)npc)[0x7]
+ (char)((uw_object_hdr_t *)npc)->link_word_high
)
...>
}


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x0) = (char)V;
- *(char *)((char *)source + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x0) = (char)V;
- *(byte *)((char *)source + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x0) = (byte)V;
- *(char *)((char *)source + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x0) = (byte)V;
- *(byte *)((char *)source + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- ((ushort *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)((ushort *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- *(short *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- ((short *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_signed
|
- *(short *)((short *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- ((byte *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)((ushort *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- (byte)((ushort *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(byte *)source
+ ((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)((byte *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- ((undefined1 *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)((ushort *)source + 0x0)
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- (undefined1)((ushort *)source)[0x0]
+ ((uw_object_hdr_t *)source)->type_flags_low
|
- *(undefined1 *)source
+ ((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)((byte *)source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- ((char *)source)[0x0] = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)source + 0x0) = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
|
- *(char *)source = E;
+ ((uw_object_hdr_t *)source)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)((byte *)source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- ((char *)source)[0x0]
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)((ushort *)source + 0x0)
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- (char)((ushort *)source)[0x0]
+ (char)((uw_object_hdr_t *)source)->type_flags_low
|
- *(char *)source
+ (char)((uw_object_hdr_t *)source)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- *(byte *)((byte *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- ((byte *)source)[0x1]
+ ((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- *(undefined1 *)((byte *)source + 0x1)
+ ((uw_object_hdr_t *)source)->type_flags_high
|
- ((undefined1 *)source)[0x1]
+ ((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->type_flags_high = (byte)E;
|
- *(char *)((byte *)source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->type_flags_high = (byte)E;
|
- ((char *)source)[0x1] = E;
+ ((uw_object_hdr_t *)source)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x1)
+ (char)((uw_object_hdr_t *)source)->type_flags_high
|
- *(char *)((byte *)source + 0x1)
+ (char)((uw_object_hdr_t *)source)->type_flags_high
|
- ((char *)source)[0x1]
+ (char)((uw_object_hdr_t *)source)->type_flags_high
)
...>
}


@receiver_10_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x2) = (char)V;
- *(char *)((char *)source + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x2) = (char)V;
- *(byte *)((char *)source + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x2) = (byte)V;
- *(char *)((char *)source + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x2) = (byte)V;
- *(byte *)((char *)source + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word
|
- *(ushort *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word
|
- ((ushort *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word
|
- *(ushort *)((ushort *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word
)
...>
}


@receiver_10_w_2_14_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- *(short *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- ((short *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word_signed
|
- *(short *)((short *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_signed
)
...>
}


@receiver_10_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(byte *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- ((byte *)source)[0x2]
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(byte *)((ushort *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- (byte)((ushort *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_10_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(undefined1 *)((byte *)source + 0x2)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- ((undefined1 *)source)[0x2]
+ ((uw_object_hdr_t *)source)->position_word_low
|
- *(undefined1 *)((ushort *)source + 0x1)
+ ((uw_object_hdr_t *)source)->position_word_low
|
- (undefined1)((ushort *)source)[0x1]
+ ((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_10_w_2_14_store_2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- *(char *)((byte *)source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- ((char *)source)[0x2] = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
|
- *(char *)((ushort *)source + 0x1) = E;
+ ((uw_object_hdr_t *)source)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x2)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- *(char *)((byte *)source + 0x2)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- ((char *)source)[0x2]
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- *(char *)((ushort *)source + 0x1)
+ (char)((uw_object_hdr_t *)source)->position_word_low
|
- (char)((ushort *)source)[0x1]
+ (char)((uw_object_hdr_t *)source)->position_word_low
)
...>
}


@receiver_10_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- *(byte *)((byte *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- ((byte *)source)[0x3]
+ ((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_10_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- *(undefined1 *)((byte *)source + 0x3)
+ ((uw_object_hdr_t *)source)->position_word_high
|
- ((undefined1 *)source)[0x3]
+ ((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_10_w_2_14_store_3@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->position_word_high = (byte)E;
|
- *(char *)((byte *)source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->position_word_high = (byte)E;
|
- ((char *)source)[0x3] = E;
+ ((uw_object_hdr_t *)source)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x3)
+ (char)((uw_object_hdr_t *)source)->position_word_high
|
- *(char *)((byte *)source + 0x3)
+ (char)((uw_object_hdr_t *)source)->position_word_high
|
- ((char *)source)[0x3]
+ (char)((uw_object_hdr_t *)source)->position_word_high
)
...>
}


@receiver_10_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x4) = (char)V;
- *(char *)((char *)source + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x4) = (char)V;
- *(byte *)((char *)source + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x4) = (byte)V;
- *(char *)((char *)source + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x4) = (byte)V;
- *(byte *)((char *)source + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(ushort *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- ((ushort *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word
|
- *(ushort *)((ushort *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word
)
...>
}


@receiver_10_w_4_28_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- *(short *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- ((short *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_signed
|
- *(short *)((short *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_signed
)
...>
}


@receiver_10_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(byte *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- ((byte *)source)[0x4]
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(byte *)((ushort *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- (byte)((ushort *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_10_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(undefined1 *)((byte *)source + 0x4)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- ((undefined1 *)source)[0x4]
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- *(undefined1 *)((ushort *)source + 0x2)
+ ((uw_object_hdr_t *)source)->chain_word_low
|
- (undefined1)((ushort *)source)[0x2]
+ ((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_10_w_4_28_store_4@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x4) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- *(char *)((byte *)source + 0x4) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- ((char *)source)[0x4] = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)source + 0x2) = E;
+ ((uw_object_hdr_t *)source)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x4)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- *(char *)((byte *)source + 0x4)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- ((char *)source)[0x4]
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- *(char *)((ushort *)source + 0x2)
+ (char)((uw_object_hdr_t *)source)->chain_word_low
|
- (char)((ushort *)source)[0x2]
+ (char)((uw_object_hdr_t *)source)->chain_word_low
)
...>
}


@receiver_10_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- *(byte *)((byte *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- ((byte *)source)[0x5]
+ ((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_10_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- *(undefined1 *)((byte *)source + 0x5)
+ ((uw_object_hdr_t *)source)->chain_word_high
|
- ((undefined1 *)source)[0x5]
+ ((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_10_w_4_28_store_5@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x5) = E;
+ ((uw_object_hdr_t *)source)->chain_word_high = (byte)E;
|
- *(char *)((byte *)source + 0x5) = E;
+ ((uw_object_hdr_t *)source)->chain_word_high = (byte)E;
|
- ((char *)source)[0x5] = E;
+ ((uw_object_hdr_t *)source)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x5)
+ (char)((uw_object_hdr_t *)source)->chain_word_high
|
- *(char *)((byte *)source + 0x5)
+ (char)((uw_object_hdr_t *)source)->chain_word_high
|
- ((char *)source)[0x5]
+ (char)((uw_object_hdr_t *)source)->chain_word_high
)
...>
}


@receiver_10_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x6) = (char)V;
- *(char *)((char *)source + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source + 0x6) = (char)V;
- *(byte *)((char *)source + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x6) = (byte)V;
- *(char *)((char *)source + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source + 0x6) = (byte)V;
- *(byte *)((char *)source + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_word_ushort@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word
|
- *(ushort *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word
|
- ((ushort *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word
|
- *(ushort *)((ushort *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word
)
...>
}


@receiver_10_w_6_42_word_short@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- *(short *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- ((short *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word_signed
|
- *(short *)((short *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_signed
)
...>
}


@receiver_10_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(byte *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- ((byte *)source)[0x6]
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(byte *)((ushort *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- (byte)((ushort *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_10_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(undefined1 *)((byte *)source + 0x6)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- ((undefined1 *)source)[0x6]
+ ((uw_object_hdr_t *)source)->link_word_low
|
- *(undefined1 *)((ushort *)source + 0x3)
+ ((uw_object_hdr_t *)source)->link_word_low
|
- (undefined1)((ushort *)source)[0x3]
+ ((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_10_w_6_42_store_6@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x6) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- *(char *)((byte *)source + 0x6) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- ((char *)source)[0x6] = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
|
- *(char *)((ushort *)source + 0x3) = E;
+ ((uw_object_hdr_t *)source)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x6)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- *(char *)((byte *)source + 0x6)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- ((char *)source)[0x6]
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- *(char *)((ushort *)source + 0x3)
+ (char)((uw_object_hdr_t *)source)->link_word_low
|
- (char)((ushort *)source)[0x3]
+ (char)((uw_object_hdr_t *)source)->link_word_low
)
...>
}


@receiver_10_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- *(byte *)((byte *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- ((byte *)source)[0x7]
+ ((uw_object_hdr_t *)source)->link_word_high
)
...>
}


@receiver_10_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- *(undefined1 *)((byte *)source + 0x7)
+ ((uw_object_hdr_t *)source)->link_word_high
|
- ((undefined1 *)source)[0x7]
+ ((uw_object_hdr_t *)source)->link_word_high
)
...>
}


@receiver_10_w_6_42_store_7@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x7) = E;
+ ((uw_object_hdr_t *)source)->link_word_high = (byte)E;
|
- *(char *)((byte *)source + 0x7) = E;
+ ((uw_object_hdr_t *)source)->link_word_high = (byte)E;
|
- ((char *)source)[0x7] = E;
+ ((uw_object_hdr_t *)source)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source + 0x7)
+ (char)((uw_object_hdr_t *)source)->link_word_high
|
- *(char *)((byte *)source + 0x7)
+ (char)((uw_object_hdr_t *)source)->link_word_high
|
- ((char *)source)[0x7]
+ (char)((uw_object_hdr_t *)source)->link_word_high
)
...>
}
