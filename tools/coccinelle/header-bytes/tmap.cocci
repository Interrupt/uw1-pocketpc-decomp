@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x0) = (char)V;
- *(char *)((char *)_dpp + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x0) = (char)V;
- *(byte *)((char *)_dpp + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x0) = (byte)V;
- *(char *)((char *)_dpp + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x0) = (byte)V;
- *(byte *)((char *)_dpp + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags
|
- *(ushort *)((byte *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags
|
- ((ushort *)_dpp)[0x0]
+ ((uw_object_hdr_t *)_dpp)->type_flags
|
- *(ushort *)((ushort *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_signed
|
- *(short *)((byte *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_signed
|
- ((short *)_dpp)[0x0]
+ ((uw_object_hdr_t *)_dpp)->type_flags_signed
|
- *(short *)((short *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(byte *)((byte *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- ((byte *)_dpp)[0x0]
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(byte *)((ushort *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- (byte)((ushort *)_dpp)[0x0]
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(byte *)_dpp
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(undefined1 *)((byte *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- ((undefined1 *)_dpp)[0x0]
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(undefined1 *)((ushort *)_dpp + 0x0)
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- (undefined1)((ushort *)_dpp)[0x0]
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(undefined1 *)_dpp
+ ((uw_object_hdr_t *)_dpp)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x0) = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_dpp + 0x0) = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_low = (byte)E;
|
- ((char *)_dpp)[0x0] = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_dpp + 0x0) = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_low = (byte)E;
|
- *(char *)_dpp = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x0)
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(char *)((byte *)_dpp + 0x0)
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_low
|
- ((char *)_dpp)[0x0]
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(char *)((ushort *)_dpp + 0x0)
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_low
|
- (char)((ushort *)_dpp)[0x0]
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_low
|
- *(char *)_dpp
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->type_flags_high
|
- *(byte *)((byte *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->type_flags_high
|
- ((byte *)_dpp)[0x1]
+ ((uw_object_hdr_t *)_dpp)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->type_flags_high
|
- *(undefined1 *)((byte *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->type_flags_high
|
- ((undefined1 *)_dpp)[0x1]
+ ((uw_object_hdr_t *)_dpp)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x1) = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_dpp + 0x1) = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_high = (byte)E;
|
- ((char *)_dpp)[0x1] = E;
+ ((uw_object_hdr_t *)_dpp)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x1)
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_high
|
- *(char *)((byte *)_dpp + 0x1)
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_high
|
- ((char *)_dpp)[0x1]
+ (char)((uw_object_hdr_t *)_dpp)->type_flags_high
)
...>
}


@receiver_0_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x2) = (char)V;
- *(char *)((char *)_dpp + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x2) = (char)V;
- *(byte *)((char *)_dpp + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x2) = (byte)V;
- *(char *)((char *)_dpp + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x2) = (byte)V;
- *(byte *)((char *)_dpp + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_14_word_ushort@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word
|
- *(ushort *)((byte *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word
|
- ((ushort *)_dpp)[0x1]
+ ((uw_object_hdr_t *)_dpp)->position_word
|
- *(ushort *)((ushort *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->position_word
)
...>
}


@receiver_0_w_2_14_word_short@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word_signed
|
- *(short *)((byte *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word_signed
|
- ((short *)_dpp)[0x1]
+ ((uw_object_hdr_t *)_dpp)->position_word_signed
|
- *(short *)((short *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->position_word_signed
)
...>
}


@receiver_0_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- *(byte *)((byte *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- ((byte *)_dpp)[0x2]
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- *(byte *)((ushort *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- (byte)((ushort *)_dpp)[0x1]
+ ((uw_object_hdr_t *)_dpp)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- *(undefined1 *)((byte *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- ((undefined1 *)_dpp)[0x2]
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- *(undefined1 *)((ushort *)_dpp + 0x1)
+ ((uw_object_hdr_t *)_dpp)->position_word_low
|
- (undefined1)((ushort *)_dpp)[0x1]
+ ((uw_object_hdr_t *)_dpp)->position_word_low
)
...>
}


@receiver_0_w_2_14_store_2@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x2) = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_low = (byte)E;
|
- *(char *)((byte *)_dpp + 0x2) = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_low = (byte)E;
|
- ((char *)_dpp)[0x2] = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_dpp + 0x1) = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x2)
+ (char)((uw_object_hdr_t *)_dpp)->position_word_low
|
- *(char *)((byte *)_dpp + 0x2)
+ (char)((uw_object_hdr_t *)_dpp)->position_word_low
|
- ((char *)_dpp)[0x2]
+ (char)((uw_object_hdr_t *)_dpp)->position_word_low
|
- *(char *)((ushort *)_dpp + 0x1)
+ (char)((uw_object_hdr_t *)_dpp)->position_word_low
|
- (char)((ushort *)_dpp)[0x1]
+ (char)((uw_object_hdr_t *)_dpp)->position_word_low
)
...>
}


@receiver_0_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->position_word_high
|
- *(byte *)((byte *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->position_word_high
|
- ((byte *)_dpp)[0x3]
+ ((uw_object_hdr_t *)_dpp)->position_word_high
)
...>
}


@receiver_0_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->position_word_high
|
- *(undefined1 *)((byte *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->position_word_high
|
- ((undefined1 *)_dpp)[0x3]
+ ((uw_object_hdr_t *)_dpp)->position_word_high
)
...>
}


@receiver_0_w_2_14_store_3@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x3) = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_high = (byte)E;
|
- *(char *)((byte *)_dpp + 0x3) = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_high = (byte)E;
|
- ((char *)_dpp)[0x3] = E;
+ ((uw_object_hdr_t *)_dpp)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x3)
+ (char)((uw_object_hdr_t *)_dpp)->position_word_high
|
- *(char *)((byte *)_dpp + 0x3)
+ (char)((uw_object_hdr_t *)_dpp)->position_word_high
|
- ((char *)_dpp)[0x3]
+ (char)((uw_object_hdr_t *)_dpp)->position_word_high
)
...>
}


@receiver_0_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x4) = (char)V;
- *(char *)((char *)_dpp + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x4) = (char)V;
- *(byte *)((char *)_dpp + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x4) = (byte)V;
- *(char *)((char *)_dpp + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x4) = (byte)V;
- *(byte *)((char *)_dpp + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_28_word_ushort@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word
|
- *(ushort *)((byte *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word
|
- ((ushort *)_dpp)[0x2]
+ ((uw_object_hdr_t *)_dpp)->chain_word
|
- *(ushort *)((ushort *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->chain_word
)
...>
}


@receiver_0_w_4_28_word_short@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word_signed
|
- *(short *)((byte *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word_signed
|
- ((short *)_dpp)[0x2]
+ ((uw_object_hdr_t *)_dpp)->chain_word_signed
|
- *(short *)((short *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->chain_word_signed
)
...>
}


@receiver_0_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- *(byte *)((byte *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- ((byte *)_dpp)[0x4]
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- *(byte *)((ushort *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- (byte)((ushort *)_dpp)[0x2]
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- *(undefined1 *)((byte *)_dpp + 0x4)
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- ((undefined1 *)_dpp)[0x4]
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- *(undefined1 *)((ushort *)_dpp + 0x2)
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
|
- (undefined1)((ushort *)_dpp)[0x2]
+ ((uw_object_hdr_t *)_dpp)->chain_word_low
)
...>
}


@receiver_0_w_4_28_store_4@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x4) = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_dpp + 0x4) = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_low = (byte)E;
|
- ((char *)_dpp)[0x4] = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_dpp + 0x2) = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x4)
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_low
|
- *(char *)((byte *)_dpp + 0x4)
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_low
|
- ((char *)_dpp)[0x4]
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_low
|
- *(char *)((ushort *)_dpp + 0x2)
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_low
|
- (char)((ushort *)_dpp)[0x2]
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_low
)
...>
}


@receiver_0_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x5)
+ ((uw_object_hdr_t *)_dpp)->chain_word_high
|
- *(byte *)((byte *)_dpp + 0x5)
+ ((uw_object_hdr_t *)_dpp)->chain_word_high
|
- ((byte *)_dpp)[0x5]
+ ((uw_object_hdr_t *)_dpp)->chain_word_high
)
...>
}


@receiver_0_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x5)
+ ((uw_object_hdr_t *)_dpp)->chain_word_high
|
- *(undefined1 *)((byte *)_dpp + 0x5)
+ ((uw_object_hdr_t *)_dpp)->chain_word_high
|
- ((undefined1 *)_dpp)[0x5]
+ ((uw_object_hdr_t *)_dpp)->chain_word_high
)
...>
}


@receiver_0_w_4_28_store_5@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x5) = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_dpp + 0x5) = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_high = (byte)E;
|
- ((char *)_dpp)[0x5] = E;
+ ((uw_object_hdr_t *)_dpp)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x5)
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_high
|
- *(char *)((byte *)_dpp + 0x5)
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_high
|
- ((char *)_dpp)[0x5]
+ (char)((uw_object_hdr_t *)_dpp)->chain_word_high
)
...>
}


