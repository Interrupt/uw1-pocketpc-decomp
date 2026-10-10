@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x0) = (char)V;
- *(char *)((char *)_o + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x0) = (char)V;
- *(byte *)((char *)_o + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x0) = (byte)V;
- *(char *)((char *)_o + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x0) = (byte)V;
- *(byte *)((char *)_o + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(ushort *)((byte *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- ((ushort *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(ushort *)((ushort *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(ushort *)(_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- _o[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *_o
+ ((uw_object_hdr_t *)_o)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(undefined2 *)((byte *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- ((undefined2 *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(undefined2 *)((undefined2 *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *(undefined2 *)(_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags
|
- _o[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags
|
- *_o
+ ((uw_object_hdr_t *)_o)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_signed
|
- *(short *)((byte *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_signed
|
- ((short *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_signed
|
- *(short *)((short *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_signed
|
- *(short *)(_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(byte *)((byte *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- ((byte *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(byte *)((ushort *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- (byte)((ushort *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(byte *)_o
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(byte *)(_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- (byte)_o[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(undefined1 *)((byte *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- ((undefined1 *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(undefined1 *)((ushort *)_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- (undefined1)((ushort *)_o)[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(undefined1 *)_o
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- *(undefined1 *)(_o + 0x0)
+ ((uw_object_hdr_t *)_o)->type_flags_low
|
- (undefined1)_o[0x0]
+ ((uw_object_hdr_t *)_o)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x0)
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_low
|
- &*(char *)((byte *)_o + 0x0)
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_low
|
- &((char *)_o)[0x0]
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_low
|
- &*(char *)((ushort *)_o + 0x0)
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_low
|
- &*(char *)_o
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_low
|
- &*(char *)(_o + 0x0)
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x0) = E;
+ ((uw_object_hdr_t *)_o)->type_flags_low = (byte)E;
|
- *(char *)((byte *)_o + 0x0) = E;
+ ((uw_object_hdr_t *)_o)->type_flags_low = (byte)E;
|
- ((char *)_o)[0x0] = E;
+ ((uw_object_hdr_t *)_o)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)_o + 0x0) = E;
+ ((uw_object_hdr_t *)_o)->type_flags_low = (byte)E;
|
- *(char *)_o = E;
+ ((uw_object_hdr_t *)_o)->type_flags_low = (byte)E;
|
- *(char *)(_o + 0x0) = E;
+ ((uw_object_hdr_t *)_o)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x0)
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- *(char *)((byte *)_o + 0x0)
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- ((char *)_o)[0x0]
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- *(char *)((ushort *)_o + 0x0)
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- (char)((ushort *)_o)[0x0]
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- *(char *)_o
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- *(char *)(_o + 0x0)
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
|
- (char)_o[0x0]
+ (char)((uw_object_hdr_t *)_o)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->type_flags_high
|
- *(byte *)((byte *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->type_flags_high
|
- ((byte *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->type_flags_high
|
- *(undefined1 *)((byte *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->type_flags_high
|
- ((undefined1 *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->type_flags_high
)
...>
}


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x1)
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_high
|
- &*(char *)((byte *)_o + 0x1)
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_high
|
- &((char *)_o)[0x1]
+ (char *)&((uw_object_hdr_t *)_o)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x1) = E;
+ ((uw_object_hdr_t *)_o)->type_flags_high = (byte)E;
|
- *(char *)((byte *)_o + 0x1) = E;
+ ((uw_object_hdr_t *)_o)->type_flags_high = (byte)E;
|
- ((char *)_o)[0x1] = E;
+ ((uw_object_hdr_t *)_o)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x1)
+ (char)((uw_object_hdr_t *)_o)->type_flags_high
|
- *(char *)((byte *)_o + 0x1)
+ (char)((uw_object_hdr_t *)_o)->type_flags_high
|
- ((char *)_o)[0x1]
+ (char)((uw_object_hdr_t *)_o)->type_flags_high
)
...>
}


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x2) = (char)V;
- *(char *)((char *)_o + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x2) = (char)V;
- *(byte *)((char *)_o + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x2) = (byte)V;
- *(char *)((char *)_o + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x2) = (byte)V;
- *(byte *)((char *)_o + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(ushort *)((byte *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word
|
- ((ushort *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(ushort *)((ushort *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(ushort *)(_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word
|
- _o[0x1]
+ ((uw_object_hdr_t *)_o)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(undefined2 *)((byte *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word
|
- ((undefined2 *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(undefined2 *)((undefined2 *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word
|
- *(undefined2 *)(_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word
|
- _o[0x1]
+ ((uw_object_hdr_t *)_o)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word_signed
|
- *(short *)((byte *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word_signed
|
- ((short *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->position_word_signed
|
- *(short *)((short *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word_signed
|
- *(short *)(_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- *(byte *)((byte *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- ((byte *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- *(byte *)((ushort *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- (byte)((ushort *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- *(byte *)(_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- (byte)_o[0x1]
+ ((uw_object_hdr_t *)_o)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- *(undefined1 *)((byte *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- ((undefined1 *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- *(undefined1 *)((ushort *)_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- (undefined1)((ushort *)_o)[0x1]
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- *(undefined1 *)(_o + 0x1)
+ ((uw_object_hdr_t *)_o)->position_word_low
|
- (undefined1)_o[0x1]
+ ((uw_object_hdr_t *)_o)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x2)
+ (char *)&((uw_object_hdr_t *)_o)->position_word_low
|
- &*(char *)((byte *)_o + 0x2)
+ (char *)&((uw_object_hdr_t *)_o)->position_word_low
|
- &((char *)_o)[0x2]
+ (char *)&((uw_object_hdr_t *)_o)->position_word_low
|
- &*(char *)((ushort *)_o + 0x1)
+ (char *)&((uw_object_hdr_t *)_o)->position_word_low
|
- &*(char *)(_o + 0x1)
+ (char *)&((uw_object_hdr_t *)_o)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x2) = E;
+ ((uw_object_hdr_t *)_o)->position_word_low = (byte)E;
|
- *(char *)((byte *)_o + 0x2) = E;
+ ((uw_object_hdr_t *)_o)->position_word_low = (byte)E;
|
- ((char *)_o)[0x2] = E;
+ ((uw_object_hdr_t *)_o)->position_word_low = (byte)E;
|
- *(char *)((ushort *)_o + 0x1) = E;
+ ((uw_object_hdr_t *)_o)->position_word_low = (byte)E;
|
- *(char *)(_o + 0x1) = E;
+ ((uw_object_hdr_t *)_o)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x2)
+ (char)((uw_object_hdr_t *)_o)->position_word_low
|
- *(char *)((byte *)_o + 0x2)
+ (char)((uw_object_hdr_t *)_o)->position_word_low
|
- ((char *)_o)[0x2]
+ (char)((uw_object_hdr_t *)_o)->position_word_low
|
- *(char *)((ushort *)_o + 0x1)
+ (char)((uw_object_hdr_t *)_o)->position_word_low
|
- (char)((ushort *)_o)[0x1]
+ (char)((uw_object_hdr_t *)_o)->position_word_low
|
- *(char *)(_o + 0x1)
+ (char)((uw_object_hdr_t *)_o)->position_word_low
|
- (char)_o[0x1]
+ (char)((uw_object_hdr_t *)_o)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->position_word_high
|
- *(byte *)((byte *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->position_word_high
|
- ((byte *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->position_word_high
)
...>
}


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->position_word_high
|
- *(undefined1 *)((byte *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->position_word_high
|
- ((undefined1 *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->position_word_high
)
...>
}


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x3)
+ (char *)&((uw_object_hdr_t *)_o)->position_word_high
|
- &*(char *)((byte *)_o + 0x3)
+ (char *)&((uw_object_hdr_t *)_o)->position_word_high
|
- &((char *)_o)[0x3]
+ (char *)&((uw_object_hdr_t *)_o)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x3) = E;
+ ((uw_object_hdr_t *)_o)->position_word_high = (byte)E;
|
- *(char *)((byte *)_o + 0x3) = E;
+ ((uw_object_hdr_t *)_o)->position_word_high = (byte)E;
|
- ((char *)_o)[0x3] = E;
+ ((uw_object_hdr_t *)_o)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x3)
+ (char)((uw_object_hdr_t *)_o)->position_word_high
|
- *(char *)((byte *)_o + 0x3)
+ (char)((uw_object_hdr_t *)_o)->position_word_high
|
- ((char *)_o)[0x3]
+ (char)((uw_object_hdr_t *)_o)->position_word_high
)
...>
}


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x4) = (char)V;
- *(char *)((char *)_o + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x4) = (char)V;
- *(byte *)((char *)_o + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x4) = (byte)V;
- *(char *)((char *)_o + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x4) = (byte)V;
- *(byte *)((char *)_o + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(ushort *)((byte *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- ((ushort *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(ushort *)((ushort *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(ushort *)(_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- _o[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(undefined2 *)((byte *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- ((undefined2 *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(undefined2 *)((undefined2 *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- *(undefined2 *)(_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word
|
- _o[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word_signed
|
- *(short *)((byte *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word_signed
|
- ((short *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word_signed
|
- *(short *)((short *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word_signed
|
- *(short *)(_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- *(byte *)((byte *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- ((byte *)_o)[0x4]
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- *(byte *)((ushort *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- (byte)((ushort *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- *(byte *)(_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- (byte)_o[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- *(undefined1 *)((byte *)_o + 0x4)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- ((undefined1 *)_o)[0x4]
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- *(undefined1 *)((ushort *)_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- (undefined1)((ushort *)_o)[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- *(undefined1 *)(_o + 0x2)
+ ((uw_object_hdr_t *)_o)->chain_word_low
|
- (undefined1)_o[0x2]
+ ((uw_object_hdr_t *)_o)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x4)
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_low
|
- &*(char *)((byte *)_o + 0x4)
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_low
|
- &((char *)_o)[0x4]
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_low
|
- &*(char *)((ushort *)_o + 0x2)
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_low
|
- &*(char *)(_o + 0x2)
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x4) = E;
+ ((uw_object_hdr_t *)_o)->chain_word_low = (byte)E;
|
- *(char *)((byte *)_o + 0x4) = E;
+ ((uw_object_hdr_t *)_o)->chain_word_low = (byte)E;
|
- ((char *)_o)[0x4] = E;
+ ((uw_object_hdr_t *)_o)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)_o + 0x2) = E;
+ ((uw_object_hdr_t *)_o)->chain_word_low = (byte)E;
|
- *(char *)(_o + 0x2) = E;
+ ((uw_object_hdr_t *)_o)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x4)
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
|
- *(char *)((byte *)_o + 0x4)
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
|
- ((char *)_o)[0x4]
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
|
- *(char *)((ushort *)_o + 0x2)
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
|
- (char)((ushort *)_o)[0x2]
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
|
- *(char *)(_o + 0x2)
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
|
- (char)_o[0x2]
+ (char)((uw_object_hdr_t *)_o)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x5)
+ ((uw_object_hdr_t *)_o)->chain_word_high
|
- *(byte *)((byte *)_o + 0x5)
+ ((uw_object_hdr_t *)_o)->chain_word_high
|
- ((byte *)_o)[0x5]
+ ((uw_object_hdr_t *)_o)->chain_word_high
)
...>
}


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x5)
+ ((uw_object_hdr_t *)_o)->chain_word_high
|
- *(undefined1 *)((byte *)_o + 0x5)
+ ((uw_object_hdr_t *)_o)->chain_word_high
|
- ((undefined1 *)_o)[0x5]
+ ((uw_object_hdr_t *)_o)->chain_word_high
)
...>
}


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x5)
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_high
|
- &*(char *)((byte *)_o + 0x5)
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_high
|
- &((char *)_o)[0x5]
+ (char *)&((uw_object_hdr_t *)_o)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x5) = E;
+ ((uw_object_hdr_t *)_o)->chain_word_high = (byte)E;
|
- *(char *)((byte *)_o + 0x5) = E;
+ ((uw_object_hdr_t *)_o)->chain_word_high = (byte)E;
|
- ((char *)_o)[0x5] = E;
+ ((uw_object_hdr_t *)_o)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x5)
+ (char)((uw_object_hdr_t *)_o)->chain_word_high
|
- *(char *)((byte *)_o + 0x5)
+ (char)((uw_object_hdr_t *)_o)->chain_word_high
|
- ((char *)_o)[0x5]
+ (char)((uw_object_hdr_t *)_o)->chain_word_high
)
...>
}


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x6) = (char)V;
- *(char *)((char *)_o + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)_o + 0x6) = (char)V;
- *(byte *)((char *)_o + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x6) = (byte)V;
- *(char *)((char *)_o + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)_o)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)_o + 0x6) = (byte)V;
- *(byte *)((char *)_o + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)_o)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(ushort *)((byte *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word
|
- ((ushort *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(ushort *)((ushort *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(ushort *)(_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word
|
- _o[0x3]
+ ((uw_object_hdr_t *)_o)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(undefined2 *)((byte *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word
|
- ((undefined2 *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(undefined2 *)((undefined2 *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word
|
- *(undefined2 *)(_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word
|
- _o[0x3]
+ ((uw_object_hdr_t *)_o)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word_signed
|
- *(short *)((byte *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word_signed
|
- ((short *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->link_word_signed
|
- *(short *)((short *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word_signed
|
- *(short *)(_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- *(byte *)((byte *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- ((byte *)_o)[0x6]
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- *(byte *)((ushort *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- (byte)((ushort *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- *(byte *)(_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- (byte)_o[0x3]
+ ((uw_object_hdr_t *)_o)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- *(undefined1 *)((byte *)_o + 0x6)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- ((undefined1 *)_o)[0x6]
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- *(undefined1 *)((ushort *)_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- (undefined1)((ushort *)_o)[0x3]
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- *(undefined1 *)(_o + 0x3)
+ ((uw_object_hdr_t *)_o)->link_word_low
|
- (undefined1)_o[0x3]
+ ((uw_object_hdr_t *)_o)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x6)
+ (char *)&((uw_object_hdr_t *)_o)->link_word_low
|
- &*(char *)((byte *)_o + 0x6)
+ (char *)&((uw_object_hdr_t *)_o)->link_word_low
|
- &((char *)_o)[0x6]
+ (char *)&((uw_object_hdr_t *)_o)->link_word_low
|
- &*(char *)((ushort *)_o + 0x3)
+ (char *)&((uw_object_hdr_t *)_o)->link_word_low
|
- &*(char *)(_o + 0x3)
+ (char *)&((uw_object_hdr_t *)_o)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x6) = E;
+ ((uw_object_hdr_t *)_o)->link_word_low = (byte)E;
|
- *(char *)((byte *)_o + 0x6) = E;
+ ((uw_object_hdr_t *)_o)->link_word_low = (byte)E;
|
- ((char *)_o)[0x6] = E;
+ ((uw_object_hdr_t *)_o)->link_word_low = (byte)E;
|
- *(char *)((ushort *)_o + 0x3) = E;
+ ((uw_object_hdr_t *)_o)->link_word_low = (byte)E;
|
- *(char *)(_o + 0x3) = E;
+ ((uw_object_hdr_t *)_o)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x6)
+ (char)((uw_object_hdr_t *)_o)->link_word_low
|
- *(char *)((byte *)_o + 0x6)
+ (char)((uw_object_hdr_t *)_o)->link_word_low
|
- ((char *)_o)[0x6]
+ (char)((uw_object_hdr_t *)_o)->link_word_low
|
- *(char *)((ushort *)_o + 0x3)
+ (char)((uw_object_hdr_t *)_o)->link_word_low
|
- (char)((ushort *)_o)[0x3]
+ (char)((uw_object_hdr_t *)_o)->link_word_low
|
- *(char *)(_o + 0x3)
+ (char)((uw_object_hdr_t *)_o)->link_word_low
|
- (char)_o[0x3]
+ (char)((uw_object_hdr_t *)_o)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)_o + 0x7)
+ ((uw_object_hdr_t *)_o)->link_word_high
|
- *(byte *)((byte *)_o + 0x7)
+ ((uw_object_hdr_t *)_o)->link_word_high
|
- ((byte *)_o)[0x7]
+ ((uw_object_hdr_t *)_o)->link_word_high
)
...>
}


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)_o + 0x7)
+ ((uw_object_hdr_t *)_o)->link_word_high
|
- *(undefined1 *)((byte *)_o + 0x7)
+ ((uw_object_hdr_t *)_o)->link_word_high
|
- ((undefined1 *)_o)[0x7]
+ ((uw_object_hdr_t *)_o)->link_word_high
)
...>
}


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)_o + 0x7)
+ (char *)&((uw_object_hdr_t *)_o)->link_word_high
|
- &*(char *)((byte *)_o + 0x7)
+ (char *)&((uw_object_hdr_t *)_o)->link_word_high
|
- &((char *)_o)[0x7]
+ (char *)&((uw_object_hdr_t *)_o)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x7) = E;
+ ((uw_object_hdr_t *)_o)->link_word_high = (byte)E;
|
- *(char *)((byte *)_o + 0x7) = E;
+ ((uw_object_hdr_t *)_o)->link_word_high = (byte)E;
|
- ((char *)_o)[0x7] = E;
+ ((uw_object_hdr_t *)_o)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)_o + 0x7)
+ (char)((uw_object_hdr_t *)_o)->link_word_high
|
- *(char *)((byte *)_o + 0x7)
+ (char)((uw_object_hdr_t *)_o)->link_word_high
|
- ((char *)_o)[0x7]
+ (char)((uw_object_hdr_t *)_o)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x0) = (char)V;
- *(char *)((char *)equipped + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x0) = (char)V;
- *(byte *)((char *)equipped + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x0) = (byte)V;
- *(char *)((char *)equipped + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x0) = (byte)V;
- *(byte *)((char *)equipped + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(ushort *)((byte *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- ((ushort *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(ushort *)((ushort *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(ushort *)(equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- equipped[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *equipped
+ ((uw_object_hdr_t *)equipped)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(undefined2 *)((byte *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- ((undefined2 *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(undefined2 *)((undefined2 *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(undefined2 *)(equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- equipped[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *equipped
+ ((uw_object_hdr_t *)equipped)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_signed
|
- *(short *)((byte *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_signed
|
- ((short *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_signed
|
- *(short *)((short *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_signed
|
- *(short *)(equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(byte *)((byte *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- ((byte *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(byte *)((ushort *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- (byte)((ushort *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(byte *)equipped
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(byte *)(equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- (byte)equipped[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(undefined1 *)((byte *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- ((undefined1 *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(undefined1 *)((ushort *)equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- (undefined1)((ushort *)equipped)[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(undefined1 *)equipped
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(undefined1 *)(equipped + 0x0)
+ ((uw_object_hdr_t *)equipped)->type_flags_low
|
- (undefined1)equipped[0x0]
+ ((uw_object_hdr_t *)equipped)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_low
|
- &*(char *)((byte *)equipped + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_low
|
- &((char *)equipped)[0x0]
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_low
|
- &*(char *)((ushort *)equipped + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_low
|
- &*(char *)equipped
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_low
|
- &*(char *)(equipped + 0x0)
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x0) = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_low = (byte)E;
|
- *(char *)((byte *)equipped + 0x0) = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_low = (byte)E;
|
- ((char *)equipped)[0x0] = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)equipped + 0x0) = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_low = (byte)E;
|
- *(char *)equipped = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_low = (byte)E;
|
- *(char *)(equipped + 0x0) = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x0)
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(char *)((byte *)equipped + 0x0)
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- ((char *)equipped)[0x0]
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(char *)((ushort *)equipped + 0x0)
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- (char)((ushort *)equipped)[0x0]
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(char *)equipped
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- *(char *)(equipped + 0x0)
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
|
- (char)equipped[0x0]
+ (char)((uw_object_hdr_t *)equipped)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->type_flags_high
|
- *(byte *)((byte *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->type_flags_high
|
- ((byte *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->type_flags_high
|
- *(undefined1 *)((byte *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->type_flags_high
|
- ((undefined1 *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->type_flags_high
)
...>
}


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_high
|
- &*(char *)((byte *)equipped + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_high
|
- &((char *)equipped)[0x1]
+ (char *)&((uw_object_hdr_t *)equipped)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x1) = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_high = (byte)E;
|
- *(char *)((byte *)equipped + 0x1) = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_high = (byte)E;
|
- ((char *)equipped)[0x1] = E;
+ ((uw_object_hdr_t *)equipped)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x1)
+ (char)((uw_object_hdr_t *)equipped)->type_flags_high
|
- *(char *)((byte *)equipped + 0x1)
+ (char)((uw_object_hdr_t *)equipped)->type_flags_high
|
- ((char *)equipped)[0x1]
+ (char)((uw_object_hdr_t *)equipped)->type_flags_high
)
...>
}


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x2) = (char)V;
- *(char *)((char *)equipped + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x2) = (char)V;
- *(byte *)((char *)equipped + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x2) = (byte)V;
- *(char *)((char *)equipped + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x2) = (byte)V;
- *(byte *)((char *)equipped + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- *(ushort *)((byte *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- ((ushort *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word
|
- *(ushort *)((ushort *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- *(ushort *)(equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- equipped[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- *(undefined2 *)((byte *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- ((undefined2 *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word
|
- *(undefined2 *)((undefined2 *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- *(undefined2 *)(equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- equipped[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word_signed
|
- *(short *)((byte *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word_signed
|
- ((short *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word_signed
|
- *(short *)((short *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word_signed
|
- *(short *)(equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- *(byte *)((byte *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- ((byte *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- *(byte *)((ushort *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- (byte)((ushort *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- *(byte *)(equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- (byte)equipped[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- *(undefined1 *)((byte *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- ((undefined1 *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- *(undefined1 *)((ushort *)equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- (undefined1)((ushort *)equipped)[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- *(undefined1 *)(equipped + 0x1)
+ ((uw_object_hdr_t *)equipped)->position_word_low
|
- (undefined1)equipped[0x1]
+ ((uw_object_hdr_t *)equipped)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_low
|
- &*(char *)((byte *)equipped + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_low
|
- &((char *)equipped)[0x2]
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_low
|
- &*(char *)((ushort *)equipped + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_low
|
- &*(char *)(equipped + 0x1)
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x2) = E;
+ ((uw_object_hdr_t *)equipped)->position_word_low = (byte)E;
|
- *(char *)((byte *)equipped + 0x2) = E;
+ ((uw_object_hdr_t *)equipped)->position_word_low = (byte)E;
|
- ((char *)equipped)[0x2] = E;
+ ((uw_object_hdr_t *)equipped)->position_word_low = (byte)E;
|
- *(char *)((ushort *)equipped + 0x1) = E;
+ ((uw_object_hdr_t *)equipped)->position_word_low = (byte)E;
|
- *(char *)(equipped + 0x1) = E;
+ ((uw_object_hdr_t *)equipped)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x2)
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
|
- *(char *)((byte *)equipped + 0x2)
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
|
- ((char *)equipped)[0x2]
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
|
- *(char *)((ushort *)equipped + 0x1)
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
|
- (char)((ushort *)equipped)[0x1]
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
|
- *(char *)(equipped + 0x1)
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
|
- (char)equipped[0x1]
+ (char)((uw_object_hdr_t *)equipped)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->position_word_high
|
- *(byte *)((byte *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->position_word_high
|
- ((byte *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->position_word_high
)
...>
}


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->position_word_high
|
- *(undefined1 *)((byte *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->position_word_high
|
- ((undefined1 *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->position_word_high
)
...>
}


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_high
|
- &*(char *)((byte *)equipped + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_high
|
- &((char *)equipped)[0x3]
+ (char *)&((uw_object_hdr_t *)equipped)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x3) = E;
+ ((uw_object_hdr_t *)equipped)->position_word_high = (byte)E;
|
- *(char *)((byte *)equipped + 0x3) = E;
+ ((uw_object_hdr_t *)equipped)->position_word_high = (byte)E;
|
- ((char *)equipped)[0x3] = E;
+ ((uw_object_hdr_t *)equipped)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x3)
+ (char)((uw_object_hdr_t *)equipped)->position_word_high
|
- *(char *)((byte *)equipped + 0x3)
+ (char)((uw_object_hdr_t *)equipped)->position_word_high
|
- ((char *)equipped)[0x3]
+ (char)((uw_object_hdr_t *)equipped)->position_word_high
)
...>
}


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x4) = (char)V;
- *(char *)((char *)equipped + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x4) = (char)V;
- *(byte *)((char *)equipped + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x4) = (byte)V;
- *(char *)((char *)equipped + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x4) = (byte)V;
- *(byte *)((char *)equipped + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- *(ushort *)((byte *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- ((ushort *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- *(ushort *)((ushort *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- *(ushort *)(equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- equipped[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- *(undefined2 *)((byte *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- ((undefined2 *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- *(undefined2 *)((undefined2 *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- *(undefined2 *)(equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- equipped[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word_signed
|
- *(short *)((byte *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word_signed
|
- ((short *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word_signed
|
- *(short *)((short *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word_signed
|
- *(short *)(equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(byte *)((byte *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- ((byte *)equipped)[0x4]
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(byte *)((ushort *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- (byte)((ushort *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(byte *)(equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- (byte)equipped[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(undefined1 *)((byte *)equipped + 0x4)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- ((undefined1 *)equipped)[0x4]
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(undefined1 *)((ushort *)equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- (undefined1)((ushort *)equipped)[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(undefined1 *)(equipped + 0x2)
+ ((uw_object_hdr_t *)equipped)->chain_word_low
|
- (undefined1)equipped[0x2]
+ ((uw_object_hdr_t *)equipped)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x4)
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_low
|
- &*(char *)((byte *)equipped + 0x4)
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_low
|
- &((char *)equipped)[0x4]
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_low
|
- &*(char *)((ushort *)equipped + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_low
|
- &*(char *)(equipped + 0x2)
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x4) = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_low = (byte)E;
|
- *(char *)((byte *)equipped + 0x4) = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_low = (byte)E;
|
- ((char *)equipped)[0x4] = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)equipped + 0x2) = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_low = (byte)E;
|
- *(char *)(equipped + 0x2) = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x4)
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(char *)((byte *)equipped + 0x4)
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
|
- ((char *)equipped)[0x4]
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(char *)((ushort *)equipped + 0x2)
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
|
- (char)((ushort *)equipped)[0x2]
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
|
- *(char *)(equipped + 0x2)
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
|
- (char)equipped[0x2]
+ (char)((uw_object_hdr_t *)equipped)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x5)
+ ((uw_object_hdr_t *)equipped)->chain_word_high
|
- *(byte *)((byte *)equipped + 0x5)
+ ((uw_object_hdr_t *)equipped)->chain_word_high
|
- ((byte *)equipped)[0x5]
+ ((uw_object_hdr_t *)equipped)->chain_word_high
)
...>
}


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x5)
+ ((uw_object_hdr_t *)equipped)->chain_word_high
|
- *(undefined1 *)((byte *)equipped + 0x5)
+ ((uw_object_hdr_t *)equipped)->chain_word_high
|
- ((undefined1 *)equipped)[0x5]
+ ((uw_object_hdr_t *)equipped)->chain_word_high
)
...>
}


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x5)
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_high
|
- &*(char *)((byte *)equipped + 0x5)
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_high
|
- &((char *)equipped)[0x5]
+ (char *)&((uw_object_hdr_t *)equipped)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x5) = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_high = (byte)E;
|
- *(char *)((byte *)equipped + 0x5) = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_high = (byte)E;
|
- ((char *)equipped)[0x5] = E;
+ ((uw_object_hdr_t *)equipped)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x5)
+ (char)((uw_object_hdr_t *)equipped)->chain_word_high
|
- *(char *)((byte *)equipped + 0x5)
+ (char)((uw_object_hdr_t *)equipped)->chain_word_high
|
- ((char *)equipped)[0x5]
+ (char)((uw_object_hdr_t *)equipped)->chain_word_high
)
...>
}


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x6) = (char)V;
- *(char *)((char *)equipped + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)equipped + 0x6) = (char)V;
- *(byte *)((char *)equipped + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x6) = (byte)V;
- *(char *)((char *)equipped + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)equipped + 0x6) = (byte)V;
- *(byte *)((char *)equipped + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)equipped)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- *(ushort *)((byte *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- ((ushort *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word
|
- *(ushort *)((ushort *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- *(ushort *)(equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- equipped[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- *(undefined2 *)((byte *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- ((undefined2 *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word
|
- *(undefined2 *)((undefined2 *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- *(undefined2 *)(equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- equipped[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word_signed
|
- *(short *)((byte *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word_signed
|
- ((short *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word_signed
|
- *(short *)((short *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word_signed
|
- *(short *)(equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- *(byte *)((byte *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- ((byte *)equipped)[0x6]
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- *(byte *)((ushort *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- (byte)((ushort *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- *(byte *)(equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- (byte)equipped[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- *(undefined1 *)((byte *)equipped + 0x6)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- ((undefined1 *)equipped)[0x6]
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- *(undefined1 *)((ushort *)equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- (undefined1)((ushort *)equipped)[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- *(undefined1 *)(equipped + 0x3)
+ ((uw_object_hdr_t *)equipped)->link_word_low
|
- (undefined1)equipped[0x3]
+ ((uw_object_hdr_t *)equipped)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x6)
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_low
|
- &*(char *)((byte *)equipped + 0x6)
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_low
|
- &((char *)equipped)[0x6]
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_low
|
- &*(char *)((ushort *)equipped + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_low
|
- &*(char *)(equipped + 0x3)
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x6) = E;
+ ((uw_object_hdr_t *)equipped)->link_word_low = (byte)E;
|
- *(char *)((byte *)equipped + 0x6) = E;
+ ((uw_object_hdr_t *)equipped)->link_word_low = (byte)E;
|
- ((char *)equipped)[0x6] = E;
+ ((uw_object_hdr_t *)equipped)->link_word_low = (byte)E;
|
- *(char *)((ushort *)equipped + 0x3) = E;
+ ((uw_object_hdr_t *)equipped)->link_word_low = (byte)E;
|
- *(char *)(equipped + 0x3) = E;
+ ((uw_object_hdr_t *)equipped)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x6)
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
|
- *(char *)((byte *)equipped + 0x6)
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
|
- ((char *)equipped)[0x6]
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
|
- *(char *)((ushort *)equipped + 0x3)
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
|
- (char)((ushort *)equipped)[0x3]
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
|
- *(char *)(equipped + 0x3)
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
|
- (char)equipped[0x3]
+ (char)((uw_object_hdr_t *)equipped)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)equipped + 0x7)
+ ((uw_object_hdr_t *)equipped)->link_word_high
|
- *(byte *)((byte *)equipped + 0x7)
+ ((uw_object_hdr_t *)equipped)->link_word_high
|
- ((byte *)equipped)[0x7]
+ ((uw_object_hdr_t *)equipped)->link_word_high
)
...>
}


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)equipped + 0x7)
+ ((uw_object_hdr_t *)equipped)->link_word_high
|
- *(undefined1 *)((byte *)equipped + 0x7)
+ ((uw_object_hdr_t *)equipped)->link_word_high
|
- ((undefined1 *)equipped)[0x7]
+ ((uw_object_hdr_t *)equipped)->link_word_high
)
...>
}


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)equipped + 0x7)
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_high
|
- &*(char *)((byte *)equipped + 0x7)
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_high
|
- &((char *)equipped)[0x7]
+ (char *)&((uw_object_hdr_t *)equipped)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x7) = E;
+ ((uw_object_hdr_t *)equipped)->link_word_high = (byte)E;
|
- *(char *)((byte *)equipped + 0x7) = E;
+ ((uw_object_hdr_t *)equipped)->link_word_high = (byte)E;
|
- ((char *)equipped)[0x7] = E;
+ ((uw_object_hdr_t *)equipped)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)equipped + 0x7)
+ (char)((uw_object_hdr_t *)equipped)->link_word_high
|
- *(char *)((byte *)equipped + 0x7)
+ (char)((uw_object_hdr_t *)equipped)->link_word_high
|
- ((char *)equipped)[0x7]
+ (char)((uw_object_hdr_t *)equipped)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
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

@receiver_2_w_0_0_pair_char_byte@
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

@receiver_2_w_0_0_pair_byte_char@
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

@receiver_2_w_0_0_pair_byte_byte@
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- puVar5[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(undefined2 *)((byte *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- ((undefined2 *)puVar5)[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(undefined2 *)(puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- puVar5[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- (byte)puVar5[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar5 + 0x0)
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
|
- (undefined1)puVar5[0x0]
+ ((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_low
|
- &*(char *)((byte *)puVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_low
|
- &((char *)puVar5)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_low
|
- &*(char *)((ushort *)puVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_low
|
- &*(char *)puVar5
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_low
|
- &*(char *)(puVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x0)
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
|
- (char)puVar5[0x0]
+ (char)((uw_object_hdr_t *)puVar5)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_high
|
- &*(char *)((byte *)puVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_high
|
- &((char *)puVar5)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar5)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_pair_char_char@
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

@receiver_2_w_2_17_pair_char_byte@
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

@receiver_2_w_2_17_pair_byte_char@
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

@receiver_2_w_2_17_pair_byte_byte@
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

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- puVar5[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- *(undefined2 *)((byte *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- ((undefined2 *)puVar5)[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- *(undefined2 *)((undefined2 *)puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- *(undefined2 *)(puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- puVar5[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- (byte)puVar5[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar5 + 0x1)
+ ((uw_object_hdr_t *)puVar5)->position_word_low
|
- (undefined1)puVar5[0x1]
+ ((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_low
|
- &*(char *)((byte *)puVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_low
|
- &((char *)puVar5)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_low
|
- &*(char *)((ushort *)puVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_low
|
- &*(char *)(puVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x1)
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
|
- (char)puVar5[0x1]
+ (char)((uw_object_hdr_t *)puVar5)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_high
|
- &*(char *)((byte *)puVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_high
|
- &((char *)puVar5)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar5)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_pair_char_char@
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

@receiver_2_w_4_34_pair_char_byte@
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

@receiver_2_w_4_34_pair_byte_char@
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

@receiver_2_w_4_34_pair_byte_byte@
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

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- puVar5[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- *(undefined2 *)((byte *)puVar5 + 0x4)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- ((undefined2 *)puVar5)[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- *(undefined2 *)(puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- puVar5[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- (byte)puVar5[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar5 + 0x2)
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
|
- (undefined1)puVar5[0x2]
+ ((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_low
|
- &*(char *)((byte *)puVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_low
|
- &((char *)puVar5)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_low
|
- &*(char *)((ushort *)puVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_low
|
- &*(char *)(puVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x2)
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
|
- (char)puVar5[0x2]
+ (char)((uw_object_hdr_t *)puVar5)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_high
|
- &*(char *)((byte *)puVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_high
|
- &((char *)puVar5)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar5)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_pair_char_char@
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

@receiver_2_w_6_51_pair_char_byte@
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

@receiver_2_w_6_51_pair_byte_char@
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

@receiver_2_w_6_51_pair_byte_byte@
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

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- puVar5[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- *(undefined2 *)((byte *)puVar5 + 0x6)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- ((undefined2 *)puVar5)[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- *(undefined2 *)((undefined2 *)puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- *(undefined2 *)(puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- puVar5[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- (byte)puVar5[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar5 + 0x3)
+ ((uw_object_hdr_t *)puVar5)->link_word_low
|
- (undefined1)puVar5[0x3]
+ ((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_low
|
- &*(char *)((byte *)puVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_low
|
- &((char *)puVar5)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_low
|
- &*(char *)((ushort *)puVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_low
|
- &*(char *)(puVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar5 + 0x3)
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
|
- (char)puVar5[0x3]
+ (char)((uw_object_hdr_t *)puVar5)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_high
|
- &*(char *)((byte *)puVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_high
|
- &((char *)puVar5)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar5)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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

@receiver_3_w_0_0_pair_char_byte@
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

@receiver_3_w_0_0_pair_byte_char@
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

@receiver_3_w_0_0_pair_byte_byte@
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

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(undefined2 *)((byte *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- ((undefined2 *)pNewObj)[0x0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(undefined2 *)((undefined2 *)pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(undefined2 *)(pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &*(char *)((byte *)pNewObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &((char *)pNewObj)[0x0]
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &*(char *)((ushort *)pNewObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &*(char *)pNewObj
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &*(char *)(pNewObj + 0x0)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &pNewObj[0x0]
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- &*pNewObj
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x0) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
|
- pNewObj[0x0] = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
|
- *pNewObj = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x0)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- pNewObj[0x0]
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
|
- *pNewObj
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- &*(char *)((byte *)pNewObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- &((char *)pNewObj)[0x1]
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- &*(char *)(pNewObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- &pNewObj[0x1]
+ (char *)&((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x1) = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high = (byte)E;
|
- pNewObj[0x1] = E;
+ ((uw_object_hdr_t *)pNewObj)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x1)
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_high
|
- pNewObj[0x1]
+ (char)((uw_object_hdr_t *)pNewObj)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
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

@receiver_3_w_2_17_pair_char_byte@
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

@receiver_3_w_2_17_pair_byte_char@
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

@receiver_3_w_2_17_pair_byte_byte@
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

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- *(undefined2 *)((byte *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- ((undefined2 *)pNewObj)[0x1]
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- *(undefined2 *)((undefined2 *)pNewObj + 0x1)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- *(undefined2 *)(pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_low
|
- &*(char *)((byte *)pNewObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_low
|
- &((char *)pNewObj)[0x2]
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_low
|
- &*(char *)((ushort *)pNewObj + 0x1)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_low
|
- &*(char *)(pNewObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_low
|
- &pNewObj[0x2]
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x2) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_low = (byte)E;
|
- pNewObj[0x2] = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x2)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
|
- pNewObj[0x2]
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_high
|
- &*(char *)((byte *)pNewObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_high
|
- &((char *)pNewObj)[0x3]
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_high
|
- &*(char *)(pNewObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_high
|
- &pNewObj[0x3]
+ (char *)&((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x3) = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)E;
|
- pNewObj[0x3] = E;
+ ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x3)
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_high
|
- pNewObj[0x3]
+ (char)((uw_object_hdr_t *)pNewObj)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
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

@receiver_3_w_4_34_pair_char_byte@
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

@receiver_3_w_4_34_pair_byte_char@
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

@receiver_3_w_4_34_pair_byte_byte@
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

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- *(undefined2 *)((byte *)pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- ((undefined2 *)pNewObj)[0x2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- *(undefined2 *)((undefined2 *)pNewObj + 0x2)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- *(undefined2 *)(pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- &*(char *)((byte *)pNewObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- &((char *)pNewObj)[0x4]
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- &*(char *)((ushort *)pNewObj + 0x2)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- &*(char *)(pNewObj + 0x4)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- &pNewObj[0x4]
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x4) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low = (byte)E;
|
- pNewObj[0x4] = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x4)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
|
- pNewObj[0x4]
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x5)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x5)
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- &*(char *)((byte *)pNewObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- &((char *)pNewObj)[0x5]
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- &*(char *)(pNewObj + 0x5)
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- &pNewObj[0x5]
+ (char *)&((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x5) = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high = (byte)E;
|
- pNewObj[0x5] = E;
+ ((uw_object_hdr_t *)pNewObj)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x5)
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_high
|
- pNewObj[0x5]
+ (char)((uw_object_hdr_t *)pNewObj)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
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

@receiver_3_w_6_51_pair_char_byte@
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

@receiver_3_w_6_51_pair_byte_char@
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

@receiver_3_w_6_51_pair_byte_byte@
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

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- *(undefined2 *)((byte *)pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- ((undefined2 *)pNewObj)[0x3]
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- *(undefined2 *)((undefined2 *)pNewObj + 0x3)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- *(undefined2 *)(pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x6)
+ ((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_low
|
- &*(char *)((byte *)pNewObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_low
|
- &((char *)pNewObj)[0x6]
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_low
|
- &*(char *)((ushort *)pNewObj + 0x3)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_low
|
- &*(char *)(pNewObj + 0x6)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_low
|
- &pNewObj[0x6]
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x6) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_low = (byte)E;
|
- pNewObj[0x6] = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x6)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
|
- pNewObj[0x6]
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(pNewObj + 0x7)
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(pNewObj + 0x7)
+ ((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pNewObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_high
|
- &*(char *)((byte *)pNewObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_high
|
- &((char *)pNewObj)[0x7]
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_high
|
- &*(char *)(pNewObj + 0x7)
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_high
|
- &pNewObj[0x7]
+ (char *)&((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x7) = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_high = (byte)E;
|
- pNewObj[0x7] = E;
+ ((uw_object_hdr_t *)pNewObj)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(pNewObj + 0x7)
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_high
|
- pNewObj[0x7]
+ (char)((uw_object_hdr_t *)pNewObj)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((undefined2 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (byte)puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (undefined1)puVar6[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((byte *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &((char *)puVar6)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((ushort *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)puVar6
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)(puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (char)puVar6[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &*(char *)((byte *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &((char *)puVar6)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((undefined2 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
)
...>
}


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (byte)puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (undefined1)puVar6[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((byte *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &((char *)puVar6)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((ushort *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)(puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- (char)puVar6[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &*(char *)((byte *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &((char *)puVar6)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((undefined2 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
)
...>
}


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (byte)puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (undefined1)puVar6[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((byte *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &((char *)puVar6)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((ushort *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)(puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (char)puVar6[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &*(char *)((byte *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &((char *)puVar6)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
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

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((undefined2 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
)
...>
}


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (byte)puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (undefined1)puVar6[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((byte *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &((char *)puVar6)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((ushort *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)(puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- (char)puVar6[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &*(char *)((byte *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &((char *)puVar6)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
