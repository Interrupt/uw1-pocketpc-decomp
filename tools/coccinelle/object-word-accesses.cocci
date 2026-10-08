@g_player_object_w_0_0_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x0) = (char)V;
- *(char *)((char *)g_player_object + 0x1) = (char)(V >> 8);
+ g_player_object->hdr.type_flags = (ushort)V;

@g_player_object_w_0_0_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x0) = (char)V;
- *(byte *)((char *)g_player_object + 0x1) = (byte)(V >> 8);
+ g_player_object->hdr.type_flags = (ushort)V;

@g_player_object_w_0_0_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x0) = (byte)V;
- *(char *)((char *)g_player_object + 0x1) = (char)(V >> 8);
+ g_player_object->hdr.type_flags = (ushort)V;

@g_player_object_w_0_0_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x0) = (byte)V;
- *(byte *)((char *)g_player_object + 0x1) = (byte)(V >> 8);
+ g_player_object->hdr.type_flags = (ushort)V;

@g_player_object_w_0_0_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags
|
- *(ushort *)((byte *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags
|
- ((ushort *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags
|
- *(ushort *)((ushort *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags
)

@g_player_object_w_0_0_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_signed
|
- *(short *)((byte *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_signed
|
- ((short *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags_signed
|
- *(short *)((short *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_signed
)

@g_player_object_w_0_0_byte_0_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_low
|
- *(byte *)((byte *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_low
|
- ((byte *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags_low
|
- *(byte *)((ushort *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_low
|
- (byte)((ushort *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags_low
|
- *(byte *)g_player_object
+ g_player_object->hdr.type_flags_low
)

@g_player_object_w_0_0_byte_0_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_low
|
- *(undefined1 *)((byte *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_low
|
- ((undefined1 *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x0)
+ g_player_object->hdr.type_flags_low
|
- (undefined1)((ushort *)g_player_object)[0x0]
+ g_player_object->hdr.type_flags_low
|
- *(undefined1 *)g_player_object
+ g_player_object->hdr.type_flags_low
)

@g_player_object_w_0_0_store_0@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x0) = E;
+ g_player_object->hdr.type_flags_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x0) = E;
+ g_player_object->hdr.type_flags_low = (byte)E;
|
- ((char *)g_player_object)[0x0] = E;
+ g_player_object->hdr.type_flags_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x0) = E;
+ g_player_object->hdr.type_flags_low = (byte)E;
|
- *(char *)g_player_object = E;
+ g_player_object->hdr.type_flags_low = (byte)E;
)

@g_player_object_w_0_0_byte_0_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x0)
+ (char)g_player_object->hdr.type_flags_low
|
- *(char *)((byte *)g_player_object + 0x0)
+ (char)g_player_object->hdr.type_flags_low
|
- ((char *)g_player_object)[0x0]
+ (char)g_player_object->hdr.type_flags_low
|
- *(char *)((ushort *)g_player_object + 0x0)
+ (char)g_player_object->hdr.type_flags_low
|
- (char)((ushort *)g_player_object)[0x0]
+ (char)g_player_object->hdr.type_flags_low
|
- *(char *)g_player_object
+ (char)g_player_object->hdr.type_flags_low
)

@g_player_object_w_0_0_byte_1_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x1)
+ g_player_object->hdr.type_flags_high
|
- *(byte *)((byte *)g_player_object + 0x1)
+ g_player_object->hdr.type_flags_high
|
- ((byte *)g_player_object)[0x1]
+ g_player_object->hdr.type_flags_high
)

@g_player_object_w_0_0_byte_1_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x1)
+ g_player_object->hdr.type_flags_high
|
- *(undefined1 *)((byte *)g_player_object + 0x1)
+ g_player_object->hdr.type_flags_high
|
- ((undefined1 *)g_player_object)[0x1]
+ g_player_object->hdr.type_flags_high
)

@g_player_object_w_0_0_store_1@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x1) = E;
+ g_player_object->hdr.type_flags_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x1) = E;
+ g_player_object->hdr.type_flags_high = (byte)E;
|
- ((char *)g_player_object)[0x1] = E;
+ g_player_object->hdr.type_flags_high = (byte)E;
)

@g_player_object_w_0_0_byte_1_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x1)
+ (char)g_player_object->hdr.type_flags_high
|
- *(char *)((byte *)g_player_object + 0x1)
+ (char)g_player_object->hdr.type_flags_high
|
- ((char *)g_player_object)[0x1]
+ (char)g_player_object->hdr.type_flags_high
)

@g_player_object_w_2_14_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x2) = (char)V;
- *(char *)((char *)g_player_object + 0x3) = (char)(V >> 8);
+ g_player_object->hdr.position_word = (ushort)V;

@g_player_object_w_2_14_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x2) = (char)V;
- *(byte *)((char *)g_player_object + 0x3) = (byte)(V >> 8);
+ g_player_object->hdr.position_word = (ushort)V;

@g_player_object_w_2_14_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x2) = (byte)V;
- *(char *)((char *)g_player_object + 0x3) = (char)(V >> 8);
+ g_player_object->hdr.position_word = (ushort)V;

@g_player_object_w_2_14_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x2) = (byte)V;
- *(byte *)((char *)g_player_object + 0x3) = (byte)(V >> 8);
+ g_player_object->hdr.position_word = (ushort)V;

@g_player_object_w_2_14_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0x2)
+ g_player_object->hdr.position_word
|
- *(ushort *)((byte *)g_player_object + 0x2)
+ g_player_object->hdr.position_word
|
- ((ushort *)g_player_object)[0x1]
+ g_player_object->hdr.position_word
|
- *(ushort *)((ushort *)g_player_object + 0x1)
+ g_player_object->hdr.position_word
)

@g_player_object_w_2_14_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0x2)
+ g_player_object->hdr.position_word_signed
|
- *(short *)((byte *)g_player_object + 0x2)
+ g_player_object->hdr.position_word_signed
|
- ((short *)g_player_object)[0x1]
+ g_player_object->hdr.position_word_signed
|
- *(short *)((short *)g_player_object + 0x1)
+ g_player_object->hdr.position_word_signed
)

@g_player_object_w_2_14_byte_2_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x2)
+ g_player_object->hdr.position_word_low
|
- *(byte *)((byte *)g_player_object + 0x2)
+ g_player_object->hdr.position_word_low
|
- ((byte *)g_player_object)[0x2]
+ g_player_object->hdr.position_word_low
|
- *(byte *)((ushort *)g_player_object + 0x1)
+ g_player_object->hdr.position_word_low
|
- (byte)((ushort *)g_player_object)[0x1]
+ g_player_object->hdr.position_word_low
)

@g_player_object_w_2_14_byte_2_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x2)
+ g_player_object->hdr.position_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x2)
+ g_player_object->hdr.position_word_low
|
- ((undefined1 *)g_player_object)[0x2]
+ g_player_object->hdr.position_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x1)
+ g_player_object->hdr.position_word_low
|
- (undefined1)((ushort *)g_player_object)[0x1]
+ g_player_object->hdr.position_word_low
)

@g_player_object_w_2_14_store_2@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x2) = E;
+ g_player_object->hdr.position_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x2) = E;
+ g_player_object->hdr.position_word_low = (byte)E;
|
- ((char *)g_player_object)[0x2] = E;
+ g_player_object->hdr.position_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x1) = E;
+ g_player_object->hdr.position_word_low = (byte)E;
)

@g_player_object_w_2_14_byte_2_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x2)
+ (char)g_player_object->hdr.position_word_low
|
- *(char *)((byte *)g_player_object + 0x2)
+ (char)g_player_object->hdr.position_word_low
|
- ((char *)g_player_object)[0x2]
+ (char)g_player_object->hdr.position_word_low
|
- *(char *)((ushort *)g_player_object + 0x1)
+ (char)g_player_object->hdr.position_word_low
|
- (char)((ushort *)g_player_object)[0x1]
+ (char)g_player_object->hdr.position_word_low
)

@g_player_object_w_2_14_byte_3_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x3)
+ g_player_object->hdr.position_word_high
|
- *(byte *)((byte *)g_player_object + 0x3)
+ g_player_object->hdr.position_word_high
|
- ((byte *)g_player_object)[0x3]
+ g_player_object->hdr.position_word_high
)

@g_player_object_w_2_14_byte_3_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x3)
+ g_player_object->hdr.position_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x3)
+ g_player_object->hdr.position_word_high
|
- ((undefined1 *)g_player_object)[0x3]
+ g_player_object->hdr.position_word_high
)

@g_player_object_w_2_14_store_3@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x3) = E;
+ g_player_object->hdr.position_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x3) = E;
+ g_player_object->hdr.position_word_high = (byte)E;
|
- ((char *)g_player_object)[0x3] = E;
+ g_player_object->hdr.position_word_high = (byte)E;
)

