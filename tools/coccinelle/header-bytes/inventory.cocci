@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(undefined2 *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- ((undefined2 *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(undefined2 *)(puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- puVar1[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- puVar1[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)((byte *)puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &((char *)puVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)((ushort *)puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)puVar1
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)(puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- puVar1[0x1]
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- puVar1[0x1]
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
|
- &*(char *)((byte *)puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
|
- &((char *)puVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
|
- &*(char *)(puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(undefined2 *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- ((undefined2 *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(undefined2 *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- puVar1[0x2]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- puVar1[0x2]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &*(char *)((byte *)puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &((char *)puVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &*(char *)((ushort *)puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &*(char *)(puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- puVar1[0x3]
+ ((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- puVar1[0x3]
+ ((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
|
- &*(char *)((byte *)puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
|
- &((char *)puVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
|
- &*(char *)(puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(undefined2 *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- ((undefined2 *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(undefined2 *)(puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- puVar1[0x4]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- puVar1[0x4]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &*(char *)((byte *)puVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &((char *)puVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &*(char *)((ushort *)puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &*(char *)(puVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x4)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- puVar1[0x5]
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- puVar1[0x5]
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
|
- &*(char *)((byte *)puVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
|
- &((char *)puVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
|
- &*(char *)(puVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x5)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(undefined2 *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- ((undefined2 *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(undefined2 *)(puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- puVar1[0x6]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- puVar1[0x6]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &*(char *)((byte *)puVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &((char *)puVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &*(char *)((ushort *)puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &*(char *)(puVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x6)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- puVar1[0x7]
+ ((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- puVar1[0x7]
+ ((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
|
- &*(char *)((byte *)puVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
|
- &((char *)puVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
|
- &*(char *)(puVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar1 + 0x7)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(undefined2 *)((byte *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- ((undefined2 *)puVar7)[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(undefined2 *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (byte)puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar7 + 0x0)
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (undefined1)puVar7[0x0]
+ ((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)((byte *)puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &((char *)puVar7)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)((ushort *)puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)puVar7
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
|
- &*(char *)(puVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar7)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x0)
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
|
- (char)puVar7[0x0]
+ (char)((uw_object_hdr_t *)puVar7)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_high
|
- &*(char *)((byte *)puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_high
|
- &((char *)puVar7)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar7)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(undefined2 *)((byte *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- ((undefined2 *)puVar7)[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- *(undefined2 *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- (byte)puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar7 + 0x1)
+ ((uw_object_hdr_t *)puVar7)->position_word_low
|
- (undefined1)puVar7[0x1]
+ ((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &*(char *)((byte *)puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &((char *)puVar7)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &*(char *)((ushort *)puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
|
- &*(char *)(puVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar7)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x1)
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
|
- (char)puVar7[0x1]
+ (char)((uw_object_hdr_t *)puVar7)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_high
|
- &*(char *)((byte *)puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_high
|
- &((char *)puVar7)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar7)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(undefined2 *)((byte *)puVar7 + 0x4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- ((undefined2 *)puVar7)[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- *(undefined2 *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (byte)puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar7 + 0x2)
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (undefined1)puVar7[0x2]
+ ((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &*(char *)((byte *)puVar7 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &((char *)puVar7)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &*(char *)((ushort *)puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
|
- &*(char *)(puVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar7)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x2)
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
|
- (char)puVar7[0x2]
+ (char)((uw_object_hdr_t *)puVar7)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_high
|
- &*(char *)((byte *)puVar7 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_high
|
- &((char *)puVar7)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar7)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(undefined2 *)((byte *)puVar7 + 0x6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- ((undefined2 *)puVar7)[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(undefined2 *)((undefined2 *)puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- *(undefined2 *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- (byte)puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar7 + 0x3)
+ ((uw_object_hdr_t *)puVar7)->link_word_low
|
- (undefined1)puVar7[0x3]
+ ((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &*(char *)((byte *)puVar7 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &((char *)puVar7)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &*(char *)((ushort *)puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
|
- &*(char *)(puVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar7)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar7 + 0x3)
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
|
- (char)puVar7[0x3]
+ (char)((uw_object_hdr_t *)puVar7)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar7 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_high
|
- &*(char *)((byte *)puVar7 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_high
|
- &((char *)puVar7)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar7)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- puVar8[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(undefined2 *)((byte *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- ((undefined2 *)puVar8)[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(undefined2 *)(puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- puVar8[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- (byte)puVar8[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar8 + 0x0)
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
|
- (undefined1)puVar8[0x0]
+ ((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_low
|
- &*(char *)((byte *)puVar8 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_low
|
- &((char *)puVar8)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_low
|
- &*(char *)((ushort *)puVar8 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_low
|
- &*(char *)puVar8
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_low
|
- &*(char *)(puVar8 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x0)
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
|
- (char)puVar8[0x0]
+ (char)((uw_object_hdr_t *)puVar8)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_high
|
- &*(char *)((byte *)puVar8 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_high
|
- &((char *)puVar8)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar8)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- puVar8[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- *(undefined2 *)((byte *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- ((undefined2 *)puVar8)[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- *(undefined2 *)((undefined2 *)puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- *(undefined2 *)(puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- puVar8[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- (byte)puVar8[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar8 + 0x1)
+ ((uw_object_hdr_t *)puVar8)->position_word_low
|
- (undefined1)puVar8[0x1]
+ ((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_low
|
- &*(char *)((byte *)puVar8 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_low
|
- &((char *)puVar8)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_low
|
- &*(char *)((ushort *)puVar8 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_low
|
- &*(char *)(puVar8 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x1)
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
|
- (char)puVar8[0x1]
+ (char)((uw_object_hdr_t *)puVar8)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_high
|
- &*(char *)((byte *)puVar8 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_high
|
- &((char *)puVar8)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar8)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- puVar8[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- *(undefined2 *)((byte *)puVar8 + 0x4)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- ((undefined2 *)puVar8)[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- *(undefined2 *)(puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- puVar8[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- (byte)puVar8[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar8 + 0x2)
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
|
- (undefined1)puVar8[0x2]
+ ((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_low
|
- &*(char *)((byte *)puVar8 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_low
|
- &((char *)puVar8)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_low
|
- &*(char *)((ushort *)puVar8 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_low
|
- &*(char *)(puVar8 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x2)
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
|
- (char)puVar8[0x2]
+ (char)((uw_object_hdr_t *)puVar8)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_high
|
- &*(char *)((byte *)puVar8 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_high
|
- &((char *)puVar8)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar8)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- puVar8[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- *(undefined2 *)((byte *)puVar8 + 0x6)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- ((undefined2 *)puVar8)[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- *(undefined2 *)((undefined2 *)puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- *(undefined2 *)(puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- puVar8[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- (byte)puVar8[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar8 + 0x3)
+ ((uw_object_hdr_t *)puVar8)->link_word_low
|
- (undefined1)puVar8[0x3]
+ ((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_low
|
- &*(char *)((byte *)puVar8 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_low
|
- &((char *)puVar8)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_low
|
- &*(char *)((ushort *)puVar8 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_low
|
- &*(char *)(puVar8 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar8 + 0x3)
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
|
- (char)puVar8[0x3]
+ (char)((uw_object_hdr_t *)puVar8)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar8 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_high
|
- &*(char *)((byte *)puVar8 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_high
|
- &((char *)puVar8)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar8)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