@receiver_0_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x6) = (char)V;
- *(char *)((char *)_dpp + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_dpp + 0x6) = (char)V;
- *(byte *)((char *)_dpp + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x6) = (byte)V;
- *(char *)((char *)_dpp + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_dpp + 0x6) = (byte)V;
- *(byte *)((char *)_dpp + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_dpp)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_42_word_ushort@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word
|
- *(ushort *)((byte *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word
|
- ((ushort *)_dpp)[0x3]
+ ((uw_object_hdr_t *)_dpp)->link_word
|
- *(ushort *)((ushort *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->link_word
)
...>
}


@receiver_0_w_6_42_word_short@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word_signed
|
- *(short *)((byte *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word_signed
|
- ((short *)_dpp)[0x3]
+ ((uw_object_hdr_t *)_dpp)->link_word_signed
|
- *(short *)((short *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->link_word_signed
)
...>
}


@receiver_0_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- *(byte *)((byte *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- ((byte *)_dpp)[0x6]
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- *(byte *)((ushort *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- (byte)((ushort *)_dpp)[0x3]
+ ((uw_object_hdr_t *)_dpp)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- *(undefined1 *)((byte *)_dpp + 0x6)
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- ((undefined1 *)_dpp)[0x6]
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- *(undefined1 *)((ushort *)_dpp + 0x3)
+ ((uw_object_hdr_t *)_dpp)->link_word_low
|
- (undefined1)((ushort *)_dpp)[0x3]
+ ((uw_object_hdr_t *)_dpp)->link_word_low
)
...>
}


@receiver_0_w_6_42_store_6@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x6) = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_low = (byte)E;
|
- *(char *)((byte *)_dpp + 0x6) = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_low = (byte)E;
|
- ((char *)_dpp)[0x6] = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_dpp + 0x3) = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x6)
+ (char)((uw_object_hdr_t *)_dpp)->link_word_low
|
- *(char *)((byte *)_dpp + 0x6)
+ (char)((uw_object_hdr_t *)_dpp)->link_word_low
|
- ((char *)_dpp)[0x6]
+ (char)((uw_object_hdr_t *)_dpp)->link_word_low
|
- *(char *)((ushort *)_dpp + 0x3)
+ (char)((uw_object_hdr_t *)_dpp)->link_word_low
|
- (char)((ushort *)_dpp)[0x3]
+ (char)((uw_object_hdr_t *)_dpp)->link_word_low
)
...>
}


@receiver_0_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_dpp + 0x7)
+ ((uw_object_hdr_t *)_dpp)->link_word_high
|
- *(byte *)((byte *)_dpp + 0x7)
+ ((uw_object_hdr_t *)_dpp)->link_word_high
|
- ((byte *)_dpp)[0x7]
+ ((uw_object_hdr_t *)_dpp)->link_word_high
)
...>
}