@g_player_object_w_2_14_byte_3_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x3)
+ (char)g_player_object->hdr.position_word_high
|
- *(char *)((byte *)g_player_object + 0x3)
+ (char)g_player_object->hdr.position_word_high
|
- ((char *)g_player_object)[0x3]
+ (char)g_player_object->hdr.position_word_high
)

@g_player_object_w_4_28_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x4) = (char)V;
- *(char *)((char *)g_player_object + 0x5) = (char)(V >> 8);
+ g_player_object->hdr.chain_word = (ushort)V;

@g_player_object_w_4_28_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x4) = (char)V;
- *(byte *)((char *)g_player_object + 0x5) = (byte)(V >> 8);
+ g_player_object->hdr.chain_word = (ushort)V;

@g_player_object_w_4_28_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x4) = (byte)V;
- *(char *)((char *)g_player_object + 0x5) = (char)(V >> 8);
+ g_player_object->hdr.chain_word = (ushort)V;

@g_player_object_w_4_28_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x4) = (byte)V;
- *(byte *)((char *)g_player_object + 0x5) = (byte)(V >> 8);
+ g_player_object->hdr.chain_word = (ushort)V;

@g_player_object_w_4_28_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word
|
- *(ushort *)((byte *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word
|
- ((ushort *)g_player_object)[0x2]
+ g_player_object->hdr.chain_word
|
- *(ushort *)((ushort *)g_player_object + 0x2)
+ g_player_object->hdr.chain_word
)

@g_player_object_w_4_28_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word_signed
|
- *(short *)((byte *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word_signed
|
- ((short *)g_player_object)[0x2]
+ g_player_object->hdr.chain_word_signed
|
- *(short *)((short *)g_player_object + 0x2)
+ g_player_object->hdr.chain_word_signed
)

@g_player_object_w_4_28_byte_4_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word_low
|
- *(byte *)((byte *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word_low
|
- ((byte *)g_player_object)[0x4]
+ g_player_object->hdr.chain_word_low
|
- *(byte *)((ushort *)g_player_object + 0x2)
+ g_player_object->hdr.chain_word_low
|
- (byte)((ushort *)g_player_object)[0x2]
+ g_player_object->hdr.chain_word_low
)

@g_player_object_w_4_28_byte_4_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x4)
+ g_player_object->hdr.chain_word_low
|
- ((undefined1 *)g_player_object)[0x4]
+ g_player_object->hdr.chain_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x2)
+ g_player_object->hdr.chain_word_low
|
- (undefined1)((ushort *)g_player_object)[0x2]
+ g_player_object->hdr.chain_word_low
)

@g_player_object_w_4_28_store_4@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x4) = E;
+ g_player_object->hdr.chain_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x4) = E;
+ g_player_object->hdr.chain_word_low = (byte)E;
|
- ((char *)g_player_object)[0x4] = E;
+ g_player_object->hdr.chain_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x2) = E;
+ g_player_object->hdr.chain_word_low = (byte)E;
)

@g_player_object_w_4_28_byte_4_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x4)
+ (char)g_player_object->hdr.chain_word_low
|
- *(char *)((byte *)g_player_object + 0x4)
+ (char)g_player_object->hdr.chain_word_low
|
- ((char *)g_player_object)[0x4]
+ (char)g_player_object->hdr.chain_word_low
|
- *(char *)((ushort *)g_player_object + 0x2)
+ (char)g_player_object->hdr.chain_word_low
|
- (char)((ushort *)g_player_object)[0x2]
+ (char)g_player_object->hdr.chain_word_low
)

@g_player_object_w_4_28_byte_5_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x5)
+ g_player_object->hdr.chain_word_high
|
- *(byte *)((byte *)g_player_object + 0x5)
+ g_player_object->hdr.chain_word_high
|
- ((byte *)g_player_object)[0x5]
+ g_player_object->hdr.chain_word_high
)

@g_player_object_w_4_28_byte_5_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x5)
+ g_player_object->hdr.chain_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x5)
+ g_player_object->hdr.chain_word_high
|
- ((undefined1 *)g_player_object)[0x5]
+ g_player_object->hdr.chain_word_high
)

@g_player_object_w_4_28_store_5@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x5) = E;
+ g_player_object->hdr.chain_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x5) = E;
+ g_player_object->hdr.chain_word_high = (byte)E;
|
- ((char *)g_player_object)[0x5] = E;
+ g_player_object->hdr.chain_word_high = (byte)E;
)

@g_player_object_w_4_28_byte_5_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x5)
+ (char)g_player_object->hdr.chain_word_high
|
- *(char *)((byte *)g_player_object + 0x5)
+ (char)g_player_object->hdr.chain_word_high
|
- ((char *)g_player_object)[0x5]
+ (char)g_player_object->hdr.chain_word_high
)

@g_player_object_w_6_42_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x6) = (char)V;
- *(char *)((char *)g_player_object + 0x7) = (char)(V >> 8);
+ g_player_object->hdr.link_word = (ushort)V;

@g_player_object_w_6_42_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x6) = (char)V;
- *(byte *)((char *)g_player_object + 0x7) = (byte)(V >> 8);
+ g_player_object->hdr.link_word = (ushort)V;

@g_player_object_w_6_42_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x6) = (byte)V;
- *(char *)((char *)g_player_object + 0x7) = (char)(V >> 8);
+ g_player_object->hdr.link_word = (ushort)V;

@g_player_object_w_6_42_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x6) = (byte)V;
- *(byte *)((char *)g_player_object + 0x7) = (byte)(V >> 8);
+ g_player_object->hdr.link_word = (ushort)V;

@g_player_object_w_6_42_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0x6)
+ g_player_object->hdr.link_word
|
- *(ushort *)((byte *)g_player_object + 0x6)
+ g_player_object->hdr.link_word
|
- ((ushort *)g_player_object)[0x3]
+ g_player_object->hdr.link_word
|
- *(ushort *)((ushort *)g_player_object + 0x3)
+ g_player_object->hdr.link_word
)

@g_player_object_w_6_42_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0x6)
+ g_player_object->hdr.link_word_signed
|
- *(short *)((byte *)g_player_object + 0x6)
+ g_player_object->hdr.link_word_signed
|
- ((short *)g_player_object)[0x3]
+ g_player_object->hdr.link_word_signed
|
- *(short *)((short *)g_player_object + 0x3)
+ g_player_object->hdr.link_word_signed
)

@g_player_object_w_6_42_byte_6_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x6)
+ g_player_object->hdr.link_word_low
|
- *(byte *)((byte *)g_player_object + 0x6)
+ g_player_object->hdr.link_word_low
|
- ((byte *)g_player_object)[0x6]
+ g_player_object->hdr.link_word_low
|
- *(byte *)((ushort *)g_player_object + 0x3)
+ g_player_object->hdr.link_word_low
|
- (byte)((ushort *)g_player_object)[0x3]
+ g_player_object->hdr.link_word_low
)

@g_player_object_w_6_42_byte_6_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x6)
+ g_player_object->hdr.link_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x6)
+ g_player_object->hdr.link_word_low
|
- ((undefined1 *)g_player_object)[0x6]
+ g_player_object->hdr.link_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0x3)
+ g_player_object->hdr.link_word_low
|
- (undefined1)((ushort *)g_player_object)[0x3]
+ g_player_object->hdr.link_word_low
)

@g_player_object_w_6_42_store_6@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x6) = E;
+ g_player_object->hdr.link_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x6) = E;
+ g_player_object->hdr.link_word_low = (byte)E;
|
- ((char *)g_player_object)[0x6] = E;
+ g_player_object->hdr.link_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x3) = E;
+ g_player_object->hdr.link_word_low = (byte)E;
)

@g_player_object_w_6_42_byte_6_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x6)
+ (char)g_player_object->hdr.link_word_low
|
- *(char *)((byte *)g_player_object + 0x6)
+ (char)g_player_object->hdr.link_word_low
|
- ((char *)g_player_object)[0x6]
+ (char)g_player_object->hdr.link_word_low
|
- *(char *)((ushort *)g_player_object + 0x3)
+ (char)g_player_object->hdr.link_word_low
|
- (char)((ushort *)g_player_object)[0x3]
+ (char)g_player_object->hdr.link_word_low
)

@g_player_object_w_6_42_byte_7_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x7)
+ g_player_object->hdr.link_word_high
|
- *(byte *)((byte *)g_player_object + 0x7)
+ g_player_object->hdr.link_word_high
|
- ((byte *)g_player_object)[0x7]
+ g_player_object->hdr.link_word_high
)

