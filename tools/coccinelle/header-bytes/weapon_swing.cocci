@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- found_item[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *found_item
+ ((uw_object_hdr_t *)found_item)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *(undefined2 *)((byte *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- ((undefined2 *)found_item)[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *(undefined2 *)((undefined2 *)found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *(undefined2 *)(found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- found_item[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *found_item
+ ((uw_object_hdr_t *)found_item)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- (byte)found_item[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(found_item + 0x0)
+ ((uw_object_hdr_t *)found_item)->type_flags_low
|
- (undefined1)found_item[0x0]
+ ((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x0)
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_low
|
- &*(char *)((byte *)found_item + 0x0)
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_low
|
- &((char *)found_item)[0x0]
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_low
|
- &*(char *)((ushort *)found_item + 0x0)
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_low
|
- &*(char *)found_item
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_low
|
- &*(char *)(found_item + 0x0)
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x0) = E;
+ ((uw_object_hdr_t *)found_item)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x0)
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
|
- (char)found_item[0x0]
+ (char)((uw_object_hdr_t *)found_item)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x1)
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_high
|
- &*(char *)((byte *)found_item + 0x1)
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_high
|
- &((char *)found_item)[0x1]
+ (char *)&((uw_object_hdr_t *)found_item)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- found_item[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- *(undefined2 *)((byte *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- ((undefined2 *)found_item)[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word
|
- *(undefined2 *)((undefined2 *)found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- *(undefined2 *)(found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- found_item[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- (byte)found_item[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(found_item + 0x1)
+ ((uw_object_hdr_t *)found_item)->position_word_low
|
- (undefined1)found_item[0x1]
+ ((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x2)
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_low
|
- &*(char *)((byte *)found_item + 0x2)
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_low
|
- &((char *)found_item)[0x2]
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_low
|
- &*(char *)((ushort *)found_item + 0x1)
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_low
|
- &*(char *)(found_item + 0x1)
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x1) = E;
+ ((uw_object_hdr_t *)found_item)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x1)
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
|
- (char)found_item[0x1]
+ (char)((uw_object_hdr_t *)found_item)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x3)
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_high
|
- &*(char *)((byte *)found_item + 0x3)
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_high
|
- &((char *)found_item)[0x3]
+ (char *)&((uw_object_hdr_t *)found_item)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- found_item[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- *(undefined2 *)((byte *)found_item + 0x4)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- ((undefined2 *)found_item)[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- *(undefined2 *)((undefined2 *)found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- *(undefined2 *)(found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- found_item[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- (byte)found_item[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(found_item + 0x2)
+ ((uw_object_hdr_t *)found_item)->chain_word_low
|
- (undefined1)found_item[0x2]
+ ((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x4)
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_low
|
- &*(char *)((byte *)found_item + 0x4)
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_low
|
- &((char *)found_item)[0x4]
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_low
|
- &*(char *)((ushort *)found_item + 0x2)
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_low
|
- &*(char *)(found_item + 0x2)
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x2) = E;
+ ((uw_object_hdr_t *)found_item)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x2)
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
|
- (char)found_item[0x2]
+ (char)((uw_object_hdr_t *)found_item)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x5)
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_high
|
- &*(char *)((byte *)found_item + 0x5)
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_high
|
- &((char *)found_item)[0x5]
+ (char *)&((uw_object_hdr_t *)found_item)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- found_item[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- *(undefined2 *)((byte *)found_item + 0x6)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- ((undefined2 *)found_item)[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word
|
- *(undefined2 *)((undefined2 *)found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- *(undefined2 *)(found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- found_item[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- (byte)found_item[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(found_item + 0x3)
+ ((uw_object_hdr_t *)found_item)->link_word_low
|
- (undefined1)found_item[0x3]
+ ((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x6)
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_low
|
- &*(char *)((byte *)found_item + 0x6)
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_low
|
- &((char *)found_item)[0x6]
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_low
|
- &*(char *)((ushort *)found_item + 0x3)
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_low
|
- &*(char *)(found_item + 0x3)
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x3) = E;
+ ((uw_object_hdr_t *)found_item)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(found_item + 0x3)
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
|
- (char)found_item[0x3]
+ (char)((uw_object_hdr_t *)found_item)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found_item + 0x7)
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_high
|
- &*(char *)((byte *)found_item + 0x7)
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_high
|
- &((char *)found_item)[0x7]
+ (char *)&((uw_object_hdr_t *)found_item)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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