@receiver_0_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_dpp + 0x7)
+ ((uw_object_hdr_t *)_dpp)->link_word_high
|
- *(undefined1 *)((byte *)_dpp + 0x7)
+ ((uw_object_hdr_t *)_dpp)->link_word_high
|
- ((undefined1 *)_dpp)[0x7]
+ ((uw_object_hdr_t *)_dpp)->link_word_high
)
...>
}


@receiver_0_w_6_42_store_7@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x7) = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_high = (byte)E;
|
- *(char *)((byte *)_dpp + 0x7) = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_high = (byte)E;
|
- ((char *)_dpp)[0x7] = E;
+ ((uw_object_hdr_t *)_dpp)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(process_visible_tile_cell\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_dpp + 0x7)
+ (char)((uw_object_hdr_t *)_dpp)->link_word_high
|
- *(char *)((byte *)_dpp + 0x7)
+ (char)((uw_object_hdr_t *)_dpp)->link_word_high
|
- ((char *)_dpp)[0x7]
+ (char)((uw_object_hdr_t *)_dpp)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_2_14_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_store_2@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_store_3@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_4_28_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_store_4@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_store_5@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_1_w_6_42_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_store_6@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_store_7@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_1_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_2_14_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_store_2@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_store_3@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_4_28_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_store_4@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_store_5@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@receiver_2_w_6_42_word_ushort@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_word_short@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_store_6@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_store_7@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_2_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x0) = (char)V;
- *(char *)((char *)_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x0) = (char)V;
- *(byte *)((char *)_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x0) = (byte)V;
- *(char *)((char *)_rec + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x0) = (byte)V;
- *(byte *)((char *)_rec + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- *(ushort *)((byte *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- ((ushort *)_rec)[0x0]
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- *(ushort *)((ushort *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_signed
|
- *(short *)((byte *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_signed
|
- ((short *)_rec)[0x0]
+ ((uw_object_hdr_t *)_rec)->type_flags_signed
|
- *(short *)((short *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(byte *)((byte *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- ((byte *)_rec)[0x0]
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(byte *)((ushort *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- (byte)((ushort *)_rec)[0x0]
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(byte *)_rec
+ ((uw_object_hdr_t *)_rec)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(undefined1 *)((byte *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- ((undefined1 *)_rec)[0x0]
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(undefined1 *)((ushort *)_rec + 0x0)
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- (undefined1)((ushort *)_rec)[0x0]
+ ((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(undefined1 *)_rec
+ ((uw_object_hdr_t *)_rec)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x0) = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_rec + 0x0) = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_low = (byte)E;
|
- ((char *)_rec)[0x0] = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_rec + 0x0) = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_low = (byte)E;
|
- *(char *)_rec = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x0)
+ (char)((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(char *)((byte *)_rec + 0x0)
+ (char)((uw_object_hdr_t *)_rec)->type_flags_low
|
- ((char *)_rec)[0x0]
+ (char)((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(char *)((ushort *)_rec + 0x0)
+ (char)((uw_object_hdr_t *)_rec)->type_flags_low
|
- (char)((ushort *)_rec)[0x0]
+ (char)((uw_object_hdr_t *)_rec)->type_flags_low
|
- *(char *)_rec
+ (char)((uw_object_hdr_t *)_rec)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->type_flags_high
|
- *(byte *)((byte *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->type_flags_high
|
- ((byte *)_rec)[0x1]
+ ((uw_object_hdr_t *)_rec)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->type_flags_high
|
- *(undefined1 *)((byte *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->type_flags_high
|
- ((undefined1 *)_rec)[0x1]
+ ((uw_object_hdr_t *)_rec)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x1) = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_rec + 0x1) = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_high = (byte)E;
|
- ((char *)_rec)[0x1] = E;
+ ((uw_object_hdr_t *)_rec)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x1)
+ (char)((uw_object_hdr_t *)_rec)->type_flags_high
|
- *(char *)((byte *)_rec + 0x1)
+ (char)((uw_object_hdr_t *)_rec)->type_flags_high
|
- ((char *)_rec)[0x1]
+ (char)((uw_object_hdr_t *)_rec)->type_flags_high
)
...>
}


@receiver_3_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x2) = (char)V;
- *(char *)((char *)_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x2) = (char)V;
- *(byte *)((char *)_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x2) = (byte)V;
- *(char *)((char *)_rec + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x2) = (byte)V;
- *(byte *)((char *)_rec + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_14_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word
|
- *(ushort *)((byte *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word
|
- ((ushort *)_rec)[0x1]
+ ((uw_object_hdr_t *)_rec)->position_word
|
- *(ushort *)((ushort *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->position_word
)
...>
}


@receiver_3_w_2_14_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word_signed
|
- *(short *)((byte *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word_signed
|
- ((short *)_rec)[0x1]
+ ((uw_object_hdr_t *)_rec)->position_word_signed
|
- *(short *)((short *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->position_word_signed
)
...>
}


@receiver_3_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- *(byte *)((byte *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- ((byte *)_rec)[0x2]
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- *(byte *)((ushort *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- (byte)((ushort *)_rec)[0x1]
+ ((uw_object_hdr_t *)_rec)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- *(undefined1 *)((byte *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- ((undefined1 *)_rec)[0x2]
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- *(undefined1 *)((ushort *)_rec + 0x1)
+ ((uw_object_hdr_t *)_rec)->position_word_low
|
- (undefined1)((ushort *)_rec)[0x1]
+ ((uw_object_hdr_t *)_rec)->position_word_low
)
...>
}


@receiver_3_w_2_14_store_2@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x2) = E;
+ ((uw_object_hdr_t *)_rec)->position_word_low = (byte)E;
|
- *(char *)((byte *)_rec + 0x2) = E;
+ ((uw_object_hdr_t *)_rec)->position_word_low = (byte)E;
|
- ((char *)_rec)[0x2] = E;
+ ((uw_object_hdr_t *)_rec)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_rec + 0x1) = E;
+ ((uw_object_hdr_t *)_rec)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x2)
+ (char)((uw_object_hdr_t *)_rec)->position_word_low
|
- *(char *)((byte *)_rec + 0x2)
+ (char)((uw_object_hdr_t *)_rec)->position_word_low
|
- ((char *)_rec)[0x2]
+ (char)((uw_object_hdr_t *)_rec)->position_word_low
|
- *(char *)((ushort *)_rec + 0x1)
+ (char)((uw_object_hdr_t *)_rec)->position_word_low
|
- (char)((ushort *)_rec)[0x1]
+ (char)((uw_object_hdr_t *)_rec)->position_word_low
)
...>
}


@receiver_3_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->position_word_high
|
- *(byte *)((byte *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->position_word_high
|
- ((byte *)_rec)[0x3]
+ ((uw_object_hdr_t *)_rec)->position_word_high
)
...>
}


@receiver_3_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->position_word_high
|
- *(undefined1 *)((byte *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->position_word_high
|
- ((undefined1 *)_rec)[0x3]
+ ((uw_object_hdr_t *)_rec)->position_word_high
)
...>
}


@receiver_3_w_2_14_store_3@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x3) = E;
+ ((uw_object_hdr_t *)_rec)->position_word_high = (byte)E;
|
- *(char *)((byte *)_rec + 0x3) = E;
+ ((uw_object_hdr_t *)_rec)->position_word_high = (byte)E;
|
- ((char *)_rec)[0x3] = E;
+ ((uw_object_hdr_t *)_rec)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x3)
+ (char)((uw_object_hdr_t *)_rec)->position_word_high
|
- *(char *)((byte *)_rec + 0x3)
+ (char)((uw_object_hdr_t *)_rec)->position_word_high
|
- ((char *)_rec)[0x3]
+ (char)((uw_object_hdr_t *)_rec)->position_word_high
)
...>
}


@receiver_3_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x4) = (char)V;
- *(char *)((char *)_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x4) = (char)V;
- *(byte *)((char *)_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x4) = (byte)V;
- *(char *)((char *)_rec + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x4) = (byte)V;
- *(byte *)((char *)_rec + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_28_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word
|
- *(ushort *)((byte *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word
|
- ((ushort *)_rec)[0x2]
+ ((uw_object_hdr_t *)_rec)->chain_word
|
- *(ushort *)((ushort *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->chain_word
)
...>
}


@receiver_3_w_4_28_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word_signed
|
- *(short *)((byte *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word_signed
|
- ((short *)_rec)[0x2]
+ ((uw_object_hdr_t *)_rec)->chain_word_signed
|
- *(short *)((short *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->chain_word_signed
)
...>
}


@receiver_3_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- *(byte *)((byte *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- ((byte *)_rec)[0x4]
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- *(byte *)((ushort *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- (byte)((ushort *)_rec)[0x2]
+ ((uw_object_hdr_t *)_rec)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- *(undefined1 *)((byte *)_rec + 0x4)
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- ((undefined1 *)_rec)[0x4]
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- *(undefined1 *)((ushort *)_rec + 0x2)
+ ((uw_object_hdr_t *)_rec)->chain_word_low
|
- (undefined1)((ushort *)_rec)[0x2]
+ ((uw_object_hdr_t *)_rec)->chain_word_low
)
...>
}


@receiver_3_w_4_28_store_4@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x4) = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_rec + 0x4) = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_low = (byte)E;
|
- ((char *)_rec)[0x4] = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_rec + 0x2) = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x4)
+ (char)((uw_object_hdr_t *)_rec)->chain_word_low
|
- *(char *)((byte *)_rec + 0x4)
+ (char)((uw_object_hdr_t *)_rec)->chain_word_low
|
- ((char *)_rec)[0x4]
+ (char)((uw_object_hdr_t *)_rec)->chain_word_low
|
- *(char *)((ushort *)_rec + 0x2)
+ (char)((uw_object_hdr_t *)_rec)->chain_word_low
|
- (char)((ushort *)_rec)[0x2]
+ (char)((uw_object_hdr_t *)_rec)->chain_word_low
)
...>
}


@receiver_3_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x5)
+ ((uw_object_hdr_t *)_rec)->chain_word_high
|
- *(byte *)((byte *)_rec + 0x5)
+ ((uw_object_hdr_t *)_rec)->chain_word_high
|
- ((byte *)_rec)[0x5]
+ ((uw_object_hdr_t *)_rec)->chain_word_high
)
...>
}


@receiver_3_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x5)
+ ((uw_object_hdr_t *)_rec)->chain_word_high
|
- *(undefined1 *)((byte *)_rec + 0x5)
+ ((uw_object_hdr_t *)_rec)->chain_word_high
|
- ((undefined1 *)_rec)[0x5]
+ ((uw_object_hdr_t *)_rec)->chain_word_high
)
...>
}


@receiver_3_w_4_28_store_5@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x5) = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_rec + 0x5) = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_high = (byte)E;
|
- ((char *)_rec)[0x5] = E;
+ ((uw_object_hdr_t *)_rec)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x5)
+ (char)((uw_object_hdr_t *)_rec)->chain_word_high
|
- *(char *)((byte *)_rec + 0x5)
+ (char)((uw_object_hdr_t *)_rec)->chain_word_high
|
- ((char *)_rec)[0x5]
+ (char)((uw_object_hdr_t *)_rec)->chain_word_high
)
...>
}


@receiver_3_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x6) = (char)V;
- *(char *)((char *)_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_rec + 0x6) = (char)V;
- *(byte *)((char *)_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x6) = (byte)V;
- *(char *)((char *)_rec + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_rec + 0x6) = (byte)V;
- *(byte *)((char *)_rec + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_rec)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_42_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word
|
- *(ushort *)((byte *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word
|
- ((ushort *)_rec)[0x3]
+ ((uw_object_hdr_t *)_rec)->link_word
|
- *(ushort *)((ushort *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->link_word
)
...>
}


@receiver_3_w_6_42_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word_signed
|
- *(short *)((byte *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word_signed
|
- ((short *)_rec)[0x3]
+ ((uw_object_hdr_t *)_rec)->link_word_signed
|
- *(short *)((short *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->link_word_signed
)
...>
}


@receiver_3_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- *(byte *)((byte *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- ((byte *)_rec)[0x6]
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- *(byte *)((ushort *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- (byte)((ushort *)_rec)[0x3]
+ ((uw_object_hdr_t *)_rec)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- *(undefined1 *)((byte *)_rec + 0x6)
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- ((undefined1 *)_rec)[0x6]
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- *(undefined1 *)((ushort *)_rec + 0x3)
+ ((uw_object_hdr_t *)_rec)->link_word_low
|
- (undefined1)((ushort *)_rec)[0x3]
+ ((uw_object_hdr_t *)_rec)->link_word_low
)
...>
}


@receiver_3_w_6_42_store_6@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x6) = E;
+ ((uw_object_hdr_t *)_rec)->link_word_low = (byte)E;
|
- *(char *)((byte *)_rec + 0x6) = E;
+ ((uw_object_hdr_t *)_rec)->link_word_low = (byte)E;
|
- ((char *)_rec)[0x6] = E;
+ ((uw_object_hdr_t *)_rec)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_rec + 0x3) = E;
+ ((uw_object_hdr_t *)_rec)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x6)
+ (char)((uw_object_hdr_t *)_rec)->link_word_low
|
- *(char *)((byte *)_rec + 0x6)
+ (char)((uw_object_hdr_t *)_rec)->link_word_low
|
- ((char *)_rec)[0x6]
+ (char)((uw_object_hdr_t *)_rec)->link_word_low
|
- *(char *)((ushort *)_rec + 0x3)
+ (char)((uw_object_hdr_t *)_rec)->link_word_low
|
- (char)((ushort *)_rec)[0x3]
+ (char)((uw_object_hdr_t *)_rec)->link_word_low
)
...>
}


@receiver_3_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_rec + 0x7)
+ ((uw_object_hdr_t *)_rec)->link_word_high
|
- *(byte *)((byte *)_rec + 0x7)
+ ((uw_object_hdr_t *)_rec)->link_word_high
|
- ((byte *)_rec)[0x7]
+ ((uw_object_hdr_t *)_rec)->link_word_high
)
...>
}


@receiver_3_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_rec + 0x7)
+ ((uw_object_hdr_t *)_rec)->link_word_high
|
- *(undefined1 *)((byte *)_rec + 0x7)
+ ((uw_object_hdr_t *)_rec)->link_word_high
|
- ((undefined1 *)_rec)[0x7]
+ ((uw_object_hdr_t *)_rec)->link_word_high
)
...>
}