@g_player_object_w_6_42_byte_7_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x7)
+ g_player_object->hdr.link_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x7)
+ g_player_object->hdr.link_word_high
|
- ((undefined1 *)g_player_object)[0x7]
+ g_player_object->hdr.link_word_high
)

@g_player_object_w_6_42_store_7@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x7) = E;
+ g_player_object->hdr.link_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x7) = E;
+ g_player_object->hdr.link_word_high = (byte)E;
|
- ((char *)g_player_object)[0x7] = E;
+ g_player_object->hdr.link_word_high = (byte)E;
)

@g_player_object_w_6_42_byte_7_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x7)
+ (char)g_player_object->hdr.link_word_high
|
- *(char *)((byte *)g_player_object + 0x7)
+ (char)g_player_object->hdr.link_word_high
|
- ((char *)g_player_object)[0x7]
+ (char)g_player_object->hdr.link_word_high
)

@g_player_object_mobile_w_11_0_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0xb) = (char)V;
- *(char *)((char *)g_player_object + 0xc) = (char)(V >> 8);
+ g_player_object->goal_word = (ushort)V;

@g_player_object_mobile_w_11_0_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0xb) = (char)V;
- *(byte *)((char *)g_player_object + 0xc) = (byte)(V >> 8);
+ g_player_object->goal_word = (ushort)V;

@g_player_object_mobile_w_11_0_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0xb) = (byte)V;
- *(char *)((char *)g_player_object + 0xc) = (char)(V >> 8);
+ g_player_object->goal_word = (ushort)V;

@g_player_object_mobile_w_11_0_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0xb) = (byte)V;
- *(byte *)((char *)g_player_object + 0xc) = (byte)(V >> 8);
+ g_player_object->goal_word = (ushort)V;

@g_player_object_mobile_w_11_0_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0xb)
+ g_player_object->goal_word
|
- *(ushort *)((byte *)g_player_object + 0xb)
+ g_player_object->goal_word
)

@g_player_object_mobile_w_11_0_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0xb)
+ g_player_object->goal_word_signed
|
- *(short *)((byte *)g_player_object + 0xb)
+ g_player_object->goal_word_signed
)

@g_player_object_mobile_w_11_0_byte_11_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0xb)
+ g_player_object->goal_word_low
|
- *(byte *)((byte *)g_player_object + 0xb)
+ g_player_object->goal_word_low
|
- ((byte *)g_player_object)[0xb]
+ g_player_object->goal_word_low
)

@g_player_object_mobile_w_11_0_byte_11_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0xb)
+ g_player_object->goal_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0xb)
+ g_player_object->goal_word_low
|
- ((undefined1 *)g_player_object)[0xb]
+ g_player_object->goal_word_low
)

@g_player_object_mobile_w_11_0_store_11@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0xb) = E;
+ g_player_object->goal_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0xb) = E;
+ g_player_object->goal_word_low = (byte)E;
|
- ((char *)g_player_object)[0xb] = E;
+ g_player_object->goal_word_low = (byte)E;
)

@g_player_object_mobile_w_11_0_byte_11_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0xb)
+ (char)g_player_object->goal_word_low
|
- *(char *)((byte *)g_player_object + 0xb)
+ (char)g_player_object->goal_word_low
|
- ((char *)g_player_object)[0xb]
+ (char)g_player_object->goal_word_low
)

@g_player_object_mobile_w_11_0_byte_12_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0xc)
+ g_player_object->goal_word_high
|
- *(byte *)((byte *)g_player_object + 0xc)
+ g_player_object->goal_word_high
|
- ((byte *)g_player_object)[0xc]
+ g_player_object->goal_word_high
|
- *(byte *)((ushort *)g_player_object + 0x6)
+ g_player_object->goal_word_high
|
- (byte)((ushort *)g_player_object)[0x6]
+ g_player_object->goal_word_high
)

@g_player_object_mobile_w_11_0_byte_12_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0xc)
+ g_player_object->goal_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0xc)
+ g_player_object->goal_word_high
|
- ((undefined1 *)g_player_object)[0xc]
+ g_player_object->goal_word_high
|
- *(undefined1 *)((ushort *)g_player_object + 0x6)
+ g_player_object->goal_word_high
|
- (undefined1)((ushort *)g_player_object)[0x6]
+ g_player_object->goal_word_high
)

@g_player_object_mobile_w_11_0_store_12@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0xc) = E;
+ g_player_object->goal_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0xc) = E;
+ g_player_object->goal_word_high = (byte)E;
|
- ((char *)g_player_object)[0xc] = E;
+ g_player_object->goal_word_high = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x6) = E;
+ g_player_object->goal_word_high = (byte)E;
)

@g_player_object_mobile_w_11_0_byte_12_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0xc)
+ (char)g_player_object->goal_word_high
|
- *(char *)((byte *)g_player_object + 0xc)
+ (char)g_player_object->goal_word_high
|
- ((char *)g_player_object)[0xc]
+ (char)g_player_object->goal_word_high
|
- *(char *)((ushort *)g_player_object + 0x6)
+ (char)g_player_object->goal_word_high
|
- (char)((ushort *)g_player_object)[0x6]
+ (char)g_player_object->goal_word_high
)

@g_player_object_mobile_w_13_14_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0xd) = (char)V;
- *(char *)((char *)g_player_object + 0xe) = (char)(V >> 8);
+ g_player_object->status_word = (ushort)V;

@g_player_object_mobile_w_13_14_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0xd) = (char)V;
- *(byte *)((char *)g_player_object + 0xe) = (byte)(V >> 8);
+ g_player_object->status_word = (ushort)V;

@g_player_object_mobile_w_13_14_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0xd) = (byte)V;
- *(char *)((char *)g_player_object + 0xe) = (char)(V >> 8);
+ g_player_object->status_word = (ushort)V;

@g_player_object_mobile_w_13_14_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0xd) = (byte)V;
- *(byte *)((char *)g_player_object + 0xe) = (byte)(V >> 8);
+ g_player_object->status_word = (ushort)V;

@g_player_object_mobile_w_13_14_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0xd)
+ g_player_object->status_word
|
- *(ushort *)((byte *)g_player_object + 0xd)
+ g_player_object->status_word
)

@g_player_object_mobile_w_13_14_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0xd)
+ g_player_object->status_word_signed
|
- *(short *)((byte *)g_player_object + 0xd)
+ g_player_object->status_word_signed
)

@g_player_object_mobile_w_13_14_byte_13_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0xd)
+ g_player_object->status_word_low
|
- *(byte *)((byte *)g_player_object + 0xd)
+ g_player_object->status_word_low
|
- ((byte *)g_player_object)[0xd]
+ g_player_object->status_word_low
)

@g_player_object_mobile_w_13_14_byte_13_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0xd)
+ g_player_object->status_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0xd)
+ g_player_object->status_word_low
|
- ((undefined1 *)g_player_object)[0xd]
+ g_player_object->status_word_low
)

@g_player_object_mobile_w_13_14_store_13@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0xd) = E;
+ g_player_object->status_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0xd) = E;
+ g_player_object->status_word_low = (byte)E;
|
- ((char *)g_player_object)[0xd] = E;
+ g_player_object->status_word_low = (byte)E;
)

@g_player_object_mobile_w_13_14_byte_13_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0xd)
+ (char)g_player_object->status_word_low
|
- *(char *)((byte *)g_player_object + 0xd)
+ (char)g_player_object->status_word_low
|
- ((char *)g_player_object)[0xd]
+ (char)g_player_object->status_word_low
)

@g_player_object_mobile_w_13_14_byte_14_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0xe)
+ g_player_object->status_word_high
|
- *(byte *)((byte *)g_player_object + 0xe)
+ g_player_object->status_word_high
|
- ((byte *)g_player_object)[0xe]
+ g_player_object->status_word_high
|
- *(byte *)((ushort *)g_player_object + 0x7)
+ g_player_object->status_word_high
|
- (byte)((ushort *)g_player_object)[0x7]
+ g_player_object->status_word_high
)

@g_player_object_mobile_w_13_14_byte_14_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0xe)
+ g_player_object->status_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0xe)
+ g_player_object->status_word_high
|
- ((undefined1 *)g_player_object)[0xe]
+ g_player_object->status_word_high
|
- *(undefined1 *)((ushort *)g_player_object + 0x7)
+ g_player_object->status_word_high
|
- (undefined1)((ushort *)g_player_object)[0x7]
+ g_player_object->status_word_high
)

@g_player_object_mobile_w_13_14_store_14@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0xe) = E;
+ g_player_object->status_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0xe) = E;
+ g_player_object->status_word_high = (byte)E;
|
- ((char *)g_player_object)[0xe] = E;
+ g_player_object->status_word_high = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x7) = E;
+ g_player_object->status_word_high = (byte)E;
)

