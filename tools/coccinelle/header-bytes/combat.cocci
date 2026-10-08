@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\)$";
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


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x0) = (char)V;
- *(char *)((char *)iVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x0) = (char)V;
- *(byte *)((char *)iVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x0) = (byte)V;
- *(char *)((char *)iVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x0) = (byte)V;
- *(byte *)((char *)iVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags
|
- *(ushort *)((byte *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags
|
- ((ushort *)iVar7)[0x0]
+ ((uw_object_hdr_t *)iVar7)->type_flags
|
- *(ushort *)((ushort *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_signed
|
- *(short *)((byte *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_signed
|
- ((short *)iVar7)[0x0]
+ ((uw_object_hdr_t *)iVar7)->type_flags_signed
|
- *(short *)((short *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(byte *)((byte *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- ((byte *)iVar7)[0x0]
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(byte *)((ushort *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- (byte)((ushort *)iVar7)[0x0]
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(byte *)iVar7
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(undefined1 *)((byte *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- ((undefined1 *)iVar7)[0x0]
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar7 + 0x0)
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- (undefined1)((ushort *)iVar7)[0x0]
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(undefined1 *)iVar7
+ ((uw_object_hdr_t *)iVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_low = (byte)E;
|
- ((char *)iVar7)[0x0] = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_low = (byte)E;
|
- *(char *)iVar7 = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x0)
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(char *)((byte *)iVar7 + 0x0)
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_low
|
- ((char *)iVar7)[0x0]
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(char *)((ushort *)iVar7 + 0x0)
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_low
|
- (char)((ushort *)iVar7)[0x0]
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_low
|
- *(char *)iVar7
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->type_flags_high
|
- *(byte *)((byte *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->type_flags_high
|
- ((byte *)iVar7)[0x1]
+ ((uw_object_hdr_t *)iVar7)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->type_flags_high
|
- *(undefined1 *)((byte *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->type_flags_high
|
- ((undefined1 *)iVar7)[0x1]
+ ((uw_object_hdr_t *)iVar7)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_high = (byte)E;
|
- ((char *)iVar7)[0x1] = E;
+ ((uw_object_hdr_t *)iVar7)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x1)
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_high
|
- *(char *)((byte *)iVar7 + 0x1)
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_high
|
- ((char *)iVar7)[0x1]
+ (char)((uw_object_hdr_t *)iVar7)->type_flags_high
)
...>
}


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x2) = (char)V;
- *(char *)((char *)iVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x2) = (char)V;
- *(byte *)((char *)iVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x2) = (byte)V;
- *(char *)((char *)iVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x2) = (byte)V;
- *(byte *)((char *)iVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word
|
- *(ushort *)((byte *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word
|
- ((ushort *)iVar7)[0x1]
+ ((uw_object_hdr_t *)iVar7)->position_word
|
- *(ushort *)((ushort *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->position_word
)
...>
}


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word_signed
|
- *(short *)((byte *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word_signed
|
- ((short *)iVar7)[0x1]
+ ((uw_object_hdr_t *)iVar7)->position_word_signed
|
- *(short *)((short *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->position_word_signed
)
...>
}


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- *(byte *)((byte *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- ((byte *)iVar7)[0x2]
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- *(byte *)((ushort *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- (byte)((ushort *)iVar7)[0x1]
+ ((uw_object_hdr_t *)iVar7)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- *(undefined1 *)((byte *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- ((undefined1 *)iVar7)[0x2]
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- *(undefined1 *)((ushort *)iVar7 + 0x1)
+ ((uw_object_hdr_t *)iVar7)->position_word_low
|
- (undefined1)((ushort *)iVar7)[0x1]
+ ((uw_object_hdr_t *)iVar7)->position_word_low
)
...>
}


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_low = (byte)E;
|
- ((char *)iVar7)[0x2] = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x2)
+ (char)((uw_object_hdr_t *)iVar7)->position_word_low
|
- *(char *)((byte *)iVar7 + 0x2)
+ (char)((uw_object_hdr_t *)iVar7)->position_word_low
|
- ((char *)iVar7)[0x2]
+ (char)((uw_object_hdr_t *)iVar7)->position_word_low
|
- *(char *)((ushort *)iVar7 + 0x1)
+ (char)((uw_object_hdr_t *)iVar7)->position_word_low
|
- (char)((ushort *)iVar7)[0x1]
+ (char)((uw_object_hdr_t *)iVar7)->position_word_low
)
...>
}


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->position_word_high
|
- *(byte *)((byte *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->position_word_high
|
- ((byte *)iVar7)[0x3]
+ ((uw_object_hdr_t *)iVar7)->position_word_high
)
...>
}


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->position_word_high
|
- *(undefined1 *)((byte *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->position_word_high
|
- ((undefined1 *)iVar7)[0x3]
+ ((uw_object_hdr_t *)iVar7)->position_word_high
)
...>
}


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_high = (byte)E;
|
- ((char *)iVar7)[0x3] = E;
+ ((uw_object_hdr_t *)iVar7)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x3)
+ (char)((uw_object_hdr_t *)iVar7)->position_word_high
|
- *(char *)((byte *)iVar7 + 0x3)
+ (char)((uw_object_hdr_t *)iVar7)->position_word_high
|
- ((char *)iVar7)[0x3]
+ (char)((uw_object_hdr_t *)iVar7)->position_word_high
)
...>
}


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x4) = (char)V;
- *(char *)((char *)iVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x4) = (char)V;
- *(byte *)((char *)iVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x4) = (byte)V;
- *(char *)((char *)iVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x4) = (byte)V;
- *(byte *)((char *)iVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word
|
- *(ushort *)((byte *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word
|
- ((ushort *)iVar7)[0x2]
+ ((uw_object_hdr_t *)iVar7)->chain_word
|
- *(ushort *)((ushort *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->chain_word
)
...>
}


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word_signed
|
- *(short *)((byte *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word_signed
|
- ((short *)iVar7)[0x2]
+ ((uw_object_hdr_t *)iVar7)->chain_word_signed
|
- *(short *)((short *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->chain_word_signed
)
...>
}


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- *(byte *)((byte *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- ((byte *)iVar7)[0x4]
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- *(byte *)((ushort *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- (byte)((ushort *)iVar7)[0x2]
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- *(undefined1 *)((byte *)iVar7 + 0x4)
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- ((undefined1 *)iVar7)[0x4]
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar7 + 0x2)
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
|
- (undefined1)((ushort *)iVar7)[0x2]
+ ((uw_object_hdr_t *)iVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_low = (byte)E;
|
- ((char *)iVar7)[0x4] = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x4)
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_low
|
- *(char *)((byte *)iVar7 + 0x4)
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_low
|
- ((char *)iVar7)[0x4]
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_low
|
- *(char *)((ushort *)iVar7 + 0x2)
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_low
|
- (char)((ushort *)iVar7)[0x2]
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x5)
+ ((uw_object_hdr_t *)iVar7)->chain_word_high
|
- *(byte *)((byte *)iVar7 + 0x5)
+ ((uw_object_hdr_t *)iVar7)->chain_word_high
|
- ((byte *)iVar7)[0x5]
+ ((uw_object_hdr_t *)iVar7)->chain_word_high
)
...>
}


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x5)
+ ((uw_object_hdr_t *)iVar7)->chain_word_high
|
- *(undefined1 *)((byte *)iVar7 + 0x5)
+ ((uw_object_hdr_t *)iVar7)->chain_word_high
|
- ((undefined1 *)iVar7)[0x5]
+ ((uw_object_hdr_t *)iVar7)->chain_word_high
)
...>
}


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_high = (byte)E;
|
- ((char *)iVar7)[0x5] = E;
+ ((uw_object_hdr_t *)iVar7)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x5)
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_high
|
- *(char *)((byte *)iVar7 + 0x5)
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_high
|
- ((char *)iVar7)[0x5]
+ (char)((uw_object_hdr_t *)iVar7)->chain_word_high
)
...>
}


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x6) = (char)V;
- *(char *)((char *)iVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar7 + 0x6) = (char)V;
- *(byte *)((char *)iVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x6) = (byte)V;
- *(char *)((char *)iVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar7 + 0x6) = (byte)V;
- *(byte *)((char *)iVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar7)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word
|
- *(ushort *)((byte *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word
|
- ((ushort *)iVar7)[0x3]
+ ((uw_object_hdr_t *)iVar7)->link_word
|
- *(ushort *)((ushort *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->link_word
)
...>
}


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word_signed
|
- *(short *)((byte *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word_signed
|
- ((short *)iVar7)[0x3]
+ ((uw_object_hdr_t *)iVar7)->link_word_signed
|
- *(short *)((short *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->link_word_signed
)
...>
}


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- *(byte *)((byte *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- ((byte *)iVar7)[0x6]
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- *(byte *)((ushort *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- (byte)((ushort *)iVar7)[0x3]
+ ((uw_object_hdr_t *)iVar7)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- *(undefined1 *)((byte *)iVar7 + 0x6)
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- ((undefined1 *)iVar7)[0x6]
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- *(undefined1 *)((ushort *)iVar7 + 0x3)
+ ((uw_object_hdr_t *)iVar7)->link_word_low
|
- (undefined1)((ushort *)iVar7)[0x3]
+ ((uw_object_hdr_t *)iVar7)->link_word_low
)
...>
}


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_low = (byte)E;
|
- ((char *)iVar7)[0x6] = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x6)
+ (char)((uw_object_hdr_t *)iVar7)->link_word_low
|
- *(char *)((byte *)iVar7 + 0x6)
+ (char)((uw_object_hdr_t *)iVar7)->link_word_low
|
- ((char *)iVar7)[0x6]
+ (char)((uw_object_hdr_t *)iVar7)->link_word_low
|
- *(char *)((ushort *)iVar7 + 0x3)
+ (char)((uw_object_hdr_t *)iVar7)->link_word_low
|
- (char)((ushort *)iVar7)[0x3]
+ (char)((uw_object_hdr_t *)iVar7)->link_word_low
)
...>
}


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar7 + 0x7)
+ ((uw_object_hdr_t *)iVar7)->link_word_high
|
- *(byte *)((byte *)iVar7 + 0x7)
+ ((uw_object_hdr_t *)iVar7)->link_word_high
|
- ((byte *)iVar7)[0x7]
+ ((uw_object_hdr_t *)iVar7)->link_word_high
)
...>
}


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar7 + 0x7)
+ ((uw_object_hdr_t *)iVar7)->link_word_high
|
- *(undefined1 *)((byte *)iVar7 + 0x7)
+ ((uw_object_hdr_t *)iVar7)->link_word_high
|
- ((undefined1 *)iVar7)[0x7]
+ ((uw_object_hdr_t *)iVar7)->link_word_high
)
...>
}


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_high = (byte)E;
|
- ((char *)iVar7)[0x7] = E;
+ ((uw_object_hdr_t *)iVar7)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar7 + 0x7)
+ (char)((uw_object_hdr_t *)iVar7)->link_word_high
|
- *(char *)((byte *)iVar7 + 0x7)
+ (char)((uw_object_hdr_t *)iVar7)->link_word_high
|
- ((char *)iVar7)[0x7]
+ (char)((uw_object_hdr_t *)iVar7)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x0) = (char)V;
- *(char *)((char *)pbVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x0) = (char)V;
- *(byte *)((char *)pbVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x0) = (byte)V;
- *(char *)((char *)pbVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(ushort *)((byte *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- ((ushort *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(ushort *)((ushort *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_signed
|
- *(short *)((byte *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_signed
|
- ((short *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_signed
|
- *(short *)((short *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(byte *)((byte *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- ((byte *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(byte *)((ushort *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- (byte)((ushort *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(byte *)pbVar5
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- ((undefined1 *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar5 + 0x0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- (undefined1)((ushort *)pbVar5)[0x0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(undefined1 *)pbVar5
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
|
- ((char *)pbVar5)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
|
- *(char *)pbVar5 = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(char *)((byte *)pbVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- ((char *)pbVar5)[0x0]
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(char *)((ushort *)pbVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- (char)((ushort *)pbVar5)[0x0]
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
|
- *(char *)pbVar5
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- *(byte *)((byte *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- ((byte *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- ((undefined1 *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high = (byte)E;
|
- ((char *)pbVar5)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar5)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- *(char *)((byte *)pbVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_high
|
- ((char *)pbVar5)[0x1]
+ (char)((uw_object_hdr_t *)pbVar5)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x2) = (char)V;
- *(char *)((char *)pbVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x2) = (char)V;
- *(byte *)((char *)pbVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x2) = (byte)V;
- *(char *)((char *)pbVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- *(ushort *)((byte *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- ((ushort *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- *(ushort *)((ushort *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_signed
|
- *(short *)((byte *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_signed
|
- ((short *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->position_word_signed
|
- *(short *)((short *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- *(byte *)((byte *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- ((byte *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- *(byte *)((ushort *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- (byte)((ushort *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- *(undefined1 *)((byte *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- ((undefined1 *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar5 + 0x1)
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
|
- (undefined1)((ushort *)pbVar5)[0x1]
+ ((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_low = (byte)E;
|
- ((char *)pbVar5)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
|
- *(char *)((byte *)pbVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
|
- ((char *)pbVar5)[0x2]
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
|
- *(char *)((ushort *)pbVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
|
- (char)((ushort *)pbVar5)[0x1]
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
|
- *(byte *)((byte *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
|
- ((byte *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
|
- *(undefined1 *)((byte *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
|
- ((undefined1 *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_high = (byte)E;
|
- ((char *)pbVar5)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar5)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_high
|
- *(char *)((byte *)pbVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_high
|
- ((char *)pbVar5)[0x3]
+ (char)((uw_object_hdr_t *)pbVar5)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x4) = (char)V;
- *(char *)((char *)pbVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x4) = (char)V;
- *(byte *)((char *)pbVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x4) = (byte)V;
- *(char *)((char *)pbVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- *(ushort *)((byte *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- ((ushort *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- *(ushort *)((ushort *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_signed
|
- *(short *)((byte *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_signed
|
- ((short *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_signed
|
- *(short *)((short *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- *(byte *)((byte *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- ((byte *)pbVar5)[0x4]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- *(byte *)((ushort *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- (byte)((ushort *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar5 + 0x4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- ((undefined1 *)pbVar5)[0x4]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar5 + 0x2)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- (undefined1)((ushort *)pbVar5)[0x2]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low = (byte)E;
|
- ((char *)pbVar5)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- *(char *)((byte *)pbVar5 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- ((char *)pbVar5)[0x4]
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- *(char *)((ushort *)pbVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
|
- (char)((ushort *)pbVar5)[0x2]
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x5)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- *(byte *)((byte *)pbVar5 + 0x5)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- ((byte *)pbVar5)[0x5]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x5)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar5 + 0x5)
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- ((undefined1 *)pbVar5)[0x5]
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high = (byte)E;
|
- ((char *)pbVar5)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar5)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- *(char *)((byte *)pbVar5 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_high
|
- ((char *)pbVar5)[0x5]
+ (char)((uw_object_hdr_t *)pbVar5)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x6) = (char)V;
- *(char *)((char *)pbVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar5 + 0x6) = (char)V;
- *(byte *)((char *)pbVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x6) = (byte)V;
- *(char *)((char *)pbVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar5 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- *(ushort *)((byte *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- ((ushort *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- *(ushort *)((ushort *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_signed
|
- *(short *)((byte *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_signed
|
- ((short *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->link_word_signed
|
- *(short *)((short *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- *(byte *)((byte *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- ((byte *)pbVar5)[0x6]
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- *(byte *)((ushort *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- (byte)((ushort *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- *(undefined1 *)((byte *)pbVar5 + 0x6)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- ((undefined1 *)pbVar5)[0x6]
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar5 + 0x3)
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
|
- (undefined1)((ushort *)pbVar5)[0x3]
+ ((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_low = (byte)E;
|
- ((char *)pbVar5)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
|
- *(char *)((byte *)pbVar5 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
|
- ((char *)pbVar5)[0x6]
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
|
- *(char *)((ushort *)pbVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
|
- (char)((ushort *)pbVar5)[0x3]
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar5 + 0x7)
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
|
- *(byte *)((byte *)pbVar5 + 0x7)
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
|
- ((byte *)pbVar5)[0x7]
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar5 + 0x7)
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
|
- *(undefined1 *)((byte *)pbVar5 + 0x7)
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
|
- ((undefined1 *)pbVar5)[0x7]
+ ((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_high = (byte)E;
|
- ((char *)pbVar5)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar5)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar5 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_high
|
- *(char *)((byte *)pbVar5 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_high
|
- ((char *)pbVar5)[0x7]
+ (char)((uw_object_hdr_t *)pbVar5)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x0) = (char)V;
- *(char *)((char *)uVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x0) = (char)V;
- *(byte *)((char *)uVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x0) = (byte)V;
- *(char *)((char *)uVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x0) = (byte)V;
- *(byte *)((char *)uVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- *(ushort *)((byte *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- ((ushort *)uVar7)[0x0]
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- *(ushort *)((ushort *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_signed
|
- *(short *)((byte *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_signed
|
- ((short *)uVar7)[0x0]
+ ((uw_object_hdr_t *)uVar7)->type_flags_signed
|
- *(short *)((short *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(byte *)((byte *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- ((byte *)uVar7)[0x0]
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(byte *)((ushort *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- (byte)((ushort *)uVar7)[0x0]
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(byte *)uVar7
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(undefined1 *)((byte *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- ((undefined1 *)uVar7)[0x0]
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(undefined1 *)((ushort *)uVar7 + 0x0)
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- (undefined1)((ushort *)uVar7)[0x0]
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(undefined1 *)uVar7
+ ((uw_object_hdr_t *)uVar7)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_low = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_low = (byte)E;
|
- ((char *)uVar7)[0x0] = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)uVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_low = (byte)E;
|
- *(char *)uVar7 = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x0)
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(char *)((byte *)uVar7 + 0x0)
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_low
|
- ((char *)uVar7)[0x0]
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(char *)((ushort *)uVar7 + 0x0)
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_low
|
- (char)((ushort *)uVar7)[0x0]
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_low
|
- *(char *)uVar7
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->type_flags_high
|
- *(byte *)((byte *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->type_flags_high
|
- ((byte *)uVar7)[0x1]
+ ((uw_object_hdr_t *)uVar7)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->type_flags_high
|
- *(undefined1 *)((byte *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->type_flags_high
|
- ((undefined1 *)uVar7)[0x1]
+ ((uw_object_hdr_t *)uVar7)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_high = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_high = (byte)E;
|
- ((char *)uVar7)[0x1] = E;
+ ((uw_object_hdr_t *)uVar7)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x1)
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_high
|
- *(char *)((byte *)uVar7 + 0x1)
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_high
|
- ((char *)uVar7)[0x1]
+ (char)((uw_object_hdr_t *)uVar7)->type_flags_high
)
...>
}


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x2) = (char)V;
- *(char *)((char *)uVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x2) = (char)V;
- *(byte *)((char *)uVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x2) = (byte)V;
- *(char *)((char *)uVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x2) = (byte)V;
- *(byte *)((char *)uVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word
|
- *(ushort *)((byte *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word
|
- ((ushort *)uVar7)[0x1]
+ ((uw_object_hdr_t *)uVar7)->position_word
|
- *(ushort *)((ushort *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->position_word
)
...>
}


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word_signed
|
- *(short *)((byte *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word_signed
|
- ((short *)uVar7)[0x1]
+ ((uw_object_hdr_t *)uVar7)->position_word_signed
|
- *(short *)((short *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->position_word_signed
)
...>
}


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- *(byte *)((byte *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- ((byte *)uVar7)[0x2]
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- *(byte *)((ushort *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- (byte)((ushort *)uVar7)[0x1]
+ ((uw_object_hdr_t *)uVar7)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- *(undefined1 *)((byte *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- ((undefined1 *)uVar7)[0x2]
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- *(undefined1 *)((ushort *)uVar7 + 0x1)
+ ((uw_object_hdr_t *)uVar7)->position_word_low
|
- (undefined1)((ushort *)uVar7)[0x1]
+ ((uw_object_hdr_t *)uVar7)->position_word_low
)
...>
}


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_low = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_low = (byte)E;
|
- ((char *)uVar7)[0x2] = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_low = (byte)E;
|
- *(char *)((ushort *)uVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x2)
+ (char)((uw_object_hdr_t *)uVar7)->position_word_low
|
- *(char *)((byte *)uVar7 + 0x2)
+ (char)((uw_object_hdr_t *)uVar7)->position_word_low
|
- ((char *)uVar7)[0x2]
+ (char)((uw_object_hdr_t *)uVar7)->position_word_low
|
- *(char *)((ushort *)uVar7 + 0x1)
+ (char)((uw_object_hdr_t *)uVar7)->position_word_low
|
- (char)((ushort *)uVar7)[0x1]
+ (char)((uw_object_hdr_t *)uVar7)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->position_word_high
|
- *(byte *)((byte *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->position_word_high
|
- ((byte *)uVar7)[0x3]
+ ((uw_object_hdr_t *)uVar7)->position_word_high
)
...>
}


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->position_word_high
|
- *(undefined1 *)((byte *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->position_word_high
|
- ((undefined1 *)uVar7)[0x3]
+ ((uw_object_hdr_t *)uVar7)->position_word_high
)
...>
}


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_high = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_high = (byte)E;
|
- ((char *)uVar7)[0x3] = E;
+ ((uw_object_hdr_t *)uVar7)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x3)
+ (char)((uw_object_hdr_t *)uVar7)->position_word_high
|
- *(char *)((byte *)uVar7 + 0x3)
+ (char)((uw_object_hdr_t *)uVar7)->position_word_high
|
- ((char *)uVar7)[0x3]
+ (char)((uw_object_hdr_t *)uVar7)->position_word_high
)
...>
}


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x4) = (char)V;
- *(char *)((char *)uVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x4) = (char)V;
- *(byte *)((char *)uVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x4) = (byte)V;
- *(char *)((char *)uVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x4) = (byte)V;
- *(byte *)((char *)uVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word
|
- *(ushort *)((byte *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word
|
- ((ushort *)uVar7)[0x2]
+ ((uw_object_hdr_t *)uVar7)->chain_word
|
- *(ushort *)((ushort *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->chain_word
)
...>
}


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word_signed
|
- *(short *)((byte *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word_signed
|
- ((short *)uVar7)[0x2]
+ ((uw_object_hdr_t *)uVar7)->chain_word_signed
|
- *(short *)((short *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->chain_word_signed
)
...>
}


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- *(byte *)((byte *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- ((byte *)uVar7)[0x4]
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- *(byte *)((ushort *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- (byte)((ushort *)uVar7)[0x2]
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- *(undefined1 *)((byte *)uVar7 + 0x4)
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- ((undefined1 *)uVar7)[0x4]
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- *(undefined1 *)((ushort *)uVar7 + 0x2)
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
|
- (undefined1)((ushort *)uVar7)[0x2]
+ ((uw_object_hdr_t *)uVar7)->chain_word_low
)
...>
}


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_low = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_low = (byte)E;
|
- ((char *)uVar7)[0x4] = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)uVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x4)
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_low
|
- *(char *)((byte *)uVar7 + 0x4)
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_low
|
- ((char *)uVar7)[0x4]
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_low
|
- *(char *)((ushort *)uVar7 + 0x2)
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_low
|
- (char)((ushort *)uVar7)[0x2]
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x5)
+ ((uw_object_hdr_t *)uVar7)->chain_word_high
|
- *(byte *)((byte *)uVar7 + 0x5)
+ ((uw_object_hdr_t *)uVar7)->chain_word_high
|
- ((byte *)uVar7)[0x5]
+ ((uw_object_hdr_t *)uVar7)->chain_word_high
)
...>
}


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x5)
+ ((uw_object_hdr_t *)uVar7)->chain_word_high
|
- *(undefined1 *)((byte *)uVar7 + 0x5)
+ ((uw_object_hdr_t *)uVar7)->chain_word_high
|
- ((undefined1 *)uVar7)[0x5]
+ ((uw_object_hdr_t *)uVar7)->chain_word_high
)
...>
}


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_high = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_high = (byte)E;
|
- ((char *)uVar7)[0x5] = E;
+ ((uw_object_hdr_t *)uVar7)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x5)
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_high
|
- *(char *)((byte *)uVar7 + 0x5)
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_high
|
- ((char *)uVar7)[0x5]
+ (char)((uw_object_hdr_t *)uVar7)->chain_word_high
)
...>
}


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x6) = (char)V;
- *(char *)((char *)uVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar7 + 0x6) = (char)V;
- *(byte *)((char *)uVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x6) = (byte)V;
- *(char *)((char *)uVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar7 + 0x6) = (byte)V;
- *(byte *)((char *)uVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar7)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word
|
- *(ushort *)((byte *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word
|
- ((ushort *)uVar7)[0x3]
+ ((uw_object_hdr_t *)uVar7)->link_word
|
- *(ushort *)((ushort *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->link_word
)
...>
}


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word_signed
|
- *(short *)((byte *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word_signed
|
- ((short *)uVar7)[0x3]
+ ((uw_object_hdr_t *)uVar7)->link_word_signed
|
- *(short *)((short *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->link_word_signed
)
...>
}


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- *(byte *)((byte *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- ((byte *)uVar7)[0x6]
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- *(byte *)((ushort *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- (byte)((ushort *)uVar7)[0x3]
+ ((uw_object_hdr_t *)uVar7)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- *(undefined1 *)((byte *)uVar7 + 0x6)
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- ((undefined1 *)uVar7)[0x6]
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- *(undefined1 *)((ushort *)uVar7 + 0x3)
+ ((uw_object_hdr_t *)uVar7)->link_word_low
|
- (undefined1)((ushort *)uVar7)[0x3]
+ ((uw_object_hdr_t *)uVar7)->link_word_low
)
...>
}


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_low = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_low = (byte)E;
|
- ((char *)uVar7)[0x6] = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_low = (byte)E;
|
- *(char *)((ushort *)uVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x6)
+ (char)((uw_object_hdr_t *)uVar7)->link_word_low
|
- *(char *)((byte *)uVar7 + 0x6)
+ (char)((uw_object_hdr_t *)uVar7)->link_word_low
|
- ((char *)uVar7)[0x6]
+ (char)((uw_object_hdr_t *)uVar7)->link_word_low
|
- *(char *)((ushort *)uVar7 + 0x3)
+ (char)((uw_object_hdr_t *)uVar7)->link_word_low
|
- (char)((ushort *)uVar7)[0x3]
+ (char)((uw_object_hdr_t *)uVar7)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar7 + 0x7)
+ ((uw_object_hdr_t *)uVar7)->link_word_high
|
- *(byte *)((byte *)uVar7 + 0x7)
+ ((uw_object_hdr_t *)uVar7)->link_word_high
|
- ((byte *)uVar7)[0x7]
+ ((uw_object_hdr_t *)uVar7)->link_word_high
)
...>
}


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar7 + 0x7)
+ ((uw_object_hdr_t *)uVar7)->link_word_high
|
- *(undefined1 *)((byte *)uVar7 + 0x7)
+ ((uw_object_hdr_t *)uVar7)->link_word_high
|
- ((undefined1 *)uVar7)[0x7]
+ ((uw_object_hdr_t *)uVar7)->link_word_high
)
...>
}


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_high = (byte)E;
|
- *(char *)((byte *)uVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_high = (byte)E;
|
- ((char *)uVar7)[0x7] = E;
+ ((uw_object_hdr_t *)uVar7)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar7 + 0x7)
+ (char)((uw_object_hdr_t *)uVar7)->link_word_high
|
- *(char *)((byte *)uVar7 + 0x7)
+ (char)((uw_object_hdr_t *)uVar7)->link_word_high
|
- ((char *)uVar7)[0x7]
+ (char)((uw_object_hdr_t *)uVar7)->link_word_high
)
...>
}


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_2_14_word_ushort@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_word_short@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_store_2@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_store_3@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_4_28_word_ushort@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_word_short@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_store_4@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_store_5@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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

@receiver_5_w_6_42_word_ushort@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_word_short@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_store_6@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_store_7@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_5_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(play_weapon_impact_sound\|process_melee_attack_swing\)$";
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


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_2_14_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_store_2@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_store_3@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_4_28_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_store_4@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_store_5@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@receiver_6_w_6_42_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_store_6@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_store_7@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_6_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x0) = (char)V;
- *(char *)((char *)iVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x0) = (char)V;
- *(byte *)((char *)iVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x0) = (byte)V;
- *(char *)((char *)iVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x0) = (byte)V;
- *(byte *)((char *)iVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(ushort *)((byte *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- ((ushort *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(ushort *)((ushort *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_signed
|
- *(short *)((byte *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_signed
|
- ((short *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_signed
|
- *(short *)((short *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_signed
)
...>
}


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(byte *)((byte *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- ((byte *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(byte *)((ushort *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- (byte)((ushort *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(byte *)iVar2
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(undefined1 *)((byte *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- ((undefined1 *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar2 + 0x0)
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- (undefined1)((ushort *)iVar2)[0x0]
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(undefined1 *)iVar2
+ ((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
|
- ((char *)iVar2)[0x0] = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
|
- *(char *)iVar2 = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x0)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(char *)((byte *)iVar2 + 0x0)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- ((char *)iVar2)[0x0]
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(char *)((ushort *)iVar2 + 0x0)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- (char)((ushort *)iVar2)[0x0]
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
|
- *(char *)iVar2
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
|
- *(byte *)((byte *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
|
- ((byte *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
|
- *(undefined1 *)((byte *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
|
- ((undefined1 *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_high = (byte)E;
|
- ((char *)iVar2)[0x1] = E;
+ ((uw_object_hdr_t *)iVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x1)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_high
|
- *(char *)((byte *)iVar2 + 0x1)
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_high
|
- ((char *)iVar2)[0x1]
+ (char)((uw_object_hdr_t *)iVar2)->type_flags_high
)
...>
}


@receiver_7_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x2) = (char)V;
- *(char *)((char *)iVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x2) = (char)V;
- *(byte *)((char *)iVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x2) = (byte)V;
- *(char *)((char *)iVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x2) = (byte)V;
- *(byte *)((char *)iVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_14_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(ushort *)((byte *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- ((ushort *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- *(ushort *)((ushort *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}


@receiver_7_w_2_14_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_signed
|
- *(short *)((byte *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_signed
|
- ((short *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word_signed
|
- *(short *)((short *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word_signed
)
...>
}


@receiver_7_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- *(byte *)((byte *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- ((byte *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- *(byte *)((ushort *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- (byte)((ushort *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_7_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- *(undefined1 *)((byte *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- ((undefined1 *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- *(undefined1 *)((ushort *)iVar2 + 0x1)
+ ((uw_object_hdr_t *)iVar2)->position_word_low
|
- (undefined1)((ushort *)iVar2)[0x1]
+ ((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_7_w_2_14_store_2@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
|
- ((char *)iVar2)[0x2] = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_7_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x2)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
|
- *(char *)((byte *)iVar2 + 0x2)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
|
- ((char *)iVar2)[0x2]
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
|
- *(char *)((ushort *)iVar2 + 0x1)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
|
- (char)((ushort *)iVar2)[0x1]
+ (char)((uw_object_hdr_t *)iVar2)->position_word_low
)
...>
}


@receiver_7_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->position_word_high
|
- *(byte *)((byte *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->position_word_high
|
- ((byte *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_7_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->position_word_high
|
- *(undefined1 *)((byte *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->position_word_high
|
- ((undefined1 *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_7_w_2_14_store_3@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_high = (byte)E;
|
- ((char *)iVar2)[0x3] = E;
+ ((uw_object_hdr_t *)iVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_7_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x3)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_high
|
- *(char *)((byte *)iVar2 + 0x3)
+ (char)((uw_object_hdr_t *)iVar2)->position_word_high
|
- ((char *)iVar2)[0x3]
+ (char)((uw_object_hdr_t *)iVar2)->position_word_high
)
...>
}


@receiver_7_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x4) = (char)V;
- *(char *)((char *)iVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x4) = (char)V;
- *(byte *)((char *)iVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x4) = (byte)V;
- *(char *)((char *)iVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x4) = (byte)V;
- *(byte *)((char *)iVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_28_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(ushort *)((byte *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- ((ushort *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- *(ushort *)((ushort *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}


@receiver_7_w_4_28_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_signed
|
- *(short *)((byte *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_signed
|
- ((short *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word_signed
|
- *(short *)((short *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word_signed
)
...>
}


@receiver_7_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- *(byte *)((byte *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- ((byte *)iVar2)[0x4]
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- *(byte *)((ushort *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- (byte)((ushort *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_7_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- *(undefined1 *)((byte *)iVar2 + 0x4)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- ((undefined1 *)iVar2)[0x4]
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar2 + 0x2)
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
|
- (undefined1)((ushort *)iVar2)[0x2]
+ ((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_7_w_4_28_store_4@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
|
- ((char *)iVar2)[0x4] = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_7_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x4)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
|
- *(char *)((byte *)iVar2 + 0x4)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
|
- ((char *)iVar2)[0x4]
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
|
- *(char *)((ushort *)iVar2 + 0x2)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
|
- (char)((ushort *)iVar2)[0x2]
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_low
)
...>
}


@receiver_7_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x5)
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
|
- *(byte *)((byte *)iVar2 + 0x5)
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
|
- ((byte *)iVar2)[0x5]
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_7_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x5)
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
|
- *(undefined1 *)((byte *)iVar2 + 0x5)
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
|
- ((undefined1 *)iVar2)[0x5]
+ ((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_7_w_4_28_store_5@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_high = (byte)E;
|
- ((char *)iVar2)[0x5] = E;
+ ((uw_object_hdr_t *)iVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_7_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x5)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_high
|
- *(char *)((byte *)iVar2 + 0x5)
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_high
|
- ((char *)iVar2)[0x5]
+ (char)((uw_object_hdr_t *)iVar2)->chain_word_high
)
...>
}


@receiver_7_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x6) = (char)V;
- *(char *)((char *)iVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar2 + 0x6) = (char)V;
- *(byte *)((char *)iVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x6) = (byte)V;
- *(char *)((char *)iVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar2 + 0x6) = (byte)V;
- *(byte *)((char *)iVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar2)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_42_word_ushort@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(ushort *)((byte *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- ((ushort *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- *(ushort *)((ushort *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}


@receiver_7_w_6_42_word_short@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_signed
|
- *(short *)((byte *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_signed
|
- ((short *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word_signed
|
- *(short *)((short *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word_signed
)
...>
}


@receiver_7_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- *(byte *)((byte *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- ((byte *)iVar2)[0x6]
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- *(byte *)((ushort *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- (byte)((ushort *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_7_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- *(undefined1 *)((byte *)iVar2 + 0x6)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- ((undefined1 *)iVar2)[0x6]
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- *(undefined1 *)((ushort *)iVar2 + 0x3)
+ ((uw_object_hdr_t *)iVar2)->link_word_low
|
- (undefined1)((ushort *)iVar2)[0x3]
+ ((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_7_w_6_42_store_6@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
|
- ((char *)iVar2)[0x6] = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_7_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x6)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
|
- *(char *)((byte *)iVar2 + 0x6)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
|
- ((char *)iVar2)[0x6]
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
|
- *(char *)((ushort *)iVar2 + 0x3)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
|
- (char)((ushort *)iVar2)[0x3]
+ (char)((uw_object_hdr_t *)iVar2)->link_word_low
)
...>
}


@receiver_7_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0x7)
+ ((uw_object_hdr_t *)iVar2)->link_word_high
|
- *(byte *)((byte *)iVar2 + 0x7)
+ ((uw_object_hdr_t *)iVar2)->link_word_high
|
- ((byte *)iVar2)[0x7]
+ ((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_7_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0x7)
+ ((uw_object_hdr_t *)iVar2)->link_word_high
|
- *(undefined1 *)((byte *)iVar2 + 0x7)
+ ((uw_object_hdr_t *)iVar2)->link_word_high
|
- ((undefined1 *)iVar2)[0x7]
+ ((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_7_w_6_42_store_7@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_high = (byte)E;
|
- ((char *)iVar2)[0x7] = E;
+ ((uw_object_hdr_t *)iVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_7_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0x7)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_high
|
- *(char *)((byte *)iVar2 + 0x7)
+ (char)((uw_object_hdr_t *)iVar2)->link_word_high
|
- ((char *)iVar2)[0x7]
+ (char)((uw_object_hdr_t *)iVar2)->link_word_high
)
...>
}


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x0) = (char)V;
- *(char *)((char *)puTarget + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x0) = (char)V;
- *(byte *)((char *)puTarget + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x0) = (byte)V;
- *(char *)((char *)puTarget + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x0) = (byte)V;
- *(byte *)((char *)puTarget + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- *(ushort *)((byte *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- ((ushort *)puTarget)[0x0]
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- *(ushort *)((ushort *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags
)
...>
}


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_signed
|
- *(short *)((byte *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_signed
|
- ((short *)puTarget)[0x0]
+ ((uw_object_hdr_t *)puTarget)->type_flags_signed
|
- *(short *)((short *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_signed
)
...>
}


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(byte *)((byte *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- ((byte *)puTarget)[0x0]
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(byte *)((ushort *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- (byte)((ushort *)puTarget)[0x0]
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(byte *)puTarget
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(undefined1 *)((byte *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- ((undefined1 *)puTarget)[0x0]
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(undefined1 *)((ushort *)puTarget + 0x0)
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- (undefined1)((ushort *)puTarget)[0x0]
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(undefined1 *)puTarget
+ ((uw_object_hdr_t *)puTarget)->type_flags_low
)
...>
}


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x0) = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puTarget + 0x0) = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_low = (byte)E;
|
- ((char *)puTarget)[0x0] = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puTarget + 0x0) = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_low = (byte)E;
|
- *(char *)puTarget = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_low = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x0)
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(char *)((byte *)puTarget + 0x0)
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_low
|
- ((char *)puTarget)[0x0]
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(char *)((ushort *)puTarget + 0x0)
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_low
|
- (char)((ushort *)puTarget)[0x0]
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_low
|
- *(char *)puTarget
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->type_flags_high
|
- *(byte *)((byte *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->type_flags_high
|
- ((byte *)puTarget)[0x1]
+ ((uw_object_hdr_t *)puTarget)->type_flags_high
)
...>
}


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->type_flags_high
|
- *(undefined1 *)((byte *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->type_flags_high
|
- ((undefined1 *)puTarget)[0x1]
+ ((uw_object_hdr_t *)puTarget)->type_flags_high
)
...>
}


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x1) = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puTarget + 0x1) = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_high = (byte)E;
|
- ((char *)puTarget)[0x1] = E;
+ ((uw_object_hdr_t *)puTarget)->type_flags_high = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x1)
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_high
|
- *(char *)((byte *)puTarget + 0x1)
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_high
|
- ((char *)puTarget)[0x1]
+ (char)((uw_object_hdr_t *)puTarget)->type_flags_high
)
...>
}


@receiver_8_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x2) = (char)V;
- *(char *)((char *)puTarget + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x2) = (char)V;
- *(byte *)((char *)puTarget + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x2) = (byte)V;
- *(char *)((char *)puTarget + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x2) = (byte)V;
- *(byte *)((char *)puTarget + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_14_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word
|
- *(ushort *)((byte *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word
|
- ((ushort *)puTarget)[0x1]
+ ((uw_object_hdr_t *)puTarget)->position_word
|
- *(ushort *)((ushort *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->position_word
)
...>
}


@receiver_8_w_2_14_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word_signed
|
- *(short *)((byte *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word_signed
|
- ((short *)puTarget)[0x1]
+ ((uw_object_hdr_t *)puTarget)->position_word_signed
|
- *(short *)((short *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->position_word_signed
)
...>
}


@receiver_8_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- *(byte *)((byte *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- ((byte *)puTarget)[0x2]
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- *(byte *)((ushort *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- (byte)((ushort *)puTarget)[0x1]
+ ((uw_object_hdr_t *)puTarget)->position_word_low
)
...>
}


@receiver_8_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- *(undefined1 *)((byte *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- ((undefined1 *)puTarget)[0x2]
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- *(undefined1 *)((ushort *)puTarget + 0x1)
+ ((uw_object_hdr_t *)puTarget)->position_word_low
|
- (undefined1)((ushort *)puTarget)[0x1]
+ ((uw_object_hdr_t *)puTarget)->position_word_low
)
...>
}


@receiver_8_w_2_14_store_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x2) = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_low = (byte)E;
|
- *(char *)((byte *)puTarget + 0x2) = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_low = (byte)E;
|
- ((char *)puTarget)[0x2] = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puTarget + 0x1) = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_low = (byte)E;
)
...>
}


@receiver_8_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x2)
+ (char)((uw_object_hdr_t *)puTarget)->position_word_low
|
- *(char *)((byte *)puTarget + 0x2)
+ (char)((uw_object_hdr_t *)puTarget)->position_word_low
|
- ((char *)puTarget)[0x2]
+ (char)((uw_object_hdr_t *)puTarget)->position_word_low
|
- *(char *)((ushort *)puTarget + 0x1)
+ (char)((uw_object_hdr_t *)puTarget)->position_word_low
|
- (char)((ushort *)puTarget)[0x1]
+ (char)((uw_object_hdr_t *)puTarget)->position_word_low
)
...>
}


@receiver_8_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->position_word_high
|
- *(byte *)((byte *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->position_word_high
|
- ((byte *)puTarget)[0x3]
+ ((uw_object_hdr_t *)puTarget)->position_word_high
)
...>
}


@receiver_8_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->position_word_high
|
- *(undefined1 *)((byte *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->position_word_high
|
- ((undefined1 *)puTarget)[0x3]
+ ((uw_object_hdr_t *)puTarget)->position_word_high
)
...>
}


@receiver_8_w_2_14_store_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x3) = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_high = (byte)E;
|
- *(char *)((byte *)puTarget + 0x3) = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_high = (byte)E;
|
- ((char *)puTarget)[0x3] = E;
+ ((uw_object_hdr_t *)puTarget)->position_word_high = (byte)E;
)
...>
}


@receiver_8_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x3)
+ (char)((uw_object_hdr_t *)puTarget)->position_word_high
|
- *(char *)((byte *)puTarget + 0x3)
+ (char)((uw_object_hdr_t *)puTarget)->position_word_high
|
- ((char *)puTarget)[0x3]
+ (char)((uw_object_hdr_t *)puTarget)->position_word_high
)
...>
}


@receiver_8_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x4) = (char)V;
- *(char *)((char *)puTarget + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x4) = (char)V;
- *(byte *)((char *)puTarget + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x4) = (byte)V;
- *(char *)((char *)puTarget + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x4) = (byte)V;
- *(byte *)((char *)puTarget + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_28_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word
|
- *(ushort *)((byte *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word
|
- ((ushort *)puTarget)[0x2]
+ ((uw_object_hdr_t *)puTarget)->chain_word
|
- *(ushort *)((ushort *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->chain_word
)
...>
}


@receiver_8_w_4_28_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word_signed
|
- *(short *)((byte *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word_signed
|
- ((short *)puTarget)[0x2]
+ ((uw_object_hdr_t *)puTarget)->chain_word_signed
|
- *(short *)((short *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->chain_word_signed
)
...>
}


@receiver_8_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- *(byte *)((byte *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- ((byte *)puTarget)[0x4]
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- *(byte *)((ushort *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- (byte)((ushort *)puTarget)[0x2]
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
)
...>
}


@receiver_8_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- *(undefined1 *)((byte *)puTarget + 0x4)
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- ((undefined1 *)puTarget)[0x4]
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- *(undefined1 *)((ushort *)puTarget + 0x2)
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
|
- (undefined1)((ushort *)puTarget)[0x2]
+ ((uw_object_hdr_t *)puTarget)->chain_word_low
)
...>
}


@receiver_8_w_4_28_store_4@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x4) = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puTarget + 0x4) = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_low = (byte)E;
|
- ((char *)puTarget)[0x4] = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puTarget + 0x2) = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_low = (byte)E;
)
...>
}


@receiver_8_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x4)
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_low
|
- *(char *)((byte *)puTarget + 0x4)
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_low
|
- ((char *)puTarget)[0x4]
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_low
|
- *(char *)((ushort *)puTarget + 0x2)
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_low
|
- (char)((ushort *)puTarget)[0x2]
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_low
)
...>
}


@receiver_8_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x5)
+ ((uw_object_hdr_t *)puTarget)->chain_word_high
|
- *(byte *)((byte *)puTarget + 0x5)
+ ((uw_object_hdr_t *)puTarget)->chain_word_high
|
- ((byte *)puTarget)[0x5]
+ ((uw_object_hdr_t *)puTarget)->chain_word_high
)
...>
}


@receiver_8_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x5)
+ ((uw_object_hdr_t *)puTarget)->chain_word_high
|
- *(undefined1 *)((byte *)puTarget + 0x5)
+ ((uw_object_hdr_t *)puTarget)->chain_word_high
|
- ((undefined1 *)puTarget)[0x5]
+ ((uw_object_hdr_t *)puTarget)->chain_word_high
)
...>
}


@receiver_8_w_4_28_store_5@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x5) = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puTarget + 0x5) = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_high = (byte)E;
|
- ((char *)puTarget)[0x5] = E;
+ ((uw_object_hdr_t *)puTarget)->chain_word_high = (byte)E;
)
...>
}


@receiver_8_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x5)
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_high
|
- *(char *)((byte *)puTarget + 0x5)
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_high
|
- ((char *)puTarget)[0x5]
+ (char)((uw_object_hdr_t *)puTarget)->chain_word_high
)
...>
}


@receiver_8_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x6) = (char)V;
- *(char *)((char *)puTarget + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puTarget + 0x6) = (char)V;
- *(byte *)((char *)puTarget + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x6) = (byte)V;
- *(char *)((char *)puTarget + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puTarget + 0x6) = (byte)V;
- *(byte *)((char *)puTarget + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puTarget)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_42_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word
|
- *(ushort *)((byte *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word
|
- ((ushort *)puTarget)[0x3]
+ ((uw_object_hdr_t *)puTarget)->link_word
|
- *(ushort *)((ushort *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->link_word
)
...>
}


@receiver_8_w_6_42_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word_signed
|
- *(short *)((byte *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word_signed
|
- ((short *)puTarget)[0x3]
+ ((uw_object_hdr_t *)puTarget)->link_word_signed
|
- *(short *)((short *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->link_word_signed
)
...>
}


@receiver_8_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- *(byte *)((byte *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- ((byte *)puTarget)[0x6]
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- *(byte *)((ushort *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- (byte)((ushort *)puTarget)[0x3]
+ ((uw_object_hdr_t *)puTarget)->link_word_low
)
...>
}


@receiver_8_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- *(undefined1 *)((byte *)puTarget + 0x6)
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- ((undefined1 *)puTarget)[0x6]
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- *(undefined1 *)((ushort *)puTarget + 0x3)
+ ((uw_object_hdr_t *)puTarget)->link_word_low
|
- (undefined1)((ushort *)puTarget)[0x3]
+ ((uw_object_hdr_t *)puTarget)->link_word_low
)
...>
}


@receiver_8_w_6_42_store_6@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x6) = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_low = (byte)E;
|
- *(char *)((byte *)puTarget + 0x6) = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_low = (byte)E;
|
- ((char *)puTarget)[0x6] = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puTarget + 0x3) = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_low = (byte)E;
)
...>
}


@receiver_8_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x6)
+ (char)((uw_object_hdr_t *)puTarget)->link_word_low
|
- *(char *)((byte *)puTarget + 0x6)
+ (char)((uw_object_hdr_t *)puTarget)->link_word_low
|
- ((char *)puTarget)[0x6]
+ (char)((uw_object_hdr_t *)puTarget)->link_word_low
|
- *(char *)((ushort *)puTarget + 0x3)
+ (char)((uw_object_hdr_t *)puTarget)->link_word_low
|
- (char)((ushort *)puTarget)[0x3]
+ (char)((uw_object_hdr_t *)puTarget)->link_word_low
)
...>
}


@receiver_8_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puTarget + 0x7)
+ ((uw_object_hdr_t *)puTarget)->link_word_high
|
- *(byte *)((byte *)puTarget + 0x7)
+ ((uw_object_hdr_t *)puTarget)->link_word_high
|
- ((byte *)puTarget)[0x7]
+ ((uw_object_hdr_t *)puTarget)->link_word_high
)
...>
}


@receiver_8_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puTarget + 0x7)
+ ((uw_object_hdr_t *)puTarget)->link_word_high
|
- *(undefined1 *)((byte *)puTarget + 0x7)
+ ((uw_object_hdr_t *)puTarget)->link_word_high
|
- ((undefined1 *)puTarget)[0x7]
+ ((uw_object_hdr_t *)puTarget)->link_word_high
)
...>
}


@receiver_8_w_6_42_store_7@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x7) = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_high = (byte)E;
|
- *(char *)((byte *)puTarget + 0x7) = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_high = (byte)E;
|
- ((char *)puTarget)[0x7] = E;
+ ((uw_object_hdr_t *)puTarget)->link_word_high = (byte)E;
)
...>
}


@receiver_8_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puTarget + 0x7)
+ (char)((uw_object_hdr_t *)puTarget)->link_word_high
|
- *(char *)((byte *)puTarget + 0x7)
+ (char)((uw_object_hdr_t *)puTarget)->link_word_high
|
- ((char *)puTarget)[0x7]
+ (char)((uw_object_hdr_t *)puTarget)->link_word_high
)
...>
}


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x0) = (char)V;
- *(char *)((char *)puAttacker + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x0) = (char)V;
- *(byte *)((char *)puAttacker + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x0) = (byte)V;
- *(char *)((char *)puAttacker + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x0) = (byte)V;
- *(byte *)((char *)puAttacker + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- *(ushort *)((byte *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- ((ushort *)puAttacker)[0x0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- *(ushort *)((ushort *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_signed
|
- *(short *)((byte *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_signed
|
- ((short *)puAttacker)[0x0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_signed
|
- *(short *)((short *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_signed
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(byte *)((byte *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- ((byte *)puAttacker)[0x0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(byte *)((ushort *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- (byte)((ushort *)puAttacker)[0x0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(byte *)puAttacker
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(undefined1 *)((byte *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- ((undefined1 *)puAttacker)[0x0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(undefined1 *)((ushort *)puAttacker + 0x0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- (undefined1)((ushort *)puAttacker)[0x0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(undefined1 *)puAttacker
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x0) = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x0) = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low = (byte)E;
|
- ((char *)puAttacker)[0x0] = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puAttacker + 0x0) = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low = (byte)E;
|
- *(char *)puAttacker = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_low = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x0)
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(char *)((byte *)puAttacker + 0x0)
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- ((char *)puAttacker)[0x0]
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(char *)((ushort *)puAttacker + 0x0)
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- (char)((ushort *)puAttacker)[0x0]
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_low
|
- *(char *)puAttacker
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high
|
- *(byte *)((byte *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high
|
- ((byte *)puAttacker)[0x1]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high
)
...>
}


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high
|
- *(undefined1 *)((byte *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high
|
- ((undefined1 *)puAttacker)[0x1]
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high
)
...>
}


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x1) = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x1) = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high = (byte)E;
|
- ((char *)puAttacker)[0x1] = E;
+ ((uw_object_hdr_t *)puAttacker)->type_flags_high = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x1)
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_high
|
- *(char *)((byte *)puAttacker + 0x1)
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_high
|
- ((char *)puAttacker)[0x1]
+ (char)((uw_object_hdr_t *)puAttacker)->type_flags_high
)
...>
}


@receiver_9_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x2) = (char)V;
- *(char *)((char *)puAttacker + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x2) = (char)V;
- *(byte *)((char *)puAttacker + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x2) = (byte)V;
- *(char *)((char *)puAttacker + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x2) = (byte)V;
- *(byte *)((char *)puAttacker + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_14_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word
|
- *(ushort *)((byte *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word
|
- ((ushort *)puAttacker)[0x1]
+ ((uw_object_hdr_t *)puAttacker)->position_word
|
- *(ushort *)((ushort *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->position_word
)
...>
}


@receiver_9_w_2_14_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word_signed
|
- *(short *)((byte *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word_signed
|
- ((short *)puAttacker)[0x1]
+ ((uw_object_hdr_t *)puAttacker)->position_word_signed
|
- *(short *)((short *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->position_word_signed
)
...>
}


@receiver_9_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- *(byte *)((byte *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- ((byte *)puAttacker)[0x2]
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- *(byte *)((ushort *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- (byte)((ushort *)puAttacker)[0x1]
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
)
...>
}


@receiver_9_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- *(undefined1 *)((byte *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- ((undefined1 *)puAttacker)[0x2]
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- *(undefined1 *)((ushort *)puAttacker + 0x1)
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
|
- (undefined1)((ushort *)puAttacker)[0x1]
+ ((uw_object_hdr_t *)puAttacker)->position_word_low
)
...>
}


@receiver_9_w_2_14_store_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x2) = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_low = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x2) = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_low = (byte)E;
|
- ((char *)puAttacker)[0x2] = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puAttacker + 0x1) = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_low = (byte)E;
)
...>
}


@receiver_9_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x2)
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_low
|
- *(char *)((byte *)puAttacker + 0x2)
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_low
|
- ((char *)puAttacker)[0x2]
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_low
|
- *(char *)((ushort *)puAttacker + 0x1)
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_low
|
- (char)((ushort *)puAttacker)[0x1]
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_low
)
...>
}


@receiver_9_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->position_word_high
|
- *(byte *)((byte *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->position_word_high
|
- ((byte *)puAttacker)[0x3]
+ ((uw_object_hdr_t *)puAttacker)->position_word_high
)
...>
}


@receiver_9_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->position_word_high
|
- *(undefined1 *)((byte *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->position_word_high
|
- ((undefined1 *)puAttacker)[0x3]
+ ((uw_object_hdr_t *)puAttacker)->position_word_high
)
...>
}


@receiver_9_w_2_14_store_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x3) = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_high = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x3) = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_high = (byte)E;
|
- ((char *)puAttacker)[0x3] = E;
+ ((uw_object_hdr_t *)puAttacker)->position_word_high = (byte)E;
)
...>
}


@receiver_9_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x3)
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_high
|
- *(char *)((byte *)puAttacker + 0x3)
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_high
|
- ((char *)puAttacker)[0x3]
+ (char)((uw_object_hdr_t *)puAttacker)->position_word_high
)
...>
}


@receiver_9_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x4) = (char)V;
- *(char *)((char *)puAttacker + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x4) = (char)V;
- *(byte *)((char *)puAttacker + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x4) = (byte)V;
- *(char *)((char *)puAttacker + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x4) = (byte)V;
- *(byte *)((char *)puAttacker + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_28_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word
|
- *(ushort *)((byte *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word
|
- ((ushort *)puAttacker)[0x2]
+ ((uw_object_hdr_t *)puAttacker)->chain_word
|
- *(ushort *)((ushort *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->chain_word
)
...>
}


@receiver_9_w_4_28_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_signed
|
- *(short *)((byte *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_signed
|
- ((short *)puAttacker)[0x2]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_signed
|
- *(short *)((short *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_signed
)
...>
}


@receiver_9_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- *(byte *)((byte *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- ((byte *)puAttacker)[0x4]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- *(byte *)((ushort *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- (byte)((ushort *)puAttacker)[0x2]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
)
...>
}


@receiver_9_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- *(undefined1 *)((byte *)puAttacker + 0x4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- ((undefined1 *)puAttacker)[0x4]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- *(undefined1 *)((ushort *)puAttacker + 0x2)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- (undefined1)((ushort *)puAttacker)[0x2]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low
)
...>
}


@receiver_9_w_4_28_store_4@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x4) = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x4) = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low = (byte)E;
|
- ((char *)puAttacker)[0x4] = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puAttacker + 0x2) = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_low = (byte)E;
)
...>
}


@receiver_9_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x4)
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- *(char *)((byte *)puAttacker + 0x4)
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- ((char *)puAttacker)[0x4]
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- *(char *)((ushort *)puAttacker + 0x2)
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_low
|
- (char)((ushort *)puAttacker)[0x2]
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_low
)
...>
}


@receiver_9_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x5)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high
|
- *(byte *)((byte *)puAttacker + 0x5)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high
|
- ((byte *)puAttacker)[0x5]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high
)
...>
}


@receiver_9_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x5)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high
|
- *(undefined1 *)((byte *)puAttacker + 0x5)
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high
|
- ((undefined1 *)puAttacker)[0x5]
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high
)
...>
}


@receiver_9_w_4_28_store_5@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x5) = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x5) = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high = (byte)E;
|
- ((char *)puAttacker)[0x5] = E;
+ ((uw_object_hdr_t *)puAttacker)->chain_word_high = (byte)E;
)
...>
}


@receiver_9_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x5)
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_high
|
- *(char *)((byte *)puAttacker + 0x5)
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_high
|
- ((char *)puAttacker)[0x5]
+ (char)((uw_object_hdr_t *)puAttacker)->chain_word_high
)
...>
}


@receiver_9_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x6) = (char)V;
- *(char *)((char *)puAttacker + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puAttacker + 0x6) = (char)V;
- *(byte *)((char *)puAttacker + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x6) = (byte)V;
- *(char *)((char *)puAttacker + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puAttacker + 0x6) = (byte)V;
- *(byte *)((char *)puAttacker + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puAttacker)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_42_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word
|
- *(ushort *)((byte *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word
|
- ((ushort *)puAttacker)[0x3]
+ ((uw_object_hdr_t *)puAttacker)->link_word
|
- *(ushort *)((ushort *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->link_word
)
...>
}


@receiver_9_w_6_42_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word_signed
|
- *(short *)((byte *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word_signed
|
- ((short *)puAttacker)[0x3]
+ ((uw_object_hdr_t *)puAttacker)->link_word_signed
|
- *(short *)((short *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->link_word_signed
)
...>
}


@receiver_9_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- *(byte *)((byte *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- ((byte *)puAttacker)[0x6]
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- *(byte *)((ushort *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- (byte)((ushort *)puAttacker)[0x3]
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
)
...>
}


@receiver_9_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- *(undefined1 *)((byte *)puAttacker + 0x6)
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- ((undefined1 *)puAttacker)[0x6]
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- *(undefined1 *)((ushort *)puAttacker + 0x3)
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
|
- (undefined1)((ushort *)puAttacker)[0x3]
+ ((uw_object_hdr_t *)puAttacker)->link_word_low
)
...>
}


@receiver_9_w_6_42_store_6@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x6) = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_low = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x6) = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_low = (byte)E;
|
- ((char *)puAttacker)[0x6] = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puAttacker + 0x3) = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_low = (byte)E;
)
...>
}


@receiver_9_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x6)
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_low
|
- *(char *)((byte *)puAttacker + 0x6)
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_low
|
- ((char *)puAttacker)[0x6]
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_low
|
- *(char *)((ushort *)puAttacker + 0x3)
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_low
|
- (char)((ushort *)puAttacker)[0x3]
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_low
)
...>
}


@receiver_9_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puAttacker + 0x7)
+ ((uw_object_hdr_t *)puAttacker)->link_word_high
|
- *(byte *)((byte *)puAttacker + 0x7)
+ ((uw_object_hdr_t *)puAttacker)->link_word_high
|
- ((byte *)puAttacker)[0x7]
+ ((uw_object_hdr_t *)puAttacker)->link_word_high
)
...>
}


@receiver_9_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puAttacker + 0x7)
+ ((uw_object_hdr_t *)puAttacker)->link_word_high
|
- *(undefined1 *)((byte *)puAttacker + 0x7)
+ ((uw_object_hdr_t *)puAttacker)->link_word_high
|
- ((undefined1 *)puAttacker)[0x7]
+ ((uw_object_hdr_t *)puAttacker)->link_word_high
)
...>
}


@receiver_9_w_6_42_store_7@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x7) = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_high = (byte)E;
|
- *(char *)((byte *)puAttacker + 0x7) = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_high = (byte)E;
|
- ((char *)puAttacker)[0x7] = E;
+ ((uw_object_hdr_t *)puAttacker)->link_word_high = (byte)E;
)
...>
}


@receiver_9_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puAttacker + 0x7)
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_high
|
- *(char *)((byte *)puAttacker + 0x7)
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_high
|
- ((char *)puAttacker)[0x7]
+ (char)((uw_object_hdr_t *)puAttacker)->link_word_high
)
...>
}


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x0) = (char)V;
- *(char *)((char *)uVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x0) = (char)V;
- *(byte *)((char *)uVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x0) = (byte)V;
- *(char *)((char *)uVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x0) = (byte)V;
- *(byte *)((char *)uVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- *(ushort *)((byte *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- ((ushort *)uVar5)[0x0]
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- *(ushort *)((ushort *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_signed
|
- *(short *)((byte *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_signed
|
- ((short *)uVar5)[0x0]
+ ((uw_object_hdr_t *)uVar5)->type_flags_signed
|
- *(short *)((short *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(byte *)((byte *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- ((byte *)uVar5)[0x0]
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(byte *)((ushort *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- (byte)((ushort *)uVar5)[0x0]
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(byte *)uVar5
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(undefined1 *)((byte *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- ((undefined1 *)uVar5)[0x0]
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(undefined1 *)((ushort *)uVar5 + 0x0)
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- (undefined1)((ushort *)uVar5)[0x0]
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(undefined1 *)uVar5
+ ((uw_object_hdr_t *)uVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_low = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_low = (byte)E;
|
- ((char *)uVar5)[0x0] = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)uVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_low = (byte)E;
|
- *(char *)uVar5 = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x0)
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(char *)((byte *)uVar5 + 0x0)
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_low
|
- ((char *)uVar5)[0x0]
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(char *)((ushort *)uVar5 + 0x0)
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_low
|
- (char)((ushort *)uVar5)[0x0]
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_low
|
- *(char *)uVar5
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->type_flags_high
|
- *(byte *)((byte *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->type_flags_high
|
- ((byte *)uVar5)[0x1]
+ ((uw_object_hdr_t *)uVar5)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->type_flags_high
|
- *(undefined1 *)((byte *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->type_flags_high
|
- ((undefined1 *)uVar5)[0x1]
+ ((uw_object_hdr_t *)uVar5)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_high = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_high = (byte)E;
|
- ((char *)uVar5)[0x1] = E;
+ ((uw_object_hdr_t *)uVar5)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x1)
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_high
|
- *(char *)((byte *)uVar5 + 0x1)
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_high
|
- ((char *)uVar5)[0x1]
+ (char)((uw_object_hdr_t *)uVar5)->type_flags_high
)
...>
}


@receiver_10_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x2) = (char)V;
- *(char *)((char *)uVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x2) = (char)V;
- *(byte *)((char *)uVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x2) = (byte)V;
- *(char *)((char *)uVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x2) = (byte)V;
- *(byte *)((char *)uVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_14_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word
|
- *(ushort *)((byte *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word
|
- ((ushort *)uVar5)[0x1]
+ ((uw_object_hdr_t *)uVar5)->position_word
|
- *(ushort *)((ushort *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->position_word
)
...>
}


@receiver_10_w_2_14_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word_signed
|
- *(short *)((byte *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word_signed
|
- ((short *)uVar5)[0x1]
+ ((uw_object_hdr_t *)uVar5)->position_word_signed
|
- *(short *)((short *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->position_word_signed
)
...>
}


@receiver_10_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- *(byte *)((byte *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- ((byte *)uVar5)[0x2]
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- *(byte *)((ushort *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- (byte)((ushort *)uVar5)[0x1]
+ ((uw_object_hdr_t *)uVar5)->position_word_low
)
...>
}


@receiver_10_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- *(undefined1 *)((byte *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- ((undefined1 *)uVar5)[0x2]
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- *(undefined1 *)((ushort *)uVar5 + 0x1)
+ ((uw_object_hdr_t *)uVar5)->position_word_low
|
- (undefined1)((ushort *)uVar5)[0x1]
+ ((uw_object_hdr_t *)uVar5)->position_word_low
)
...>
}


@receiver_10_w_2_14_store_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_low = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_low = (byte)E;
|
- ((char *)uVar5)[0x2] = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_low = (byte)E;
|
- *(char *)((ushort *)uVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x2)
+ (char)((uw_object_hdr_t *)uVar5)->position_word_low
|
- *(char *)((byte *)uVar5 + 0x2)
+ (char)((uw_object_hdr_t *)uVar5)->position_word_low
|
- ((char *)uVar5)[0x2]
+ (char)((uw_object_hdr_t *)uVar5)->position_word_low
|
- *(char *)((ushort *)uVar5 + 0x1)
+ (char)((uw_object_hdr_t *)uVar5)->position_word_low
|
- (char)((ushort *)uVar5)[0x1]
+ (char)((uw_object_hdr_t *)uVar5)->position_word_low
)
...>
}


@receiver_10_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->position_word_high
|
- *(byte *)((byte *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->position_word_high
|
- ((byte *)uVar5)[0x3]
+ ((uw_object_hdr_t *)uVar5)->position_word_high
)
...>
}


@receiver_10_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->position_word_high
|
- *(undefined1 *)((byte *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->position_word_high
|
- ((undefined1 *)uVar5)[0x3]
+ ((uw_object_hdr_t *)uVar5)->position_word_high
)
...>
}


@receiver_10_w_2_14_store_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_high = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_high = (byte)E;
|
- ((char *)uVar5)[0x3] = E;
+ ((uw_object_hdr_t *)uVar5)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x3)
+ (char)((uw_object_hdr_t *)uVar5)->position_word_high
|
- *(char *)((byte *)uVar5 + 0x3)
+ (char)((uw_object_hdr_t *)uVar5)->position_word_high
|
- ((char *)uVar5)[0x3]
+ (char)((uw_object_hdr_t *)uVar5)->position_word_high
)
...>
}


@receiver_10_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x4) = (char)V;
- *(char *)((char *)uVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x4) = (char)V;
- *(byte *)((char *)uVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x4) = (byte)V;
- *(char *)((char *)uVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x4) = (byte)V;
- *(byte *)((char *)uVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_28_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word
|
- *(ushort *)((byte *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word
|
- ((ushort *)uVar5)[0x2]
+ ((uw_object_hdr_t *)uVar5)->chain_word
|
- *(ushort *)((ushort *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->chain_word
)
...>
}


@receiver_10_w_4_28_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word_signed
|
- *(short *)((byte *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word_signed
|
- ((short *)uVar5)[0x2]
+ ((uw_object_hdr_t *)uVar5)->chain_word_signed
|
- *(short *)((short *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->chain_word_signed
)
...>
}


@receiver_10_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- *(byte *)((byte *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- ((byte *)uVar5)[0x4]
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- *(byte *)((ushort *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- (byte)((ushort *)uVar5)[0x2]
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- *(undefined1 *)((byte *)uVar5 + 0x4)
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- ((undefined1 *)uVar5)[0x4]
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- *(undefined1 *)((ushort *)uVar5 + 0x2)
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
|
- (undefined1)((ushort *)uVar5)[0x2]
+ ((uw_object_hdr_t *)uVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_28_store_4@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_low = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_low = (byte)E;
|
- ((char *)uVar5)[0x4] = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)uVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x4)
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_low
|
- *(char *)((byte *)uVar5 + 0x4)
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_low
|
- ((char *)uVar5)[0x4]
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_low
|
- *(char *)((ushort *)uVar5 + 0x2)
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_low
|
- (char)((ushort *)uVar5)[0x2]
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_low
)
...>
}


@receiver_10_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x5)
+ ((uw_object_hdr_t *)uVar5)->chain_word_high
|
- *(byte *)((byte *)uVar5 + 0x5)
+ ((uw_object_hdr_t *)uVar5)->chain_word_high
|
- ((byte *)uVar5)[0x5]
+ ((uw_object_hdr_t *)uVar5)->chain_word_high
)
...>
}


@receiver_10_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x5)
+ ((uw_object_hdr_t *)uVar5)->chain_word_high
|
- *(undefined1 *)((byte *)uVar5 + 0x5)
+ ((uw_object_hdr_t *)uVar5)->chain_word_high
|
- ((undefined1 *)uVar5)[0x5]
+ ((uw_object_hdr_t *)uVar5)->chain_word_high
)
...>
}


@receiver_10_w_4_28_store_5@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_high = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_high = (byte)E;
|
- ((char *)uVar5)[0x5] = E;
+ ((uw_object_hdr_t *)uVar5)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x5)
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_high
|
- *(char *)((byte *)uVar5 + 0x5)
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_high
|
- ((char *)uVar5)[0x5]
+ (char)((uw_object_hdr_t *)uVar5)->chain_word_high
)
...>
}


@receiver_10_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x6) = (char)V;
- *(char *)((char *)uVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)uVar5 + 0x6) = (char)V;
- *(byte *)((char *)uVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x6) = (byte)V;
- *(char *)((char *)uVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)uVar5 + 0x6) = (byte)V;
- *(byte *)((char *)uVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)uVar5)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_42_word_ushort@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word
|
- *(ushort *)((byte *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word
|
- ((ushort *)uVar5)[0x3]
+ ((uw_object_hdr_t *)uVar5)->link_word
|
- *(ushort *)((ushort *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->link_word
)
...>
}


@receiver_10_w_6_42_word_short@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word_signed
|
- *(short *)((byte *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word_signed
|
- ((short *)uVar5)[0x3]
+ ((uw_object_hdr_t *)uVar5)->link_word_signed
|
- *(short *)((short *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->link_word_signed
)
...>
}


@receiver_10_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- *(byte *)((byte *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- ((byte *)uVar5)[0x6]
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- *(byte *)((ushort *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- (byte)((ushort *)uVar5)[0x3]
+ ((uw_object_hdr_t *)uVar5)->link_word_low
)
...>
}


@receiver_10_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- *(undefined1 *)((byte *)uVar5 + 0x6)
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- ((undefined1 *)uVar5)[0x6]
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- *(undefined1 *)((ushort *)uVar5 + 0x3)
+ ((uw_object_hdr_t *)uVar5)->link_word_low
|
- (undefined1)((ushort *)uVar5)[0x3]
+ ((uw_object_hdr_t *)uVar5)->link_word_low
)
...>
}


@receiver_10_w_6_42_store_6@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_low = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_low = (byte)E;
|
- ((char *)uVar5)[0x6] = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_low = (byte)E;
|
- *(char *)((ushort *)uVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x6)
+ (char)((uw_object_hdr_t *)uVar5)->link_word_low
|
- *(char *)((byte *)uVar5 + 0x6)
+ (char)((uw_object_hdr_t *)uVar5)->link_word_low
|
- ((char *)uVar5)[0x6]
+ (char)((uw_object_hdr_t *)uVar5)->link_word_low
|
- *(char *)((ushort *)uVar5 + 0x3)
+ (char)((uw_object_hdr_t *)uVar5)->link_word_low
|
- (char)((ushort *)uVar5)[0x3]
+ (char)((uw_object_hdr_t *)uVar5)->link_word_low
)
...>
}


@receiver_10_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)uVar5 + 0x7)
+ ((uw_object_hdr_t *)uVar5)->link_word_high
|
- *(byte *)((byte *)uVar5 + 0x7)
+ ((uw_object_hdr_t *)uVar5)->link_word_high
|
- ((byte *)uVar5)[0x7]
+ ((uw_object_hdr_t *)uVar5)->link_word_high
)
...>
}


@receiver_10_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)uVar5 + 0x7)
+ ((uw_object_hdr_t *)uVar5)->link_word_high
|
- *(undefined1 *)((byte *)uVar5 + 0x7)
+ ((uw_object_hdr_t *)uVar5)->link_word_high
|
- ((undefined1 *)uVar5)[0x7]
+ ((uw_object_hdr_t *)uVar5)->link_word_high
)
...>
}


@receiver_10_w_6_42_store_7@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_high = (byte)E;
|
- *(char *)((byte *)uVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_high = (byte)E;
|
- ((char *)uVar5)[0x7] = E;
+ ((uw_object_hdr_t *)uVar5)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)uVar5 + 0x7)
+ (char)((uw_object_hdr_t *)uVar5)->link_word_high
|
- *(char *)((byte *)uVar5 + 0x7)
+ (char)((uw_object_hdr_t *)uVar5)->link_word_high
|
- ((char *)uVar5)[0x7]
+ (char)((uw_object_hdr_t *)uVar5)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x0) = (char)V;
- *(char *)((char *)target + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x0) = (char)V;
- *(byte *)((char *)target + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x0) = (byte)V;
- *(char *)((char *)target + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x0) = (byte)V;
- *(byte *)((char *)target + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- *(ushort *)((byte *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- ((ushort *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags
|
- *(ushort *)((ushort *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags
)
...>
}


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_signed
|
- *(short *)((byte *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_signed
|
- ((short *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_signed
|
- *(short *)((short *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_signed
)
...>
}


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- *(byte *)((byte *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- ((byte *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- *(byte *)((ushort *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- (byte)((ushort *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- *(byte *)target
+ ((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- *(undefined1 *)((byte *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- ((undefined1 *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- *(undefined1 *)((ushort *)target + 0x0)
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- (undefined1)((ushort *)target)[0x0]
+ ((uw_object_hdr_t *)target)->type_flags_low
|
- *(undefined1 *)target
+ ((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x0) = E;
+ ((uw_object_hdr_t *)target)->type_flags_low = (byte)E;
|
- *(char *)((byte *)target + 0x0) = E;
+ ((uw_object_hdr_t *)target)->type_flags_low = (byte)E;
|
- ((char *)target)[0x0] = E;
+ ((uw_object_hdr_t *)target)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)target + 0x0) = E;
+ ((uw_object_hdr_t *)target)->type_flags_low = (byte)E;
|
- *(char *)target = E;
+ ((uw_object_hdr_t *)target)->type_flags_low = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x0)
+ (char)((uw_object_hdr_t *)target)->type_flags_low
|
- *(char *)((byte *)target + 0x0)
+ (char)((uw_object_hdr_t *)target)->type_flags_low
|
- ((char *)target)[0x0]
+ (char)((uw_object_hdr_t *)target)->type_flags_low
|
- *(char *)((ushort *)target + 0x0)
+ (char)((uw_object_hdr_t *)target)->type_flags_low
|
- (char)((ushort *)target)[0x0]
+ (char)((uw_object_hdr_t *)target)->type_flags_low
|
- *(char *)target
+ (char)((uw_object_hdr_t *)target)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x1)
+ ((uw_object_hdr_t *)target)->type_flags_high
|
- *(byte *)((byte *)target + 0x1)
+ ((uw_object_hdr_t *)target)->type_flags_high
|
- ((byte *)target)[0x1]
+ ((uw_object_hdr_t *)target)->type_flags_high
)
...>
}


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x1)
+ ((uw_object_hdr_t *)target)->type_flags_high
|
- *(undefined1 *)((byte *)target + 0x1)
+ ((uw_object_hdr_t *)target)->type_flags_high
|
- ((undefined1 *)target)[0x1]
+ ((uw_object_hdr_t *)target)->type_flags_high
)
...>
}


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x1) = E;
+ ((uw_object_hdr_t *)target)->type_flags_high = (byte)E;
|
- *(char *)((byte *)target + 0x1) = E;
+ ((uw_object_hdr_t *)target)->type_flags_high = (byte)E;
|
- ((char *)target)[0x1] = E;
+ ((uw_object_hdr_t *)target)->type_flags_high = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x1)
+ (char)((uw_object_hdr_t *)target)->type_flags_high
|
- *(char *)((byte *)target + 0x1)
+ (char)((uw_object_hdr_t *)target)->type_flags_high
|
- ((char *)target)[0x1]
+ (char)((uw_object_hdr_t *)target)->type_flags_high
)
...>
}


@receiver_11_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x2) = (char)V;
- *(char *)((char *)target + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x2) = (char)V;
- *(byte *)((char *)target + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x2) = (byte)V;
- *(char *)((char *)target + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x2) = (byte)V;
- *(byte *)((char *)target + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_14_word_ushort@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word
|
- *(ushort *)((byte *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word
|
- ((ushort *)target)[0x1]
+ ((uw_object_hdr_t *)target)->position_word
|
- *(ushort *)((ushort *)target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word
)
...>
}


@receiver_11_w_2_14_word_short@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word_signed
|
- *(short *)((byte *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word_signed
|
- ((short *)target)[0x1]
+ ((uw_object_hdr_t *)target)->position_word_signed
|
- *(short *)((short *)target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word_signed
)
...>
}


@receiver_11_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- *(byte *)((byte *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- ((byte *)target)[0x2]
+ ((uw_object_hdr_t *)target)->position_word_low
|
- *(byte *)((ushort *)target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- (byte)((ushort *)target)[0x1]
+ ((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_11_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- *(undefined1 *)((byte *)target + 0x2)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- ((undefined1 *)target)[0x2]
+ ((uw_object_hdr_t *)target)->position_word_low
|
- *(undefined1 *)((ushort *)target + 0x1)
+ ((uw_object_hdr_t *)target)->position_word_low
|
- (undefined1)((ushort *)target)[0x1]
+ ((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_11_w_2_14_store_2@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x2) = E;
+ ((uw_object_hdr_t *)target)->position_word_low = (byte)E;
|
- *(char *)((byte *)target + 0x2) = E;
+ ((uw_object_hdr_t *)target)->position_word_low = (byte)E;
|
- ((char *)target)[0x2] = E;
+ ((uw_object_hdr_t *)target)->position_word_low = (byte)E;
|
- *(char *)((ushort *)target + 0x1) = E;
+ ((uw_object_hdr_t *)target)->position_word_low = (byte)E;
)
...>
}


@receiver_11_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x2)
+ (char)((uw_object_hdr_t *)target)->position_word_low
|
- *(char *)((byte *)target + 0x2)
+ (char)((uw_object_hdr_t *)target)->position_word_low
|
- ((char *)target)[0x2]
+ (char)((uw_object_hdr_t *)target)->position_word_low
|
- *(char *)((ushort *)target + 0x1)
+ (char)((uw_object_hdr_t *)target)->position_word_low
|
- (char)((ushort *)target)[0x1]
+ (char)((uw_object_hdr_t *)target)->position_word_low
)
...>
}


@receiver_11_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x3)
+ ((uw_object_hdr_t *)target)->position_word_high
|
- *(byte *)((byte *)target + 0x3)
+ ((uw_object_hdr_t *)target)->position_word_high
|
- ((byte *)target)[0x3]
+ ((uw_object_hdr_t *)target)->position_word_high
)
...>
}


@receiver_11_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x3)
+ ((uw_object_hdr_t *)target)->position_word_high
|
- *(undefined1 *)((byte *)target + 0x3)
+ ((uw_object_hdr_t *)target)->position_word_high
|
- ((undefined1 *)target)[0x3]
+ ((uw_object_hdr_t *)target)->position_word_high
)
...>
}


@receiver_11_w_2_14_store_3@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x3) = E;
+ ((uw_object_hdr_t *)target)->position_word_high = (byte)E;
|
- *(char *)((byte *)target + 0x3) = E;
+ ((uw_object_hdr_t *)target)->position_word_high = (byte)E;
|
- ((char *)target)[0x3] = E;
+ ((uw_object_hdr_t *)target)->position_word_high = (byte)E;
)
...>
}


@receiver_11_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x3)
+ (char)((uw_object_hdr_t *)target)->position_word_high
|
- *(char *)((byte *)target + 0x3)
+ (char)((uw_object_hdr_t *)target)->position_word_high
|
- ((char *)target)[0x3]
+ (char)((uw_object_hdr_t *)target)->position_word_high
)
...>
}


@receiver_11_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x4) = (char)V;
- *(char *)((char *)target + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x4) = (char)V;
- *(byte *)((char *)target + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x4) = (byte)V;
- *(char *)((char *)target + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x4) = (byte)V;
- *(byte *)((char *)target + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_28_word_ushort@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word
|
- *(ushort *)((byte *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word
|
- ((ushort *)target)[0x2]
+ ((uw_object_hdr_t *)target)->chain_word
|
- *(ushort *)((ushort *)target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word
)
...>
}


@receiver_11_w_4_28_word_short@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word_signed
|
- *(short *)((byte *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word_signed
|
- ((short *)target)[0x2]
+ ((uw_object_hdr_t *)target)->chain_word_signed
|
- *(short *)((short *)target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word_signed
)
...>
}


@receiver_11_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- *(byte *)((byte *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- ((byte *)target)[0x4]
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- *(byte *)((ushort *)target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- (byte)((ushort *)target)[0x2]
+ ((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_11_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- *(undefined1 *)((byte *)target + 0x4)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- ((undefined1 *)target)[0x4]
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- *(undefined1 *)((ushort *)target + 0x2)
+ ((uw_object_hdr_t *)target)->chain_word_low
|
- (undefined1)((ushort *)target)[0x2]
+ ((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_11_w_4_28_store_4@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x4) = E;
+ ((uw_object_hdr_t *)target)->chain_word_low = (byte)E;
|
- *(char *)((byte *)target + 0x4) = E;
+ ((uw_object_hdr_t *)target)->chain_word_low = (byte)E;
|
- ((char *)target)[0x4] = E;
+ ((uw_object_hdr_t *)target)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)target + 0x2) = E;
+ ((uw_object_hdr_t *)target)->chain_word_low = (byte)E;
)
...>
}


@receiver_11_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x4)
+ (char)((uw_object_hdr_t *)target)->chain_word_low
|
- *(char *)((byte *)target + 0x4)
+ (char)((uw_object_hdr_t *)target)->chain_word_low
|
- ((char *)target)[0x4]
+ (char)((uw_object_hdr_t *)target)->chain_word_low
|
- *(char *)((ushort *)target + 0x2)
+ (char)((uw_object_hdr_t *)target)->chain_word_low
|
- (char)((ushort *)target)[0x2]
+ (char)((uw_object_hdr_t *)target)->chain_word_low
)
...>
}


@receiver_11_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x5)
+ ((uw_object_hdr_t *)target)->chain_word_high
|
- *(byte *)((byte *)target + 0x5)
+ ((uw_object_hdr_t *)target)->chain_word_high
|
- ((byte *)target)[0x5]
+ ((uw_object_hdr_t *)target)->chain_word_high
)
...>
}


@receiver_11_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x5)
+ ((uw_object_hdr_t *)target)->chain_word_high
|
- *(undefined1 *)((byte *)target + 0x5)
+ ((uw_object_hdr_t *)target)->chain_word_high
|
- ((undefined1 *)target)[0x5]
+ ((uw_object_hdr_t *)target)->chain_word_high
)
...>
}


@receiver_11_w_4_28_store_5@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x5) = E;
+ ((uw_object_hdr_t *)target)->chain_word_high = (byte)E;
|
- *(char *)((byte *)target + 0x5) = E;
+ ((uw_object_hdr_t *)target)->chain_word_high = (byte)E;
|
- ((char *)target)[0x5] = E;
+ ((uw_object_hdr_t *)target)->chain_word_high = (byte)E;
)
...>
}


@receiver_11_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x5)
+ (char)((uw_object_hdr_t *)target)->chain_word_high
|
- *(char *)((byte *)target + 0x5)
+ (char)((uw_object_hdr_t *)target)->chain_word_high
|
- ((char *)target)[0x5]
+ (char)((uw_object_hdr_t *)target)->chain_word_high
)
...>
}


@receiver_11_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x6) = (char)V;
- *(char *)((char *)target + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)target + 0x6) = (char)V;
- *(byte *)((char *)target + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x6) = (byte)V;
- *(char *)((char *)target + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)target)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)target + 0x6) = (byte)V;
- *(byte *)((char *)target + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)target)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_42_word_ushort@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word
|
- *(ushort *)((byte *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word
|
- ((ushort *)target)[0x3]
+ ((uw_object_hdr_t *)target)->link_word
|
- *(ushort *)((ushort *)target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word
)
...>
}


@receiver_11_w_6_42_word_short@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word_signed
|
- *(short *)((byte *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word_signed
|
- ((short *)target)[0x3]
+ ((uw_object_hdr_t *)target)->link_word_signed
|
- *(short *)((short *)target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word_signed
)
...>
}


@receiver_11_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- *(byte *)((byte *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- ((byte *)target)[0x6]
+ ((uw_object_hdr_t *)target)->link_word_low
|
- *(byte *)((ushort *)target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- (byte)((ushort *)target)[0x3]
+ ((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_11_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- *(undefined1 *)((byte *)target + 0x6)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- ((undefined1 *)target)[0x6]
+ ((uw_object_hdr_t *)target)->link_word_low
|
- *(undefined1 *)((ushort *)target + 0x3)
+ ((uw_object_hdr_t *)target)->link_word_low
|
- (undefined1)((ushort *)target)[0x3]
+ ((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_11_w_6_42_store_6@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x6) = E;
+ ((uw_object_hdr_t *)target)->link_word_low = (byte)E;
|
- *(char *)((byte *)target + 0x6) = E;
+ ((uw_object_hdr_t *)target)->link_word_low = (byte)E;
|
- ((char *)target)[0x6] = E;
+ ((uw_object_hdr_t *)target)->link_word_low = (byte)E;
|
- *(char *)((ushort *)target + 0x3) = E;
+ ((uw_object_hdr_t *)target)->link_word_low = (byte)E;
)
...>
}


@receiver_11_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x6)
+ (char)((uw_object_hdr_t *)target)->link_word_low
|
- *(char *)((byte *)target + 0x6)
+ (char)((uw_object_hdr_t *)target)->link_word_low
|
- ((char *)target)[0x6]
+ (char)((uw_object_hdr_t *)target)->link_word_low
|
- *(char *)((ushort *)target + 0x3)
+ (char)((uw_object_hdr_t *)target)->link_word_low
|
- (char)((ushort *)target)[0x3]
+ (char)((uw_object_hdr_t *)target)->link_word_low
)
...>
}


@receiver_11_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)target + 0x7)
+ ((uw_object_hdr_t *)target)->link_word_high
|
- *(byte *)((byte *)target + 0x7)
+ ((uw_object_hdr_t *)target)->link_word_high
|
- ((byte *)target)[0x7]
+ ((uw_object_hdr_t *)target)->link_word_high
)
...>
}


@receiver_11_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)target + 0x7)
+ ((uw_object_hdr_t *)target)->link_word_high
|
- *(undefined1 *)((byte *)target + 0x7)
+ ((uw_object_hdr_t *)target)->link_word_high
|
- ((undefined1 *)target)[0x7]
+ ((uw_object_hdr_t *)target)->link_word_high
)
...>
}


@receiver_11_w_6_42_store_7@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x7) = E;
+ ((uw_object_hdr_t *)target)->link_word_high = (byte)E;
|
- *(char *)((byte *)target + 0x7) = E;
+ ((uw_object_hdr_t *)target)->link_word_high = (byte)E;
|
- ((char *)target)[0x7] = E;
+ ((uw_object_hdr_t *)target)->link_word_high = (byte)E;
)
...>
}


@receiver_11_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)target + 0x7)
+ (char)((uw_object_hdr_t *)target)->link_word_high
|
- *(char *)((byte *)target + 0x7)
+ (char)((uw_object_hdr_t *)target)->link_word_high
|
- ((char *)target)[0x7]
+ (char)((uw_object_hdr_t *)target)->link_word_high
)
...>
}


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_2_14_word_ushort@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_word_short@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_store_2@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_store_3@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_4_28_word_ushort@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_word_short@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_store_4@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_store_5@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@receiver_12_w_6_42_word_ushort@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_word_short@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_store_6@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_store_7@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_12_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_2_14_word_ushort@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_word_short@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_store_2@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_store_3@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_4_28_word_ushort@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_word_short@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_store_4@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_store_5@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@receiver_13_w_6_42_word_ushort@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_word_short@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_store_6@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_store_7@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_13_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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


@receiver_14_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_0_0_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_0_0_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_0_0_store_0@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_0_0_store_1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_14_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_2_14_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_2_14_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_2_14_store_2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_2_14_store_3@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_14_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_4_28_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_4_28_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_4_28_store_4@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_4_28_store_5@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_14_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
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

@receiver_14_w_6_42_word_ushort@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_6_42_word_short@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef ushort, byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_6_42_store_6@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
)
...>
}


@receiver_14_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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


@receiver_14_w_6_42_store_7@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, uw_object_hdr_t;
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


@receiver_14_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\)$";
typedef byte, undefined1, uw_object_hdr_t;
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
