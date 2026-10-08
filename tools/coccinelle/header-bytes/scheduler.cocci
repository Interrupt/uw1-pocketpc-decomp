@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(undefined2 *)((byte *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- ((undefined2 *)uVar1)[0x0]
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)uVar1 + 0x0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_low
|
- &*(char *)((byte *)uVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_low
|
- &((char *)uVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_low
|
- &*(char *)((ushort *)uVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_low
|
- &*(char *)uVar1
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_high
|
- &*(char *)((byte *)uVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_high
|
- &((char *)uVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)uVar1)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- *(undefined2 *)((byte *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- ((undefined2 *)uVar1)[0x1]
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- *(undefined2 *)((undefined2 *)uVar1 + 0x1)
+ ((uw_object_hdr_t *)uVar1)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_low
|
- &*(char *)((byte *)uVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_low
|
- &((char *)uVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_low
|
- &*(char *)((ushort *)uVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_high
|
- &*(char *)((byte *)uVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_high
|
- &((char *)uVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)uVar1)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- *(undefined2 *)((byte *)uVar1 + 0x4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- ((undefined2 *)uVar1)[0x2]
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)uVar1 + 0x2)
+ ((uw_object_hdr_t *)uVar1)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_low
|
- &*(char *)((byte *)uVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_low
|
- &((char *)uVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_low
|
- &*(char *)((ushort *)uVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_high
|
- &*(char *)((byte *)uVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_high
|
- &((char *)uVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)uVar1)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- *(undefined2 *)((byte *)uVar1 + 0x6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- ((undefined2 *)uVar1)[0x3]
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- *(undefined2 *)((undefined2 *)uVar1 + 0x3)
+ ((uw_object_hdr_t *)uVar1)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_low
|
- &*(char *)((byte *)uVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_low
|
- &((char *)uVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_low
|
- &*(char *)((ushort *)uVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)uVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_high
|
- &*(char *)((byte *)uVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_high
|
- &((char *)uVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)uVar1)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(undefined2 *)((byte *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- ((undefined2 *)puVar4)[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(undefined2 *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (byte)puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar4 + 0x0)
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (undefined1)puVar4[0x0]
+ ((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)((byte *)puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &((char *)puVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)((ushort *)puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)puVar4
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
|
- &*(char *)(puVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x0)
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
|
- (char)puVar4[0x0]
+ (char)((uw_object_hdr_t *)puVar4)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_high
|
- &*(char *)((byte *)puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_high
|
- &((char *)puVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar4)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(undefined2 *)((byte *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- ((undefined2 *)puVar4)[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- *(undefined2 *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- (byte)puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar4 + 0x1)
+ ((uw_object_hdr_t *)puVar4)->position_word_low
|
- (undefined1)puVar4[0x1]
+ ((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &*(char *)((byte *)puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &((char *)puVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &*(char *)((ushort *)puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
|
- &*(char *)(puVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x1)
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
|
- (char)puVar4[0x1]
+ (char)((uw_object_hdr_t *)puVar4)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_high
|
- &*(char *)((byte *)puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_high
|
- &((char *)puVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar4)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(undefined2 *)((byte *)puVar4 + 0x4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- ((undefined2 *)puVar4)[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- *(undefined2 *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (byte)puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar4 + 0x2)
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (undefined1)puVar4[0x2]
+ ((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &*(char *)((byte *)puVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &((char *)puVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &*(char *)((ushort *)puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
|
- &*(char *)(puVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x2)
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
|
- (char)puVar4[0x2]
+ (char)((uw_object_hdr_t *)puVar4)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_high
|
- &*(char *)((byte *)puVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_high
|
- &((char *)puVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar4)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(undefined2 *)((byte *)puVar4 + 0x6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- ((undefined2 *)puVar4)[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(undefined2 *)((undefined2 *)puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- *(undefined2 *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- (byte)puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar4 + 0x3)
+ ((uw_object_hdr_t *)puVar4)->link_word_low
|
- (undefined1)puVar4[0x3]
+ ((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &*(char *)((byte *)puVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &((char *)puVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &*(char *)((ushort *)puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
|
- &*(char *)(puVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar4 + 0x3)
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
|
- (char)puVar4[0x3]
+ (char)((uw_object_hdr_t *)puVar4)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_high
|
- &*(char *)((byte *)puVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_high
|
- &((char *)puVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar4)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x0) = (char)V;
- *(char *)((char *)pbVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x0) = (char)V;
- *(byte *)((char *)pbVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x0) = (byte)V;
- *(char *)((char *)pbVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- ((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)(pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(undefined2 *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- ((undefined2 *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(undefined2 *)(pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- ((short *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)((short *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)(pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((byte *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (byte)((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)(pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- pbVar3[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((undefined1 *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (undefined1)((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)(pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- pbVar3[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)((byte *)pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &((char *)pbVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)((ushort *)pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)pbVar3
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)(pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- ((char *)pbVar3)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)pbVar3 = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)(pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)((byte *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((char *)pbVar3)[0x0]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)((ushort *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (char)((ushort *)pbVar3)[0x0]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)pbVar3
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)(pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(byte *)((byte *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((byte *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(byte *)(pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- pbVar3[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((undefined1 *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(undefined1 *)(pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- pbVar3[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- &*(char *)((byte *)pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- &((char *)pbVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- &*(char *)(pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- ((char *)pbVar3)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- *(char *)(pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(char *)((byte *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((char *)pbVar3)[0x1]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(char *)(pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x2) = (char)V;
- *(char *)((char *)pbVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x2) = (char)V;
- *(byte *)((char *)pbVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x2) = (byte)V;
- *(char *)((char *)pbVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- ((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)(pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(undefined2 *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- ((undefined2 *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(undefined2 *)(pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- ((short *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)((short *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)(pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((byte *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (byte)((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)(pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- pbVar3[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((undefined1 *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (undefined1)((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)(pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- pbVar3[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &*(char *)((byte *)pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &((char *)pbVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &*(char *)((ushort *)pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &*(char *)(pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- ((char *)pbVar3)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)(pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)((byte *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((char *)pbVar3)[0x2]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)((ushort *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (char)((ushort *)pbVar3)[0x1]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)(pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(byte *)((byte *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((byte *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(byte *)(pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- pbVar3[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((undefined1 *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(undefined1 *)(pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- pbVar3[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
|
- &*(char *)((byte *)pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
|
- &((char *)pbVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
|
- &*(char *)(pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- ((char *)pbVar3)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- *(char *)(pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(char *)((byte *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((char *)pbVar3)[0x3]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(char *)(pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x4) = (char)V;
- *(char *)((char *)pbVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x4) = (char)V;
- *(byte *)((char *)pbVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x4) = (byte)V;
- *(char *)((char *)pbVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- ((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)(pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(undefined2 *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- ((undefined2 *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(undefined2 *)(pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- ((short *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)((short *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)(pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((byte *)pbVar3)[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (byte)((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)(pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- pbVar3[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((undefined1 *)pbVar3)[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (undefined1)((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)(pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- pbVar3[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &*(char *)((byte *)pbVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &((char *)pbVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &*(char *)((ushort *)pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &*(char *)(pbVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- ((char *)pbVar3)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)(pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)((byte *)pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((char *)pbVar3)[0x4]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)((ushort *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (char)((ushort *)pbVar3)[0x2]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)(pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(byte *)((byte *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((byte *)pbVar3)[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(byte *)(pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- pbVar3[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((undefined1 *)pbVar3)[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(undefined1 *)(pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- pbVar3[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- &*(char *)((byte *)pbVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- &((char *)pbVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- &*(char *)(pbVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- ((char *)pbVar3)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- *(char *)(pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(char *)((byte *)pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((char *)pbVar3)[0x5]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(char *)(pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x6) = (char)V;
- *(char *)((char *)pbVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x6) = (char)V;
- *(byte *)((char *)pbVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x6) = (byte)V;
- *(char *)((char *)pbVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- ((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)(pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(undefined2 *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- ((undefined2 *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(undefined2 *)(pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- ((short *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)((short *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)(pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((byte *)pbVar3)[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (byte)((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)(pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- pbVar3[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((undefined1 *)pbVar3)[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (undefined1)((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)(pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- pbVar3[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &*(char *)((byte *)pbVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &((char *)pbVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &*(char *)((ushort *)pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &*(char *)(pbVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- ((char *)pbVar3)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)(pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)((byte *)pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((char *)pbVar3)[0x6]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)((ushort *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (char)((ushort *)pbVar3)[0x3]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)(pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(byte *)((byte *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((byte *)pbVar3)[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(byte *)(pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- pbVar3[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((undefined1 *)pbVar3)[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(undefined1 *)(pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- pbVar3[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
|
- &*(char *)((byte *)pbVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
|
- &((char *)pbVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
|
- &*(char *)(pbVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- ((char *)pbVar3)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- *(char *)(pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(char *)((byte *)pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((char *)pbVar3)[0x7]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(char *)(pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x0) = (char)V;
- *(char *)((char *)iVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x0) = (char)V;
- *(byte *)((char *)iVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x0) = (byte)V;
- *(char *)((char *)iVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x0) = (byte)V;
- *(byte *)((char *)iVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(ushort *)((byte *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- ((ushort *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(ushort *)((ushort *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(ushort *)(iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(undefined2 *)((byte *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- ((undefined2 *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(undefined2 *)(iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_signed
|
- *(short *)((byte *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_signed
|
- ((short *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags_signed
|
- *(short *)((short *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_signed
|
- *(short *)(iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(byte *)((byte *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- ((byte *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(byte *)((ushort *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- (byte)((ushort *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(byte *)iVar5
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(byte *)(iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(undefined1 *)((byte *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- ((undefined1 *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- (undefined1)((ushort *)iVar5)[0x0]
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(undefined1 *)iVar5
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(undefined1 *)(iVar5 + 0x0)
+ ((uw_object_hdr_t *)iVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &*(char *)((byte *)iVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &((char *)iVar5)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &*(char *)((ushort *)iVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &*(char *)iVar5
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &*(char *)(iVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &iVar5[0x0]
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
|
- &*iVar5
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- ((char *)iVar5)[0x0] = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- *(char *)iVar5 = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- *(char *)(iVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- iVar5[0x0] = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
|
- *iVar5 = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x0)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(char *)((byte *)iVar5 + 0x0)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- ((char *)iVar5)[0x0]
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(char *)((ushort *)iVar5 + 0x0)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- (char)((ushort *)iVar5)[0x0]
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(char *)iVar5
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *(char *)(iVar5 + 0x0)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- iVar5[0x0]
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
|
- *iVar5
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
|
- *(byte *)((byte *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
|
- ((byte *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
|
- *(byte *)(iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
|
- *(undefined1 *)((byte *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
|
- ((undefined1 *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
|
- *(undefined1 *)(iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_high
|
- &*(char *)((byte *)iVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_high
|
- &((char *)iVar5)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_high
|
- &*(char *)(iVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_high
|
- &iVar5[0x1]
+ (char *)&((uw_object_hdr_t *)iVar5)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_high = (byte)E;
|
- ((char *)iVar5)[0x1] = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_high = (byte)E;
|
- *(char *)(iVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_high = (byte)E;
|
- iVar5[0x1] = E;
+ ((uw_object_hdr_t *)iVar5)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x1)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_high
|
- *(char *)((byte *)iVar5 + 0x1)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_high
|
- ((char *)iVar5)[0x1]
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_high
|
- *(char *)(iVar5 + 0x1)
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_high
|
- iVar5[0x1]
+ (char)((uw_object_hdr_t *)iVar5)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x2) = (char)V;
- *(char *)((char *)iVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x2) = (char)V;
- *(byte *)((char *)iVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x2) = (byte)V;
- *(char *)((char *)iVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x2) = (byte)V;
- *(byte *)((char *)iVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(ushort *)((byte *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- ((ushort *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(ushort *)((ushort *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(ushort *)(iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(undefined2 *)((byte *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- ((undefined2 *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(undefined2 *)((undefined2 *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(undefined2 *)(iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_signed
|
- *(short *)((byte *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_signed
|
- ((short *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->position_word_signed
|
- *(short *)((short *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->position_word_signed
|
- *(short *)(iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(byte *)((byte *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- ((byte *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(byte *)((ushort *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- (byte)((ushort *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(byte *)(iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(undefined1 *)((byte *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- ((undefined1 *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(undefined1 *)((ushort *)iVar5 + 0x1)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- (undefined1)((ushort *)iVar5)[0x1]
+ ((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(undefined1 *)(iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_low
|
- &*(char *)((byte *)iVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_low
|
- &((char *)iVar5)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_low
|
- &*(char *)((ushort *)iVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_low
|
- &*(char *)(iVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_low
|
- &iVar5[0x2]
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_low = (byte)E;
|
- ((char *)iVar5)[0x2] = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_low = (byte)E;
|
- *(char *)(iVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_low = (byte)E;
|
- iVar5[0x2] = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x2)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(char *)((byte *)iVar5 + 0x2)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
|
- ((char *)iVar5)[0x2]
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(char *)((ushort *)iVar5 + 0x1)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
|
- (char)((ushort *)iVar5)[0x1]
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
|
- *(char *)(iVar5 + 0x2)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
|
- iVar5[0x2]
+ (char)((uw_object_hdr_t *)iVar5)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->position_word_high
|
- *(byte *)((byte *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->position_word_high
|
- ((byte *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->position_word_high
|
- *(byte *)(iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->position_word_high
|
- *(undefined1 *)((byte *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->position_word_high
|
- ((undefined1 *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->position_word_high
|
- *(undefined1 *)(iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_high
|
- &*(char *)((byte *)iVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_high
|
- &((char *)iVar5)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_high
|
- &*(char *)(iVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_high
|
- &iVar5[0x3]
+ (char *)&((uw_object_hdr_t *)iVar5)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_high = (byte)E;
|
- ((char *)iVar5)[0x3] = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_high = (byte)E;
|
- *(char *)(iVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_high = (byte)E;
|
- iVar5[0x3] = E;
+ ((uw_object_hdr_t *)iVar5)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x3)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_high
|
- *(char *)((byte *)iVar5 + 0x3)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_high
|
- ((char *)iVar5)[0x3]
+ (char)((uw_object_hdr_t *)iVar5)->position_word_high
|
- *(char *)(iVar5 + 0x3)
+ (char)((uw_object_hdr_t *)iVar5)->position_word_high
|
- iVar5[0x3]
+ (char)((uw_object_hdr_t *)iVar5)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x4) = (char)V;
- *(char *)((char *)iVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x4) = (char)V;
- *(byte *)((char *)iVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x4) = (byte)V;
- *(char *)((char *)iVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x4) = (byte)V;
- *(byte *)((char *)iVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(ushort *)((byte *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- ((ushort *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(ushort *)((ushort *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(ushort *)(iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(undefined2 *)((byte *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- ((undefined2 *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(undefined2 *)(iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_signed
|
- *(short *)((byte *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_signed
|
- ((short *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->chain_word_signed
|
- *(short *)((short *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->chain_word_signed
|
- *(short *)(iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(byte *)((byte *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- ((byte *)iVar5)[0x4]
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(byte *)((ushort *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- (byte)((ushort *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(byte *)(iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(undefined1 *)((byte *)iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- ((undefined1 *)iVar5)[0x4]
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar5 + 0x2)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- (undefined1)((ushort *)iVar5)[0x2]
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(undefined1 *)(iVar5 + 0x4)
+ ((uw_object_hdr_t *)iVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_low
|
- &*(char *)((byte *)iVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_low
|
- &((char *)iVar5)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_low
|
- &*(char *)((ushort *)iVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_low
|
- &*(char *)(iVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_low
|
- &iVar5[0x4]
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_low = (byte)E;
|
- ((char *)iVar5)[0x4] = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_low = (byte)E;
|
- *(char *)(iVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_low = (byte)E;
|
- iVar5[0x4] = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x4)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(char *)((byte *)iVar5 + 0x4)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
|
- ((char *)iVar5)[0x4]
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(char *)((ushort *)iVar5 + 0x2)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
|
- (char)((ushort *)iVar5)[0x2]
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
|
- *(char *)(iVar5 + 0x4)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
|
- iVar5[0x4]
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x5)
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
|
- *(byte *)((byte *)iVar5 + 0x5)
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
|
- ((byte *)iVar5)[0x5]
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
|
- *(byte *)(iVar5 + 0x5)
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x5)
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
|
- *(undefined1 *)((byte *)iVar5 + 0x5)
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
|
- ((undefined1 *)iVar5)[0x5]
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
|
- *(undefined1 *)(iVar5 + 0x5)
+ ((uw_object_hdr_t *)iVar5)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_high
|
- &*(char *)((byte *)iVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_high
|
- &((char *)iVar5)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_high
|
- &*(char *)(iVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_high
|
- &iVar5[0x5]
+ (char *)&((uw_object_hdr_t *)iVar5)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_high = (byte)E;
|
- ((char *)iVar5)[0x5] = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_high = (byte)E;
|
- *(char *)(iVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_high = (byte)E;
|
- iVar5[0x5] = E;
+ ((uw_object_hdr_t *)iVar5)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x5)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_high
|
- *(char *)((byte *)iVar5 + 0x5)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_high
|
- ((char *)iVar5)[0x5]
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_high
|
- *(char *)(iVar5 + 0x5)
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_high
|
- iVar5[0x5]
+ (char)((uw_object_hdr_t *)iVar5)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x6) = (char)V;
- *(char *)((char *)iVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar5 + 0x6) = (char)V;
- *(byte *)((char *)iVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x6) = (byte)V;
- *(char *)((char *)iVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar5 + 0x6) = (byte)V;
- *(byte *)((char *)iVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar5)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(ushort *)((byte *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- ((ushort *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(ushort *)((ushort *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(ushort *)(iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(undefined2 *)((byte *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- ((undefined2 *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(undefined2 *)((undefined2 *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(undefined2 *)(iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_signed
|
- *(short *)((byte *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_signed
|
- ((short *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->link_word_signed
|
- *(short *)((short *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->link_word_signed
|
- *(short *)(iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(byte *)((byte *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- ((byte *)iVar5)[0x6]
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(byte *)((ushort *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- (byte)((ushort *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(byte *)(iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(undefined1 *)((byte *)iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- ((undefined1 *)iVar5)[0x6]
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(undefined1 *)((ushort *)iVar5 + 0x3)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- (undefined1)((ushort *)iVar5)[0x3]
+ ((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(undefined1 *)(iVar5 + 0x6)
+ ((uw_object_hdr_t *)iVar5)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_low
|
- &*(char *)((byte *)iVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_low
|
- &((char *)iVar5)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_low
|
- &*(char *)((ushort *)iVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_low
|
- &*(char *)(iVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_low
|
- &iVar5[0x6]
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_low = (byte)E;
|
- ((char *)iVar5)[0x6] = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_low = (byte)E;
|
- *(char *)(iVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_low = (byte)E;
|
- iVar5[0x6] = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x6)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(char *)((byte *)iVar5 + 0x6)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
|
- ((char *)iVar5)[0x6]
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(char *)((ushort *)iVar5 + 0x3)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
|
- (char)((ushort *)iVar5)[0x3]
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
|
- *(char *)(iVar5 + 0x6)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
|
- iVar5[0x6]
+ (char)((uw_object_hdr_t *)iVar5)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar5 + 0x7)
+ ((uw_object_hdr_t *)iVar5)->link_word_high
|
- *(byte *)((byte *)iVar5 + 0x7)
+ ((uw_object_hdr_t *)iVar5)->link_word_high
|
- ((byte *)iVar5)[0x7]
+ ((uw_object_hdr_t *)iVar5)->link_word_high
|
- *(byte *)(iVar5 + 0x7)
+ ((uw_object_hdr_t *)iVar5)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar5 + 0x7)
+ ((uw_object_hdr_t *)iVar5)->link_word_high
|
- *(undefined1 *)((byte *)iVar5 + 0x7)
+ ((uw_object_hdr_t *)iVar5)->link_word_high
|
- ((undefined1 *)iVar5)[0x7]
+ ((uw_object_hdr_t *)iVar5)->link_word_high
|
- *(undefined1 *)(iVar5 + 0x7)
+ ((uw_object_hdr_t *)iVar5)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_high
|
- &*(char *)((byte *)iVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_high
|
- &((char *)iVar5)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_high
|
- &*(char *)(iVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_high
|
- &iVar5[0x7]
+ (char *)&((uw_object_hdr_t *)iVar5)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_high = (byte)E;
|
- ((char *)iVar5)[0x7] = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_high = (byte)E;
|
- *(char *)(iVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_high = (byte)E;
|
- iVar5[0x7] = E;
+ ((uw_object_hdr_t *)iVar5)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar5 + 0x7)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_high
|
- *(char *)((byte *)iVar5 + 0x7)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_high
|
- ((char *)iVar5)[0x7]
+ (char)((uw_object_hdr_t *)iVar5)->link_word_high
|
- *(char *)(iVar5 + 0x7)
+ (char)((uw_object_hdr_t *)iVar5)->link_word_high
|
- iVar5[0x7]
+ (char)((uw_object_hdr_t *)iVar5)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x0) = (char)V;
- *(char *)((char *)source_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x0) = (char)V;
- *(byte *)((char *)source_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x0) = (byte)V;
- *(char *)((char *)source_object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x0) = (byte)V;
- *(byte *)((char *)source_object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(ushort *)((byte *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- ((ushort *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(ushort *)((ushort *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(ushort *)(source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- source_object[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *source_object
+ ((uw_object_hdr_t *)source_object)->type_flags
)
...>
}


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(undefined2 *)((byte *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- ((undefined2 *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(undefined2 *)((undefined2 *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(undefined2 *)(source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- source_object[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *source_object
+ ((uw_object_hdr_t *)source_object)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_signed
|
- *(short *)((byte *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_signed
|
- ((short *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_signed
|
- *(short *)((short *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_signed
|
- *(short *)(source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(byte *)((byte *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- ((byte *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(byte *)((ushort *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- (byte)((ushort *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(byte *)source_object
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(byte *)(source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- (byte)source_object[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(undefined1 *)((byte *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- ((undefined1 *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(undefined1 *)((ushort *)source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- (undefined1)((ushort *)source_object)[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(undefined1 *)source_object
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(undefined1 *)(source_object + 0x0)
+ ((uw_object_hdr_t *)source_object)->type_flags_low
|
- (undefined1)source_object[0x0]
+ ((uw_object_hdr_t *)source_object)->type_flags_low
)
...>
}


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x0)
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_low
|
- &*(char *)((byte *)source_object + 0x0)
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_low
|
- &((char *)source_object)[0x0]
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_low
|
- &*(char *)((ushort *)source_object + 0x0)
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_low
|
- &*(char *)source_object
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_low
|
- &*(char *)(source_object + 0x0)
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x0) = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)source_object + 0x0) = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_low = (byte)E;
|
- ((char *)source_object)[0x0] = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)source_object + 0x0) = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_low = (byte)E;
|
- *(char *)source_object = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_low = (byte)E;
|
- *(char *)(source_object + 0x0) = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x0)
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(char *)((byte *)source_object + 0x0)
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- ((char *)source_object)[0x0]
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(char *)((ushort *)source_object + 0x0)
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- (char)((ushort *)source_object)[0x0]
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(char *)source_object
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- *(char *)(source_object + 0x0)
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
|
- (char)source_object[0x0]
+ (char)((uw_object_hdr_t *)source_object)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->type_flags_high
|
- *(byte *)((byte *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->type_flags_high
|
- ((byte *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->type_flags_high
|
- *(undefined1 *)((byte *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->type_flags_high
|
- ((undefined1 *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->type_flags_high
)
...>
}


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x1)
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_high
|
- &*(char *)((byte *)source_object + 0x1)
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_high
|
- &((char *)source_object)[0x1]
+ (char *)&((uw_object_hdr_t *)source_object)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x1) = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)source_object + 0x1) = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_high = (byte)E;
|
- ((char *)source_object)[0x1] = E;
+ ((uw_object_hdr_t *)source_object)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x1)
+ (char)((uw_object_hdr_t *)source_object)->type_flags_high
|
- *(char *)((byte *)source_object + 0x1)
+ (char)((uw_object_hdr_t *)source_object)->type_flags_high
|
- ((char *)source_object)[0x1]
+ (char)((uw_object_hdr_t *)source_object)->type_flags_high
)
...>
}


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x2) = (char)V;
- *(char *)((char *)source_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x2) = (char)V;
- *(byte *)((char *)source_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x2) = (byte)V;
- *(char *)((char *)source_object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x2) = (byte)V;
- *(byte *)((char *)source_object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- *(ushort *)((byte *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- ((ushort *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word
|
- *(ushort *)((ushort *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- *(ushort *)(source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- source_object[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word
)
...>
}


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- *(undefined2 *)((byte *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- ((undefined2 *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word
|
- *(undefined2 *)((undefined2 *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- *(undefined2 *)(source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- source_object[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word
)
...>
}


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word_signed
|
- *(short *)((byte *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word_signed
|
- ((short *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word_signed
|
- *(short *)((short *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word_signed
|
- *(short *)(source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word_signed
)
...>
}


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- *(byte *)((byte *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- ((byte *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- *(byte *)((ushort *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- (byte)((ushort *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- *(byte *)(source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- (byte)source_object[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- *(undefined1 *)((byte *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- ((undefined1 *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- *(undefined1 *)((ushort *)source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- (undefined1)((ushort *)source_object)[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- *(undefined1 *)(source_object + 0x1)
+ ((uw_object_hdr_t *)source_object)->position_word_low
|
- (undefined1)source_object[0x1]
+ ((uw_object_hdr_t *)source_object)->position_word_low
)
...>
}


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x2)
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_low
|
- &*(char *)((byte *)source_object + 0x2)
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_low
|
- &((char *)source_object)[0x2]
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_low
|
- &*(char *)((ushort *)source_object + 0x1)
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_low
|
- &*(char *)(source_object + 0x1)
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_low
)
...>
}


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x2) = E;
+ ((uw_object_hdr_t *)source_object)->position_word_low = (byte)E;
|
- *(char *)((byte *)source_object + 0x2) = E;
+ ((uw_object_hdr_t *)source_object)->position_word_low = (byte)E;
|
- ((char *)source_object)[0x2] = E;
+ ((uw_object_hdr_t *)source_object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)source_object + 0x1) = E;
+ ((uw_object_hdr_t *)source_object)->position_word_low = (byte)E;
|
- *(char *)(source_object + 0x1) = E;
+ ((uw_object_hdr_t *)source_object)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x2)
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
|
- *(char *)((byte *)source_object + 0x2)
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
|
- ((char *)source_object)[0x2]
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
|
- *(char *)((ushort *)source_object + 0x1)
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
|
- (char)((ushort *)source_object)[0x1]
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
|
- *(char *)(source_object + 0x1)
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
|
- (char)source_object[0x1]
+ (char)((uw_object_hdr_t *)source_object)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->position_word_high
|
- *(byte *)((byte *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->position_word_high
|
- ((byte *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->position_word_high
)
...>
}


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->position_word_high
|
- *(undefined1 *)((byte *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->position_word_high
|
- ((undefined1 *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->position_word_high
)
...>
}


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x3)
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_high
|
- &*(char *)((byte *)source_object + 0x3)
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_high
|
- &((char *)source_object)[0x3]
+ (char *)&((uw_object_hdr_t *)source_object)->position_word_high
)
...>
}


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x3) = E;
+ ((uw_object_hdr_t *)source_object)->position_word_high = (byte)E;
|
- *(char *)((byte *)source_object + 0x3) = E;
+ ((uw_object_hdr_t *)source_object)->position_word_high = (byte)E;
|
- ((char *)source_object)[0x3] = E;
+ ((uw_object_hdr_t *)source_object)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x3)
+ (char)((uw_object_hdr_t *)source_object)->position_word_high
|
- *(char *)((byte *)source_object + 0x3)
+ (char)((uw_object_hdr_t *)source_object)->position_word_high
|
- ((char *)source_object)[0x3]
+ (char)((uw_object_hdr_t *)source_object)->position_word_high
)
...>
}


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x4) = (char)V;
- *(char *)((char *)source_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x4) = (char)V;
- *(byte *)((char *)source_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x4) = (byte)V;
- *(char *)((char *)source_object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x4) = (byte)V;
- *(byte *)((char *)source_object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- *(ushort *)((byte *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- ((ushort *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- *(ushort *)((ushort *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- *(ushort *)(source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- source_object[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word
)
...>
}


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- *(undefined2 *)((byte *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- ((undefined2 *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- *(undefined2 *)((undefined2 *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- *(undefined2 *)(source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- source_object[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word
)
...>
}


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word_signed
|
- *(short *)((byte *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word_signed
|
- ((short *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word_signed
|
- *(short *)((short *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word_signed
|
- *(short *)(source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word_signed
)
...>
}


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(byte *)((byte *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- ((byte *)source_object)[0x4]
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(byte *)((ushort *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- (byte)((ushort *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(byte *)(source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- (byte)source_object[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(undefined1 *)((byte *)source_object + 0x4)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- ((undefined1 *)source_object)[0x4]
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(undefined1 *)((ushort *)source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- (undefined1)((ushort *)source_object)[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(undefined1 *)(source_object + 0x2)
+ ((uw_object_hdr_t *)source_object)->chain_word_low
|
- (undefined1)source_object[0x2]
+ ((uw_object_hdr_t *)source_object)->chain_word_low
)
...>
}


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x4)
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_low
|
- &*(char *)((byte *)source_object + 0x4)
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_low
|
- &((char *)source_object)[0x4]
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_low
|
- &*(char *)((ushort *)source_object + 0x2)
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_low
|
- &*(char *)(source_object + 0x2)
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_low
)
...>
}


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x4) = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)source_object + 0x4) = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_low = (byte)E;
|
- ((char *)source_object)[0x4] = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)source_object + 0x2) = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_low = (byte)E;
|
- *(char *)(source_object + 0x2) = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x4)
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(char *)((byte *)source_object + 0x4)
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
|
- ((char *)source_object)[0x4]
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(char *)((ushort *)source_object + 0x2)
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
|
- (char)((ushort *)source_object)[0x2]
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
|
- *(char *)(source_object + 0x2)
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
|
- (char)source_object[0x2]
+ (char)((uw_object_hdr_t *)source_object)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x5)
+ ((uw_object_hdr_t *)source_object)->chain_word_high
|
- *(byte *)((byte *)source_object + 0x5)
+ ((uw_object_hdr_t *)source_object)->chain_word_high
|
- ((byte *)source_object)[0x5]
+ ((uw_object_hdr_t *)source_object)->chain_word_high
)
...>
}


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x5)
+ ((uw_object_hdr_t *)source_object)->chain_word_high
|
- *(undefined1 *)((byte *)source_object + 0x5)
+ ((uw_object_hdr_t *)source_object)->chain_word_high
|
- ((undefined1 *)source_object)[0x5]
+ ((uw_object_hdr_t *)source_object)->chain_word_high
)
...>
}


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x5)
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_high
|
- &*(char *)((byte *)source_object + 0x5)
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_high
|
- &((char *)source_object)[0x5]
+ (char *)&((uw_object_hdr_t *)source_object)->chain_word_high
)
...>
}


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x5) = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)source_object + 0x5) = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_high = (byte)E;
|
- ((char *)source_object)[0x5] = E;
+ ((uw_object_hdr_t *)source_object)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x5)
+ (char)((uw_object_hdr_t *)source_object)->chain_word_high
|
- *(char *)((byte *)source_object + 0x5)
+ (char)((uw_object_hdr_t *)source_object)->chain_word_high
|
- ((char *)source_object)[0x5]
+ (char)((uw_object_hdr_t *)source_object)->chain_word_high
)
...>
}


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x6) = (char)V;
- *(char *)((char *)source_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)source_object + 0x6) = (char)V;
- *(byte *)((char *)source_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x6) = (byte)V;
- *(char *)((char *)source_object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)source_object + 0x6) = (byte)V;
- *(byte *)((char *)source_object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)source_object)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- *(ushort *)((byte *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- ((ushort *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word
|
- *(ushort *)((ushort *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- *(ushort *)(source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- source_object[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word
)
...>
}


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- *(undefined2 *)((byte *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- ((undefined2 *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word
|
- *(undefined2 *)((undefined2 *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- *(undefined2 *)(source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- source_object[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word
)
...>
}


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word_signed
|
- *(short *)((byte *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word_signed
|
- ((short *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word_signed
|
- *(short *)((short *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word_signed
|
- *(short *)(source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word_signed
)
...>
}


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- *(byte *)((byte *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- ((byte *)source_object)[0x6]
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- *(byte *)((ushort *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- (byte)((ushort *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- *(byte *)(source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- (byte)source_object[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- *(undefined1 *)((byte *)source_object + 0x6)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- ((undefined1 *)source_object)[0x6]
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- *(undefined1 *)((ushort *)source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- (undefined1)((ushort *)source_object)[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- *(undefined1 *)(source_object + 0x3)
+ ((uw_object_hdr_t *)source_object)->link_word_low
|
- (undefined1)source_object[0x3]
+ ((uw_object_hdr_t *)source_object)->link_word_low
)
...>
}


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x6)
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_low
|
- &*(char *)((byte *)source_object + 0x6)
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_low
|
- &((char *)source_object)[0x6]
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_low
|
- &*(char *)((ushort *)source_object + 0x3)
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_low
|
- &*(char *)(source_object + 0x3)
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_low
)
...>
}


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x6) = E;
+ ((uw_object_hdr_t *)source_object)->link_word_low = (byte)E;
|
- *(char *)((byte *)source_object + 0x6) = E;
+ ((uw_object_hdr_t *)source_object)->link_word_low = (byte)E;
|
- ((char *)source_object)[0x6] = E;
+ ((uw_object_hdr_t *)source_object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)source_object + 0x3) = E;
+ ((uw_object_hdr_t *)source_object)->link_word_low = (byte)E;
|
- *(char *)(source_object + 0x3) = E;
+ ((uw_object_hdr_t *)source_object)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x6)
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
|
- *(char *)((byte *)source_object + 0x6)
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
|
- ((char *)source_object)[0x6]
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
|
- *(char *)((ushort *)source_object + 0x3)
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
|
- (char)((ushort *)source_object)[0x3]
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
|
- *(char *)(source_object + 0x3)
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
|
- (char)source_object[0x3]
+ (char)((uw_object_hdr_t *)source_object)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)source_object + 0x7)
+ ((uw_object_hdr_t *)source_object)->link_word_high
|
- *(byte *)((byte *)source_object + 0x7)
+ ((uw_object_hdr_t *)source_object)->link_word_high
|
- ((byte *)source_object)[0x7]
+ ((uw_object_hdr_t *)source_object)->link_word_high
)
...>
}


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)source_object + 0x7)
+ ((uw_object_hdr_t *)source_object)->link_word_high
|
- *(undefined1 *)((byte *)source_object + 0x7)
+ ((uw_object_hdr_t *)source_object)->link_word_high
|
- ((undefined1 *)source_object)[0x7]
+ ((uw_object_hdr_t *)source_object)->link_word_high
)
...>
}


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)source_object + 0x7)
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_high
|
- &*(char *)((byte *)source_object + 0x7)
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_high
|
- &((char *)source_object)[0x7]
+ (char *)&((uw_object_hdr_t *)source_object)->link_word_high
)
...>
}


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x7) = E;
+ ((uw_object_hdr_t *)source_object)->link_word_high = (byte)E;
|
- *(char *)((byte *)source_object + 0x7) = E;
+ ((uw_object_hdr_t *)source_object)->link_word_high = (byte)E;
|
- ((char *)source_object)[0x7] = E;
+ ((uw_object_hdr_t *)source_object)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)source_object + 0x7)
+ (char)((uw_object_hdr_t *)source_object)->link_word_high
|
- *(char *)((byte *)source_object + 0x7)
+ (char)((uw_object_hdr_t *)source_object)->link_word_high
|
- ((char *)source_object)[0x7]
+ (char)((uw_object_hdr_t *)source_object)->link_word_high
)
...>
}


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_5_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((undefined2 *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (byte)puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (undefined1)puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_address_0@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)((byte *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &((char *)puVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)((ushort *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)puVar2
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)(puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (char)puVar2[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_0_0_address_1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
|
- &*(char *)((byte *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
|
- &((char *)puVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_2_17_word_ushort@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_5_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((undefined2 *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_5_w_2_17_word_short@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
)
...>
}


@receiver_5_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (byte)puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (undefined1)puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_address_2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)((byte *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &((char *)puVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)((ushort *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)(puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_store_2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- (char)puVar2[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_2_17_address_3@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
|
- &*(char *)((byte *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
|
- &((char *)puVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_5_w_2_17_store_3@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_5_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_4_34_word_ushort@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_5_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((undefined2 *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_5_w_4_34_word_short@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
)
...>
}


@receiver_5_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (byte)puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (undefined1)puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_address_4@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)((byte *)puVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &((char *)puVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)((ushort *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)(puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_store_4@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (char)puVar2[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_4_34_address_5@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
|
- &*(char *)((byte *)puVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
|
- &((char *)puVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_5_w_4_34_store_5@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_5_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@receiver_5_w_6_51_word_ushort@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(ushort *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_5_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((undefined2 *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_5_w_6_51_word_short@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
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
|
- *(short *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
)
...>
}


@receiver_5_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(byte *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (byte)puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(undefined1 *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (undefined1)puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_address_6@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)((byte *)puVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &((char *)puVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)((ushort *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)(puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_store_6@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
|
- *(char *)(puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- (char)puVar2[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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


@receiver_5_w_6_51_address_7@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
|
- &*(char *)((byte *)puVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
|
- &((char *)puVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_5_w_6_51_store_7@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
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


@receiver_5_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
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