@g_player_object_mobile_w_13_14_byte_14_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0xe)
+ (char)g_player_object->status_word_high
|
- *(char *)((byte *)g_player_object + 0xe)
+ (char)g_player_object->status_word_high
|
- ((char *)g_player_object)[0xe]
+ (char)g_player_object->status_word_high
|
- *(char *)((ushort *)g_player_object + 0x7)
+ (char)g_player_object->status_word_high
|
- (char)((ushort *)g_player_object)[0x7]
+ (char)g_player_object->status_word_high
)

@g_player_object_mobile_w_15_28_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0xf) = (char)V;
- *(char *)((char *)g_player_object + 0x10) = (char)(V >> 8);
+ g_player_object->target_word = (ushort)V;

@g_player_object_mobile_w_15_28_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0xf) = (char)V;
- *(byte *)((char *)g_player_object + 0x10) = (byte)(V >> 8);
+ g_player_object->target_word = (ushort)V;

@g_player_object_mobile_w_15_28_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0xf) = (byte)V;
- *(char *)((char *)g_player_object + 0x10) = (char)(V >> 8);
+ g_player_object->target_word = (ushort)V;

@g_player_object_mobile_w_15_28_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0xf) = (byte)V;
- *(byte *)((char *)g_player_object + 0x10) = (byte)(V >> 8);
+ g_player_object->target_word = (ushort)V;

@g_player_object_mobile_w_15_28_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0xf)
+ g_player_object->target_word
|
- *(ushort *)((byte *)g_player_object + 0xf)
+ g_player_object->target_word
)

@g_player_object_mobile_w_15_28_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0xf)
+ g_player_object->target_word_signed
|
- *(short *)((byte *)g_player_object + 0xf)
+ g_player_object->target_word_signed
)

@g_player_object_mobile_w_15_28_byte_15_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0xf)
+ g_player_object->target_word_low
|
- *(byte *)((byte *)g_player_object + 0xf)
+ g_player_object->target_word_low
|
- ((byte *)g_player_object)[0xf]
+ g_player_object->target_word_low
)

@g_player_object_mobile_w_15_28_byte_15_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0xf)
+ g_player_object->target_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0xf)
+ g_player_object->target_word_low
|
- ((undefined1 *)g_player_object)[0xf]
+ g_player_object->target_word_low
)

@g_player_object_mobile_w_15_28_store_15@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0xf) = E;
+ g_player_object->target_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0xf) = E;
+ g_player_object->target_word_low = (byte)E;
|
- ((char *)g_player_object)[0xf] = E;
+ g_player_object->target_word_low = (byte)E;
)

@g_player_object_mobile_w_15_28_byte_15_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0xf)
+ (char)g_player_object->target_word_low
|
- *(char *)((byte *)g_player_object + 0xf)
+ (char)g_player_object->target_word_low
|
- ((char *)g_player_object)[0xf]
+ (char)g_player_object->target_word_low
)

@g_player_object_mobile_w_15_28_byte_16_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x10)
+ g_player_object->target_word_high
|
- *(byte *)((byte *)g_player_object + 0x10)
+ g_player_object->target_word_high
|
- ((byte *)g_player_object)[0x10]
+ g_player_object->target_word_high
|
- *(byte *)((ushort *)g_player_object + 0x8)
+ g_player_object->target_word_high
|
- (byte)((ushort *)g_player_object)[0x8]
+ g_player_object->target_word_high
)

@g_player_object_mobile_w_15_28_byte_16_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x10)
+ g_player_object->target_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x10)
+ g_player_object->target_word_high
|
- ((undefined1 *)g_player_object)[0x10]
+ g_player_object->target_word_high
|
- *(undefined1 *)((ushort *)g_player_object + 0x8)
+ g_player_object->target_word_high
|
- (undefined1)((ushort *)g_player_object)[0x8]
+ g_player_object->target_word_high
)

@g_player_object_mobile_w_15_28_store_16@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x10) = E;
+ g_player_object->target_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x10) = E;
+ g_player_object->target_word_high = (byte)E;
|
- ((char *)g_player_object)[0x10] = E;
+ g_player_object->target_word_high = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0x8) = E;
+ g_player_object->target_word_high = (byte)E;
)

@g_player_object_mobile_w_15_28_byte_16_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x10)
+ (char)g_player_object->target_word_high
|
- *(char *)((byte *)g_player_object + 0x10)
+ (char)g_player_object->target_word_high
|
- ((char *)g_player_object)[0x10]
+ (char)g_player_object->target_word_high
|
- *(char *)((ushort *)g_player_object + 0x8)
+ (char)g_player_object->target_word_high
|
- (char)((ushort *)g_player_object)[0x8]
+ (char)g_player_object->target_word_high
)

@g_player_object_mobile_w_22_42_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x16) = (char)V;
- *(char *)((char *)g_player_object + 0x17) = (char)(V >> 8);
+ g_player_object->tile_word = (ushort)V;

@g_player_object_mobile_w_22_42_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)g_player_object + 0x16) = (char)V;
- *(byte *)((char *)g_player_object + 0x17) = (byte)(V >> 8);
+ g_player_object->tile_word = (ushort)V;

@g_player_object_mobile_w_22_42_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x16) = (byte)V;
- *(char *)((char *)g_player_object + 0x17) = (char)(V >> 8);
+ g_player_object->tile_word = (ushort)V;

@g_player_object_mobile_w_22_42_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)g_player_object + 0x16) = (byte)V;
- *(byte *)((char *)g_player_object + 0x17) = (byte)(V >> 8);
+ g_player_object->tile_word = (ushort)V;

@g_player_object_mobile_w_22_42_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)g_player_object + 0x16)
+ g_player_object->tile_word
|
- *(ushort *)((byte *)g_player_object + 0x16)
+ g_player_object->tile_word
|
- ((ushort *)g_player_object)[0xb]
+ g_player_object->tile_word
|
- *(ushort *)((ushort *)g_player_object + 0xb)
+ g_player_object->tile_word
)

@g_player_object_mobile_w_22_42_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)g_player_object + 0x16)
+ g_player_object->tile_word_signed
|
- *(short *)((byte *)g_player_object + 0x16)
+ g_player_object->tile_word_signed
|
- ((short *)g_player_object)[0xb]
+ g_player_object->tile_word_signed
|
- *(short *)((short *)g_player_object + 0xb)
+ g_player_object->tile_word_signed
)

@g_player_object_mobile_w_22_42_byte_22_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x16)
+ g_player_object->tile_word_low
|
- *(byte *)((byte *)g_player_object + 0x16)
+ g_player_object->tile_word_low
|
- ((byte *)g_player_object)[0x16]
+ g_player_object->tile_word_low
|
- *(byte *)((ushort *)g_player_object + 0xb)
+ g_player_object->tile_word_low
|
- (byte)((ushort *)g_player_object)[0xb]
+ g_player_object->tile_word_low
)

@g_player_object_mobile_w_22_42_byte_22_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x16)
+ g_player_object->tile_word_low
|
- *(undefined1 *)((byte *)g_player_object + 0x16)
+ g_player_object->tile_word_low
|
- ((undefined1 *)g_player_object)[0x16]
+ g_player_object->tile_word_low
|
- *(undefined1 *)((ushort *)g_player_object + 0xb)
+ g_player_object->tile_word_low
|
- (undefined1)((ushort *)g_player_object)[0xb]
+ g_player_object->tile_word_low
)

@g_player_object_mobile_w_22_42_store_22@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x16) = E;
+ g_player_object->tile_word_low = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x16) = E;
+ g_player_object->tile_word_low = (byte)E;
|
- ((char *)g_player_object)[0x16] = E;
+ g_player_object->tile_word_low = (byte)E;
|
- *(char *)((ushort *)g_player_object + 0xb) = E;
+ g_player_object->tile_word_low = (byte)E;
)

@g_player_object_mobile_w_22_42_byte_22_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x16)
+ (char)g_player_object->tile_word_low
|
- *(char *)((byte *)g_player_object + 0x16)
+ (char)g_player_object->tile_word_low
|
- ((char *)g_player_object)[0x16]
+ (char)g_player_object->tile_word_low
|
- *(char *)((ushort *)g_player_object + 0xb)
+ (char)g_player_object->tile_word_low
|
- (char)((ushort *)g_player_object)[0xb]
+ (char)g_player_object->tile_word_low
)

@g_player_object_mobile_w_22_42_byte_23_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)g_player_object + 0x17)
+ g_player_object->tile_word_high
|
- *(byte *)((byte *)g_player_object + 0x17)
+ g_player_object->tile_word_high
|
- ((byte *)g_player_object)[0x17]
+ g_player_object->tile_word_high
)

