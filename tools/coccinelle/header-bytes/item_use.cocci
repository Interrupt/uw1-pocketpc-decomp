@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(drop_held_object_near_player\|place_object_in_equipment_slot\|reduce_object_count\)$";
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
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
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


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x0) = (char)V;
- *(char *)((char *)found_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x0) = (char)V;
- *(byte *)((char *)found_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x0) = (byte)V;
- *(char *)((char *)found_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x0) = (byte)V;
- *(byte *)((char *)found_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *(ushort *)((byte *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- ((ushort *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *(ushort *)((ushort *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_signed
|
- *(short *)((byte *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_signed
|
- ((short *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_signed
|
- *(short *)((short *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(byte *)((byte *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- ((byte *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(byte *)((ushort *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- (byte)((ushort *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(byte *)found_item
+ ((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(undefined1 *)((byte *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- ((undefined1 *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(undefined1 *)((ushort *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- (undefined1)((ushort *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(undefined1 *)found_item
+ ((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x0) = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_low = (byte)E;
|
- *(char *)((byte *)found_item + 0x0) = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_low = (byte)E;
|
- ((char *)found_item)[0x0] = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)found_item + 0x0) = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_low = (byte)E;
|
- *(char *)found_item = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x0)
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(char *)((byte *)found_item + 0x0)
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
|
- ((char *)found_item)[0x0]
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(char *)((ushort *)found_item + 0x0)
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
|
- (char)((ushort *)found_item)[0x0]
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
|
- *(char *)found_item
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->type_flags_high
|
- *(byte *)((byte *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->type_flags_high
|
- ((byte *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->type_flags_high
|
- *(undefined1 *)((byte *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->type_flags_high
|
- ((undefined1 *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x1) = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_high = (byte)E;
|
- *(char *)((byte *)found_item + 0x1) = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_high = (byte)E;
|
- ((char *)found_item)[0x1] = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x1)
+ (char)((uw_object_hdr_t *)found_item)->type_flags_high
|
- *(char *)((byte *)found_item + 0x1)
+ (char)((uw_object_hdr_t *)found_item)->type_flags_high
|
- ((char *)found_item)[0x1]
+ (char)((uw_object_hdr_t *)found_item)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x2) = (char)V;
- *(char *)((char *)found_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x2) = (char)V;
- *(byte *)((char *)found_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x2) = (byte)V;
- *(char *)((char *)found_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x2) = (byte)V;
- *(byte *)((char *)found_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- *(ushort *)((byte *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- ((ushort *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word
|
- *(ushort *)((ushort *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word_signed
|
- *(short *)((byte *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word_signed
|
- ((short *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word_signed
|
- *(short *)((short *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- *(byte *)((byte *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- ((byte *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- *(byte *)((ushort *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- (byte)((ushort *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- *(undefined1 *)((byte *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- ((undefined1 *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- *(undefined1 *)((ushort *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- (undefined1)((ushort *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x2) = E;
+ ((uw_object_hdr_t *)found_item)->position_word_low = (byte)E;
|
- *(char *)((byte *)found_item + 0x2) = E;
+ ((uw_object_hdr_t *)found_item)->position_word_low = (byte)E;
|
- ((char *)found_item)[0x2] = E;
+ ((uw_object_hdr_t *)found_item)->position_word_low = (byte)E;
|
- *(char *)((ushort *)found_item + 0x1) = E;
+ ((uw_object_hdr_t *)found_item)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x2)
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
|
- *(char *)((byte *)found_item + 0x2)
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
|
- ((char *)found_item)[0x2]
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
|
- *(char *)((ushort *)found_item + 0x1)
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
|
- (char)((ushort *)found_item)[0x1]
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->position_word_high
|
- *(byte *)((byte *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->position_word_high
|
- ((byte *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->position_word_high
|
- *(undefined1 *)((byte *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->position_word_high
|
- ((undefined1 *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x3) = E;
+ ((uw_object_hdr_t *)found_item)->position_word_high = (byte)E;
|
- *(char *)((byte *)found_item + 0x3) = E;
+ ((uw_object_hdr_t *)found_item)->position_word_high = (byte)E;
|
- ((char *)found_item)[0x3] = E;
+ ((uw_object_hdr_t *)found_item)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x3)
+ (char)((uw_object_hdr_t *)found_item)->position_word_high
|
- *(char *)((byte *)found_item + 0x3)
+ (char)((uw_object_hdr_t *)found_item)->position_word_high
|
- ((char *)found_item)[0x3]
+ (char)((uw_object_hdr_t *)found_item)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x4) = (char)V;
- *(char *)((char *)found_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x4) = (char)V;
- *(byte *)((char *)found_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x4) = (byte)V;
- *(char *)((char *)found_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x4) = (byte)V;
- *(byte *)((char *)found_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- *(ushort *)((byte *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- ((ushort *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- *(ushort *)((ushort *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word_signed
|
- *(short *)((byte *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word_signed
|
- ((short *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word_signed
|
- *(short *)((short *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- *(byte *)((byte *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- ((byte *)found_item)[0x4]
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- *(byte *)((ushort *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- (byte)((ushort *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- *(undefined1 *)((byte *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- ((undefined1 *)found_item)[0x4]
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- *(undefined1 *)((ushort *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- (undefined1)((ushort *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x4) = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_low = (byte)E;
|
- *(char *)((byte *)found_item + 0x4) = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_low = (byte)E;
|
- ((char *)found_item)[0x4] = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)found_item + 0x2) = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x4)
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
|
- *(char *)((byte *)found_item + 0x4)
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
|
- ((char *)found_item)[0x4]
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
|
- *(char *)((ushort *)found_item + 0x2)
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
|
- (char)((ushort *)found_item)[0x2]
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x5)
+ ((uw_object_hdr_t *)found_item)->chain_word_high
|
- *(byte *)((byte *)found_item + 0x5)
+ ((uw_object_hdr_t *)found_item)->chain_word_high
|
- ((byte *)found_item)[0x5]
+ ((uw_object_hdr_t *)found_item)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x5)
+ ((uw_object_hdr_t *)found_item)->chain_word_high
|
- *(undefined1 *)((byte *)found_item + 0x5)
+ ((uw_object_hdr_t *)found_item)->chain_word_high
|
- ((undefined1 *)found_item)[0x5]
+ ((uw_object_hdr_t *)found_item)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x5) = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_high = (byte)E;
|
- *(char *)((byte *)found_item + 0x5) = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_high = (byte)E;
|
- ((char *)found_item)[0x5] = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x5)
+ (char)((uw_object_hdr_t *)found_item)->chain_word_high
|
- *(char *)((byte *)found_item + 0x5)
+ (char)((uw_object_hdr_t *)found_item)->chain_word_high
|
- ((char *)found_item)[0x5]
+ (char)((uw_object_hdr_t *)found_item)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x6) = (char)V;
- *(char *)((char *)found_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found_item + 0x6) = (char)V;
- *(byte *)((char *)found_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x6) = (byte)V;
- *(char *)((char *)found_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found_item + 0x6) = (byte)V;
- *(byte *)((char *)found_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found_item)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- *(ushort *)((byte *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- ((ushort *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word
|
- *(ushort *)((ushort *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word_signed
|
- *(short *)((byte *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word_signed
|
- ((short *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word_signed
|
- *(short *)((short *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- *(byte *)((byte *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- ((byte *)found_item)[0x6]
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- *(byte *)((ushort *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- (byte)((ushort *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- *(undefined1 *)((byte *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- ((undefined1 *)found_item)[0x6]
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- *(undefined1 *)((ushort *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- (undefined1)((ushort *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x6) = E;
+ ((uw_object_hdr_t *)found_item)->link_word_low = (byte)E;
|
- *(char *)((byte *)found_item + 0x6) = E;
+ ((uw_object_hdr_t *)found_item)->link_word_low = (byte)E;
|
- ((char *)found_item)[0x6] = E;
+ ((uw_object_hdr_t *)found_item)->link_word_low = (byte)E;
|
- *(char *)((ushort *)found_item + 0x3) = E;
+ ((uw_object_hdr_t *)found_item)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x6)
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
|
- *(char *)((byte *)found_item + 0x6)
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
|
- ((char *)found_item)[0x6]
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
|
- *(char *)((ushort *)found_item + 0x3)
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
|
- (char)((ushort *)found_item)[0x3]
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found_item + 0x7)
+ ((uw_object_hdr_t *)found_item)->link_word_high
|
- *(byte *)((byte *)found_item + 0x7)
+ ((uw_object_hdr_t *)found_item)->link_word_high
|
- ((byte *)found_item)[0x7]
+ ((uw_object_hdr_t *)found_item)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found_item + 0x7)
+ ((uw_object_hdr_t *)found_item)->link_word_high
|
- *(undefined1 *)((byte *)found_item + 0x7)
+ ((uw_object_hdr_t *)found_item)->link_word_high
|
- ((undefined1 *)found_item)[0x7]
+ ((uw_object_hdr_t *)found_item)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x7) = E;
+ ((uw_object_hdr_t *)found_item)->link_word_high = (byte)E;
|
- *(char *)((byte *)found_item + 0x7) = E;
+ ((uw_object_hdr_t *)found_item)->link_word_high = (byte)E;
|
- ((char *)found_item)[0x7] = E;
+ ((uw_object_hdr_t *)found_item)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found_item + 0x7)
+ (char)((uw_object_hdr_t *)found_item)->link_word_high
|
- *(char *)((byte *)found_item + 0x7)
+ (char)((uw_object_hdr_t *)found_item)->link_word_high
|
- ((char *)found_item)[0x7]
+ (char)((uw_object_hdr_t *)found_item)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
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


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- ((short *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((short *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
)
...>
}


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((byte *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (byte)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((undefined1 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (undefined1)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- ((char *)puVar6)[0x0] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)puVar6 = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((byte *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((char *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((ushort *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (char)((ushort *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)puVar6
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(byte *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((byte *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(undefined1 *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((undefined1 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- ((char *)puVar6)[0x1] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(char *)((byte *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((char *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_6_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_14_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_6_w_2_14_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- ((short *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((short *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
)
...>
}


@receiver_6_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((byte *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (byte)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_6_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((undefined1 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (undefined1)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_6_w_2_14_store_2@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- ((char *)puVar6)[0x2] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((byte *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((char *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((ushort *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- (char)((ushort *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_6_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(byte *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((byte *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_6_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((undefined1 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_6_w_2_14_store_3@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- ((char *)puVar6)[0x3] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
)
...>
}


@receiver_6_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(char *)((byte *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((char *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_6_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_28_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_6_w_4_28_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- ((short *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((short *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
)
...>
}


@receiver_6_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((byte *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (byte)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_6_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((undefined1 *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (undefined1)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_6_w_4_28_store_4@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- ((char *)puVar6)[0x4] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((byte *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((char *)puVar6)[0x4]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((ushort *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (char)((ushort *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_6_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(byte *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((byte *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_6_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((undefined1 *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_6_w_4_28_store_5@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- ((char *)puVar6)[0x5] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
)
...>
}


@receiver_6_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(char *)((byte *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((char *)puVar6)[0x5]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_6_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_42_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_6_w_6_42_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- ((short *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((short *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
)
...>
}


@receiver_6_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((byte *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (byte)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_6_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((undefined1 *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (undefined1)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_6_w_6_42_store_6@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- ((char *)puVar6)[0x6] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((byte *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((char *)puVar6)[0x6]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((ushort *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- (char)((ushort *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_6_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(byte *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((byte *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_6_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((undefined1 *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_6_w_6_42_store_7@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- ((char *)puVar6)[0x7] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
)
...>
}


@receiver_6_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\|reduce_object_count\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(char *)((byte *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((char *)puVar6)[0x7]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x0) = (char)V;
- *(char *)((char *)equip_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x0) = (char)V;
- *(byte *)((char *)equip_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x0) = (byte)V;
- *(char *)((char *)equip_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x0) = (byte)V;
- *(byte *)((char *)equip_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- *(ushort *)((byte *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- ((ushort *)equip_object)[0x0]
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- *(ushort *)((ushort *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags
)
...>
}


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_signed
|
- *(short *)((byte *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_signed
|
- ((short *)equip_object)[0x0]
+ ((uw_object_hdr_t *)equip_object)->type_flags_signed
|
- *(short *)((short *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_signed
)
...>
}


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(byte *)((byte *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- ((byte *)equip_object)[0x0]
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(byte *)((ushort *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- (byte)((ushort *)equip_object)[0x0]
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(byte *)equip_object
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(undefined1 *)((byte *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- ((undefined1 *)equip_object)[0x0]
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(undefined1 *)((ushort *)equip_object + 0x0)
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- (undefined1)((ushort *)equip_object)[0x0]
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(undefined1 *)equip_object
+ ((uw_object_hdr_t *)equip_object)->type_flags_low
)
...>
}


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x0) = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)equip_object + 0x0) = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_low = (byte)E;
|
- ((char *)equip_object)[0x0] = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)equip_object + 0x0) = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_low = (byte)E;
|
- *(char *)equip_object = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_low = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x0)
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(char *)((byte *)equip_object + 0x0)
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_low
|
- ((char *)equip_object)[0x0]
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(char *)((ushort *)equip_object + 0x0)
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_low
|
- (char)((ushort *)equip_object)[0x0]
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_low
|
- *(char *)equip_object
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->type_flags_high
|
- *(byte *)((byte *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->type_flags_high
|
- ((byte *)equip_object)[0x1]
+ ((uw_object_hdr_t *)equip_object)->type_flags_high
)
...>
}


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->type_flags_high
|
- *(undefined1 *)((byte *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->type_flags_high
|
- ((undefined1 *)equip_object)[0x1]
+ ((uw_object_hdr_t *)equip_object)->type_flags_high
)
...>
}


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x1) = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)equip_object + 0x1) = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_high = (byte)E;
|
- ((char *)equip_object)[0x1] = E;
+ ((uw_object_hdr_t *)equip_object)->type_flags_high = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x1)
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_high
|
- *(char *)((byte *)equip_object + 0x1)
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_high
|
- ((char *)equip_object)[0x1]
+ (char)((uw_object_hdr_t *)equip_object)->type_flags_high
)
...>
}


@receiver_7_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x2) = (char)V;
- *(char *)((char *)equip_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x2) = (char)V;
- *(byte *)((char *)equip_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x2) = (byte)V;
- *(char *)((char *)equip_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x2) = (byte)V;
- *(byte *)((char *)equip_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word
|
- *(ushort *)((byte *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word
|
- ((ushort *)equip_object)[0x1]
+ ((uw_object_hdr_t *)equip_object)->position_word
|
- *(ushort *)((ushort *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->position_word
)
...>
}


@receiver_7_w_2_14_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word_signed
|
- *(short *)((byte *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word_signed
|
- ((short *)equip_object)[0x1]
+ ((uw_object_hdr_t *)equip_object)->position_word_signed
|
- *(short *)((short *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->position_word_signed
)
...>
}


@receiver_7_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- *(byte *)((byte *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- ((byte *)equip_object)[0x2]
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- *(byte *)((ushort *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- (byte)((ushort *)equip_object)[0x1]
+ ((uw_object_hdr_t *)equip_object)->position_word_low
)
...>
}


@receiver_7_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- *(undefined1 *)((byte *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- ((undefined1 *)equip_object)[0x2]
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- *(undefined1 *)((ushort *)equip_object + 0x1)
+ ((uw_object_hdr_t *)equip_object)->position_word_low
|
- (undefined1)((ushort *)equip_object)[0x1]
+ ((uw_object_hdr_t *)equip_object)->position_word_low
)
...>
}


@receiver_7_w_2_14_store_2@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x2) = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_low = (byte)E;
|
- *(char *)((byte *)equip_object + 0x2) = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_low = (byte)E;
|
- ((char *)equip_object)[0x2] = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)equip_object + 0x1) = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_low = (byte)E;
)
...>
}


@receiver_7_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x2)
+ (char)((uw_object_hdr_t *)equip_object)->position_word_low
|
- *(char *)((byte *)equip_object + 0x2)
+ (char)((uw_object_hdr_t *)equip_object)->position_word_low
|
- ((char *)equip_object)[0x2]
+ (char)((uw_object_hdr_t *)equip_object)->position_word_low
|
- *(char *)((ushort *)equip_object + 0x1)
+ (char)((uw_object_hdr_t *)equip_object)->position_word_low
|
- (char)((ushort *)equip_object)[0x1]
+ (char)((uw_object_hdr_t *)equip_object)->position_word_low
)
...>
}


@receiver_7_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->position_word_high
|
- *(byte *)((byte *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->position_word_high
|
- ((byte *)equip_object)[0x3]
+ ((uw_object_hdr_t *)equip_object)->position_word_high
)
...>
}


@receiver_7_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->position_word_high
|
- *(undefined1 *)((byte *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->position_word_high
|
- ((undefined1 *)equip_object)[0x3]
+ ((uw_object_hdr_t *)equip_object)->position_word_high
)
...>
}


@receiver_7_w_2_14_store_3@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x3) = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_high = (byte)E;
|
- *(char *)((byte *)equip_object + 0x3) = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_high = (byte)E;
|
- ((char *)equip_object)[0x3] = E;
+ ((uw_object_hdr_t *)equip_object)->position_word_high = (byte)E;
)
...>
}


@receiver_7_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x3)
+ (char)((uw_object_hdr_t *)equip_object)->position_word_high
|
- *(char *)((byte *)equip_object + 0x3)
+ (char)((uw_object_hdr_t *)equip_object)->position_word_high
|
- ((char *)equip_object)[0x3]
+ (char)((uw_object_hdr_t *)equip_object)->position_word_high
)
...>
}


@receiver_7_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x4) = (char)V;
- *(char *)((char *)equip_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x4) = (char)V;
- *(byte *)((char *)equip_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x4) = (byte)V;
- *(char *)((char *)equip_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x4) = (byte)V;
- *(byte *)((char *)equip_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word
|
- *(ushort *)((byte *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word
|
- ((ushort *)equip_object)[0x2]
+ ((uw_object_hdr_t *)equip_object)->chain_word
|
- *(ushort *)((ushort *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->chain_word
)
...>
}


@receiver_7_w_4_28_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word_signed
|
- *(short *)((byte *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word_signed
|
- ((short *)equip_object)[0x2]
+ ((uw_object_hdr_t *)equip_object)->chain_word_signed
|
- *(short *)((short *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->chain_word_signed
)
...>
}


@receiver_7_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- *(byte *)((byte *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- ((byte *)equip_object)[0x4]
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- *(byte *)((ushort *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- (byte)((ushort *)equip_object)[0x2]
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
)
...>
}


@receiver_7_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- *(undefined1 *)((byte *)equip_object + 0x4)
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- ((undefined1 *)equip_object)[0x4]
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- *(undefined1 *)((ushort *)equip_object + 0x2)
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
|
- (undefined1)((ushort *)equip_object)[0x2]
+ ((uw_object_hdr_t *)equip_object)->chain_word_low
)
...>
}


@receiver_7_w_4_28_store_4@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x4) = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)equip_object + 0x4) = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_low = (byte)E;
|
- ((char *)equip_object)[0x4] = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)equip_object + 0x2) = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_low = (byte)E;
)
...>
}


@receiver_7_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x4)
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_low
|
- *(char *)((byte *)equip_object + 0x4)
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_low
|
- ((char *)equip_object)[0x4]
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_low
|
- *(char *)((ushort *)equip_object + 0x2)
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_low
|
- (char)((ushort *)equip_object)[0x2]
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_low
)
...>
}


@receiver_7_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x5)
+ ((uw_object_hdr_t *)equip_object)->chain_word_high
|
- *(byte *)((byte *)equip_object + 0x5)
+ ((uw_object_hdr_t *)equip_object)->chain_word_high
|
- ((byte *)equip_object)[0x5]
+ ((uw_object_hdr_t *)equip_object)->chain_word_high
)
...>
}


@receiver_7_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x5)
+ ((uw_object_hdr_t *)equip_object)->chain_word_high
|
- *(undefined1 *)((byte *)equip_object + 0x5)
+ ((uw_object_hdr_t *)equip_object)->chain_word_high
|
- ((undefined1 *)equip_object)[0x5]
+ ((uw_object_hdr_t *)equip_object)->chain_word_high
)
...>
}


@receiver_7_w_4_28_store_5@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x5) = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)equip_object + 0x5) = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_high = (byte)E;
|
- ((char *)equip_object)[0x5] = E;
+ ((uw_object_hdr_t *)equip_object)->chain_word_high = (byte)E;
)
...>
}


@receiver_7_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x5)
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_high
|
- *(char *)((byte *)equip_object + 0x5)
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_high
|
- ((char *)equip_object)[0x5]
+ (char)((uw_object_hdr_t *)equip_object)->chain_word_high
)
...>
}


@receiver_7_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x6) = (char)V;
- *(char *)((char *)equip_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equip_object + 0x6) = (char)V;
- *(byte *)((char *)equip_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x6) = (byte)V;
- *(char *)((char *)equip_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equip_object + 0x6) = (byte)V;
- *(byte *)((char *)equip_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equip_object)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_word_ushort@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word
|
- *(ushort *)((byte *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word
|
- ((ushort *)equip_object)[0x3]
+ ((uw_object_hdr_t *)equip_object)->link_word
|
- *(ushort *)((ushort *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->link_word
)
...>
}


@receiver_7_w_6_42_word_short@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word_signed
|
- *(short *)((byte *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word_signed
|
- ((short *)equip_object)[0x3]
+ ((uw_object_hdr_t *)equip_object)->link_word_signed
|
- *(short *)((short *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->link_word_signed
)
...>
}


@receiver_7_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- *(byte *)((byte *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- ((byte *)equip_object)[0x6]
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- *(byte *)((ushort *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- (byte)((ushort *)equip_object)[0x3]
+ ((uw_object_hdr_t *)equip_object)->link_word_low
)
...>
}


@receiver_7_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- *(undefined1 *)((byte *)equip_object + 0x6)
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- ((undefined1 *)equip_object)[0x6]
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- *(undefined1 *)((ushort *)equip_object + 0x3)
+ ((uw_object_hdr_t *)equip_object)->link_word_low
|
- (undefined1)((ushort *)equip_object)[0x3]
+ ((uw_object_hdr_t *)equip_object)->link_word_low
)
...>
}


@receiver_7_w_6_42_store_6@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x6) = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_low = (byte)E;
|
- *(char *)((byte *)equip_object + 0x6) = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_low = (byte)E;
|
- ((char *)equip_object)[0x6] = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)equip_object + 0x3) = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_low = (byte)E;
)
...>
}


@receiver_7_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x6)
+ (char)((uw_object_hdr_t *)equip_object)->link_word_low
|
- *(char *)((byte *)equip_object + 0x6)
+ (char)((uw_object_hdr_t *)equip_object)->link_word_low
|
- ((char *)equip_object)[0x6]
+ (char)((uw_object_hdr_t *)equip_object)->link_word_low
|
- *(char *)((ushort *)equip_object + 0x3)
+ (char)((uw_object_hdr_t *)equip_object)->link_word_low
|
- (char)((ushort *)equip_object)[0x3]
+ (char)((uw_object_hdr_t *)equip_object)->link_word_low
)
...>
}


@receiver_7_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equip_object + 0x7)
+ ((uw_object_hdr_t *)equip_object)->link_word_high
|
- *(byte *)((byte *)equip_object + 0x7)
+ ((uw_object_hdr_t *)equip_object)->link_word_high
|
- ((byte *)equip_object)[0x7]
+ ((uw_object_hdr_t *)equip_object)->link_word_high
)
...>
}


@receiver_7_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equip_object + 0x7)
+ ((uw_object_hdr_t *)equip_object)->link_word_high
|
- *(undefined1 *)((byte *)equip_object + 0x7)
+ ((uw_object_hdr_t *)equip_object)->link_word_high
|
- ((undefined1 *)equip_object)[0x7]
+ ((uw_object_hdr_t *)equip_object)->link_word_high
)
...>
}


@receiver_7_w_6_42_store_7@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x7) = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_high = (byte)E;
|
- *(char *)((byte *)equip_object + 0x7) = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_high = (byte)E;
|
- ((char *)equip_object)[0x7] = E;
+ ((uw_object_hdr_t *)equip_object)->link_word_high = (byte)E;
)
...>
}


@receiver_7_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equip_object + 0x7)
+ (char)((uw_object_hdr_t *)equip_object)->link_word_high
|
- *(char *)((byte *)equip_object + 0x7)
+ (char)((uw_object_hdr_t *)equip_object)->link_word_high
|
- ((char *)equip_object)[0x7]
+ (char)((uw_object_hdr_t *)equip_object)->link_word_high
)
...>
}


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x0) = (char)V;
- *(char *)((char *)local_1c + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x0) = (char)V;
- *(byte *)((char *)local_1c + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x0) = (byte)V;
- *(char *)((char *)local_1c + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x0) = (byte)V;
- *(byte *)((char *)local_1c + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags
|
- *(ushort *)((byte *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags
|
- ((ushort *)local_1c)[0x0]
+ ((uw_object_hdr_t *)local_1c)->type_flags
|
- *(ushort *)((ushort *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags
)
...>
}


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_signed
|
- *(short *)((byte *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_signed
|
- ((short *)local_1c)[0x0]
+ ((uw_object_hdr_t *)local_1c)->type_flags_signed
|
- *(short *)((short *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_signed
)
...>
}


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(byte *)((byte *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- ((byte *)local_1c)[0x0]
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(byte *)((ushort *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- (byte)((ushort *)local_1c)[0x0]
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(byte *)local_1c
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(undefined1 *)((byte *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- ((undefined1 *)local_1c)[0x0]
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(undefined1 *)((ushort *)local_1c + 0x0)
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- (undefined1)((ushort *)local_1c)[0x0]
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(undefined1 *)local_1c
+ ((uw_object_hdr_t *)local_1c)->type_flags_low
)
...>
}


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x0) = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_low = (byte)E;
|
- *(char *)((byte *)local_1c + 0x0) = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_low = (byte)E;
|
- ((char *)local_1c)[0x0] = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)local_1c + 0x0) = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_low = (byte)E;
|
- *(char *)local_1c = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_low = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x0)
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(char *)((byte *)local_1c + 0x0)
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_low
|
- ((char *)local_1c)[0x0]
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(char *)((ushort *)local_1c + 0x0)
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_low
|
- (char)((ushort *)local_1c)[0x0]
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_low
|
- *(char *)local_1c
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->type_flags_high
|
- *(byte *)((byte *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->type_flags_high
|
- ((byte *)local_1c)[0x1]
+ ((uw_object_hdr_t *)local_1c)->type_flags_high
)
...>
}


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->type_flags_high
|
- *(undefined1 *)((byte *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->type_flags_high
|
- ((undefined1 *)local_1c)[0x1]
+ ((uw_object_hdr_t *)local_1c)->type_flags_high
)
...>
}


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x1) = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_high = (byte)E;
|
- *(char *)((byte *)local_1c + 0x1) = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_high = (byte)E;
|
- ((char *)local_1c)[0x1] = E;
+ ((uw_object_hdr_t *)local_1c)->type_flags_high = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x1)
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_high
|
- *(char *)((byte *)local_1c + 0x1)
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_high
|
- ((char *)local_1c)[0x1]
+ (char)((uw_object_hdr_t *)local_1c)->type_flags_high
)
...>
}


@receiver_8_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x2) = (char)V;
- *(char *)((char *)local_1c + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x2) = (char)V;
- *(byte *)((char *)local_1c + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x2) = (byte)V;
- *(char *)((char *)local_1c + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x2) = (byte)V;
- *(byte *)((char *)local_1c + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_word_ushort@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word
|
- *(ushort *)((byte *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word
|
- ((ushort *)local_1c)[0x1]
+ ((uw_object_hdr_t *)local_1c)->position_word
|
- *(ushort *)((ushort *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->position_word
)
...>
}


@receiver_8_w_2_14_word_short@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word_signed
|
- *(short *)((byte *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word_signed
|
- ((short *)local_1c)[0x1]
+ ((uw_object_hdr_t *)local_1c)->position_word_signed
|
- *(short *)((short *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->position_word_signed
)
...>
}


@receiver_8_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- *(byte *)((byte *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- ((byte *)local_1c)[0x2]
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- *(byte *)((ushort *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- (byte)((ushort *)local_1c)[0x1]
+ ((uw_object_hdr_t *)local_1c)->position_word_low
)
...>
}


@receiver_8_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- *(undefined1 *)((byte *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- ((undefined1 *)local_1c)[0x2]
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- *(undefined1 *)((ushort *)local_1c + 0x1)
+ ((uw_object_hdr_t *)local_1c)->position_word_low
|
- (undefined1)((ushort *)local_1c)[0x1]
+ ((uw_object_hdr_t *)local_1c)->position_word_low
)
...>
}


@receiver_8_w_2_14_store_2@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x2) = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_low = (byte)E;
|
- *(char *)((byte *)local_1c + 0x2) = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_low = (byte)E;
|
- ((char *)local_1c)[0x2] = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_low = (byte)E;
|
- *(char *)((ushort *)local_1c + 0x1) = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_low = (byte)E;
)
...>
}


@receiver_8_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x2)
+ (char)((uw_object_hdr_t *)local_1c)->position_word_low
|
- *(char *)((byte *)local_1c + 0x2)
+ (char)((uw_object_hdr_t *)local_1c)->position_word_low
|
- ((char *)local_1c)[0x2]
+ (char)((uw_object_hdr_t *)local_1c)->position_word_low
|
- *(char *)((ushort *)local_1c + 0x1)
+ (char)((uw_object_hdr_t *)local_1c)->position_word_low
|
- (char)((ushort *)local_1c)[0x1]
+ (char)((uw_object_hdr_t *)local_1c)->position_word_low
)
...>
}


@receiver_8_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->position_word_high
|
- *(byte *)((byte *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->position_word_high
|
- ((byte *)local_1c)[0x3]
+ ((uw_object_hdr_t *)local_1c)->position_word_high
)
...>
}


@receiver_8_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->position_word_high
|
- *(undefined1 *)((byte *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->position_word_high
|
- ((undefined1 *)local_1c)[0x3]
+ ((uw_object_hdr_t *)local_1c)->position_word_high
)
...>
}


@receiver_8_w_2_14_store_3@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x3) = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_high = (byte)E;
|
- *(char *)((byte *)local_1c + 0x3) = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_high = (byte)E;
|
- ((char *)local_1c)[0x3] = E;
+ ((uw_object_hdr_t *)local_1c)->position_word_high = (byte)E;
)
...>
}


@receiver_8_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x3)
+ (char)((uw_object_hdr_t *)local_1c)->position_word_high
|
- *(char *)((byte *)local_1c + 0x3)
+ (char)((uw_object_hdr_t *)local_1c)->position_word_high
|
- ((char *)local_1c)[0x3]
+ (char)((uw_object_hdr_t *)local_1c)->position_word_high
)
...>
}


@receiver_8_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x4) = (char)V;
- *(char *)((char *)local_1c + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x4) = (char)V;
- *(byte *)((char *)local_1c + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x4) = (byte)V;
- *(char *)((char *)local_1c + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x4) = (byte)V;
- *(byte *)((char *)local_1c + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_word_ushort@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word
|
- *(ushort *)((byte *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word
|
- ((ushort *)local_1c)[0x2]
+ ((uw_object_hdr_t *)local_1c)->chain_word
|
- *(ushort *)((ushort *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->chain_word
)
...>
}


@receiver_8_w_4_28_word_short@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word_signed
|
- *(short *)((byte *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word_signed
|
- ((short *)local_1c)[0x2]
+ ((uw_object_hdr_t *)local_1c)->chain_word_signed
|
- *(short *)((short *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->chain_word_signed
)
...>
}


@receiver_8_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- *(byte *)((byte *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- ((byte *)local_1c)[0x4]
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- *(byte *)((ushort *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- (byte)((ushort *)local_1c)[0x2]
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
)
...>
}


@receiver_8_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- *(undefined1 *)((byte *)local_1c + 0x4)
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- ((undefined1 *)local_1c)[0x4]
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- *(undefined1 *)((ushort *)local_1c + 0x2)
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
|
- (undefined1)((ushort *)local_1c)[0x2]
+ ((uw_object_hdr_t *)local_1c)->chain_word_low
)
...>
}


@receiver_8_w_4_28_store_4@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x4) = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_low = (byte)E;
|
- *(char *)((byte *)local_1c + 0x4) = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_low = (byte)E;
|
- ((char *)local_1c)[0x4] = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)local_1c + 0x2) = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_low = (byte)E;
)
...>
}


@receiver_8_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x4)
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_low
|
- *(char *)((byte *)local_1c + 0x4)
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_low
|
- ((char *)local_1c)[0x4]
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_low
|
- *(char *)((ushort *)local_1c + 0x2)
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_low
|
- (char)((ushort *)local_1c)[0x2]
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_low
)
...>
}


@receiver_8_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x5)
+ ((uw_object_hdr_t *)local_1c)->chain_word_high
|
- *(byte *)((byte *)local_1c + 0x5)
+ ((uw_object_hdr_t *)local_1c)->chain_word_high
|
- ((byte *)local_1c)[0x5]
+ ((uw_object_hdr_t *)local_1c)->chain_word_high
)
...>
}


@receiver_8_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x5)
+ ((uw_object_hdr_t *)local_1c)->chain_word_high
|
- *(undefined1 *)((byte *)local_1c + 0x5)
+ ((uw_object_hdr_t *)local_1c)->chain_word_high
|
- ((undefined1 *)local_1c)[0x5]
+ ((uw_object_hdr_t *)local_1c)->chain_word_high
)
...>
}


@receiver_8_w_4_28_store_5@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x5) = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_high = (byte)E;
|
- *(char *)((byte *)local_1c + 0x5) = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_high = (byte)E;
|
- ((char *)local_1c)[0x5] = E;
+ ((uw_object_hdr_t *)local_1c)->chain_word_high = (byte)E;
)
...>
}


@receiver_8_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x5)
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_high
|
- *(char *)((byte *)local_1c + 0x5)
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_high
|
- ((char *)local_1c)[0x5]
+ (char)((uw_object_hdr_t *)local_1c)->chain_word_high
)
...>
}


@receiver_8_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x6) = (char)V;
- *(char *)((char *)local_1c + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_1c + 0x6) = (char)V;
- *(byte *)((char *)local_1c + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x6) = (byte)V;
- *(char *)((char *)local_1c + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_1c + 0x6) = (byte)V;
- *(byte *)((char *)local_1c + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_1c)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_word_ushort@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word
|
- *(ushort *)((byte *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word
|
- ((ushort *)local_1c)[0x3]
+ ((uw_object_hdr_t *)local_1c)->link_word
|
- *(ushort *)((ushort *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->link_word
)
...>
}


@receiver_8_w_6_42_word_short@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word_signed
|
- *(short *)((byte *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word_signed
|
- ((short *)local_1c)[0x3]
+ ((uw_object_hdr_t *)local_1c)->link_word_signed
|
- *(short *)((short *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->link_word_signed
)
...>
}


@receiver_8_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- *(byte *)((byte *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- ((byte *)local_1c)[0x6]
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- *(byte *)((ushort *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- (byte)((ushort *)local_1c)[0x3]
+ ((uw_object_hdr_t *)local_1c)->link_word_low
)
...>
}


@receiver_8_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- *(undefined1 *)((byte *)local_1c + 0x6)
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- ((undefined1 *)local_1c)[0x6]
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- *(undefined1 *)((ushort *)local_1c + 0x3)
+ ((uw_object_hdr_t *)local_1c)->link_word_low
|
- (undefined1)((ushort *)local_1c)[0x3]
+ ((uw_object_hdr_t *)local_1c)->link_word_low
)
...>
}


@receiver_8_w_6_42_store_6@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x6) = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_low = (byte)E;
|
- *(char *)((byte *)local_1c + 0x6) = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_low = (byte)E;
|
- ((char *)local_1c)[0x6] = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_low = (byte)E;
|
- *(char *)((ushort *)local_1c + 0x3) = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_low = (byte)E;
)
...>
}


@receiver_8_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x6)
+ (char)((uw_object_hdr_t *)local_1c)->link_word_low
|
- *(char *)((byte *)local_1c + 0x6)
+ (char)((uw_object_hdr_t *)local_1c)->link_word_low
|
- ((char *)local_1c)[0x6]
+ (char)((uw_object_hdr_t *)local_1c)->link_word_low
|
- *(char *)((ushort *)local_1c + 0x3)
+ (char)((uw_object_hdr_t *)local_1c)->link_word_low
|
- (char)((ushort *)local_1c)[0x3]
+ (char)((uw_object_hdr_t *)local_1c)->link_word_low
)
...>
}


@receiver_8_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_1c + 0x7)
+ ((uw_object_hdr_t *)local_1c)->link_word_high
|
- *(byte *)((byte *)local_1c + 0x7)
+ ((uw_object_hdr_t *)local_1c)->link_word_high
|
- ((byte *)local_1c)[0x7]
+ ((uw_object_hdr_t *)local_1c)->link_word_high
)
...>
}


@receiver_8_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_1c + 0x7)
+ ((uw_object_hdr_t *)local_1c)->link_word_high
|
- *(undefined1 *)((byte *)local_1c + 0x7)
+ ((uw_object_hdr_t *)local_1c)->link_word_high
|
- ((undefined1 *)local_1c)[0x7]
+ ((uw_object_hdr_t *)local_1c)->link_word_high
)
...>
}


@receiver_8_w_6_42_store_7@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x7) = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_high = (byte)E;
|
- *(char *)((byte *)local_1c + 0x7) = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_high = (byte)E;
|
- ((char *)local_1c)[0x7] = E;
+ ((uw_object_hdr_t *)local_1c)->link_word_high = (byte)E;
)
...>
}


@receiver_8_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_1c + 0x7)
+ (char)((uw_object_hdr_t *)local_1c)->link_word_high
|
- *(char *)((byte *)local_1c + 0x7)
+ (char)((uw_object_hdr_t *)local_1c)->link_word_high
|
- ((char *)local_1c)[0x7]
+ (char)((uw_object_hdr_t *)local_1c)->link_word_high
)
...>
}


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_2_14_word_ushort@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_word_short@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_store_2@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_store_3@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_4_28_word_ushort@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_word_short@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_store_4@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_store_5@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@receiver_9_w_6_42_word_ushort@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_word_short@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_store_6@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_store_7@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_9_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x0) = (char)V;
- *(char *)((char *)pbVar10 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x0) = (char)V;
- *(byte *)((char *)pbVar10 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x0) = (byte)V;
- *(char *)((char *)pbVar10 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar10 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags
|
- *(ushort *)((byte *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags
|
- ((ushort *)pbVar10)[0x0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags
|
- *(ushort *)((ushort *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_signed
|
- *(short *)((byte *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_signed
|
- ((short *)pbVar10)[0x0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_signed
|
- *(short *)((short *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(byte *)((byte *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- ((byte *)pbVar10)[0x0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(byte *)((ushort *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- (byte)((ushort *)pbVar10)[0x0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(byte *)pbVar10
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- ((undefined1 *)pbVar10)[0x0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar10 + 0x0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- (undefined1)((ushort *)pbVar10)[0x0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(undefined1 *)pbVar10
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)E;
|
- ((char *)pbVar10)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar10 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)E;
|
- *(char *)pbVar10 = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(char *)((byte *)pbVar10 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- ((char *)pbVar10)[0x0]
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(char *)((ushort *)pbVar10 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- (char)((ushort *)pbVar10)[0x0]
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_low
|
- *(char *)pbVar10
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high
|
- *(byte *)((byte *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high
|
- ((byte *)pbVar10)[0x1]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high
|
- ((undefined1 *)pbVar10)[0x1]
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high = (byte)E;
|
- ((char *)pbVar10)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar10)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_high
|
- *(char *)((byte *)pbVar10 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_high
|
- ((char *)pbVar10)[0x1]
+ (char)((uw_object_hdr_t *)pbVar10)->type_flags_high
)
...>
}


@receiver_10_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x2) = (char)V;
- *(char *)((char *)pbVar10 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x2) = (char)V;
- *(byte *)((char *)pbVar10 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x2) = (byte)V;
- *(char *)((char *)pbVar10 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar10 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word
|
- *(ushort *)((byte *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word
|
- ((ushort *)pbVar10)[0x1]
+ ((uw_object_hdr_t *)pbVar10)->position_word
|
- *(ushort *)((ushort *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->position_word
)
...>
}


@receiver_10_w_2_14_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word_signed
|
- *(short *)((byte *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word_signed
|
- ((short *)pbVar10)[0x1]
+ ((uw_object_hdr_t *)pbVar10)->position_word_signed
|
- *(short *)((short *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->position_word_signed
)
...>
}


@receiver_10_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- *(byte *)((byte *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- ((byte *)pbVar10)[0x2]
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- *(byte *)((ushort *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- (byte)((ushort *)pbVar10)[0x1]
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
)
...>
}


@receiver_10_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- *(undefined1 *)((byte *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- ((undefined1 *)pbVar10)[0x2]
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar10 + 0x1)
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
|
- (undefined1)((ushort *)pbVar10)[0x1]
+ ((uw_object_hdr_t *)pbVar10)->position_word_low
)
...>
}


@receiver_10_w_2_14_store_2@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_low = (byte)E;
|
- ((char *)pbVar10)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar10 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_low
|
- *(char *)((byte *)pbVar10 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_low
|
- ((char *)pbVar10)[0x2]
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_low
|
- *(char *)((ushort *)pbVar10 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_low
|
- (char)((ushort *)pbVar10)[0x1]
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_low
)
...>
}


@receiver_10_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->position_word_high
|
- *(byte *)((byte *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->position_word_high
|
- ((byte *)pbVar10)[0x3]
+ ((uw_object_hdr_t *)pbVar10)->position_word_high
)
...>
}


@receiver_10_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->position_word_high
|
- *(undefined1 *)((byte *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->position_word_high
|
- ((undefined1 *)pbVar10)[0x3]
+ ((uw_object_hdr_t *)pbVar10)->position_word_high
)
...>
}


@receiver_10_w_2_14_store_3@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_high = (byte)E;
|
- ((char *)pbVar10)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar10)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_high
|
- *(char *)((byte *)pbVar10 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_high
|
- ((char *)pbVar10)[0x3]
+ (char)((uw_object_hdr_t *)pbVar10)->position_word_high
)
...>
}


@receiver_10_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x4) = (char)V;
- *(char *)((char *)pbVar10 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x4) = (char)V;
- *(byte *)((char *)pbVar10 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x4) = (byte)V;
- *(char *)((char *)pbVar10 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar10 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word
|
- *(ushort *)((byte *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word
|
- ((ushort *)pbVar10)[0x2]
+ ((uw_object_hdr_t *)pbVar10)->chain_word
|
- *(ushort *)((ushort *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->chain_word
)
...>
}


@receiver_10_w_4_28_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_signed
|
- *(short *)((byte *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_signed
|
- ((short *)pbVar10)[0x2]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_signed
|
- *(short *)((short *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_signed
)
...>
}


@receiver_10_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- *(byte *)((byte *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- ((byte *)pbVar10)[0x4]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- *(byte *)((ushort *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- (byte)((ushort *)pbVar10)[0x2]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
)
...>
}


@receiver_10_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar10 + 0x4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- ((undefined1 *)pbVar10)[0x4]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar10 + 0x2)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- (undefined1)((ushort *)pbVar10)[0x2]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low
)
...>
}


@receiver_10_w_4_28_store_4@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low = (byte)E;
|
- ((char *)pbVar10)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar10 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- *(char *)((byte *)pbVar10 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- ((char *)pbVar10)[0x4]
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- *(char *)((ushort *)pbVar10 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_low
|
- (char)((ushort *)pbVar10)[0x2]
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_low
)
...>
}


@receiver_10_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x5)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high
|
- *(byte *)((byte *)pbVar10 + 0x5)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high
|
- ((byte *)pbVar10)[0x5]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high
)
...>
}


@receiver_10_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x5)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar10 + 0x5)
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high
|
- ((undefined1 *)pbVar10)[0x5]
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high
)
...>
}


@receiver_10_w_4_28_store_5@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high = (byte)E;
|
- ((char *)pbVar10)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar10)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_high
|
- *(char *)((byte *)pbVar10 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_high
|
- ((char *)pbVar10)[0x5]
+ (char)((uw_object_hdr_t *)pbVar10)->chain_word_high
)
...>
}


@receiver_10_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x6) = (char)V;
- *(char *)((char *)pbVar10 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar10 + 0x6) = (char)V;
- *(byte *)((char *)pbVar10 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x6) = (byte)V;
- *(char *)((char *)pbVar10 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar10 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar10 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar10)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word
|
- *(ushort *)((byte *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word
|
- ((ushort *)pbVar10)[0x3]
+ ((uw_object_hdr_t *)pbVar10)->link_word
|
- *(ushort *)((ushort *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->link_word
)
...>
}


@receiver_10_w_6_42_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word_signed
|
- *(short *)((byte *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word_signed
|
- ((short *)pbVar10)[0x3]
+ ((uw_object_hdr_t *)pbVar10)->link_word_signed
|
- *(short *)((short *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->link_word_signed
)
...>
}


@receiver_10_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- *(byte *)((byte *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- ((byte *)pbVar10)[0x6]
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- *(byte *)((ushort *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- (byte)((ushort *)pbVar10)[0x3]
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
)
...>
}


@receiver_10_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- *(undefined1 *)((byte *)pbVar10 + 0x6)
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- ((undefined1 *)pbVar10)[0x6]
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar10 + 0x3)
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
|
- (undefined1)((ushort *)pbVar10)[0x3]
+ ((uw_object_hdr_t *)pbVar10)->link_word_low
)
...>
}


@receiver_10_w_6_42_store_6@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_low = (byte)E;
|
- ((char *)pbVar10)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar10 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_low
|
- *(char *)((byte *)pbVar10 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_low
|
- ((char *)pbVar10)[0x6]
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_low
|
- *(char *)((ushort *)pbVar10 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_low
|
- (char)((ushort *)pbVar10)[0x3]
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_low
)
...>
}


@receiver_10_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar10 + 0x7)
+ ((uw_object_hdr_t *)pbVar10)->link_word_high
|
- *(byte *)((byte *)pbVar10 + 0x7)
+ ((uw_object_hdr_t *)pbVar10)->link_word_high
|
- ((byte *)pbVar10)[0x7]
+ ((uw_object_hdr_t *)pbVar10)->link_word_high
)
...>
}


@receiver_10_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar10 + 0x7)
+ ((uw_object_hdr_t *)pbVar10)->link_word_high
|
- *(undefined1 *)((byte *)pbVar10 + 0x7)
+ ((uw_object_hdr_t *)pbVar10)->link_word_high
|
- ((undefined1 *)pbVar10)[0x7]
+ ((uw_object_hdr_t *)pbVar10)->link_word_high
)
...>
}


@receiver_10_w_6_42_store_7@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar10 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_high = (byte)E;
|
- ((char *)pbVar10)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar10)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar10 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_high
|
- *(char *)((byte *)pbVar10 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_high
|
- ((char *)pbVar10)[0x7]
+ (char)((uw_object_hdr_t *)pbVar10)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x0) = (char)V;
- *(char *)((char *)local_28 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x0) = (char)V;
- *(byte *)((char *)local_28 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x0) = (byte)V;
- *(char *)((char *)local_28 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x0) = (byte)V;
- *(byte *)((char *)local_28 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags
|
- *(ushort *)((byte *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags
|
- ((ushort *)local_28)[0x0]
+ ((uw_object_hdr_t *)local_28)->type_flags
|
- *(ushort *)((ushort *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags
)
...>
}


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_signed
|
- *(short *)((byte *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_signed
|
- ((short *)local_28)[0x0]
+ ((uw_object_hdr_t *)local_28)->type_flags_signed
|
- *(short *)((short *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_signed
)
...>
}


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(byte *)((byte *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- ((byte *)local_28)[0x0]
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(byte *)((ushort *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- (byte)((ushort *)local_28)[0x0]
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(byte *)local_28
+ ((uw_object_hdr_t *)local_28)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(undefined1 *)((byte *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- ((undefined1 *)local_28)[0x0]
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(undefined1 *)((ushort *)local_28 + 0x0)
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- (undefined1)((ushort *)local_28)[0x0]
+ ((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(undefined1 *)local_28
+ ((uw_object_hdr_t *)local_28)->type_flags_low
)
...>
}


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x0) = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_low = (byte)E;
|
- *(char *)((byte *)local_28 + 0x0) = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_low = (byte)E;
|
- ((char *)local_28)[0x0] = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)local_28 + 0x0) = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_low = (byte)E;
|
- *(char *)local_28 = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_low = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x0)
+ (char)((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(char *)((byte *)local_28 + 0x0)
+ (char)((uw_object_hdr_t *)local_28)->type_flags_low
|
- ((char *)local_28)[0x0]
+ (char)((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(char *)((ushort *)local_28 + 0x0)
+ (char)((uw_object_hdr_t *)local_28)->type_flags_low
|
- (char)((ushort *)local_28)[0x0]
+ (char)((uw_object_hdr_t *)local_28)->type_flags_low
|
- *(char *)local_28
+ (char)((uw_object_hdr_t *)local_28)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->type_flags_high
|
- *(byte *)((byte *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->type_flags_high
|
- ((byte *)local_28)[0x1]
+ ((uw_object_hdr_t *)local_28)->type_flags_high
)
...>
}


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->type_flags_high
|
- *(undefined1 *)((byte *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->type_flags_high
|
- ((undefined1 *)local_28)[0x1]
+ ((uw_object_hdr_t *)local_28)->type_flags_high
)
...>
}


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x1) = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_high = (byte)E;
|
- *(char *)((byte *)local_28 + 0x1) = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_high = (byte)E;
|
- ((char *)local_28)[0x1] = E;
+ ((uw_object_hdr_t *)local_28)->type_flags_high = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x1)
+ (char)((uw_object_hdr_t *)local_28)->type_flags_high
|
- *(char *)((byte *)local_28 + 0x1)
+ (char)((uw_object_hdr_t *)local_28)->type_flags_high
|
- ((char *)local_28)[0x1]
+ (char)((uw_object_hdr_t *)local_28)->type_flags_high
)
...>
}


@receiver_11_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x2) = (char)V;
- *(char *)((char *)local_28 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x2) = (char)V;
- *(byte *)((char *)local_28 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x2) = (byte)V;
- *(char *)((char *)local_28 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x2) = (byte)V;
- *(byte *)((char *)local_28 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word
|
- *(ushort *)((byte *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word
|
- ((ushort *)local_28)[0x1]
+ ((uw_object_hdr_t *)local_28)->position_word
|
- *(ushort *)((ushort *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->position_word
)
...>
}


@receiver_11_w_2_14_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word_signed
|
- *(short *)((byte *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word_signed
|
- ((short *)local_28)[0x1]
+ ((uw_object_hdr_t *)local_28)->position_word_signed
|
- *(short *)((short *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->position_word_signed
)
...>
}


@receiver_11_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- *(byte *)((byte *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- ((byte *)local_28)[0x2]
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- *(byte *)((ushort *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- (byte)((ushort *)local_28)[0x1]
+ ((uw_object_hdr_t *)local_28)->position_word_low
)
...>
}


@receiver_11_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- *(undefined1 *)((byte *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- ((undefined1 *)local_28)[0x2]
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- *(undefined1 *)((ushort *)local_28 + 0x1)
+ ((uw_object_hdr_t *)local_28)->position_word_low
|
- (undefined1)((ushort *)local_28)[0x1]
+ ((uw_object_hdr_t *)local_28)->position_word_low
)
...>
}


@receiver_11_w_2_14_store_2@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x2) = E;
+ ((uw_object_hdr_t *)local_28)->position_word_low = (byte)E;
|
- *(char *)((byte *)local_28 + 0x2) = E;
+ ((uw_object_hdr_t *)local_28)->position_word_low = (byte)E;
|
- ((char *)local_28)[0x2] = E;
+ ((uw_object_hdr_t *)local_28)->position_word_low = (byte)E;
|
- *(char *)((ushort *)local_28 + 0x1) = E;
+ ((uw_object_hdr_t *)local_28)->position_word_low = (byte)E;
)
...>
}


@receiver_11_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x2)
+ (char)((uw_object_hdr_t *)local_28)->position_word_low
|
- *(char *)((byte *)local_28 + 0x2)
+ (char)((uw_object_hdr_t *)local_28)->position_word_low
|
- ((char *)local_28)[0x2]
+ (char)((uw_object_hdr_t *)local_28)->position_word_low
|
- *(char *)((ushort *)local_28 + 0x1)
+ (char)((uw_object_hdr_t *)local_28)->position_word_low
|
- (char)((ushort *)local_28)[0x1]
+ (char)((uw_object_hdr_t *)local_28)->position_word_low
)
...>
}


@receiver_11_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->position_word_high
|
- *(byte *)((byte *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->position_word_high
|
- ((byte *)local_28)[0x3]
+ ((uw_object_hdr_t *)local_28)->position_word_high
)
...>
}


@receiver_11_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->position_word_high
|
- *(undefined1 *)((byte *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->position_word_high
|
- ((undefined1 *)local_28)[0x3]
+ ((uw_object_hdr_t *)local_28)->position_word_high
)
...>
}


@receiver_11_w_2_14_store_3@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x3) = E;
+ ((uw_object_hdr_t *)local_28)->position_word_high = (byte)E;
|
- *(char *)((byte *)local_28 + 0x3) = E;
+ ((uw_object_hdr_t *)local_28)->position_word_high = (byte)E;
|
- ((char *)local_28)[0x3] = E;
+ ((uw_object_hdr_t *)local_28)->position_word_high = (byte)E;
)
...>
}


@receiver_11_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x3)
+ (char)((uw_object_hdr_t *)local_28)->position_word_high
|
- *(char *)((byte *)local_28 + 0x3)
+ (char)((uw_object_hdr_t *)local_28)->position_word_high
|
- ((char *)local_28)[0x3]
+ (char)((uw_object_hdr_t *)local_28)->position_word_high
)
...>
}


@receiver_11_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x4) = (char)V;
- *(char *)((char *)local_28 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x4) = (char)V;
- *(byte *)((char *)local_28 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x4) = (byte)V;
- *(char *)((char *)local_28 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x4) = (byte)V;
- *(byte *)((char *)local_28 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word
|
- *(ushort *)((byte *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word
|
- ((ushort *)local_28)[0x2]
+ ((uw_object_hdr_t *)local_28)->chain_word
|
- *(ushort *)((ushort *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->chain_word
)
...>
}


@receiver_11_w_4_28_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word_signed
|
- *(short *)((byte *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word_signed
|
- ((short *)local_28)[0x2]
+ ((uw_object_hdr_t *)local_28)->chain_word_signed
|
- *(short *)((short *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->chain_word_signed
)
...>
}


@receiver_11_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- *(byte *)((byte *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- ((byte *)local_28)[0x4]
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- *(byte *)((ushort *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- (byte)((ushort *)local_28)[0x2]
+ ((uw_object_hdr_t *)local_28)->chain_word_low
)
...>
}


@receiver_11_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- *(undefined1 *)((byte *)local_28 + 0x4)
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- ((undefined1 *)local_28)[0x4]
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- *(undefined1 *)((ushort *)local_28 + 0x2)
+ ((uw_object_hdr_t *)local_28)->chain_word_low
|
- (undefined1)((ushort *)local_28)[0x2]
+ ((uw_object_hdr_t *)local_28)->chain_word_low
)
...>
}


@receiver_11_w_4_28_store_4@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x4) = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_low = (byte)E;
|
- *(char *)((byte *)local_28 + 0x4) = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_low = (byte)E;
|
- ((char *)local_28)[0x4] = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)local_28 + 0x2) = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_low = (byte)E;
)
...>
}


@receiver_11_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x4)
+ (char)((uw_object_hdr_t *)local_28)->chain_word_low
|
- *(char *)((byte *)local_28 + 0x4)
+ (char)((uw_object_hdr_t *)local_28)->chain_word_low
|
- ((char *)local_28)[0x4]
+ (char)((uw_object_hdr_t *)local_28)->chain_word_low
|
- *(char *)((ushort *)local_28 + 0x2)
+ (char)((uw_object_hdr_t *)local_28)->chain_word_low
|
- (char)((ushort *)local_28)[0x2]
+ (char)((uw_object_hdr_t *)local_28)->chain_word_low
)
...>
}


@receiver_11_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x5)
+ ((uw_object_hdr_t *)local_28)->chain_word_high
|
- *(byte *)((byte *)local_28 + 0x5)
+ ((uw_object_hdr_t *)local_28)->chain_word_high
|
- ((byte *)local_28)[0x5]
+ ((uw_object_hdr_t *)local_28)->chain_word_high
)
...>
}


@receiver_11_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x5)
+ ((uw_object_hdr_t *)local_28)->chain_word_high
|
- *(undefined1 *)((byte *)local_28 + 0x5)
+ ((uw_object_hdr_t *)local_28)->chain_word_high
|
- ((undefined1 *)local_28)[0x5]
+ ((uw_object_hdr_t *)local_28)->chain_word_high
)
...>
}


@receiver_11_w_4_28_store_5@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x5) = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_high = (byte)E;
|
- *(char *)((byte *)local_28 + 0x5) = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_high = (byte)E;
|
- ((char *)local_28)[0x5] = E;
+ ((uw_object_hdr_t *)local_28)->chain_word_high = (byte)E;
)
...>
}


@receiver_11_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x5)
+ (char)((uw_object_hdr_t *)local_28)->chain_word_high
|
- *(char *)((byte *)local_28 + 0x5)
+ (char)((uw_object_hdr_t *)local_28)->chain_word_high
|
- ((char *)local_28)[0x5]
+ (char)((uw_object_hdr_t *)local_28)->chain_word_high
)
...>
}


@receiver_11_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x6) = (char)V;
- *(char *)((char *)local_28 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)local_28 + 0x6) = (char)V;
- *(byte *)((char *)local_28 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x6) = (byte)V;
- *(char *)((char *)local_28 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)local_28 + 0x6) = (byte)V;
- *(byte *)((char *)local_28 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)local_28)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_word_ushort@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word
|
- *(ushort *)((byte *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word
|
- ((ushort *)local_28)[0x3]
+ ((uw_object_hdr_t *)local_28)->link_word
|
- *(ushort *)((ushort *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->link_word
)
...>
}


@receiver_11_w_6_42_word_short@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word_signed
|
- *(short *)((byte *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word_signed
|
- ((short *)local_28)[0x3]
+ ((uw_object_hdr_t *)local_28)->link_word_signed
|
- *(short *)((short *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->link_word_signed
)
...>
}


@receiver_11_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- *(byte *)((byte *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- ((byte *)local_28)[0x6]
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- *(byte *)((ushort *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- (byte)((ushort *)local_28)[0x3]
+ ((uw_object_hdr_t *)local_28)->link_word_low
)
...>
}


@receiver_11_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- *(undefined1 *)((byte *)local_28 + 0x6)
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- ((undefined1 *)local_28)[0x6]
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- *(undefined1 *)((ushort *)local_28 + 0x3)
+ ((uw_object_hdr_t *)local_28)->link_word_low
|
- (undefined1)((ushort *)local_28)[0x3]
+ ((uw_object_hdr_t *)local_28)->link_word_low
)
...>
}


@receiver_11_w_6_42_store_6@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x6) = E;
+ ((uw_object_hdr_t *)local_28)->link_word_low = (byte)E;
|
- *(char *)((byte *)local_28 + 0x6) = E;
+ ((uw_object_hdr_t *)local_28)->link_word_low = (byte)E;
|
- ((char *)local_28)[0x6] = E;
+ ((uw_object_hdr_t *)local_28)->link_word_low = (byte)E;
|
- *(char *)((ushort *)local_28 + 0x3) = E;
+ ((uw_object_hdr_t *)local_28)->link_word_low = (byte)E;
)
...>
}


@receiver_11_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x6)
+ (char)((uw_object_hdr_t *)local_28)->link_word_low
|
- *(char *)((byte *)local_28 + 0x6)
+ (char)((uw_object_hdr_t *)local_28)->link_word_low
|
- ((char *)local_28)[0x6]
+ (char)((uw_object_hdr_t *)local_28)->link_word_low
|
- *(char *)((ushort *)local_28 + 0x3)
+ (char)((uw_object_hdr_t *)local_28)->link_word_low
|
- (char)((ushort *)local_28)[0x3]
+ (char)((uw_object_hdr_t *)local_28)->link_word_low
)
...>
}


@receiver_11_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)local_28 + 0x7)
+ ((uw_object_hdr_t *)local_28)->link_word_high
|
- *(byte *)((byte *)local_28 + 0x7)
+ ((uw_object_hdr_t *)local_28)->link_word_high
|
- ((byte *)local_28)[0x7]
+ ((uw_object_hdr_t *)local_28)->link_word_high
)
...>
}


@receiver_11_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)local_28 + 0x7)
+ ((uw_object_hdr_t *)local_28)->link_word_high
|
- *(undefined1 *)((byte *)local_28 + 0x7)
+ ((uw_object_hdr_t *)local_28)->link_word_high
|
- ((undefined1 *)local_28)[0x7]
+ ((uw_object_hdr_t *)local_28)->link_word_high
)
...>
}


@receiver_11_w_6_42_store_7@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x7) = E;
+ ((uw_object_hdr_t *)local_28)->link_word_high = (byte)E;
|
- *(char *)((byte *)local_28 + 0x7) = E;
+ ((uw_object_hdr_t *)local_28)->link_word_high = (byte)E;
|
- ((char *)local_28)[0x7] = E;
+ ((uw_object_hdr_t *)local_28)->link_word_high = (byte)E;
)
...>
}


@receiver_11_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)local_28 + 0x7)
+ (char)((uw_object_hdr_t *)local_28)->link_word_high
|
- *(char *)((byte *)local_28 + 0x7)
+ (char)((uw_object_hdr_t *)local_28)->link_word_high
|
- ((char *)local_28)[0x7]
+ (char)((uw_object_hdr_t *)local_28)->link_word_high
)
...>
}


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_2_14_word_ushort@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_word_short@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_store_2@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_store_3@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_4_28_word_ushort@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_word_short@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_store_4@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_store_5@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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

@receiver_12_w_6_42_word_ushort@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_word_short@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_store_6@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_store_7@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_12_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
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


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x0) = (char)V;
- *(char *)((char *)iVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x0) = (char)V;
- *(byte *)((char *)iVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x0) = (byte)V;
- *(char *)((char *)iVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x0) = (byte)V;
- *(byte *)((char *)iVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(ushort *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- ((ushort *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(ushort *)((ushort *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
|
- *(short *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
|
- ((short *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
|
- *(short *)((short *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
)
...>
}


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(byte *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- ((byte *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(byte *)((ushort *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- (byte)((ushort *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(byte *)iVar4
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(undefined1 *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- ((undefined1 *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- (undefined1)((ushort *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(undefined1 *)iVar4
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- ((char *)iVar4)[0x0] = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *(char *)iVar4 = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(char *)((byte *)iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- ((char *)iVar4)[0x0]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(char *)((ushort *)iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- (char)((ushort *)iVar4)[0x0]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(char *)iVar4
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- *(byte *)((byte *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- ((byte *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- *(undefined1 *)((byte *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- ((undefined1 *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
|
- ((char *)iVar4)[0x1] = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
|
- *(char *)((byte *)iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
|
- ((char *)iVar4)[0x1]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_13_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x2) = (char)V;
- *(char *)((char *)iVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x2) = (char)V;
- *(byte *)((char *)iVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x2) = (byte)V;
- *(char *)((char *)iVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x2) = (byte)V;
- *(byte *)((char *)iVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_14_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(ushort *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- ((ushort *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(ushort *)((ushort *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}


@receiver_13_w_2_14_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
|
- *(short *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
|
- ((short *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
|
- *(short *)((short *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
)
...>
}


@receiver_13_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(byte *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- ((byte *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(byte *)((ushort *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- (byte)((ushort *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_13_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(undefined1 *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- ((undefined1 *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- (undefined1)((ushort *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_13_w_2_14_store_2@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- ((char *)iVar4)[0x2] = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_13_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(char *)((byte *)iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- ((char *)iVar4)[0x2]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(char *)((ushort *)iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- (char)((ushort *)iVar4)[0x1]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_13_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- *(byte *)((byte *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- ((byte *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_13_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- *(undefined1 *)((byte *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- ((undefined1 *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_13_w_2_14_store_3@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
|
- ((char *)iVar4)[0x3] = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_13_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
|
- *(char *)((byte *)iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
|
- ((char *)iVar4)[0x3]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_13_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x4) = (char)V;
- *(char *)((char *)iVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x4) = (char)V;
- *(byte *)((char *)iVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x4) = (byte)V;
- *(char *)((char *)iVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x4) = (byte)V;
- *(byte *)((char *)iVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_28_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(ushort *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- ((ushort *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(ushort *)((ushort *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}


@receiver_13_w_4_28_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
|
- *(short *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
|
- ((short *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
|
- *(short *)((short *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
)
...>
}


@receiver_13_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(byte *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- ((byte *)iVar4)[0x4]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(byte *)((ushort *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- (byte)((ushort *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_13_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(undefined1 *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- ((undefined1 *)iVar4)[0x4]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- (undefined1)((ushort *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_13_w_4_28_store_4@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- ((char *)iVar4)[0x4] = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_13_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x4)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(char *)((byte *)iVar4 + 0x4)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- ((char *)iVar4)[0x4]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(char *)((ushort *)iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- (char)((ushort *)iVar4)[0x2]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_13_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- *(byte *)((byte *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- ((byte *)iVar4)[0x5]
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_13_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- *(undefined1 *)((byte *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- ((undefined1 *)iVar4)[0x5]
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_13_w_4_28_store_5@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
|
- ((char *)iVar4)[0x5] = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_13_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x5)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
|
- *(char *)((byte *)iVar4 + 0x5)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
|
- ((char *)iVar4)[0x5]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_13_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x6) = (char)V;
- *(char *)((char *)iVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x6) = (char)V;
- *(byte *)((char *)iVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x6) = (byte)V;
- *(char *)((char *)iVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x6) = (byte)V;
- *(byte *)((char *)iVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_42_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(ushort *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- ((ushort *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(ushort *)((ushort *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}


@receiver_13_w_6_42_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
|
- *(short *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
|
- ((short *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
|
- *(short *)((short *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
)
...>
}


@receiver_13_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(byte *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- ((byte *)iVar4)[0x6]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(byte *)((ushort *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- (byte)((ushort *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_13_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(undefined1 *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- ((undefined1 *)iVar4)[0x6]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- (undefined1)((ushort *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_13_w_6_42_store_6@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- ((char *)iVar4)[0x6] = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_13_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x6)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(char *)((byte *)iVar4 + 0x6)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- ((char *)iVar4)[0x6]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(char *)((ushort *)iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- (char)((ushort *)iVar4)[0x3]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_13_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- *(byte *)((byte *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- ((byte *)iVar4)[0x7]
+ ((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_13_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- *(undefined1 *)((byte *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- ((undefined1 *)iVar4)[0x7]
+ ((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_13_w_6_42_store_7@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
|
- ((char *)iVar4)[0x7] = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_13_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\|place_object_in_backpack_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x7)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
|
- *(char *)((byte *)iVar4 + 0x7)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
|
- ((char *)iVar4)[0x7]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_14_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_store_0@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_store_1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_2_14_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_store_2@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_store_3@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_4_28_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_store_4@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_store_5@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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

@receiver_14_w_6_42_word_ushort@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_word_short@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_store_6@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_store_7@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_14_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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


@receiver_15_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x0) = (char)V;
- *(char *)((char *)puVar11 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x0) = (char)V;
- *(byte *)((char *)puVar11 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x0) = (byte)V;
- *(char *)((char *)puVar11 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x0) = (byte)V;
- *(byte *)((char *)puVar11 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(ushort *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- ((ushort *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(ushort *)((ushort *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
)
...>
}


@receiver_15_w_0_0_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- *(short *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- ((short *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
|
- *(short *)((short *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_signed
)
...>
}


@receiver_15_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- ((byte *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)((ushort *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (byte)((ushort *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(byte *)puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)((byte *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- ((undefined1 *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x0)
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (undefined1)((ushort *)puVar11)[0x0]
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(undefined1 *)puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_15_w_0_0_store_0@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- ((char *)puVar11)[0x0] = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
|
- *(char *)puVar11 = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_low = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)((byte *)puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- ((char *)puVar11)[0x0]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)((ushort *)puVar11 + 0x0)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- (char)((ushort *)puVar11)[0x0]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
|
- *(char *)puVar11
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- *(byte *)((byte *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- ((byte *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_15_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- *(undefined1 *)((byte *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
|
- ((undefined1 *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_15_w_0_0_store_1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_high = (byte)E;
|
- ((char *)puVar11)[0x1] = E;
+ ((uw_object_hdr_t *)puVar11)->type_flags_high = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_high
|
- *(char *)((byte *)puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_high
|
- ((char *)puVar11)[0x1]
+ (char)((uw_object_hdr_t *)puVar11)->type_flags_high
)
...>
}


@receiver_15_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x2) = (char)V;
- *(char *)((char *)puVar11 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x2) = (char)V;
- *(byte *)((char *)puVar11 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x2) = (byte)V;
- *(char *)((char *)puVar11 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x2) = (byte)V;
- *(byte *)((char *)puVar11 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_14_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(ushort *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- ((ushort *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- *(ushort *)((ushort *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word
)
...>
}


@receiver_15_w_2_14_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- *(short *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- ((short *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
|
- *(short *)((short *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_signed
)
...>
}


@receiver_15_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(byte *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- ((byte *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(byte *)((ushort *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- (byte)((ushort *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_15_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(undefined1 *)((byte *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- ((undefined1 *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x1)
+ ((uw_object_hdr_t *)puVar11)->position_word_low
|
- (undefined1)((ushort *)puVar11)[0x1]
+ ((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_15_w_2_14_store_2@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- ((char *)puVar11)[0x2] = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_low = (byte)E;
)
...>
}


@receiver_15_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(char *)((byte *)puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- ((char *)puVar11)[0x2]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- *(char *)((ushort *)puVar11 + 0x1)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
|
- (char)((ushort *)puVar11)[0x1]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_low
)
...>
}


@receiver_15_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- *(byte *)((byte *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- ((byte *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_15_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- *(undefined1 *)((byte *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->position_word_high
|
- ((undefined1 *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_15_w_2_14_store_3@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_high = (byte)E;
|
- ((char *)puVar11)[0x3] = E;
+ ((uw_object_hdr_t *)puVar11)->position_word_high = (byte)E;
)
...>
}


@receiver_15_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_high
|
- *(char *)((byte *)puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->position_word_high
|
- ((char *)puVar11)[0x3]
+ (char)((uw_object_hdr_t *)puVar11)->position_word_high
)
...>
}


@receiver_15_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x4) = (char)V;
- *(char *)((char *)puVar11 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x4) = (char)V;
- *(byte *)((char *)puVar11 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x4) = (byte)V;
- *(char *)((char *)puVar11 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x4) = (byte)V;
- *(byte *)((char *)puVar11 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_28_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(ushort *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- ((ushort *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- *(ushort *)((ushort *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word
)
...>
}


@receiver_15_w_4_28_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- *(short *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- ((short *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
|
- *(short *)((short *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_signed
)
...>
}


@receiver_15_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(byte *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- ((byte *)puVar11)[0x4]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(byte *)((ushort *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (byte)((ushort *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_15_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(undefined1 *)((byte *)puVar11 + 0x4)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- ((undefined1 *)puVar11)[0x4]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x2)
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (undefined1)((ushort *)puVar11)[0x2]
+ ((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_15_w_4_28_store_4@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- ((char *)puVar11)[0x4] = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_low = (byte)E;
)
...>
}


@receiver_15_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x4)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(char *)((byte *)puVar11 + 0x4)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- ((char *)puVar11)[0x4]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- *(char *)((ushort *)puVar11 + 0x2)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
|
- (char)((ushort *)puVar11)[0x2]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_low
)
...>
}


@receiver_15_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- *(byte *)((byte *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- ((byte *)puVar11)[0x5]
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_15_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- *(undefined1 *)((byte *)puVar11 + 0x5)
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
|
- ((undefined1 *)puVar11)[0x5]
+ ((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_15_w_4_28_store_5@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_high = (byte)E;
|
- ((char *)puVar11)[0x5] = E;
+ ((uw_object_hdr_t *)puVar11)->chain_word_high = (byte)E;
)
...>
}


@receiver_15_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x5)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_high
|
- *(char *)((byte *)puVar11 + 0x5)
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_high
|
- ((char *)puVar11)[0x5]
+ (char)((uw_object_hdr_t *)puVar11)->chain_word_high
)
...>
}


@receiver_15_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x6) = (char)V;
- *(char *)((char *)puVar11 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar11 + 0x6) = (char)V;
- *(byte *)((char *)puVar11 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x6) = (byte)V;
- *(char *)((char *)puVar11 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar11 + 0x6) = (byte)V;
- *(byte *)((char *)puVar11 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar11)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_42_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(ushort *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- ((ushort *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- *(ushort *)((ushort *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word
)
...>
}


@receiver_15_w_6_42_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- *(short *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- ((short *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
|
- *(short *)((short *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_signed
)
...>
}


@receiver_15_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(byte *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- ((byte *)puVar11)[0x6]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(byte *)((ushort *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- (byte)((ushort *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_15_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(undefined1 *)((byte *)puVar11 + 0x6)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- ((undefined1 *)puVar11)[0x6]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(undefined1 *)((ushort *)puVar11 + 0x3)
+ ((uw_object_hdr_t *)puVar11)->link_word_low
|
- (undefined1)((ushort *)puVar11)[0x3]
+ ((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_15_w_6_42_store_6@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- ((char *)puVar11)[0x6] = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar11 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_low = (byte)E;
)
...>
}


@receiver_15_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x6)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(char *)((byte *)puVar11 + 0x6)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- ((char *)puVar11)[0x6]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- *(char *)((ushort *)puVar11 + 0x3)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
|
- (char)((ushort *)puVar11)[0x3]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_low
)
...>
}


@receiver_15_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- *(byte *)((byte *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- ((byte *)puVar11)[0x7]
+ ((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_15_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- *(undefined1 *)((byte *)puVar11 + 0x7)
+ ((uw_object_hdr_t *)puVar11)->link_word_high
|
- ((undefined1 *)puVar11)[0x7]
+ ((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_15_w_6_42_store_7@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar11 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_high = (byte)E;
|
- ((char *)puVar11)[0x7] = E;
+ ((uw_object_hdr_t *)puVar11)->link_word_high = (byte)E;
)
...>
}


@receiver_15_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0x7)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_high
|
- *(char *)((byte *)puVar11 + 0x7)
+ (char)((uw_object_hdr_t *)puVar11)->link_word_high
|
- ((char *)puVar11)[0x7]
+ (char)((uw_object_hdr_t *)puVar11)->link_word_high
)
...>
}


@receiver_16_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x0) = (char)V;
- *(char *)((char *)pbVar13 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x0) = (char)V;
- *(byte *)((char *)pbVar13 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x0) = (byte)V;
- *(char *)((char *)pbVar13 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar13 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags
|
- *(ushort *)((byte *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags
|
- ((ushort *)pbVar13)[0x0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags
|
- *(ushort *)((ushort *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags
)
...>
}


@receiver_16_w_0_0_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_signed
|
- *(short *)((byte *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_signed
|
- ((short *)pbVar13)[0x0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_signed
|
- *(short *)((short *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_signed
)
...>
}


@receiver_16_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(byte *)((byte *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- ((byte *)pbVar13)[0x0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(byte *)((ushort *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- (byte)((ushort *)pbVar13)[0x0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(byte *)pbVar13
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- ((undefined1 *)pbVar13)[0x0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar13 + 0x0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- (undefined1)((ushort *)pbVar13)[0x0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(undefined1 *)pbVar13
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low
)
...>
}


@receiver_16_w_0_0_store_0@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low = (byte)E;
|
- ((char *)pbVar13)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar13 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low = (byte)E;
|
- *(char *)pbVar13 = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_low = (byte)E;
)
...>
}


@receiver_16_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(char *)((byte *)pbVar13 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- ((char *)pbVar13)[0x0]
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(char *)((ushort *)pbVar13 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- (char)((ushort *)pbVar13)[0x0]
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_low
|
- *(char *)pbVar13
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high
|
- *(byte *)((byte *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high
|
- ((byte *)pbVar13)[0x1]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high
)
...>
}


@receiver_16_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high
|
- ((undefined1 *)pbVar13)[0x1]
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high
)
...>
}


@receiver_16_w_0_0_store_1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high = (byte)E;
|
- ((char *)pbVar13)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar13)->type_flags_high = (byte)E;
)
...>
}


@receiver_16_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_high
|
- *(char *)((byte *)pbVar13 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_high
|
- ((char *)pbVar13)[0x1]
+ (char)((uw_object_hdr_t *)pbVar13)->type_flags_high
)
...>
}


@receiver_16_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x2) = (char)V;
- *(char *)((char *)pbVar13 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x2) = (char)V;
- *(byte *)((char *)pbVar13 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x2) = (byte)V;
- *(char *)((char *)pbVar13 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar13 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_14_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word
|
- *(ushort *)((byte *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word
|
- ((ushort *)pbVar13)[0x1]
+ ((uw_object_hdr_t *)pbVar13)->position_word
|
- *(ushort *)((ushort *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->position_word
)
...>
}


@receiver_16_w_2_14_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word_signed
|
- *(short *)((byte *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word_signed
|
- ((short *)pbVar13)[0x1]
+ ((uw_object_hdr_t *)pbVar13)->position_word_signed
|
- *(short *)((short *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->position_word_signed
)
...>
}


@receiver_16_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- *(byte *)((byte *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- ((byte *)pbVar13)[0x2]
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- *(byte *)((ushort *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- (byte)((ushort *)pbVar13)[0x1]
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
)
...>
}


@receiver_16_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- *(undefined1 *)((byte *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- ((undefined1 *)pbVar13)[0x2]
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar13 + 0x1)
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
|
- (undefined1)((ushort *)pbVar13)[0x1]
+ ((uw_object_hdr_t *)pbVar13)->position_word_low
)
...>
}


@receiver_16_w_2_14_store_2@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_low = (byte)E;
|
- ((char *)pbVar13)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar13 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_low = (byte)E;
)
...>
}


@receiver_16_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_low
|
- *(char *)((byte *)pbVar13 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_low
|
- ((char *)pbVar13)[0x2]
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_low
|
- *(char *)((ushort *)pbVar13 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_low
|
- (char)((ushort *)pbVar13)[0x1]
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_low
)
...>
}


@receiver_16_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->position_word_high
|
- *(byte *)((byte *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->position_word_high
|
- ((byte *)pbVar13)[0x3]
+ ((uw_object_hdr_t *)pbVar13)->position_word_high
)
...>
}


@receiver_16_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->position_word_high
|
- *(undefined1 *)((byte *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->position_word_high
|
- ((undefined1 *)pbVar13)[0x3]
+ ((uw_object_hdr_t *)pbVar13)->position_word_high
)
...>
}


@receiver_16_w_2_14_store_3@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_high = (byte)E;
|
- ((char *)pbVar13)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar13)->position_word_high = (byte)E;
)
...>
}


@receiver_16_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_high
|
- *(char *)((byte *)pbVar13 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_high
|
- ((char *)pbVar13)[0x3]
+ (char)((uw_object_hdr_t *)pbVar13)->position_word_high
)
...>
}


@receiver_16_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x4) = (char)V;
- *(char *)((char *)pbVar13 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x4) = (char)V;
- *(byte *)((char *)pbVar13 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x4) = (byte)V;
- *(char *)((char *)pbVar13 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar13 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_28_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word
|
- *(ushort *)((byte *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word
|
- ((ushort *)pbVar13)[0x2]
+ ((uw_object_hdr_t *)pbVar13)->chain_word
|
- *(ushort *)((ushort *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->chain_word
)
...>
}


@receiver_16_w_4_28_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_signed
|
- *(short *)((byte *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_signed
|
- ((short *)pbVar13)[0x2]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_signed
|
- *(short *)((short *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_signed
)
...>
}


@receiver_16_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- *(byte *)((byte *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- ((byte *)pbVar13)[0x4]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- *(byte *)((ushort *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- (byte)((ushort *)pbVar13)[0x2]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
)
...>
}


@receiver_16_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar13 + 0x4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- ((undefined1 *)pbVar13)[0x4]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar13 + 0x2)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- (undefined1)((ushort *)pbVar13)[0x2]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low
)
...>
}


@receiver_16_w_4_28_store_4@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low = (byte)E;
|
- ((char *)pbVar13)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar13 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_low = (byte)E;
)
...>
}


@receiver_16_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- *(char *)((byte *)pbVar13 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- ((char *)pbVar13)[0x4]
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- *(char *)((ushort *)pbVar13 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_low
|
- (char)((ushort *)pbVar13)[0x2]
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_low
)
...>
}


@receiver_16_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x5)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high
|
- *(byte *)((byte *)pbVar13 + 0x5)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high
|
- ((byte *)pbVar13)[0x5]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high
)
...>
}


@receiver_16_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x5)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar13 + 0x5)
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high
|
- ((undefined1 *)pbVar13)[0x5]
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high
)
...>
}


@receiver_16_w_4_28_store_5@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high = (byte)E;
|
- ((char *)pbVar13)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar13)->chain_word_high = (byte)E;
)
...>
}


@receiver_16_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_high
|
- *(char *)((byte *)pbVar13 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_high
|
- ((char *)pbVar13)[0x5]
+ (char)((uw_object_hdr_t *)pbVar13)->chain_word_high
)
...>
}


@receiver_16_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x6) = (char)V;
- *(char *)((char *)pbVar13 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar13 + 0x6) = (char)V;
- *(byte *)((char *)pbVar13 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x6) = (byte)V;
- *(char *)((char *)pbVar13 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar13 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar13 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar13)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_42_word_ushort@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word
|
- *(ushort *)((byte *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word
|
- ((ushort *)pbVar13)[0x3]
+ ((uw_object_hdr_t *)pbVar13)->link_word
|
- *(ushort *)((ushort *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->link_word
)
...>
}


@receiver_16_w_6_42_word_short@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word_signed
|
- *(short *)((byte *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word_signed
|
- ((short *)pbVar13)[0x3]
+ ((uw_object_hdr_t *)pbVar13)->link_word_signed
|
- *(short *)((short *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->link_word_signed
)
...>
}


@receiver_16_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- *(byte *)((byte *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- ((byte *)pbVar13)[0x6]
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- *(byte *)((ushort *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- (byte)((ushort *)pbVar13)[0x3]
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
)
...>
}


@receiver_16_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- *(undefined1 *)((byte *)pbVar13 + 0x6)
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- ((undefined1 *)pbVar13)[0x6]
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar13 + 0x3)
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
|
- (undefined1)((ushort *)pbVar13)[0x3]
+ ((uw_object_hdr_t *)pbVar13)->link_word_low
)
...>
}


@receiver_16_w_6_42_store_6@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_low = (byte)E;
|
- ((char *)pbVar13)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar13 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_low = (byte)E;
)
...>
}


@receiver_16_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_low
|
- *(char *)((byte *)pbVar13 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_low
|
- ((char *)pbVar13)[0x6]
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_low
|
- *(char *)((ushort *)pbVar13 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_low
|
- (char)((ushort *)pbVar13)[0x3]
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_low
)
...>
}


@receiver_16_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar13 + 0x7)
+ ((uw_object_hdr_t *)pbVar13)->link_word_high
|
- *(byte *)((byte *)pbVar13 + 0x7)
+ ((uw_object_hdr_t *)pbVar13)->link_word_high
|
- ((byte *)pbVar13)[0x7]
+ ((uw_object_hdr_t *)pbVar13)->link_word_high
)
...>
}


@receiver_16_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar13 + 0x7)
+ ((uw_object_hdr_t *)pbVar13)->link_word_high
|
- *(undefined1 *)((byte *)pbVar13 + 0x7)
+ ((uw_object_hdr_t *)pbVar13)->link_word_high
|
- ((undefined1 *)pbVar13)[0x7]
+ ((uw_object_hdr_t *)pbVar13)->link_word_high
)
...>
}


@receiver_16_w_6_42_store_7@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar13 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_high = (byte)E;
|
- ((char *)pbVar13)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar13)->link_word_high = (byte)E;
)
...>
}


@receiver_16_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar13 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_high
|
- *(char *)((byte *)pbVar13 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_high
|
- ((char *)pbVar13)[0x7]
+ (char)((uw_object_hdr_t *)pbVar13)->link_word_high
)
...>
}