@receiver_3_w_6_42_store_7@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x7) = E;
+ ((uw_object_hdr_t *)_rec)->link_word_high = (byte)E;
|
- *(char *)((byte *)_rec + 0x7) = E;
+ ((uw_object_hdr_t *)_rec)->link_word_high = (byte)E;
|
- ((char *)_rec)[0x7] = E;
+ ((uw_object_hdr_t *)_rec)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_rec + 0x7)
+ (char)((uw_object_hdr_t *)_rec)->link_word_high
|
- *(char *)((byte *)_rec + 0x7)
+ (char)((uw_object_hdr_t *)_rec)->link_word_high
|
- ((char *)_rec)[0x7]
+ (char)((uw_object_hdr_t *)_rec)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x0) = (char)V;
- *(char *)((char *)_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x0) = (char)V;
- *(byte *)((char *)_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x0) = (byte)V;
- *(char *)((char *)_item + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x0) = (byte)V;
- *(byte *)((char *)_item + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags
|
- *(ushort *)((byte *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags
|
- ((ushort *)_item)[0x0]
+ ((uw_object_hdr_t *)_item)->type_flags
|
- *(ushort *)((ushort *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_signed
|
- *(short *)((byte *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_signed
|
- ((short *)_item)[0x0]
+ ((uw_object_hdr_t *)_item)->type_flags_signed
|
- *(short *)((short *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- *(byte *)((byte *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- ((byte *)_item)[0x0]
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- *(byte *)((ushort *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- (byte)((ushort *)_item)[0x0]
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- *(byte *)_item
+ ((uw_object_hdr_t *)_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- *(undefined1 *)((byte *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- ((undefined1 *)_item)[0x0]
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- *(undefined1 *)((ushort *)_item + 0x0)
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- (undefined1)((ushort *)_item)[0x0]
+ ((uw_object_hdr_t *)_item)->type_flags_low
|
- *(undefined1 *)_item
+ ((uw_object_hdr_t *)_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x0) = E;
+ ((uw_object_hdr_t *)_item)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_item + 0x0) = E;
+ ((uw_object_hdr_t *)_item)->type_flags_low = (byte)E;
|
- ((char *)_item)[0x0] = E;
+ ((uw_object_hdr_t *)_item)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_item + 0x0) = E;
+ ((uw_object_hdr_t *)_item)->type_flags_low = (byte)E;
|
- *(char *)_item = E;
+ ((uw_object_hdr_t *)_item)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x0)
+ (char)((uw_object_hdr_t *)_item)->type_flags_low
|
- *(char *)((byte *)_item + 0x0)
+ (char)((uw_object_hdr_t *)_item)->type_flags_low
|
- ((char *)_item)[0x0]
+ (char)((uw_object_hdr_t *)_item)->type_flags_low
|
- *(char *)((ushort *)_item + 0x0)
+ (char)((uw_object_hdr_t *)_item)->type_flags_low
|
- (char)((ushort *)_item)[0x0]
+ (char)((uw_object_hdr_t *)_item)->type_flags_low
|
- *(char *)_item
+ (char)((uw_object_hdr_t *)_item)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->type_flags_high
|
- *(byte *)((byte *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->type_flags_high
|
- ((byte *)_item)[0x1]
+ ((uw_object_hdr_t *)_item)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->type_flags_high
|
- *(undefined1 *)((byte *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->type_flags_high
|
- ((undefined1 *)_item)[0x1]
+ ((uw_object_hdr_t *)_item)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x1) = E;
+ ((uw_object_hdr_t *)_item)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_item + 0x1) = E;
+ ((uw_object_hdr_t *)_item)->type_flags_high = (byte)E;
|
- ((char *)_item)[0x1] = E;
+ ((uw_object_hdr_t *)_item)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x1)
+ (char)((uw_object_hdr_t *)_item)->type_flags_high
|
- *(char *)((byte *)_item + 0x1)
+ (char)((uw_object_hdr_t *)_item)->type_flags_high
|
- ((char *)_item)[0x1]
+ (char)((uw_object_hdr_t *)_item)->type_flags_high
)
...>
}


@receiver_4_w_2_14_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x2) = (char)V;
- *(char *)((char *)_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x2) = (char)V;
- *(byte *)((char *)_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x2) = (byte)V;
- *(char *)((char *)_item + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x2) = (byte)V;
- *(byte *)((char *)_item + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_14_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word
|
- *(ushort *)((byte *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word
|
- ((ushort *)_item)[0x1]
+ ((uw_object_hdr_t *)_item)->position_word
|
- *(ushort *)((ushort *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->position_word
)
...>
}


@receiver_4_w_2_14_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word_signed
|
- *(short *)((byte *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word_signed
|
- ((short *)_item)[0x1]
+ ((uw_object_hdr_t *)_item)->position_word_signed
|
- *(short *)((short *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->position_word_signed
)
...>
}


@receiver_4_w_2_14_byte_2_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- *(byte *)((byte *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- ((byte *)_item)[0x2]
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- *(byte *)((ushort *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- (byte)((ushort *)_item)[0x1]
+ ((uw_object_hdr_t *)_item)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_2_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- *(undefined1 *)((byte *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- ((undefined1 *)_item)[0x2]
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- *(undefined1 *)((ushort *)_item + 0x1)
+ ((uw_object_hdr_t *)_item)->position_word_low
|
- (undefined1)((ushort *)_item)[0x1]
+ ((uw_object_hdr_t *)_item)->position_word_low
)
...>
}


@receiver_4_w_2_14_store_2@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x2) = E;
+ ((uw_object_hdr_t *)_item)->position_word_low = (byte)E;
|
- *(char *)((byte *)_item + 0x2) = E;
+ ((uw_object_hdr_t *)_item)->position_word_low = (byte)E;
|
- ((char *)_item)[0x2] = E;
+ ((uw_object_hdr_t *)_item)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_item + 0x1) = E;
+ ((uw_object_hdr_t *)_item)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_2_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x2)
+ (char)((uw_object_hdr_t *)_item)->position_word_low
|
- *(char *)((byte *)_item + 0x2)
+ (char)((uw_object_hdr_t *)_item)->position_word_low
|
- ((char *)_item)[0x2]
+ (char)((uw_object_hdr_t *)_item)->position_word_low
|
- *(char *)((ushort *)_item + 0x1)
+ (char)((uw_object_hdr_t *)_item)->position_word_low
|
- (char)((ushort *)_item)[0x1]
+ (char)((uw_object_hdr_t *)_item)->position_word_low
)
...>
}


@receiver_4_w_2_14_byte_3_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->position_word_high
|
- *(byte *)((byte *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->position_word_high
|
- ((byte *)_item)[0x3]
+ ((uw_object_hdr_t *)_item)->position_word_high
)
...>
}


@receiver_4_w_2_14_byte_3_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->position_word_high
|
- *(undefined1 *)((byte *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->position_word_high
|
- ((undefined1 *)_item)[0x3]
+ ((uw_object_hdr_t *)_item)->position_word_high
)
...>
}


@receiver_4_w_2_14_store_3@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x3) = E;
+ ((uw_object_hdr_t *)_item)->position_word_high = (byte)E;
|
- *(char *)((byte *)_item + 0x3) = E;
+ ((uw_object_hdr_t *)_item)->position_word_high = (byte)E;
|
- ((char *)_item)[0x3] = E;
+ ((uw_object_hdr_t *)_item)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_14_byte_3_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x3)
+ (char)((uw_object_hdr_t *)_item)->position_word_high
|
- *(char *)((byte *)_item + 0x3)
+ (char)((uw_object_hdr_t *)_item)->position_word_high
|
- ((char *)_item)[0x3]
+ (char)((uw_object_hdr_t *)_item)->position_word_high
)
...>
}


@receiver_4_w_4_28_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x4) = (char)V;
- *(char *)((char *)_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x4) = (char)V;
- *(byte *)((char *)_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x4) = (byte)V;
- *(char *)((char *)_item + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x4) = (byte)V;
- *(byte *)((char *)_item + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_28_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word
|
- *(ushort *)((byte *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word
|
- ((ushort *)_item)[0x2]
+ ((uw_object_hdr_t *)_item)->chain_word
|
- *(ushort *)((ushort *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->chain_word
)
...>
}


@receiver_4_w_4_28_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word_signed
|
- *(short *)((byte *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word_signed
|
- ((short *)_item)[0x2]
+ ((uw_object_hdr_t *)_item)->chain_word_signed
|
- *(short *)((short *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->chain_word_signed
)
...>
}


@receiver_4_w_4_28_byte_4_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- *(byte *)((byte *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- ((byte *)_item)[0x4]
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- *(byte *)((ushort *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- (byte)((ushort *)_item)[0x2]
+ ((uw_object_hdr_t *)_item)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_4_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- *(undefined1 *)((byte *)_item + 0x4)
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- ((undefined1 *)_item)[0x4]
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- *(undefined1 *)((ushort *)_item + 0x2)
+ ((uw_object_hdr_t *)_item)->chain_word_low
|
- (undefined1)((ushort *)_item)[0x2]
+ ((uw_object_hdr_t *)_item)->chain_word_low
)
...>
}


@receiver_4_w_4_28_store_4@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x4) = E;
+ ((uw_object_hdr_t *)_item)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_item + 0x4) = E;
+ ((uw_object_hdr_t *)_item)->chain_word_low = (byte)E;
|
- ((char *)_item)[0x4] = E;
+ ((uw_object_hdr_t *)_item)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_item + 0x2) = E;
+ ((uw_object_hdr_t *)_item)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_4_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x4)
+ (char)((uw_object_hdr_t *)_item)->chain_word_low
|
- *(char *)((byte *)_item + 0x4)
+ (char)((uw_object_hdr_t *)_item)->chain_word_low
|
- ((char *)_item)[0x4]
+ (char)((uw_object_hdr_t *)_item)->chain_word_low
|
- *(char *)((ushort *)_item + 0x2)
+ (char)((uw_object_hdr_t *)_item)->chain_word_low
|
- (char)((ushort *)_item)[0x2]
+ (char)((uw_object_hdr_t *)_item)->chain_word_low
)
...>
}


@receiver_4_w_4_28_byte_5_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x5)
+ ((uw_object_hdr_t *)_item)->chain_word_high
|
- *(byte *)((byte *)_item + 0x5)
+ ((uw_object_hdr_t *)_item)->chain_word_high
|
- ((byte *)_item)[0x5]
+ ((uw_object_hdr_t *)_item)->chain_word_high
)
...>
}


@receiver_4_w_4_28_byte_5_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x5)
+ ((uw_object_hdr_t *)_item)->chain_word_high
|
- *(undefined1 *)((byte *)_item + 0x5)
+ ((uw_object_hdr_t *)_item)->chain_word_high
|
- ((undefined1 *)_item)[0x5]
+ ((uw_object_hdr_t *)_item)->chain_word_high
)
...>
}


@receiver_4_w_4_28_store_5@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x5) = E;
+ ((uw_object_hdr_t *)_item)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_item + 0x5) = E;
+ ((uw_object_hdr_t *)_item)->chain_word_high = (byte)E;
|
- ((char *)_item)[0x5] = E;
+ ((uw_object_hdr_t *)_item)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_28_byte_5_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x5)
+ (char)((uw_object_hdr_t *)_item)->chain_word_high
|
- *(char *)((byte *)_item + 0x5)
+ (char)((uw_object_hdr_t *)_item)->chain_word_high
|
- ((char *)_item)[0x5]
+ (char)((uw_object_hdr_t *)_item)->chain_word_high
)
...>
}