@g_player_object_mobile_w_22_42_byte_23_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)g_player_object + 0x17)
+ g_player_object->tile_word_high
|
- *(undefined1 *)((byte *)g_player_object + 0x17)
+ g_player_object->tile_word_high
|
- ((undefined1 *)g_player_object)[0x17]
+ g_player_object->tile_word_high
)

@g_player_object_mobile_w_22_42_store_23@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)g_player_object + 0x17) = E;
+ g_player_object->tile_word_high = (byte)E;
|
- *(char *)((byte *)g_player_object + 0x17) = E;
+ g_player_object->tile_word_high = (byte)E;
|
- ((char *)g_player_object)[0x17] = E;
+ g_player_object->tile_word_high = (byte)E;
)

@g_player_object_mobile_w_22_42_byte_23_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)g_player_object + 0x17)
+ (char)g_player_object->tile_word_high
|
- *(char *)((byte *)g_player_object + 0x17)
+ (char)g_player_object->tile_word_high
|
- ((char *)g_player_object)[0x17]
+ (char)g_player_object->tile_word_high
)

@DAT_0010190c_w_0_0_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x0) = (char)V;
- *(char *)((char *)DAT_0010190c + 0x1) = (char)(V >> 8);
+ DAT_0010190c->hdr.type_flags = (ushort)V;

@DAT_0010190c_w_0_0_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x0) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0x1) = (byte)(V >> 8);
+ DAT_0010190c->hdr.type_flags = (ushort)V;

@DAT_0010190c_w_0_0_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x0) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0x1) = (char)(V >> 8);
+ DAT_0010190c->hdr.type_flags = (ushort)V;

@DAT_0010190c_w_0_0_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x0) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0x1) = (byte)(V >> 8);
+ DAT_0010190c->hdr.type_flags = (ushort)V;

@DAT_0010190c_w_0_0_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags
|
- *(ushort *)((byte *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags
|
- ((ushort *)DAT_0010190c)[0x0]
+ DAT_0010190c->hdr.type_flags
|
- *(ushort *)((ushort *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags
)

@DAT_0010190c_w_0_0_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_signed
|
- *(short *)((byte *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_signed
|
- ((short *)DAT_0010190c)[0x0]
+ DAT_0010190c->hdr.type_flags_signed
|
- *(short *)((short *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_signed
)

@DAT_0010190c_w_0_0_byte_0_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_low
|
- *(byte *)((byte *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_low
|
- ((byte *)DAT_0010190c)[0x0]
+ DAT_0010190c->hdr.type_flags_low
|
- *(byte *)((ushort *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_low
|
- (byte)((ushort *)DAT_0010190c)[0x0]
+ DAT_0010190c->hdr.type_flags_low
|
- *(byte *)DAT_0010190c
+ DAT_0010190c->hdr.type_flags_low
)

@DAT_0010190c_w_0_0_byte_0_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_low
|
- ((undefined1 *)DAT_0010190c)[0x0]
+ DAT_0010190c->hdr.type_flags_low
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x0)
+ DAT_0010190c->hdr.type_flags_low
|
- (undefined1)((ushort *)DAT_0010190c)[0x0]
+ DAT_0010190c->hdr.type_flags_low
|
- *(undefined1 *)DAT_0010190c
+ DAT_0010190c->hdr.type_flags_low
)

@DAT_0010190c_w_0_0_store_0@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x0) = E;
+ DAT_0010190c->hdr.type_flags_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x0) = E;
+ DAT_0010190c->hdr.type_flags_low = (byte)E;
|
- ((char *)DAT_0010190c)[0x0] = E;
+ DAT_0010190c->hdr.type_flags_low = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x0) = E;
+ DAT_0010190c->hdr.type_flags_low = (byte)E;
|
- *(char *)DAT_0010190c = E;
+ DAT_0010190c->hdr.type_flags_low = (byte)E;
)

@DAT_0010190c_w_0_0_byte_0_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x0)
+ (char)DAT_0010190c->hdr.type_flags_low
|
- *(char *)((byte *)DAT_0010190c + 0x0)
+ (char)DAT_0010190c->hdr.type_flags_low
|
- ((char *)DAT_0010190c)[0x0]
+ (char)DAT_0010190c->hdr.type_flags_low
|
- *(char *)((ushort *)DAT_0010190c + 0x0)
+ (char)DAT_0010190c->hdr.type_flags_low
|
- (char)((ushort *)DAT_0010190c)[0x0]
+ (char)DAT_0010190c->hdr.type_flags_low
|
- *(char *)DAT_0010190c
+ (char)DAT_0010190c->hdr.type_flags_low
)

@DAT_0010190c_w_0_0_byte_1_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.type_flags_high
|
- *(byte *)((byte *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.type_flags_high
|
- ((byte *)DAT_0010190c)[0x1]
+ DAT_0010190c->hdr.type_flags_high
)

@DAT_0010190c_w_0_0_byte_1_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.type_flags_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.type_flags_high
|
- ((undefined1 *)DAT_0010190c)[0x1]
+ DAT_0010190c->hdr.type_flags_high
)

@DAT_0010190c_w_0_0_store_1@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x1) = E;
+ DAT_0010190c->hdr.type_flags_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x1) = E;
+ DAT_0010190c->hdr.type_flags_high = (byte)E;
|
- ((char *)DAT_0010190c)[0x1] = E;
+ DAT_0010190c->hdr.type_flags_high = (byte)E;
)

@DAT_0010190c_w_0_0_byte_1_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x1)
+ (char)DAT_0010190c->hdr.type_flags_high
|
- *(char *)((byte *)DAT_0010190c + 0x1)
+ (char)DAT_0010190c->hdr.type_flags_high
|
- ((char *)DAT_0010190c)[0x1]
+ (char)DAT_0010190c->hdr.type_flags_high
)

@DAT_0010190c_w_2_14_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x2) = (char)V;
- *(char *)((char *)DAT_0010190c + 0x3) = (char)(V >> 8);
+ DAT_0010190c->hdr.position_word = (ushort)V;

@DAT_0010190c_w_2_14_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x2) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0x3) = (byte)(V >> 8);
+ DAT_0010190c->hdr.position_word = (ushort)V;

@DAT_0010190c_w_2_14_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x2) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0x3) = (char)(V >> 8);
+ DAT_0010190c->hdr.position_word = (ushort)V;

@DAT_0010190c_w_2_14_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x2) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0x3) = (byte)(V >> 8);
+ DAT_0010190c->hdr.position_word = (ushort)V;

@DAT_0010190c_w_2_14_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word
|
- *(ushort *)((byte *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word
|
- ((ushort *)DAT_0010190c)[0x1]
+ DAT_0010190c->hdr.position_word
|
- *(ushort *)((ushort *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.position_word
)

@DAT_0010190c_w_2_14_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word_signed
|
- ((short *)DAT_0010190c)[0x1]
+ DAT_0010190c->hdr.position_word_signed
|
- *(short *)((short *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.position_word_signed
)

@DAT_0010190c_w_2_14_byte_2_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word_low
|
- ((byte *)DAT_0010190c)[0x2]
+ DAT_0010190c->hdr.position_word_low
|
- *(byte *)((ushort *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.position_word_low
|
- (byte)((ushort *)DAT_0010190c)[0x1]
+ DAT_0010190c->hdr.position_word_low
)

@DAT_0010190c_w_2_14_byte_2_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.position_word_low
|
- ((undefined1 *)DAT_0010190c)[0x2]
+ DAT_0010190c->hdr.position_word_low
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x1)
+ DAT_0010190c->hdr.position_word_low
|
- (undefined1)((ushort *)DAT_0010190c)[0x1]
+ DAT_0010190c->hdr.position_word_low
)

@DAT_0010190c_w_2_14_store_2@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x2) = E;
+ DAT_0010190c->hdr.position_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x2) = E;
+ DAT_0010190c->hdr.position_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0x2] = E;
+ DAT_0010190c->hdr.position_word_low = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x1) = E;
+ DAT_0010190c->hdr.position_word_low = (byte)E;
)

@DAT_0010190c_w_2_14_byte_2_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x2)
+ (char)DAT_0010190c->hdr.position_word_low
|
- *(char *)((byte *)DAT_0010190c + 0x2)
+ (char)DAT_0010190c->hdr.position_word_low
|
- ((char *)DAT_0010190c)[0x2]
+ (char)DAT_0010190c->hdr.position_word_low
|
- *(char *)((ushort *)DAT_0010190c + 0x1)
+ (char)DAT_0010190c->hdr.position_word_low
|
- (char)((ushort *)DAT_0010190c)[0x1]
+ (char)DAT_0010190c->hdr.position_word_low
)

@DAT_0010190c_w_2_14_byte_3_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.position_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.position_word_high
|
- ((byte *)DAT_0010190c)[0x3]
+ DAT_0010190c->hdr.position_word_high
)

