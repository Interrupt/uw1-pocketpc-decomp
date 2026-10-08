@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x0) = (char)V;
- *(char *)((char *)puVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x0) = (char)V;
- *(byte *)((char *)puVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x0) = (byte)V;
- *(char *)((char *)puVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x0) = (byte)V;
- *(byte *)((char *)puVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- ((short *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)((short *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((byte *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (byte)((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((undefined1 *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (undefined1)((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- ((char *)puVar2)[0x0] = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)puVar2 = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)((byte *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((char *)puVar2)[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)((ushort *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (char)((ushort *)puVar2)[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)puVar2
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(byte *)((byte *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((byte *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(undefined1 *)((byte *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((undefined1 *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
|
- ((char *)puVar2)[0x1] = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(char *)((byte *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((char *)puVar2)[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x2) = (char)V;
- *(char *)((char *)puVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x2) = (char)V;
- *(byte *)((char *)puVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x2) = (byte)V;
- *(char *)((char *)puVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x2) = (byte)V;
- *(byte *)((char *)puVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- ((short *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)((short *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((byte *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (byte)((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((undefined1 *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (undefined1)((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- ((char *)puVar2)[0x2] = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)((byte *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((char *)puVar2)[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)((ushort *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- (char)((ushort *)puVar2)[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(byte *)((byte *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((byte *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((undefined1 *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
|
- ((char *)puVar2)[0x3] = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(char *)((byte *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((char *)puVar2)[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x4) = (char)V;
- *(char *)((char *)puVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x4) = (char)V;
- *(byte *)((char *)puVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x4) = (byte)V;
- *(char *)((char *)puVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x4) = (byte)V;
- *(byte *)((char *)puVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- ((short *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)((short *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((byte *)puVar2)[0x4]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (byte)((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((undefined1 *)puVar2)[0x4]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (undefined1)((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- ((char *)puVar2)[0x4] = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x4)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)((byte *)puVar2 + 0x4)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((char *)puVar2)[0x4]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)((ushort *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (char)((ushort *)puVar2)[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(byte *)((byte *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((byte *)puVar2)[0x5]
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((undefined1 *)puVar2)[0x5]
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
|
- ((char *)puVar2)[0x5] = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x5)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(char *)((byte *)puVar2 + 0x5)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((char *)puVar2)[0x5]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x6) = (char)V;
- *(char *)((char *)puVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x6) = (char)V;
- *(byte *)((char *)puVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x6) = (byte)V;
- *(char *)((char *)puVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x6) = (byte)V;
- *(byte *)((char *)puVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- ((short *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)((short *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((byte *)puVar2)[0x6]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (byte)((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((undefined1 *)puVar2)[0x6]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (undefined1)((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- ((char *)puVar2)[0x6] = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x6)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)((byte *)puVar2 + 0x6)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((char *)puVar2)[0x6]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)((ushort *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- (char)((ushort *)puVar2)[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(byte *)((byte *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((byte *)puVar2)[0x7]
+ ((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((undefined1 *)puVar2)[0x7]
+ ((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
|
- ((char *)puVar2)[0x7] = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\|reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x7)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(char *)((byte *)puVar2 + 0x7)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((char *)puVar2)[0x7]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x0) = (char)V;
- *(char *)((char *)psVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x0) = (char)V;
- *(byte *)((char *)psVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x0) = (byte)V;
- *(char *)((char *)psVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x0) = (byte)V;
- *(byte *)((char *)psVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags
|
- *(ushort *)((byte *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags
|
- ((ushort *)psVar3)[0x0]
+ ((uw_object_hdr_t *)psVar3)->type_flags
|
- *(ushort *)((ushort *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_signed
|
- *(short *)((byte *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_signed
|
- ((short *)psVar3)[0x0]
+ ((uw_object_hdr_t *)psVar3)->type_flags_signed
|
- *(short *)((short *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(byte *)((byte *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- ((byte *)psVar3)[0x0]
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(byte *)((ushort *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- (byte)((ushort *)psVar3)[0x0]
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(byte *)psVar3
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(undefined1 *)((byte *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- ((undefined1 *)psVar3)[0x0]
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)psVar3 + 0x0)
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- (undefined1)((ushort *)psVar3)[0x0]
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(undefined1 *)psVar3
+ ((uw_object_hdr_t *)psVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_low = (byte)E;
|
- ((char *)psVar3)[0x0] = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)psVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_low = (byte)E;
|
- *(char *)psVar3 = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x0)
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(char *)((byte *)psVar3 + 0x0)
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_low
|
- ((char *)psVar3)[0x0]
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(char *)((ushort *)psVar3 + 0x0)
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_low
|
- (char)((ushort *)psVar3)[0x0]
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_low
|
- *(char *)psVar3
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->type_flags_high
|
- *(byte *)((byte *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->type_flags_high
|
- ((byte *)psVar3)[0x1]
+ ((uw_object_hdr_t *)psVar3)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->type_flags_high
|
- *(undefined1 *)((byte *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->type_flags_high
|
- ((undefined1 *)psVar3)[0x1]
+ ((uw_object_hdr_t *)psVar3)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_high = (byte)E;
|
- ((char *)psVar3)[0x1] = E;
+ ((uw_object_hdr_t *)psVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x1)
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_high
|
- *(char *)((byte *)psVar3 + 0x1)
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_high
|
- ((char *)psVar3)[0x1]
+ (char)((uw_object_hdr_t *)psVar3)->type_flags_high
)
...>
}


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x2) = (char)V;
- *(char *)((char *)psVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x2) = (char)V;
- *(byte *)((char *)psVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x2) = (byte)V;
- *(char *)((char *)psVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x2) = (byte)V;
- *(byte *)((char *)psVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word
|
- *(ushort *)((byte *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word
|
- ((ushort *)psVar3)[0x1]
+ ((uw_object_hdr_t *)psVar3)->position_word
|
- *(ushort *)((ushort *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->position_word
)
...>
}


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word_signed
|
- *(short *)((byte *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word_signed
|
- ((short *)psVar3)[0x1]
+ ((uw_object_hdr_t *)psVar3)->position_word_signed
|
- *(short *)((short *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->position_word_signed
)
...>
}


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- *(byte *)((byte *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- ((byte *)psVar3)[0x2]
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- *(byte *)((ushort *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- (byte)((ushort *)psVar3)[0x1]
+ ((uw_object_hdr_t *)psVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- *(undefined1 *)((byte *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- ((undefined1 *)psVar3)[0x2]
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- *(undefined1 *)((ushort *)psVar3 + 0x1)
+ ((uw_object_hdr_t *)psVar3)->position_word_low
|
- (undefined1)((ushort *)psVar3)[0x1]
+ ((uw_object_hdr_t *)psVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_low = (byte)E;
|
- ((char *)psVar3)[0x2] = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)psVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x2)
+ (char)((uw_object_hdr_t *)psVar3)->position_word_low
|
- *(char *)((byte *)psVar3 + 0x2)
+ (char)((uw_object_hdr_t *)psVar3)->position_word_low
|
- ((char *)psVar3)[0x2]
+ (char)((uw_object_hdr_t *)psVar3)->position_word_low
|
- *(char *)((ushort *)psVar3 + 0x1)
+ (char)((uw_object_hdr_t *)psVar3)->position_word_low
|
- (char)((ushort *)psVar3)[0x1]
+ (char)((uw_object_hdr_t *)psVar3)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->position_word_high
|
- *(byte *)((byte *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->position_word_high
|
- ((byte *)psVar3)[0x3]
+ ((uw_object_hdr_t *)psVar3)->position_word_high
)
...>
}


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->position_word_high
|
- *(undefined1 *)((byte *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->position_word_high
|
- ((undefined1 *)psVar3)[0x3]
+ ((uw_object_hdr_t *)psVar3)->position_word_high
)
...>
}


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_high = (byte)E;
|
- ((char *)psVar3)[0x3] = E;
+ ((uw_object_hdr_t *)psVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x3)
+ (char)((uw_object_hdr_t *)psVar3)->position_word_high
|
- *(char *)((byte *)psVar3 + 0x3)
+ (char)((uw_object_hdr_t *)psVar3)->position_word_high
|
- ((char *)psVar3)[0x3]
+ (char)((uw_object_hdr_t *)psVar3)->position_word_high
)
...>
}


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x4) = (char)V;
- *(char *)((char *)psVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x4) = (char)V;
- *(byte *)((char *)psVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x4) = (byte)V;
- *(char *)((char *)psVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x4) = (byte)V;
- *(byte *)((char *)psVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word
|
- *(ushort *)((byte *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word
|
- ((ushort *)psVar3)[0x2]
+ ((uw_object_hdr_t *)psVar3)->chain_word
|
- *(ushort *)((ushort *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->chain_word
)
...>
}


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word_signed
|
- *(short *)((byte *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word_signed
|
- ((short *)psVar3)[0x2]
+ ((uw_object_hdr_t *)psVar3)->chain_word_signed
|
- *(short *)((short *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->chain_word_signed
)
...>
}


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- *(byte *)((byte *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- ((byte *)psVar3)[0x4]
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- *(byte *)((ushort *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- (byte)((ushort *)psVar3)[0x2]
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- *(undefined1 *)((byte *)psVar3 + 0x4)
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- ((undefined1 *)psVar3)[0x4]
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)psVar3 + 0x2)
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
|
- (undefined1)((ushort *)psVar3)[0x2]
+ ((uw_object_hdr_t *)psVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_low = (byte)E;
|
- ((char *)psVar3)[0x4] = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)psVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x4)
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_low
|
- *(char *)((byte *)psVar3 + 0x4)
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_low
|
- ((char *)psVar3)[0x4]
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_low
|
- *(char *)((ushort *)psVar3 + 0x2)
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_low
|
- (char)((ushort *)psVar3)[0x2]
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x5)
+ ((uw_object_hdr_t *)psVar3)->chain_word_high
|
- *(byte *)((byte *)psVar3 + 0x5)
+ ((uw_object_hdr_t *)psVar3)->chain_word_high
|
- ((byte *)psVar3)[0x5]
+ ((uw_object_hdr_t *)psVar3)->chain_word_high
)
...>
}


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x5)
+ ((uw_object_hdr_t *)psVar3)->chain_word_high
|
- *(undefined1 *)((byte *)psVar3 + 0x5)
+ ((uw_object_hdr_t *)psVar3)->chain_word_high
|
- ((undefined1 *)psVar3)[0x5]
+ ((uw_object_hdr_t *)psVar3)->chain_word_high
)
...>
}


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_high = (byte)E;
|
- ((char *)psVar3)[0x5] = E;
+ ((uw_object_hdr_t *)psVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x5)
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_high
|
- *(char *)((byte *)psVar3 + 0x5)
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_high
|
- ((char *)psVar3)[0x5]
+ (char)((uw_object_hdr_t *)psVar3)->chain_word_high
)
...>
}


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x6) = (char)V;
- *(char *)((char *)psVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar3 + 0x6) = (char)V;
- *(byte *)((char *)psVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x6) = (byte)V;
- *(char *)((char *)psVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar3 + 0x6) = (byte)V;
- *(byte *)((char *)psVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar3)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word
|
- *(ushort *)((byte *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word
|
- ((ushort *)psVar3)[0x3]
+ ((uw_object_hdr_t *)psVar3)->link_word
|
- *(ushort *)((ushort *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->link_word
)
...>
}


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word_signed
|
- *(short *)((byte *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word_signed
|
- ((short *)psVar3)[0x3]
+ ((uw_object_hdr_t *)psVar3)->link_word_signed
|
- *(short *)((short *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->link_word_signed
)
...>
}


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- *(byte *)((byte *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- ((byte *)psVar3)[0x6]
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- *(byte *)((ushort *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- (byte)((ushort *)psVar3)[0x3]
+ ((uw_object_hdr_t *)psVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- *(undefined1 *)((byte *)psVar3 + 0x6)
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- ((undefined1 *)psVar3)[0x6]
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- *(undefined1 *)((ushort *)psVar3 + 0x3)
+ ((uw_object_hdr_t *)psVar3)->link_word_low
|
- (undefined1)((ushort *)psVar3)[0x3]
+ ((uw_object_hdr_t *)psVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_low = (byte)E;
|
- ((char *)psVar3)[0x6] = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)psVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x6)
+ (char)((uw_object_hdr_t *)psVar3)->link_word_low
|
- *(char *)((byte *)psVar3 + 0x6)
+ (char)((uw_object_hdr_t *)psVar3)->link_word_low
|
- ((char *)psVar3)[0x6]
+ (char)((uw_object_hdr_t *)psVar3)->link_word_low
|
- *(char *)((ushort *)psVar3 + 0x3)
+ (char)((uw_object_hdr_t *)psVar3)->link_word_low
|
- (char)((ushort *)psVar3)[0x3]
+ (char)((uw_object_hdr_t *)psVar3)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar3 + 0x7)
+ ((uw_object_hdr_t *)psVar3)->link_word_high
|
- *(byte *)((byte *)psVar3 + 0x7)
+ ((uw_object_hdr_t *)psVar3)->link_word_high
|
- ((byte *)psVar3)[0x7]
+ ((uw_object_hdr_t *)psVar3)->link_word_high
)
...>
}


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar3 + 0x7)
+ ((uw_object_hdr_t *)psVar3)->link_word_high
|
- *(undefined1 *)((byte *)psVar3 + 0x7)
+ ((uw_object_hdr_t *)psVar3)->link_word_high
|
- ((undefined1 *)psVar3)[0x7]
+ ((uw_object_hdr_t *)psVar3)->link_word_high
)
...>
}


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)psVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_high = (byte)E;
|
- ((char *)psVar3)[0x7] = E;
+ ((uw_object_hdr_t *)psVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(reticle_object_pick\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar3 + 0x7)
+ (char)((uw_object_hdr_t *)psVar3)->link_word_high
|
- *(char *)((byte *)psVar3 + 0x7)
+ (char)((uw_object_hdr_t *)psVar3)->link_word_high
|
- ((char *)psVar3)[0x7]
+ (char)((uw_object_hdr_t *)psVar3)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
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

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(sweep_land_on_surface\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x0) = (char)V;
- *(char *)((char *)uVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x0) = (char)V;
- *(byte *)((char *)uVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x0) = (byte)V;
- *(char *)((char *)uVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x0) = (byte)V;
- *(byte *)((char *)uVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)((byte *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- ((ushort *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)((ushort *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_signed
|
- *(short *)((byte *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_signed
|
- ((short *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags_signed
|
- *(short *)((short *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(byte *)((byte *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- ((byte *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(byte *)((ushort *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- (byte)((ushort *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(byte *)uVar4
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(undefined1 *)((byte *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- ((undefined1 *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)uVar4 + 0x0)
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- (undefined1)((ushort *)uVar4)[0x0]
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(undefined1 *)uVar4
+ ((uw_object_hdr_t *)uVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_low = (byte)E;
|
- ((char *)uVar4)[0x0] = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)uVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_low = (byte)E;
|
- *(char *)uVar4 = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x0)
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(char *)((byte *)uVar4 + 0x0)
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_low
|
- ((char *)uVar4)[0x0]
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(char *)((ushort *)uVar4 + 0x0)
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_low
|
- (char)((ushort *)uVar4)[0x0]
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_low
|
- *(char *)uVar4
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->type_flags_high
|
- *(byte *)((byte *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->type_flags_high
|
- ((byte *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->type_flags_high
|
- *(undefined1 *)((byte *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->type_flags_high
|
- ((undefined1 *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_high = (byte)E;
|
- ((char *)uVar4)[0x1] = E;
+ ((uw_object_hdr_t *)uVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x1)
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_high
|
- *(char *)((byte *)uVar4 + 0x1)
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_high
|
- ((char *)uVar4)[0x1]
+ (char)((uw_object_hdr_t *)uVar4)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x2) = (char)V;
- *(char *)((char *)uVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x2) = (char)V;
- *(byte *)((char *)uVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x2) = (byte)V;
- *(char *)((char *)uVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x2) = (byte)V;
- *(byte *)((char *)uVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- *(ushort *)((byte *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- ((ushort *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- *(ushort *)((ushort *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word_signed
|
- *(short *)((byte *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word_signed
|
- ((short *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->position_word_signed
|
- *(short *)((short *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- *(byte *)((byte *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- ((byte *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- *(byte *)((ushort *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- (byte)((ushort *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- *(undefined1 *)((byte *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- ((undefined1 *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- *(undefined1 *)((ushort *)uVar4 + 0x1)
+ ((uw_object_hdr_t *)uVar4)->position_word_low
|
- (undefined1)((ushort *)uVar4)[0x1]
+ ((uw_object_hdr_t *)uVar4)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_low = (byte)E;
|
- ((char *)uVar4)[0x2] = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)uVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x2)
+ (char)((uw_object_hdr_t *)uVar4)->position_word_low
|
- *(char *)((byte *)uVar4 + 0x2)
+ (char)((uw_object_hdr_t *)uVar4)->position_word_low
|
- ((char *)uVar4)[0x2]
+ (char)((uw_object_hdr_t *)uVar4)->position_word_low
|
- *(char *)((ushort *)uVar4 + 0x1)
+ (char)((uw_object_hdr_t *)uVar4)->position_word_low
|
- (char)((ushort *)uVar4)[0x1]
+ (char)((uw_object_hdr_t *)uVar4)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->position_word_high
|
- *(byte *)((byte *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->position_word_high
|
- ((byte *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->position_word_high
|
- *(undefined1 *)((byte *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->position_word_high
|
- ((undefined1 *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_high = (byte)E;
|
- ((char *)uVar4)[0x3] = E;
+ ((uw_object_hdr_t *)uVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x3)
+ (char)((uw_object_hdr_t *)uVar4)->position_word_high
|
- *(char *)((byte *)uVar4 + 0x3)
+ (char)((uw_object_hdr_t *)uVar4)->position_word_high
|
- ((char *)uVar4)[0x3]
+ (char)((uw_object_hdr_t *)uVar4)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x4) = (char)V;
- *(char *)((char *)uVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x4) = (char)V;
- *(byte *)((char *)uVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x4) = (byte)V;
- *(char *)((char *)uVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x4) = (byte)V;
- *(byte *)((char *)uVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- *(ushort *)((byte *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- ((ushort *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- *(ushort *)((ushort *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word_signed
|
- *(short *)((byte *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word_signed
|
- ((short *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->chain_word_signed
|
- *(short *)((short *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- *(byte *)((byte *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- ((byte *)uVar4)[0x4]
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- *(byte *)((ushort *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- (byte)((ushort *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- *(undefined1 *)((byte *)uVar4 + 0x4)
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- ((undefined1 *)uVar4)[0x4]
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)uVar4 + 0x2)
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
|
- (undefined1)((ushort *)uVar4)[0x2]
+ ((uw_object_hdr_t *)uVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_low = (byte)E;
|
- ((char *)uVar4)[0x4] = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)uVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x4)
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_low
|
- *(char *)((byte *)uVar4 + 0x4)
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_low
|
- ((char *)uVar4)[0x4]
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_low
|
- *(char *)((ushort *)uVar4 + 0x2)
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_low
|
- (char)((ushort *)uVar4)[0x2]
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x5)
+ ((uw_object_hdr_t *)uVar4)->chain_word_high
|
- *(byte *)((byte *)uVar4 + 0x5)
+ ((uw_object_hdr_t *)uVar4)->chain_word_high
|
- ((byte *)uVar4)[0x5]
+ ((uw_object_hdr_t *)uVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x5)
+ ((uw_object_hdr_t *)uVar4)->chain_word_high
|
- *(undefined1 *)((byte *)uVar4 + 0x5)
+ ((uw_object_hdr_t *)uVar4)->chain_word_high
|
- ((undefined1 *)uVar4)[0x5]
+ ((uw_object_hdr_t *)uVar4)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_high = (byte)E;
|
- ((char *)uVar4)[0x5] = E;
+ ((uw_object_hdr_t *)uVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x5)
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_high
|
- *(char *)((byte *)uVar4 + 0x5)
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_high
|
- ((char *)uVar4)[0x5]
+ (char)((uw_object_hdr_t *)uVar4)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x6) = (char)V;
- *(char *)((char *)uVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar4 + 0x6) = (char)V;
- *(byte *)((char *)uVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x6) = (byte)V;
- *(char *)((char *)uVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar4 + 0x6) = (byte)V;
- *(byte *)((char *)uVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar4)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- *(ushort *)((byte *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- ((ushort *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- *(ushort *)((ushort *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word_signed
|
- *(short *)((byte *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word_signed
|
- ((short *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->link_word_signed
|
- *(short *)((short *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- *(byte *)((byte *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- ((byte *)uVar4)[0x6]
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- *(byte *)((ushort *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- (byte)((ushort *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- *(undefined1 *)((byte *)uVar4 + 0x6)
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- ((undefined1 *)uVar4)[0x6]
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- *(undefined1 *)((ushort *)uVar4 + 0x3)
+ ((uw_object_hdr_t *)uVar4)->link_word_low
|
- (undefined1)((ushort *)uVar4)[0x3]
+ ((uw_object_hdr_t *)uVar4)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_low = (byte)E;
|
- ((char *)uVar4)[0x6] = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)uVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x6)
+ (char)((uw_object_hdr_t *)uVar4)->link_word_low
|
- *(char *)((byte *)uVar4 + 0x6)
+ (char)((uw_object_hdr_t *)uVar4)->link_word_low
|
- ((char *)uVar4)[0x6]
+ (char)((uw_object_hdr_t *)uVar4)->link_word_low
|
- *(char *)((ushort *)uVar4 + 0x3)
+ (char)((uw_object_hdr_t *)uVar4)->link_word_low
|
- (char)((ushort *)uVar4)[0x3]
+ (char)((uw_object_hdr_t *)uVar4)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar4 + 0x7)
+ ((uw_object_hdr_t *)uVar4)->link_word_high
|
- *(byte *)((byte *)uVar4 + 0x7)
+ ((uw_object_hdr_t *)uVar4)->link_word_high
|
- ((byte *)uVar4)[0x7]
+ ((uw_object_hdr_t *)uVar4)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar4 + 0x7)
+ ((uw_object_hdr_t *)uVar4)->link_word_high
|
- *(undefined1 *)((byte *)uVar4 + 0x7)
+ ((uw_object_hdr_t *)uVar4)->link_word_high
|
- ((undefined1 *)uVar4)[0x7]
+ ((uw_object_hdr_t *)uVar4)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)uVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_high = (byte)E;
|
- ((char *)uVar4)[0x7] = E;
+ ((uw_object_hdr_t *)uVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(find_nearby_door_in_candidates\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar4 + 0x7)
+ (char)((uw_object_hdr_t *)uVar4)->link_word_high
|
- *(char *)((byte *)uVar4 + 0x7)
+ (char)((uw_object_hdr_t *)uVar4)->link_word_high
|
- ((char *)uVar4)[0x7]
+ (char)((uw_object_hdr_t *)uVar4)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x0) = (char)V;
- *(char *)((char *)uVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x0) = (char)V;
- *(byte *)((char *)uVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x0) = (byte)V;
- *(char *)((char *)uVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x0) = (byte)V;
- *(byte *)((char *)uVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)((byte *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- ((ushort *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)((ushort *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_signed
|
- *(short *)((byte *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_signed
|
- ((short *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags_signed
|
- *(short *)((short *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(byte *)((byte *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- ((byte *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(byte *)((ushort *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- (byte)((ushort *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(byte *)uVar1
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(undefined1 *)((byte *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- ((undefined1 *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- (undefined1)((ushort *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(undefined1 *)uVar1
+ ((uw_object_hdr_t *)uVar1)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_low = (byte)E;
|
- ((char *)uVar1)[0x0] = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)uVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_low = (byte)E;
|
- *(char *)uVar1 = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x0)
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(char *)((byte *)uVar1 + 0x0)
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_low
|
- ((char *)uVar1)[0x0]
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(char *)((ushort *)uVar1 + 0x0)
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_low
|
- (char)((ushort *)uVar1)[0x0]
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_low
|
- *(char *)uVar1
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->type_flags_high
|
- *(byte *)((byte *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->type_flags_high
|
- ((byte *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->type_flags_high
|
- *(undefined1 *)((byte *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->type_flags_high
|
- ((undefined1 *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_high = (byte)E;
|
- ((char *)uVar1)[0x1] = E;
+ ((uw_object_hdr_t *)uVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x1)
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_high
|
- *(char *)((byte *)uVar1 + 0x1)
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_high
|
- ((char *)uVar1)[0x1]
+ (char)((uw_object_hdr_t *)uVar1)->type_flags_high
)
...>
}


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x2) = (char)V;
- *(char *)((char *)uVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x2) = (char)V;
- *(byte *)((char *)uVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x2) = (byte)V;
- *(char *)((char *)uVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x2) = (byte)V;
- *(byte *)((char *)uVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- *(ushort *)((byte *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- ((ushort *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- *(ushort *)((ushort *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->position_word
)
...>
}


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word_signed
|
- *(short *)((byte *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word_signed
|
- ((short *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->position_word_signed
|
- *(short *)((short *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->position_word_signed
)
...>
}


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- *(byte *)((byte *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- ((byte *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- *(byte *)((ushort *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- (byte)((ushort *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- *(undefined1 *)((byte *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- ((undefined1 *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- *(undefined1 *)((ushort *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->position_word_low
|
- (undefined1)((ushort *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->position_word_low
)
...>
}


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_low = (byte)E;
|
- ((char *)uVar1)[0x2] = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)uVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x2)
+ (char)((uw_object_hdr_t *)uVar1)->position_word_low
|
- *(char *)((byte *)uVar1 + 0x2)
+ (char)((uw_object_hdr_t *)uVar1)->position_word_low
|
- ((char *)uVar1)[0x2]
+ (char)((uw_object_hdr_t *)uVar1)->position_word_low
|
- *(char *)((ushort *)uVar1 + 0x1)
+ (char)((uw_object_hdr_t *)uVar1)->position_word_low
|
- (char)((ushort *)uVar1)[0x1]
+ (char)((uw_object_hdr_t *)uVar1)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->position_word_high
|
- *(byte *)((byte *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->position_word_high
|
- ((byte *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->position_word_high
)
...>
}


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->position_word_high
|
- *(undefined1 *)((byte *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->position_word_high
|
- ((undefined1 *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->position_word_high
)
...>
}


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_high = (byte)E;
|
- ((char *)uVar1)[0x3] = E;
+ ((uw_object_hdr_t *)uVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x3)
+ (char)((uw_object_hdr_t *)uVar1)->position_word_high
|
- *(char *)((byte *)uVar1 + 0x3)
+ (char)((uw_object_hdr_t *)uVar1)->position_word_high
|
- ((char *)uVar1)[0x3]
+ (char)((uw_object_hdr_t *)uVar1)->position_word_high
)
...>
}


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x4) = (char)V;
- *(char *)((char *)uVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x4) = (char)V;
- *(byte *)((char *)uVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x4) = (byte)V;
- *(char *)((char *)uVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x4) = (byte)V;
- *(byte *)((char *)uVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- *(ushort *)((byte *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- ((ushort *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- *(ushort *)((ushort *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->chain_word
)
...>
}


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word_signed
|
- *(short *)((byte *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word_signed
|
- ((short *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->chain_word_signed
|
- *(short *)((short *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->chain_word_signed
)
...>
}


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- *(byte *)((byte *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- ((byte *)uVar1)[0x4]
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- *(byte *)((ushort *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- (byte)((ushort *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- *(undefined1 *)((byte *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- ((undefined1 *)uVar1)[0x4]
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
|
- (undefined1)((ushort *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->chain_word_low
)
...>
}


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_low = (byte)E;
|
- ((char *)uVar1)[0x4] = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)uVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x4)
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_low
|
- *(char *)((byte *)uVar1 + 0x4)
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_low
|
- ((char *)uVar1)[0x4]
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_low
|
- *(char *)((ushort *)uVar1 + 0x2)
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_low
|
- (char)((ushort *)uVar1)[0x2]
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x5)
+ ((uw_object_hdr_t *)uVar1)->chain_word_high
|
- *(byte *)((byte *)uVar1 + 0x5)
+ ((uw_object_hdr_t *)uVar1)->chain_word_high
|
- ((byte *)uVar1)[0x5]
+ ((uw_object_hdr_t *)uVar1)->chain_word_high
)
...>
}


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x5)
+ ((uw_object_hdr_t *)uVar1)->chain_word_high
|
- *(undefined1 *)((byte *)uVar1 + 0x5)
+ ((uw_object_hdr_t *)uVar1)->chain_word_high
|
- ((undefined1 *)uVar1)[0x5]
+ ((uw_object_hdr_t *)uVar1)->chain_word_high
)
...>
}


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_high = (byte)E;
|
- ((char *)uVar1)[0x5] = E;
+ ((uw_object_hdr_t *)uVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x5)
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_high
|
- *(char *)((byte *)uVar1 + 0x5)
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_high
|
- ((char *)uVar1)[0x5]
+ (char)((uw_object_hdr_t *)uVar1)->chain_word_high
)
...>
}


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x6) = (char)V;
- *(char *)((char *)uVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar1 + 0x6) = (char)V;
- *(byte *)((char *)uVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x6) = (byte)V;
- *(char *)((char *)uVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar1 + 0x6) = (byte)V;
- *(byte *)((char *)uVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar1)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- *(ushort *)((byte *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- ((ushort *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- *(ushort *)((ushort *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->link_word
)
...>
}


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word_signed
|
- *(short *)((byte *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word_signed
|
- ((short *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->link_word_signed
|
- *(short *)((short *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->link_word_signed
)
...>
}


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- *(byte *)((byte *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- ((byte *)uVar1)[0x6]
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- *(byte *)((ushort *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- (byte)((ushort *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- *(undefined1 *)((byte *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- ((undefined1 *)uVar1)[0x6]
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- *(undefined1 *)((ushort *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->link_word_low
|
- (undefined1)((ushort *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->link_word_low
)
...>
}


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_low = (byte)E;
|
- ((char *)uVar1)[0x6] = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)uVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x6)
+ (char)((uw_object_hdr_t *)uVar1)->link_word_low
|
- *(char *)((byte *)uVar1 + 0x6)
+ (char)((uw_object_hdr_t *)uVar1)->link_word_low
|
- ((char *)uVar1)[0x6]
+ (char)((uw_object_hdr_t *)uVar1)->link_word_low
|
- *(char *)((ushort *)uVar1 + 0x3)
+ (char)((uw_object_hdr_t *)uVar1)->link_word_low
|
- (char)((ushort *)uVar1)[0x3]
+ (char)((uw_object_hdr_t *)uVar1)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar1 + 0x7)
+ ((uw_object_hdr_t *)uVar1)->link_word_high
|
- *(byte *)((byte *)uVar1 + 0x7)
+ ((uw_object_hdr_t *)uVar1)->link_word_high
|
- ((byte *)uVar1)[0x7]
+ ((uw_object_hdr_t *)uVar1)->link_word_high
)
...>
}


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar1 + 0x7)
+ ((uw_object_hdr_t *)uVar1)->link_word_high
|
- *(undefined1 *)((byte *)uVar1 + 0x7)
+ ((uw_object_hdr_t *)uVar1)->link_word_high
|
- ((undefined1 *)uVar1)[0x7]
+ ((uw_object_hdr_t *)uVar1)->link_word_high
)
...>
}


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)uVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_high = (byte)E;
|
- ((char *)uVar1)[0x7] = E;
+ ((uw_object_hdr_t *)uVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(get_first_nearby_candidate_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar1 + 0x7)
+ (char)((uw_object_hdr_t *)uVar1)->link_word_high
|
- *(char *)((byte *)uVar1 + 0x7)
+ (char)((uw_object_hdr_t *)uVar1)->link_word_high
|
- ((char *)uVar1)[0x7]
+ (char)((uw_object_hdr_t *)uVar1)->link_word_high
)
...>
}