@receiver_4_w_6_42_pair_char_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x6) = (char)V;
- *(char *)((char *)_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_char_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_item + 0x6) = (char)V;
- *(byte *)((char *)_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x6) = (byte)V;
- *(char *)((char *)_item + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_pair_byte_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_item + 0x6) = (byte)V;
- *(byte *)((char *)_item + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_item)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_42_word_ushort@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word
|
- *(ushort *)((byte *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word
|
- ((ushort *)_item)[0x3]
+ ((uw_object_hdr_t *)_item)->link_word
|
- *(ushort *)((ushort *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->link_word
)
...>
}


@receiver_4_w_6_42_word_short@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word_signed
|
- *(short *)((byte *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word_signed
|
- ((short *)_item)[0x3]
+ ((uw_object_hdr_t *)_item)->link_word_signed
|
- *(short *)((short *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->link_word_signed
)
...>
}


@receiver_4_w_6_42_byte_6_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- *(byte *)((byte *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- ((byte *)_item)[0x6]
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- *(byte *)((ushort *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- (byte)((ushort *)_item)[0x3]
+ ((uw_object_hdr_t *)_item)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_6_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- *(undefined1 *)((byte *)_item + 0x6)
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- ((undefined1 *)_item)[0x6]
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- *(undefined1 *)((ushort *)_item + 0x3)
+ ((uw_object_hdr_t *)_item)->link_word_low
|
- (undefined1)((ushort *)_item)[0x3]
+ ((uw_object_hdr_t *)_item)->link_word_low
)
...>
}


@receiver_4_w_6_42_store_6@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x6) = E;
+ ((uw_object_hdr_t *)_item)->link_word_low = (byte)E;
|
- *(char *)((byte *)_item + 0x6) = E;
+ ((uw_object_hdr_t *)_item)->link_word_low = (byte)E;
|
- ((char *)_item)[0x6] = E;
+ ((uw_object_hdr_t *)_item)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_item + 0x3) = E;
+ ((uw_object_hdr_t *)_item)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_6_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x6)
+ (char)((uw_object_hdr_t *)_item)->link_word_low
|
- *(char *)((byte *)_item + 0x6)
+ (char)((uw_object_hdr_t *)_item)->link_word_low
|
- ((char *)_item)[0x6]
+ (char)((uw_object_hdr_t *)_item)->link_word_low
|
- *(char *)((ushort *)_item + 0x3)
+ (char)((uw_object_hdr_t *)_item)->link_word_low
|
- (char)((ushort *)_item)[0x3]
+ (char)((uw_object_hdr_t *)_item)->link_word_low
)
...>
}


@receiver_4_w_6_42_byte_7_byte@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_item + 0x7)
+ ((uw_object_hdr_t *)_item)->link_word_high
|
- *(byte *)((byte *)_item + 0x7)
+ ((uw_object_hdr_t *)_item)->link_word_high
|
- ((byte *)_item)[0x7]
+ ((uw_object_hdr_t *)_item)->link_word_high
)
...>
}


@receiver_4_w_6_42_byte_7_undefined1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_item + 0x7)
+ ((uw_object_hdr_t *)_item)->link_word_high
|
- *(undefined1 *)((byte *)_item + 0x7)
+ ((uw_object_hdr_t *)_item)->link_word_high
|
- ((undefined1 *)_item)[0x7]
+ ((uw_object_hdr_t *)_item)->link_word_high
)
...>
}


@receiver_4_w_6_42_store_7@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x7) = E;
+ ((uw_object_hdr_t *)_item)->link_word_high = (byte)E;
|
- *(char *)((byte *)_item + 0x7) = E;
+ ((uw_object_hdr_t *)_item)->link_word_high = (byte)E;
|
- ((char *)_item)[0x7] = E;
+ ((uw_object_hdr_t *)_item)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_42_byte_7_char@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_item + 0x7)
+ (char)((uw_object_hdr_t *)_item)->link_word_high
|
- *(char *)((byte *)_item + 0x7)
+ (char)((uw_object_hdr_t *)_item)->link_word_high
|
- ((char *)_item)[0x7]
+ (char)((uw_object_hdr_t *)_item)->link_word_high
)
...>
}