@DAT_0010190c_w_2_14_byte_3_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.position_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.position_word_high
|
- ((undefined1 *)DAT_0010190c)[0x3]
+ DAT_0010190c->hdr.position_word_high
)

@DAT_0010190c_w_2_14_store_3@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x3) = E;
+ DAT_0010190c->hdr.position_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x3) = E;
+ DAT_0010190c->hdr.position_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0x3] = E;
+ DAT_0010190c->hdr.position_word_high = (byte)E;
)

@DAT_0010190c_w_2_14_byte_3_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x3)
+ (char)DAT_0010190c->hdr.position_word_high
|
- *(char *)((byte *)DAT_0010190c + 0x3)
+ (char)DAT_0010190c->hdr.position_word_high
|
- ((char *)DAT_0010190c)[0x3]
+ (char)DAT_0010190c->hdr.position_word_high
)

@DAT_0010190c_w_4_28_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x4) = (char)V;
- *(char *)((char *)DAT_0010190c + 0x5) = (char)(V >> 8);
+ DAT_0010190c->hdr.chain_word = (ushort)V;

@DAT_0010190c_w_4_28_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x4) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0x5) = (byte)(V >> 8);
+ DAT_0010190c->hdr.chain_word = (ushort)V;

@DAT_0010190c_w_4_28_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x4) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0x5) = (char)(V >> 8);
+ DAT_0010190c->hdr.chain_word = (ushort)V;

@DAT_0010190c_w_4_28_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x4) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0x5) = (byte)(V >> 8);
+ DAT_0010190c->hdr.chain_word = (ushort)V;

@DAT_0010190c_w_4_28_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word
|
- *(ushort *)((byte *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word
|
- ((ushort *)DAT_0010190c)[0x2]
+ DAT_0010190c->hdr.chain_word
|
- *(ushort *)((ushort *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.chain_word
)

@DAT_0010190c_w_4_28_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word_signed
|
- ((short *)DAT_0010190c)[0x2]
+ DAT_0010190c->hdr.chain_word_signed
|
- *(short *)((short *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.chain_word_signed
)

@DAT_0010190c_w_4_28_byte_4_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word_low
|
- ((byte *)DAT_0010190c)[0x4]
+ DAT_0010190c->hdr.chain_word_low
|
- *(byte *)((ushort *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.chain_word_low
|
- (byte)((ushort *)DAT_0010190c)[0x2]
+ DAT_0010190c->hdr.chain_word_low
)

@DAT_0010190c_w_4_28_byte_4_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x4)
+ DAT_0010190c->hdr.chain_word_low
|
- ((undefined1 *)DAT_0010190c)[0x4]
+ DAT_0010190c->hdr.chain_word_low
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x2)
+ DAT_0010190c->hdr.chain_word_low
|
- (undefined1)((ushort *)DAT_0010190c)[0x2]
+ DAT_0010190c->hdr.chain_word_low
)

@DAT_0010190c_w_4_28_store_4@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x4) = E;
+ DAT_0010190c->hdr.chain_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x4) = E;
+ DAT_0010190c->hdr.chain_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0x4] = E;
+ DAT_0010190c->hdr.chain_word_low = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x2) = E;
+ DAT_0010190c->hdr.chain_word_low = (byte)E;
)

@DAT_0010190c_w_4_28_byte_4_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x4)
+ (char)DAT_0010190c->hdr.chain_word_low
|
- *(char *)((byte *)DAT_0010190c + 0x4)
+ (char)DAT_0010190c->hdr.chain_word_low
|
- ((char *)DAT_0010190c)[0x4]
+ (char)DAT_0010190c->hdr.chain_word_low
|
- *(char *)((ushort *)DAT_0010190c + 0x2)
+ (char)DAT_0010190c->hdr.chain_word_low
|
- (char)((ushort *)DAT_0010190c)[0x2]
+ (char)DAT_0010190c->hdr.chain_word_low
)

@DAT_0010190c_w_4_28_byte_5_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x5)
+ DAT_0010190c->hdr.chain_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0x5)
+ DAT_0010190c->hdr.chain_word_high
|
- ((byte *)DAT_0010190c)[0x5]
+ DAT_0010190c->hdr.chain_word_high
)

@DAT_0010190c_w_4_28_byte_5_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x5)
+ DAT_0010190c->hdr.chain_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x5)
+ DAT_0010190c->hdr.chain_word_high
|
- ((undefined1 *)DAT_0010190c)[0x5]
+ DAT_0010190c->hdr.chain_word_high
)

@DAT_0010190c_w_4_28_store_5@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x5) = E;
+ DAT_0010190c->hdr.chain_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x5) = E;
+ DAT_0010190c->hdr.chain_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0x5] = E;
+ DAT_0010190c->hdr.chain_word_high = (byte)E;
)

@DAT_0010190c_w_4_28_byte_5_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x5)
+ (char)DAT_0010190c->hdr.chain_word_high
|
- *(char *)((byte *)DAT_0010190c + 0x5)
+ (char)DAT_0010190c->hdr.chain_word_high
|
- ((char *)DAT_0010190c)[0x5]
+ (char)DAT_0010190c->hdr.chain_word_high
)

@DAT_0010190c_w_6_42_pair_char_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x6) = (char)V;
- *(char *)((char *)DAT_0010190c + 0x7) = (char)(V >> 8);
+ DAT_0010190c->hdr.link_word = (ushort)V;

@DAT_0010190c_w_6_42_pair_char_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(char *)((char *)DAT_0010190c + 0x6) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0x7) = (byte)(V >> 8);
+ DAT_0010190c->hdr.link_word = (ushort)V;

@DAT_0010190c_w_6_42_pair_byte_char@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x6) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0x7) = (char)(V >> 8);
+ DAT_0010190c->hdr.link_word = (ushort)V;

@DAT_0010190c_w_6_42_pair_byte_byte@
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
- *(byte *)((char *)DAT_0010190c + 0x6) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0x7) = (byte)(V >> 8);
+ DAT_0010190c->hdr.link_word = (ushort)V;

@DAT_0010190c_w_6_42_word_ushort@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(ushort *)((char *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word
|
- *(ushort *)((byte *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word
|
- ((ushort *)DAT_0010190c)[0x3]
+ DAT_0010190c->hdr.link_word
|
- *(ushort *)((ushort *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.link_word
)

@DAT_0010190c_w_6_42_word_short@
typedef ushort, byte, uw_object_hdr_t;
@@
(
- *(short *)((char *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word_signed
|
- ((short *)DAT_0010190c)[0x3]
+ DAT_0010190c->hdr.link_word_signed
|
- *(short *)((short *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.link_word_signed
)

@DAT_0010190c_w_6_42_byte_6_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word_low
|
- ((byte *)DAT_0010190c)[0x6]
+ DAT_0010190c->hdr.link_word_low
|
- *(byte *)((ushort *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.link_word_low
|
- (byte)((ushort *)DAT_0010190c)[0x3]
+ DAT_0010190c->hdr.link_word_low
)

@DAT_0010190c_w_6_42_byte_6_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x6)
+ DAT_0010190c->hdr.link_word_low
|
- ((undefined1 *)DAT_0010190c)[0x6]
+ DAT_0010190c->hdr.link_word_low
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x3)
+ DAT_0010190c->hdr.link_word_low
|
- (undefined1)((ushort *)DAT_0010190c)[0x3]
+ DAT_0010190c->hdr.link_word_low
)

@DAT_0010190c_w_6_42_store_6@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x6) = E;
+ DAT_0010190c->hdr.link_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x6) = E;
+ DAT_0010190c->hdr.link_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0x6] = E;
+ DAT_0010190c->hdr.link_word_low = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x3) = E;
+ DAT_0010190c->hdr.link_word_low = (byte)E;
)

@DAT_0010190c_w_6_42_byte_6_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x6)
+ (char)DAT_0010190c->hdr.link_word_low
|
- *(char *)((byte *)DAT_0010190c + 0x6)
+ (char)DAT_0010190c->hdr.link_word_low
|
- ((char *)DAT_0010190c)[0x6]
+ (char)DAT_0010190c->hdr.link_word_low
|
- *(char *)((ushort *)DAT_0010190c + 0x3)
+ (char)DAT_0010190c->hdr.link_word_low
|
- (char)((ushort *)DAT_0010190c)[0x3]
+ (char)DAT_0010190c->hdr.link_word_low
)

@DAT_0010190c_w_6_42_byte_7_byte@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(byte *)((char *)DAT_0010190c + 0x7)
+ DAT_0010190c->hdr.link_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0x7)
+ DAT_0010190c->hdr.link_word_high
|
- ((byte *)DAT_0010190c)[0x7]
+ DAT_0010190c->hdr.link_word_high
)

@DAT_0010190c_w_6_42_byte_7_undefined1@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(undefined1 *)((char *)DAT_0010190c + 0x7)
+ DAT_0010190c->hdr.link_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x7)
+ DAT_0010190c->hdr.link_word_high
|
- ((undefined1 *)DAT_0010190c)[0x7]
+ DAT_0010190c->hdr.link_word_high
)

@DAT_0010190c_w_6_42_store_7@
typedef byte, uw_object_hdr_t;
expression E;
@@
(
- *(char *)((char *)DAT_0010190c + 0x7) = E;
+ DAT_0010190c->hdr.link_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x7) = E;
+ DAT_0010190c->hdr.link_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0x7] = E;
+ DAT_0010190c->hdr.link_word_high = (byte)E;
)

@DAT_0010190c_w_6_42_byte_7_char@
typedef byte, undefined1, uw_object_hdr_t;
@@
(
- *(char *)((char *)DAT_0010190c + 0x7)
+ (char)DAT_0010190c->hdr.link_word_high
|
- *(char *)((byte *)DAT_0010190c + 0x7)
+ (char)DAT_0010190c->hdr.link_word_high
|
- ((char *)DAT_0010190c)[0x7]
+ (char)DAT_0010190c->hdr.link_word_high
)

@DAT_0010190c_mobile_w_11_0_pair_char_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0xb) = (char)V;
- *(char *)((char *)DAT_0010190c + 0xc) = (char)(V >> 8);
+ DAT_0010190c->goal_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_11_0_pair_char_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0xb) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(V >> 8);
+ DAT_0010190c->goal_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_11_0_pair_byte_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0xb) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0xc) = (char)(V >> 8);
+ DAT_0010190c->goal_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_11_0_pair_byte_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0xb) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0xc) = (byte)(V >> 8);
+ DAT_0010190c->goal_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_11_0_word_ushort@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word
|
- *(ushort *)((byte *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word
)
...>
}


@DAT_0010190c_mobile_w_11_0_word_short@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word_signed
)
...>
}


@DAT_0010190c_mobile_w_11_0_byte_11_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word_low
|
- ((byte *)DAT_0010190c)[0xb]
+ DAT_0010190c->goal_word_low
)
...>
}


@DAT_0010190c_mobile_w_11_0_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0xb)
+ DAT_0010190c->goal_word_low
|
- ((undefined1 *)DAT_0010190c)[0xb]
+ DAT_0010190c->goal_word_low
)
...>
}


@DAT_0010190c_mobile_w_11_0_store_11@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xb) = E;
+ DAT_0010190c->goal_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0xb) = E;
+ DAT_0010190c->goal_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0xb] = E;
+ DAT_0010190c->goal_word_low = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_11_0_byte_11_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xb)
+ (char)DAT_0010190c->goal_word_low
|
- *(char *)((byte *)DAT_0010190c + 0xb)
+ (char)DAT_0010190c->goal_word_low
|
- ((char *)DAT_0010190c)[0xb]
+ (char)DAT_0010190c->goal_word_low
)
...>
}


@DAT_0010190c_mobile_w_11_0_byte_12_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0xc)
+ DAT_0010190c->goal_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0xc)
+ DAT_0010190c->goal_word_high
|
- ((byte *)DAT_0010190c)[0xc]
+ DAT_0010190c->goal_word_high
|
- *(byte *)((ushort *)DAT_0010190c + 0x6)
+ DAT_0010190c->goal_word_high
|
- (byte)((ushort *)DAT_0010190c)[0x6]
+ DAT_0010190c->goal_word_high
)
...>
}


@DAT_0010190c_mobile_w_11_0_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0xc)
+ DAT_0010190c->goal_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0xc)
+ DAT_0010190c->goal_word_high
|
- ((undefined1 *)DAT_0010190c)[0xc]
+ DAT_0010190c->goal_word_high
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x6)
+ DAT_0010190c->goal_word_high
|
- (undefined1)((ushort *)DAT_0010190c)[0x6]
+ DAT_0010190c->goal_word_high
)
...>
}


@DAT_0010190c_mobile_w_11_0_store_12@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xc) = E;
+ DAT_0010190c->goal_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0xc) = E;
+ DAT_0010190c->goal_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0xc] = E;
+ DAT_0010190c->goal_word_high = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x6) = E;
+ DAT_0010190c->goal_word_high = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_11_0_byte_12_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xc)
+ (char)DAT_0010190c->goal_word_high
|
- *(char *)((byte *)DAT_0010190c + 0xc)
+ (char)DAT_0010190c->goal_word_high
|
- ((char *)DAT_0010190c)[0xc]
+ (char)DAT_0010190c->goal_word_high
|
- *(char *)((ushort *)DAT_0010190c + 0x6)
+ (char)DAT_0010190c->goal_word_high
|
- (char)((ushort *)DAT_0010190c)[0x6]
+ (char)DAT_0010190c->goal_word_high
)
...>
}


@DAT_0010190c_mobile_w_13_14_pair_char_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0xd) = (char)V;
- *(char *)((char *)DAT_0010190c + 0xe) = (char)(V >> 8);
+ DAT_0010190c->status_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_13_14_pair_char_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0xd) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0xe) = (byte)(V >> 8);
+ DAT_0010190c->status_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_13_14_pair_byte_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0xd) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0xe) = (char)(V >> 8);
+ DAT_0010190c->status_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_13_14_pair_byte_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0xd) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0xe) = (byte)(V >> 8);
+ DAT_0010190c->status_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_13_14_word_ushort@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word
|
- *(ushort *)((byte *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word
)
...>
}


@DAT_0010190c_mobile_w_13_14_word_short@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word_signed
)
...>
}


@DAT_0010190c_mobile_w_13_14_byte_13_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word_low
|
- ((byte *)DAT_0010190c)[0xd]
+ DAT_0010190c->status_word_low
)
...>
}


@DAT_0010190c_mobile_w_13_14_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0xd)
+ DAT_0010190c->status_word_low
|
- ((undefined1 *)DAT_0010190c)[0xd]
+ DAT_0010190c->status_word_low
)
...>
}


@DAT_0010190c_mobile_w_13_14_store_13@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xd) = E;
+ DAT_0010190c->status_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0xd) = E;
+ DAT_0010190c->status_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0xd] = E;
+ DAT_0010190c->status_word_low = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_13_14_byte_13_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xd)
+ (char)DAT_0010190c->status_word_low
|
- *(char *)((byte *)DAT_0010190c + 0xd)
+ (char)DAT_0010190c->status_word_low
|
- ((char *)DAT_0010190c)[0xd]
+ (char)DAT_0010190c->status_word_low
)
...>
}


@DAT_0010190c_mobile_w_13_14_byte_14_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0xe)
+ DAT_0010190c->status_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0xe)
+ DAT_0010190c->status_word_high
|
- ((byte *)DAT_0010190c)[0xe]
+ DAT_0010190c->status_word_high
|
- *(byte *)((ushort *)DAT_0010190c + 0x7)
+ DAT_0010190c->status_word_high
|
- (byte)((ushort *)DAT_0010190c)[0x7]
+ DAT_0010190c->status_word_high
)
...>
}


@DAT_0010190c_mobile_w_13_14_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0xe)
+ DAT_0010190c->status_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0xe)
+ DAT_0010190c->status_word_high
|
- ((undefined1 *)DAT_0010190c)[0xe]
+ DAT_0010190c->status_word_high
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x7)
+ DAT_0010190c->status_word_high
|
- (undefined1)((ushort *)DAT_0010190c)[0x7]
+ DAT_0010190c->status_word_high
)
...>
}


@DAT_0010190c_mobile_w_13_14_store_14@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xe) = E;
+ DAT_0010190c->status_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0xe) = E;
+ DAT_0010190c->status_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0xe] = E;
+ DAT_0010190c->status_word_high = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x7) = E;
+ DAT_0010190c->status_word_high = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_13_14_byte_14_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xe)
+ (char)DAT_0010190c->status_word_high
|
- *(char *)((byte *)DAT_0010190c + 0xe)
+ (char)DAT_0010190c->status_word_high
|
- ((char *)DAT_0010190c)[0xe]
+ (char)DAT_0010190c->status_word_high
|
- *(char *)((ushort *)DAT_0010190c + 0x7)
+ (char)DAT_0010190c->status_word_high
|
- (char)((ushort *)DAT_0010190c)[0x7]
+ (char)DAT_0010190c->status_word_high
)
...>
}


@DAT_0010190c_mobile_w_15_28_pair_char_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0xf) = (char)V;
- *(char *)((char *)DAT_0010190c + 0x10) = (char)(V >> 8);
+ DAT_0010190c->target_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_15_28_pair_char_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0xf) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0x10) = (byte)(V >> 8);
+ DAT_0010190c->target_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_15_28_pair_byte_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0xf) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0x10) = (char)(V >> 8);
+ DAT_0010190c->target_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_15_28_pair_byte_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0xf) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0x10) = (byte)(V >> 8);
+ DAT_0010190c->target_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_15_28_word_ushort@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word
|
- *(ushort *)((byte *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word
)
...>
}


@DAT_0010190c_mobile_w_15_28_word_short@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word_signed
)
...>
}


@DAT_0010190c_mobile_w_15_28_byte_15_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word_low
|
- ((byte *)DAT_0010190c)[0xf]
+ DAT_0010190c->target_word_low
)
...>
}


@DAT_0010190c_mobile_w_15_28_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0xf)
+ DAT_0010190c->target_word_low
|
- ((undefined1 *)DAT_0010190c)[0xf]
+ DAT_0010190c->target_word_low
)
...>
}


@DAT_0010190c_mobile_w_15_28_store_15@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xf) = E;
+ DAT_0010190c->target_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0xf) = E;
+ DAT_0010190c->target_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0xf] = E;
+ DAT_0010190c->target_word_low = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_15_28_byte_15_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0xf)
+ (char)DAT_0010190c->target_word_low
|
- *(char *)((byte *)DAT_0010190c + 0xf)
+ (char)DAT_0010190c->target_word_low
|
- ((char *)DAT_0010190c)[0xf]
+ (char)DAT_0010190c->target_word_low
)
...>
}


@DAT_0010190c_mobile_w_15_28_byte_16_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0x10)
+ DAT_0010190c->target_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0x10)
+ DAT_0010190c->target_word_high
|
- ((byte *)DAT_0010190c)[0x10]
+ DAT_0010190c->target_word_high
|
- *(byte *)((ushort *)DAT_0010190c + 0x8)
+ DAT_0010190c->target_word_high
|
- (byte)((ushort *)DAT_0010190c)[0x8]
+ DAT_0010190c->target_word_high
)
...>
}


@DAT_0010190c_mobile_w_15_28_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0x10)
+ DAT_0010190c->target_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x10)
+ DAT_0010190c->target_word_high
|
- ((undefined1 *)DAT_0010190c)[0x10]
+ DAT_0010190c->target_word_high
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0x8)
+ DAT_0010190c->target_word_high
|
- (undefined1)((ushort *)DAT_0010190c)[0x8]
+ DAT_0010190c->target_word_high
)
...>
}


@DAT_0010190c_mobile_w_15_28_store_16@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0x10) = E;
+ DAT_0010190c->target_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x10) = E;
+ DAT_0010190c->target_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0x10] = E;
+ DAT_0010190c->target_word_high = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0x8) = E;
+ DAT_0010190c->target_word_high = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_15_28_byte_16_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0x10)
+ (char)DAT_0010190c->target_word_high
|
- *(char *)((byte *)DAT_0010190c + 0x10)
+ (char)DAT_0010190c->target_word_high
|
- ((char *)DAT_0010190c)[0x10]
+ (char)DAT_0010190c->target_word_high
|
- *(char *)((ushort *)DAT_0010190c + 0x8)
+ (char)DAT_0010190c->target_word_high
|
- (char)((ushort *)DAT_0010190c)[0x8]
+ (char)DAT_0010190c->target_word_high
)
...>
}


@DAT_0010190c_mobile_w_22_42_pair_char_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0x16) = (char)V;
- *(char *)((char *)DAT_0010190c + 0x17) = (char)(V >> 8);
+ DAT_0010190c->tile_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_22_42_pair_char_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)DAT_0010190c + 0x16) = (char)V;
- *(byte *)((char *)DAT_0010190c + 0x17) = (byte)(V >> 8);
+ DAT_0010190c->tile_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_22_42_pair_byte_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0x16) = (byte)V;
- *(char *)((char *)DAT_0010190c + 0x17) = (char)(V >> 8);
+ DAT_0010190c->tile_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_22_42_pair_byte_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)DAT_0010190c + 0x16) = (byte)V;
- *(byte *)((char *)DAT_0010190c + 0x17) = (byte)(V >> 8);
+ DAT_0010190c->tile_word = (ushort)V;

...>
}

@DAT_0010190c_mobile_w_22_42_word_ushort@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word
|
- *(ushort *)((byte *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word
|
- ((ushort *)DAT_0010190c)[0xb]
+ DAT_0010190c->tile_word
|
- *(ushort *)((ushort *)DAT_0010190c + 0xb)
+ DAT_0010190c->tile_word
)
...>
}


@DAT_0010190c_mobile_w_22_42_word_short@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word_signed
|
- *(short *)((byte *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word_signed
|
- ((short *)DAT_0010190c)[0xb]
+ DAT_0010190c->tile_word_signed
|
- *(short *)((short *)DAT_0010190c + 0xb)
+ DAT_0010190c->tile_word_signed
)
...>
}


@DAT_0010190c_mobile_w_22_42_byte_22_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word_low
|
- *(byte *)((byte *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word_low
|
- ((byte *)DAT_0010190c)[0x16]
+ DAT_0010190c->tile_word_low
|
- *(byte *)((ushort *)DAT_0010190c + 0xb)
+ DAT_0010190c->tile_word_low
|
- (byte)((ushort *)DAT_0010190c)[0xb]
+ DAT_0010190c->tile_word_low
)
...>
}


@DAT_0010190c_mobile_w_22_42_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word_low
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x16)
+ DAT_0010190c->tile_word_low
|
- ((undefined1 *)DAT_0010190c)[0x16]
+ DAT_0010190c->tile_word_low
|
- *(undefined1 *)((ushort *)DAT_0010190c + 0xb)
+ DAT_0010190c->tile_word_low
|
- (undefined1)((ushort *)DAT_0010190c)[0xb]
+ DAT_0010190c->tile_word_low
)
...>
}


@DAT_0010190c_mobile_w_22_42_store_22@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0x16) = E;
+ DAT_0010190c->tile_word_low = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x16) = E;
+ DAT_0010190c->tile_word_low = (byte)E;
|
- ((char *)DAT_0010190c)[0x16] = E;
+ DAT_0010190c->tile_word_low = (byte)E;
|
- *(char *)((ushort *)DAT_0010190c + 0xb) = E;
+ DAT_0010190c->tile_word_low = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_22_42_byte_22_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0x16)
+ (char)DAT_0010190c->tile_word_low
|
- *(char *)((byte *)DAT_0010190c + 0x16)
+ (char)DAT_0010190c->tile_word_low
|
- ((char *)DAT_0010190c)[0x16]
+ (char)DAT_0010190c->tile_word_low
|
- *(char *)((ushort *)DAT_0010190c + 0xb)
+ (char)DAT_0010190c->tile_word_low
|
- (char)((ushort *)DAT_0010190c)[0xb]
+ (char)DAT_0010190c->tile_word_low
)
...>
}


@DAT_0010190c_mobile_w_22_42_byte_23_byte@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)DAT_0010190c + 0x17)
+ DAT_0010190c->tile_word_high
|
- *(byte *)((byte *)DAT_0010190c + 0x17)
+ DAT_0010190c->tile_word_high
|
- ((byte *)DAT_0010190c)[0x17]
+ DAT_0010190c->tile_word_high
)
...>
}


@DAT_0010190c_mobile_w_22_42_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)DAT_0010190c + 0x17)
+ DAT_0010190c->tile_word_high
|
- *(undefined1 *)((byte *)DAT_0010190c + 0x17)
+ DAT_0010190c->tile_word_high
|
- ((undefined1 *)DAT_0010190c)[0x17]
+ DAT_0010190c->tile_word_high
)
...>
}


@DAT_0010190c_mobile_w_22_42_store_23@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0x17) = E;
+ DAT_0010190c->tile_word_high = (byte)E;
|
- *(char *)((byte *)DAT_0010190c + 0x17) = E;
+ DAT_0010190c->tile_word_high = (byte)E;
|
- ((char *)DAT_0010190c)[0x17] = E;
+ DAT_0010190c->tile_word_high = (byte)E;
)
...>
}


@DAT_0010190c_mobile_w_22_42_byte_23_char@
type R;
identifier F =~ "^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\|movement_tick\|try_npc_special_ability_.*\|walk_using_cached_path\|handle_blocked_cached_path\|collision_response_default\)$";
typedef byte, undefined1, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)DAT_0010190c + 0x17)
+ (char)DAT_0010190c->tile_word_high
|
- *(char *)((byte *)DAT_0010190c + 0x17)
+ (char)DAT_0010190c->tile_word_high
|
- ((char *)DAT_0010190c)[0x17]
+ (char)DAT_0010190c->tile_word_high
)
...>
}


@cached_path_slot@
@@
- DAT_0010190c->tile_word_low & 0xf
+ DAT_0010190c->npc_path_slot
